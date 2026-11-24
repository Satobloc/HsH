# H942:S1 | Joint clock-calibration families and robust cross-clock order

**Run key:** `REVROT3-19-20261011:942:s1`  
**Nominal slot:** 2026-11-19 06:36 UTC  
**Selection:** `h=942`; `seq=5h+3=4713`; `4713 mod 19=1`, Loom. Next: Aster, index 2.  
**Attribution:** source-grounded assistant reconstruction. No authenticated current Loom thread or historical-instance participation is claimed.  
**Scope:** one-run Lane 36 architecture/verification overlay. Loom's standing source-first corpus-tagging remit remains unchanged.

## Executive result

This run formalizes the missing family-level step identified in Meridian's h941 clock-transform report: a single shared monotone map preserves order, but two source clocks require an explicit **joint calibration relation into a common target clock**.

The new Lean module distinguishes:

1. a nonempty family of alternative maps, each applied as the same map to both intervals; and
2. a nonempty family of paired maps, one for each source clock, indexed by an admissible joint calibration state.

For the paired case, robust order requires every admissible joint state to map the earlier interval's upper boundary strictly below the later interval's lower boundary. One admissible pair with overlap or reversal defeats the universal order claim.

The result is a mathematical evidence contract, not a clock calibration, not an empirical synchronization result, and not an H(s)H prediction.

## 1. Source identity, chronology, and Loom remit

The historical Loom remit was revalidated against the existing raw-source recovery record:

- Conversation: `6aa67478-0e14-4b7c-89ab-6c01ecb36c3a`.
- Raw export blob: `6668ca60e451f8737903423727da7f9a430484e1`.
- Ten user-role messages were parsed; all ten match the existing tag ledger, lines 29–38 of `2026-11-01-LOOM-TAG-CONVERSATION-CORPUS-CHARTER-01.md`.
- No standalone signed Loom specialist charter was found.

Those direct user-role instructions establish source-first corpus tagging, exact provenance, chronology, current-definition-first terminology crosswalks, correction/supersession chains, duplicate/prefix/superset relationships, and periodic tag-selectivity review. This Lane 36 overlay does not alter Loom's standing role or Mercer's precision/selectivity QA ownership.

The current h942:s2 Sable handoff packet was available before this run but was read at 06:42Z, after this run had begun. It is optional context only, explicitly carrying no task, review request, response obligation, or ownership transfer. It reports the PR #2050 publisher guard's exact-source regression and local Git race tests, while preserving Tern's authority over Mersearch branch reconciliation, controlled execution, and lane release. No Mersearch work was requested or performed here.

## 2. Source chain and the unclosed mathematical case

The immediate source is Meridian's h941 report, issue [#2066](https://github.com/Satobloc/HsH/issues/2066), and its Lean implementation in [PR #2065](https://github.com/Satobloc/HsH/pull/2065).

That report explicitly limits its theorem to two intervals transformed by the **same** strictly monotone map. It identifies two unformalized cases:

- independent source clocks need a joint calibration relation into a common reference clock; and
- if calibration uncertainty admits a family of maps, the result must cover every admissible mapped value.

The exact-head build for Meridian PR #2065 has since completed successfully: [Actions run #44468248145](https://github.com/Satobloc/HsH/actions/runs/44468248145), job #135371146445, exact head `9b69b404434cfba096ddfb7a44207156f60ba904`. Checkout, exact-head assertion, Lake manifest generation, Lean installation/library compilation, and environment recording all succeeded. PR #2065 remains OPEN / DRAFT / UNMERGED. The job result verifies compilation; the theorem-specific `#print axioms` output was not separately captured in this review, and no global axiom audit is claimed.

The current module reuses the source-bound temporal types from Aldus's `AldusTemporalProvenance` and Meridian's `MonotoneClockTransform`. It does not modify PRs #1860, #2032, or #2065.

## 3. Formal architecture added

New file:

`FORMAL_VERIFICATION/HsHVerification/JointClockCalibrationFamily.lean`

The module adds:

- `SharedClockTransformFamily`: a nonempty family of candidate transforms, with each member applied identically to both intervals. The existing shared-map theorem lifts pointwise over this family.
- `JointClockCalibrationFamily`: a nonempty family of paired transforms from two declared source clock domains/scales into one common target domain/scale. One index denotes one admissible joint calibration state.
- `jointBoundaryImage`: the set of all admissible pairs formed by mapping the first interval's upper boundary and the second interval's lower boundary.
- `uniformlySeparated`: every pair in that joint image has strict first-before-second separation.

Theorems state that:

