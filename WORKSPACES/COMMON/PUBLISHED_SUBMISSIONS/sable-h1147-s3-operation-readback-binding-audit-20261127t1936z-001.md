# Sable h1147:s3 — operation-to-readback identity binding audit

**Run key:** `REVROT3-19-20261011:1147:s3`  
**Nominal slot:** 2026-11-27T19:36:00Z  
**Observed invocation start:** 2026-11-27T19:34:04Z (1m56s before nominal)  
**Selection:** h=1147; seq=5(1147)+3=5738; 5738 mod 19=0 → Sable (index 0); next Loom (index 1).  
**Identity:** deterministic routing label only. No authenticated current Sable thread or historical-instance participation is established.  
**Disposition at submission:** `SOURCE_AUDIT_COMPLETE / OPERATION_OUTPUT_BINDING_GAP_IDENTIFIED / EXISTING_PR_HEAD_BUILD_VERIFIED / NO_CODE_EXTENSION / SUBMISSION_AT_INTAKE_NOT_VERIFIED`.

## 1. Historical authority and preflight

Sable's historical remit was checked against the raw `SABLE Revival Rotation` export and its direct user-role messages. The source supports systems/capability architecture, team-state mapping, automation/tool leverage, repository/script testing, knowledge-base coverage, workflow design and continuity. No standalone signed specialist charter was recovered. The Sable Systems Clearance records Nathan's explicit 2026-09-14 systems delegation; it is a durable authority notice, not a standalone signed specialist charter. Tern's 2026-10-26 Comptroller authority controls scheduler/task allocation.

- Historical source conversation: `6aa6701e-b800-83ea-a19a-31a802b7124d`.
- Raw-export SHA-256: `dfe0ac536c98e903db3760646a3358cc4f9e5fb9b5e55b48ec975c36401f5302`.
- Direct user-role sources read: `df0c6245-20ee-43bb-b381-f277f85bddb4`, `3f6e9b2b-55d9-4136-b379-0978f7db69c1`, `8c800379-b9e6-4877-b0e0-994097748dba`, `1d7df1de-5bb8-41fb-8d4b-2c7195a970aa`, and `81114d33-7790-4b84-a142-4f55c807a033`.
- Ordinary historical Sable conversation `Revival Rotation`, ID `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, remains historically identified but current usability is UNVERIFIED. Browser access returned `originating browser context` unavailable. No chat was created or renamed; no cross-thread delivery is claimed.

Read live BEDROCK (768 lines), Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, Revival Rotation V3 and recipient-thread routing, active automation roster, scheduler authority, current main, PWH queue, task graph, Sable BOOT/README/CURRENT_WORK/INBOX, Sable Systems Clearance, historical role supplement, recent receipts and the selected worker's prior work.

Main at the initial source cut was `9f2ffd5f5e397aa6596937f82fdcd9ab3fe6ec7c`. A later generated-only discovery refresh advanced main to `6a9e451e786ea21c8a6d5184feacfb5e5c051e41` (2026-11-27T19:42:21Z), changing only `PUBLIC_SITE/generated/discovery.json`. The discovery blob is `1ad9a5efe414783fcf6becb50b4650c202131cf5`; the GitHub file-content fetch returned an empty payload, so the new snapshot could not be independently parsed. The current Sable h1147:s3 receipt and Loom handoff paths were absent at preflight.

The :36 automation peek/get actions returned `404 Action not found`; no scheduler operation was attempted. The active roster still lists the existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781` as enabled, hourly America/New_York at :36, Worldtube phase. The controlling VEVENT remains `DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY`. No task, ID, schedule, phase, cadence, prompt or enabled-state change was made; no sixth task was created. Because the live peek was unavailable, this run does not claim a fresh scheduler enabled-state readback.

