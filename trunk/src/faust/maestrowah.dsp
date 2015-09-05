// generated automatically
// DO NOT MODIFY!
declare id "maestrowah";
declare name "Maestro Wah";
declare category "Guitar Effects";
declare shortname "Maestro Wah";
declare description "Maestro Boomerang  Wah  EG-1";

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

    Wah1 = (x : amp_follower_ud(0.01,0.1) : min(0.75) : max(0.09) );

    Wah2 = wah_ctrl.wah : Inverted(1) : LogPot(1) : smooth(s);
 
    sl = wah_ctrl.mode;

    Wah3 = (oscs(freq) + 1) / 2 : min(0.91) : max(0.25) : Inverted(1) with {
        freq = wah_ctrl.freq;
    }; 

    Wah = select3(sl, Wah2, Wah1, Wah3);

    b0 = Wah*(Wah*pow(fs,3)*(fs*(fs*(1.17540074891101e-30*fs + 1.07086033539464e-26) + 3.84214613809295e-23) + 6.72783466104334e-22) + pow(fs,3)*(fs*(fs*(-1.17272340720388e-30*fs - 1.07070902223171e-26) - 3.8421155075404e-23) - 6.72690759164588e-22)) + pow(fs,2)*(fs*(fs*(fs*(-1.51773160849695e-29*fs - 1.7768404223597e-25) - 7.65801073152836e-22) - 2.19849670514246e-20) - 1.50703496407371e-19);

    b1 = Wah*(Wah*pow(fs,4)*(fs*(-7.05240449346608e-30*fs - 4.28344134157857e-26) - 7.6842922761859e-23) + pow(fs,4)*(fs*(7.03634044322325e-30*fs + 4.28283608892684e-26) + 7.68423101508079e-23)) + pow(fs,2)*(pow(fs,2)*(fs*(9.10638965098171e-29*fs + 7.1073616894388e-25) + 1.53160214630567e-21) - 3.01406992814742e-19);

    b2 = Wah*(Wah*pow(fs,3)*(fs*(fs*(1.76310112336652e-29*fs + 5.35430167697321e-26) - 3.84214613809295e-23) - 2.018350398313e-21) + pow(fs,3)*(fs*(fs*(-1.75908511080581e-29*fs - 5.35354511115855e-26) + 3.8421155075404e-23) + 2.01807227749376e-21)) + pow(fs,2)*(fs*(fs*(fs*(-2.27659741274543e-28*fs - 8.8842021117985e-25) + 7.65801073152836e-22) + 6.59549011542738e-20) + 1.50703496407371e-19);

    b3 = Wah*(Wah*pow(fs,4)*(-2.35080149782203e-29*pow(fs,2) + 1.53685845523718e-22) + pow(fs,4)*(2.34544681440775e-29*pow(fs,2) - 1.53684620301616e-22)) + pow(fs,2)*(pow(fs,2)*(3.0354632169939e-28*pow(fs,2) - 3.06320429261135e-21) + 6.02813985629483e-19);

    b4 = Wah*(Wah*pow(fs,3)*(fs*(fs*(1.76310112336652e-29*fs - 5.35430167697321e-26) - 3.84214613809295e-23) + 2.018350398313e-21) + pow(fs,3)*(fs*(fs*(-1.75908511080581e-29*fs + 5.35354511115855e-26) + 3.8421155075404e-23) - 2.01807227749376e-21)) + pow(fs,2)*(fs*(fs*(fs*(-2.27659741274543e-28*fs + 8.8842021117985e-25) + 7.65801073152836e-22) - 6.59549011542738e-20) + 1.50703496407371e-19);

    b5 = Wah*(Wah*pow(fs,4)*(fs*(-7.05240449346608e-30*fs + 4.28344134157857e-26) - 7.6842922761859e-23) + pow(fs,4)*(fs*(7.03634044322325e-30*fs - 4.28283608892684e-26) + 7.68423101508079e-23)) + pow(fs,2)*(pow(fs,2)*(fs*(9.10638965098171e-29*fs - 7.1073616894388e-25) + 1.53160214630567e-21) - 3.01406992814742e-19);

    b6 = Wah*(Wah*pow(fs,3)*(fs*(fs*(1.17540074891101e-30*fs - 1.07086033539464e-26) + 3.84214613809295e-23) - 6.72783466104334e-22) + pow(fs,3)*(fs*(fs*(-1.17272340720388e-30*fs + 1.07070902223171e-26) - 3.8421155075404e-23) + 6.72690759164588e-22)) + pow(fs,2)*(fs*(fs*(fs*(-1.51773160849695e-29*fs + 1.7768404223597e-25) - 7.65801073152836e-22) + 2.19849670514246e-20) - 1.50703496407371e-19);

    a0 = Wah*(Wah*pow(fs,2)*(fs*(fs*(fs*(-1.9610135138181e-31*fs - 9.896367182867e-28) - 8.75733379819361e-24) - 1.80287810387687e-21) - 8.70288665093646e-21) + fs*(fs*(fs*(fs*(fs*(1.36256412442164e-28*fs + 3.99675885805637e-26) + 2.56429016897871e-23) + 6.77652355279003e-21) + 3.70846672531016e-19) + 1.74057733018729e-18)) + fs*(fs*(fs*(fs*(fs*(1.27725343977795e-29*fs + 1.87739796916718e-26) + 2.36856089880348e-22) + 8.20619385097054e-20) + 7.49826239560209e-18) + 1.05287431081816e-16) + 3.48115466037458e-16;

    a1 = Wah*(Wah*pow(fs,2)*(pow(fs,2)*(fs*(1.17660810829086e-30*fs + 3.9585468731468e-27) + 1.75146675963872e-23) - 1.74057733018729e-20) + fs*(fs*(pow(fs,2)*(fs*(-8.17538474652987e-28*fs - 1.59870354322255e-25) - 5.12858033795743e-23) + 7.41693345062033e-19) + 6.96230932074917e-18)) + fs*(fs*(pow(fs,2)*(fs*(-7.66352063866769e-29*fs - 7.5095918766687e-26) - 4.73712179760696e-22) + 1.49965247912042e-17) + 4.21149724327264e-16) + 2.08869279622475e-15;

    a2 = Wah*(Wah*pow(fs,2)*(fs*(fs*(fs*(-2.94152027072716e-30*fs - 4.9481835914335e-27) + 8.75733379819361e-24) + 5.40863431163062e-21) + 8.70288665093646e-21) + fs*(fs*(fs*(fs*(fs*(2.04384618663247e-27*fs + 1.99837942902818e-25) - 2.56429016897871e-23) - 2.03295706583701e-20) - 3.70846672531016e-19) + 8.70288665093646e-18)) + fs*(fs*(fs*(fs*(fs*(1.91588015966692e-28*fs + 9.38698984583588e-26) - 2.36856089880348e-22) - 2.46185815529116e-19) - 7.49826239560209e-18) + 5.2643715540908e-16) + 5.22173199056188e-15;

    a3 = Wah*(Wah*pow(fs,2)*(pow(fs,2)*(3.92202702763621e-30*pow(fs,2) - 3.50293351927744e-23) + 3.48115466037458e-20) + pow(fs,2)*(pow(fs,2)*(-2.72512824884329e-27*pow(fs,2) + 1.02571606759149e-22) - 1.48338669012407e-18)) + pow(fs,2)*(pow(fs,2)*(-2.5545068795559e-28*pow(fs,2) + 9.47424359521391e-22) - 2.99930495824084e-17) + 6.96230932074917e-15;

    a4 = Wah*(Wah*pow(fs,2)*(fs*(fs*(fs*(-2.94152027072716e-30*fs + 4.9481835914335e-27) + 8.75733379819361e-24) - 5.40863431163062e-21) + 8.70288665093646e-21) + fs*(fs*(fs*(fs*(fs*(2.04384618663247e-27*fs - 1.99837942902818e-25) - 2.56429016897871e-23) + 2.03295706583701e-20) - 3.70846672531016e-19) - 8.70288665093646e-18)) + fs*(fs*(fs*(fs*(fs*(1.91588015966692e-28*fs - 9.38698984583588e-26) - 2.36856089880348e-22) + 2.46185815529116e-19) - 7.49826239560209e-18) - 5.2643715540908e-16) + 5.22173199056188e-15;

    a5 = Wah*(Wah*pow(fs,2)*(pow(fs,2)*(fs*(1.17660810829086e-30*fs - 3.9585468731468e-27) + 1.75146675963872e-23) - 1.74057733018729e-20) + fs*(fs*(pow(fs,2)*(fs*(-8.17538474652987e-28*fs + 1.59870354322255e-25) - 5.12858033795743e-23) + 7.41693345062033e-19) - 6.96230932074917e-18)) + fs*(fs*(pow(fs,2)*(fs*(-7.66352063866769e-29*fs + 7.5095918766687e-26) - 4.73712179760696e-22) + 1.49965247912042e-17) - 4.21149724327264e-16) + 2.08869279622475e-15;

    a6 = Wah*(Wah*pow(fs,2)*(fs*(fs*(fs*(-1.9610135138181e-31*fs + 9.896367182867e-28) - 8.75733379819361e-24) + 1.80287810387687e-21) - 8.70288665093646e-21) + fs*(fs*(fs*(fs*(fs*(1.36256412442164e-28*fs - 3.99675885805637e-26) + 2.56429016897871e-23) - 6.77652355279003e-21) + 3.70846672531016e-19) - 1.74057733018729e-18)) + fs*(fs*(fs*(fs*(fs*(1.27725343977795e-29*fs - 1.87739796916718e-26) + 2.36856089880348e-22) - 8.20619385097054e-20) + 7.49826239560209e-18) - 1.05287431081816e-16) + 3.48115466037458e-16;
};
