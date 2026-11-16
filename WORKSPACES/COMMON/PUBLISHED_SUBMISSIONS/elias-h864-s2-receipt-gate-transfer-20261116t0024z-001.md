# Elias Kern h864:s2 | cross-task transfer test of the receipt-identity map

**Run key:** `REVROT3-19-20261011:864:s2`  
**Nominal slot:** 2026-11-16 00:24 UTC  
**Selection:** h=864; seq=5×864+2=4322; 4322 mod 19 = 9 → Elias Kern (index 9); immediate ring successor Nadir Voss (index 10).  
**Participation:** `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN`. The ring label is not authentication of a historical Elias instance or conversation.  
**Disposition:** EXACT POC SOURCE SELF-TEST 7/7 PASS / CROSS-TASK RECEIPT-IDENTITY TRANSFER TEST CONFIRMS MAP V0.2 CLASSIFICATION / POC AND PR UNCHANGED / TRACK B DISPOSITION STILL PENDING.

## 1. Historical authority and bounded revival

A bounded existing-thread-first lookup did not identify a currently usable Elias conversation. The personal-context search, Elias workspace, inbox, current checkpoint, prior receipts, and saved conversation references were checked. No raw originating conversation UUID/message UUID or standalone signed Elias charter was recovered.

The strongest direct role source is the Nathan-to-Elias instruction preserved in `WORKSPACES/ELIAS_KERN/INBOX.md`, dated 2026-09-24 13:47 ET: work with Nathan and Orson on Track A of the Top/Central/Branch/Hydra prototype, independently but in communication with Sable and Tern's Track B; exercise one bounded real-work mechanism per lease; record observed behavior and durable receipts; and do not treat the POC as production authority.

The current README is an assistant-maintained role synthesis. It limits Elias to prototype operation/documentation and withholds production-workflow and SAT/H(s)H theory authority. No historical Elias participation, direct-thread delivery, or acknowledgment is claimed.

## 2. Control and source preflight

Read the current HsH BEDROCK, Primary Operational Guideline, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding/front doors, Revival Rotation V3/V4, thread-first and navigation rules, scheduler authority, duplicate-run-key guard, current branch, task graph/PWH routing, Elias workspace and receipts, and the existing switchboard POC documentation/source.

Pre-work branch heads:
- HsH main: `9460d98533c7698b2d44f4e07beecbb94c1f3941`
- SAT archive main: `f6e3c914b3722cdd6b57b0a2f024446bb0247f97`
- HSH_RESOURCES main: `a9250b99319891f1effd0d3e49f72def65aa8dc5`

All three repository metadata records report zero forks. HSH_RESOURCES' root README states that it is private research infrastructure and that its contents are internal retrieval material, not a public cross-link surface. This report therefore does not reproduce a private repository URL or path.

The exact HSH_RESOURCES POC source blob is `49988a769389b2baf264a27d596ba7c3ff822b36`; the POC design document blob is `0a708813bac6e1e7dc763779ed080b6d7e27fd42`. The public HsH operationalization note identifies the POC as a sandbox, not production architecture, and preserves Track A/Track B independence.

Existing work was checked before proposing any new tooling: the POC itself, PR #951, Math Hopper #578 / PR #991, Whirligig Kernel 0, and the available SciSpace connector. Python 3.13.5 standard-library execution was sufficient. No new tool, dependency, fork, subscription, branch, PR, model trial, or expense was introduced. Mersearch is not exposed as a callable action in this runtime; all four canonical request lanes remain occupied/requested and none was overwritten or retriggered.

## 3. Exact-source POC execution

The retrieved 18,924-byte Python source was executed in Python 3.13.5. Its Git blob SHA-1 was independently recomputed from the Git blob header and exact bytes and matched `49988a769389b2baf264a27d596ba7c3ff822b36`. The source SHA-256 was `876393e188134f059a1e3f4f6daecd7465495e7124e7b6c1d9d44b7063dcdf2a`.

The existing `self-test` returned exit code 0 with all seven predicates true:
- directive preemption;
- War Room first source route;
- actor overlays differ;
- failed candidate prunes;
- passed candidate creates prediction/paper jobs;
- lease plan contains verifier and restore jobs;
- nested learning depth is present.

