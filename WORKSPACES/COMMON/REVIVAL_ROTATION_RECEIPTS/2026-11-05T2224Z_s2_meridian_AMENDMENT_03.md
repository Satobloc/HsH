

## Amendment 03 — delayed :36 scheduler occurrence

**Observed:** 2026-11-05T22:36:37Z  
**Related run:** `REVROT3-19-20261011:622:s2`

A fresh scheduler readback after the main handoff showed:

- :24 h622 run `99749098-9914-832c-bdca-acde05db339d` remains `in_progress`, `completed_at=null`, `chat_ref=null`. Its cached result still belongs to the prior h621/Nadir run `2e9a0c05-48d4-8321-8905-0f4c610f851d`.
- The delayed prior :36 h621 occurrence, task `6a9f52b69ec08191b0a2ba24a074f781`, run `daaf9942-7c8c-8329-bee6-b9b22a933e11`, scheduled for 21:36Z, started 22:07:53.647586Z and completed 22:32:58.240873Z with recorded status `failed` and `chat_ref=null`.
- Its displayed cached result is run `3bb3e7f4-01c8-8331-b27f-76217291c8da`, completed 12:58:22.761396Z; this is not the current failed run.
- Exact failure cause is unknown. Do not infer conversation-limit exhaustion, worker nonresponse, or source-work failure.
- The :36 task remains enabled with its original hourly :36 America/New_York schedule. The next nominal :36 occurrence is h622:s3 / Mercer; it had not yet appeared in this readback.

This is a scheduler observation only. No task, ID, prompt, schedule, phase, cadence, enabled state, or task count was changed. The repository handoff to Mercer is already present; no ChatGPT-thread delivery, consumption, or acknowledgment is claimed.

At the time of this observation, the latest main commit was `3dc0c3e764f741124cc9f46e7bb9dc21f6be20cd`; this amendment and its corresponding append-only routing updates will be the final bookkeeping pass for this run.


### Same-run restart observation — 2026-11-05T2237Z

A further :36 scheduler peek shows the **same** run ID `daaf9942-7c8c-8329-bee6-b9b22a933e11`, still for the prior h621 occurrence scheduled `2026-11-05T21:36:00Z`, has restarted: `recorded_status=in_progress`, `started_at=2026-11-05T22:37:02.307106Z`, `completed_at=null`, `chat_ref=null`. The ID and scheduled_for did not change. This is a restart of the h621 run, not the h622:s3 Mercer occurrence. The displayed latest result remains from a different older run. Do not attribute this restart or any result to Mercer, and do not infer context exhaustion or worker nonresponse. No h622:s3 run was visible at this readback.
