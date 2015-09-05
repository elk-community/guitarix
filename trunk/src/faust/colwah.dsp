// generated automatically
// DO NOT MODIFY!
declare id "colwah";
declare name "ColorSound Wah";
declare category "Guitar Effects";
declare shortname "ColorSound Wah";
declare description "ColorSound Wah";

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

    Wah1 = (x : amp_follower_ud(0.01,0.1) : min(1) : max(0.02) ) : smooth(s);

    Wah2 = wah_ctrl.wah : max(0.01) : Inverted(1) : LogPot(5) : smooth(s);
 
    sl = wah_ctrl.mode;

    Wah3 = (oscs(freq) + 1) / 2 : min(0.98) : max(0.02) : Inverted(1) with {
        freq = wah_ctrl.freq;
    }; 

    Wah = select3(sl, Wah2, Wah1, Wah3);
   
    b0 = Wah*(Wah*pow(fs,3)*(fs*(fs*(3.57054794077438e-31*fs + 8.2151955389469e-27) + 1.25321322315854e-23) + 4.08428676476815e-22) + pow(fs,2)*(fs*(fs*(fs*(-3.53331014667854e-31*fs - 8.13766500494647e-27) - 1.25785612226533e-23) - 6.73367038087507e-22) - 8.77258904721491e-21)) + pow(fs,2)*(fs*(fs*(fs*(-1.14655708524549e-30*fs - 3.62338673802449e-26) - 5.6523354018053e-23) - 2.12994394902622e-21) - 9.55955366951846e-21);

    b1 = Wah*(Wah*pow(fs,4)*(fs*(-2.14232876446463e-30*fs - 3.28607821557876e-26) - 2.50642644631707e-23) + pow(fs,2)*(pow(fs,2)*(fs*(2.11998608800713e-30*fs + 3.25506600197859e-26) + 2.51571224453066e-23) - 1.75451780944298e-20)) + pow(fs,2)*(pow(fs,2)*(fs*(6.87934251147295e-30*fs + 1.4493546952098e-25) + 1.13046708036106e-22) - 1.91191073390369e-20);

    b2 = Wah*(Wah*pow(fs,3)*(fs*(fs*(5.35582191116158e-30*fs + 4.10759776947345e-26) - 1.25321322315854e-23) - 1.22528602943045e-21) + pow(fs,2)*(fs*(fs*(fs*(-5.29996522001782e-30*fs - 4.06883250247324e-26) + 1.25785612226533e-23) + 2.02010111426252e-21) + 8.77258904721491e-21)) + pow(fs,2)*(fs*(fs*(fs*(-1.71983562786824e-29*fs - 1.81169336901225e-25) + 5.6523354018053e-23) + 6.38983184707866e-21) + 9.55955366951846e-21);

    b3 = Wah*(Wah*pow(fs,4)*(-7.14109588154877e-30*pow(fs,2) + 5.01285289263414e-23) + pow(fs,2)*(pow(fs,2)*(7.06662029335709e-30*pow(fs,2) - 5.03142448906131e-23) + 3.50903561888596e-20)) + pow(fs,2)*(pow(fs,2)*(2.29311417049098e-29*pow(fs,2) - 2.26093416072212e-22) + 3.82382146780738e-20);

    b4 = Wah*(Wah*pow(fs,3)*(fs*(fs*(5.35582191116158e-30*fs - 4.10759776947345e-26) - 1.25321322315854e-23) + 1.22528602943045e-21) + pow(fs,2)*(fs*(fs*(fs*(-5.29996522001782e-30*fs + 4.06883250247324e-26) + 1.25785612226533e-23) - 2.02010111426252e-21) + 8.77258904721491e-21)) + pow(fs,2)*(fs*(fs*(fs*(-1.71983562786824e-29*fs + 1.81169336901225e-25) + 5.6523354018053e-23) - 6.38983184707866e-21) + 9.55955366951846e-21);

    b5 = Wah*(Wah*pow(fs,4)*(fs*(-2.14232876446463e-30*fs + 3.28607821557876e-26) - 2.50642644631707e-23) + pow(fs,2)*(pow(fs,2)*(fs*(2.11998608800713e-30*fs - 3.25506600197859e-26) + 2.51571224453066e-23) - 1.75451780944298e-20)) + pow(fs,2)*(pow(fs,2)*(fs*(6.87934251147295e-30*fs - 1.4493546952098e-25) + 1.13046708036106e-22) - 1.91191073390369e-20);

    b6 = Wah*(Wah*pow(fs,3)*(fs*(fs*(3.57054794077438e-31*fs - 8.2151955389469e-27) + 1.25321322315854e-23) - 4.08428676476815e-22) + pow(fs,2)*(fs*(fs*(fs*(-3.53331014667854e-31*fs + 8.13766500494647e-27) - 1.25785612226533e-23) + 6.73367038087507e-22) - 8.77258904721491e-21)) + pow(fs,2)*(fs*(fs*(fs*(-1.14655708524549e-30*fs + 3.62338673802449e-26) - 5.6523354018053e-23) + 2.12994394902622e-21) - 9.55955366951846e-21);

    a0 = Wah*(Wah*fs*(fs*(fs*(fs*(fs*(-2.9944679862091e-29*fs - 1.74927096988764e-26) - 1.25792928205509e-23) - 5.91446731480775e-21) - 1.51836846550049e-19) - 1.031544116964e-18) + fs*(fs*(fs*(fs*(fs*(1.70822585244041e-28*fs + 9.71341702061507e-26) + 2.25426927212869e-23) + 8.83661131513604e-21) + 2.71483854182133e-19) + 3.10505198843707e-18)) + fs*(fs*(fs*(fs*(fs*(2.81322342123736e-30*fs + 3.61396735526861e-27) + 5.53827044579352e-23) + 2.94448762671775e-20) + 1.31169348705373e-18) + 2.03039414548991e-17) + 7.17605891535182e-17;

    a1 = Wah*(Wah*fs*(fs*(pow(fs,2)*(fs*(1.79668079172546e-28*fs + 6.99708387955057e-26) + 2.51585856411018e-23) - 3.03673693100097e-19) - 4.126176467856e-18) + fs*(fs*(pow(fs,2)*(fs*(-1.02493551146425e-27*fs - 3.88536680824603e-25) - 4.50853854425739e-23) + 5.42967708364266e-19) + 1.24202079537483e-17)) + fs*(fs*(pow(fs,2)*(fs*(-1.68793405274241e-29*fs - 1.44558694210745e-26) - 1.1076540891587e-22) + 2.62338697410746e-18) + 8.12157658195965e-17) + 4.30563534921109e-16;

    a2 = Wah*(Wah*fs*(fs*(fs*(fs*(fs*(-4.49170197931365e-28*fs - 8.74635484943821e-26) + 1.25792928205509e-23) + 1.77434019444233e-20) + 1.51836846550049e-19) - 5.15772058482e-18) + fs*(fs*(fs*(fs*(fs*(2.56233877866062e-27*fs + 4.85670851030753e-25) - 2.25426927212869e-23) - 2.65098339454081e-20) - 2.71483854182133e-19) + 1.55252599421853e-17)) + fs*(fs*(fs*(fs*(fs*(4.21983513185604e-29*fs + 1.80698367763431e-26) - 5.53827044579352e-23) - 8.83346288015326e-20) - 1.31169348705373e-18) + 1.01519707274496e-16) + 1.07640883730277e-15;

    a3 = Wah*(Wah*pow(fs,2)*(pow(fs,2)*(5.9889359724182e-28*pow(fs,2) - 5.03171712822037e-23) + 6.07347386200195e-19) + pow(fs,2)*(pow(fs,2)*(-3.41645170488082e-27*pow(fs,2) + 9.01707708851477e-23) - 1.08593541672853e-18)) + pow(fs,2)*(pow(fs,2)*(-5.62644684247472e-29*pow(fs,2) + 2.21530817831741e-22) - 5.24677394821492e-18) + 1.43521178307036e-15;

    a4 = Wah*(Wah*fs*(fs*(fs*(fs*(fs*(-4.49170197931365e-28*fs + 8.74635484943821e-26) + 1.25792928205509e-23) - 1.77434019444233e-20) + 1.51836846550049e-19) + 5.15772058482e-18) + fs*(fs*(fs*(fs*(fs*(2.56233877866062e-27*fs - 4.85670851030753e-25) - 2.25426927212869e-23) + 2.65098339454081e-20) - 2.71483854182133e-19) - 1.55252599421853e-17)) + fs*(fs*(fs*(fs*(fs*(4.21983513185604e-29*fs - 1.80698367763431e-26) - 5.53827044579352e-23) + 8.83346288015326e-20) - 1.31169348705373e-18) - 1.01519707274496e-16) + 1.07640883730277e-15;

    a5 = Wah*(Wah*fs*(fs*(pow(fs,2)*(fs*(1.79668079172546e-28*fs - 6.99708387955057e-26) + 2.51585856411018e-23) - 3.03673693100097e-19) + 4.126176467856e-18) + fs*(fs*(pow(fs,2)*(fs*(-1.02493551146425e-27*fs + 3.88536680824603e-25) - 4.50853854425739e-23) + 5.42967708364266e-19) - 1.24202079537483e-17)) + fs*(fs*(pow(fs,2)*(fs*(-1.68793405274241e-29*fs + 1.44558694210745e-26) - 1.1076540891587e-22) + 2.62338697410746e-18) - 8.12157658195965e-17) + 4.30563534921109e-16;

    a6 = Wah*(Wah*fs*(fs*(fs*(fs*(fs*(-2.9944679862091e-29*fs + 1.74927096988764e-26) - 1.25792928205509e-23) + 5.91446731480775e-21) - 1.51836846550049e-19) + 1.031544116964e-18) + fs*(fs*(fs*(fs*(fs*(1.70822585244041e-28*fs - 9.71341702061507e-26) + 2.25426927212869e-23) - 8.83661131513604e-21) + 2.71483854182133e-19) - 3.10505198843707e-18)) + fs*(fs*(fs*(fs*(fs*(2.81322342123736e-30*fs - 3.61396735526861e-27) + 5.53827044579352e-23) - 2.94448762671775e-20) + 1.31169348705373e-18) - 2.03039414548991e-17) + 7.17605891535182e-17;
};
