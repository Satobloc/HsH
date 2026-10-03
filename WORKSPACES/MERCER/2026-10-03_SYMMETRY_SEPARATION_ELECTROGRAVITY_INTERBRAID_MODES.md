# Mercer Sandbox — Symmetry Separation of Electrogravity and Interbraid Modes

**Date:** 2026-10-03
**Status:** SANDBOX / NONCANONICAL
**Role:** Mercer

## Sources actually read

### Old SAT
`SAT_THEORY_ARCHIVE_2023-25/ChatNoteGMPT.txt`, lines 1–700, substantially.

Used only the clean working baseline stated in the file:
- electrogravity = filament–resolving-sheet response;
- interbraid = direct filament–filament topological/dynamical interaction;
- order is internal recursion, degree is relational braiding.
Historical fitted constants and later overconfident claims in the file were not used.

### Current H(s)H / September-30 dump
`HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/ST_MESON_REINTERPRETATION.txt`, read completely.

This is an old visualization script representing a two-member composite by two phase-opposed helical traces. It contains no force derivation. I use only the structural prompt: test a two-carrier relative coordinate rather than importing its particle labels.

## Independent construction

Take two identical finite carriers x1,x2 coupled to one local timesheet displacement h. Use the minimal reciprocal quadratic Lagrangian

L = sum_i [ mf/2 xdot_i^2 - Tf/2 (x_i')^2 - Bf/2 (x_i'')^2 - g/2 (x_i-h)^2 ]
    + ms/2 hdot^2 - Ts/2 (h')^2 - Bs/2 (h'')^2
    - J/2 (x1-x2)^2.

g is filament-sheet coupling. J is direct filament-filament coupling.

Define symmetry coordinates

x+ = (x1+x2)/sqrt(2),  x- = (x1-x2)/sqrt(2).

The quadratic action block-diagonalizes exactly.

### Antisymmetric / interfilament sector

The sheet cancels out of x- except for the individual filament-sheet restoring term:

omega_-^2(k) = [Tf k^2 + Bf k^4 + g + 2J]/mf.

Therefore

omega_IB^2(0) = (g+2J)/mf.

Changing J moves this branch only.

### Symmetric / sheet sector

The (x+,h) block has

Af = g + Tf k^2 + Bf k^4,
As = 2g + Ts k^2 + Bs k^4,

and determinant

(Af-mf omega^2)(As-ms omega^2) - 2g^2 = 0.

At k=0 its two eigenvalues are

omega_common^2 = 0,

omega_FS^2 = g(1/mf + 2/ms).

The gapless mode is x1=x2=h: common translation of the whole local composite.

The gapped symmetric mode is filament-sheet relative motion.

Thus three mechanically distinct channels appear without assigning three microscopic forces:

1. common filament+sheet mode;
2. symmetric filament-sheet relative mode;
3. antisymmetric filament-filament relative mode.

## Parameter fingerprint

At k=0,

d omega_IB^2 / dJ = 2/mf,

while both symmetric-sector eigenvalues are exactly independent of J.

Conversely varying g shifts both relative sectors but leaves the common translational zero protected.

This gives a clean numerical sector-identification test: perturb J and g independently and classify modes by their derivatives.

## Arbitrary scripted fixture

mf=1, ms=4, Tf=3, Ts=0.8, Bf=0.12, Bs=0.5, g=2, J=0.7.

Computed k=0 values:

omega_common^2 ~ 0 (numerical -2.2e-16),
omega_FS^2 = 3.0,
omega_IB^2 = 3.4.

No historical SAT constants or particle data were targeted.

## Interpretation boundary

Source fact: SAT/H(s)H currently distinguishes filament-sheet and filament-filament interaction sectors.

Inference: the smallest reciprocal two-carrier mechanics should respect exchange symmetry.

New sandbox conjecture: Electrogravity and Interbraid may be normal-mode sectors of one coupled mechanical network rather than fundamentally separate force primitives.

This is not a claim that these modes reproduce electromagnetism, gravity, strong, or weak physics.

## Failure conditions

Kill or revise this architecture if:
- direct filament coupling J appreciably shifts the symmetric sheet modes in a symmetric two-carrier solver without another coupling term explaining it;
- the common translation acquires a gap absent explicit external pinning;
- finite-core geometry destroys the exchange-symmetry block diagonalization in the symmetric limit;
- realistic H(s)H interaction requires irreducibly nonlocal/topological terms that cannot be represented as a controlled extension of this local quadratic limit.

## Next test

Generalize to N carriers coupled to one sheet. For permutation-symmetric pair coupling, expect one center-of-mass/sheet sector plus N-1 degenerate relative-carrier modes. Then deliberately break symmetry by geometry/braid adjacency and measure how that degeneracy splits. This could turn braid topology into a calculable spectral fingerprint rather than a particle label.

— Mercer
