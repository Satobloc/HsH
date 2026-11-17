# Elias Kern h902:s2 | exact duplicate receipt replay counterexample

**Nominal slot:** 2026-11-17T14:24:00Z  
**Run key:** `REVROT3-19-20261011:902:s2`  
**Selection:** h=902; seq=5×902+2=4512; 4512 mod 19 = 9 → Elias Kern (index 9)  
**Next ring label:** Nadir Voss (index 10)  
**Disposition:** SOURCE-TRANSCRIBED METHOD-LEVEL REPLAY / 8 OF 8 ASSERTIONS PASS / EXACT-DUPLICATE RECEIPT CAN FLIP THE COUNT GATE / CONTRACT AMBIGUITY, NOT A PRODUCTION INCIDENT / LEAN NOT RUN / TRACK B PENDING / NO POC OR PR CHANGE.

## 1. Authority and continuity

The direct-user Track A instruction is preserved in Elias's and Tern's INBOX records, dated 2026-09-24 13:47 ET: work on the Top/Central/Branch/Hydra and Threading prototypes, independently but in communication with Sable and Tern's Track B; exercise one bounded real-work mechanism per lease; record observed rather than intended behavior; and do not treat the POC as production authority.

No standalone signed Elias specialist charter, originating message UUID, or authenticated current Elias conversation was recovered. The current scheduled run has a null `chat_ref`. This is a source-grounded reconstruction in the scheduled execution, not historical-instance participation or cross-thread delivery.

The controlling sources read for this activation included live BEDROCK (blob `0253ace674bbc361464b7bbaac2c41aa3d8e8867`, 667 lines), the 2026-11-08 Primary Operational Guideline (blob `a8e333b1d5b5aa1d9772366945dd88769d24153c`, 511 lines), Steering Charter 2026-10-26 (blob `be44c424674764c602b5f618dfce528c0f97b0ef`), Three Paper Campaign (blob `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`), current workflow orientation, three-repository onboarding, Revival Rotation V3 and duplicate-run-key guard, current main, Elias CURRENT_WORK/INBOX, prior Elias receipts/reports, the PWH queue, and the existing Threading prototype/design documentation. HsH main at pre-write inspection was `5aa99b92f93dd364b8ef53c19ae5907652b8ba1c`; its immediately preceding commit changed only generated discovery metadata.

## 2. Relationship to existing work

This is an additive, narrower witness within the existing receipt-gate evidence family, not a new general discovery. Elias h875:s4 already demonstrated that the prototype's count-based receipt gate can accept records whose metadata refer to different provider runs; that report is the existing public receipt-gate record at [issue #1812](https://github.com/Satobloc/HsH/issues/1812). Elias h894:s4 separately tested repeated-VACATE time-origin replacement, and h898:s3 tested clock-domain/time-cap behavior. The present test asks a different, specific question: can an exact replay of one identical receipt row count twice toward `min_outputs`?

## 3. Exact source behavior

The existing Threading prototype source was fetched from the internal resource repository and pinned by Git blob SHA-1 `ce313e46b1b85ae35028b46a4196d2a945b535d8` (8,059 bytes). Its companion design document has blob `f87ff21918b6fa4804d090cdb9153aa0dd53d288`.

Relevant source lines:

- `OutputReceipt` fields (lines 35–41): `worker`, `artifact`, `seed_version`, `outcome`, `timestamp`, and free-form `metadata`; no receipt/event ID.
- `ThreadState.add_receipt` (lines 63–66): checks only that the receipt's `seed_version` matches the thread seed, then appends the row. It does not reject an exact duplicate.
- `distinct_workers` (lines 68–70): counts distinct worker-label strings.
- `state_threshold_met` (lines 78–88): counts receipt rows, distinct worker strings, and the presence of both `success` and `failure` outcomes.
- `sample_thread` (lines 124–129): `min_outputs=4`, `min_workers=3`, `max_hours=3.0`, and `require_success_and_failure=True`.

The source therefore distinguishes row count from worker-label count, but it has no explicit receipt-event identity or idempotent-admission rule.

## 4. Bounded executable replay

A small Python 3.13.5 harness transcribed only the inspected `add_receipt` and `state_threshold_met` behavior. It did not import or execute the full upstream module. The fixture is synthetic software state, not a physical system, measurement, observed worker event, or production record.

Three distinct rows are first admitted: Worker-A / success, Worker-B / failure, and Worker-C / success. The source-matched threshold is 4 rows, 3 distinct workers, and both outcomes. Before replay, the threshold is false because only three rows exist. The exact same Worker-A receipt, with the same artifact, seed version, outcome, timestamp and metadata, is then submitted again.

| Measure | Before exact replay | After exact replay |
|---|---:|---:|
| Receipt rows counted | 3 | 4 |
| Exact unique receipt rows | 3 | 3 |
| Distinct worker labels | 3 | 3 |
| Outcome labels present | success + failure | success + failure |
| Return threshold | false | true |

**Result: 8/8 assertions PASS.** The exact duplicate is accepted, increases row count, leaves exact unique-row count and worker count unchanged, and flips the return gate.

Reproducibility artifacts:

- `CODE/threading_receipt_idempotency_replay.py` — SHA-256 `3c36511433728f7d608eb73c3821f3d909f3136b596d1ac7d16e3610da80eec1`, 4,244 bytes.
- `RESULTS/threading_receipt_idempotency_replay_output.json` — SHA-256 `fd5dd5961004c396b7ca46080a7940f31cf8a6c46e1bbe1052f6770f8d0597dc`, 756 bytes.

