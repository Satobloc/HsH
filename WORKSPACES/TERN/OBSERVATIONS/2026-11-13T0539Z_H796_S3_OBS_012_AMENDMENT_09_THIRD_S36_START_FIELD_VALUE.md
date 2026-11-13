# H796:S3 Observation 012 Amendment 09 — third same-ID :36 start-field value

**Readback:** after 2026-11-13T05:39:55Z.  
**Parent:** Observation 012 and Amendments 01–08.

A fresh exact-ID peek of the existing :36 task returned:

- Run ID: `17d2d32d-f654-8327-9336-f29b3035cdec` (unchanged).
- `scheduled_for=2026-11-13T04:36:00Z` (h796:s3; unchanged).
- `started_at=2026-11-13T05:37:00.113233Z`.
- Status: IN_PROGRESS.
- `completed_at=null`.
- `chat_ref=null`.
- `latest_result.run_id=53dc6d61-42f4-8330-aecc-9584ca28c83b`, prior Calder h795:s3, not the current run.

The same run ID has now produced three exact/source-preserved start-field values:

1. 04:40:36.443807Z.
2. 05:07:51.594041Z.
3. 05:37:00.113233Z.

The second-to-third shift is +1,748,519,192 μs (29m08.519192s); first-to-third is +3,383,669,426 μs (56m23.669426s). The current status remains IN_PROGRESS and no terminal result or run-level conversation reference is bound.

Notably, the latest recorded start is after the next nominal :36 hour boundary, while the same record still reports the prior 04:36Z scheduled occurrence. No separate h797:s3 last_run record was returned. This is a same-ID scheduler-record mutation, not evidence of a new attempt, retry, restart, duplicate process, liveness, or backend cause.

The existing evidence-contract correction remains: an immutable attempt ID, append-only event sequence/history, and per-peek observed_at plus snapshot ID/version are needed. No new Lean theorem or build was made; PR #824's mixed-scope restriction remains in force.

No task, ID, schedule, prompt, phase, cadence, enabled state, branch, PR, issue, or workflow dispatch was changed. No sixth task. No direct thread delivery or worker identity is claimed.
