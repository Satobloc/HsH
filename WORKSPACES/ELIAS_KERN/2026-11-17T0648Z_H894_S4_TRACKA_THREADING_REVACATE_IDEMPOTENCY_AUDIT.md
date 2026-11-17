# Elias Kern h894:s4 | Track A repeated-VACATE idempotency audit

**Nominal slot:** 2026-11-17T06:48:00Z  
**Run key:** REVROT3-19-20261011:894:s4  
**Disposition:** SOURCE-GROUNDED RECONSTRUCTION / NEW METHOD-LEVEL SOFTWARE-STATE COUNTEREXAMPLE / 5 OF 5 ASSERTIONS PASS / NEW LEAN PROPERTY NOT RUN / TRACK B PENDING / NO POC OR PR CHANGE.

## 1. Selection, authority, and access

The scheduled UTC hour is h=894. With slot s=4:

- seq = 5(894)+4 = 4474
- 4474 mod 19 = 9
- Selected nominal ring label: Elias Kern, index 9
- Next nominal label: Nadir Voss, index 10

The direct-user Track A instruction is preserved in Elias's INBOX.md, line 7, dated 2026-09-24 13:47 ET. It directs Elias to work with Nathan and Orson Vey on the Top/Central/Branch/Hydra prototype, independently but in communication with Sable and Tern Rook's Track B; each leased pass should exercise one bounded real-work mechanism, leave a durable receipt or failure packet, document observed rather than intended behavior, and not treat the POC as production authority.

No standalone signed Elias specialist charter or originating message UUID was recovered. The workspace README is an assistant-maintained synthesis, not a substitute for that direct-user instruction. Prior-context lookup recovered the original historical Elias conversation family but did not surface a later authenticated/current Elias thread locator. The current scheduled run has null chat_ref. This is therefore a source-grounded reconstruction, not authenticated historical-Elias participation or a continuation of an identified current Elias thread.

Track A remains prototype operation/documentation only. Track B's existing ELIAS-2224 EvidenceLedger/subject-scope disposition remains pending in Sable's inbox. The separate October 30 sticky-lifecycle response does not dispose that request. No POC, PR, adapter, production workflow, or Track B state was changed.

## 2. Controlling source read

HsH main at the start of this review was 33fa38c930c4fc316f45242c19dc735b8d32c6b3. The following current sources were read or inspected:

- BEDROCK.md, blob 0253ace674bbc361464b7bbaac2c41aa3d8e8867, 667 lines; including the November 8 Primary Operational Guideline precedence, real-data-first and data-free permission gate, source-first controls, status strata, and promotion discipline.
- Primary Operational Guideline, WORKSPACES/COMMON/NATHAN_DIRECT_2026-11-08_METHODOLOGY_AND_MODEL_OVERVIEW.md, blob a8e333b1d5b5aa1d9772366945dd88769d24153c, 511 lines.
- Steering Charter 2026-10-26, blob be44c424674764c602b5f618dfce528c0f97b0ef.
- Three Paper Campaign 2026-10-26, blob 2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4.
- New Instance Start Here, blob 43b577d42b8cced83f8836934598081685ea3ff3.
- Revival Rotation V3, blob 7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14, including the November 7 duplicate-run-key guard.
- Active Automation Roster, blob 6b0bf56316fe14bfd2b0e925154025bd8d04eaa1.
- Worker Autonomy/Handoff Protocol, blob 812f2f2ffe1ebe6642e780d1591e7b6bab561f0a.
- Worker Freshness/Break Cadence, blob 31862461418360cbf5938609992a42dbf51707fc.
- Archive Math Hopper guide, blob a61a31a889d3e256e5e8c5926017167f73c1b1e9.
- Elias README, CURRENT_WORK, INBOX, and prior canonical h883:s2 receipt.
- SAT archive root orientation and HSH_RESOURCES root orientation, followed by the relevant switchboard and threading prototype documentation and source.

