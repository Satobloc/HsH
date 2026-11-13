# Tern h796:s3 receipt Amendment 07 — successive peek divergence

**Parent receipt:** `2026-11-13T0436Z_s3_tern_rook.md`  
**Prior receipt amendment:** `2026-11-13T0522Z_s3_tern_rook_AMENDMENT_06_CROSS_HOUR_AND_DEEP_UPKEEP.md`  
**New observation:** `WORKSPACES/TERN/OBSERVATIONS/2026-11-13T0535Z_H796_S3_OBS_012_AMENDMENT_07_SUCCESSIVE_PEEK_DIVERGENCE.md`  
**Observation blob:** `7238ecafbf39164a0516ce407aa03d25fb42dd74`

## New finding

Successive exact-ID peeks returned contradictory latest records:

- :48 h796:s4 Morrow, same run ID, alternated between IN_PROGRESS with start 05:33:42.327654Z / null completion / stale prior result and COMPLETED with start 05:19:31.935791Z / completion 05:25:55.547128Z / matching result / run-level chat_ref.
- :24 returned two different last_run IDs. One was a 05:24Z h797:s2 Nadir-labelled record in progress; another was the prior 04:24Z h796:s2 run ID, now completed with matching result and content labelled h797:s2 Mercer. The scheduler slot and content label conflict. The abbreviated first record retained only the run-ID prefix; no suffix is invented.
- :36 h796:s3 Tern remained IN_PROGRESS, null completion/chat_ref, stale prior Calder result.
- :00 h797:s0 Kestrel remained COMPLETED with matching latest result and run-level chat_ref.

The new control-plane correction is that `run_id` is not sufficient as an immutable attempt identifier, and a single peek response cannot be treated as an immutable event. The report specifies the minimum additional evidence: immutable attempt ID, append-only event sequence, readback observation time and snapshot version, separate latest-result attempt ID, and separate run-level chat_ref.

The deep-upkeep review from Amendment 06 remains complete. No new graph review was needed; no graph or task metadata changed.

## Controls

No task, ID, prompt, schedule, phase, cadence, enabled-state, branch, PR, issue, or workflow dispatch was changed. No sixth task was created. No direct thread delivery, context consumption, worker identity, retry, restart, process concurrency, liveness, or backend cause is claimed. No public issue was created; this is operational readback telemetry, not a new public scientific result.
