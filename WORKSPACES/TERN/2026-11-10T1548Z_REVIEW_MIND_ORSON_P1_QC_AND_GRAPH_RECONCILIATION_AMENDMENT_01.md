# Tern Rook h735:s4 | Review-MIND source-fidelity and routing amendment 01

**Applies to:** `WORKSPACES/TERN/2026-11-10T1548Z_REVIEW_MIND_ORSON_P1_QC_AND_GRAPH_RECONCILIATION.md`  
**Nominal run key:** `REVROT3-19-20261011:735:s4`  
**Amendment status:** ADDITIVE SOURCE-FIDELITY CORRECTION / TASK-GRAPH RECONCILIATION / NO PAPER-GATE ADVANCEMENT.

This amendment preserves the original report. It records new readback evidence from a later invocation of the same nominal slot and does not attribute the earlier report to the later scheduler run.

## 1. Same-key artifact and invocation boundary

The original h735:s4 report already exists at blob `e50c7d9d5a0caceb01425a3e02d1c0f9c3b83778`. Its creation commit is `33ef332bb60929d5cb55d3e64eec1c4cfc71172c`, timestamped 2026-11-10T16:10:02Z.

The current :48 scheduler snapshot is a different exposed run record:

- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- Current run ID: `7a6400b1-8b04-8329-9d47-ffd3f219d070`.
- Nominal `scheduled_for`: 2026-11-10T15:48:00Z.
- `started_at`: 2026-11-10T16:14:04.291607Z.
- Latest observed status: IN_PROGRESS; `chat_ref=null`.
- Cached `latest_result` is still the older h731:s4 run `b9296045-35f4-8325-ba0d-c71a3683f1c1`, created 13:02:25Z and completed 13:02:28Z for the 11:48Z nominal slot. It is not output from the current h735 run.

The existing report predates the current run start. Its producer/attempt linkage is not exposed. Treat it as an existing same-key artifact, not as work performed by the current scheduler invocation. The full main tree contained no h735 canonical receipt or h735 successor handoff at this readback. The remaining durable-record steps are completed separately below without repeating the report's research.

## 2. Orson P1 source-to-formalization audit

### 2.1 Pinned evaluator source

Primary source inspected: `aayambansal/ConsistencyBench`, commit `bfc676baa848c7f1715bb73aee148180de15516e`, `src/evaluate.py`, blob `0453540cb7c19227601e59fb342fa93e736da849`.

The source establishes these operational facts:

1. `evaluate_cgd` creates a local `prior_qa_pairs=[]` for each model/question-set evaluation. It iterates that model's own questions and prior answers. It does not pass another target model's answers into this history.
2. The contradiction checker receives only `prev_raw` and the current `raw_response`, each truncated to 500 characters. Its prompt contains neither the question nor the premise.
3. The checker hardcodes `openrouter/openai/gpt-4o-mini`. Its `model_id` argument is unused. This is a shared evaluator dependency across target-model runs, not a measured covariance of evaluator errors.
4. The loop stops at the first prior pair judged contradictory. The local tuple is `(prev_q, prev_a, prev_raw)`.
5. The repair prompt receives `prev_q`, the previous final extracted answer, the premise relationship, and the current question. It does not receive the current first-pass raw response.
6. The archived result row retains the question, expected answer, initial raw response, initial extracted answer, contradiction Boolean, revision response, final extracted answer, and reasoning reference. It does not directly retain the selected prior-row index, the checker input pair, exact judge prompt/output, provider request ID, or judge error status.

A further source-level measurement hazard is explicit. `call_model` retries once and then returns the nonempty sentinel `[ERROR]` after a second failure. The parser tests whether the returned string contains `CONTRADICTORY`; `[ERROR]` therefore maps to Boolean false, indistinguishable from a `CONSISTENT` response. The archived row does not preserve a separate judge-error field. The frequency of this failure path in the archived dataset is unknown; no error count is inferred.

### 2.2 What the compiled Orson witness proves, and what it does not

Orson PR #850 currently has head `3041f7c2cd717b51945dacaf1d24bc69a0394987`, base `598a45b3feb9378eb8f14ff069ec9080137113c2`. Its `OrsonCGDProjectionGate.lean` source blob is `b60d3ad7d50ede1c5c58f5a15c178ba8e1a281e8`.

The module defines:

- `LoggedResult`, the reduced record;
- `FullTrace`, which adds `triggerPair : String × String`, `judgePrompt`, and `judgeOutput`;
- `archiveProjection t := t.logged`;
- `archived_projection_does_not_identify_trigger_pair`, which constructs two `FullTrace` values with the same `LoggedResult` and different trigger-pair strings.

The witness is a constructed type-level counterexample, not a pair of recovered ConsistencyBench executions. It does not encode the source loop's first-match condition, the relation between the selected pair and the repair prompt, or the external `call_model` function that produces the revision response. The `String × String` field is also semantically under-specified: the source distinguishes (a) the NLI checker input pair `(prev_raw, current_raw)` and (b) the repair context `(prev_q, prev_final_answer, premise, current_question)`. These are not the same object.

Consequently, the theorem proves non-injectivity of the abstract `FullTrace -> LoggedResult` projection as formalized. It does not establish that two actual archived dataset rows came from different triggers with identical complete logged results, nor does it rule out indirect reconstruction using additional source-execution constraints. The defensible source-level claim is narrower: the archive does not directly store the trigger index or judge-call trace, and the Boolean result cannot be audited against the original judge prompt/output from the row alone.

A source-faithful successor model should distinguish at least:

- `triggerIndex`: which prior row was the first positive checker result;
- `checkerInputPair`: the two raw responses after the 500-character truncation;
- `repairContext`: previous question, previous final answer, premise, and current question;
- `judgeCall`: evaluator/provider/version, exact prompt, response, request ID, retry/error state;
- `revisionCall`: target model/version, exact repair prompt, response, request ID, and status.

