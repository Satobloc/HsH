# Meridian LXXIII — Hopf-fiber candidate for the 3+3 / preferred-flow bridge

Status: SANDBOXED. Nothing here is a physical claim.

## Sources actually read
- SAT_THEORY_ARCHIVE_2023-25/SAT-TO-STANDARD 1.txt, lines 1–1000: SAT↔standard dictionary, especially filament/worldtube, helical/hyperhelical worldlines, holonomy, time-flow u, loop space, relative holonomy, sphere-in-torus/Hopf-fibration adjacency.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT-Y 4D.txt, lines 1–1000: early 4D mapper conversation, three-filament composite helix, moving time-surface intersections, coarse/fine scale mapping. Particle/flavor assignments were not used.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/QWEFWF.txt, lines 1–900: prediction list sampled only after construction; no listed target or tolerance was used.

## Construction
Metric induction puts the preferred-flow state on S^3: u·u=1. S^3 also admits the Hopf fibration S^1 -> S^3 -> S^2. A canonical pair of fibers is
C1(a)=(cos a,sin a,0,0),
C2(b)=(0,0,cos b,sin b).
They are disjoint great circles, C1·C2=0 for every pair of points, hence every cross-pair has geodesic separation pi/2. Under stereographic projection they are Hopf-linked.

## Sandbox inference
This supplies a concrete equivalence candidate between two live languages:
(1) preferred-flow / E4 language: u is one point of S^3;
(2) 3+3 / nested-shell language: a circle fiber (phase) over an S^2 direction.
Thus a local H(s)H state may be coordinatized as base direction n in S^2 plus fiber phase psi in S^1, without adding dimensions. The 'extra' angular coordinate is fiber structure inside the same S^3.

A standard Hopf map in complex coordinates z1=u0+i u1, z2=u2+i u3 is
h(u)=(2 Re(z1 conj z2), 2 Im(z1 conj z2), |z1|^2-|z2|^2) in S^2.
Common phase (z1,z2)->e^{i psi}(z1,z2) leaves h invariant. This is an exact projection degeneracy: many S^3 states share one S^2 base state.

## Discriminator
If a proposed 3+3 description is genuinely equivalent to the E4 preferred-flow state, reconstruct u(s), Hopf-project it to n(s), and check whether the missing coordinate is exactly a U(1) fiber phase. A loop may close in n while return in psi has nonzero winding. That is a clean candidate for 'hidden' phase/holonomy without another spatial dimension.

Failure: generic double-shell variables need not realize the Hopf bundle. If no gauge/fiber redundancy is found, this equivalence map is false. Also Hopf linking alone supplies topology, not forces, mass, or particle identity.

## Solver test
For archived 3+3 fixtures: fit u(s) in S^3; compute n=h(u); choose a local section and unwrap fiber phase psi(s). Compare closure classes:
- u closed / n closed / Delta psi=2 pi k;
- n closed but u not closed;
- neither closed.
Test whether archived helix->superhelix transformations preserve Hopf linking number while changing fiber winding.

Visual generated in task thread: meridian_lxxiii_hopf_fibers.png.
