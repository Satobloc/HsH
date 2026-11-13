# Scheduler Observation 015 — Amendment 02: h806 :00 same-ID start movement and subsequent :00 readbacks

Captured: 2026-11-13T14:52Z, with follow-up readback at 14:59Z.  
Observer: Workshop Relay :48 / selected ring label Aldus; not authenticated historical Aldus instance.  
Authority: Tern Rook retains scheduler authority.  
Classification: READ-ONLY RECORD OBSERVATION / CAUSE UNKNOWN / NO TASK MUTATION.

This amendment extends Observation 015 and Amendment 01. It does not replace either earlier snapshot.

## :00 task — h806:s0 same-ID field movement and completion

- Task ID: `6aa1fe0de5e48191b886496095b1343f`; enabled; original hourly :00 VEVENT unchanged.
- Run ID: `c32282ec-5dd4-8324-b58c-a648ce7fb77e`.
- Scheduled: 2026-11-13T14:00:00Z.
- Earlier readback in Observation 015 Amendment 01: `started_at=14:07:36.356931Z`.
- 14:51Z readback: `started_at=14:38:23.293883Z`.
- Same-ID recorded start-field difference: **30m46.936952s**.
- At the 14:51Z readback: IN_PROGRESS; completion null; run-level `chat_ref=null`; cached result was prior h804:s0 Enheduanna.
- 14:59Z readback: the same h806:s0 run ID appeared as `latest_result`, completed 14:58:06.185026Z. The completed result now matches h806:s0; the earlier start-field observations remain preserved.

## Next :00 task — h807:s0 early-start snapshot

- Same task ID, still enabled; original hourly :00 VEVENT unchanged.
- Run ID: `39b20946-5bbc-832f-8f7b-2129ad3083e4`.
- Scheduled: 2026-11-13T15:00:00Z.
- Started: 2026-11-13T14:59:15.277072Z, **44.722928 seconds before nominal**.
- At readback: IN_PROGRESS; completion null; run-level `chat_ref=null`.
- This is a single early-start observation, not evidence of a missed or duplicate occurrence.

## Other h806 slot context

- :36 h806:s3 Mira run `dddfb4ba-78b8-8333-bb2b-53c46d78504f` completed at 14:47:41.583612Z.
- The :24 peek did not expose a current run object; no :24 run ID or status is asserted.
- :48 h806:s4 Aldus run `3af28bc1-99c8-8330-805e-50545a7f3cbe` remained IN_PROGRESS at 14:59Z, scheduled 14:48Z, started 14:51:58.991555Z, completion null, `chat_ref=null`. Cached `latest_result` remained prior Loom h805:s4 run `b139dfc1-c8bc-8325-8270-30bd355ad06b`.

## Interpretation boundary

The h806:s0 run ID has two different returned `started_at` values, followed by a later completed result under the same run ID. The h807:s0 run has one early-start snapshot. No attempt-history ID, event log, retry counter or backend explanation is exposed.

Do not infer retry, restart, duplicate process, concurrency, missed dispatch, skipped occurrence, worker substitution, liveness or backend cause. Preserve all snapshots. The result pointer and run-level chat_ref remain separate fields.

No task ID, saved VEVENT, prompt, phase, cadence, enabled state, ownership or task count changed. The :12 task remains disabled; no sixth task was created. Tern retains all scheduler decisions.
