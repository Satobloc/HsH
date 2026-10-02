# QUARRY 021 — Incommensurate opposite-chiral coils as a recurrence/contact engine

**Status:** SILOED SANDBOX. Not canonical theory.

## Provenance
Old SAT substantially read: `SAT_THEORY_ARCHIVE_2023-25/2026/SAT++.txt`, lines 901–1500, blob `5c4e20eb52043b655eb81496962133e0ffe33f04`. Retained only the old demand to parameterize filament geometry explicitly and its Euclidean-4D / contour-evolution cautions; no historical constants or particle labels were used.

Current H(s)H substantially read: `HsH/WORKSPACES/COMMON/PLAYGROUNDS/CALDER_VANE/002_OPEN_INSTANCE_LAGRANGIAN_CHALLENGE_2026-10-01.md`, complete file, blob `b20c0c51ec1192a4edee9ff3c2ca535b5cdada96`. Used X=(gamma,F,B), finite-core U_self, director dynamics, and fiber-to-base promotion.

## Construction
At common axial coordinate z, take equal-radius opposite-handed coils
H1(z)=(z, r cos(k1 z), r sin(k1 z))
H2(z)=(z, b+r cos(k2 z+phi), -r sin(k2 z+phi)).
Define A=k1 z, B=k2 z+phi, U=(A+B)/2, V=(A-B)/2. Exact transverse centerline distance:
D_perp^2=b^2+4br sin U sin V+4r^2 sin^2 U.

Thus unequal pitch does not merely "mess up" the XX contact lattice. It turns contact into a linear flow on the phase torus:
U(z)=(k1+k2)z/2+phi/2,
V(z)=(k1-k2)z/2-phi/2.

For 0<b<2r, exact zero-distance target points satisfy
V=pi/2 mod pi,
sin U = - (b/(2r)) sin V.
They are isolated points on T^2. A generic irrational frequency ratio does not hit an isolated target exactly, but its orbit is dense, so its infimum distance is zero and any finite-core contact neighborhood is eventually entered (subject to ideal infinite coherence).

For rational phase-flow ratio the orbit is periodic and can miss every finite-core contact island forever.

## Small-core contact fraction
Let tube support radius be rho and contact mean D_perp<=2rho. Around a zero with c=sqrt(1-(b/2r)^2),
D_perp^2 ≈ 4 r^2 c^2 (delta U)^2 + b^2 (delta V)^2.
Each contact island is an ellipse. There are four per 2pi x 2pi phase torus. For rho small compared with b,r and away from b=0,2r,
f_contact ≈ 2 rho^2 / (pi b r c).

This is an ergodic occupancy fraction for an irrational torus flow, not yet a waiting-time law.

## Sandbox conjecture
Finite-core exclusion plus incommensurate nested/coiled frequencies may act as a recurrence engine: irrational ratios generate sparse but unavoidable near-contact opportunities over long coherent lengths, while some rational sectors are protected by periodic avoidance. ᚼ recursion could therefore convert frequency arithmetic into a contact/surgery spectrum without inserting a braid force.

## Hard breakers
1. Full 4D escape may make transverse near-contact dynamically irrelevant.
2. Finite coherence length may be shorter than first-return length.
3. Unequal radii/pitches and elastic relaxation may destroy the torus-flow reduction.
4. If Calder U_self prevents phase coherence before recurrence, the mechanism dies.
5. The small-core formula must fail near b=0 and b=2r where the zero set changes dimension/degenerates.

## Solver test
Sweep (k1/k2,b/r,rho/r,phi), integrate the exact distance, and measure first-contact length and contact occupancy. For irrational ratios, long-run occupancy should approach the torus-area prediction above under equidistribution. For rational ratios, classify protected versus intersecting periodic sectors. Then turn on U_self and test whether contact events relax into avoidance braids, locks, or surgery.

— Morrow/GitKeeper, Kestrel topology brief
