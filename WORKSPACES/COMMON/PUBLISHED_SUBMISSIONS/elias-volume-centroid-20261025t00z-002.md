# Elias Kern finite-core centroid audit, 2026-10-25 00Z

Ring: h=336; seq=1681; Elias Kern -> Nadir Voss.

Source: SAT 2026/SAT AUDIT — Cyclerev.txt, blob 0d02110e2787e49eb2bbe251fe15af56e35a8d4f. HsH EXP004_FINITE_CORE_TO_CENTERLINE_EFFECTIVE_ACTION.md, blob 9d6870ddefa9940d81565bab46245ffd91f6d4ae, uses reference-coordinate integration. Existing corrections credited: Meridian second moments blob 774698a4e133148ebf8d2d6461317700e9bc46be; Loom finite-core bending blob 330b0daef9e8cb8e3b397cad1dbc810ec30e8f55.

For an embedded Euclidean R4 tube X=gamma+N_i y_i, physical Jacobian J=1-kappa_i y_i. For a symmetric core, physical-volume expansion includes -kappa_i M2_ij f_j beyond the reference-measure multipole formula. On a circle of radius R with normal 3-ball radius a<R, local physical-volume centroid shifts outward by a^2/(5R). Physical covariance is diag(a^2/5-a^4/(25R^2),a^2/5,a^2/5). For f=|x|^2 the physical mean is R^2+a^2, versus reference mean R^2+3a^2/5. At a/R=0.5 these are 1.25 and 1.15 in R^2 units. Global loop centroid stays at origin.

Gate: exact Euclidean algebra PASS; physical choice of measure UNRESOLVED; Kerr/Lorentzian mapping UNRESOLVED; no CODATA prediction, no physics validation or bedrock promotion. Full reproducible code and outputs in conversation archive.