The relevant HSH_RESOURCES source witnesses are the threading demo, blob ce313e46b1b85ae35028b46a4196d2a945b535d8, and the companion Workflow Threading Prototype document, blob f87ff21918b6fa4804d090cdb9153aa0dd53d288. These are prototype sources, not production workflow authority.

## 3. New bounded operation: repeated VACATE resets the time-cap origin

The source's ThreadState.vacate method unconditionally:
1. sets author_state to vacated;
2. sets status to propagating; and
3. overwrites vacate_started_at with the supplied current time.

The elapsed_hours method computes elapsed time from that stored timestamp. should_rejoin considers the state threshold OR elapsed_hours >= max_hours. The companion design document explicitly presents the maximum-hours cap as a guard against starvation.

A source-transcribed method-level Python replay tested a duplicate/repeated VACATE invocation during an already-active propagation cycle. It used only software-state values, not a physical fixture or empirical claim.

Test conditions:
- First VACATE at 00:00 UTC.
- max_hours = 3.
- State thresholds deliberately unmet.
- At 02:45, readiness is false and elapsed time is 2.75 hours.
- A repeated VACATE is called at 02:45 while the same thread remains propagating.
- At the original 03:00 deadline, readiness is still false and elapsed time is now only 0.25 hours.
- The new time cap is not reached until 05:45.

Result: 5 of 5 assertions passed. The repeated call changes the stored time origin and shifts the three-hour deadline by 2 hours 45 minutes.

This is a source-transcribed method replay, not byte-identical execution of the complete upstream module, not a run of its six built-in self-tests, not an observed worker event, and not a production incident. It establishes a concrete idempotency gap in the prototype method: the same active cycle has no explicit cycle/lease identity with which to distinguish a duplicate retry from an intentional new VACATE cycle. Repeated calls could continually defer the time-cap fallback if a controller retries them.

## 4. Formalization boundary

Existing PR #951 contains EliasThreadingVacateGate. Its model formalizes a proposed rejoin guard requiring a vacated author state, propagation status, a recorded vacate timestamp, and one of the return conditions. It does not model the VACATE transition itself, duplicate invocation, cycle identity, or deadline preservation.

Existing Actions run #42658236405 / job #129302583788 succeeded on a synthetic PR merge reference, not a standalone exact-head checkout. The log reports 8,961 successful jobs and builds EliasThreadingVacateGate at 8,957/8,961. Five #eval outputs were inspected. Nine theorem-specific axiom reports were inspected: the two source-predicate results have no axiom dependencies; the seven guarded results depend on propext. The retrieved job log contains zero sorryAx and zero bare admit strings. Tests, lint, leanchecker, nanoda, and the separate global axiom audit were not established by this run.

The new repeated-VACATE proposition was not compiled or run in Lean. Local lean, lake, and elan executables are absent. PR #951 remains OPEN / DRAFT / UNMERGED, and no new PR commit or branch was created because the independent Track B ELIAS-2224 disposition remains pending. Status for the new property: LEAN_NOT_RUN / FORMALIZATION_BLOCKED_EXECUTION_AND_AUTHORITY. The existing CI result is not a proof of the new transition property, source-to-Lean equivalence, actual worker behavior, or production scheduler behavior.

A precise proposed contract, not implemented or proved here, is:

- For an already-vacated, propagating thread and the same cycle ID, a duplicate VACATE is idempotent and preserves the original start/deadline.
- A deliberate new cycle must carry a new cycle ID and be admitted only after an explicitly defined terminal state of the previous cycle.
- Preserve the prior cycle and its receipts rather than silently replacing its time origin.
- Test duplicate retries before and at the original deadline, explicit new-cycle admission, repeated events after rejoin, and clock-domain/naive-datetime handling.

## 5. Primary Workflow Health and cross-lease snapshot

