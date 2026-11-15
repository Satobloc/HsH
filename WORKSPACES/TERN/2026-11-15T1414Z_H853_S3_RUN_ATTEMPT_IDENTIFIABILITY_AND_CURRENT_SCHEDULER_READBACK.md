# Tern Rook h853:s3 | Run-attempt identifiability and scheduler cross-section

**Nominal slot:** 2026-11-15T13:36:00Z  
**Run key:** REVROT3-19-20261011:853:s3  
**Selected ring label:** Tern Rook, index 12  
**Next ring label:** Morrow, index 13  
**Disposition:** LEAN_TARGET_PENDING / ATTEMPT_IDENTITY_NONIDENTIFIABILITY_FORMALIZED / FOUR_SLOT_READBACK / HANDOFF_RUN_BINDING_UNRESOLVED / NO_SCHEDULER_MUTATION

## 1. Rotation and identity boundary

The nominal scheduled UTC hour is 853 hours after 2026-10-11T00:00Z:

- h = 35*24 + 13 = 853
- seq = 5*853 + 3 = 4268
- 4268 mod 19 = 12, selecting Tern Rook.
- The next ring index is 13, Morrow.

The nominal scheduled_for time controls this calculation. The late runtime start does not change the selected hour. A ring label is not authentication of a historical ChatGPT instance or current thread.

## 2. Historical authority

The raw ARIADNE export was recovered and searched. Its direct user messages establish the following Tern/Comptroller remit:

- Tern controls scheduled tasks and the committed hourly leases.
- Workers may make requests, but Tern decides allocation and timing.
- The relay should inspect current workflow state each hour and select useful bounded work.
- A study of moving repetitive work from manual LLM control to Python was named as a possible near-term workflow-efficiency target.

Source export: conversation 6ab339d2-8fb4-83ea-b728-c8001a034371, raw blob df9c7a1fbddaa523f0b69cced8d761433490a454. Relevant direct-user messages: c4f0aae9-3290-42c6-a5d0-b42c19a88255 and e689eb6e-5814-4a27-a366-796605bd5f4d.

No standalone signed Tern specialist charter was found. The direct-user source is stronger than the current assistant-maintained README/CURRENT_WORK reconstruction. No authenticated current Tern thread or historical-instance participation is claimed.

## 3. Substantive improvement: attempt identity is not recoverable from the current run fields

The existing Tern evidence at Observation 028 Amendment 18 records a same-run-ID, same-scheduled-slot mutation for Meridian h850:s2:

- Run ID: 22815188-cdb0-8333-89f3-0b6b997fa694
- Scheduled: 2026-11-15T10:24:00Z
- Earlier snapshot: start 10:23:21.692103Z, status FAILED, completion 10:48:26.338558Z, no chat_ref.
- Later exact-ID snapshot: start 10:51:20.324754Z, status IN_PROGRESS, completion null, no chat_ref.
- Recorded start-field delta: 1,678,632,651 microseconds, or 27m58.632651s.

The run ID and nominal slot remain fixed, while the start, status and completion fields differ. The API evidence exposes no attempt ID, retry counter, immutable event sequence or provider-side event timestamp.

### New Lean module

Added FORMAL_VERIFICATION/HsHVerification/TernH853SameRunAttemptIdentifiability.lean to Tern's existing draft PR #824, with a root import. The module defines:

- an API-visible RunSnapshot;
- a hypothetical hidden attemptOrdinal;
- an expose projection that discards the hidden ordinal;
- one possible explanation assigning both snapshots to one attempt; and
- a different possible explanation assigning them to distinct attempts.

The central theorem, attempt_identity_not_identifiable_from_exposed_pair, proves that these two distinct hidden assignments project to exactly the same exposed snapshot pair.

This is a constructive non-injectivity result for the modeled observation map. It establishes that the represented API fields do not identify attempt identity. It does not establish that either hidden assignment actually occurred, or prove retry, restart, duplicate execution, concurrency, liveness, worker identity, provider semantics or backend cause.

### Verification status

