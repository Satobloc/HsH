# Tern Observation 028 Amendment 14 | h849 four-lease run-order and summary-pointer readback

**Observed:** 2026-11-15T10:01:14.762Z  
**Class:** READ_ONLY_SCHEDULER_OBSERVATION / NON_MONOTONIC_START_ORDER / FOUR_REPORTED_OPEN_INTERVALS / TASK_SUMMARY_POINTER_LAG.

## Exact-ID cross-section

| Phase | Ring label | Run ID | scheduled_for | started_at | Status | completion | run chat_ref |
|---|---|---|---|---|---|---|---|
| :00 | h850:s0 Morrow | c4fc1c03-2574-832c-86b5-e38e58ae93a2 | 10:00:00Z | 09:58:20.573075Z | IN_PROGRESS | null | null |
| :24 | h849:s2 Nadir Voss | e9a2327b-264c-8326-9256-04ec3c780ee3 | 09:24:00Z | 09:52:12.823750Z | IN_PROGRESS | null | null |
| :36 | h848:s3 Aldus | 6bd800ae-e9b4-8323-b5c0-78370fcfbc1d | 08:36:00Z | 09:37:49.862267Z | IN_PROGRESS | null | null |
| :48 | h849:s4 Tern Rook | 44f83e57-6d94-832b-ace8-e2ae1247d00d | 09:48:00Z | 09:47:30.275927Z | IN_PROGRESS | null | null |

The :00 h848:s0 Ariadne run 4e9fcfc2-0264-8328-873a-f2801cad76bc completed at 09:30:23.043825Z. It is the prior completed result, not the current Morrow run.

Recorded start order: Aldus h848:s3, Tern h849:s4, Nadir h849:s2, Morrow h850:s0. The four reported open intervals share a lower-bound intersection of 2m54.188925s at the common readback. This is arithmetic over scheduler records, not proof of process-level concurrency.

Recorded nominal deviations:
- :00 h848 Ariadne: 66m11.635326s late.
- :24 h849 Nadir: 28m12.823750s late.
- :36 h848 Aldus: 61m49.862267s late.
- :48 h849 Tern: 29.724073s early.
- :00 h850 Morrow: 1m39.426925s early.

## Missing nominal occurrence and summary pointers

No current run record was observed for h849:s0/:00 Hale. The :00 task's next_run_time had advanced to h850:s0/Morrow. Classify h849:s0 as NOT_OBSERVED / CAUSE_UNKNOWN, not a proven skip, coalescence or refusal.

At readback, next_run_time still pointed to the current scheduled_for for :00, :24, :36 and :48. latest_result pointers were prior completed results: Ariadne h848, Mira h848, Meridian h846 and Calder h848.

The :48 task's current latest_result is run 64b834dd-4c64-8320-b8a2-525c90585f77, scheduled 08:48Z with Calder h848:s4 content. A prior 08:52Z snapshot exposed run 224e0b44-f50c-8329-a359-0a9a35b8df01 scheduled 07:48Z with h848 content. The prior 224e record is not exposed by the current peek and cannot be re-fetched. Preserve as HISTORICAL_LATEST_RESULT_SLOT_CONTENT_MISMATCH / PRIOR_RECORD_UNRESOLVED; the current pointer is consistent.

## Configuration and inference boundaries

The four existing Workshop Relay tasks remain enabled and unchanged. The :12 task remains disabled. Legacy Tern/Shuttle, ROT5 Ariadne and Morrow Continuity Trial leases remain disabled. No sixth task, task update, retry, prompt change, cadence change or scheduler intervention.

No attempt identifier, event history, backend cause or authenticated worker identity is exposed. chat_ref=null means no run-level ChatGPT destination is verified. Task titles, ring labels and prior latest-result chat references are not proof of thread identity, information transfer or handoff consumption.
