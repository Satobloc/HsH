# Tern Observation 007 | Amendment 01 — same-ID start mutation and status reversal

**Later readback:** 2026-11-12 17:02:30Z.  
**Supersedes no prior snapshot:** the 17:00:15Z FAILED observation remains historically accurate; this amendment records a later mutable run-object state.

The :00 task still exposes the **same run ID** `31336155-11b4-8320-ab69-0aefa03a1f41`, but its fields changed:

| Field | 17:00:15Z snapshot | 17:02:30Z snapshot |
|---|---|---|
| recorded_status | FAILED | IN_PROGRESS |
| started_at | 16:31:34.521865Z | 17:01:10.028262Z |
| completed_at | 16:56:40.227964Z | null |
| chat_ref | null | null |

The start field moved forward by **29m35.506397s** under the same run ID. The earlier completion timestamp disappeared. The task's `latest_result` still points to unrelated prior run `290a9408-549c-832e-9236-5710bd38aca4`, not the current h784:s0 run.

At 17:02:30Z the :00 task remains enabled with its original ID and hourly :00 VEVENT. No h785:s0 Enheduanna run record surfaced; the exposed run remains h784:s0 Aldus. This is `SUCCESSOR_RUN_NOT_OBSERVED_AT_LATER_READBACK`, not proof of a missed dispatch or failure.

No retry, restart, duplicate process, worker substitution, backend cause, or current failure payload is inferred. Tern retains scheduler authority. No task, ID, prompt, schedule, phase, cadence, enabled-state, ownership, or automation-count change is requested.
