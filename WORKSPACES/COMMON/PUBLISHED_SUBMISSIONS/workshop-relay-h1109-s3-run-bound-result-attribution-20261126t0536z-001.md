# Workshop Relay :36 | h1109:s3 | run-bound result attribution

Date: 2026-11-26. Nominal slot: 05:36Z. This is a source-grounded assistant execution, not an authenticated Sable conversation.

## Disposition

A concrete recurring-automation attribution hazard was reproduced from live scheduler metadata. The current run's cached latest_result belongs to the preceding Kestrel run, not to this Sable-selected invocation. A positive control from the :00 lease shows that a result can be correctly bound to a completed run while still being ineligible for readback because its content is truncated.

The existing Sable-lane draft PR #2446 was extended with a formal run/result binding contract. The predecessor commit passed the exact-head Lean build; the current one-line-corrected head has a new exact-head build in progress. No merge, rebase, new PR, production change, scheduler change, task graph change, or worker-checkpoint overwrite occurred.

## 1. Selection, authority, and preflight

The deterministic ring calculation is:

- h = 1109
- seq = 5(1109) + 3 = 5548
- 5548 mod 19 = 0
- selected ring label = Sable
- next ring label = Loom

Selection is not authentication of a worker instance or conversation.

The historical Sable source describes a knowledge/analysis machine with manual and automated instances, modules, tailored directories and interfaces, capability packets, repository/script I/O, targeted ingestion, and point-of-use context. A later direct instruction reserves workflow-design changes to Sable continuity, with input from other instances. The public systems-clearance and coordination records place Sable in systems analysis, capability architecture, automation, and reconstruction-strategy testing, while transferring routine tagging, retrieval/index QA, and solver work to specialist lanes.

Sources:
- https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/SABLE_SYSTEMS_CLEARANCE_2026-09-14.md
- https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/COORDINATION.md
- https://github.com/Satobloc/HsH/issues/2567

No standalone signed specialist charter or authenticated current Sable thread was recovered. The current automation run has chat_ref=null. Sable CURRENT_WORK and CONTINUITY remain at h1102; the current INBOX ends with optional context, not a new assignment.

The direct user sketch does not define typed module ports or a run/result join. TEAM_MACHINE_DRAFT is assistant-authored reconstruction; its added cX and Tools categories are not treated as Nathan Direct. The current STATE_DEPENDENT_WORKFLOW_OPERATION_ENVELOPE_v0.1 remains PROPOSAL_NOT_INTEGRATED.

## 2. Executed runtime counterexample

Live peek of the existing :36 automation:

- Task ID: 6a9f52b69ec08191b0a2ba24a074f781
- Title: Workshop Relay :36 | Worldtube
- Enabled: true
- Original schedule: DTSTART 20261001T143600 America/New_York; FREQ=HOURLY
- Current last_run ID: 1c993f17-2e50-8331-a50e-86da9354252f
- Current run started: 2026-11-26T05:37:04.333183Z
- Current status: in_progress
- Current completed_at: null
- Current chat_ref: null

The same automation's latest_result is:

- result run_id: a4df1d5f-0f18-8326-99ff-00dc4c1af383
- created_at: 2026-11-26T04:55:25.379867Z
- completed_at: 2026-11-26T04:55:28.022582Z
- chat_ref: non-null, belonging to the prior Kestrel result; identifier withheld
- content_truncated: true
- is_failure_message: false
- requires_user_action: false
- content header: Workshop Relay :36 | h1108:s3

The result predates the current invocation by about 41 minutes 39 seconds. Its run_id differs from last_run.id, its chat reference is not the current run's reference, and the current run is still in progress. The cached Kestrel result therefore cannot be attributed to the current Sable-selected invocation.

This is not a claim that the automation service is defective. It is a concrete example of why a consumer must not interpret latest_result as the current run's result merely because it is returned beside last_run.

### Positive control

The :00 automation's current h1109:s0 run provides a useful contrast:

- last_run ID and latest_result.run_id both equal 933a89ef-22bc-8322-bdde-b1e595ac689f
- run started 05:02:06.624637Z
- result created 05:24:47.579606Z
- run and result completed at 05:24:49.322903Z
- status completed
- non-null chat references match
- content_truncated is true

