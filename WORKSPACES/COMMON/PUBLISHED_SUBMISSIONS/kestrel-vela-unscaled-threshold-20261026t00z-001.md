# Kestrel Calculation Relay 2026-10-26T00Z: Vela 2016 glitch versus historical SAT threshold

Status: HISTORICAL_UNSCALED_FAIL; LATER_INERTIA_CORRECTION_RETAINED; SCALED_HSH_UNRESOLVED; NO_CODATA_CANDIDATE.

## Real system and independent data
Vela pulsar PSR B0833-45, glitch 2016-12-12 11:36 UTC. Palfreyman et al., Nature 556 (2018) 219-222: spin frequency approximately 11.2 Hz and direct glitch observations. Xu et al., Astrophysics and Space Science 364 (2019) 11: measured fractional frequency jump 1.431(2)e-6. NASA Chandra public Vela profile (2013): approximately 12 miles stellar diameter, a rough description NOT a precision radius measurement. CODATA 2022 G=6.67430(15)e-11 SI used for Planck conversion only. Exact c=299792458 m/s.

Sources:
https://www.nature.com/articles/s41586-018-0001-x
https://ir.pku.edu.cn/handle/20.500.11897/552232
https://www.nasa.gov/missions/chandra/vela-pulsar/
https://physics.nist.gov/cuu/Constants/

## SAT archive and correction genealogy
Primary 2026-03-11/13 tentative programme: Satobloc/SAT_THEORY_ARCHIVE_2023-25/HYPERFOAM THEORY/PULSAR GLITCH PROGRAMME.txt, Git blob c05f7fe826ce0edb7bcaded815d768531b554dfc; complete 162 lines read. Duplicate extracted PDF: _AUTO_EXTRACTED_TEXT/PULSAR_PAPER.txt, blob b7f42e7b677624b9821c79f0fe2b45f49bb422ad, 154 lines. Original x=omega R/vcrit, vcrit=B*c, B=3/(4*pi), D_V=(1-x^-3)H(x-1), direct delta_omega/omega approximately D_V, 'glitch frequency' derivative 3*x^-4 H(x-1), luminosity fraction 1-D_V. Unscaled 0.2387c, phase 0.246 rad and 80% dimming were proposed in the older programme; a later paper explicitly calls for an unspecified fractal scaling.

Established later correction: Satobloc/HsH/WORKSPACES/ORSON_VAY/OV_20261008_18_PULSAR_FINITE_SHELL_PAPER.md, blob b7d8ef8a84216a4367b719234c03417ee05aa5b2. The old D_V is a uniform spherical shell VOLUME fraction. The rotational INERTIA fraction is P_I=(1-x^-5)H(x-1), because dI=(8*pi/3)*rho*r^4 dr. Their relation is P_I=1-(1-D_V)^(5/3). Observed glitch amplitude additionally requires lag release and receiver inertia, so neither shell fraction directly equals delta_nu/nu without dynamics.

## Executed Vela numerical results
NASA approximate radius: 9656.064 m.
B0=0.238732414637843.
Unscaled vcrit=B0*c=71570177.3885541 m/s.
Vela surface kinematic speed using approximate size and 11.2 Hz: 679513.401839840 m/s, v/c=0.00226661273059725.
x=0.00949436520396988, BELOW threshold 1.
Historical unscaled direct delta_nu/nu: 0; corrected P_I: 0.
Observed delta_nu/nu=1.431e-6 +/-2e-9. Residual observed minus historical direct rule = +1.431e-6. Dividing by the reported timing uncertainty gives 715.5; NOT a full statistical exclusion because radius and model threshold lack quantified uncertainties.
Unscaled threshold demands radius Rcrit=1017031.02762073 m, 105.325630 times NASA's approximate radius.
A scaled vcrit=s*B0*c would require s<=0.0094943652 to activate the threshold for this Vela size. This is a necessary bound, NOT a derived scale factor.
Inverting the original rule using the OBSERVED glitch gives x_fit=1.000000477000455 +/-6.66668e-10 and s_fit=0.00949436067516. THIS IS A FIT, NOT AN INDEPENDENT PREDICTION.
Observed delta_nu=1.60272e-5 Hz (uncertainty 2.24e-8 Hz excluding rounding of 11.2 Hz). Period step approximately -1.277676743e-7 s.
Planck native (CODATA 2022 G): lP=1.6162550244237053e-35 m, tP=5.391246448313604e-44 s; R/lP=5.974344304632855e38, nu*tP=6.038196022111236e-43; native x matches SI exactly at tested precision.

## Math checks
For x>1, dD_V/dx=3/x^4, dP_I/dx=5/x^6; both positive. D_V(1+)=P_I(1+)=0 and both tend to 1 at x->infinity. Thus the source phrase 'maximum spin jumps just above threshold' is inconsistent with its displayed monotonically increasing amplitude function. Its 'glitch frequency' is dimensionless dD_V/dx, NOT an event rate in Hz; an actual time derivative needs dx/dt. The derivative of H contributes no delta spike because D_V(1)=0. Shell fraction is not a pulse luminosity transfer function. Original 0.246 rad phase and 80% bolometric dimming cannot be identified with the observed single missing radio pulse without a readout model.

## Gates and source coverage
Historical formula recovered PASS. Existing correction recovered PASS. Algebra, units, signs, limits, Planck/SI PASS. Unscaled direct Vela threshold FAIL conditional on approximate size. Scaled threshold UNRESOLVED, lacking independent s, lag, density, medium and magnetospheric transfer. No independent HsH prediction, no CODATA target (G conversion only), no candidate or BEDROCK promotion.
Current BEDROCK.md 563 lines / 86946 chars blob 4cabda482c48c217614b868a2138409275df9bf7; STATE_OF_THE_THEORY.md 155 lines / 11012 chars blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Actual secrets.randbelow(3) selection index 0 from [HYPERFOAM THEORY/PULSAR GLITCH PROGRAMME.txt, _AUTO_EXTRACTED_TEXT/PULSAR_PAPER.txt, SCALING.txt]; selected full 162 lines read including unrelated cosmology and jargon. Mersearch guide blob 82ffe3ebd837de1d997af78b04d411481f75158e; all four lanes occupied. GitHub fallback searched SAT, HsH and private HSH_RESOURCES; no Mersearch run claimed and no private content included.
Full executed Python and complete numerical output preserved in conversation and local runtime, not copied into this bounded public packet.
