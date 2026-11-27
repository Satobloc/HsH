# Sable | h1128:s3 | Run/result binding and support–execution join

**Disposition:** `SOURCE_GROUNDED_ASSISTANT_RECONSTRUCTION / H1128_RUN_BINDING_WITNESS_ADDED / EXACT_HEAD_LEAN_UNVERIFIED / TWO_KEY_COMPOSITION_PROPOSED / NO_PHYSICAL_TEST`.

## 1. Selection, identity and continuity

The slot calculation gives **Sable** (ring index 0), next **Loom** (index 1). The ring label is deterministic routing metadata, not authentication of a historical worker or ChatGPT thread.

Sable's historical user-assigned remit is systems/capability analysis: workflow and team-state mapping, automation/external-tool testing, knowledge-base/resource surveying, extraction/checking/sampling/triage scripts, and modular knowledge-machine design. The direct-message source is retained in the Sable historical source supplement and archived `Sable Revival Rotation` export. No authenticated live Sable thread was established. This is assistant-level execution, not a claim that a historical Sable instance participated.

The existing automation remains enabled and unchanged. The current invocation was still `IN_PROGRESS` at the last scheduler readback, with no run-level `chat_ref`. Its cached `latest_result` belonged to the preceding h1127:s3 Kestrel run. The cached result is not attributed to the current invocation. The current run's task-level conversation pointer was not substituted for the absent run-level reference. No direct-thread delivery, consumption or acknowledgement is claimed.

Worker selection is computed from the nominal slot; actual start-time drift does not change the deterministic ring label.

## 2. Substantive improvement: compose scientific-input identity with execution identity

Two existing formal gates now cover different halves of a confirmatory result:

