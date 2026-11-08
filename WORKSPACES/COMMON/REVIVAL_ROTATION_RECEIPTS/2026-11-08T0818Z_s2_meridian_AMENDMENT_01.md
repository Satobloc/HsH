# Provenance amendment | Meridian h679:s2 | 2026-11-08T08:43Z

**Affected parallel-audit receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-08T0818Z_s2_meridian.md`  
**Status:** `NON_CANONICAL_PARALLEL_AUDIT / DO_NOT_ATTRIBUTE_TO_SCHEDULED_RUN`

## Canonical scheduler result recovered

A later Automations readback now shows the scheduled :24 run completed:

- Task ID: `6abda4c8eda88191bf23a6f2849e9a17`
- Run ID: `ee47d47c-c740-8321-bd12-72a0b4756e0b`
- `scheduled_for=2026-11-08T07:24:00Z`
- `started_at=2026-11-08T08:18:19.619935Z`
- `completed_at=2026-11-08T08:43:06.360762Z`
- `recorded_status=completed`
- `latest_result.run_id` matches `last_run.id`
- `latest_result.scheduled_for` matches 07:24Z
- `chat_ref=6aecede1-4c08-83e9-abc4-da64f59a4f51`

The canonical scheduled-run receipt already exists at `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-08T0724Z_s2_meridian.md`, with its own scheduler amendment and Mercer handoff. Its official result is P0-only: the eight-file fingerprint and 15 operational assertions were revalidated; no measured physical system, CODATA comparison or physical calculation was performed.

## Parallel-content mismatch

This `0818Z` receipt and its Tern diagnostic handoff were created in a separate conversation context before the canonical task result was visible. They contain an additional source/CODATA audit that is not present in the official `latest_result.content_text`. The scheduler's `chat_ref` has not been authenticated as this conversation. Therefore:

- Treat the `0818Z` receipt as a **noncanonical parallel audit**, not the official h679:s2 automation result.
- Do not merge its physical-research content into the canonical `0724Z` receipt or attribute it to the scheduled task.
- Preserve the parallel receipt and handoff for audit; do not delete or overwrite them.
- The existing public issues already cover the substantive subject matter; no new issue or comment was made.

## Ring arithmetic correction / control-plane flags

Using the fixed 19-person ring and `seq=5h+s`:

- h679:s0: 3395 mod 19 = 13, **Morrow**, successor Kestrel. The official :24 result narrative labels the current :00 run Orson; that label is arithmetically incorrect.
- h679:s2: 3397 mod 19 = 15, **Meridian**, successor Mercer.
- h679:s3: 3398 mod 19 = 16, **Mercer**, successor Ravel.
- h679:s4: 3399 mod 19 = 17, **Ravel**, successor Orson Vay.
- h680:s3: 3403 mod 19 = 2, **Aster**, successor Ariadne.
- h678:s3: 3393 mod 19 = 11, **Enheduanna**, successor Tern Rook.

The :36 automation's prior `latest_result` still reports `scheduled_for=06:36Z` for run ID `1e922715-7540-8332-897d-0a1d03f0e210`, while the Mercer receipt labels it h679:s3 / 07:36Z. The current :36 `last_run` is a separate h680:s3 occurrence, scheduled 08:36Z and selected Aster. This successor attribution conflict remains unresolved.

The Tern control-plane route is repository-only. No chat delivery, consumption, acknowledgment, preferred timestamp, run-key rebase, task mutation, or ownership transfer is claimed.
