# Mercer sandbox: relativistic curvature of worldtubes (2026-10-08)

**Status:** sandboxed kinematic calculation, not canonical theory.

**Read:** SAT archive `2026/SAT MATH — BACKBONE.txt` (F1–F3, later rapidity MVM); HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT4D_MATHEMATICAL_BACKBONE.txt` (both complete retrospective summaries); current HsH `🔑/B_IS_INVERSE_REFRACTIVE_INDEX.md` and `🔑/O_EFF_IS_THE_REPRESENTATIONAL_DEFAULT.md`. Also read the controlling Common onboarding and HSH_RESOURCES reference/War Room routing surfaces. External resources not promoted to theory authority; quarantined material not entered.

**Question:** If bending is acceleration, what curvature must a 4D representation measure?

In a flat Minkowski chart X(t)=(ct,x(t)), with beta=v/c and gamma=(1-beta²)^(-1/2), distinguish the Euclidean curvature of the coordinate drawing (kappa_E) from Lorentzian proper curvature (kappa_M), both 1/length.

kappa_E = sqrt[(c²+v²)|a|²-(v·a)²]/(c²+v²)^(3/2).
kappa_M = gamma² sqrt[gamma² a_parallel²+a_perp²]/c².

For longitudinal acceleration: kappa_E/kappa_M=[(1-beta²)/(1+beta²)]^(3/2).
For transverse acceleration: kappa_E/kappa_M=(1-beta²)/(1+beta²).

At beta=.9, the ratios are .034010463 and .104972376 respectively; correction factors are 29.4027 and 9.52632. At beta=.99, ratios are .001007509 and .010049997. A five-point finite-difference solver checked the constant-proper-acceleration hyperbola and uniform circle at beta=.1,.5,.9 within 5e-7.

In the chart, tangent angle theta_E=atan(beta), whereas rapidity=atanh(beta). The former never exceeds 45 degrees for a timelike worldline. Neither should be silently identified with historical theta_4.

**Inference:** The minimal standard-physics interpretation of bending as acceleration is proper curvature, with proper force F=m*c²*kappa_M. A constitutive worldtube B, if any, remains distinct from this metric/coordinate correction. Historical 3/(4pi) and optical kink numbers were not targets.

**Failure condition:** A model using raw Euclidean drawing curvature with one speed/direction-independent stiffness as physical inertia fails Lorentz covariance.

**Next test:** Hold proper acceleration and mass fixed while comparing longitudinal and transverse trajectories at different boosts. Require proper force to be invariant, then independently test bundle-dependent B.

**Provenance links:**
- https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/2026/SAT%20MATH%20%E2%80%94%20BACKBONE.txt
- https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT4D_MATHEMATICAL_BACKBONE.txt
- https://github.com/Satobloc/HsH/blob/main/%F0%9F%94%91/B_IS_INVERSE_REFRACTIVE_INDEX.md

Reproducible script and two precision geometry plots were generated in the task thread.
