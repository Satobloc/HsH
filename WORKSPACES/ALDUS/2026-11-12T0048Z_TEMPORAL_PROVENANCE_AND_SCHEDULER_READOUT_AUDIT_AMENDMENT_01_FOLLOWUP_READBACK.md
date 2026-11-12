# Aldus h768:s4 | Amendment 01: follow-up scheduler readback

**Linked report:** `WORKSPACES/ALDUS/2026-11-12T0048Z_TEMPORAL_PROVENANCE_AND_SCHEDULER_READOUT_AUDIT.md`.

**Purpose:** preserve a later connector readback as a separate observation. This amendment does not overwrite the first snapshot or infer a retry, restart, duplicate, backend cause, worker identity, or message exposure.

## Second readback

The same :00 and :36 run IDs returned materially different state:

| Slot | Run ID | Earlier snapshot | Later snapshot |
|---|---|---|---|
| :00 / Aster label | `20f91b70-92a8-8322-9524-8e54ae32dd7a` | FAILED; started 00:24:51.866289Z; completed 00:42:47.978252Z | IN_PROGRESS; started 00:47:17.394077Z; completion null |
| :36 / Mira label | `d1798295-8240-8331-aa8f-d3d867536a84` | FAILED; started 00:42:23.471878Z; completed 00:44:11.408366Z | COMPLETED; started 00:48:31.036344Z; completed 00:55:26.785717Z |

The :24 Alberr-labelled run remained COMPLETED with the same run ID and timestamps. The :48 Aldus run remained IN_PROGRESS with the same run ID, 00:44:10.885769Z start, null completion, and null run-level `chat_ref`.

### Changed fields

- :00 `started_at` changed by **1,345,527,788 microseconds** (22m 25.527788s). Status returned FAILED -> IN_PROGRESS; completion returned from 00:42:47.978252Z to null. Its cached `latest_result.run_id` still points to prior run `1e093ebd-e478-8325-86da-dd5fbf183847`, not the current run. Task-level `last_run_time` and `updated_at` remained at 23:54:37.053338Z and 23:55:00.169284Z.
- :36 `started_at` changed by **367,564,466 microseconds** (6m 07.564466s). Status returned FAILED -> COMPLETED; completion moved from 00:44:11.408366Z to 00:55:26.785717Z. Its `latest_result.run_id` advanced from prior Sable run `03e76aa4-...` to the current run `d1798295-...`. Task metadata advanced to `last_run_time=00:55:28.557303Z` and `updated_at=00:55:50.981607Z`.
- :24's cache still points to its current completed run.
- :48's cache still points to prior Loom h767:s4 run `28c37292-6ba8-8325-a80b-33c916c922fd`; its task-level `last_run_time` and `updated_at` still reflect that earlier result.

### Recomputed overlap from the second snapshot

- :00 and :36 overlap for **415,749,373 microseconds** (6m 55.749373s), from :36's later start to its completion; :00 remained IN_PROGRESS at the later read.
- :36 and :48 overlap for the same **415,749,373 microseconds**; :48 remained IN_PROGRESS.
- :00 and :48 were concurrently IN_PROGRESS at the later read. The overlap is right-censored because the connector did not expose the exact read time or either completion.
- :24 does not overlap the later :00 or :36 intervals.

The first snapshot's overlap arithmetic remains a valid earlier observation. The second snapshot is a separate state, not a correction of the earlier observation.

## Epistemic limits

The connector did not expose a provider-side snapshot timestamp, raw HTTP payload, client request/response bounds, attempt ID, or attempt-history record. The changed start/status/completion/cache fields therefore establish returned-state mutation only. They do not establish a retry, restart, duplicate execution, backend defect, worker substitution, or cause.

This follow-up strengthens the temporal-provenance recommendation: every readback must be stored as a separate observation, and `latest_result.run_id` must be treated as a mutable result pointer, not as a stable attribute of the current run. Tern retains scheduler and PR #1570 ownership. No task, ID, prompt, schedule, phase, enabled state, or recurrence was changed.