This result is bound to its invocation, but it is not eligible for direct independent readback because the returned content is truncated. The artifact still requires its own fetch and digest comparison.

## 3. Architecture improvement

The operation envelope v0.1 already separates branch lifecycle, operation lifecycle, and handoff lifecycle. Its execution field records a run ID and outputs, but it does not define the partial join from last_run to latest_result.

Add a result_binding subrecord under execution or verification, preserving raw values rather than storing only derived booleans:

- invocation: task_id, run_id, scheduled_for, started_at, recorded_status, completed_at, chat_ref
- result: run_id, created_at, completed_at, chat_ref, content_truncated, is_failure_message, requires_user_action
- derived checks: run_id_match, result_not_older_than_started_at, chat_ref_match, completed, completion_time_match, payload_complete, no_failure, no_user_action

The dependency hierarchy is:

1. Module/role label plus execution lease -> invocation. This does not authenticate a conversation.
2. Invocation plus cached result -> bound result only when invocation.id equals result.run_id and result.created_at is not earlier than invocation.started_at.
3. Bound result plus equal, nonempty chat references -> conversation context. This is not delivery.
4. Conversation context plus separate delivery evidence -> delivered/acknowledged/consumed.
5. Bound, completed, non-truncated, non-failure, no-user-action result -> eligible for independent readback.
6. Independent readback plus explicit authority and exit criteria -> verified operation.

The timestamp guard is necessary because retries may reuse a run ID while retaining an earlier result. The chat-reference guard is separate because a conversation reference is not a delivery receipt. The final readback remains separate because a bound result can still be truncated or otherwise unsuitable.

This is the missing coupling map between a module invocation and its operation evidence. It does not yet define the Mc module's source-level port types. Those remain unspecified and must not be invented as canonical fields.

## 4. Lean formalization

Existing PR #2446 was extended in place, without creating a new PR:

https://github.com/Satobloc/HsH/pull/2446

File: FORMAL_VERIFICATION/HsHVerification/SableWorkflowOperationGate.lean
Namespace: HsHVerification.SableRunBinding
Current head: 79f35eb84020110e7695baa0b8ca780acefae6a2
Base: infra/lean4-verification-20261023, supplied by still-open PR #262.

New types:
- Invocation
- CachedResult
- ConversationRef
- RunStatus

New predicates and results:
- resultBoundToInvocation
- chatContextBoundToInvocation
- runCompleted
- resultEligibleForIndependentReadback

New theorems:
- result_binding_requires_matching_run_id
- result_binding_requires_not_older_than_run
- mismatched_run_id_blocks_attribution
- result_predates_invocation_blocks_attribution
- in_progress_is_not_completed
- no_chat_context_when_run_ref_absent
- readback_eligibility_requires_run_binding
- readback_eligibility_requires_completed_run

The observed h1109:s3 software-run fixture is included with the prior conversation reference identifier redacted. UTC timestamps are normalized to epoch milliseconds by an external adapter; correctness of that conversion is not proved by Lean.

Verification:
- Predecessor exact-head run #45763753380: SUCCESS on commit 063de10f5d7e35124e0c753518da572cd65b979b.
- Lean 4.34.0; Lake 5.0.0.
- Full library build: 8,948 jobs, SUCCESS.
- The new run-binding theorems were compiled. Four report no axioms; two use propext. No sorryAx or admit occurs in the new namespace.
- Separate global axiom audit, nanoda, tests and lint were not run.
- Current corrected head 79f35eb84020110e7695baa0b8ca780acefae6a2 has exact-head run #45764165024 IN_PROGRESS at final inspection. Do not claim a current-head pass until that run completes.
- PR #2446 remains OPEN / DRAFT / UNMERGED. No reviewer was requested and no merge/rebase was attempted.

The formal proof checks only the formalized contract. It does not prove that the live API adapter parses timestamps correctly, that the connector metadata is truthful, that a chat reference is a live thread, or that a delivery occurred. The resultEligibleForIndependentReadback predicate is only an admission to independent inspection, not verified operation completion.

## 5. Existing tools and cost check

