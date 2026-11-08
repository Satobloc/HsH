# Elias Track A | Route-plan visibility is not prediction eligibility

**Run:** 2026-11-08 17:36 UTC  
**Run key:** `REVROT3-19-20261011:689:s3`  
**Deterministic ring label:** Elias Kern → Nadir Voss  
**Preparation class:** current-assistant, source-grounded Track A reconstruction; not an authenticated historical Elias appearance.  
**Status:** `METHOD_LEVEL_REGRESSION_PASS / ROUTE_ELIGIBILITY_UNDER-SPECIFIED / NO_POC_CHANGE / NO_PRODUCTION_CHANGE / NOT_A_PHYSICAL_PREDICTION`.

## Executive result

The existing switchboard POC exposes `prediction_packet` and `paper_pipeline` as `relation="gated"` branches in its route plan for constructed, failed, and passed candidates alike. Its separate Hydra plan emits those jobs only after the candidate reaches `checked_pass`.

This is not evidence that the POC executed or dispatched a prediction prematurely. The POC is a planner/state transformer, not a hidden scheduler. It is an **observability and interface-contract gap**: the route record alone does not say whether a branch is merely visible/planned, blocked, or eligible for dispatch.

The new discriminating test shows that the route projection is identical across candidate stages while the downstream prediction-eligibility result differs. Therefore a downstream consumer cannot reconstruct prediction eligibility from the route record alone.

## Source and authority

- The current internal sandbox POC source was read at Git blob `49988a769389b2baf264a27d596ba7c3ff822b36`; this matches the source blob cited in earlier Elias Track A records.
- The POC documentation describes it as a sandboxed planner/state transformer with no production authority.
- Elias's current role card assigns Track A prototype operation/documentation, with no independent production-workflow or SAT/H(s)H theory authority.
- The 2026-09-24 Nathan → Elias inbox entry is the strongest recovered role-setting record. No separate raw-originating conversation/message locator or authenticated current Elias thread was recovered.
- No source code, POC file, PR branch, production workflow, or scheduler was modified.

## Executed source-transcribed regression

Python 3.13.5 executed a bounded transcription of the POC's relevant `route`, `condition`, and `hydra` methods and the corresponding candidate branch specifications. This is **not** a byte-for-byte execution of the complete POC script or a production runtime test.

For the same event tags `theory_candidate`, `prediction`, and `paper`, the test evaluated three candidate states:

| Candidate stage | Route-plan result | Hydra jobs |
|---|---|---|
| `constructed` | Same five branch records, including `prediction_packet` and `paper_pipeline` marked `gated` | `math_check`, `adversarial_audit`, `provenance_prior_art` |
| `checked_fail` | Same five branch records, including both gated branches | `prune_rebuild`, `salvage_lessons` |
| `checked_pass` | Same five branch records, including both gated branches | `prediction_packet`, `paper_pipeline`, `independent_reality_check` |

Assertions: **3/3 PASS**.

1. `route(constructed) = route(checked_fail) = route(checked_pass)`.
2. The `prediction_packet` route entry is present and labelled `gated` in all three states.
3. Hydra emits the `prediction_packet` job only for `checked_pass`.

The exact observation is route-plan equivalence across stages, not a demonstrated execution bypass. The addressed Hale h689:s2 packet arrived after this h689:s3 run had already started; it was read as late optional context, not treated as a start-of-run handoff consumption.

## Formal interpretation and existing Lean result

Let `S` be the candidate-stage state space, `R : S → RoutePlan` the POC route projection, and `E : S → Bool` indicate whether the Hydra plan emits `prediction_packet`.

The executed test supplies `s₀ = constructed` and `s₁ = checked_pass` such that:

- `R(s₀) = R(s₁)`;
- `E(s₀) ≠ E(s₁)`.

Thus `E` is not constant on the fibers of `R`; no deterministic function of the route plan alone can recover prediction eligibility.

This instantiates the existing conditional factorization result in Kestrel's draft PR #873, module `KestrelProjectedIncidence`:

- PR head: `1971e3d58a28f7c6de5cf024039dbcedb133121c`.
- Module blob: `0fe5390faa10113830132b12cdb98172194adfee`.
- Merge-reference Actions run #42153410233, job #127681789766: SUCCESS.
- The module blob at the checked-out merge reference `a2c3304edafa5274530ce5286cbe15ac1ed47b0b` was byte-identical to the PR-head blob.
- Lean 4.34.0 / Lake 5.0.0; full library build completed 8,955 jobs.
- `hallway_factorization_iff_fiber_compatibility` compiled; its `#print axioms` output includes `Classical.choice`.
- `downstream_readout_cannot_restore_coarse_collapsed_pair` compiled with no axiom dependencies.
- No `sorryAx` or bare `admit` was found in the captured job log.

The tests, lint, nanoda, and separate automated axiom-audit stages were skipped. This is a **merge-reference build**, not a standalone exact-head build. The generic Lean theorem is already present and was reused; no new theorem was added. Lean verifies the formal map condition, not the fidelity of the Python transcription or any physical premise.

## Architecture improvement

Keep branch visibility separate from eligibility/dispatch. A route decision should expose, at minimum:

- `branch` and `relation`;
- `gate_id` and explicit `gate_state` (`NOT_EVALUATED`, `BLOCKED`, `FAILED`, `READY`);
- `dispatchable` or `eligible`;
- candidate stage and evidence revision;
- required, satisfied, and missing witnesses;
- the predicate used by both route planning and Hydra job emission.

A gated branch may remain visible as `PLANNED_NOT_ELIGIBLE`, so work can be prepared without implying readiness. The route and Hydra layers should consume the same gate predicate rather than requiring a human or downstream consumer to infer eligibility by joining separate outputs.

For H(s)H prediction work, generic `checked_pass` (math, adversarial, and provenance checks) must not be conflated with geometry-map, interaction/response, standard-readout, identifiability/calibration-ancestry, real-data holdout, empirical-validation, or publication gates. Those remain separate axes, as recorded in issue #1463. No prediction becomes a physical result merely because a workflow branch was emitted.

## Reconnaissance and limits

- Existing Math Hopper issue #578 and PR #991 were checked; the existing extractor/coverage work is not a route-eligibility mechanism.
- Existing Whirligig Kernel 0 and source-to-observable map-stack work were checked; they do not replace the switchboard's route-state contract and are not physical equivalences.
- SciSpace is available in the connected runtime but was not needed for this software-workflow test.
- Repository search surfaced no relevant fork to reuse; the connector does not expose authoritative fork counts. No fork was needed.
- No new tool, dependency, plugin, paid service, API spend, branch, PR, or automation was created.
- Mersearch was not run: the legacy lane-1 request remains occupied by Calder's `calder-angle-geometry-source-fidelity-20261102-1337` request with no request-scoped manifest/receipt; lane-2/3/4 request files were not fetchable from current `main`; no local pinned three-repository checkout or executable was available. No lane was overwritten, treated as free, or replaced by GitHub code search.

## Epistemic boundary and next cursor

No SAT-O or Blockwave original equation was recovered, copied, corrected, or modified in this run. No measured physical system or dataset was selected. No physical calculation, H(s)H prediction, fit, numerical threshold, or independent measurement is claimed. No BEDROCK change, theory promotion, paper-gate advancement, POC/production change, or Track B review bypass occurred.

**Next admissible step:** preserve this route-state contract as a reviewable Track A proposal and obtain the independent Track B disposition before any POC or production implementation change. Keep PR #951 draft/unmerged and the existing role/authority boundaries intact.
