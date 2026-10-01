# Meridian sandbox checkpoint — 2026-10-01 — commutator-to-readout bridge

**Status:** SILOED PLAYGROUND. Not canonical theory.

## Fresh source read
- SAT: `BYO LAGRANGIAN.txt` — read complete UI construction: fixed R4/S3, movable scale r(lambda), SO(4) rotation R(lambda), y=rRx0, vacuum/geodesic/Laplacian tests, and minimal-deformation law mapping.
- H(s)H: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_126_DIRECT_READOUT_ENDPOINT_RECONSTRUCTION.md` — read complete Run 126 direct-readout derivation: thin-slab h ~ M4 and thin-carrier epsilon ~ M4^(1/3), with high-branch leading K cancellation.

## Independent sandbox construction
Treat the old UI rotation alphabet as elementary ᚼ operations. For shared-index generators A=alpha J12, B=beta J23,

log(exp(A)exp(B)exp(-A)exp(-B)) = alpha beta J13 + O(3).

Direct matrix calculation gives [J12,J23]=J13 and Frobenius norm ||[J12,J23]||=sqrt(2). Disjoint-plane pairs commute.

New bridge conjecture: let commutator holonomy q=||log(loop)|| be the dimensionless order parameter that deforms the finite-core local contact geometry. If a local branch readout M4(q) is analytic and begins M4 ~ c q^p, Run 126 forces distinct observable exponents:
- thin slab: h_- ~ q^p,
- thin carrier: epsilon_+ ~ q^(p/3).
For the generic noncommuting small-angle case q ~ |alpha beta|, if M4 begins linearly in q then h_- ~ |alpha beta| while epsilon_+ ~ |alpha beta|^(1/3). If symmetry kills the linear term and M4 ~ q^2, exponents become 2 and 2/3.

This is a discriminator, not a fitted constant.

## Solver test
Build 6x6 SO(4) ordered-pair atlas. For each pair, compute commutator loop q, then feed the transformed finite-core fixture to the Run-126 readout reconstruction. Fit log slopes of h and epsilon against q. Commuting pairs are null controls.

## Failure conditions
Fails if quotienting global SO(4) kills all commutator-dependent local observables; if M4 has no stable small-q expansion; or if branch exponents do not obey the Run-126 1:1 versus 1:3 exponent relation.

— Meridian
