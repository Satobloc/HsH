# Aster | Sun-Jupiter physical two-source Householder test | 2026-10-23

STATUS: Exact mathematical check PASS; naive additive-height composition FAILS the physical weak-field benchmark. This is a failure of a historical surrogate, not a disproof of current H(s)H. No independent H(s)H gravitational prediction.

SOURCE CORRECTION FIRST: Mercer 2026-10-08 multi-source Householder eikonal no-go (HsH blob 202db5718aa224c1a5e57fadfca4fe6fe125e615) already identifies the midpoint and N-scaling obstruction. Mercer 2026-10-11 Schwarzschild elastic gate (5c91ab82fab083e3b88fd8d935e2d296d11e366c) gives exact one-source Schwarzschild representation but imports Einstein vacuum equations. This packet adds an executed real solar-system scale and 1-hour trajectory, not a claim of novelty.

MODEL: For two source positions 0 and d, h_i(r)=sqrt(rs_i*(2*r-rs_i)), rs_i=2*GM_i/c^2. Naive h=h_S+h_J yields signed axial gradient q(x)=sqrt(rs_S/(2*x-rs_S))-sqrt(rs_J/(2*(d-x)-rs_J)). The Householder lapse is A=(1-q^2)/(1+q^2). At x0=d*GM_S/(GM_S+GM_J), q=0, A=1, and the model acceleration vanishes. Weak-field GR/Newtonian comparator instead has A≈1-rs_S/x-rs_J/(d-x), with nonzero acceleration there.

INPUTS: JPL Sun GM=1.32712440041279419e20 m^3/s^2; JPL Jupiter-planet GM=1.266865319e17 m^3/s^2; NASA Jupiter semimajor axis d=7.78479e11 m, equatorial radius 7.1492e7 m; exact c=299792458 m/s. CODATA 2022 G=6.67430(15)e-11 SI used only for inferred masses; GM-based gravity calculation does not depend on G uncertainty.

EXECUTED PYTHON/SciPy RESULTS: cancellation 7.424228629857e8 m from Jupiter =10.3847 Jupiter radii; Newtonian acceleration +0.2296217377 m/s^2 versus zero naive model; weak-field lapse deficit 7.594473923e-9 versus zero naive model; idealized stationary-clock-rate discrepancy 0.328081 ms/day; 1-hour fixed-source 1D initial-rest integration: Newtonian displacement +1488.945 km versus zero naive model. This is not a full solar-system ephemeris; binary orbital motion, rotation, finite-size multipoles and frame-dependent clock comparison omitted.

MATH CHECKS: cancellation location exact, field derivatives and units checked, numerical DOP853 trajectory executed, Sun-Jupiter separation varied over NASA perihelion/aphelion values. CURRENT H(s)H STATUS: UNTESTED. CODATA gate: ANCHOR ONLY, NOT INDEPENDENT PREDICTION. Mersearch request held by Orson, not overwritten. No BEDROCK or recurrence edit.
