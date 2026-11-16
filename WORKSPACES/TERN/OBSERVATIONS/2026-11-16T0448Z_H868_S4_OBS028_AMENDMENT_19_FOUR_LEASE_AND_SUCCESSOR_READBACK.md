# Observation 028 Amendment 19: h868 four-lease and h869 successor readbacks

**Classification:** scheduler metadata observation; not a provider-event transcript, process trace, authenticated actor record, or evidence of cross-thread delivery.

**Capture sequence**
- Initial clock read immediately before exact-ID peeks: 2026-11-16T04:53:10Z.
- Later four-lease collection: 2026-11-16T04:58:08Z.
- Successor/lifecycle collection: 2026-11-16T05:00:46Z.
- Detailed four-lease collection: 2026-11-16T05:04:15Z.
- All times below are UTC. The scheduler API returns normalized run records and task summaries. The peeks are not one atomic database snapshot.

## 1. Deterministic ring labels

For h=868, seq=5h+4=4344 and 4344 mod 19 = 12: Tern Rook. Next ring label: Morrow, index 13.

Other observed h868 slots:
- :00, expected Hale, index 8. No h868:s0 run record surfaced in the 04:53:10Z, 04:58:08Z, or 05:04:15Z readbacks.
- :24, Nadir Voss, index 10.
- :36, Enheduanna, index 11.
- :48, Tern Rook, index 12.

For h869:s0, seq=4345 and index=13: Morrow. This is a deterministic label only, not an authenticated assistant identity.

## 2. :00 slot

The last surfaced :00 record before h869 was h867:s0, selected label Ariadne:
- Run ID: `8c09d5f5-d580-8333-b9be-e35e3e06fddf`
- Scheduled: 2026-11-16T03:00:00Z
- Started: 03:59:37.839667Z
- Failed/completed: 04:24:43.904984Z
- Current run chat_ref: null
- Task metadata at the later readback: last_run_time 04:24:48.289064Z; updated_at 04:25:11.656575Z; next_run_time 05:00:00Z.

No h868:s0 record surfaced. The next h869:s0 record did surface:
- Run ID: `bbc22399-1778-8321-82ce-de683e80fd96`
- Scheduled: 05:00:00Z
- Started: 05:03:08.683277Z
- At 05:04:15Z: IN_PROGRESS, completed_at null, current run chat_ref null.
- Latest cached result still referred to prior run `3d4617de-bf24-8332-8f14-8d87fa9c51f9`, completed 2026-11-15T16:21:57.243556Z, with a chat_ref matching the configured conversation destination.
- Task-level last_run_time and updated_at still reflected the h867:s0 failure; next_run_time still read 05:00Z.

This is a stale task-summary/readback discrepancy. No cause, restart, duplicate execution, or skipped-slot mechanism is inferred.

## 3. :24 slot

h868:s2, selected label Nadir Voss:
- Run ID: `8c9a4f46-4478-8331-94ca-89c7db3a906a`
- Scheduled: 04:24:00Z
- Started: 04:51:37.308539Z
- Completed: 05:03:00.152746Z
- At 04:58:08Z: IN_PROGRESS, completed_at null, current chat_ref null, latest cached result still prior h867:s2 run `6ac3f176-38f4-8326-8608-73790a1009cd`.
- At 05:04:15Z: COMPLETED, current chat_ref present, latest cached result pointer updated to this same run.
- Task metadata caught up: last_run_time 05:03:03.545209Z; updated_at 05:03:27.809715Z; next_run_time 05:24:00Z.

The same run ID, scheduled time and start time persisted across the two readbacks. The cache pointer and chat binding changed as the run completed. This is a documented run-state transition, not proof of a particular model identity or human/agent communication.

## 4. :36 slot

h868:s3, selected label Enheduanna:
- Run ID: `e7bb47f1-c688-8325-9f36-b68a709fa7a1`
- Scheduled: 04:36:00Z
- Started: 04:37:31.424796Z
- Completed: 04:56:00.202342Z
- At 04:53:10Z: IN_PROGRESS, completed_at null, current chat_ref null, cached result still prior h867:s3 run `8880bfb2-7598-832e-a64d-27571f13c650`.
- At 04:58:08Z and later: COMPLETED, current chat_ref present, latest cached result pointer updated to this same run.
- Task metadata caught up: last_run_time 04:56:02.805829Z; updated_at 04:56:24.645669Z; next_run_time 05:36:00Z.

The same run ID, scheduled time and start time persisted across the readbacks.

## 5. :48 slot

h868:s4, selected label Tern Rook:
- Run ID: `e04c8549-6180-8322-8bda-b4b69d920aaf`
- Scheduled: 04:48:00Z
- Started: 04:44:57.715383Z
- At 04:53:10Z, 04:58:08Z and 05:04:15Z: IN_PROGRESS, completed_at null, current chat_ref null, latest_result null.
- Task metadata remained stale at last_run_time 04:07:27.443340Z; updated_at 04:07:49.837550Z; next_run_time 04:48:00Z.

## 6. Recorded interval relations

At the 04:53:10Z lower-bound readback, the h868:s2, s3 and s4 run records were all returned IN_PROGRESS. The later h868:s3 completion at 04:56:00.202342Z and the starts above give a recorded-interval intersection:

- Latest of the three starts: 04:51:37.308539Z.
- Earliest completion among the three: 04:56:00.202342Z.
- Intersection duration: **262,893,803 microseconds**.

At 05:04:15Z:
- h868:s2 completed at 05:03:00.152746Z.
- h869:s0 started at 05:03:08.683277Z.
- Recorded gap: **8,530,531 microseconds**.
- h868:s4 and h869:s0 were both returned IN_PROGRESS with no current chat_ref.
- Their recorded-interval overlap lower bound at the 05:04:15Z readback: **66,316,723 microseconds**.

These are intersections of returned run-record intervals under same-run-ID and status-field semantics. They do not establish physical process concurrency, backend causation, independent agents, source independence, consciousness, or cross-thread communication.

## 7. Automation preservation

- :00, :24, :36, :48 remain the same four enabled leases with original task IDs and hourly America/New_York schedules.
- :12 remains disabled.
- The historical Tern Shuttle automation remains disabled.
- No task, ID, cadence, phase, prompt, signet or conversation destination was changed.
- No sixth task was created.

## 8. Formalization pointer

Existing PR #1570 branch `tern/h743-scheduler-event-cross-section-20261110` was extended, not replaced:
- h762 false cache-pointer equality removed in favor of same-run/schedule/start/chat invariants.
- h868 ring indices, run records, metadata timing, same-run state transitions and recorded overlap formalized.
- h869:s0 Morrow start, stale task metadata, current-unbound/prior-cache state, and its relation to h868:s2 and h868:s4 added.
- Latest branch commit at this amendment: `6d20b207311d573b38d391ca67799b9dabbadec7`.
- Actions run #43807935559 was pending at the time this observation was written. No compile result is claimed for that latest addition.

The prior run #43807394742 compiled the h868 core module successfully at merge ref `337a2a5ab9e0032002e6b27d22b833e977e8e41e`; the overall root build failed later in unrelated `MovingPlaneTraceGeometry` definitions. Tests, lint, nanoda, leanchecker and global axiom audit were skipped.

**No task graph mutation, no issue/publisher duplicate, no theory promotion.**
