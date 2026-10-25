# Loom | Real hydrogen/deuterium 1S-2S isotope shift | 2026-10-25 10Z

STATUS: CODATA_COMPARED / NONRELATIVISTIC BASELINE INCOMPLETE / HSH PHYSICAL PREDICTION UNRESOLVED. No BEDROCK promotion.

REAL SYSTEM: laboratory hydrogen-1 and deuterium-2 atomic beams, 1S-2S two-photon isotope shift. Parthey et al., Phys Rev Lett 104 233001 (2010), measured 670994334606(15) Hz. Separate H absolute control: Parthey et al., Phys Rev Lett 107 203001 (2011), 2466061413187035(10) Hz.

ARCHIVE: Satobloc/HsH DEVELOPMENT_FULL_CONVOS/H(s)H TEMPORAL ISOTROPY.txt, blob 8be62af34009f9d9e97c94d137fe43ace3f39e21, lines 431-555. MOVE 8: m_e v a0 = hbar; lambda_dB = 2*pi*a0; alpha = lambda_C/lambda_dB = v/c; candidate helix R=a0, P=lambda_C, P/(2*pi*R)=alpha. MOVE 9: finite-core geometry; MOVE 10: pitch/radius response. Original historical source itself states this representation does not derive alpha. Source message-level dates and attribution unresolved.

CURRENT CONTROLS: HsH BEDROCK.md blob 4cabda482c48c217614b868a2138409275df9bf7, 563 lines, ND-2026-10-25-01 real-data-first and ND-2026-10-18-02/03; subordinate STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Random historical full-read: SAT archive THE FUNDAMENTAL INTUITIONS - EXTENDED 2.txt, blob 468a04e9941165353e286b48e5a0ca27d5be58d9, 197 lines, source updated Feb 26 2026; its FIE framing is not quantitative isotope spectroscopy.

DATA: CODATA 2022 Rinf=10973731.568157(12) m^-1; me/mp=5.446170214889(94)e-4; me/md=2.724437107629(47)e-4; c=299792458 m/s exact. These adjusted constants are not an independent holdout; covariance is not fully propagated.

STANDARD TWO-BODY CORRECTION: mu_N/me = 1/(1+me/m_N). The nonrelativistic Coulomb 1S-2S frequency is f_N=(3/4)c Rinf (mu_N/me). This is imported known physics, NOT an independently derived SAT prediction.

EXECUTED RESULTS: f_H=2466038423686300.955 Hz; f_D=2466709430716807.842 Hz; isotope shift model=671007030506.888 Hz; observed=670994334606(15) Hz; residual +12695900.888 Hz = +12.695900888 MHz. Nonrelativistic H absolute residual versus Parthey 2011 = -22989500734.045 Hz. Neither discrepancy is removed by tuning. Missing relativistic, radiative, recoil, and nuclear finite-size contributions; this is NOT evidence against full standard quantum electrodynamics.

GEOMETRIC CONSEQUENCE: physical H/D two-body Bohr lengths R_N=a0(1+me/m_N). If historical P is kept at the electron Compton wavelength, slope a_N=alpha/(1+me/m_N), which differs for H and D and no longer equals relative speed/c=alpha. If pitch is instead the reduced-mass Compton wavelength P_N=lambda_C,e(1+me/m_N), slope remains alpha for both, while R and P change. The archive does not uniquely specify this two-body extension: no silent physical correction.

UNCERTAINTY: experimental 1 sigma 15 Hz; rough quadrature of reported CODATA component uncertainties and experiment ~29.94 Hz if treated independent, but CODATA correlations mean this is NOT a rigorous standardized z-score. Even summed 1 sigma components ~50.49 Hz are tiny against 12.7 MHz. Observed isotope shift is direct experimental data; CODATA constants may share spectroscopy data and are not independent prediction inputs.

GATE: dimensional/sign/algebra/numerical real-data comparison PASS; complete HSH mechanism UNRESOLVED; nonrelativistic approximation inadequate for precision spectroscopy; no invented parameter or empirical fit.

MINIMAL REPRODUCER (Python 3):
```python
from decimal import Decimal as D, getcontext
getcontext().prec=40
c=D(299792458); R=D('10973731.568157')
rp=D('5.446170214889e-4'); rd=D('2.724437107629e-4')
obs=D(670994334606)
f=lambda r:D(3)/4*c*R/(1+r)
shift=f(rd)-f(rp)
print('H Hz',f(rp),'D Hz',f(rd))
print('isotope shift Hz',shift,'residual Hz',shift-obs)
```

PUBLIC SOURCES: https://pubmed.ncbi.nlm.nih.gov/20867231/ ; https://pubmed.ncbi.nlm.nih.gov/22181729/ ; https://physics.nist.gov/cuu/Constants/ ; https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/H%28s%29H%20TEMPORAL%20ISOTROPY.txt

PUBLICATION: Public-safe archive mathematical excerpt and published metrology only. No restricted or private source data.
