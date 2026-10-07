# Mercer sandbox — Known 3D oscillators lifted to 4D helices and downprojected

Date: 2026-10-07
Status: SANDBOX / calculational fixture, not canonical theory.

## Controlling method
- Start from standard-physics trajectories.
- Lift periodic 3D motion into Minkowski spacetime with w = ct.
- Treat the resulting 4D helix as geometry.
- Downproject only by explicitly defined projection/intersection operations.
- Do not introduce new force laws or fitted SAT constants.

## Sources actually read this run
1. SAT_THEORY_ARCHIVE_2023-25/2026/SAT++.txt, lines 1–900 requested/read. Relevant recovered idea: internal periodicity implies a helical worldline representation; historical generated claims and numerical constants not imported.
2. HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH ARCHITECTING.txt, lines 1–1100 requested/read. Relevant Nathan construction: assume Minkowski grammar + standard physics, map system in 4D, discard labels, describe geometry, do not fill gaps before mapping.

Current onboarding/front-door/reference-desk/War-Room/tool-routing controls were reviewed first. PRIOR_ART remained quarantined.

## Exact lift for circular 3D motion
For radius R and period T,

X(t) = (R cos(2πt/T), R sin(2πt/T), 0, ct).

Define u = 2πt/T and b = cT/(2π):

X(u) = (R cos u, R sin u, 0, bu).

Thus:
- 4D pitch per revolution: P4 = cT
- helix radius: R
- pitch parameter: b = cT/(2π)
- ordinary orbital speed: v = 2πR/T
- dimensionless tightness: η = R/b = v/c = β
- tangent tilt from w-axis: α = arctan β
- Euclidean helix curvature: κ = R/(R²+b²)
- Euclidean helix torsion: τ = b/(R²+b²)

For noncircular oscillators, replace R by the actual 3D trajectory r(t); the 4D lift remains X(t)=(r(t),ct).

## Initial known-system set
Approximate circular systems used only as first fixtures:

| system | R (m) | T (s) | P4=cT (m) | β=v/c | tilt α |
|---|---:|---:|---:|---:|---:|
| Earth orbit | 1.495978707e11 | 3.15581495e7 | 9.461e15 | 9.94e-5 | 0.00569° |
| Moon orbit | 3.844e8 | 2.36059e6 | 7.077e14 | 3.41e-6 | 0.000195° |
| Jupiter orbit | 7.7857e11 | 3.743e8 | 1.122e17 | 4.36e-5 | 0.00250° |
| Mercury orbit | 5.790905e10 | 7.6005e6 | 2.279e15 | 1.596e-4 | 0.00914° |
| Earth equatorial rotation | 6.378137e6 | 8.6164e4 | 2.583e13 | 1.55e-6 | 0.0000888° |
| Jupiter equatorial rotation | 7.1492e7 | 3.573e4 | 1.071e13 | 4.19e-5 | 0.00240° |
| 1 cm rotor, 1 Hz | 1e-2 | 1 | 2.9979e8 | 2.10e-10 | 1.20e-8° |
| 1 cm rotor, 100 Hz | 1e-2 | 1e-2 | 2.9979e6 | 2.10e-8 | 1.20e-6° |

These show the expected extreme stretching of ordinary macroscopic Minkowski helices.

## Downprojection / shadow operators
Three distinct operations must not be conflated.

### A. Orthogonal shadow along w
π_w : (x,y,z,w) -> (x,y,z)

For the circular helix:
π_w[X(t)] = (R cos ωt, R sin ωt, 0).

The complete 4D helix casts a circular 3D shadow.

### B. Side shadow onto one spatial axis + w
π_xw[X(t)] = (R cos ωt, ct).

This is a sinusoid in the x-w plane:
x(w) = R cos(2πw/P4).

Thus the same 4D helix has:
- circular end-on shadow
- sinusoidal side-on shadow
- helical full form.

This is exact and scale-independent.

### C. Instantaneous 3D intersection at fixed w
w = w0 intersects a single point of the centerline for a point particle:
(x,y,z) = r(t0), with t0=w0/c.

For a finite worldtube, the fixed-w intersection is its finite 3D cross-section/configuration at that instant.

Projection and intersection are different operations.

## First discriminator
If the SAT geometric analogy is only visual, the useful invariants should stop at ordinary projection identities.

If it has deeper calculational value, dimensionless relations such as:
β = 2πR/P4,
κR = β²/(1+β²),
τR = β/(1+β²)
should organize physically relevant comparisons across systems without fitted scale constants.

## Immediate next test
Build a precision Class-P script that:
1. accepts any known periodic 3D trajectory r(t);
2. lifts to X(t)=(r(t),ct);
3. computes P4, β(t), curvature/torsion where defined;
4. renders the 4D helix via 3D coordinate projections;
5. renders end-on and side-on shadows;
6. compares systems after normalization by R and P4.

Then extend beyond circular fixtures:
- eccentric planetary orbit
- harmonic oscillator
- binary orbit
- precessing/rotating rigid body
- pulsar rotation
- charged-particle cyclotron motion
- only then particle internal-frequency proxies, with provenance and interpretation explicitly separated from measured spatial orbit geometry.

Failure condition: if normalized shadows/invariants provide no structure beyond trivial re-expression of known kinematics, retain as visualization/wayfinding only and do not promote explanatory significance.
