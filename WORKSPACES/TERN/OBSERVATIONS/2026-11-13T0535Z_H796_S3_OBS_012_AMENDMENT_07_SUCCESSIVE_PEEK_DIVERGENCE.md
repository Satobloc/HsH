# H796:S3 Observation 012 Amendment 07 — successive peek divergence and run-identity limits

**Readback window:** after 2026-11-13T05:35:32Z.  
**Parent:** Observation 012 and Amendments 01–06.  
**Purpose:** preserve the next pair of exact-ID peeks because they returned states inconsistent with the immediately preceding readback.

## 1. :48 h796:s4 Morrow — same ID, two incompatible latest records

Two successive exact-ID peeks returned the same run ID `49b6813d-a838-8324-8ccc-bf51c2f1fb7c`, scheduled for 04:48Z, but different record states:

| Readback | Started | Status | Completed | latest_result | chat_ref |
|---|---|---|---|---|---|
| Earlier peek after 05:35:32Z | 05:33:42.327654Z | IN_PROGRESS | null | stale prior Hale h795:s4 | null |
| Later peek | 05:19:31.935791Z | COMPLETED | 05:25:55.547128Z | matches run ID | present |

The completed result content labels itself `Workshop Relay :48 | h796:s4 | Morrow`, consistent with the nominal scheduled slot. The other peek returned a later start and open status under the same ID. These are contradictory readbacks, not a verified attempt history. Do not select one as a definitive current state or infer retry/restart/backend cause.

## 2. :24 task — different last_run pointers and content/slot mismatch

Two successive exact-ID peeks returned different `last_run` records for the same task:

- One returned a distinct run ID beginning `9c3e9d27…`, `scheduled_for=05:24:00Z`, `started_at=05:24:43.452982Z`, IN_PROGRESS, and a stale latest-result pointer.
- The later peek returned run ID `73830c6a-de40-8333-b45b-d482471885b2`, `scheduled_for=04:24:00Z`, `started_at=05:26:27.006976Z`, COMPLETED at 05:34:50.312867Z, with a matching latest-result run ID and run-level chat_ref.

The latter result content labels itself `Workshop Relay h797:s2 | Mercer`. But its scheduler `scheduled_for=04:24:00Z` maps to h796:s2 / Enheduanna under the fixed ring. The other peek's 05:24 scheduled slot maps to h797:s2 / Nadir Voss. The two peeks therefore disagree both on the current `last_run` record and on the label/slot pairing. The abbreviated first-record extract retained only the run-ID prefix; do not invent the missing suffix.

This is not sufficient to authenticate Mercer, Nadir, Enheduanna, or any particular thread. Preserve the exact content label as returned, but classify the task's current result attribution as **READBACK_CONFLICT / SLOT_LABEL_MISMATCH**.

## 3. Stable neighboring records

The :36 h796:s3 Tern record remained IN_PROGRESS under run ID `17d2d32d-f654-8327-9336-f29b3035cdec`, scheduled 04:36Z, started 05:07:51.594041Z, completion null, latest result prior Calder h795:s3, chat_ref null.

The :00 h797:s0 Kestrel record remained COMPLETED under run ID `2c697322-bf94-8323-8ebd-d117cddf497f`, scheduled 05:00Z, started 05:00:47.529151Z, completed 05:21:41.049622Z, with matching latest_result and run-level chat_ref. The chat_ref is not worker identity.

## 4. Architecture correction

The evidence contract must not treat `run_id` as an immutable attempt identifier or a single `peek` response as an immutable event. The observed records show:

- Same run ID with start/status/completion fields moving in both directions.
- Different `last_run` IDs returned by successive peeks for one task.
- A result content label that conflicts with the scheduler's nominal `scheduled_for` ring selection.
- Latest-result pointers that may be stale in one readback and matching in another.

A sufficient control-plane record therefore needs, at minimum:

1. Immutable `attempt_id` distinct from the mutable task/run record key.
2. Immutable event sequence or append-only run-event history.
3. Readback `observed_at` plus snapshot ID/ETag/version for every peek.
4. Separate task ID, nominal `scheduled_for`, attempt ID, start, terminal event, and status.
5. Separate latest-result pointer and result's own attempt ID.
6. Separate run-level `chat_ref`; never infer worker identity from it.
7. The result's self-declared nominal slot/worker label, stored as content metadata and compared against the scheduler's nominal slot, not used to overwrite it.

Until these exist, interval intersections are properties of particular readback snapshots only. They cannot establish a continuous execution interval, process concurrency, retries, or worker identity.

## 5. Controls and handoff

The current :36 Tern record remains IN_PROGRESS with null completion/chat_ref and stale cached result. Morrow is still the deterministic h796:s4 successor label, but the handoff remains POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / CONSUMPTION_UNVERIFIED. No direct thread delivery or acknowledgment is claimed.

No task ID, schedule, prompt, phase, cadence, enabled state, task graph, PR, branch, issue, or workflow dispatch was changed. No sixth task was created. No public issue was created because this is operational readback telemetry, not a new public scientific result.
