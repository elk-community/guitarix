// generated automatically
// DO NOT MODIFY!
declare id "jenwah";
declare name "Jen Wah";
declare category "Guitar Effects";
declare shortname "Jen Wah";
declare description "Jen Wah";

import("filter.lib");
import("effect.lib");
import("oscillator.lib");
import("guitarix.lib");

process(x) = x : _<:*(dry),(*(wet) : pre : iir((b0/a0,b1/a0,b2/a0,b3/a0,b4/a0,b5/a0,b6/a0),(a1/a0,a2/a0,a3/a0,a4/a0,a5/a0,a6/a0))):>_ with {
    LogPot(a, x) = if(a, (exp(a * x) - 1) / (exp(a) - 1), x);
    Inverted(b, x) = if(b, 1 - x, x);
    s = 0.993;
    fs = float(SR);
    pre = dcblockerat(228.105325695);

    wet = wah_ctrl.wet_dry;
    dry = 1 - wet;

    Wah1 = (x : amp_follower_ud(0.01,0.1) : min(0.99) : max(0.1)): smooth(s);
    
    Wah2 = wah_ctrl.wah : Inverted(1) :  smooth(s);
    
    sl = wah_ctrl.mode;

    Wah3 = (oscs(freq) + 1) / 2 : min(0.98) : max(0.01) : Inverted(1) with {
        freq = wah_ctrl.freq;
    }; 

    Wah = select3(sl, Wah2, Wah1, Wah3);

    b0 = Wah*(Wah*pow(fs,3)*(fs*(fs*(1.82217902614682e-30*fs + 2.88343830435939e-26) + 3.97330096911255e-23) + 3.25261386404769e-21) + pow(fs,2)*(fs*(fs*(fs*(-1.81642997288596e-30*fs - 2.88488738607105e-26) - 4.02405861356002e-23) - 3.98756637137511e-21) - 6.03499692778005e-20)) + pow(fs,2)*(fs*(fs*(fs*(-3.18327632166844e-30*fs - 1.0511872826981e-25) - 1.52009426668339e-22) - 1.24894038761244e-20) - 7.39230423647202e-22);

    b1 = Wah*(Wah*pow(fs,4)*(fs*(-1.09330741568809e-29*fs - 1.15337532174376e-25) - 7.94660193822509e-23) + pow(fs,2)*(pow(fs,2)*(fs*(1.08985798373158e-29*fs + 1.15395495442842e-25) + 8.04811722712005e-23) - 1.20699938555601e-19)) + pow(fs,2)*(pow(fs,2)*(fs*(1.90996579300106e-29*fs + 4.20474913079239e-25) + 3.04018853336678e-22) - 1.4784608472944e-21);

    b2 = Wah*(Wah*pow(fs,3)*(fs*(fs*(2.73326853922023e-29*fs + 1.4417191521797e-25) - 3.97330096911255e-23) - 9.75784159214306e-21) + pow(fs,2)*(fs*(fs*(fs*(-2.72464495932894e-29*fs - 1.44244369303552e-25) + 4.02405861356002e-23) + 1.19626991141253e-20) + 6.03499692778005e-20)) + pow(fs,2)*(fs*(fs*(fs*(-4.77491448250266e-29*fs - 5.25593641349048e-25) + 1.52009426668339e-22) + 3.74682116283731e-20) + 7.39230423647202e-22);

    b3 = Wah*(Wah*pow(fs,4)*(-3.64435805229364e-29*pow(fs,2) + 1.58932038764502e-22) + pow(fs,2)*(pow(fs,2)*(3.63285994577192e-29*pow(fs,2) - 1.60962344542401e-22) + 2.41399877111202e-19)) + pow(fs,2)*(pow(fs,2)*(6.36655264333688e-29*pow(fs,2) - 6.08037706673355e-22) + 2.95692169458881e-21);

    b4 = Wah*(Wah*pow(fs,3)*(fs*(fs*(2.73326853922023e-29*fs - 1.4417191521797e-25) - 3.97330096911255e-23) + 9.75784159214306e-21) + pow(fs,2)*(fs*(fs*(fs*(-2.72464495932894e-29*fs + 1.44244369303552e-25) + 4.02405861356002e-23) - 1.19626991141253e-20) + 6.03499692778005e-20)) + pow(fs,2)*(fs*(fs*(fs*(-4.77491448250266e-29*fs + 5.25593641349048e-25) + 1.52009426668339e-22) - 3.74682116283731e-20) + 7.39230423647202e-22);

    b5 = Wah*(Wah*pow(fs,4)*(fs*(-1.09330741568809e-29*fs + 1.15337532174376e-25) - 7.94660193822509e-23) + pow(fs,2)*(pow(fs,2)*(fs*(1.08985798373158e-29*fs - 1.15395495442842e-25) + 8.04811722712005e-23) - 1.20699938555601e-19)) + pow(fs,2)*(pow(fs,2)*(fs*(1.90996579300106e-29*fs - 4.20474913079239e-25) + 3.04018853336678e-22) - 1.4784608472944e-21);

    b6 = Wah*(Wah*pow(fs,3)*(fs*(fs*(1.82217902614682e-30*fs - 2.88343830435939e-26) + 3.97330096911255e-23) - 3.25261386404769e-21) + pow(fs,2)*(fs*(fs*(fs*(-1.81642997288596e-30*fs + 2.88488738607105e-26) - 4.02405861356002e-23) + 3.98756637137511e-21) - 6.03499692778005e-20)) + pow(fs,2)*(fs*(fs*(fs*(-3.18327632166844e-30*fs + 1.0511872826981e-25) - 1.52009426668339e-22) + 1.24894038761244e-20) - 7.39230423647202e-22);

    a0 = Wah*(Wah*pow(fs,2)*(fs*(fs*(fs*(-2.99058068344367e-29*fs - 2.80670790745131e-26) - 5.93685085752414e-23) - 4.06379935456973e-20) - 4.33319933521253e-19) + fs*(fs*(fs*(fs*(fs*(1.64867026615177e-28*fs + 1.33928172058214e-25) + 7.41293891074537e-23) + 4.91860288753505e-20) + 1.34455763292065e-18) + 9.8481803073012e-18)) + fs*(fs*(fs*(fs*(fs*(5.06729438510915e-30*fs + 1.75902134761561e-26) + 2.55792255245646e-22) + 1.86059812765692e-19) + 5.19747968243949e-18) + 3.83962880191652e-17) + 2.23822279711391e-18;

    a1 = Wah*(Wah*pow(fs,2)*(pow(fs,2)*(fs*(1.7943484100662e-28*fs + 1.12268316298052e-25) + 1.18737017150483e-22) - 8.66639867042506e-19) + fs*(fs*(pow(fs,2)*(fs*(-9.89202159691062e-28*fs - 5.35712688232857e-25) - 1.48258778214907e-22) + 2.68911526584129e-18) + 3.93927212292048e-17)) + fs*(fs*(pow(fs,2)*(fs*(-3.04037663106549e-29*fs - 7.03608539046245e-26) - 5.11584510491292e-22) + 1.0394959364879e-17) + 1.53585152076661e-16) + 1.34293367826835e-17;

    a2 = Wah*(Wah*pow(fs,2)*(fs*(fs*(fs*(-4.48587102516551e-28*fs - 1.40335395372566e-25) + 5.93685085752414e-23) + 1.21913980637092e-19) + 4.33319933521253e-19) + fs*(fs*(fs*(fs*(fs*(2.47300539922766e-27*fs + 6.69640860291072e-25) - 7.41293891074537e-23) - 1.47558086626052e-19) - 1.34455763292065e-18) + 4.9240901536506e-17)) + fs*(fs*(fs*(fs*(fs*(7.60094157766373e-29*fs + 8.79510673807807e-26) - 2.55792255245646e-22) - 5.58179438297077e-19) - 5.19747968243949e-18) + 1.91981440095826e-16) + 3.35733419567086e-17;

    a3 = Wah*(Wah*pow(fs,2)*(pow(fs,2)*(5.98116136688735e-28*pow(fs,2) - 2.37474034300966e-22) + 1.73327973408501e-18) + pow(fs,2)*(pow(fs,2)*(-3.29734053230354e-27*pow(fs,2) + 2.96517556429815e-22) - 5.37823053168259e-18)) + pow(fs,2)*(pow(fs,2)*(-1.01345887702183e-28*pow(fs,2) + 1.02316902098258e-21) - 2.0789918729758e-17) + 4.47644559422782e-17;

    a4 = Wah*(Wah*pow(fs,2)*(fs*(fs*(fs*(-4.48587102516551e-28*fs + 1.40335395372566e-25) + 5.93685085752414e-23) - 1.21913980637092e-19) + 4.33319933521253e-19) + fs*(fs*(fs*(fs*(fs*(2.47300539922766e-27*fs - 6.69640860291072e-25) - 7.41293891074537e-23) + 1.47558086626052e-19) - 1.34455763292065e-18) - 4.9240901536506e-17)) + fs*(fs*(fs*(fs*(fs*(7.60094157766373e-29*fs - 8.79510673807807e-26) - 2.55792255245646e-22) + 5.58179438297077e-19) - 5.19747968243949e-18) - 1.91981440095826e-16) + 3.35733419567086e-17;

    a5 = Wah*(Wah*pow(fs,2)*(pow(fs,2)*(fs*(1.7943484100662e-28*fs - 1.12268316298052e-25) + 1.18737017150483e-22) - 8.66639867042506e-19) + fs*(fs*(pow(fs,2)*(fs*(-9.89202159691062e-28*fs + 5.35712688232857e-25) - 1.48258778214907e-22) + 2.68911526584129e-18) - 3.93927212292048e-17)) + fs*(fs*(pow(fs,2)*(fs*(-3.04037663106549e-29*fs + 7.03608539046245e-26) - 5.11584510491292e-22) + 1.0394959364879e-17) - 1.53585152076661e-16) + 1.34293367826835e-17;

    a6 = Wah*(Wah*pow(fs,2)*(fs*(fs*(fs*(-2.99058068344367e-29*fs + 2.80670790745131e-26) - 5.93685085752414e-23) + 4.06379935456973e-20) - 4.33319933521253e-19) + fs*(fs*(fs*(fs*(fs*(1.64867026615177e-28*fs - 1.33928172058214e-25) + 7.41293891074537e-23) - 4.91860288753505e-20) + 1.34455763292065e-18) - 9.8481803073012e-18)) + fs*(fs*(fs*(fs*(fs*(5.06729438510915e-30*fs - 1.75902134761561e-26) + 2.55792255245646e-22) - 1.86059812765692e-19) + 5.19747968243949e-18) - 3.83962880191652e-17) + 2.23822279711391e-18;
};
