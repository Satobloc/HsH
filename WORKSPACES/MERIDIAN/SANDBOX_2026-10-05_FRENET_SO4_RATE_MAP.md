# Meridian XCV — 4D Frenet → canonical SO(4) rate map

Status: SANDBOXED. No physical claim.

## Sources read
- `SAT_THEORY_ARCHIVE_2023-25/H(s)H MATH TO DO.txt`: substantial read through the solver-stack and 4D trajectory-invariant section. Extracted the explicit generalized Euclidean 4D Frenet generator with three curvatures kappa1,kappa2,kappa3 and the stated need to generalize SO(3) moving-frame machinery to 4x4 frames.
- `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/PRECLOSE_NOTE_ROUNDUP.txt`: substantial read of the solver-ecology roundup, especially the double-rotation/two-rate recurrence solver, torus/frame-history solver, noncommuting SO(4) engine, metric-induction solver, and the warning that solver equivalences are not yet established.

Historical constants and particle labels were not used as targets.

## New derivation
For the arclength-parametrized 4D Frenet frame, use the antisymmetric generator

Omega_F =
[[0,k1,0,0],
 [-k1,0,k2,0],
 [0,-k2,0,k3],
 [0,0,-k3,0]].

Every so(4) generator has two canonical rates alpha,beta. Its invariants are

S = -1/2 tr(Omega_F^2) = k1^2+k2^2+k3^2,
P = Pf(Omega_F) = k1*k3.

Therefore

alpha^2,beta^2 = (S +/- sqrt(S^2-4P^2))/2,

so

alpha^2+beta^2 = k1^2+k2^2+k3^2,
|alpha beta| = |k1 k3|.

A blind numerical matrix fixture at (k1,k2,k3)=(0.8,1.1,0.55) gave eigenvalue rates
(1.4347294469973244, 0.3066780297294761), while the invariant formulas gave
(1.434729446997324, 0.306678029729476), with alpha beta=0.44=|k1 k3|.

## Strong consequence
The equal-rate/isoclinic condition alpha=beta requires

S^2=4P^2.

But S=k1^2+k2^2+k3^2 >= k1^2+k3^2 >= 2|k1 k3|.

Equality is possible iff

k2=0 and |k1|=|k3|.

Thus a generic nondegenerate 4D Frenet curve is NOT isoclinic. Any H(s)H ground-state rule demanding equal canonical SO(4) rates imposes a very restrictive curve-geometry condition, rather than following automatically from 4D rotation.

## Interpretation / proposed equivalence map
The old 4D trajectory-invariant representation and the newer two-rate solver are not independent parameterizations at the local frame-generator level:

(k1,k2,k3) -> Omega_F -> (S,P) -> (alpha,beta).

But the map is many-to-one. Two canonical rates cannot reconstruct all three Frenet curvatures. In particular, k2 enters S but not P. Therefore the two-rate Whirligig representation loses local curve information unless supplemented by at least one additional invariant/typed datum.

## Failure/discriminator
For any sampled 4D curve:
1. reconstruct kappa1,kappa2,kappa3 from its moving Frenet frame;
2. calculate alpha,beta from the formulas above;
3. independently recover alpha,beta from the double-rotation recurrence/eigenvalue solver.

If the rates disagree after parameterization/unit normalization, the claimed local equivalence fails.

If an alleged equal-rate configuration has kappa2 != 0 or |kappa1| != |kappa3| in a valid Frenet gauge, it cannot be an equal-rate Frenet generator.

## Next solver
Construct constant-(k1,k2,k3) generalized helices by integrating the 4D Frenet ODE, then feed only sampled positions to the existing two-rate recurrence solver. Measure where it recovers the predicted alpha,beta and where sampling/parameterization destroys identifiability. Also classify what geometric family survives the equal-rate condition k2=0, |k1|=|k3|.

## Compact checkpoint
H(s)H's two-rate rotational description may be a spectral compression of ordinary 4D Frenet transport:

curve geometry (3 Frenet curvatures) -> local SO(4) generator -> 2 canonical rotation rates.

That compression is exact forward but not invertible.
