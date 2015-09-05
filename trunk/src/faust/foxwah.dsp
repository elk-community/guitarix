// generated automatically
// DO NOT MODIFY!
declare id "foxwah";
declare name "Foxx Wah";
declare category "Guitar Effects";
declare shortname "Foxx Wah";
declare description "Foxx Wah";

import("filter.lib");
import("effect.lib");
import("oscillator.lib");
import("guitarix.lib");

process(x) = x : _<:*(dry),(*(wet) : pre : iir((b0/a0,b1/a0,b2/a0,b3/a0,b4/a0,b5/a0,b6/a0),(a1/a0,a2/a0,a3/a0,a4/a0,a5/a0,a6/a0))):>_ with {
    LogPot(a, x) = if(a, (exp(a * x) - 1) / (exp(a) - 1), x);
    Inverted(b, x) = if(b, 1 - x, x);
    s = 0.993;
    fs = float(SR);
    wet = wah_ctrl.wet_dry;
    dry = 1 - wet;
    pre = dcblockerat(228.105325695);

    Wah1 = (x : amp_follower_ud(0.01,0.1) : min(0.98) : max(0.02) : Inverted(1)): smooth(s);

    Wah2 = wah_ctrl.wah : max(0.01) : LogPot(1) : smooth(s);
 
    sl = wah_ctrl.mode;

    Wah3 = (oscs(freq) + 1) / 2 : min(0.98) : max(0.02) : Inverted(1) with {
        freq = wah_ctrl.freq;
    }; 

    Wah = select3(sl, Wah2, Wah1, Wah3);

    b0 = Wah*(Wah*pow(fs,3)*(fs*(fs*(7.82331059004192e-31*fs + 1.87212425726617e-26) + 2.75196531908426e-23) + 1.89966352721393e-21) + pow(fs,2)*(fs*(fs*(fs*(-8.70084394409575e-31*fs - 2.07883929004669e-26) - 3.01424368528688e-23) - 1.4599239758417e-21) + 4.49643377593909e-20)) + pow(fs,2)*(fs*(fs*(fs*(-3.01712837658666e-30*fs - 1.00001164741986e-25) - 1.50552858206142e-22) - 1.18270878471141e-20) - 1.03261821057402e-19);

    b1 = Wah*(Wah*pow(fs,4)*(fs*(-4.69398635402515e-30*fs - 7.48849702906466e-26) - 5.50393063816852e-23) + pow(fs,2)*(pow(fs,2)*(fs*(5.22050636645745e-30*fs + 8.31535716018674e-26) + 6.02848737057377e-23) + 8.99286755187819e-20)) + pow(fs,2)*(pow(fs,2)*(fs*(1.81027702595199e-29*fs + 4.00004658967943e-25) + 3.01105716412283e-22) - 2.06523642114804e-19);

    b2 = Wah*(Wah*pow(fs,3)*(fs*(fs*(1.17349658850629e-29*fs + 9.36062128633083e-26) - 2.75196531908426e-23) - 5.69899058164178e-21) + pow(fs,2)*(fs*(fs*(fs*(-1.30512659161436e-29*fs - 1.03941964502334e-25) + 3.01424368528688e-23) + 4.37977192752511e-21) - 4.49643377593909e-20)) + pow(fs,2)*(fs*(fs*(fs*(-4.52569256487998e-29*fs - 5.00005823709929e-25) + 1.50552858206142e-22) + 3.54812635413424e-20) + 1.03261821057402e-19);

    b3 = Wah*(Wah*pow(fs,4)*(-1.56466211800838e-29*pow(fs,2) + 1.1007861276337e-22) + pow(fs,2)*(pow(fs,2)*(1.74016878881915e-29*pow(fs,2) - 1.20569747411475e-22) - 1.79857351037564e-19)) + pow(fs,2)*(pow(fs,2)*(6.03425675317331e-29*pow(fs,2) - 6.02211432824566e-22) + 4.13047284229608e-19);

    b4 = Wah*(Wah*pow(fs,3)*(fs*(fs*(1.17349658850629e-29*fs - 9.36062128633083e-26) - 2.75196531908426e-23) + 5.69899058164178e-21) + pow(fs,2)*(fs*(fs*(fs*(-1.30512659161436e-29*fs + 1.03941964502334e-25) + 3.01424368528688e-23) - 4.37977192752511e-21) - 4.49643377593909e-20)) + pow(fs,2)*(fs*(fs*(fs*(-4.52569256487998e-29*fs + 5.00005823709929e-25) + 1.50552858206142e-22) - 3.54812635413424e-20) + 1.03261821057402e-19);

    b5 = Wah*(Wah*pow(fs,4)*(fs*(-4.69398635402515e-30*fs + 7.48849702906466e-26) - 5.50393063816852e-23) + pow(fs,2)*(pow(fs,2)*(fs*(5.22050636645745e-30*fs - 8.31535716018674e-26) + 6.02848737057377e-23) + 8.99286755187819e-20)) + pow(fs,2)*(pow(fs,2)*(fs*(1.81027702595199e-29*fs - 4.00004658967943e-25) + 3.01105716412283e-22) - 2.06523642114804e-19);

    b6 = Wah*(Wah*pow(fs,3)*(fs*(fs*(7.82331059004192e-31*fs - 1.87212425726617e-26) + 2.75196531908426e-23) - 1.89966352721393e-21) + pow(fs,2)*(fs*(fs*(fs*(-8.70084394409575e-31*fs + 2.07883929004669e-26) - 3.01424368528688e-23) + 1.4599239758417e-21) + 4.49643377593909e-20)) + pow(fs,2)*(fs*(fs*(fs*(-3.01712837658666e-30*fs + 1.00001164741986e-25) - 1.50552858206142e-22) + 1.18270878471141e-20) - 1.03261821057402e-19);

    a0 = Wah*(Wah*pow(fs,2)*(fs*(fs*(fs*(-2.25449892184273e-29*fs - 1.9277250101687e-26) - 2.4070506850132e-23) - 1.64046518630872e-20) - 2.23174133838697e-19) + fs*(fs*(fs*(fs*(fs*(-9.046232655478e-29*fs - 7.13923782889043e-26) + 1.2582355015771e-23) + 1.1492280506911e-20) - 1.61228897189633e-19) - 5.63571045047215e-18)) + fs*(fs*(fs*(fs*(fs*(1.31056486224973e-28*fs + 1.12725575942016e-25) + 1.55788981956485e-22) + 1.10375552149592e-19) + 4.15002440003883e-18) + 5.08453859893818e-17) + 1.42315920466468e-16;

    a1 = Wah*(Wah*pow(fs,2)*(pow(fs,2)*(fs*(1.35269935310564e-28*fs + 7.71090004067479e-26) + 4.81410137002639e-23) - 4.46348267677394e-19) + fs*(fs*(pow(fs,2)*(fs*(5.4277395932868e-28*fs + 2.85569513155617e-25) - 2.5164710031542e-23) - 3.22457794379266e-19) - 2.25428418018886e-17)) + fs*(fs*(pow(fs,2)*(fs*(-7.86338917349835e-28*fs - 4.50902303768066e-25) - 3.11577963912971e-22) + 8.30004880007766e-18) + 2.03381543957527e-16) + 8.5389552279881e-16;

    a2 = Wah*(Wah*pow(fs,2)*(fs*(fs*(fs*(-3.3817483827641e-28*fs - 9.63862505084349e-26) + 2.4070506850132e-23) + 4.92139555892616e-20) + 2.23174133838697e-19) + fs*(fs*(fs*(fs*(fs*(-1.3569348983217e-27*fs - 3.56961891444522e-25) - 1.2582355015771e-23) - 3.44768415207329e-20) + 1.61228897189633e-19) - 2.81785522523607e-17)) + fs*(fs*(fs*(fs*(fs*(1.96584729337459e-27*fs + 5.63627879710083e-25) - 1.55788981956485e-22) - 3.31126656448775e-19) - 4.15002440003883e-18) + 2.54226929946909e-16) + 2.13473880699702e-15;

    a3 = Wah*(Wah*pow(fs,2)*(pow(fs,2)*(4.50899784368546e-28*pow(fs,2) - 9.62820274005279e-23) + 8.92696535354788e-19) + pow(fs,2)*(pow(fs,2)*(1.8092465310956e-27*pow(fs,2) + 5.03294200630841e-23) + 6.44915588758531e-19)) + pow(fs,2)*(pow(fs,2)*(-2.62112972449945e-27*pow(fs,2) + 6.23155927825941e-22) - 1.66000976001553e-17) + 2.84631840932937e-15;

    a4 = Wah*(Wah*pow(fs,2)*(fs*(fs*(fs*(-3.3817483827641e-28*fs + 9.63862505084349e-26) + 2.4070506850132e-23) - 4.92139555892616e-20) + 2.23174133838697e-19) + fs*(fs*(fs*(fs*(fs*(-1.3569348983217e-27*fs + 3.56961891444522e-25) - 1.2582355015771e-23) + 3.44768415207329e-20) + 1.61228897189633e-19) + 2.81785522523607e-17)) + fs*(fs*(fs*(fs*(fs*(1.96584729337459e-27*fs - 5.63627879710083e-25) - 1.55788981956485e-22) + 3.31126656448775e-19) - 4.15002440003883e-18) - 2.54226929946909e-16) + 2.13473880699702e-15;

    a5 = Wah*(Wah*pow(fs,2)*(pow(fs,2)*(fs*(1.35269935310564e-28*fs - 7.71090004067479e-26) + 4.81410137002639e-23) - 4.46348267677394e-19) + fs*(fs*(pow(fs,2)*(fs*(5.4277395932868e-28*fs - 2.85569513155617e-25) - 2.5164710031542e-23) - 3.22457794379266e-19) + 2.25428418018886e-17)) + fs*(fs*(pow(fs,2)*(fs*(-7.86338917349835e-28*fs + 4.50902303768066e-25) - 3.11577963912971e-22) + 8.30004880007766e-18) - 2.03381543957527e-16) + 8.5389552279881e-16;

    a6 = Wah*(Wah*pow(fs,2)*(fs*(fs*(fs*(-2.25449892184273e-29*fs + 1.9277250101687e-26) - 2.4070506850132e-23) + 1.64046518630872e-20) - 2.23174133838697e-19) + fs*(fs*(fs*(fs*(fs*(-9.046232655478e-29*fs + 7.13923782889043e-26) + 1.2582355015771e-23) - 1.1492280506911e-20) - 1.61228897189633e-19) + 5.63571045047215e-18)) + fs*(fs*(fs*(fs*(fs*(1.31056486224973e-28*fs - 1.12725575942016e-25) + 1.55788981956485e-22) - 1.10375552149592e-19) + 4.15002440003883e-18) - 5.08453859893818e-17) + 1.42315920466468e-16;
};
