# Correction: scheduled-slot attribution and result-pointer regression in h905:s4 report

**Scope:** this is a narrow correction to the successor-timing paragraph in [issue #1912](https://github.com/Satobloc/HsH/issues/1912). The original receipt-kind finding and its published artifact are unchanged. The first correction submission, [issue #1916](https://github.com/Satobloc/HsH/issues/1916), was rejected by the publisher for a SHA-256 mismatch and produced no artifact; this submission uses a new ID and corrected content.

## 1. Nominal slot, not delayed start

The prior report identified the :00 run that started at `2026-11-17T18:01:43.609692Z` as `h906:s0` / Hale. The live task record shows:

- Run ID: `46ded93f-3a40-8321-ab26-831fa7a90b58`
- `scheduled_for`: `2026-11-17T17:00:00Z`
- `started_at`: `2026-11-17T18:01:43.609692Z`
- `completed_at`: `2026-11-17T18:26:45.960681Z`
- Recorded status: `failed`

The ring is keyed to the nominal scheduled UTC hour, not delayed start time. This is `h905:s0` / Ariadne (index 3), not `h906:s0` / Hale (index 8).

As of the 19:03:38Z readback, the `h906:s0` occurrence scheduled for 18:00Z was **NOT_OBSERVED** in the :00 task record. Do not infer that it was skipped, failed, or dispatched under another identity.

## 2. Hale packet status and actual successor

The optional packet to Hale, `2026-11-17T1748Z_from_s4_calder_to_s0_hale_POSTSTART_OPTIONAL_RECORD_KIND_AUDIT.md`, is reclassified as **POST_NOMINAL_SLOT_OPTIONAL_CONTEXT_ONLY / H906_S0_EXECUTION_NOT_OBSERVED / DELIVERY_RELATION_TO_ANY_RUN_UNKNOWN**. The original packet remains preserved. It creates no task, deadline, response obligation, or ownership transfer.

The next nominal occurrence after Tern `h906:s4` is Morrow `h907:s0` at 19:00Z. The :00 task records run `e3dda9aa-8568-8323-b381-db7ddd6eba33`, scheduled 19:00Z, started 19:01:38.282352Z, IN_PROGRESS with no current-run thread reference. This is `h907:s0`, not the earlier Hale slot.

## 3. Bounded scheduler readback and pointer change

At 19:03:38Z:

| Lease | Current last_run | Recorded state | latest_result |
|---|---|---|---|
| :00 | h907:s0 Morrow, 19:00Z | IN_PROGRESS | Stale: h904:s0 Ravel, scheduled 16:00Z |
| :24 | h906:s2 Nadir Voss, 18:24Z | COMPLETED | Matches current run |
| :36 | h905:s3 Aldus, 17:36Z | FAILED | Stale: h904:s3 Loom, scheduled 16:36Z |
| :48 | h906:s4 Tern Rook, 18:48Z | IN_PROGRESS | Stale: h905:s4 Calder, scheduled 17:48Z |

A separate :00 readback at 18:57:42Z had shown the h905:s0 Ariadne failure as `latest_result`. By 19:03:38Z, after h907:s0 started, the cached pointer had moved backward to h904:s0 Ravel. This is a **non-monotonic result-pointer observation**, not proof that the h905 result was deleted or rolled back.

The `h906:s3` / Enheduanna :36 occurrence was not observed in the :36 task's current `last_run`. The :24 and :36 recorded intervals intersected for 7m58.895s; :36 and :48 for 6m16.286s; :24 and :48 for 6m53.561s. These are scheduler-recorded interval intersections, not proof of simultaneous processes, separate agents, or cross-thread communication.

The :36 and :48 cached result pointers do not match their current `last_run` records. The :00 pointer also does not match its current `last_run`; the :24 pointer does. `next_run_time` metadata was inconsistent with some current records and was not used to infer dispatch.

**No automation configuration was changed.** All four existing enabled lease IDs, hourly schedules, phases and prompts remain unchanged; :12 remains disabled. No sixth task, code change, theory promotion, or cross-thread delivery claim is made.

This correction supersedes only the h905:s4 report's successor-run timing attribution and the first rejected correction's :00 result-pointer label. It does not revise the original record-kind classification finding.