1. joint-image separation is equivalent to universal boundary separation over all admissible joint states;
2. if every admissible paired calibration strictly separates the transformed boundaries, both transformed intervals are `definitelyBefore` in the common known target clock for every admissible state;
3. one admissible pair whose mapped boundaries overlap or reverse refutes uniform order; and
4. the shared-calibration family case preserves an already established source-clock order for every family member.

The admissible index deliberately preserves dependence. If two calibration uncertainties are independent, the index must encode their Cartesian product. If they are correlated, it must encode only the source-authorized admissible pairs. Marginal calibration ranges alone do not establish which pairs are jointly possible.

**Important proof boundary:** the `ClockTransform` type carries strict monotonicity for each map, but the cross-clock theorem does not use separate monotonicity to infer synchronization. Its essential premise is the explicit pairwise boundary-separation condition over the joint calibration family. This is the missing relation, not a derived physical fact.

No concrete timestamps, numerical fixtures, `#eval` values, or physical calculations are used.

## 4. Exact PR and CI status

[PR #2071](https://github.com/Satobloc/HsH/pull/2071) is OPEN / DRAFT / UNMERGED, stacked on Meridian PR #2065.

- Branch: `research/loom-joint-clock-calibration-family-20261119t0636z`.
- Exact head: `76740f5aa29c75ae6e42ef22b5fa74410a0ac7cb`.
- Module blob: `2ccfce336dd50fcd52b339a3d77bb5009cced31e`.
- Root import blob: `63d7cc6de95f1576d3a03f075aec5e9376d2ef4d`.
- New module source contains no `sorry` or `admit`.
- [Lean exact-head run #44473841176](https://github.com/Satobloc/HsH/actions/runs/44473841176), job #135389495996: completed SUCCESS at 2026-11-19 06:44:25Z on exact head `76740f5aa29c75ae6e42ef22b5fa74410a0ac7cb`. Checkout, exact-head assertion, Lake dependency-manifest generation, Lean installation/full formal-library compilation, and environment recording all succeeded. The workflow explicitly skips tests and lint. The module contains theorem-specific `#print axioms` commands, but their output was not separately captured in this review; no theorem-specific axiom report or global axiom audit is claimed.
- Separate push workflow #44473814966 (`conversation-json-content-ci`) concluded failure with zero jobs exposed. It is not the Lean verification run and does not establish a Lean failure.

The PR is draft and unmerged. No review, merge, rebase, or theory promotion was performed. The connected runtime has no local `lean`, `lake`, or `elan`; GitHub Actions is the available execution path.

## 5. P2 test matrix and physical boundary

| Hypothesis / layer | Shared parameters | Calibration / holdout | Observable | Standard comparator | Falsification condition |
|---|---|---|---|---|---|
| Method-level: robust order across paired clock-calibration families | Source domain/scale for each clock; common target domain/scale; admissible joint map-pair relation | Requires actual calibration records, validity intervals, uncertainty bounds, and dependence/covariance provenance; none acquired | Whether every admissible mapped boundary pair is strictly separated | Existing same-clock interval order and shared-monotone-map theorem | One source-validated admissible pair with mapped second lower bound less than or equal to mapped first upper bound refutes robust order |
| Physical H0/H1 Kelvin-vortex comparison | Existing campaign-specific parameters and source conventions | Raw versioned package, acquisition IDs, calibration, joint covariance, and holdout remain absent | No new physical observable formed | Hollow-core / Rankine Kelvin-vortex comparator family | No numerical threshold formed |
| H(s)H-specific discriminator | Forward/readout map and added geometry parameters remain undefined | No calibration or holdout | No prediction formed | Standard comparator remains controlling | No falsification threshold formed |

**P2 remains HOLD.** The Figshare DOI `10.6084/m9.figshare.30903347` remains a locator only. No versioned package, raw bytes, units, covariance, holdout, fit, prediction, or independent measurement was acquired or analyzed.

The Lean result does not establish the truth of calibration inputs, clock identity, clock drift, quantization, validity ranges, source-record authenticity, or experimental independence. The current `Nat`-tick model is discrete; continuous-time interpolation and physical uncertainty distributions remain unmodeled. No worldtube thickness, twist, or contact-surface feature is forced by this method result.

No SAT-O or Blockwave equation was opened, transcribed, corrected, or changed. No BEDROCK theory promotion or paper-gate advancement.

## 6. Loom source-local tagging and crosswalk

No canonical tag dictionary change is proposed. Mercer retains global precision/selectivity QA ownership. This source-local record keeps the terms navigable without promoting them globally:

| Proposed source-local tag | Current definition | Source / relation | Guard |
|---|---|---|---|
| SHARED-CLOCK-TRANSFORM-FAMILY | Alternative transforms each applied identically to both intervals | Meridian PR #2065 plus this shared-family theorem; extension | Not cross-clock synchronization |
| JOINT-CALIBRATION-STATE | One admissible paired-transform state for two source clocks | New `JointClockCalibrationFamily`; formal type | Not a measured calibration state |
| JOINT-BOUNDARY-IMAGE | Set of mapped earlier-upper/later-lower boundary pairs over all admissible states | New Lean definition; exact formal object | Not a probability distribution |
| UNIFORM-CROSS-CLOCK-SEPARATION | Every admissible joint boundary pair has strict first-before-second order | New Lean proposition | Requires a source-authorized joint family |
| CALIBRATION-DEPENDENCE-RELATION | The allowed pairing between two clock-map families | Encoded by the admissible index; structural relation | Product only when independence is justified |
| MAP-MONOTONICITY-NOT-SYNCHRONIZATION | Separate strict monotonicity does not supply cross-clock boundary separation | Logical distinction in the new contract | Not an empirical claim about any specific clocks |

The source chain preserves current definition first, historical/source definition second, and relation type/authority third. The h941 report is an assistant reconstruction, not a Nathan-authored original or a standard reference.

## 7. Repository and tool preflight

- HsH live front door, BEDROCK, Nathan Direct methodology, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, Revival Rotation/thread-first controls, scheduler authority, workflow branch map, current branch, current receipts, Loom README/BOOT/CURRENT_WORK, and the historical Loom source recovery were read.
- Current HsH main at the final preflight read: `f0648fa9fc78a2bf7f03a17e7b9b8471f8ef3b6d` (2026-11-19 06:42Z). The formal work is isolated on the PR branch above.
- SAT archive root README was read. HSH_RESOURCES root `!_HSH_RESOURCES_INDEX.md` was read only; no catalog payload or private source file was opened.
- No callable Mersearch tool or installed stable Mersearch checkout was available. The four canonical request lanes remain requested; no request was overwritten, retriggered, released, or reused. GitHub retrieval was a bounded fallback, not represented as a Mersearch search.
- Existing Math Hopper #578 is extraction-only and its full three-repository scan remains unverified; PR #991 remains open/draft. Whirligig Kernel 0 remains sandbox-only. Existing PRs #1860, #2032, #2065 and the Aldus calibration-factorization work were checked before adding this module.
- HsH reports zero forks. SciSpace is available but was not needed for this mathematical contract. No new tool, dependency, fork, subscription, OCR service, or expense was introduced.
- No PWH partition was claimed or consumed; Tern retains the existing PWH cursor and Mersearch controlled-release authority.

## 8. Campaign, reading, and scheduler

- P0 Code Grurple: ACTIVE.
- P1 Orson cognition: OVERDUE / NOT READY / Orson-owned; no protocol, dataset, manuscript, or ownership touched.
- P2 geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE next review: 2026-11-24, not yet due.
- November 9 minor-paper gate remains missed; November 30 major and December 14 full-theory gates remain separate.

The five-activation unrelated-reading interval is not due after the h941 Oscar Wilde break. No duplicate reading or physical break is claimed.

The existing :36 automation was privately re-peeked:
- ID `6a9f52b69ec08191b0a2ba24a074f781`.
- Enabled: `true`.
- Exact original schedule: `DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY`.
- Prompt unchanged.
- Current run was `IN_PROGRESS` with null completion/chat_ref at the last peek.

No task, ID, prompt, schedule, phase, cadence, enabled state, task graph, signet, or conversation name was changed. No sixth task was created.

## 9. Continuity and next step

The h942:s2 Sable optional packet was read from the existing Loom inbox and its exact handoff record. It is context only; no Mersearch task was accepted. The next deterministic ring label is Aster. No direct-thread delivery, assignment, consumption, acknowledgment, or ownership transfer to Aster is claimed.

**Next technical step:** inspect PR #2071 exact-head run #44473841176 to completion. If it passes, inspect the theorem-specific axiom output where available and retain the distinction between a formally verified joint-calibration contract and actual clock calibration. If it fails, correct the same branch and preserve the failed run; do not create a duplicate PR.

**Return pin:** `H942:S1 / LOOM-LABEL-ASSISTANT-RECONSTRUCTION / JOINT-CLOCK-CALIBRATION-FAMILY / PR2071-DRAFT-UNMERGED / EXACT-HEAD-CHECKOUT-PASS / LAKE-MANIFEST-IN-PROGRESS / LEAN-EXACT-HEAD-BUILD-PASS / AXIOM-OUTPUT-NOT-CAPTURED / PR2065-EXACT-HEAD-COMPILE-PASS / P2-HOLD / MERSEARCH-UNAVAILABLE / SABLE-PRESTART-PACKET-CONSUMED / ASTER-NEXT / TASK-UNCHANGED`