The existing `lease_receipt_gate` scenario emits:
1. `verify_durable_output_receipt`, relation `gated`;
2. `restore_displaced_lease`, relation `gated`, depending on the verifier job;
3. the rewrite “restore only after durable output receipt OR explicit failure packet.”

This is an order/dependency plan. The POC is a deterministic planner/state transformer, not a scheduler or an executable permission gate.

## 4. Actual :24 scheduler snapshot

The exact existing :24 automation was read by its known ID. It remains enabled with its original VEVENT:

```
DTSTART;TZID=America/New_York:20261001T142400
RRULE:FREQ=HOURLY
```

| Field | Current run | Cached latest result |
|---|---|---|
| Task ID | `6abda4c8eda88191bf23a6f2849e9a17` | Same task |
| Provider run ID | `7b0a1946-4d6c-832d-8a95-980021440c1a` | `6a3a12b6-1664-8324-b73f-6fe8dff349e2` |
| Scheduled for | 2026-11-16 00:24:00Z | 2026-11-15 23:24:00Z |
| Started / created | 00:19:14.768348Z | 23:31:15.382354Z |
| Completed | null | 23:31:15.857632Z |
| Recorded status | `in_progress` | Completed result |
| `chat_ref` | null | ChatGPT ref `6af0cffc-7e10-83e9-9385-22e7347fef4b` |

The task's configured `conversation_id` is also `6af0cffc-7e10-83e9-9385-22e7347fef4b`. That is an intended target, and the prior cached result carries a matching chat_ref; neither supplies a current-run thread binding.

The current run started 285.231652 seconds before its nominal slot. Task-level `last_run_time` still points to 23:31:17.276900Z, before the current run. `delivery_status` is unknown. These are record comparisons only; no retry, restart, concurrency, worker liveness, delivery, or backend cause is inferred.

## 5. Cross-task transfer test of execution-envelope map v0.2

The h860:s3 Elias report already applied the assistant-proposed v0.2 typed identity map to the :36 automation. This run applies the same map to a different existing lease, the :24 automation. It is a transfer test, not a new discovery of the general stale-result problem.

Relevant typed keys from the v0.2 proposal:
- `SlotKey = (taskId, scheduledFor, phase)`
- `RunKey = (executionNamespace, taskId, providerRunId)`
- `CachedResultKey = (resultRunId, createdAt, completedAt)`
- `ObservedThreadKey` exists only from a non-null `chat_ref` on the exact current run.
- `AttemptKey` exists only when the provider exposes an attempt ID.

Applying its partial-join conditions to the actual :24 snapshot:
- `SlotKey → RunKey`: identifiable from the exact task ID, scheduled time, and exposed provider run ID.
- `RunKey → ObservedThreadKey`: UNBOUND because the current run's `chat_ref` is null.
- `RunKey → CachedResultKey`: `STALE_RESULT_UNBOUND` because current run ID `7b0a1946-4d6c-832d-8a95-980021440c1a` differs from cached result run ID `6a3a12b6-1664-8324-b73f-6fe8dff349e2`.
- `RunKey → AttemptKey`: `ATTEMPT_UNEXPOSED`; no attempt ID is supplied.
- `ActorKey`: unavailable; the deterministic ring label is not an authenticated principal.

A read-only transfer probe supplied the actual task/run/result identifiers to the existing POC's `receipt_gate` Hydra event. It then compared the plan produced when `latest_result_run_id` mismatched the current run with the plan produced when the IDs matched. The output was identical in both cases. The verifier and restore jobs contain no task ID, provider run ID, run key, source-run witness, or artifact-digest binding.

**Observed result:** `ORDER_ONLY_GATE_UNBOUND_TO_CURRENT_RUN`.

This does not show that a restore action actually occurred or that production used this POC. It shows that the sandbox plan's current receipt-gate representation cannot distinguish a current-run receipt from a prior-run receipt. The v0.2 map correctly classifies the live snapshot without borrowing the prior result's chat_ref.

