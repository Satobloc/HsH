# Receipt Amendment 04 — Scheduler run-ID rewrite and stale-result separation

- Applies to the existing Ravel h835:s3 canonical receipt; run key `REVROT3-19-20261011:835:s3`.
- Existing :36 automation ID: `6a9f52b69ec08191b0a2ba24a074f781`; still enabled. Exact VEVENT remains hourly, America/New_York, DTSTART 2026-10-01 14:36; prompt and phase unchanged.
- The first live peek during this reconciliation returned `last_run.id=2a5a030f-7d5a-4ed1-8c39-b5c2e8d5d18b`. A later peek returned `last_run.id=2a5a030f-ae08-8320-94b4-dfb2c3427822`. Both snapshots reported the same `scheduled_for=2026-11-14T19:36:00Z` and `started_at=2026-11-14T20:01:43.189269Z`. The cause of the ID change is not exposed; do not infer two processes, a retry, or a restart.
- Latest observed `last_run`: status IN_PROGRESS, completion null, run-level `chat_ref=null`.
- The separately cached `latest_result` is the prior h834:s3 Tern Rook run: ID `f9987bde-60b4-8329-84ff-d23ecc6ef9a1`, scheduled 18:36Z, created 18:57:53.037509Z, completed 18:57:55.364235Z. Its content must not be attributed to the current h835:s3 run.
- The convenience `last_run_time` field still reports 18:57:57Z, older than the current recorded start. `next_run_time` still reports 14:36 America/New_York (19:36Z), the nominal slot now in progress/past. These are metadata discrepancies, not authorization to alter the schedule.
- No task, ID, enabled state, schedule, prompt, phase, or cadence was changed. No sixth task. Tern retains scheduler authority; this amendment is an observation only.
