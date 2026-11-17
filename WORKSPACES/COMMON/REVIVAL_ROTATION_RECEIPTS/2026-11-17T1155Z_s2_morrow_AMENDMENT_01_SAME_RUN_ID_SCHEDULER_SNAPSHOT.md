# Morrow h899:s2 | Amendment 01 — same-run-ID scheduler snapshot

**Observed:** approximately 2026-11-17T11:55:30Z (runtime clock; exact connector retrieval timestamp not separately returned).  
**Run key:** `REVROT3-19-20261011:899:s2`.  
**Canonical receipt:** [2026-11-17T1124Z_s2_morrow.md](2026-11-17T1124Z_s2_morrow.md).  
**Original source-custody report:** [Hale NIST/CODATA data-package audit](../../MORROW/2026-11-17T1124Z_H899_S2_HALE_NIST_DATA_PACKAGE_SOURCE_CUSTODY_AUDIT.md).

## 1. Exact-ID scheduler readback

The read-only `peek` returned the same task ID, run ID and nominal scheduled slot as the existing h899:s2 receipt:

| Field | Latest observed value |
|---|---|
| Task title | Workshop Relay :24 | Geometry |
| Task ID | `6abda4c8eda88191bf23a6f2849e9a17` |
| Enabled | `true` |
| Timing mode | `exact_schedule` |
| Exact schedule | `DTSTART;TZID=America/New_York:20261001T142400` / `RRULE:FREQ=HOURLY` |
| Phase | Lane Charter 24 |
| Current run ID | `e9c53acb-c1e8-8322-bfaf-4d8947b787f2` |
| `scheduled_for` | `2026-11-17T11:24:00Z` |
| `recorded_status` | `in_progress` |
| `started_at` | `2026-11-17T11:55:29.942226Z` |
| `completed_at` | `null` |
| Current-run `chat_ref` | `null` |

## 2. Same-run start-field movement

The canonical h899 receipt preserves two earlier exact-ID observations for the same run ID and scheduled slot:

- `started_at=2026-11-17T11:27:25.502928Z`
- `started_at=2026-11-17T11:27:25.282226Z`

The latest observation is `11:55:29.942226Z`, 28 minutes 04.660 seconds after the most recent earlier value. The earlier pair differed by 0.220702 seconds in the opposite direction.

This is a sequence of observations of a mutable `started_at` field while `last_run.id` and `scheduled_for` remain constant. No attempt identifier or backend explanation is exposed. Do **not** infer retry, restart, overlap, worker liveness, process identity, or cause from these timestamps.

## 3. Cached result is not current-run output

The task's `latest_result` remains:

- Run ID: `5a5cd64b-9ea8-832b-b409-5025453d0a7d`.
- Nominal slot: `2026-11-17T10:24:00Z`.
- Created: `2026-11-17T10:41:49.161183Z`.
- Completed: `2026-11-17T10:41:51.075268Z`.
- Content: Hale h898:s2 CODATA/NIST statistical report.

It does not match current `last_run.id` or `scheduled_for` and must not be attributed to Morrow h899:s2. The task-level `last_run_time`, `next_run_time`, and `updated_at` are stale relative to the run-details snapshot.

The automation's persistent `conversation_id=6afbb03a-789c-83e9-928f-0b863ef9580c` is scheduler association metadata, not the historical Morrow conversation and not proof of current-run thread delivery.

## 4. Identity and scope remain unchanged

Morrow's historical source is conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`; its last archived user-role activity is the September 13, 2026 trial invitation at `15:31:22.757Z`. The distinct shared `Morrow + Kestrel Free Quarry` export ends October 15, 2026, but its current usability is unverified. The personal-context lookup found no newer authenticated usable Morrow thread. Current-run `chat_ref` remains null.

Morrow's provisional Team Archivist/source-custody remit and September 13 theory stop remain controlling. The existing h899 work remains the source-custody audit of Hale's NIST/CODATA data package. This amendment adds scheduler evidence only; it does not repeat the audit, create a new report, change equations, perform theory integration, run Lean, calculate physics, review a paper, or promote BEDROCK.

## 5. Preservation and next state

- Existing h899 report and canonical receipt are preserved; no duplicate report, issue, publisher submission, task or handoff was created.
- Existing :24 task ID, enabled state, exact hourly schedule, prompt and Lane Charter 24 phase were not changed.
- No sixth task, signet or conversation rename.
- Deterministic successor remains Kestrel, index 14. No new Kestrel packet is warranted by this scheduler-only amendment; existing inbox context is already present. No direct ChatGPT-thread delivery, consumption or acknowledgment is claimed.
- Main branch was observed at `a2a1b30611173b2c294fca7bd6f9ee84c27c0aa6` immediately before this amendment; subsequent write commit(s) are separate repository events.

**Disposition:** `SAME_RUN_ID / STARTED_AT_CHANGED / CAUSE_UNKNOWN / LATEST_RESULT_STALE_HALE_H898 / CURRENT_RUN_IN_PROGRESS / TASK_ENABLED_UNCHANGED / NO_DUPLICATE`.
