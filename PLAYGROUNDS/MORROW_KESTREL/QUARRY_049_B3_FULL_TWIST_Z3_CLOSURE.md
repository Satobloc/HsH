# QUARRY XLIX — B3 full twist as a precise replacement candidate for vague Z3 fusion

Status: SANDBOXED / noncanonical
Role: Morrow + Kestrel
Central question: If SAT is right as a largely standard-physics 4D map, how should H(s)H work?

## Provenance actually read
1. Old SAT: `2026/SAT MATH — BACKBONE.txt`, blob `1854995be3311f565739f2be64269cbb0385a82f`. Read the returned backbone text substantially, especially F1–F2 sections on recursive superhelices, SO(4), braid force, baryon/Borromean topology, claimed Z3 stability, and 4th-order worldline dynamics. Historical constants/particle fits were not used as targets.
2. Current H(s)H: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt`, blob `f1b7e7a1bbb041b2ad0142aebb75b2bfda29b3e4`. Read the solver map through the hyperhelix/shell sections, especially ᚼ composition/closure, finite-core contact, torus/winding/frame history, noncommuting SO(4), and recursive hyperhelix machinery.

## Source fact separated from sandbox inference
Old SAT asserts a Z3-like three-constituent stability/fusion rule but does not supply a clean braid-group derivation in the material read. Current H(s)H has explicit composition/closure and braid/topology ambitions but no canonical Z3 mechanism in the read material.

## Exact calculation
In the three-strand braid group B3, let beta = sigma1 sigma2. The induced permutation is a 3-cycle, so beta^3 restores all strand labels. In the reduced Burau representation,
sigma1=[[-t,1],[0,1]], sigma2=[[1,0],[t,-t]],
and direct symbolic multiplication gives
(beta)^3 = t^3 I.
Thus beta^3 commutes with both braid generators in this representation. This is the familiar full twist Delta^2, the generator of the center of B3.

Important distinction:
- beta, beta^2: constituent labels are cyclically permuted.
- beta^3: labels return, but the braid is NOT the identity; a central full twist remains.

## Sandbox conjecture
A precise H(s)H replacement candidate for the old vague "Z3 fusion rule" is not Z3 as a scalar charge, but a quotient/closure structure:
B3 -> S3 tracks constituent permutation, while the kernel retains pure-braid/topological memory.
For beta=sigma1 sigma2, permutation closure occurs at order 3, beta^3 in P3, yet beta^3=Delta^2 is topologically nontrivial and central.

This creates a natural two-layer state:
(permutation phase mod 3, central/full-twist sector).
A three-step cycle can therefore restore readout labels while retaining hidden braid memory.

## Mechanism candidate
Recursive Hagalaz could act on a three-filament bundle by repeated braid cells. Every third cell closes the constituent-label cycle but deposits one central twist. Repetition gives Delta^(2n), a discrete accumulated topological/framing memory. This is a concrete route from cyclic 3-constituent exchange to persistent holonomy/twist without inventing a scalar Q=3.

## Attack / failure conditions
1. The old SAT Z3 claim may have meant a different fusion category entirely; this is a replacement candidate, not rediscovery unless provenance later proves otherwise.
2. Centrality alone does not provide energetic stability. A Lagrangian must couple to the full-twist/framing sector.
3. In unrestricted 4D motion, ordinary 3D braid protection may weaken; finite-core/timesheet constraints must be included.
4. Burau is a diagnostic representation, not the physical dynamics.

## Tight next solver
Build a finite-core three-strand worldtube fixture implementing beta^n for n=0..6. Measure:
- permutation phase in S3,
- pairwise linking after closure,
- framed self-link/twist/writhe,
- ordered SO(4) holonomy Q_gamma,
- minimum 4D core separation,
- energy under candidate curvature/twist terms.

Prediction candidate: observables depending only on constituent labels are period-3, while full braid/framing/holonomy observables can accumulate monotonically with the central power Delta^(2 floor(n/3)). This would distinguish "three-cycle closure" from "topological erasure."

Generated diagnostic: MK_049_b3_full_twist_z3.png
