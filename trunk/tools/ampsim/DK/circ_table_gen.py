# -*- coding: utf-8 -*-
from __future__ import division

import math
import copy
import pylab as pl
import sys
import numpy as np
from models import *
import dk_simulator, dk_lib

class gen(object):
    FS = 96000
    max_error = 1e-7
    result_count = 10
    timespan = 0.01
    solver = None  ## use default

    def get_samples(self, data):
        return data[np.array(np.linspace(0, len(data)-1, self.result_count).round(), dtype=int)]

    def op_signal(self, op=None, samples=None, timespan=None):
        if timespan is None:
            timespan = self.timespan
        if op is None:
            op = self.V["OP"]
        if samples is None:
            samples = timespan*self.FS
        return np.array((op,),dtype=np.float64).repeat(samples, axis=0)

    def constant_signal(self, *values):
        a = np.zeros((int(self.timespan*self.FS), len(values)))
        for i, v in enumerate(values):
            a[:,i] = v
        return a

    def timeline(self):
        return np.linspace(0, self.timespan, self.timespan*self.FS)

    def finish_plot(self, name, args, loc=None, timeline=None):
        pl.suptitle(name)
        pl.grid()
        pl.legend(args, loc=loc)
        pl.show()

# transformation matrix 
mag_dict = {
    "M": "e6",
    "k": "e3",
    "m": "e-3",
    "u": "e-6",
    "n": "e-9",
    "p": "e-12",
    "f": "e-15",
    "" : "",
    }

