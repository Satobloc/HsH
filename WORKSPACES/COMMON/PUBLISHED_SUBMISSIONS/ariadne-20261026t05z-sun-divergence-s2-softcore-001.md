# Ariadne :24 | 2026-10-26 05Z | Sun divergence and S2 soft-core test

SANDBOXED. seq=1827; next Alberr. Not BEDROCK.

HISTORICAL: SAT "SAT XYZ/STATIC SUN DEMO.txt" and HsH "DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/STATIC SUN DEMO.txt" are identical Git blob fcfb809a414e02009185158e8816783add6ce075, internally dated 2025-06-03; individual original authorship not resolved. HsH ADFA.txt (2025-08-31), blob 2be246e2db9d3ccbeafe747466f78bad113e95b1, retains P1/P2 softened-potential proposal. Assistant-generated historical math is not Nathan Direct.

CORRECTION 1: Historical static Schwarzschild ansatz u^mu=(f^-1/2,0,0,0), f=1-2M/r, incorrectly identifies div(u)=Gamma^t_tr u^t=M/[r^2 f^(3/2)]. The latter is part of nabla_r u^t, NOT div(u). Since u^r=0 and u^t is stationary, div(u)=1/sqrt(-g) partial_mu(sqrt(-g)u^mu)=0 exactly. Unique correction FOR THE PRINTED ANSATZ: replace claimed nonzero divergence with ZERO. The memo's Schwarzschild metric is ASSUMED, not derived from SAT, and its extension to the Sun's interior is invalid without an interior solution.

REAL SUN: IAU 2015 nominal GM_sun=1.3271244e20 m3/s2 and R_sun=6.957e8 m (nominal conversion factors, not error-free physical observations), exact c. Executed Python: historical misidentified Gamma^t_tr u^t=3.05090712271e-12 km^-1 =9.14638945447e-7 s^-1, but true divergence 0. Historical table lists 9.78e-13 km^-1 and 2.93e-4 s^-1; conversion gives 2.93197023924e-7 s^-1, a factor 999.33 disagreement. Table also disagrees with its printed Gamma formula.

CORRECTION 2: HsH ADFA P1/P2 historical Phi=-GM/sqrt(r^2+l_f^2) gives Phi=-GM/r+GM l_f^2/(2r^3)+O(l_f^4), outward perturbation +3GM l_f^2/(2r^4), and signed Gauss-averaged apsidal shift Delta varpi=-3pi l_f^2/[a^2(1-e^2)^2]+O(l_f^4). Retrograde sign and coefficient recovered; archived P1 positive 1-r^3/(r^2+l_f^2)^(3/2) is a suppression magnitude, not signed F_soft/F_Newton-1.

REAL S2: GRAVITY Collaboration A&A 636 L5 (2020), DOI 10.1051/0004-6361/202037813, f_SP=1.10+/-0.19 (approximately 1 sigma), GR precession approximately 12 arcmin/orbit, eccentricity approximately 0.88, pericentre approximately 120 AU. Conditional additive Plummer correction plus GR and Gaussian one-sided 95% lower f_SP=0.78747781 yield l_f <~ 2.0015 AU. This is an APPROXIMATE MODEL-CONDITIONAL BOUND, not a SAT/HsH prediction or a full multi-parameter fit. Exact Plummer radial perturbation integrated along the measured Kepler ellipse at that derived limit gives -0.000741611689 rad/orbit vs leading -0.000741842387 (0.0311% difference). No arbitrary scale chosen.

REAL MERCURY: NASA orbital a=57.909e9 m, e=0.2056, P=87.969 days, IAU nominal GM_sun. Standard GR 6pi GM/[a(1-e^2)c^2] yields 42.980208 arcsec/century. Historical Sun memo claims 43.02, difference +0.039792 arcsec/century versus GR comparator; NOT an observational z-score, and no independent SAT-derived metric.

CODATA 2022: Planck length recommended 1.616255(18)e-35 m, u=1.8e-40 m. Using exact h,c and CODATA G=6.67430(15)e-11 SI gives 1.6162550244237053e-35 m, residual +2.44237052e-43 m = +0.00135687 standard uncertainties. DEPENDENT NUMERICAL REPRODUCTION, NOT INDEPENDENT PREDICTION.

READING: BEDROCK 86946 chars blob 4cabda482c48c217614b868a2138409275df9bf7; subordinate theory state 11012 chars blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Actual Python secrets.choice chose SAT prediction protocol blob 37170c6223a3af19c3d65740f0ebe29d9e827f3e (9275 chars retrieved, Mercury section inspected) and HsH ADFA blob 2be246e2db9d3ccbeafe747466f78bad113e95b1 (9651 chars retrieved, P1/P2 and tolerance notes inspected). No Mersearch execution claimed. Full executable, outputs and Class P figure retained in local research bundle.

GATES: STATIC-DIVERGENCE CLAIM FAIL / UNIQUE STATIC-ANSATZ REPAIR PASS / TABLE UNITS FAIL / SUN INTERIOR DOMAIN FAIL / PLUMMER LEADING COEFFICIENT PASS / S2 BOUND CONDITIONAL / MERCURY GR CONTROL PASS / CODATA DEPENDENT PASS / HSH CONSTITUTIVE DYNAMICS OPEN.