- Existing PR: https://github.com/Satobloc/HsH/pull/824, OPEN / DRAFT / UNMERGED.
- PR branch: research/tern-dim-provenance-signloss-20261028t01z.
- New PR head after the two additive commits: 8df3a334e5b535cb4725be1e09fb9afb911343af.
- New module blob: 54a2ccc5a459441f5dd2a93d94143cd9d03d8d1a.
- Lean Actions run: https://github.com/Satobloc/HsH/actions/runs/43723047265, job 132838955309.
- At the last observed check, checkout and Lake dependency-manifest generation had succeeded; Lean installation/full compilation was still IN_PROGRESS. No successful build is claimed yet.
- Local lean, lake and elan are absent.

The PR is materially stale relative to current main. At comparison time, main was 699ad6ae189194a067f10f0f77bce1a88d638e10; the PR head was 92 commits ahead and 18,822 behind, with status diverged. No rebase, merge, main-branch code change or ownership transfer was attempted. Any CI result applies to the PR merge reference and must be inspected for the actual checkout SHA, target-module result, root-build result and theorem-specific axioms. A successful build would prove only the encoded propositions.

## 4. Fresh four-slot scheduler readback

Four separate exact-ID peeks were made between 2026-11-15T14:13:30.218Z and 14:13:32.299Z. They are not one atomic snapshot.

| Phase | Nominal label | Run ID | Latest detailed record | Cached latest_result |
|---|---|---|---|---|
| :00 | Kestrel h854:s0 | 1dcbc431-6e50-8330-87a8-2820ee1a41d5 | Scheduled 14:00Z; start 13:55:05.608485Z; IN_PROGRESS; completion/chat_ref null | Prior run 6888dab5-d734-8325-ab73-0273725d2fbc, scheduled 13:00Z, completed 13:52:26.224039Z |
| :24 | Enheduanna h853:s2 | 7c4dc369-9114-832c-a162-7a9d50486c72 | Scheduled 13:24Z; start 13:56:29.783432Z; COMPLETED 14:07:54.748687Z; chat_ref present | Matches current run |
| :36 | Tern h853:s3 | 0adb1d15-fa00-8320-b75c-65ae3f0f420c | Scheduled 13:36Z; start 14:07:47.321852Z; IN_PROGRESS; completion/chat_ref null | Prior Aster h851:s3 run 79f30399-7164-8332-a52f-61785c8f6932, scheduled 11:36Z, completed 12:43:58.300570Z |
| :48 | Morrow h853:s4 | d1db4b7f-d1b8-8331-a3d2-470089b715ac | Scheduled 13:48Z; start 13:47:30.789798Z; FAILED 14:12:34.344859Z; chat_ref null | Prior Hale h852:s4 run fb0491d8-c320-8326-b6db-5b25bf98534f, scheduled 12:48Z, completed 13:03:01.240903Z |

The :48 Morrow run has a detailed FAILED status, but its task-level cached result still points to a different, previously completed Hale run. The failure's diagnostic payload is therefore unavailable from the cached result pointer. The :36 Tern task's last_run_time and cached result also remain stale relative to its current detailed run record.

The :00 and :36 records were independently returned as IN_PROGRESS within the readback window. Separate peeks do not establish a common atomic state, process concurrency or simultaneous model execution. No retry, restart, cause, identity or liveness inference is made.

The :12 lease was separately checked and remains disabled. The four existing active tasks remain enabled with their exact saved hourly DTSTART/RRULE and phase unchanged. No sixth task.

## 5. Handoff timing: slot-level chronology versus run-level binding

The Enheduanna h853:s2 optional packet states that a Tern h853:s3 execution had started at 2026-11-15T13:40:10.845290Z. The packet was committed at 13:49:42Z, so its POST-START classification is supported relative to the source-reported start time.

However, that handoff does not include the producer's run ID. The current exact-ID :36 record is run 0adb1d15-fa00-8320-b75c-65ae3f0f420c, with started_at 14:07:47.321852Z. The packet's earlier start time cannot be joined to that exact run ID. It may refer to the same run record or another execution record; the available evidence does not decide.

The classification is therefore:

