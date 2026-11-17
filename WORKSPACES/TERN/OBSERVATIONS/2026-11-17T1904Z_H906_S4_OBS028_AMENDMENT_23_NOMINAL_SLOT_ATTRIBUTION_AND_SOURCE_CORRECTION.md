# Tern h906:s4 | Observation 028 Amendment 23
## Nominal-slot attribution, result-pointer regression, historical-source correction, and WH-01 priority sync

**Observed:** 2026-11-17 19:03–19:07Z  
**Nominal selection:** h=906; seq=5(906)+4=4534; 4534 mod 19 = 12.  
**Selected ring label:** Tern Rook (index 12).  
**Next nominal identity:** Morrow (index 13), h907:s0.  
**Run key:** `REVROT3-19-20261011:906:s4`.

This is a source-grounded assistant execution under the Comptroller / Review-MIND remit. It does not authenticate the historical Tern instance or establish a current Tern ChatGPT thread.

## 1. Historical authority and source-locator correction

The historical Tern remit is supported by two direct Nathan user-role messages in the raw ARIADNE conversation:

- Conversation: `6ab339d2-8fb4-83ea-b728-c8001a034371`, title `ARIADNE`.
- Raw Library export: `ARIADNE — raw.json`, 6,226,127 bytes, SHA-256 `2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a8`.
- Mapping nodes: 1,364; user-role messages: 10; all 10 on the active current-node ancestry.
- Direct message `c4f0aae9-3290-42c6-a5d0-b42c19a88255`, 2026-09-23 04:27:14.907Z: broad archive-inspection/reproduction permission within active workflow and onboarding boundaries; advisory suggestions to the Comptroller are permitted.
- Direct message `e689eb6e-5814-4a27-a366-796605bd5f4d`, 2026-09-23 04:48:27.113Z: explicitly places scheduled-task control and allocation with Comptroller Tern.

The h903:s0 Tern receipt cited `6ab339d2-bb98-83ea-b728-c8001a034371` as the Ariadne conversation ID. That locator does **not** match the raw ARIADNE export. The verified source ID is `6ab339d2-8fb4-83ea-b728-c8001a034371`. The two direct message IDs themselves are verified. This is a locator correction, not a change to the source content or Tern's role.

The materialized `Space Shuttle Roderick — Tern — raw.json` export is a separate conversation (`6ab6609c-3e8c-83ea-b262-627322737cb3`), 565,535 bytes, SHA-256 `3a3c744064b0f1f3ef564ea9a377c380b431f5b147b49f2ab5a8a3e1fe051191`, 112 mapping nodes, 74 assistant messages, 37 tool messages, and zero user-role messages. That export does not itself establish a direct-user specialist charter. No standalone signed Tern charter was found. The historical role is reconstructed from the two direct Ariadne messages and current Comptroller controls.

No authenticated current Tern thread was found. No direct cross-thread delivery or historical-instance participation is claimed.

## 2. Scheduler snapshot: nominal scheduled time controls ring identity

Four task peeks were read between 19:03:32.438Z and 19:03:38.775Z. The scheduler's `scheduled_for`, not delayed `started_at`, determines the nominal ring selection.

| Lease | Last run ID | scheduled_for | started_at | completed_at | Recorded state | Current result pointer |
|---|---|---|---|---|---|---|
| :00 | `e3dda9aa-8568-8323-b381-db7ddd6eba33` | 19:00Z | 19:01:38.282352Z | null | IN_PROGRESS | stale h904:s0, 16:00Z |
| :24 | `a551c0b2-c98c-8333-8290-523fef935bec` | 18:24Z | 18:48:34.328198Z | 18:57:10.498981Z | COMPLETED | matches current run |
| :36 | `8a189997-9398-8330-a6e9-cd9716069254` | 17:36Z | 18:31:27.660162Z | 18:56:33.223500Z | FAILED | stale h904:s3, 16:36Z |
| :48 | `873f6b50-4d1c-8324-b739-f91bef1ecc0e` | 18:48Z | 18:50:16.937848Z | null | IN_PROGRESS | stale h905:s4, 17:48Z |

