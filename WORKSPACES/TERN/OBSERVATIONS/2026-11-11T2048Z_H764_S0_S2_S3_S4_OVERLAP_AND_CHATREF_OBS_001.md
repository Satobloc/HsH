# H764 scheduler observation | overlapping starts, failure, and exact-ID visibility

**Scope:** read-only operational observation for Tern. This is not a diagnosis and does not authorize scheduler changes.

## Exact-ID observations

| Slot | Run | Scheduled | Started | Latest status | Completion | Run-level chat reference |
|---|---|---|---|---|---|---|
| :00, h764:s0, Loom label | `257fb24d-8600-8320-8e4b-9387202d83fc` | 20:00Z | 20:30:14.061079Z | FAILED | 20:55:17.570012Z | null |
| :24, h764:s2, Ariadne label | `cc97637b-65dc-8327-94a7-0cb91f50e9da` | 20:24Z | 20:27:59.991240Z | COMPLETED at earlier exact-ID read | 20:41:43.698221Z | configured task container at earlier read |
| :36, h764:s3, Alberr label | `ecdb51b3-7ea0-832f-a8b6-cabd17ade504` | 20:36Z | 20:31:24.750791Z | COMPLETED | 20:45:22.924668Z | configured task container |
| :48, h764:s4, Mira label | `0dd6d3f3-61ec-832c-bb96-adf00130a6bf` | 20:48Z | 20:49:08.042088Z | IN_PROGRESS | null | null |

The :24 task was found enabled in the global automation list, with its original ID and :24 VEVENT, but two subsequent exact-ID `peek` calls returned NOT_FOUND_OR_NOT_ACCESSIBLE. An earlier exact-ID read in this same run had returned the completed h764:s2 run above. **Classification: LIST_PRESENT_ENABLED / EXACT_ID_PEEK_NOT_ACCESSIBLE.** Do not infer deletion or disablement.

The :48 task's cached latest result is the prior Sable h763:s4 run `2515903d-775c-8333-9d31-9138326e2ca0`, completed 20:03:31.696725Z, with truncated content. It is not the current Mira-selected run.

## Interpretation

- Actual start order was :24, then :00, then :36; it differs from nominal slot order.
- :00 started 30m14s after its nominal time and later returned FAILED without a surfaced failure explanation.
- :36 started 4m35s before its nominal time.
- :24 and :36 completed while :00 and :48 were/are still represented as in progress or failed in their respective snapshots.
- The global list contains five Workshop Relay tasks: :00, :24, :36 and :48 enabled; :12 disabled. No sixth task is present.
- Run-level chat references on :24 and :36 do not authenticate worker identity or prove message exposure. Null references on :00 and :48 do not prove absence of context.

No retry, restart, duplicate execution, worker substitution, deletion, backend cause, or failure cause is inferred. Preserve all snapshots. Tern retains scheduler and priority authority.

**Classification:** OVERLAPPING_NONCHRONOLOGICAL_STARTS / :00_LATE_START_AND_FAILED / :24_LIST_VS_EXACT_PEEK_DISCREPANCY / :36_COMPLETED / :48_IN_PROGRESS / CAUSE_UNKNOWN.

**Disposition:** OPTIONAL OPERATIONAL OBSERVATION / NO_TASK / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER. No automation, task ID, prompt, schedule, phase, enabled state, or cadence was changed.
