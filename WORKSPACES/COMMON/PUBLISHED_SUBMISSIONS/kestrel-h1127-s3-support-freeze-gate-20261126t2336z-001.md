# Kestrel h1127:s3 — support identity must be frozen before holdout access

**Date:** 2026-11-26 23:36Z  
**Run key:** `REVROT3-19-20261011:1127:s3`  
**Routing label:** Kestrel (index 14); next Meridian (index 15). Deterministic selection is not authentication of a historical Kestrel instance or thread. The current run had `chat_ref=null`.  
**Disposition:** CROSS-LANE ARCHITECTURE SYNTHESIS / DRAFT FORMAL GATE PR OPEN / LEAN_UNTESTED / NO PHYSICAL ANALYSIS / NO PAPER OR THEORY PROMOTION.

The nominal selection is `h=1127`, `seq=5(1127)+3=5638`, `5638 mod 19 = 14`. The next ring identity is Meridian (index 15). Existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its original hourly :36 America/New_York schedule and Worldtube phase. Current run ID `e8b9860c-2e00-8333-9511-c10dbc78f7cc` started at 23:32:07Z with `chat_ref=null`. No sixth task or scheduler change.

## 1. Role and source basis

Kestrel's recovered historical remit is the trust-first, cross-boundary synthesis companion: reason forward from the consequential case, retain the whole picture, and route primary source, provenance, proof and experiment work to their existing owners. It is not the primary auditor, provenance adjudicator, mathematical verifier or evidence-acquisition lane. No separate signed specialist charter was recovered.

The individuating source conversation (`Science Made Stupid`, blob `100267f3f11f3cce09c7d802ce85ad03879d5744`) was retrieved through the existing Git blob route and parsed. Direct user-role messages `c6803d67-a76f-48e4-bf71-f49cb7b224ee`, `3c07680d-5205-48a3-93d5-ce33a8cf86a6`, `fc9b147e-b138-44ac-a48b-b81593e3c3e9`, and `f15aac1c-0a31-4e98-b461-6ca872035315` establish the role: trust Nathan's intuitions as high-value hypotheses, do not repeat the audit teams' work, and reason forward unless a concrete question or contradiction calls for research. Later Code Grurple and whole-pile reaction instructions are scoped tasks, not permanent role replacement. The current assistant is not authenticated as the historical Kestrel instance.

Read: live BEDROCK; Steering Charter 2026-10-26; Three Paper Campaign; New Instance Start Here; Boot/Reboot Preflight; Revival Rotation V3, V4 and thread-routing rules; Kestrel README, BOOT, CURRENT_WORK, CONTINUITY, THREAD_HANDOFF_2026-09-21, OPERATING_ASSUMPTIONS, OPEN_QUESTIONS and INBOX; latest Kestrel receipt/report; and the current P2/map records.

Repository heads at readback:
- HsH `main`: `f3a0b81a138c6c037d7e3c12530fda67382d2080`
- SAT archive `main`: `2b6f18d515e5bbdd3b1276cb62c6f4c10f76b19e`
- HSH_RESOURCES `main`: `ac9a05a1fd71da7f8a73594d819a1d73a01b06e6`

Kestrel BOOT and CURRENT_WORK still point to h1101; the latest Kestrel published receipt is h1123:s4 / issue #2629. The h1123 receipt is PUBLISHED_VERIFIED. Worker-local checkpoint and INBOX writes were not attempted because the P0 interlock remains active.

## 2. New cross-lane result: support identity needs a temporal commitment

The existing project already contains most of the scientific comparison requirements:

- Issue #1341 specifies typed geometry-to-observation maps and the source-system/readout boundary.
- Issue #1385 requires the admissible domain, calibration/holdout split, instrument response, covariance, shared nuisance parameters and scoring rule to be frozen before holdout access.
- P2 issue #565 requires a versioned observed dataset and a real system before analysis.
- Kestrel's h1070 report / issue #2503 requires the same detector readout and a matched GR finite-size comparator; it leaves the physical maps and P2 selection incomplete.
- Alberr's h1125 PR #2634 attempts the source-support-relative partial-map gate: compare on an independently declared support, not on the entire ambient domain or merely the routes' common domain.

The missing join is not another map theorem. It is an immutable identity for the support specification that was frozen before the holdout became visible.

A support predicate may be mathematically well-formed and still be chosen or narrowed after someone has inspected the holdout. In that case the support-relative theorem can be true of the newly chosen support while the confirmatory test has already been compromised. A hash or label alone is not enough unless it is bound to the pre-access source context and its first-access chronology.

### Proposed confirmatory envelope

A confirmatory comparison should bind:

1. `SupportSpecID`: support identifier, source-context/release identity, non-reused generation, canonical support digest, and freeze time.
2. `HoldoutID`: exact holdout partition and first-access time.
3. `ComparisonRunID`: exact support ID/context/generation/digest and holdout ID actually used.
4. Common controls: same readout, calibration bundle, and shared nuisance-parameter set across H(s)H and the standard comparator.
5. Evaluation time and source-bound access record.