- All four Mersearch request lanes remain occupied/requested. No new search, overwrite, retry or release.
- Mysearch status remains SCAFFOLD ONLY / NOT VALIDATED; no dedicated dispatch action is exposed in this runtime. GitHub code search was used only to locate the Mysearch status record after Mersearch capacity was found occupied.
- Math Hopper issue #578 remains OPEN; PR #991 remains OPEN / DRAFT. The three-repository full scan is not verified.
- Whirligig Kernel 0 remains SANDBOX ONLY; it was not treated as a physical equivalence or used for this workflow result.
- HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES each report zero forks.
- SciSpace is available but unnecessary for this software-contract task.
- Local runtime has no repository checkout, gh, Lean, Lake or Elan; git is installed but no project checkout is present. The existing GitHub connector was used as the fallback for the existing PR-branch update, and the existing GitHub Actions Lean workflow provided verification.
- No new tool, dependency, paid service or expenditure.

## 6. P0, PWH and campaign boundaries

P0:
- Discovery run #45763534094 succeeded at source cut 6ed7c772f1a323c7fd19701d4ee81f00115b4b6b.
- Its generated-only commit is b51f608737534f24ae0d471273e581bc53c1c311, a child of that source cut.
- Current discovery JSON is 67,700,495 bytes, exceeding the connector's 64 MiB response limit; no new full record-level parse is claimed.
- Last fully parsed inventory remains 11,017 workspace records, all with generic browse-reader targets and missing presentation_state.
- Presentation safety remains FAIL. Live Paper A/B route acceptance is NOT OBSERVED. No release or standdown is authorized.
- Navigation run #45763534127 failed at the strict date-tag verification step; viewer/index/test/commit/deploy steps were skipped.
- conversation-json-content-ci run #45764159860 failed with zero jobs. No test failure is inferred from a workflow that ran no jobs.
- The report publication below will advance main again; postwrite discovery freshness will therefore be pending until the next existing scheduled refresh. No manual dispatch.

PWH:
- Queue remains h1081:s3; task graph remains 18 records against declared branch_count 16.
- Tern retains PWH queue, graph and Comptroller authority. Trigger count for the next deep review remains Tern-owned and is not adjudicated here.
- Open Tools Library signal SIG-20260924-TOOLS-01 remains on the existing Comptroller route. No library or queue mutation.

Campaign:
- P1 November 9 cognition paper: OVERDUE / FROZEN / Orson-owned.
- P2 November 30 measured-system paper: HOLD.
- P3 December 14 full-theory paper: INCOMPLETE.
- FIE rereview: December 8.
- Unrelated-source break: November 28.

No measured physical system or dataset was selected. No physical calculation, fit, prediction, uncertainty propagation or falsification threshold was produced. No SAT-O or Blockwave equation was changed. No theory or manuscript was promoted.

## 7. Scheduler, continuity and process note

The existing :36 task remains enabled with its original ID, DTSTART, hourly recurrence, phase and prompt unchanged. Four existing tasks are enabled; the :12 task remains disabled. No sixth task, reassignment, cadence change, signet or conversation rename.

The current :36 last_run is still IN_PROGRESS at final inspection and has chat_ref=null. The previous Kestrel result is not a current Sable conversation. No direct-thread delivery, handoff, consumption or acknowledgment is claimed.

Next deterministic ring label: Loom. No assignment or response obligation is created. This report is the durable return cursor.

Process note: the initial PR-branch patch preceded the required full read of the worker autonomy/signet preflight. This ordering deviation was caught; the protocol was then read. No signet was used, and no scheduler, task identity, shared queue, graph, or worker checkpoint was changed. No further shared-state write was made.

## Final disposition

H1109:S3 / SABLE_RING_LABEL_ONLY / RUN_RESULT_ATTRIBUTION_HAZARD_REPRODUCED / POSITIVE_CONTROL_BOUND_BUT_TRUNCATED / PR2446_EXTENDED / PREDECESSOR_LEAN_EXACT_HEAD_PASS / CURRENT_HEAD_LEAN_RUN_PENDING / P0_PRESENTATION_SAFETY_FAIL / P0_POSTWRITE_REFRESH_PENDING / PWH_TERN_OWNED / NO_PHYSICAL_REANALYSIS / NO_THEORY_PROMOTION / NO_CROSS_THREAD_CLAIM / TASK_UNCHANGED / NO_SIXTH_TASK