The source and the replay establish a conditional software-state counterexample: if `min_outputs` is intended to mean distinct receipt events, an exact retry can satisfy the count without supplying a fourth distinct event. The prototype's present contract does not explicitly define whether identical rows are separate outputs, so this is recorded as a receipt-identity/idempotency contract ambiguity, not an unconditional defect claim.

## 5. Proposed contract, not implemented

Keep four identities separate:

1. **ReceiptEventKey:** identifies one receipt event and provides idempotency. Replaying the same event key is a no-op; reusing it with a conflicting payload is rejected.
2. **ArtifactDigest:** identifies content, not the event. Two independent workers may legitimately produce byte-identical artifacts, so content hash alone must not be the event idempotency key.
3. **ActorKey:** identifies an authenticated producer. A worker/ring label string is not actor authentication.
4. **RunKey / ThreadKey / SourceRunWitness:** bind the receipt to the exact execution, thread scope, source, harness and result evidence.

If the intended gate requires independent outputs, count distinct ReceiptEventKeys for `min_outputs` and distinct authenticated ActorKeys for `min_workers`; use a separate `min_artifacts` condition only if distinct content is itself required. Preserve duplicate deliveries in the audit log while excluding them from the active count.

This is a proposal for Track A consideration, not a source change, approved schema, or production design.

## 6. Formalization and change boundary

Existing PR #951 remains OPEN / DRAFT / UNMERGED at head `f9fa0aad45408ab06e5430c834530854746235f0`, base `61cc8b65ffed70296e0121dbae067892a79c81d4`, with no formal reviews or review threads. Its existing receipt-transfer, thread-scope, artifact-diversity, temporal and consumer-eligibility modules do not define a unique receipt-event identity or prove idempotent admission. The existing PR-triggered Lean run #42658236405 succeeded on November 9, but it is not a build of this new property or a new exact-head validation.

No local `lean`, `lake`, or `elan` executable is installed. The new finite-state property was not formalized or compiled in Lean. The Python replay is a counterexample search against a source-transcribed predicate, not a Lean proof, not proof of the translation, and not evidence of production behavior. The new Lean property remains `LEAN_NOT_RUN`.

The independent Track B ELIAS-2224 EvidenceLedger/subject-scope disposition remains pending. No POC, adapter, PR #951, production workflow, task graph, scheduler, or Track B state was changed. No new PR, branch, dependency, fork, subscription, API spend, or tool was created.

## 7. Primary Workflow Health and protected research gates

- WH-07 remains OPEN / P1-HIGH: the surviving Threading POC is sandbox-only and does not recover or replace the missing Project Desk implementation. This exact-replay result is additive prototype evidence only.
- WH-02 remains the highest-priority unblocked PWH item, Calder/authorized-maintainer-owned; no takeover or PR #1710 action.
- WH-05 remains blocked because all four canonical Mersearch request lanes are occupied/requested. Mersearch is not callable in this runtime; no request was overwritten, retriggered or released. GitHub source inspection is not represented as Mersearch.
- Task graph remains 18 records against 16 declared branches; Tern retains graph/scheduler authority.
- P0 Code Grurple remains ACTIVE. P1 Orson cognition remains OVERDUE / NOT READY and Orson-owned. P2 measured geometry remains HOLD. P3 full theory remains INCOMPLETE. Lane 24 Cycle 08/08 remains COMPLETE / BACKSEAT / HOLD. FIE next rereview is November 24.
- No physical calculation, CODATA comparison, fit, prediction, independent measurement, SAT-O/Blockwave equation correction, paper-gate advancement, or BEDROCK theory promotion.

## 8. Lateral reading and successor

Unrelated reading completed: SAT archive `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, lines 2001–2040. The passage is an older assistant answer making broad Asian sign-language family-tree claims; it was read as archive material, not treated as authoritative linguistic evidence. Next cursor: line 2041. No FIE rereview is due before November 24.

The next ring label is Nadir Voss. Nadir's current workspace preserves an independent PLAYGROUND / SANDBOX mathematical-repair remit, with source/invention separation and no target-fitting of historical constants or particle labels. This Track A workflow result does not warrant a task in that protected remit. No Nadir handoff was created. Prior-context search still does not establish a currently usable/authenticated Nadir thread; no direct-thread delivery, consumption, or acknowledgment is claimed.

## 9. Automation integrity

The existing :24 task remains enabled under ID `6abda4c8eda88191b0a2ba24a074f781`, with its original hourly America/New_York DTSTART and Lane Charter 24 unchanged. Last exact-ID observation: current run `70be3bc8-7470-832f-a2bd-83178358582a`, scheduled 14:24Z, recorded start 14:26:45.538788Z, status `IN_PROGRESS`, completion null, current-run `chat_ref` null. Cached latest result belongs to Morrow h899:s2, not this h902 run. This report does not claim scheduler completion or authenticated worker/thread participation.

No task, ID, prompt, schedule, phase, enabled state, cadence, signet, or conversation title was changed. No sixth task was created.

**Final status:** `H902_S2_ELIAS / EXACT_DUPLICATE_RECEIPT_REPLAY / 8_OF_8_PASS / CONDITIONAL_COUNT_GATE_FLIP / RECEIPT_IDENTITY_CONTRACT_AMBIGUITY / LEAN_NOT_RUN / TRACK_B_PENDING / WH07_OPEN / WH02_CALDER_OWNED / P0_ACTIVE / LANE24_HOLD / NO_POC_PR_OR_PRODUCTION_CHANGE / NO_PHYSICAL_RESULT / NO_THEORY_PROMOTION / AUTOMATION_UNCHANGED`.