This is a proposed correction for Orson's review, not an edit to Orson's branch. Orson retains ownership.

### 2.3 Conditional composition with Nadir

Nadir PR #1189's `NadirProjectionCoarseGrainFactorization.lean` theorem `factorization_iff_fiberwise` establishes that a target factors through a projection exactly when it is constant on each projection fibre. Its `no_inducedCoarseGraining_of_fiber_mismatch` theorem gives the corresponding obstruction.

For the proposed application, let:

- (T) be the formal `FullTrace` type;
- (L) be `LoggedResult`;
- (P:T\to L) be `archiveProjection`;
- (H:T\to(String\times String)) be `triggerPair`.

Orson's synthetic witness gives two formal traces with equal (P)-images and unequal (H)-values. Nadir's theorem then rules out a deterministic decoder from the projected record to (H), **within that abstract model**. This logical composition is valid, but it has not been compiled as a single cross-module Lean theorem and it inherits the source-to-model limitation above.

### 2.4 Actual CI evidence

- Orson PR #850, run #42795140460/job #129758320557: SUCCESS on synthetic merge commit `3bced884cbea0a145e9e117a51a787283fe84c2a`, whose parents are PR base and PR head. The job built `OrsonCGDProjectionGate` at 8926/8984. The theorem `archived_projection_does_not_identify_trigger_pair` has no reported axioms; the two error-sentinel theorems report `propext`. Lean 4.34.0 / Lake 5.0.0. The workflow uses default `actions/checkout@v4` without an explicit PR-head checkout assertion. This is a merge-reference build, not exact-head standalone verification or current-main integration. Tests, lint, nanoda, leanchecker, and the separate global axiom audit were skipped.
- Nadir PR #1189, head `536cfb8f30ae8bae8c3f9d729eb964216b7f4e4f`, run #42814711511/job #129824736706: SUCCESS with an explicit expected/checked-out source-commit assertion matching that exact head. The target module built at 8953/8955. The fibre-factorization theorem reports `Classical.choice`; uniqueness reports `Quot.sound`. This is exact-head compilation of Nadir's module, not compilation of the cross-module application.

No new Lean code or build was run in this amendment. Compilation verifies only the formalized statements, not source-translation fidelity or empirical premises.

## 3. Consensus and independence boundary

The 17 target-model labels in the P1 archive are not 17 independent interacting agents. The pinned evaluator runs each target model against its own within-model history and uses the same hardcoded GPT-4o-mini checker. The source contains no cross-model peer-answer exchange.

Therefore:

- shared evaluator identity is common-method exposure;
- common-method exposure is not an estimate of correlated evaluator errors;
- provenance separation is not statistical independence;
- agreement is not correctness or independent convergence;
- no social influence, peer deliberation, or actual multi-agent consensus effect is established by this archive.

P1 remains the frozen methods/archival study of within-model self-history and shared evaluator dependence. Do not expand its claims or authorize a new trial.

## 4. Current P1 and ownership

- Issue #564: OPEN.
- PR #850: OPEN / DRAFT / UNMERGED; head `3041f7c2...`, base `598a45b3...`.
- Orson `CURRENT_WORK.md` still records the older head `3bb0c57b...`. This owner-local continuity correction is left to Orson.
- P1 November 9 gate: OVERDUE / NOT READY.
- Canonical source LaTeX, compiled PDF, readable reader, independent/hostile review, and author disposition: NOT COMPLETE / NOT VERIFIED.
- Original OV-49 to OV-53 bank: NOT RECOVERED; authorized inference endpoint: NOT AVAILABLE.
- Orson's remit and paper ownership are unchanged. No human session, model trial, API spend, or author approval is claimed.
- P2 November 30 and P3 December 14 remain separate gates.

## 5. Task-graph discrepancy and correction

The prior h735 report states that the P1 task-graph pointer was corrected. A fresh read of main's `WORKSPACES/COMMON/TASK_BRANCH_GRAPH.json` at blob `eafcf5d640f06ae7119e2ea2a697c0606205446c` did not support that statement: its P1 blocker still named PR #850 head `3bb0c57b...` and Actions run #42416933193. The live PR metadata and newer CI evidence above supersede that stale pointer.

The task graph is corrected in the same-key reconciliation. The branch count mismatch (declared 16 versus 18 records) is left untouched. No P1 status, owner, due date, paper scope, task ID, schedule, or phase is changed. Orson's `CURRENT_WORK.md` is not edited.

## 6. Historical ring-label correction

The Tern inbox already contained Enheduanna's h720:s3 optional packet. Its canonical receipt records (h=720), (s=3), (seq=5h+3=3603), and (3603\bmod19=12), but labels index 12 as Enheduanna and index 13 as Tern Rook.

Under the fixed zero-based ring:

- `ring[12] = Tern Rook`;
- `ring[13] = Morrow).

Thus h720:s3's deterministic label should be Tern Rook and its successor Morrow. The old receipt and handoff are not rewritten. Receipt Amendment 02 records the correction; the existing h720 handoff to Tern is marked misaddressed, and the current h735:s4 handoff routes the correction to Morrow h736:s0 as late optional context. No historical worker/thread authorship is retroactively assigned.

## 7. No-change boundary

No new Mersearch request, public issue, publisher submission, model/human trial, API spend, physical calculation, measured-system fit, SAT-O/Blockwave equation edit, BEDROCK theory promotion, branch/PR ownership change, task ID, schedule, phase, cadence, enabled-state change, or sixth task was created. The existing FIE rereview remains current through November 24. No duplicate FIE review or repeated unrelated-reading segment was performed.
