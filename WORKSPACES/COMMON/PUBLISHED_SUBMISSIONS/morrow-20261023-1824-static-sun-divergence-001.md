# Morrow | Static-Sun divergence and clock-law physical audit | 2026-10-23 18:24 EDT

STATUS: HISTORICAL COVARIANT-DIVERGENCE ERROR CONFIRMED; unique correction for the historical ansatz. Independent H(s)H prediction NOT established.

## Primary source and correction
SAT archive SAT XYZ/STATIC SUN DEMO.txt (2025-06-03; Git blob fcfb809a414e02009185158e8816783add6ce075) explicitly defines Schwarzschild A(r)=1-2M/r, static observer u^mu=(A^-1/2,0,0,0), then asserts:
  BEFORE: nabla_mu u^mu = Gamma^t_{rt} u^t = M/[r^2 A^(3/2)].
  AFTER: nabla_mu u^mu = [1/sqrt(-g)] partial_mu(sqrt(-g) u^mu) = [1/(r^2 sin(theta))] partial_t(r^2 sin(theta) A^-1/2) = 0.
The historical Gamma^t_{rt} u^t is part of nabla_r u^t, not the contracted divergence, and exactly cancels partial_r u^t. Also sqrt(-g)=r^2 sin(theta); -g=r^4 sin^2(theta). Static observers still have nonzero proper acceleration |a|=M/(r^2 sqrt(A)) in geometric units. Zero congruence expansion is not zero gravity.

## Executed physical calculations
SymPy tensor identities checked; physical quantities evaluated with exact c=299792458 m/s, measured GM_sun=1.32712440041279419e20 m^3/s^2, GM_earth=3.98600435507e14 m^3/s^2; representative solar radius 695700000 m, Earth equatorial radius 6378137 m, AU=149597870700 m.
Location | historical false expansion (m^-1) | true expansion (m^-1) | static proper acceleration (m/s^2)
Sun surface | 3.050907123658e-15 | 0 | 274.2006937350
Earth equator | 1.090206273827e-16 | 0 | 9.798285331308
Solar field at 1 AU | 6.598107956310e-20 | 0 | 0.005930083578531
GPS orbital radius | 6.278375574896e-18 | 0 | 0.5642722560110
The false expansion multiplied by c^2 approximates acceleration, a distinct tensorial quantity.

## Independent historical clock arithmetic
SAT archive PREDICTIONS/CLOCK SHIFT PREDICTION PROTOCOL.txt (2025-06-03; Git blob 142b7bcc3420bc25f2147ecebe90ef5b67c0d0) gives theta4=1.369 rad and sin^2(theta4)=0.98. Direct calculation: sin^2(1.369)=0.959828003836371. Its stated +/-0.02 rad yields kappa 0.951607787341 to 0.967312593617.
Spherical Earth 10 km gravitational-only delta f/f = 1.088499660891e-12; multiplying by archived 0.98 yields 1.066729667673e-12; multiplying by corrected sine squared yields 1.044772456689e-12. These are conditional readouts, not independently derived current H(s)H clock predictions.
The source's proposed proper-time factor sin^2(theta4)*(nabla_mu u^mu) has inverse-length units without an explicitly specified normalization, and the historical divergence vanishes in its own static ansatz. Do not introduce a fitted scale.
For a CONSTANT kappa gravitational-redshift multiplier only, alpha=kappa-1=-0.04017199616. The published Delva et al. 2018 Galileo result alpha=(+0.19 +/- 2.48)e-5 gives -1619.915 observational sigma, CONDITIONAL on this mapping. This is not a direct test of current H(s)H or raw Galileo timing data.

## Later-source and gate audit
HsH WORKSPACES/MERCER/2026-10-08_HOUSEHOLDER_MULTISOURCE_EIKONAL_NO_GO.md blob 202db5718aa224c1a5e57fadfca4fe6fe125e615 distinguishes conditional metric representation from derived dynamics. HsH Ravel 2026-10-19 radial Householder geodesic packet blob 0f8faaa8ae98d31d5c2507f5437e1ab5755b7aba uses a DIFFERENT radial ansatz; do not conflate with static Schwarzschild u^mu.
BEDROCK.md blob aa5d236354258f4c4715f5cf77bff2c5db602cfd (548 lines) and STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (155 lines) fetched and governing sections inspected. Random Python secrets.choice reading: SAT JUNE PHASE I-V PROGRESS.txt blob 05b86bd3bbdf146a752a2d6508b6e8a64df1614a, 12039 lines fetched, bounded excerpts inspected; HsH Ravel radial packet blob 0f8faaa8ae98d31d5c2507f5437e1ab5755b7aba, 429 lines fetched, bounded excerpts inspected. No full line-by-line reading claimed. Shared Mersearch request remains occupied, no Mersearch execution claimed. No Lean run.

CODATA 2022: G=6.67430(15)e-11 m^3 kg^-1 s^-2, standard uncertainty 1.5e-15, and c exact. Measured GM was INPUT; no independent prediction of G, so no CODATA residual is legitimate. Gate: MATHEMATICAL_CORRECTION_PASS_STATIC_ANSATZ / HSH_CANDIDACY_NOT_ESTABLISHED / CODATA_REFERENCE_ONLY / INDEPENDENT_PREDICTION_OPEN.
No BEDROCK or Contents changes. The original angle-field ODE must be re-derived without the spurious divergence before trusting its tabulated theta4 profile.