The latest completed :24 report, Calder h894:s2, is issue #1883 and PUBLISHED_VERIFIED. It directly rechecked the 06:19Z discovery snapshot: 15,493 documents, 8,562 workspace records, 48 rolling-docket entries, and all eight protected Code Grurple source/control objects exact. Paper A and Paper B remain in the full discovery catalog with generic raw-workspace reader targets; Paper B also has a 1,400-character excerpt. Neither is in the 48-item docket. The live reader route remains unobserved. P0 Code Grurple remains ACTIVE; this is not a visitor-facing incident confirmation or standdown. The later 06:41Z main commit refreshed the automatic public display docket; its A/B rows were not separately re-parsed in this activation.

Current campaign state:
- P0 Code Grurple: ACTIVE.
- P1 Orson cognition: OVERDUE / NOT READY, Orson-owned.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- Lane 24: cycle 08/08 complete, BACKSEAT / HOLD.
- FIE next review: November 24.

PWH queue readback: WH-02 remains the highest-priority unblocked item and Calder/authorized-maintainer-owned; PR #1710 remains draft/unmerged and needs authorized branch reconciliation, tests, and review. WH-05 remains blocked pending Tern's controlled Mersearch lane release. The task graph remains 18 records against 16 declared branches; Tern retains graph and scheduler authority.

The four canonical Mersearch request files were re-read. Their IDs and statuses remain:
- lane 1: calder-angle-geometry-source-fidelity-20261102-1337 / requested;
- lane 2: archive-harvest-20261025-optics-01 / requested;
- lane 3: calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001 / requested;
- lane 4: kestrel-finite-core-geometry-source-fidelity-20261102-2200 / requested.

All four expected RUN_MANIFEST paths returned 404 or unavailable. Mersearch was not callable in this runtime. No request was overwritten, retriggered, released, or treated as completed. GitHub source reads are not represented as Mersearch.

## 6. Lateral reading and freshness

A separate lateral reading was completed from the Wikisource Atlantic Edition of H. G. Wells, The Time Machine, Chapter 5, lines 129-181; next cursor 182. This is recorded as a distinct edition/source, not asserted to continue the prior workspace cursor at lines 223-262. The useful literary observation is that the Traveller revises a plausible ventilation explanation after new clues, and recognizes that his earlier inference was wrong. This is a reading note, not scientific evidence or a formal proposition.

No physical posture break was performed or verifiable in this automated execution.

## 7. Scheduler and final boundaries

All four existing enabled tasks were peeked:
- :00 task 6aa1fe0de5e48191b886496095b1343f, enabled, exact original hourly phase; h894:s0 Mira completed.
- :24 task 6abda4c8eda88191bf23a6f2849e9a17, enabled, exact original hourly phase; h894:s2 Calder completed.
- :36 task 6a9f52b69ec08191b0a2ba24a074f781, enabled, exact original hourly phase; h894:s3 Hale IN_PROGRESS, current chat_ref null.
- :48 task 6aa6c3bc02b48191b8a91a30d2a155e0, enabled, exact original hourly phase; current run 3f0b5106-d678-832a-91e7-cba005f29494, scheduled 06:48Z, started 06:44:22.780934Z, IN_PROGRESS, current chat_ref null. Its cached latest_result is the prior h893:s4 Alberr run, not this h894:s4 run.
- :12 remains disabled.

No task ID, prompt, schedule, phase, enabled state, cadence, or ownership was changed. No sixth task was created. No public issue or publisher submission was created because this is internal prototype-method QA and the source boundary is an internal reference surface. No POC, PR, adapter, production workflow, task graph, paper, equation, or BEDROCK theory state was changed. No physical calculation, fit, prediction, independent measurement, human-subject experiment, model trial, API expenditure, or theory promotion occurred.

No handoff to Nadir Voss was created; no task, response obligation, review request, or ownership transfer is implied. No current Elias-thread delivery, consumption, or acknowledgment is claimed.

**Next cursor:** Track A may retain the repeated-VACATE idempotency contract as a proposal, but no implementation or Lean proof is authorized until the independent ELIAS-2224 Track B disposition. The next nominal ring label is Nadir Voss, index 10; his protected SILOED/PLAYGROUND remit is unchanged.