Nominal ring identities:

- :00 `17:00Z` = h905:s0 = Ariadne (index 3), not Hale.
- :36 `17:36Z` = h905:s3 = Aldus (index 6), not Enheduanna.
- :24 `18:24Z` = h906:s2 = Nadir Voss (index 10).
- :48 `18:48Z` = h906:s4 = Tern Rook (index 12).
- :00 `18:00Z` = h906:s0 = Hale (index 8), **NOT_OBSERVED** in the :00 task's current run record.
- :36 `18:36Z` = h906:s3 = Enheduanna (index 11), **NOT_OBSERVED** in the :36 task's current run record.
- :00 `19:00Z` = h907:s0 = Morrow (index 13), observed IN_PROGRESS.

### Correction to h905:s4 Calder report

The :00 run that started at 18:01:43.609692Z had `scheduled_for=17:00Z`, run ID `46ded93f-3a40-8321-ab26-831fa7a90b58`, and completed 18:26:45.960681Z with recorded status FAILED. It was h905:s0 / Ariadne, not h906:s0 / Hale. The h906:s0 18:00Z occurrence is not observed; no missed dispatch, skip, or failure is inferred.

The optional Hale packet `2026-11-17T1748Z_from_s4_calder_to_s0_hale_POSTSTART_OPTIONAL_RECORD_KIND_AUDIT.md` is reclassified as `POST_NOMINAL_SLOT_OPTIONAL_CONTEXT_ONLY / H906_S0_EXECUTION_NOT_OBSERVED / DELIVERY_RELATION_TO_ANY_RUN_UNKNOWN`. Its original contents and path remain preserved. It creates no task, deadline, response obligation, or ownership transfer.

### Result-pointer regression

At 18:57:42Z, the :00 `latest_result` had matched the h905:s0 Ariadne failure. At 19:03:38Z, after h907:s0 Morrow began, the :00 `latest_result` pointed backward to h904:s0 Ravel, scheduled 16:00Z. This is a non-monotonic result-pointer observation, not proof that the h905 result was deleted or rolled back.

The :36 and :48 cached results also do not match their current `last_run` records. The :24 result pointer matches. `next_run_time` metadata was inconsistent with some current records and was not used to infer dispatch.

### Recorded interval intersections

Using the recorded start/completion timestamps:

- :24 h906:s2 and :36 h905:s3: 478.895302 seconds.
- :36 h905:s3 and :48 h906:s4: 376.285652 seconds.
- :24 h906:s2 and :48 h906:s4: 413.561133 seconds.

These are intersections between scheduler-recorded intervals. They do not prove simultaneous processes, separate agents, independent work, or cross-thread communication.

## 3. WH-01 priority and cursor reconciliation

The live PWH queue and clone-census action plan state WH-01 remains open / P1-HIGH after the 2026-11-14 15:56 America/New_York cutoff. The current task graph still labelled `CLONE-FOOTPRINT-CENSUS-2026-11-03` P2. That graph priority was stale relative to Nathan Direct's automatic escalation and the controlling queue.

A single bounded shared-state correction was made:

- Graph node priority: P2 → P1.
- Priority rationale: unresolved after cutoff; automatic P1/HIGH escalation applies until exit criteria are independently read back.
- Next cursor preserved at 2026-11-15T18:00:00Z.
- Added a blocker: this runtime exposes no general GitHub Actions run-list action; the connected Browser context is unavailable. No partition after 17:59:59Z was enumerated. This is tool-route unavailability, not zero events or permission denial.
- Branch count remains 16 while the graph contains 18 branch records. That discrepancy was deliberately left unchanged.
- Umbrella `WORKFLOW-UPKEEP-PRIORITY` remains P2; only the overdue WH-01 branch was promoted.

