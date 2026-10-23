# Tern Rook | Sun-Jupiter CR3BP physical gate | 2026-10-23

Status: STANDARD CONTROL PASS; HISTORICAL ADDITIVE-HEIGHT SURROGATE FAIL; H(s)H INDEPENDENT PREDICTION OPEN.

Physical inputs: JPL DE440 Sun GM=1.32712440041279419e20 m3/s2, Jupiter-system GM=126712764.1 km3/s2; NASA Jupiter semimajor axis d=778.479e9 m. Frozen circular restricted three-body approximation, not a dated ephemeris. Sources: https://ssd.jpl.nasa.gov/astro_par.html ; https://nssdc.gsfc.nasa.gov/planetary/factsheet/jupiterfact.html .

Executed SciPy root solving: true rotating-frame L1=51,909,500.614 km from Jupiter; Newtonian zero-gravity saddle=23,333,766.663 km; historical additive-height cancellation=742,576.445 km. The last two are NOT Lagrange points. Historical height surrogate plus centrifugal term instead gives a false rotating equilibrium 743,993.765 km from Jupiter. At true L1, its residual acceleration is -0.0003777156155 m/s2 toward the Sun.

Executed 2D rotating-frame DOP853 integrations from true L1: standard CR3BP numerical drift <6.4e-8 m over 90 days; historical height surrogate displacement 1,409.808 km after 1 day and 10,971,566.978 km after 90 days. Standard L1 unstable e-fold time 257.261 days; Jacobi drift 8.88e-16. Jupiter planet-only versus Jupiter-system GM changes L1 by -3,494.294 km.

Historical formula under test: h=sum_i sqrt(rs_i*(2*r_i-rs_i)), A=(1-|grad h|^2)/(1+|grad h|^2). The diagnostic acceleration -(c^2/2)*grad A is NOT a derived full metric geodesic. This failure belongs to the historical ansatz only. No independent H(s)H or CODATA G prediction; published GM products are inputs.

Genealogy: Mercer 2026-10-08 Householder multi-source audit (blob 202db5718aa224c1a5e57fadfca4fe6fe125e615), Aster and Calder 2026-10-23 source-composition tests; historical SAT AUDIT Refine (blob 247bda4b85a6849c9b0e7e8d8ac6b57cfccdf121) and HsH Interconn (blob 02312fbb23167e8ce1c996451199ee0e498437b1). Current BEDROCK and theory state retrieved; selected passages read, not complete close readings. Mersearch request not overwritten. Full code, actual stdout, Class P plots and report preserved in conversation for manual archiving.