## 6. Existing formalization and limits

PR #951 remains OPEN / DRAFT / UNMERGED with zero formal reviews and zero review threads at inspection. Head: `f9fa0aad45408ab06e5430c834530854746235f0`. Its target branch is `infra/lean4-verification-20261023`; the PR's stored base is `61cc8b65ffed70296e0121dbae067892a79c81d4`, while the live target branch is `89ab283ae583aef69d6f89a36cc0e2d3b09bfe63`. Comparing the PR head with the live target reports DIVERGED, 77 commits ahead and 11 behind. No rebase, push, merge, or workflow dispatch was performed.

Existing PR modules include `EliasReceiptEvidenceAxes` and `EliasReceiptGateDependencyCoverage`. The latter formalizes a source-shaped verifier/restore dependency plan and counterexamples to a weaker name-presence test; it does not bind the receipt to the current provider RunKey. The v0.2 map's run-ID equality and non-null current-run chat_ref obligations remain proposed schema conditions.

No local Lean, Lake, or Elan executable is installed. No new Lean module or proof is claimed, and no exact-head Lean build was run. The map is an assistant reconstruction/proposal, not a source-authored implementation. Any Lean proof would establish only the formalized conditional relation, not Python-to-Lean translation soundness or production behavior. PR #951 and the POC remain frozen pending the independent Track B ELIAS-2224 disposition.

## 7. Before/after and next discriminating test

**Before:** the POC's receipt gate expressed ordering only; the :24 live run had a null current-run chat_ref and a cached result attached to a different provider run ID.

**After:** the exact POC self-test is reproducibly 7/7; the :24 transfer probe confirms that the existing gate output ignores run identity; the v0.2 map classifies the current run as unbound/stale. No source, POC, PR, adapter, production workflow, task graph, or scheduler state was changed.

**Candidate sandbox transfer test, only after Track B disposition and source-defined field approval:**
1. Construct two records for the same task but distinct provider run IDs.
2. Give the current run a null chat_ref and attach a non-null chat_ref only to the prior cached result.
3. Require the cached-result join to fail unless `latest_result.run_id = last_run.id`.
4. Require an ObservedThreadKey only from the exact current run's non-null chat_ref.
5. Keep attempt identity unexposed unless the provider actually supplies it.
6. Bind any receipt to a source-run witness with exact source, harness/command/environment digests, exit status, output digests, assertion manifest, and execution scope.
7. Positive control: matching run IDs plus exact artifact readback; negative control: stale prior-run result must not unlock restore.

This is a test candidate, not an implementation request. Track B remains free to KEEP / MODIFY / TEST / REJECT / DEFER independently. The existing ELIAS-2224 EvidenceLedger/subject-scope disposition remains pending; this transfer test does not satisfy it.

## 8. Project boundaries and freshness

P0 Code Grurple remains ACTIVE. P1 Orson cognition remains OVERDUE / NOT READY and Orson-owned. P2 measured geometry remains HOLD. P3 full theory remains INCOMPLETE. The November 9 minor-paper gate was missed; November 30 major and December 14 full-theory gates remain separate. FIE was last reviewed November 10; its next review is November 24.

No physical calculation, CODATA comparison, fit, prediction, independent measurement, SAT-O/Blockwave equation change, manuscript edit, paper-gate advancement, or BEDROCK theory promotion occurred.

Unrelated reading: SAT archive `SAT Mark V/TheTANGLE.txt`, lines 2221–2261. The previous cursor 2281 was beyond the current blob's 2,261-line extent; this pass read the actual final 41 lines and corrected the cursor to EOF (2262). No theory claim was extracted from the creative transcript.

## 9. Next ring label and automation

The immediate ring successor is Nadir Voss (index 10). No handoff or task was created because this Track A workflow evidence is outside Nadir's protected Lane 24 finite-core/SO(4) playground. No lane reassignment or ownership transfer.

The :24 automation remains enabled under the exact original task ID and VEVENT. Current run remains recorded `in_progress`, with null completion and null current-run chat_ref. No task, ID, prompt, phase, cadence, enabled-state, signet, or conversation-title change; no sixth task.
