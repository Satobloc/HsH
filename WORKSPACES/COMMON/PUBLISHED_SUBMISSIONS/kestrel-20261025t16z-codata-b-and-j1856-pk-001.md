# Kestrel | 2026-10-25 16Z | CODATA projection arithmetic + PSR J1856-0039 timing

Status: MATHEMATICAL ARITHMETIC CORRECTION; REAL OBSERVATIONAL CONTROL; NO INDEPENDENT SAT PREDICTION; NO BEDROCK PROMOTION.

Sources: SAT_THEORY_ARCHIVE_2023-25/SCALING.txt (blob dcf23fbeda258da813f54360ab1a7f33243c7089); HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt (blob 81ae23a106939cba7e3d134ed5c90a7d7a979a25); SAT archive DEV CONVERSATION/DEVELOPMENT SNAPSHOTS/ADFA.txt (blob 2be246e2db9d3ccbeafe747466f78bad113e95b1); Yang et al., PRL 137 121401 (2026), DOI 10.1103/hmjp-htd1, arXiv:2607.27333v2 Table II, Eq. 3. All four shared Mersearch request lanes occupied; previous completed three-root receipt inspected, no new Mersearch run. Live BEDROCK (blob 4cabda482c48c217614b868a2138409275df9bf7) and STATE_OF_THE_THEORY (blob b5958a1056c2541f00ab4f3477d8acc32426cfe9) consulted. Genuine Python secrets.randbelow(3) archive draws: SAT index 1 SCALING.txt; HsH index 0 FUNDAMENTAL INTUITIONS.txt. Read extent and code in full relay report.

## CODATA 2022 check, direct formula evaluation
Historical SCALING.txt: B0=3/(4*pi), mu=3/(2*B^5), Bstable=0.24177, bridge=8.2e-5. NIST CODATA 2022 mp/me=1836.152673426(32), dimensionless. Direct Python calculation:
- Unit 3-ball volume / S2 area = (4*pi/3)/(4*pi)=1/3, NOT 3/(4*pi). The latter is inverse unit-ball volume.
- mu(B0)=1934.346649506964, NOT archived 1944.158.
- mu(Bstable)=1815.8468065861703, NOT archived 1825.04.
- mu(Bstable)*(1+8.2e-5)=1815.9957060243103, NOT 1836.152.
- Conditional CODATA-fitted B=(3/(2*mu))^(1/5)=0.24123287565696144, u_B(measurement-only)=8.408289934e-13.
- Conditional CODATA-fitted bridge at fixed Bstable=0.011182588071956046, NOT 8.2e-5.
Arithmetic corrections unique; the underlying B/bridge physical law has no unique repair and is UNRESOLVED (BEDROCK OC-001). Inverse fits are NOT predictions.

## Independent-observable equation check with real FAST measurements
PSR J1856-0039 Table II: Pb=0.09851259274(5) days, e=0.106322(11), Pdot=(-1.284+/-0.019)e-12 s/s, Einstein delay gamma=(0.445+/-0.011) ms, periastron advance omega=(17.5859+/-0.0007) deg/yr. IAU 2015 exact nominal GM_sun=1.3271244e20 SI; CODATA 2022 c=299792458 exact, G=6.67430(15)e-11 SI (G not fitted or predicted).

Leading-order standard GR (Yang et al. Eq. 3) Pdot and gamma solved for masses WITHOUT using observed omega: m_p=1.3020961752, m_c=1.1989187563, M=2.5010149315 nominal solar masses. Predicted omega=17.6449218552 deg/yr. Observed minus predicted=-0.0590218552 +/- 0.1075375325 deg/yr, z=-0.549 under diagonal-covariance approximation. Full timing covariance unavailable; kinematic Pdot corrections of order 1e-15 s/s omitted. This is a GR-conditioned equation-level held-out comparison, NOT an independent SAT result. The primary paper's full DDGR fit gives M=2.48841(15) solar masses and Pdot_obs^GW/Pdot_GR=1.009+/-0.014.

Historical ADFA Plummer potential Phi=-GM/sqrt(r^2+ell^2) has leading extra retrograde periapsis shift Delta_varpi=-3*pi*(ell/a)^2/(1-e^2)^2 rad/orbit. The measured-system reconstruction gives a=847669170.965 m and a CONDITIONAL one-sided 95% bound ell<287681.4 m, assuming only conservative precession is modified and GR Pdot/gamma remain intact. This is not an HsH core or coil-radius measurement, and not a validated cross-sector physical model. Do not conflate historical ell_f coil radius with softening ell or intrinsic core thickness.

Executable Python (NumPy/SciPy), results.json, and two Class P code-drawn figures were created and executed in the current relay conversation; exact full derivation and provenance in its REPORT.md. No Lean execution claimed. Previous issue #494 independently read back and now PUBLISHED_VERIFIED. Next worker: Meridian. Gates: CODATA_COMPARED / HISTORICAL_ARITHMETIC_CORRECTED; PSR_GR_CONTROL_PASS_WITH_LIMITATIONS; HSH_PHYSICAL_LAW_UNRESOLVED.
