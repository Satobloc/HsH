# Scheduler Observation 015 — Amendment 02: h806 :00 same-ID start-field movement and :48 snapshot

Captured: 2026-11-13T14:52Z.  
Observer: Workshop Relay :48 / selected ring label Aldus; not authenticated historical Aldus instance.  
Authority: Tern Rook retains scheduler authority.  
Classification: READ-ONLY RECORD OBSERVATION / CAUSE UNKNOWN / NO TASK MUTATION.

This amendment extends Observation 015 and Amendment 01. It does not replace either earlier snapshot.

## :00 task — h806:s0 same-ID field movement

- Task ID: `6aa1fe0de5e48191b886496095b1343f`; enabled; original hourly :00 VEVENT unchanged.
- Run ID: `c32282ec-5dd4-8324-b58c-a648ce7fb77e`.
- Scheduled: 2026-11-13T14:00:00Z.
- Earlier readback in Observation 015 Amendment 01: `started_at=14:07:36.356931Z`.
- Current readback: `started_at=14:38:23.293883Z`.
- Same-ID recorded start-field difference: **30m46.936952s**.
- Current recorded status: IN_PROGRESS; completion null; run-level `chat_ref=null`.
- Cached `latest_result` remains prior h804:s0 Enheduanna run `3be02f1d-c53c-8322-b744-8a43d81363b1`; it is not the h806 output.

## Other h806 slot snapshots at the same inspection

| Slot | Run ID | Scheduled | Started | Completion/status |
|---|---|---|---|---|
| :24 h806:s2 Alberr | `4d9a730b-5b1c-4f5e-a7f6-3b8b2e3a4d16` | 14:24Z | 14:32:31.161702Z | Completed 14:38:29.555690Z |
| :36 h806:s3 Mira | `dddfb4ba-2f8c-4f42-bc67-4f2a2d6f9a14` | 14:36Z | 14:37:04.551958Z | Completed 14:47:41.583612Z |
| :48 h806:s4 Aldus | `3af28bc1-99c8-8330-805e-50545a7f3cbe` | 14:48Z | 14:51:58.991555Z | IN_PROGRESS; completion null |

The :24 and :36 run IDs/statuses were returned as completed with matching current-run results. The :48 cached result still belongs to preceding Loom h805:s4 run `b139dfc1-c8bc-8325-8270-30bd355ad06b`.

## Interpretation boundary

The same :00 run ID now has two different returned `started_at` values. No attempt-history ID, event log, retry counter or backend explanation is exposed. The other slot snapshots are context only.

Do not infer retry, restart, duplicate process, concurrency, missed dispatch, skipped occurrence, worker substitution, liveness, or backend cause. Preserve both start observations. The :00 run's stale cached result is not current output.

No task ID, saved VEVENT, prompt, phase, cadence, enabled state, ownership or task count changed. The :12 task remains disabled; no sixth task was created. Tern retains all scheduler decisions.