- POST_START_SLOT_LEVEL: supported by the handoff's own chronology.
- RUN_BINDING_UNRESOLVED: no producer run ID is supplied to bind the start-time claim to the current exact-ID record.

### Proposed witness refinement

A handoff timing witness should carry:

producer_task_id | producer_run_id | scheduled_for | started_at | observed_at | source_commit | recipient_run_id | recipient_started_at

A missing producer_run_id must remain UNBOUND_TO_RUN. Nominal-slot ordering and exact-run ordering are separate claims. This prevents a slot label, timestamp or commit proximity from being mistaken for exact execution continuity.

This is an operational evidence contract, not a claim about the automation service's internal attempt model.

## 6. Existing resources and project boundaries

- HsH BEDROCK, Steering Charter 2026-10-26, Three-Manuscript Campaign, New Instance onboarding, revival rotation, thread-routing and scheduler-authority instructions were consulted.
- HsH main was read at 699ad6ae189194a067f10f0f77bce1a88d638e10.
- SAT archive and HSH_RESOURCES front doors were read. HSH_RESOURCES remains private reference infrastructure; no private research payload was opened.
- Existing Archive Math Hopper instructions, Tern PR #824 and the existing Lean 4.34.0 / Mathlib CI were inspected and reused. All three repository front doors report zero forks. No new tool, dependency, fork, subscription or expenditure.
- No callable Mersearch action was available in this runtime. The four canonical Mersearch request lanes remain occupied; no request was overwritten, retriggered or released. GitHub retrieval is not represented as a Mersearch search.
- PWH: Tern's next bounded cursor remains WH-01. WH-02 is the highest-priority unblocked item but its code/rebase action remains Calder-owned. WH-05 remains blocked by occupied Mersearch lanes. Task graph remains 18 records against 16 declared branches.
- Portfolio: P0 Code Grurple ACTIVE; P1 Orson-owned cognition OVERDUE / NOT READY; P2 measured geometry HOLD; P3 full theory INCOMPLETE. Paper gates remain Nov 9 (P1, overdue), Nov 30 (P2), Dec 14 (P3). FIE next review Nov 24.
- No physical calculation, fit, prediction, independent measurement, P2 selection, SAT-O/Blockwave equation change, paper-gate advancement or BEDROCK theory promotion.

## 7. Lateral reading

Read SAT archive 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt, lines 981-1020. The passage is a light language-identification game involving Láadan, Saramaccan, Orok and a mistaken brand-name guess. It is historical conversational material, not a linguistic reference. Next cursor: line 1021. No FIE re-review is due before November 24.

## 8. Automation integrity and final limits

The existing :36 task remains enabled under ID 6a9f52b69ec08191b0a2ba24a074f781, with the exact original hourly America/New_York :36 DTSTART/RRULE, prompt and phase unchanged. The other three active task IDs and schedules are unchanged; :12 remains disabled. No task, ID, prompt, phase, cadence or enabled-state mutation; no sixth task, signet or conversation rename.

At last exact-ID readback, the current :36 run remained IN_PROGRESS with null completion and null chat_ref. The scheduled wrapper's terminal completion is not yet verified. No authenticated historical Tern thread, direct cross-thread delivery, handoff consumption or acknowledgment is claimed.

**Return pin:** H853:S3 / TERN-RING-LABEL / MORROW-NEXT-ALREADY-COMPLETED-FAILED / SAME-RUN-ATTEMPT-NONIDENTIFIABILITY-FORMALIZED / PR824-HEAD-8DF3A334 / LEAN-CI-43723047265-PENDING / FOUR-SLOT-READBACK / M48-FAILED-RESULT-POINTER-STALE / ENHEDUANNA-HANDOFF-POSTSTART-SLOT-LEVEL-RUN-UNBOUND / WH01-NEXT / P0-ACTIVE / P1-OVERDUE / P2-HOLD / P3-INCOMPLETE / FIE-NOV24 / READING-1021 / AUTOMATIONS-UNCHANGED / S36-IN_PROGRESS / NO-SIXTH-TASK.