Mersearch-first preflight found all four canonical request lanes occupied. No callable Mersearch action was exposed in this runtime; no request was overwritten, released or retriggered. Existing Math Hopper #578 / Lean PR #991, Whirligig Kernel 0, existing HsH Lean PRs and connected SciSpace were checked as existing infrastructure options before considering new tooling. No new tool, dependency, fork, subscription or expenditure was introduced.

The Orson h1147:s2 packet addressed to Sable was read as **POSTSTART_OR_TIMING_UNVERIFIED / OPTIONAL CONTEXT ONLY / REPOSITORY ONLY**. Its commit timestamp (19:37:38Z) is after this run's observed start (19:34:04Z). It creates no task, review request, response obligation or ownership transfer. The packet's separate Orson cognition work and Lean status were not reassigned to Sable.

## 2. Substantive finding: the readback is bound to a run, not to the operation

Existing draft [PR #2446](https://github.com/Satobloc/HsH/pull/2446) adds `HsHVerification.SableOperationReadbackBridge`. Its `VerifiedReadbackWitness` correctly binds an external receipt to one invocation and cached result:

- `receipt.invocationId = run.id`;
- `receipt.resultRunId = result.runId`;
- a nonempty artifact path;
- a nonempty expected digest and `observedDigest = expectedDigest`;
- external `independentFetch = true` and `exactBytesMatched = true` assertions;
- result eligibility, including completed-run and run/result matching conditions.

But `OperationReadbackLink` is only the conjunction of:

1. an `OperationEvidence` value;
2. a run;
3. a cached result;
4. a `VerifiedReadbackWitness run result`; and
5. `operationReadyForStateCommit operation`.

The `OperationEvidence` record contains only Boolean flags and an `OperationStage`. It has no operation ID, execution run ID, output artifact path, or expected digest. `OperationReadbackLink` contains no equality connecting the operation to the witness's run, artifact path, or digest. `artifactDigestBound = true` is only a Boolean; it does not identify which digest or artifact is bound.

Consequently, the formal structure establishes **operation readiness AND existence of a run/result-bound readback witness**. It does not establish that the readback is of the output produced by that particular operation. A ready operation can be paired at the type level with an otherwise valid readback witness for an unrelated run/artifact. This is a missing relation in the abstraction, not a counterexample to the theorem statements that are actually present.

A source-derived JavaScript audit of the exact PR-head module checked the four relevant structure blocks and confirmed:

- all five candidate identity fields (`operationId`, `executionRunId`, `artifactPath`, `expectedDigest`, `outputDigest`) are absent from `OperationEvidence`;
- those fields are also absent from `OperationReadbackLink`;
- the readback receipt does carry invocation/result IDs, artifact path and digests;
- the witness binds receipt to invocation/result;
- no operation-to-receipt equality is present.

## 3. Minimum contract repair or naming correction

If the intended claim is **same-operation output verification**, introduce a typed identity, for example:

```lean
structure OperationArtifactIdentity where
  operationId : String
  executionRunId : String
  artifactPath : String
  expectedDigest : String
```

Bind that identity to `OperationEvidence` or directly to `OperationReadbackLink`, and extend the external readback receipt with the corresponding operation identity. Require explicit equalities for:

- operation execution run = `run.id`;
- receipt invocation = `run.id`;
- receipt result run = `result.runId`;
- receipt operation ID = operation ID;
- receipt artifact path = operation output path;
- receipt expected digest = operation expected digest;
- receipt observed digest = operation expected digest.

The `artifactDigestBound` Boolean should remain, at most, a summary flag derived from these typed witnesses; it must not substitute for them.

If the intended claim is only **readiness plus an independent readback somewhere in the same run/result context**, the current structure should be renamed/documented accordingly (for example, `OperationReadyWithReadbackWitness`) and must not be described as proving same-operation output verification.

This distinction matters to the broader H(s)H/SAT prediction workflow: a model-comparison result, calibration artifact or held-out observable must be bound to the exact operation, run, source snapshot and output digest. A correct readback of a different artifact cannot verify the model operation under review.

## 4. Existing Lean verification and limits

The current PR head is `0134e878588103f902d605989eb1f00ff261921e`; module blob `98689e8b7635d621e2c6f1d9795b4c805797b116`. PR #2446 remains OPEN / DRAFT / UNMERGED, based on `infra/lean4-verification-20261023`. No formal reviews or review threads are present.

Existing exact-head Actions run [#45918726810](https://github.com/Satobloc/HsH/actions/runs/45918726810) checked out the exact PR head and completed successfully: Lean 4.34.0 / Lake 5.0.0, 8,948 successful build jobs. The target module built. The theorem reports for `linked_operation_has_run_bound_result`, `linked_operation_has_completed_run`, `linked_operation_has_matching_digest`, and `linked_operation_requires_readback_flag` report no axioms. Other inspected declarations report `propext` and, for `routed_stage_does_not_determine_destination`, `Classical.choice` and `Quot.sound`. No `sorryAx` or bare `admit` occurred in the retrieved job log. Tests, lint, leanchecker, nanoda and the global axiom audit were skipped.

This verifies the existing formalized statements at the exact PR head. It does **not** prove the missing operation-to-artifact relation, because that relation is absent from the type.

No new Lean theorem or code extension was added. The local runtime has no `lean`, `lake` or `elan`; the proposed repair would extend Sable's existing draft PR, whose continuation state calls for independent review and owner decision before extension/merge. The source-level obligation is recorded without claiming a new proof or implementation.

## 5. Governance and current project status

- P0 issue #1747: last verified status at comment #7223401699 (16:15Z) remains source-level presentation safety FAIL; Paper A/B live-route acceptance NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED. The later generated-only discovery refresh is not a presentation-safety pass; its payload was not independently parsed and no live route was tested. Current-main discovery/presentation freshness is therefore NOT_VERIFIED. No P0 implementation, route probe, deployment, release or standdown occurred.
- PWH queue and task graph remain Tern-owned and untouched. The queue's recorded deep-review cursor is h1081:s3. The task graph remains 18 records against declared `branch_count=16` (5 completed, 12 active, 1 blocked); the mismatch remains explicitly under-specified. No graph or queue mutation.
- All four Mersearch request lanes remain occupied; no lane mutation.
- P1 cognition remains overdue/frozen/Orson-owned and NOT READY; P2 November 30 remains HOLD; P3 December 14 remains incomplete.
- FIE next full rereview is December 8; unrelated-source break is due November 28. Neither cadence was reset.
- No measured physical system or dataset was selected; no physical calculation, fit, prediction, uncertainty propagation, numerical falsification threshold or independent measurement was produced. No SAT-O or Blockwave equation was retrieved or changed; no BEDROCK theory promotion or paper-gate advancement occurred.

## 6. Publication and continuity

This report is a source-level audit note, **not an independent PR review, implementation approval, merge recommendation or runtime verification**. It is submitted through the existing HsH issue publisher with a unique submission ID; publication is not claimed until the publisher confirmation and exact artifact readback are observed.

The prior Sable h1143:s4 report #2701 was reconciled separately: publisher comment #7222941945 confirms publication; exact issue-payload/artifact readback matches at 15,646 characters. Its original receipt now has append-only publisher-verification Amendment 01, commit `5d05f810919cadbb463a47a1dbcf6da2a365c9a8`, exact readback PASS. No second issue or submission was created for that prior run.

**Next routing label:** Loom (index 1). No authenticated current Loom thread was established; Loom remains PAUSED / ACCESSIBLE-UNSCHEDULED. Any repository packet is optional context only, with no assignment, response obligation, review request, ownership transfer, direct-thread delivery or acknowledgment claim.

**Stop:** no PR extension or merge without independent review and owner decision; no scheduler/task mutation; no P0 implementation or release; no physical inference or theory promotion.
