// generated from file '../src/LV2/faust/gxmetal_amp.dsp' by dsp2cc:
// Code generated with Faust 0.9.58 (http://faust.grame.fr)

#include "valve.h"

namespace gxmetal_amp {

class Dsp: public PluginLV2 {
private:
	uint32_t fSamplingFreq;
	int 	iConst0;
	double 	fConst1;
	double 	fConst2;
	double 	fConst3;
	double 	fConst4;
	double 	fConst5;
	double 	fConst6;
	double 	fConst7;
	double 	fConst8;
	double 	fConst9;
	double 	fConst10;
	double 	fConst11;
	double 	fConst12;
	double 	fConst13;
	double 	fConst14;
	FAUSTFLOAT 	fslider0;
	FAUSTFLOAT	*fslider0_;
	double 	fConst15;
	double 	fConst16;
	double 	fConst17;
	FAUSTFLOAT 	fslider1;
	FAUSTFLOAT	*fslider1_;
	double 	fRec6[2];
	double 	fConst18;
	double 	fConst19;
	double 	fConst20;
	FAUSTFLOAT 	fslider2;
	FAUSTFLOAT	*fslider2_;
	double 	fRec13[2];
	FAUSTFLOAT 	fslider3;
	FAUSTFLOAT	*fslider3_;
	double 	fConst21;
	double 	fConst22;
	double 	fConst23;
	double 	fVec0[2];
	double 	fConst24;
	double 	fRec16[2];
	double 	fRec15[2];
	double 	fConst25;
	double 	fConst26;
	double 	fRec14[2];
	double 	fVec1[2];
	double 	fConst27;
	double 	fRec12[2];
	double 	fConst28;
	double 	fConst29;
	double 	fConst30;
	double 	fVec2[2];
	double 	fConst31;
	double 	fRec17[2];
	double 	fRec11[2];
	double 	fRec10[2];
	double 	fRec9[2];
	double 	fConst32;
	double 	fConst33;
	double 	fConst34;
	double 	fVec3[2];
	double 	fConst35;
	double 	fRec18[2];
	double 	fRec8[2];
	double 	fRec7[2];
	double 	fRec5[4];
	double 	fConst36;
	double 	fConst37;
	double 	fRec4[2];
	double 	fConst38;
	double 	fConst39;
	double 	fConst40;
	double 	fConst41;
	double 	fRec19[2];
	double 	fRec3[3];
	double 	fConst42;
	double 	fRec2[2];
	double 	fRec22[2];
	double 	fRec21[3];
	double 	fRec20[2];
	double 	fRec1[3];
	double 	fConst43;
	double 	fRec0[3];
	double 	fRec23[2];
	void connect(uint32_t port,void* data);
	void clear_state_f();
	void init(uint32_t samplingFreq);
	void compute(int count, FAUSTFLOAT *input0, FAUSTFLOAT *output0);

