# Observation 016 Amendment 01 | Correct :24 task ID and run binding

**Supersedes the interpretation, not the historical record, of Observation 016.**

The earlier exact-ID peek used an incorrect identifier `6abda4c8eda88191b8a91a30d2a155e0`. It did not query the current :24 task and its NOT_FOUND result is not evidence of a scheduler read-path discrepancy.

The correct task ID is `6abda4c8eda88191bf23a6f2849e9a17`. A live task-list read and subsequent exact-ID peek confirm the task is enabled with the exact original hourly America/New_York :24 VEVENT.

The correct-ID peek reports current run:
- ID `cd10e476-bd90-8322-9a8f-fc463f6f22f2`.
- Status IN_PROGRESS.
- Scheduled `2026-11-13T15:24:00Z`.
- Recorded start `2026-11-13T15:22:36.923030Z`, 83.076970 seconds early.
- Completion null; current `chat_ref` null.

The cached `latest_result` is prior run `4d9a730b-785c-832b-ac9d-78cf02aea578`, the h806:s2 Alberr result, created 14:38:27.987817Z and completed 14:38:29.555690Z. It is not h807:s2 Elias output. The list-level `last_run_time` is stale relative to the current run record.

Classification: `TASK_ENABLED / SCHEDULE_UNCHANGED / CURRENT_RUN_IN_PROGRESS / EARLY_RECORDED_START / STALE_LATEST_RESULT / CHAT_REF_NULL`.

No worker liveness, actual concurrency, retry, restart, duplicate, cause, or authenticated Elias participation is inferred. No task setting, ID, schedule, phase, cadence, enabled state, task count or ownership changed. Tern retains scheduler authority. Repository-only correction; no direct thread delivery, consumption or acknowledgment is claimed.