- [PR #2640 — support freeze gate](https://github.com/Satobloc/HsH/pull/2640): source-support identity, generation/digest, holdout identity, and freeze-before-first-access.
- [PR #2446 — Sable workflow operation gate](https://github.com/Satobloc/HsH/pull/2446): invocation/result binding, completion, run-level chat context, operation evidence and independent readback.

Neither gate alone establishes the joint provenance chain. The new architecture requires a typed comparison key:

`ComparisonRunKey = (SupportSpecID, HoldoutID, InvocationID)`

A confirmatory output must carry that exact key and satisfy all of the following:

1. The support specification and admissible domain are source-defined and frozen before first holdout access.
2. The result is bound to the exact invocation that evaluated that frozen support and holdout.
3. The invocation is completed; a cached result from another run or an earlier attempt cannot be inherited.
4. The output artifact and its digest are independently read back.
5. Calibration, instrument response, covariance, shared nuisance parameters, scoring rule and holdout partition remain the same across the H(s)H and standard comparator.

This is a proposed composition contract, not yet a theorem or integrated implementation. PR #2640 and PR #2446 remain separate draft branches. A future adapter must bind their source-defined identities without copying or weakening either gate.

The current invocation supplied a concrete negative case: its cached result had a different run identity, was older than the current start, and the current run had no `chat_ref` or completion timestamp. Therefore the cached result cannot satisfy the current invocation's readback gate.

## 3. Formal work on the existing Sable branch

I extended the existing [PR #2446](https://github.com/Satobloc/HsH/pull/2446), rather than opening a duplicate PR or inventing another workflow tool. The new `HsHVerification.SableRunBinding.H1128Snapshot` namespace records a source-grounded software-state witness:

- current invocation: `inProgress`, no completion timestamp, no run-level chat reference;
- cached prior result: completed, non-null prior chat reference, distinct invocation label;
- prior result creation/completion precede current invocation start;
- public code uses redacted identifiers and ordinal values `1 < 2 < 3` to preserve the observed ordering without exposing scheduler identifiers or wall-clock run metadata.

The witness is not a physical fixture, model-identity claim, or evidence of an LLM's internal state.

**Verification history:**

- The first new exact-head Lean attempt, [run #45918255749](https://github.com/Satobloc/HsH/actions/runs/45918255749), failed. It found one theorem-result type mismatch and three `Decidable` failures from trying to `#eval` noncomputable propositions. The failed theorem report included `sorryAx`; no proof was accepted.
- I corrected the theorem by projecting the run-binding conjunct and replaced those proposition evaluations with executable record-field and ordering checks.
- Scheduler identifiers and wall-clock values were then redacted from the public witness; the ordinal values preserve only the observed order.
- The corrected branch head is `0134e878588103f902d605989eb1f00ff261921e`. The only run returned for that head was the unrelated push-triggered conversation-JSON workflow, which failed; it is not a Lean run. The Lean workflow's `workflow_dispatch` trigger is present, but no dispatch action is available in this runtime, and no local Lean/Elan/Lake executable is installed.

**Current disposition: `SUBMITTED_NOT_VERIFIED`.** The corrected code has not received an exact-head Lean compile. No theorem-specific axiom result is claimed for the new witness. PR #2446 remains OPEN / DRAFT / UNMERGED and lacks independent review. Its earlier head had a successful exact-head build, but that does not verify this extension.

The separate support gate [PR #2640](https://github.com/Satobloc/HsH/pull/2640) has since completed its exact-head Lean run [#45912421462](https://github.com/Satobloc/HsH/actions/runs/45912421462) successfully. Its theorem-specific axiom reports contained no `sorryAx`; standard dependencies included `propext`, `Classical.choice` and `Quot.sound`. Global axiom audit, tests and lint were skipped. It remains draft/unmerged and independently unreviewed.

## 4. Physical prediction boundary

The composition contract improves the provenance required for a future H(s)H-versus-standard comparison. It does not supply the missing physical map.

| Required element | Current standing |
|---|---|
| Identifiable measured system and versioned raw data | Not selected/retrieved for the current P2 gate |
| Source-derived geometry-to-observable projection and composition maps | Not established |
| Shared calibration, instrument response, covariance and nuisance parameters | Not populated for a confirmatory comparison |
| Independent holdout and exposure history | Not selected |
| Predicted observable and standard comparator | No H(s)H-specific map yet |
| Numerical falsification threshold | Not assignable without measured data and uncertainty model |

No physical calculation, fit, prediction, uncertainty estimate or falsification threshold was produced. No finite worldtube thickness, twist or contact surface is promoted as physically forced. No SAT-O or Blockwave equation was altered. P2 remains HOLD; no BEDROCK theory promotion occurred.

## 5. Workflow health and authority

- **P0 Code Grurple:** still ACTIVE. The latest P0 control record retains presentation-safety FAIL and live visitor-route acceptance NOT OBSERVED. Tern retains release/standdown authority; Meridian implementation ownership and Mercer independent Paper A/B QA remain unchanged. No P0 code, release, site or manuscript action was taken.
- **PWH:** Tern's latest published deep review is h1123:s2. The canonical PWH queue still ends at h1081:s3 and does not incorporate that later review. The h1123 review explicitly records the queue/graph/worker-checkpoint write block under P0. At least five subsequent completed work products are now visible, so the next deep-review trigger is due for Tern to reconcile. No queue, graph, owner, priority or due-date mutation was made.
- **Paper campaign:** P1 cognition remains overdue/frozen/not ready and Orson-owned; P2 measured-system paper remains HOLD for November 30; P3 full-theory paper remains incomplete for December 14.
- **Cadences:** FIE rereview remains due December 8; the unrelated-source break remains due November 28. Neither was reset.
- **Receipts:** the current run has no completed run-bound result at final readback. This report is not represented as a completed automation receipt; the current status remains in progress.

## 6. Successor context

Next deterministic label: **Loom**. The successor execution had already started by the final readback and had no run-level `chat_ref`. Loom's workspace is `PAUSED / ACCESSIBLE-UNSCHEDULED`; no authenticated live Loom thread was established. Any repository packet is poststart optional context only: no task, response obligation, review request, ownership transfer, direct chat delivery, consumption or acknowledgement is claimed.

Useful context: the two-key comparison identity above; PR #2446's corrected but unverified h1128 witness; PR #2640's successful exact-head support gate; P2 HOLD; P0/PWH authority boundaries. Loom's corpus-tagging/enrichment specialty is unchanged.

## 7. Non-actions

No automation or task configuration, cadence, owner, queue, graph, worker inbox, worker checkpoint, signet or conversation title was changed. No sixth task, new automation, new tool, dependency, fork, subscription or paid service was created. No private HSH_RESOURCES payload was opened. No cross-thread delivery or authenticated worker participation is claimed.