	static void clear_state_f_static(PluginLV2*);
	static void init_static(uint32_t samplingFreq, PluginLV2*);
	static void compute_static(int count, FAUSTFLOAT *input0, FAUSTFLOAT *output0, PluginLV2*);
	static void del_instance(PluginLV2 *p);
	static void connect_static(uint32_t port,void* data, PluginLV2 *p);
public:
	Dsp();
	~Dsp();
};



Dsp::Dsp()
	: PluginLV2() {
	version = PLUGINLV2_VERSION;
	id = "metal";
	name = N_("GxMetal_head");
	mono_audio = compute_static;
	stereo_audio = 0;
	set_samplerate = init_static;
	activate_plugin = 0;
	connect_ports = connect_static;
	clear_state = clear_state_f_static;
	delete_instance = del_instance;
}

Dsp::~Dsp() {
}

inline void Dsp::clear_state_f()
{
	for (int i=0; i<2; i++) fRec6[i] = 0;
	for (int i=0; i<2; i++) fRec13[i] = 0;
	for (int i=0; i<2; i++) fVec0[i] = 0;
	for (int i=0; i<2; i++) fRec16[i] = 0;
	for (int i=0; i<2; i++) fRec15[i] = 0;
	for (int i=0; i<2; i++) fRec14[i] = 0;
	for (int i=0; i<2; i++) fVec1[i] = 0;
	for (int i=0; i<2; i++) fRec12[i] = 0;
	for (int i=0; i<2; i++) fVec2[i] = 0;
	for (int i=0; i<2; i++) fRec17[i] = 0;
	for (int i=0; i<2; i++) fRec11[i] = 0;
	for (int i=0; i<2; i++) fRec10[i] = 0;
	for (int i=0; i<2; i++) fRec9[i] = 0;
	for (int i=0; i<2; i++) fVec3[i] = 0;
	for (int i=0; i<2; i++) fRec18[i] = 0;
	for (int i=0; i<2; i++) fRec8[i] = 0;
	for (int i=0; i<2; i++) fRec7[i] = 0;
	for (int i=0; i<4; i++) fRec5[i] = 0;
	for (int i=0; i<2; i++) fRec4[i] = 0;
	for (int i=0; i<2; i++) fRec19[i] = 0;
	for (int i=0; i<3; i++) fRec3[i] = 0;
	for (int i=0; i<2; i++) fRec2[i] = 0;
	for (int i=0; i<2; i++) fRec22[i] = 0;
	for (int i=0; i<3; i++) fRec21[i] = 0;
	for (int i=0; i<2; i++) fRec20[i] = 0;
	for (int i=0; i<3; i++) fRec1[i] = 0;
	for (int i=0; i<3; i++) fRec0[i] = 0;
	for (int i=0; i<2; i++) fRec23[i] = 0;
}

void Dsp::clear_state_f_static(PluginLV2 *p)
{
	static_cast<Dsp*>(p)->clear_state_f();
}

inline void Dsp::init(uint32_t samplingFreq)
{
	fSamplingFreq = samplingFreq;
	iConst0 = min(192000, max(1, fSamplingFreq));
	fConst1 = tan((37699.11184307752 / double(iConst0)));
	fConst2 = (2 * (1 - (1.0 / faustpower<2>(fConst1))));
	fConst3 = (1.0 / fConst1);
	fConst4 = (1 + ((fConst3 - 1.414213562373095) / fConst1));
	fConst5 = (1.0 / (1 + ((1.414213562373095 + fConst3) / fConst1)));
	fConst6 = tan((125.66370614359172 / double(iConst0)));
	fConst7 = (1.0 / faustpower<2>(fConst6));
	fConst8 = (2 * (1 - fConst7));
	fConst9 = (1.0 / fConst6);
	fConst10 = (1 + ((fConst9 - 1.414213562373095) / fConst6));
	fConst11 = (1.0 / (1 + ((1.414213562373095 + fConst9) / fConst6)));
	fConst12 = (1.0 / tan((97.38937226128358 / double(iConst0))));
	fConst13 = (1 + fConst12);
	fConst14 = (0 - ((1 - fConst12) / fConst13));
	fConst15 = (2 * double(iConst0));
	fConst16 = faustpower<2>(fConst15);
	fConst17 = (3 * fConst15);
	fConst18 = (1.0 / tan((20517.741620594938 / double(iConst0))));
	fConst19 = (1 + fConst18);
	fConst20 = (0 - ((1 - fConst18) / fConst19));
	fConst21 = (1.0 / tan((270.1769682087222 / double(iConst0))));
	fConst22 = (1 + fConst21);
	fConst23 = (0 - ((1 - fConst21) / fConst22));
	fConst24 = (1.0 / fConst22);
	fConst25 = (0 - fConst12);
	fConst26 = (0.025 / fConst13);
	fConst27 = (1.0 / fConst19);
	fConst28 = (1.0 / tan((414.6902302738527 / double(iConst0))));
	fConst29 = (1 + fConst28);
	fConst30 = (0 - ((1 - fConst28) / fConst29));
	fConst31 = (1.0 / fConst29);
	fConst32 = (1.0 / tan((609.4689747964198 / double(iConst0))));
	fConst33 = (1 + fConst32);
	fConst34 = (0 - ((1 - fConst32) / fConst33));
	fConst35 = (1.0 / fConst33);
	fConst36 = exp((0 - (2e+02 / double(iConst0))));
	fConst37 = exp((0 - (0.1 / double(iConst0))));
	fConst38 = (1.0 / tan((804.247719318987 / double(iConst0))));
	fConst39 = (1 + fConst38);
	fConst40 = (0 - ((1 - fConst38) / fConst39));
	fConst41 = (0.06571428571428571 / fConst39);
	fConst42 = (0.1 / fConst13);
	fConst43 = (2 * (0 - fConst7));
	clear_state_f();
}

void Dsp::init_static(uint32_t samplingFreq, PluginLV2 *p)
{
	static_cast<Dsp*>(p)->init(samplingFreq);
}

void always_inline Dsp::compute(int count, FAUSTFLOAT *input0, FAUSTFLOAT *output0)
{
#define fslider0 (*fslider0_)
#define fslider1 (*fslider1_)
#define fslider2 (*fslider2_)
#define fslider3 (*fslider3_)
	double 	fSlow0 = fslider0;
	double 	fSlow1 = exp((3.4 * (0 - fSlow0)));
	double 	fSlow2 = ((3.1361660000000006e-05 * fSlow1) + 6.993481000000001e-07);
	double 	fSlow3 = ((5.967937800000002e-09 * fSlow1) + 2.9839689000000005e-11);
	double 	fSlow4 = (fConst15 * fSlow3);
	double 	fSlow5 = (0.022470000000000004 * fSlow1);
	double 	fSlow6 = (fConst15 * (fSlow5 + 0.0026376999999999998));
	double 	fSlow7 = ((fSlow6 + (fConst16 * (fSlow4 - fSlow2))) - 1);
	double 	fSlow8 = (fConst17 * fSlow3);
	double 	fSlow9 = ((fConst16 * (fSlow2 + fSlow8)) - (3 + fSlow6));
	double 	fSlow10 = ((fSlow6 + (fConst16 * (fSlow2 - fSlow8))) - 3);
	double 	fSlow11 = (1.0 / (0 - (1 + (fSlow6 + (fConst16 * (fSlow2 + fSlow4))))));
	double 	fSlow12 = (0.0010000000000000009 * pow(10,(0.05 * fslider1)));
	double 	fSlow13 = (0.0010000000000000009 * pow(10,(0.05 * fslider2)));
	double 	fSlow14 = fslider3;
	double 	fSlow15 = (fSlow14 - 1);
	double 	fSlow16 = (3.1107890000000005e-12 + ((6.221578000000002e-10 * fSlow1) + (fSlow0 * ((5.345780000000001e-09 * fSlow1) + 2.6728900000000006e-11))));
	double 	fSlow17 = (fConst17 * fSlow16);
	double 	fSlow18 = (((4.859800000000001e-07 * fSlow0) + (8.613660000000003e-06 * fSlow1)) + 9.962810000000002e-08);
	double 	fSlow19 = ((fSlow5 + (0.00023500000000000002 * fSlow0)) + 0.0003347);
	double 	fSlow20 = (fConst15 * fSlow19);
	double 	fSlow21 = (fSlow20 + (fConst16 * (fSlow18 - fSlow17)));
	double 	fSlow22 = (fConst15 * fSlow16);
	double 	fSlow23 = (fSlow20 + (fConst16 * (fSlow22 - fSlow18)));
	double 	fSlow24 = (fConst15 * (0 - fSlow19));
	double 	fSlow25 = (fSlow24 + (fConst16 * (fSlow18 + fSlow17)));
	double 	fSlow26 = (fSlow24 - (fConst16 * (fSlow18 + fSlow22)));
	double 	fSlow27 = (0.0010000000000000009 * pow(10,(0.05 * (0 - (0.4 * fSlow14)))));
	for (int i=0; i<count; i++) {
		fRec6[0] = (fSlow12 + (0.999 * fRec6[1]));
		fRec13[0] = (fSlow13 + (0.999 * fRec13[1]));
		double fTemp0 = (double)input0[i];
		double fTemp1 = fabs(fTemp0);
		double fTemp2 = (1e-15 + (0.027 * fRec15[1]));
		fVec0[0] = fTemp2;
		fRec16[0] = ((fConst24 * (fVec0[0] + fVec0[1])) + (fConst23 * fRec16[1]));
		fRec15[0] = (Ftube(TUBE_TABLE_12AY7_68k, ((fRec16[0] + ((fTemp0 * (fSlow14 + fTemp1)) / (1 + ((fSlow15 * fTemp1) + faustpower<2>(fTemp0))))) - 2.775057999999999)) - 147.2200740740741);
		fRec14[0] = ((fConst26 * ((fConst25 * fRec15[1]) + (fConst12 * fRec15[0]))) + (fConst14 * fRec14[1]));
		double fTemp3 = (fRec14[0] * fRec13[0]);
		fVec1[0] = fTemp3;
		fRec12[0] = ((fConst27 * (fVec1[0] + fVec1[1])) + (fConst20 * fRec12[1]));
		double fTemp4 = (1e-15 + (0.015 * fRec11[1]));
		fVec2[0] = fTemp4;
		fRec17[0] = ((fConst31 * (fVec2[0] + fVec2[1])) + (fConst30 * fRec17[1]));
		fRec11[0] = (Ftube(TUBE_TABLE_12AY7_250k, ((fRec17[0] + fRec12[0]) - 1.9543079999999988)) - 119.71279999999999);
		fRec10[0] = ((fConst26 * ((fConst25 * fRec11[1]) + (fConst12 * fRec11[0]))) + (fConst14 * fRec10[1]));
		fRec9[0] = ((fConst27 * (fRec10[0] + fRec10[1])) + (fConst20 * fRec9[1]));
		double fTemp5 = (1e-15 + (0.0082 * fRec8[1]));
		fVec3[0] = fTemp5;
		fRec18[0] = ((fConst35 * (fVec3[0] + fVec3[1])) + (fConst34 * fRec18[1]));
		fRec8[0] = (Ftube(TUBE_TABLE_12AY7_250k, ((fRec18[0] + fRec9[0]) - 1.2649159999999988)) - 95.7419512195122);
		fRec7[0] = ((fConst26 * ((fConst25 * fRec8[1]) + (fConst12 * fRec8[0]))) + (fConst14 * fRec7[1]));
		fRec5[0] = ((fRec7[0] * fRec6[0]) - (fSlow11 * (((fSlow10 * fRec5[2]) + (fSlow9 * fRec5[1])) + (fSlow7 * fRec5[3]))));
		double fTemp6 = ((fSlow26 * fRec5[0]) + ((fSlow25 * fRec5[1]) + ((fSlow23 * fRec5[3]) + (fSlow21 * fRec5[2]))));
		double fTemp7 = max((double)1, fabs((fSlow11 * fTemp6)));
		double fTemp8 = ((fConst37 * (fRec4[1] >= fTemp7)) + (fConst36 * (fRec4[1] < fTemp7)));
		fRec4[0] = ((fTemp7 * (0 - (fTemp8 - 1))) + (fRec4[1] * fTemp8));
		double fTemp9 = max((double)0, ((20 * log10(fRec4[0])) + 5e+01));
		double fTemp10 = (0.5 * min((double)1, max((double)0, (0.09522902580706599 * fTemp9))));
		double fTemp11 = (fSlow11 * (fTemp6 * pow(10,(0.05 * (1e+01 + ((fTemp9 * (0 - fTemp10)) / (1 + fTemp10)))))));
		fRec19[0] = ((fConst41 * (fRec3[1] + fRec3[2])) + (fConst40 * fRec19[1]));
		fRec3[0] = (Ftube(TUBE_TABLE_EL34_250k, ((fRec19[0] + fTemp11) - 15.743945)) - 255.41822826086957);
		fRec2[0] = ((fConst42 * ((fConst25 * fRec3[1]) + (fConst12 * fRec3[0]))) + (fConst14 * fRec2[1]));
		fRec22[0] = ((fConst41 * (fRec21[1] + fRec21[2])) + (fConst40 * fRec22[1]));
		fRec21[0] = (Ftube(TUBE_TABLE_EL34_68k, ((fRec22[0] + fTemp11) - 15.743945)) - 255.41822826086957);
		fRec20[0] = ((fConst42 * ((fConst25 * fRec21[1]) + (fConst12 * fRec21[0]))) + (fConst14 * fRec20[1]));
		fRec1[0] = ((fRec20[0] + fRec2[0]) - (fConst11 * ((fConst10 * fRec1[2]) + (fConst8 * fRec1[1]))));
		fRec0[0] = ((fConst11 * (((fConst7 * fRec1[0]) + (fConst43 * fRec1[1])) + (fConst7 * fRec1[2]))) - (fConst5 * ((fConst4 * fRec0[2]) + (fConst2 * fRec0[1]))));
		fRec23[0] = (fSlow27 + (0.999 * fRec23[1]));
		output0[i] = (FAUSTFLOAT)(fConst5 * ((fRec6[0] * fRec23[0]) * (fRec0[2] + (fRec0[0] + (2 * fRec0[1])))));
		// post processing
		fRec23[1] = fRec23[0];
		fRec0[2] = fRec0[1]; fRec0[1] = fRec0[0];
		fRec1[2] = fRec1[1]; fRec1[1] = fRec1[0];
		fRec20[1] = fRec20[0];
		fRec21[2] = fRec21[1]; fRec21[1] = fRec21[0];
		fRec22[1] = fRec22[0];
		fRec2[1] = fRec2[0];
		fRec3[2] = fRec3[1]; fRec3[1] = fRec3[0];
		fRec19[1] = fRec19[0];
		fRec4[1] = fRec4[0];
		for (int i=3; i>0; i--) fRec5[i] = fRec5[i-1];
		fRec7[1] = fRec7[0];
		fRec8[1] = fRec8[0];
		fRec18[1] = fRec18[0];
		fVec3[1] = fVec3[0];
		fRec9[1] = fRec9[0];
		fRec10[1] = fRec10[0];
		fRec11[1] = fRec11[0];
		fRec17[1] = fRec17[0];
		fVec2[1] = fVec2[0];
		fRec12[1] = fRec12[0];
		fVec1[1] = fVec1[0];
		fRec14[1] = fRec14[0];
		fRec15[1] = fRec15[0];
		fRec16[1] = fRec16[0];
		fVec0[1] = fVec0[0];
		fRec13[1] = fRec13[0];
		fRec6[1] = fRec6[0];
	}
#undef fslider0
#undef fslider1
#undef fslider2
#undef fslider3
}

void __rt_func Dsp::compute_static(int count, FAUSTFLOAT *input0, FAUSTFLOAT *output0, PluginLV2 *p)
{
	static_cast<Dsp*>(p)->compute(count, input0, output0);
}


void Dsp::connect(uint32_t port,void* data)
{
	switch ((PortIndex)port)
	{
	case DRIVE: 
		fslider3_ = (float*)data; // , 1.0, 1.0, 2e+01, 0.1 
		break;
	case PREGAIN: 
		fslider2_ = (float*)data; // , -6.0, -2e+01, 2e+01, 0.1 
		break;
	case TONE: 
		fslider0_ = (float*)data; // , 0.5, 0.0, 1.0, 0.01 
		break;
	case GAIN1: 
		fslider1_ = (float*)data; // , -6.0, -2e+01, 2e+01, 0.1 
		break;
	default:
		break;
	}
}

void Dsp::connect_static(uint32_t port,void* data, PluginLV2 *p)
{
	static_cast<Dsp*>(p)->connect(port, data);
}


PluginLV2 *plugin() {
	return new Dsp();
}

void Dsp::del_instance(PluginLV2 *p)
{
	delete static_cast<Dsp*>(p);
}

/*
typedef enum
{
   DRIVE, 
   PREGAIN, 
   TONE, 
   GAIN1, 
} PortIndex;
*/

} // end namespace gxmetal_amp
