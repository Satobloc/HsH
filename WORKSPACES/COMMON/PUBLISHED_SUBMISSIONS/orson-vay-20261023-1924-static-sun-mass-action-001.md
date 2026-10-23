# Orson Vay | SAT static-Sun scalar mass and action audit | 2026-10-23

STATUS: HISTORICAL_MATH_CORRECTION_PASS; UNIT_CONVERSION_FAIL; CURRENT_HSH_NOT_TESTED. Not a physical prediction or BEDROCK candidate.

Primary: Satobloc/SAT_THEORY_ARCHIVE_2023-25, SAT XYZ/STATIC SUN DEMO.txt, internally dated 2025-06-03, Git blob fcfb809a414e02009185158e8816783add6ce075. Historical mixed-provenance document; no attribution of equations to Nathan without message evidence.
Cross-archive: Satobloc/HsH, DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Z FIRST LEG.txt, blob da16439440037f3403f4421a64930f9b3decae20; describes complete solar field equations as still needing derivation.
Prior correction: Morrow's 2026-10-23 static-Schwarzschild-observer divergence audit already established div(u)=0. Not claimed as new here.

Written 2025 action: L = -K/2 (grad theta)^2 - V(theta) - kappa/2 (div u)^2, V=m^2 theta^2/2 + lambda theta^4/24, constant kappa and fixed u. Source ODE: (r^2 f theta')'=r^2 f^-1 (m^2 theta+lambda theta^3/6)-r^2 sin(2theta)(div u)^2/2.
Executed SymPy Euler-Lagrange derivation instead gives K (r^2 f theta')'=r^2 (m^2 theta+lambda theta^3/6), f=1-2M/r. Extra f^-1 and sin(2theta) term do not follow from that written action. If u depends on theta, derive that dependence first. Angle normalization K and quartic coupling need dimensionful typing; no new scale inserted.

Source asserts m_theta=1e-19 GeV approximately 1.8e-28 cm^-1, effectively massless on solar scales. Using CODATA 2022 h=6.62607015e-34 J s exact, c=299792458 m/s exact, and exact SI e=1.602176634e-19 C: k=E/(hbar*c)=5.0677307161564e-6 cm^-1. Conversion factor correct/source=2.81540595342022e22; inverse k=1.97326980459303 km; k*Rsun=352562.025923 for Rsun=695700 km. Solar-scale massless requires E much less than 2.8363803429539e-25 GeV.
Historical k would imply h=1.865507734809e-11 J s; residual versus exact CODATA h is +1.865507734809e-11 J s. This is a unit-conversion diagnostic, NOT a model prediction of h; standard uncertainty of exact h is zero and no sigma score applies.

Conditional canonical quadratic weak-field radial equation (r^2 theta')'=k^2 r^2 theta, theta(Rsun)=1.369, theta(5Rsun)=pi/2: theta(Rsun+1km)=0.824734335; theta(Rsun+10km)=0.00862004871; theta(2Rsun) effectively 0. Printed table has theta(2Rsun)=1.425. This is conditional on canonical normalization and does not falsify a different correctly specified action.
Additional exact checks: sin^2(1.369)=0.959828003836371, not printed 0.980; sin^2(1.425)=0.978893618776545, not 0.988. At r/Rsun=0.0001, correct r=69.57 km, not printed 0.070 km. Schwarzschild vacuum exterior cannot serve as a solar-interior metric.

Executed: Python/SymPy Euler-Lagrange symbolic assertion, CODATA conversion, analytic stable radial boundary solution, source table audit, two Class P figures. ALL_ASSERTIONS_PASS. No Lean execution. Current BEDROCK and subordinate state retrieved; bounded randomized SAT and HsH historical reading; broad existing Orson Mersearch receipt consulted, no new Mersearch run or shared-request mutation.
Gate: MATHEMATICALLY_CORRECTED_HISTORICAL_ACTION_ONLY; CONDITIONAL_PROFILE_INCOMPATIBLE; CODATA_REFERENCE_CONVERSION_FAIL; INDEPENDENT_HSH_PREDICTION_OPEN. No Contents, BEDROCK or recurrence changes.