class Circ_table(gen):
    # set max_sig and max_op to fetch the sweep point (saturated)
    max_sig = 1.4 # max test signal
    max_op = 250  # operation range 
    set_operator = 1.0
    operator = 1.0 / max_sig # set table istep
    divider = None; # divider used to set table range into userspace

    S = ''
    V = ''
    model = ''
    def set_model(self,model, S, V, M=None, O=None, D=None):
        self.model = model
        # D_ = D2
        self.S = S
        self.V = V
        if (O):
            self.set_operator = O
        if (M) :
            self.max_sig = M
            self.operator = 1.0/math.fabs(self.max_sig) * self.set_operator
        if (D) :
            self.divider = D

    table_define = """
struct table1d { // 1-dimensional function table
    float low;
    float high;
    float istep;
    int size;
    float data[];
};

template <int tab_size>
struct table1d_imp {
    float low;
    float high;
    float istep;
    int size;
    float data[tab_size];
    operator table1d&() const { return *(table1d*)this; }
};
"""

    table_use = """
double always_inline circclip(double x) {
    double f = fabs(x);
    f = f * circ_table.istep;
    int i = static_cast<int>(f);
    if (i < 0) {
        f = circ_table.data[0];
    } else if (i >= circ_table.size-1) {
        f = circ_table.data[circ_table.size-1];
    } else {
    f -= i;
    f = circ_table.data[i]*(1-f) + circ_table.data[i+1]*f;
    }
    return copysign(f, x);
}
"""

    def signal(self):
        self.sig = np.linspace(0, self.max_sig, 200)
        a = self.op_signal([0],samples=len(self.sig))
        a[:,0] += self.sig
        return a

    def neg_signal(self):
        self.model += "_neg"
        self.sig = np.linspace(0, -1.0*self.max_sig, 200)
        a = self.op_signal([0],samples=len(self.sig))
        a[:,0] += self.sig
        return a

    def generate_table(self, p, y, filename=None):
        n = 'dkbuild/%s_table.h' % self.model
        if filename:
            n = filename
        #y = p(self.signal())
        c = 0;
        s = ""
        z = 0
        aj = 0
        if not self.divider :
            max_s = copy.deepcopy(math.fabs(y[len(self.sig)-1]))
            min_s = copy.deepcopy(math.fabs(y[0]))
            if max_s > 1 or min_s > 1:
                if(np.signbit(self.max_sig)) :
                    self.divider = (max_s+min_s) *1.2 # work around dc offset
                #elif(np.signbit(y[0])) :
                #    self.divider = (max_s+min_s) *1.2
                else :
                    self.divider = (max_s) *1.2
            else :
                self.divider = 1.0
        t1 = ("\n // --sig_max  %f") % self.max_sig
        t2 = ("\n // --table_div  %f") % self.divider
        t3 = ("\n // --table_op  %f\n") % self.set_operator
        table_define_tmp = self.table_define.replace('table1d', 'table%s' % self.model)
        table_use_tmp = self.table_use.replace('circ', '%s' % self.model)
        sys.stdout = open(n, 'w')
        sys.stdout.write("\n")
        sys.stdout.write("// %s_table generated by DK/circ_table_gen.py -- do not modify manually\n"  % self.model)
        sys.stdout.write("\n // variables used")
        sys.stdout.write(t1)
        sys.stdout.write(t2)
        sys.stdout.write(t3)
        sys.stdout.write(table_define_tmp)
        sys.stdout.write("\n ")
        sys.stdout.write("static table%s_imp<%d> %s_table __rt_data = {\n" % (self.model, len(self.sig), self.model))
        for i in range(len(y)):
            c += 1
            if c == 2:
                aj = y[0] # dc offset to be removed
                sys.stdout.write('\t%g,%g,%g,%d, {' % ((y[0] -aj), (y[len(self.sig)-1] -aj )/self.divider, (len(self.sig)-1)*self.operator, len(self.sig)))
                for item in y:
                    if z % 5 == 0:
                        sys.stdout.write(s+"\n\t" )
                        s = ""
                        z = 0
                    sys.stdout.write(s+"%s" % ("{:.12f}".format(float((item-aj)/self.divider))))
                    s = ","
                    z +=1
                sys.stdout.write("\n\t}\n};")
        sys.stdout.write("\n")
        sys.stdout.write(table_use_tmp)
        sys.stdout.write("\n")
        sys.stdout = sys.__stdout__
        return self.divider

    def plot(self, p, y):
        if not self.divider:
            max_s = copy.deepcopy(math.fabs(y[len(self.sig)-1]))
            if max_s > 1:
                self.divider = max_s *1.2
            else :
                self.divider = 1.0
        #print(pl.matplotlib.get_backend())
        aj = copy.deepcopy(y[0])
        for index, item in enumerate(y):
            y[index] = (y[index]-aj)/self.divider
        pl.plot(self.sig, y)
        pl.xlabel('Input')
        pl.ylabel('Output')
        if (self.max_sig <0.0) :
            ax = pl.gca()
            ax.invert_xaxis()
            ax.invert_yaxis()
        t = ('istep = %s') % ("{:.2f}".format(float((len(self.sig)-1)*self.operator)))
        pl.title (t) 
        self.finish_plot(self.model, p.out_labels, timeline=self.sig)

    def __init__(self, name, S, V, M=None, O=None, D=None):
        self.set_model(name, S, V, M, O, D)

def main(argv):
    if len(sys.argv) < 4:
        print (' to less args given')
        exit()
    arg = str(sys.argv[1])
    S = str(sys.argv[2])
    V = str(sys.argv[3])
    if len(sys.argv) > 3:
        M = sys.argv[4]
    else :
        M = None
    if len(sys.argv) > 4:
        O = sys.argv[5]
    else :
        O = None
    if len(sys.argv) > 5:
        D = sys.argv[6]
    else :
        D = None
        
    t = "Circ_table"
    v = Circ_table(arg, S, V, M, O, D)
    parser = dk_simulator.Parser(v.S, v.V, v.FS)
    p = dk_simulator.get_executor(
        t, parser, v.solver, '-p', c_tempdir='/tmp', c_verbose='--c-verbose',
        c_debug_load='', linearize='', c_real=("double"))
    y = p(v.signal())
    v.generate_table(p,y)
    v.plot(p,y)

if __name__ == "__main__":
    main(sys.argv[1:])
