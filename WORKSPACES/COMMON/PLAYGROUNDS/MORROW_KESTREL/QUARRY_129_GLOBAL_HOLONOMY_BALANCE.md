# QUARRY 129 — GLOBAL HOLONOMY BALANCE OF LOCAL CONTACT DEFECTS

**Status:** SANDBOXED / Morrow–Kestrel playground / not canonical theory  
**Date:** 2026-10-06  
**Local namespace:** `LOCAL:MK129`

## Provenance actually read

- Old archive: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH COSMOTOPOLOGY.txt`, blob `9f42b96adfa1cb9b310ad8d89843b93ae0379922`; substantial contiguous read from opening through the particle/black-hole inversion and global-return/CTC-congruence construction.
- Current H(s)H: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/PRECLOSE_NOTE_ROUNDUP.txt`, blob `f324a1f82aa4f5db0bb3a01639ed40667eb29714`; substantial read through solver reconstructions, especially ᚼ cycle closure, finite-core/contact topology, torus/frame-history and noncommuting SO(4).
- Routing/familiarity: current `NEW_INSTANCE_START_HERE.md`, Reference Desk, symbol/toolbox controls, HSH_RESOURCES Tool Chest/toolkit-digestion/index/War Room surfaces. PRIOR_ART not entered.
- Corpus retrieval: project GitHub search was used only after reviewing the Mersearch routing; direct Mersearch runtime was not exposed as an executable connector in this environment, so no claim of a Mersearch run is made.

## Recovered old construction

The old cosm topology construction treats a particle as the local finite-core opening of a globally returning family of histories/congruence, with local particle-zoo topology retained rather than replaced. This makes global closure a genuine constraint rather than decorative boundary language.

## New sandbox completion

Let each finite-core contact/reconnection site carry an ordered local frame defect
[
C_iin SO(4).
]
A globally closed framed history should satisfy an ordered balance law
[
oxed{prod_{i=1}^{N} C_i=I}
]
(up to any independently specified background/resolving holonomy).

For the controlled commutator fixture
[
C(epsilon)=e^{epsilon A}e^{epsilon B}e^{-epsilon A}e^{-epsilon B},
]
an opposite matched site carries (C^{-1}), so
[
C,C^{-1}=I
]
exactly. Numerical matrix-exponential tests gave Frobenius residuals at machine precision (~1e-16) for epsilon 0.05–0.4.

If the second site is only approximately matched,
[
C_{m pair}=C(epsilon),C^{-1}(epsilon(1+eta)),
]
then the small-epsilon residual scales as
[
|log C_{m pair}|_Fproptoepsilon^2,
]
with fitted powers 1.999997 for eta = 0.01, 0.05, 0.10.

At leading BCH order, many local defects obey
[
log!left(prod_i C_iight)
=
sum_i K_i+rac12sum_{i<j}[K_i,K_j]+cdots,
qquad K_i=log C_i.
]
So even a vanishing first-order sum (sum_iK_i=0) need not close globally when the defect generators do not commute.

## Interpretation candidate

Local contact defects may behave like a non-Abelian balance/neutrality budget around a globally returning finite-core history. Reconnection can redistribute local defects, but global framed closure constrains the allowed set. This is stronger than requiring each contact to be individually trivial and weaker than assigning a new conserved scalar charge.

## Failure conditions

- If the physical carrier need not close as a framed history, the product-to-identity condition is inapplicable.
- If all allowed local transports commute, higher-order ordering terms vanish and the mechanism collapses toward an Abelian sum rule.
- If a nontrivial background/resolving holonomy exists, the right-hand side is that specified holonomy rather than (I).
- No energy, particle identity, exclusion law, or quantization follows from this geometry alone.

## Next solver test

Generate a closed finite-core braid with 3–6 controlled contact sites. Hold centerline closure and contact geometry fixed while permuting the same local (C_i). Compare (a) exact global product, (b) finite-core admissibility, (c) post-reconnection branch pairing, and (d) candidate action. The decisive non-Abelian discriminator is whether permutations with identical local defect multiset produce different global closure/action.
