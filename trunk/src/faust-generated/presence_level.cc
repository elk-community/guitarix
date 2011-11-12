// generated from file '../src/faust/presence_level.dsp' by dsp2cc:
// Code generated with Faust 0.9.43 (http://faust.grame.fr)


namespace presence_level {


Dsp::Dsp() {
}

Dsp::~Dsp() {
}

inline void Dsp::init(unsigned int samplingFreq)
{
	fSamplingFreq = samplingFreq;
}

inline void Dsp::compute(int count, float *input0, float *output0)
{
#define fslider0 (*fslider0_)
	double 	fSlow0 = fslider0;
	for (int i=0; i<count; i++) {
		output0[i] = (FAUSTFLOAT)(fSlow0 * (double)input0[i]);
	}
#undef fslider0
}

int Dsp::register_par(const ParamReg& reg)
{
	fslider0_ = reg.registerVar("con.Level","","SA","",&fslider0, 1.0, 0.5, 5.0, 0.5);
	return 0;
}

} // end namespace presence_level
