# CODE 000 | Calder | 2026-10-24T23Z | 4D Frenet correction

Task: calc48-20261024T23Z-calder-frenet4d-001
Status: INTERNALLY_CHECKED. Historical 4D torsion expression REJECTED as a Frenet curvature; physical H(s)H application UNRESOLVED. No BEDROCK promotion.

Historical source: Satobloc/HsH, DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, section 3.2, Git blob 02312fbb23167e8ce1c996451199ee0e498437b1. Historical SAT cross-source: Satobloc/SAT_THEORY_ARCHIVE_2023-25, 2026/SAT MATH — BACKBONE.txt, blob 1854995be3311f565739f2be64269cbb0385a82f. Both are later compilations; earliest primary dated derivation not authenticated.

Source formulas: kappa_old=||X''||; tau_old=det(X',X'',X''',X'''')/||X''||^2. Prime denotes derivative with respect to lambda.

Established Euclidean R4 curve geometry (v=||X'||; W2=||X' wedge X''||; W3=||X' wedge X'' wedge X'''||; D4=det(X',X'',X''',X'''')):

kappa1=W2/v^3; kappa2=W3/W2^2; signed kappa3=D4*W2/(v*W3^2).

These formulas require a regular curve and nonzero denominators; kappa3 is undefined when W3=0. For arclength lambda=s, kappa_old=kappa1 is valid, but tau_old=kappa1*kappa2^2*kappa3, NOT a Frenet torsion. In dimensionful arclength units, tau_old has dimension length^-4 rather than length^-1. The determinant detects the third 4D curvature and vanishes on all curves contained in a 3D affine subspace, including a nonplanar 3D helix with nonzero second curvature.

Exact fixture X(t)=(cos t,sin t,cos 2t,sin 2t) at t=0: speed sqrt(5), W2=sqrt(85), W3=6sqrt(17), D4=72; kappa1=sqrt(17)/5, kappa2=6sqrt(17)/85, kappa3=2sqrt(17)/17. Old kappa=sqrt(17), old tau=72/17. Under t=2u+u^2/10 at u=0, all three corrected Frenet curvatures are unchanged, while old kappa=sqrt(6805)/5 and old tau=368640/1361. Under arclength s=sqrt(5)t, old kappa becomes correct, but old tau=72/2125 and remains different from kappa3.

Control: X(t)=(cos t,sin t,t,0) has kappa1=kappa2=1/2, kappa3=0, while tau_old=0; hence old tau cannot represent ordinary 3D torsion. Reparameterizing a unit circle by t=2u multiplies the legacy integral (1/2)*integral ||X''||^2 dparameter by 8, while the geometric bending integral (1/2)*integral kappa1^2 ds remains pi in both parameterizations.

Correction scope: use arclength derivatives for historical bending terms, or invariant curvature and measure kappa1^2 ds; use kappa2 for ordinary torsion and kappa3 for genuine 4D third-curvature/handedness. This is an established mathematical correction, NOT a new physical H(s)H mechanism or fitted parameter. No eligible CODATA observable has yet been derived from these geometry-only fixtures.

Evidence: exact SymPy calculations, reparameterization and embedded-helix controls; Python script and complete numerical JSON preserved in calculation-turn artifacts. No restricted sources or personal records included. Public-safe text only.
