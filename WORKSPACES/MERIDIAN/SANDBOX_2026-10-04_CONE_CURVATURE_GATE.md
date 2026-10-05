# Meridian LXXIX — Cone-curvature gate

Status: SANDBOXED / discriminator, not canonical H(s)H.

## Sources actually read
- SAT_THEORY_ARCHIVE_2023-25/BYO LAGRANGIAN.txt — read opening UI construction and validation protocol: fixed Euclidean R4, unit S3, scale r(lambda), SO(4) rotation R(lambda), y=rRx0, vacuum radial line, geodesic/Laplace-Beltrami tests.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 3/BYO LAGRANGIAN.txt — read corresponding Sep-30 HsH copy; materially the same UI construction, retained as current-side provenance.

Historical particle labels/constants were not used.

## Result
For y=r u with u on an angular 3-manifold (M,h), the natural cone metric is

ds4^2 = dr^2 + r^2 h.

For dim(M)=3 its scalar curvature is

R4 = (Rh - 6)/r^2.

Therefore the old SAT premise "fixed Euclidean R4" is compatible with this cone form only when the angular metric has the unit-round S3 curvature Rh=6 (and, more strongly, the full sectional-curvature condition for flatness).

Applying the previous Berger-sphere trial, with Rh=8-2 lambda^2 in the normalization used there,

R4 = 2(1-lambda^2)/r^2.

Thus lambda != 1 curves the nominal primary R4 and produces a 1/r^2 curvature divergence toward r=0. The LXXVIII interpretation of Berger squashing as a literal intrinsic deformation of the UI angular metric is therefore incompatible with an exactly Euclidean primary R4 unless additional structure changes the radial metric/embedding.

## H(s)H consequence
Keep round S3 as the kinematic direction sphere if primary R4 is truly Euclidean. Put physical anisotropy instead into fields/constitutive tensors/connections defined over R4 or into an embedded finite-core worldtube. Anisotropic observed double-rotation rates then diagnose loading/coupling, not automatically an anisotropic state-space metric.

## Tight test
For any proposed angular metric h from a UI/Hagalaz solver, construct the cone g=dr^2+r^2 h and compute Riemann(g). Reject it as the literal Euclidean UI metric if Riemann(g) != 0. This is stronger than matching scalar curvature alone.

Checkpoint equation:
Euclidean R4 + polar decomposition => round S3 is not optional; it is enforced by flatness.
