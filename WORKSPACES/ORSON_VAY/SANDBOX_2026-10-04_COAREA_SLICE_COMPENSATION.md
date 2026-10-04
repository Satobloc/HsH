# Orson Vay sandbox — coarea compensation in 4D tube readout

Status: speculative sandbox; not canonical SAT/H(s)H.

## Sources actually read
1. `SAT_THEORY_ARCHIVE_2023-25/Dim.txt` — read lines 1–700 (available content). Retained: finite-width 4D tube intersecting a 3D resolving wavefront; slice elongation law with grazing angle. Rejected: historical constants, particle labels, lattice claims, and claims that elongated footprint by itself implies weak interaction.
2. `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/RUN_144_RECURRENCE_AND_PARTICLE_ZOO_DIAGNOSTIC.md` — read complete. Retained: source-derived near-aligned neutrino representative, explicit helix geometry, and warning that particle labels are not yet uniquely classified by topology. No particle label is used as a target below.

## Independent construction
Let a straight 4D tube of radius R have unit tangent T, and let the resolving 3-plane have unit normal n. Define mu=|n·T|. For a transverse normal hit mu=1. For a grazing hit mu→0.

The exact intersection of the tube with the resolving 3-plane is a 3D ellipsoid with semiaxes

(R, R, R/mu),

hence

V3(mu) = (4π/3) R^3 / mu.

But centerline arclength ds advances through the normal resolving coordinate by

dσ = mu ds.

Therefore

V3(mu) dσ = (4π/3) R^3 ds,

or

V3(mu) (dσ/ds) = (4π/3) R^3,

independent of tilt.

This is the elementary coarea/Jacobian compensation: the apparent 3D footprint diverges as 1/mu exactly while its normal sweep rate falls as mu.

## Consequence
A large elongated slice is not by itself evidence for a larger amount of carrier, stronger coupling, weaker coupling, or greater interaction probability. Any interaction/readout law built from instantaneous slice volume alone is missing the corresponding crossing Jacobian unless there is an additional physical reason for residence time or anisotropic coupling to matter.

This is especially important for old SAT language that treated a grazing 'javelin' footprint as intrinsically stealthy. Geometry alone does not establish that conclusion.

## Discriminator
Compare candidate response laws under a tilt sweep:
A. snapshot law: Q ∝ V3 ∝ 1/mu;
B. flux/coarea law: Q ∝ V3 mu = constant;
C. anisotropic material law: Q ∝ V3 mu F(T, frame, target), with nontrivial residual orientation dependence.

A pure projection artifact must obey B after matched normalization. Any residual tilt dependence must come from actual anisotropic interaction physics, finite target geometry, finite tube length, frame structure, or dynamics, not from slice elongation itself.

## Failure conditions
The exact cancellation fails or is modified for finite-length tubes near endpoints, curved centerlines over the footprint scale, nonuniform transverse profiles, time-dependent resolving surfaces, or interactions that couple to orientation/frame rather than 4-volume flux. Those corrections should be calculated explicitly.

## Solver test
Generate a finite-core 4D tube, intersect it with a family of 3-planes over mu, numerically measure V3, and separately measure dσ/ds. Verify V3∝1/mu and V3 dσ/ds=constant away from endpoint/curvature corrections. Then add a typed anisotropic coupling and measure only the residual after dividing out the coarea factor.

## Carry-forward
Before interpreting an enlarged or elongated 3D intersection as new physics, calculate the coarea Jacobian. A shadow can grow because the sweep slows, with no change in the amount of 4D carrier crossing the resolver.
