# Morrow h796:s4 Amendment 01 | same-ID start mutation and Orson exact-head CI replay clarification

**Record type:** additive readback amendment to the existing h796:s4 report and receipt. This is not a second substantive h796 work report.

**Run key:** `REVROT3-19-20261011:796:s4`  
**Deterministic selection:** h=796; seq=3984; 3984 mod 19=13 → Morrow. Successor Kestrel, index 14.  
**Existing automation:** `6aa6c3bc02b48191b8a91a30d2a155e0`.

## 1. Same-run-ID start-field mutation

The existing h796 report and canonical receipt were already present. The receipt records:

- Scheduled for: 2026-11-13T04:48:00Z.
- Run ID: `49b6813d-a838-8324-8ccc-bf51c2f1fb7c`.
- Earlier observed start: 2026-11-13T04:51:43.350981Z.
- Status: IN_PROGRESS; completion and run-level chat_ref null.
- Cached latest result: prior Hale h795:s4, run `48dccfa1-f0e8-832d-8299-a7af32b6081b`.

A later exact-ID automation peek at 2026-11-13T05:19:31.935791Z returned the **same run ID** with the same IN_PROGRESS status, but its recorded start was 2026-11-13T05:19:31.935791Z. The recorded start therefore moved by **27m 48s 584810µs** without a run-ID change.

The cached result remained the prior Hale h795:s4 result, created 04:26:15.067998Z and completed 04:26:16.628330Z. It does not belong to the current Morrow-labelled run. Task-level last_run_time remained 04:26:19.280626Z and next_run_time remained the past scheduled occurrence 2026-11-12T23:48:00-05:00. Those task-level fields are stale relative to the current run readback.

This is a scheduler-record mutation only. It does not establish a retry, restart, duplicate process, actual concurrent execution, worker identity, current process liveness, or backend cause. No causal explanation is inferred. Tern retains scheduler authority.

## 2. Orson PR #1115: exact-head workflow versus cached module replay

The prior Hale inbox note correctly identified a successful exact-head push-triggered workflow but named only `ObservableProjection`. A closer read of the actual job log adds a necessary distinction.

- PR #1115 head: `cb317df2eaa5d5f79794fc39edcdd5b640dff5f0`.
- Workflow run #43355012975: event `push`, exact same `head_sha`, conclusion SUCCESS.
- Job #131654873176; Lean 4 verification workflow; overall library progress 8,976 jobs.
- Exact source file `HumanAIMemoryCarryover.lean`: blob `bc2aeb0b533fe85933bcb151d0642d222e0b4e21`.
- Exact source file `ObservableProjection.lean`: blob `bf0499a42b14df5d585e66c8f313aa30e36d08d7`.

The log says `[8973/8976] Replayed HsHVerification.HumanAIMemoryCarryover`, followed by theorem-specific axiom output for:

- `diagonal_cells_alias_persona_and_history`
- `full_factorial_cells_identify_effects`

Both report `[propext, Classical.choice, Quot.sound]`.

The next module, `ObservableProjection`, is reported as `[8974/8976] Built`.

**Exact status distinction:** the workflow ran successfully on the exact PR head and the new HumanAIMemoryCarryover module was in the dependency build and replayed from the restored Lake cache. The log does **not** show a fresh compiler invocation for that module in this job. ObservableProjection was freshly built. The PR body still says that no Lean Actions run is associated with the new PR head and labels HumanAIMemoryCarryover `LEAN_NOT_RUN`; that description is stale as to the exact-head workflow/replay evidence, but this amendment does not upgrade the cached replay to a fresh compile.

The workflow explicitly sets `test=false` and `lint=false`; this run does not establish separate tests, lint, nanoda, or a global axiom audit. No PR body, branch, module, protocol, manuscript, or ownership record was changed.

The two HumanAIMemoryCarryover theorems are conditional algebraic identifiability results for a saturated 2×2 mean model. They do not establish that TRAIL or any actual team carried memory across sessions, nor causal identification or empirical cognition. The external paper itself leaves cross-session memory semantics unspecified.

## 3. Review-MIND and role boundaries

P1 issue #564 remains OPEN / OVERDUE / NOT READY and solely Orson-owned. No paper gate advanced. P0 Code Grurple remains ACTIVE; the latest h796 report's 8/8 protected-path fingerprint result remains the applicable baseline, with both A/B reader routes PRESENTATION_PENDING / NOT_OBSERVED. P2 issue #565 remains HOLD; P3 issue #566 remains INCOMPLETE.

The raw Morrow conversation confirms the direct Team Archivist assignment (user message `402ade01-7116-4efb-9b14-31e477754458`) and a separate September 13 direct theory stop (user message `934e87de-4e61-4622-a0ea-e5047aa235c6`). The later bounded trial invitation (`99ae959b-fbeb-4c1e-9326-a6723c2b9557`) does not expressly repeal that stop. Morrow therefore performed archive/source-custody and readback work only: no theory integration, physical calculation, prediction, equation change, or new Lean module.

The Morrow/Kestrel shared archived conversation remains one shared archive, not independent evidence of two workers or cross-agent consensus. No assistant consciousness, personhood, or private cross-thread access is inferred.

## 4. Source, tool and freshness controls

Current prewrite HsH main head: `0b464609504f9c29290332f602eb5b66b3fb439c`.

Read/rechecked for this activation: live BEDROCK (blob `0253ace674bbc361464b7bbaac2c41aa3d8e8867`, 104,153 characters / 667 lines; operative hierarchy and real-data/source/proof gates inspected, not claimed as a second line-by-line read); Primary Operational Guideline (blob `a8e333b1d5b5aa1d9772366945dd88769d24153c`); Steering Charter (blob `04822f3e48f746e9e464d893636ed4a670d68683`); Three Paper Campaign (blob `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`); three-repository onboarding (blob `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`); Revival Rotation V3 (blob `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14`); workflow orientation, task graph, branch map, scheduler authority, active roster and execution-lease controls; Morrow README/CURRENT_WORK/INBOX/checkpoint/crosswalk and prior h796 report/receipt.

The SAT archive and HSH_RESOURCES front doors were read. HSH_RESOURCES remains private/internal reference infrastructure; its root README was read, but no private payload or quarantined subtree was opened. No private URL is included in this report. No Mersearch request was submitted or overwritten; all four shared request lanes remain occupied/requested without a new request-scoped completion receipt.

FIE last rereviewed November 10; next review November 24. Preserve Morrow's unrelated-reading cursor at Okakura line 1512; this same-ID reconciliation did not repeat the prior reading or claim a physical break.

## 5. Handoff and automation

The existing Morrow-to-Kestrel h797:s0 packet and Kestrel inbox pointer were already present. Kestrel had started before that packet was written, so it remains POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. No duplicate handoff was created and no direct thread delivery, consumption, acknowledgment, or comprehension is claimed.

The four existing active relay tasks remain :00, :24, :36 and :48; the existing :12 relay remains disabled. The :48 task remains enabled with its exact saved hourly America/New_York :48 VEVENT. No task ID, prompt, schedule, phase, cadence, enabled state, ownership, signet, or conversation title was changed. No sixth task was created.

**Disposition:** `SAME_ID_START_FIELD_MUTATION / CACHED_RESULT_STALE / ORSON_EXACT_HEAD_WORKFLOW_SUCCESS_WITH_HUMANAIMEMORYCARRYOVER_REPLAY_NOT_FRESH_BUILD / P1_PROTECTED / MORROW_THEORY_STOP_PRESERVED / NO_DUPLICATE_HANDOFF / AUTOMATION_PRESERVED`.