Admission requires the support to have been frozen strictly before first holdout access, the comparison to use that exact support generation and digest, and the two model arms to share the declared readout/calibration/shared-parameter identities.

If the support changes after holdout access, the new version is `EXPLORATORY_RESCOPED`, not a confirmatory rerun on the same holdout. A fresh independent holdout is required for a new confirmatory claim. An observation inside the predeclared support for which one model has no defined readout is not silently dropped; it remains a map-coverage failure or an explicitly pre-registered unscorable case.

This is a workflow contract, not a claim that any present H(s)H map or physical support has been established.

## 3. Formal implementation opened

Draft PR [#2640 — Freeze support identity before holdout access](https://github.com/Satobloc/HsH/pull/2640) was created on branch `research/kestrel-support-freeze-gate-h1127s3`, based on the existing partial-map-domain verification branch. It adds `SupportFreezeGate.lean` and imports it into the formal library.

The module defines `SupportSpec`, `HoldoutSpec`, `ComparisonRecord`, `ConfirmatoryWitness`, and an executable Boolean `confirmatoryGate`. Its three intended theorem checks are:
- a valid witness implies the gate;
- a changed support digest blocks confirmatory admission;
- freezing at or after first holdout access blocks admission.

The `#eval` cases use illustrative software-state IDs and abstract monotone clock ticks only. They are not physical fixtures or observations.

**Verification status: `LEAN_UNTESTED`.** The local runtime has no `lean`, `lake`, or `elan` executable. The PR is draft/open; no exact-head Lean run or theorem-specific axiom report was available at final readback. No compilation, theorem proof, or `#eval` execution is claimed. Independent review is still required.

The external digest-to-support binding, timestamp truth, actual holdout access control, source correctness, calibration equivalence and physical interpretation remain outside this Lean model. The formalization does not prove that the support is physically correct.

## 4. Important existing proof correction

The support-relative map PR #2634 is **not** verified. Its third exact-head run [#45901204936](https://github.com/Satobloc/HsH/actions/runs/45901204936) completed with failure:
- `PartialMapSupportDomainGate.lean:91:19`: invalid `by` tactic; expected type not provided.
- `restrictToSupport_ext_iff_domain_and_values` still reports `sorryAx`.
- The `#eval` witness executed, but this does not cure the failed theorem.

This is an Alberr-owned formalization. I did not edit or take over that branch. PR #2640 is independent and does not import or repair #2634. Both must remain unmerged until their own exact-head proofs and independent reviews succeed.

## 5. Cross-lane provenance caution

Morrow h1127:s2 completed a pinned three-repository Mersearch request. Its HsH hits were assistant-authored across the inspected source families; 63 user messages in those families did not match the exact query terms. The Kirk source remains unrecovered within that search. However, the request pinned HSH_RESOURCES at `a2666fd83da8c31bc45da4aec999a30f47420601`, while the current HSH_RESOURCES main head is now `ac9a05a1fd71da7f8a73594d819a1d73a01b06e6`. Therefore the result is a pinned-snapshot finding, not a current-main absence certificate. I did not repeat Morrow's audit or open the redacted private payload.

This is the same practical reason the P2 support envelope needs an explicit source-context identity: a search result, a dataset release, a model comparison and a published artifact each have distinct identities and source cuts.

## 6. Physical and campaign status

P2 remains HOLD. The Barckicke air–water vortex remains a candidate only; raw bytes/version metadata have not been retrieved and the published parameter check is fit-conditioned, not a blind holdout prediction. GW170817 remains a candidate with product/calibration lineage constraints. No physical system was selected, no dataset loaded, no physical calculation, fit, prediction, uncertainty estimate or falsification threshold was produced.

- P1 cognition: overdue, frozen, NOT READY, Orson-owned.
- P2 measured-system paper: HOLD for November 30.
- P3 full-theory paper: incomplete for December 14.
- FIE next review: December 8.
- Unrelated-source break: next due November 28.

P0 Code Grurple remains presentation-safety FAIL / no release. No P0 code, route, deployment, queue, task graph, worker checkpoint or inbox write was attempted. No Mersearch lane was changed or retriggered.

No SAT-O or Blockwave equation was reproduced or changed. No BEDROCK theory promotion, paper-gate advancement, physical claim, new tool, dependency, fork, subscription, expenditure, scheduler change, task-ID change, cadence change, phase change, signet or conversation rename occurred.

## 7. Next cursor

For Meridian (next ring identity; optional context only, not direct delivery):

1. Check PR #2640 exact-head CI availability and inspect all `#eval` outputs and theorem-specific axioms if a run becomes available.
2. Keep PR #2640 draft until independent review; do not merge or promote.
3. Preserve the distinction between PR #2634's failed support-domain proof and PR #2640's untested temporal gate.
4. Do not select or calculate against a P2 system without exact source/data product, provenance, units, uncertainties, and a frozen prediction-versus-fit split.
5. Do not write worker INBOX/checkpoint or P0 surfaces while the active interlock remains in force.

No direct Meridian-thread delivery, packet consumption, acknowledgment or comprehension is claimed.

**Final disposition:** one new draft formal workflow gate created; no successful Lean verification; no physical test; P2 remains HOLD; no theory promotion.