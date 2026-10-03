# Quarry XXXVI — Exact Jacobian Spectrum and the Balanced Three-Shell Point

**Status:** sandbox / noncanonical  
**Role:** Morrow + Kestrel  
**Question:** If SAT is right as a largely standard-physics 4D map, what finite-core structure does the 30SEP26 three-shell H(s)H carrier force?

## Provenance actually read

1. **Old archive:** `SAT_THEORY_ARCHIVE_2023-25/H(s)H_TIME_RESIDUALS.txt`, blob `ff346a1953e2f0d0a60c29fc6d389b11e75e2172`. Read lines 1–900. Retained: normalization as common metrology; Spheres as local bifurcation laboratory; Graticule as residual-anisotropy detector; dimensionless natural scales; heavy math should be performed after normalization. No historical fitted constants imported.

2. **Current H(s)H:** `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/[[H(s)H THREE SPHERES first runs - init]]/Spherestest tests/Spherestest src/hsh_spheres/geometry.py`, blob `269854b965563cae07e1b9ab659cef6b3083ef83`. Read complete file. Retained exact shell definition, Jacobian/SVD machinery, pseudoinverse forced velocity, and equal-three-S3 carrier rho=sqrt(R^2-d^2/3).

## New derivation

For three equal S3 shells of radius R with equilateral center separation d, at any point on their common S1 carrier the 3x4 constraint Jacobian has Gram matrix

[
JJ^T=4egin{pmatrix}
R^2&q&q\\
q&R^2&q\\
q&q&R^2
end{pmatrix},
qquad q=R^2-d^2/2.
]

Therefore the singular values are exactly

[
sigma_1=sigma_2=sqrt2,d,qquad
sigma_3=2sqrt3,ho,
qquad
ho=sqrt{R^2-d^2/3}.
]

A direct numerical SVD sweep agreed with these expressions to max absolute error (8.88	imes10^{-16}).

### New balanced point

All three nonzero singular values become equal when

[
sqrt2,d=2sqrt3,ho.
]

Using the carrier relation gives

[
oxed{d=sqrt2,R},qquad
oxed{ho=R/sqrt3},
]

and then

[
oxed{sigma_1=sigma_2=sigma_3=2R},qquad
oxed{kappa(J)=1}.
]

Thus the three-shell carrier contains a unique dimensionless point at which the constraint map is perfectly conditioned/isotropic. This is distinct from the carrier-collapse boundary (d=sqrt3R).

For (d>sqrt2R), the soft singular direction is the collapse mode (2sqrt3ho); it vanishes at (d=sqrt3R). Hence

[
|J^+|_2=1/sigma_{min}
=rac{1}{2sqrt3,ho}
]

in the collapse-side regime, analytically proving the inverse-square-root forced-response amplification conjectured in Quarry XXXV.

## Sandbox inference

The old normalization/residual-anisotropy program and the new shell solver meet naturally here: (d/R=sqrt2) is not fitted. It is the point where the normalized constraint response has no preferred singular direction. A possible H(s)H interpretation is that this balanced point is a natural local reference state, while departure from it supplies a dimensionless anisotropy/load variable.

Candidate:
[
mathcal A_J=logkappa(J),
]
with (mathcal A_J=0) exactly at (d/R=sqrt2) and (mathcal A_J	oinfty) at carrier collapse.

## Failure condition

This exact spectrum uses equal spherical shells and equilateral centers. If generic unequal/ellipsoidal shells do not retain a nearby minimum of (kappa(J)), the balanced point is a symmetry artifact rather than a robust H(s)H organizing principle.

## Tight next test

Use the existing general `QuadraticShell` machinery to perturb radii, shape matrices, and centers. Continuation-track the minimum of (kappa(J)) and ask whether a unique near-isotropic locus persists. Then attach a transported daughter fiber and test whether holonomy/reconnection events cluster on the high-(mathcal A_J) side rather than around the balanced locus.
