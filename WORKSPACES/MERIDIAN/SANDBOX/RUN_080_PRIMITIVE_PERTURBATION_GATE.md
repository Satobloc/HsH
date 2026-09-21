# Run 080 — Primitive-perturbation gate for Three-Spheres ↔ Hagalaz benchmark

**Status:** SANDBOX / FORMALIZATION CORRECTION  
**Branch/task:** `LAB-SBS-001` / Meridian Three-Spheres comparator  
**Date:** 2026-09-21  
**Quarantine:** untouched; no PRIOR_ART/nLab/private quarantine ingress.

## Bounded operation

Audited the Run-079 cursor against the actual Run-077 perturbation construction before implementing the Three-Spheres numerical comparator.

Run 077 generated a compatible absolute 4D frame triple `(c_i,s_i,R_i)`, derived all pairwise Hagalaz candidate edges, and then injected mismatch into **one derived edge only** while leaving the primitive absolute frames and all other pairwise edges unchanged.

That is a good internal Hagalaz sensitivity control, but it is not a fair cross-solver perturbation family for Three Spheres.

## Correction

A Hagalaz-only derived-edge perturbation has no unique corresponding perturbation of the shared primitive 4D carrier dataset. If the Three-Spheres side is evaluated from the unchanged absolute centers/directors, its carrier residual should remain unchanged while Hagalaz reports a loop defect. That outcome would measure representation inconsistency deliberately inserted after the shared data were generated, not different solver response to the same geometric disturbance.

Therefore Run 077's epsilon family must **not** be reused verbatim as the first Hagalaz ↔ Three-Spheres cross-solver benchmark.

The fair comparison must inject epsilon at the common primitive level first, then regenerate both representations:

`D_epsilon = perturb(D_0, epsilon)`

`H_epsilon = H(D_epsilon)`

`S_epsilon = S(D_epsilon)`

where `D` contains the declared absolute 4D centers/material-director state, `H` is the candidate Hagalaz edge/loop representation, and `S` is the Three-Spheres carrier/gate/closure representation.

Only then may response channels be compared.

## First admissible perturbation family

Use a bounded displacement/rotation of one primitive sphere/frame, not one derived pairwise edge. For example, in the shared material/director gauge:

- displace `c_2 -> c_2 + epsilon R u`, with fixed unit 4-vector `u` and reference length `R`;
- optionally, in a separate channel, rotate `R_2 -> R_2 exp(epsilon J)` for a declared unit bivector generator `J`;
- recompute **all** pairwise relative Hagalaz candidate edges from the perturbed absolute frames;
- recompute the Three-Spheres carrier geometry/residual from the same perturbed centers/directors;
- report Hagalaz `E_t,E_s,E_Q` and Three-Spheres carrier/gate/closure channels separately.

Do not collapse the channels into one score.

## Important expected control

For a globally compatible set of absolute frames, regenerating every Hagalaz pairwise edge from those same frames should preserve exact loop compatibility even when one primitive frame is moved. Thus a pure primitive frame displacement may legitimately produce:

- near-zero Hagalaz **consistency-loop** residual, because the edge representation remains mutually compatible;
- nonzero Three-Spheres **geometric constraint** residual, if the displacement violates the equal-S3/common-carrier geometry.

This is not a contradiction. It reveals that the two candidate residuals test different propositions: representation consistency versus geometric admissibility.

Accordingly, a meaningful cross-solver benchmark requires either:

1. a Hagalaz observable that encodes the same geometric admissibility condition as the Three-Spheres residual, or
2. an explicit declaration that the benchmark is comparing complementary channels rather than equivalent residuals.

This is now the main interface question before numerical response curves are worth generating.

## Relation to Runs 077–079

- Run 077 remains valid as an **internal candidate-Hagalaz edge-corruption sensitivity control**.
- Run 078 still requires a shared material/director gauge for translation-channel comparison.
- Run 079 still requires carrier-level comparison before readout/projection.
- Run 080 adds a third gate: **cross-solver disturbances must enter upstream of both representations.**

Together the benchmark diagram is now:

`shared primitive 4D data -> shared primitive perturbation -> {Hagalaz representation, Three-Spheres carrier representation} -> typed residual channels -> optional readout`

## Provenance / source status

Direct dependencies:
- `WORKSPACES/MERIDIAN/SANDBOX/RUN_077_HAGALAZ_CONTROLLED_EDGE_MISMATCH.md`
- `WORKSPACES/MERIDIAN/SANDBOX/RUN_078_SIM4_TRANSLATION_GAUGE_GATE.md`
- `WORKSPACES/MERIDIAN/SANDBOX/RUN_079_CARRIER_READOUT_TYPE_GATE.md`
- `WORKSPACES/MERIDIAN/TRIAL_CHECKPOINT.md` recovered Three-Spheres lineage summary.

No new Nathan Words packet was required for this bounded operation; the correction follows from the already-declared shared primitive-data interface. Feed disposition: **NOT RELEVANT for this correction**.

The exact historical/current Hagalaz operator remains unrecovered; no candidate operator is promoted by this result.

## Capability/information gain

Prevented a false cross-solver comparison in which one solver would receive corrupted derived data while the other received unchanged primitive data. Also exposed a deeper typing distinction: the current Hagalaz loop residual is a representation-consistency test, whereas the recovered Three-Spheres closure/gate machinery includes geometric-admissibility tests. Equality of response should not be expected until a genuinely homologous Hagalaz geometric channel is identified.

## Durable boundary / next cursor

Before running numerical Three-Spheres ↔ Hagalaz response curves, identify or construct the narrowest candidate Hagalaz **geometric-admissibility** observable that consumes the same primitive 4D sphere/frame data as the Three-Spheres carrier constraint. If none exists in recovered non-quarantined source material, record the comparison as complementary-channel only and benchmark each against the same primitive perturbation without claiming residual equivalence.

No Nathan action required.