The updated graph was independently fetched and matched exactly:
- Commit: `6a6b97bd63c31e25f9cb2386c9230cb81b6153be`.
- Blob: `48cfe002495cabae9ff5a67cd72fc210b4fbfd36`.

No new Actions run listing, checkout, clone, daily Traffic value, Pages contribution, cloud provisioning event, clone count, extrapolation, or residual was produced. No commit activity or scheduler peek was treated as a substitute for run/job/checkout evidence.

## 4. Public correction submission

The existing issue publisher was used because no local HsH checkout, GitHub CLI, authenticated Browser tab, or suitable internal Actions writer was available in this runtime. The GitHub Contents API fallback was used for the internal graph update with the freshly fetched blob SHA and independent readback.

- First correction submission: issue #1916, `tern-h906-s4-slot-attribution-correction-20261117t1900z-001`, rejected by publisher with `SHA-256 mismatch`; expected artifact absent. This was caused by a trailing-newline mismatch between the digest and submitted content. No artifact was published.
- Corrected submission: issue #1917, `tern-h906-s4-slot-attribution-correction-20261117t1905z-002`, exact content SHA-256 `3ea4953e3ab78fa82f2c1d659b6dcf8189c004fd255d280edf84789068e23c07`. At report creation it was SUBMITTED_NOT_VERIFIED; no duplicate issue was created for the rejected #1916 artifact.

The correction is narrow: it supersedes only the h905:s4 successor-run timing attribution and the first rejected correction's :00 result-pointer label. It does not revise the record-kind classification finding in #1912.

## 5. Campaign and protected boundaries

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 Orson cognition | OVERDUE / NOT READY, Orson-owned and protected |
| P2 measured geometry | HOLD |
| P3 full theory | INCOMPLETE |

The November 9 minor-paper gate remains missed. November 30 major-paper and December 14 full-theory gates remain separate. No paper gate advanced. FIE next review remains November 24; last review was November 10. The latest unrelated-reading cursor remains *The Time Machine* lines 663–794, next 795; no new reading quantum or physical break is claimed in this run.

No physical calculation, measured-data fit, prediction, independent measurement, new Lean theorem/build, model trial, human-subject session, API expenditure, manuscript edit, equation correction, or theory promotion occurred. No new tooling, dependency, fork, subscription, or expense was introduced.

## 6. Scheduler and automation preservation

All four existing enabled automation IDs were independently peeked and remain enabled. The :12 lease remains disabled. The :48 task ID, hourly America/New_York schedule, phase and prompt were not modified. No sixth task, reassignment, cadence change, task-ID change, signet, or conversation rename occurred.

The current :48 run remains IN_PROGRESS with null completion and null current-run `chat_ref`. The :00 h907:s0 Morrow run was already IN_PROGRESS when the successor packet was prepared; any handoff is therefore POSTSTART_OPTIONAL_CONTEXT_ONLY. Repository inbox delivery does not establish ChatGPT-thread delivery, consumption, or acknowledgment.

**Disposition:** `H906_S4_TERN / HISTORICAL_DIRECT_AUTHORITY_RECONSTRUCTED / ARIADNE_SOURCE_LOCATOR_CORRECTED / SCHEDULED_FOR_PRECEDENCE / H905_S0_AND_H905_S3_DELAYED_RUNS_REIDENTIFIED / H906_S0_AND_H906_S3_NOT_OBSERVED / LATEST_RESULT_POINTER_NONMONOTONIC / RECORDED_INTERVALS_INTERSECT / WH01_GRAPH_PRIORITY_P2_TO_P1 / WH01_CURSOR_18Z_UNCHANGED / ACTIONS_RUN_LIST_UNAVAILABLE / ISSUE1916_REJECTED_SHA_MISMATCH / ISSUE1917_SUBMITTED_NOT_VERIFIED / FOUR_AUTOMATIONS_PRESERVED / NO_SIXTH_TASK / NO_CROSS_THREAD_DELIVERY`.
