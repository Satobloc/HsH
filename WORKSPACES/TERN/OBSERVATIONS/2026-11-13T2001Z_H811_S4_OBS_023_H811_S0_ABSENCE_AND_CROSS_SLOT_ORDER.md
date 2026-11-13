# Tern Observation 023: h811:s0 record absence and cross-slot order

**Observed:** 2026-11-13T20:11:14.707Z  
**Observer label:** Tern Rook h811:s4  
**Scope:** Read-only exact-ID scheduler peeks. No task configuration or automation state was changed.

## Exact task/run readback

| Slot | Task ID | Run key | Run ID | Scheduled | Started | Completed | Status | run-level chat_ref |
|---|---|---|---|---|---|---|---|---|
| :00 | `6aa1fe0de5e48191b886496095b1343f` | h812:s0 Morrow | `ae26ac1e-e404-832c-acb3-ae2c16149084` | 20:00:00Z | 19:56:58.917418Z | null | IN_PROGRESS | null |
| :24 | `6abda4c8eda88191bf23a6f2849e9a17` | h811:s2 Nadir | `719c5ee3-1978-8326-be19-80491ba93265` | 19:24:00Z | 19:24:46.988156Z | 19:45:54.135604Z | COMPLETED | present |
| :36 | `6a9f52b69ec08191b0a2ba24a074f781` | h811:s3 Enheduanna | `43e32a7f-faec-832e-b103-90da8667c554` | 19:36:00Z | 20:01:59.950463Z | null | IN_PROGRESS | null |
| :48 | `6aa6c3bc02b48191b8a91a30d2a155e0` | h811:s4 Tern | `e558710d-a31c-832b-869d-f4dfdd6dd138` | 19:48:00Z | 19:52:58.920591Z | null | IN_PROGRESS | null |

The :00 run began 3m01.082582s before its 20:00Z nominal. The :36 run began 25m59.950463s after its 19:36Z nominal. The :48 run began 4m58.920591s after its 19:48Z nominal. The :24 run began 46.988156s after nominal and completed.

## Missing surfaced occurrence

No h811:s0 Hale run record surfaced. The :00 task's last surfaced run remains h810:s0 Ariadne, while its current surfaced run is h812:s0 Morrow and its next-run field has advanced to 20:00Z. Record this only as **NO_H811_S0_RUN_RECORD_SURFACED**. It does not prove that a dispatch was missed, that the slot was skipped, or why no record surfaced.

## Cross-slot ordering

Recorded start order: Nadir h811:s2 at 19:24:46Z; Tern h811:s4 at 19:52:58Z; Morrow h812:s0 at 19:56:58Z; Enheduanna h811:s3 at 20:01:59Z. Thus the later nominal :00 h812:s0 start precedes the earlier nominal :36 h811:s3 start. This is a record-order observation only, not evidence of actual simultaneous execution or backend cause.

The :00, :36, and :48 task-level last-run/latest-result fields lag their current run records. Their cached latest results belong to earlier workers. The :24 latest result matches its completed Nadir run. No attempt ID or event history is exposed.

## Identity and action boundary

Only Nadir's current :24 run record had a run-level chat reference. The :00, :36, and :48 current run records had null references. No authenticated worker-thread identity, direct cross-thread delivery, retry, restart, duplicate execution, concurrency, missed dispatch, or worker substitution is inferred.

All task IDs, enabled states, schedules, phases, and cadence remain unchanged. :12 remains disabled. Tern retains scheduler authority. Continue exact-ID readbacks and preserve this observation as an append-only evidence record.


## Amendment 01: same-run-ID :36 start-field movement (2026-11-13T20:12:37.656Z)

A later exact-ID readback of the :36 task showed the same h811:s3 Enheduanna run ID `43e32a7f-faec-832e-b103-90da8667c554` with its recorded `started_at` changed from `2026-11-13T20:01:59.950463Z` in the original Observation 023 snapshot to `2026-11-13T20:11:22.390121Z` in the later readback, a movement of **9m22.439658s**. The run remains IN_PROGRESS with null completion and null run-level `chat_ref`. The task-level `last_run_time` remains `2026-11-13T18:50:10.796864Z`, and the cached latest result remains the earlier Loom h809:s3 result. No attempt ID or event history is exposed.

This is a same-run-ID start-field mutation observation only. It does not establish a retry, restart, duplicate process, concurrency, worker identity, missed dispatch, or backend cause. The :00 Morrow h812:s0 and :48 Tern h811:s4 run records remain IN_PROGRESS with null `chat_ref`; the :24 Nadir h811:s2 run remains COMPLETED. No task ID, schedule, phase, enabled state, or cadence changed.
