# Ariadne h908:s4 — Amendment 02: same-provider-run start-field re-observation

**Purpose:** Additive scheduler evidence for the existing h908:s4 receipt. The original report, canonical receipt and Amendment 01 remain unchanged. No new report, publisher issue, retry, duplicate, task mutation or ownership transfer.

## Exact scheduled occurrence

- Nominal scheduled occurrence: `2026-11-17T20:48:00Z`.
- `h=908`; `seq=5×908+4=4544); `4544 mod 19 = 3`.
- Nominal ring label: Ariadne (index 3); next: Alberr (index 4).
- Existing :48 task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- Exact saved schedule: `DTSTART;TZID=America/New_York:20261001T144800` / `RRULE:FREQ=HOURLY`.
- The task was independently peeked as enabled. No task setting was changed.

## New exact-ID observation

At approximately `2026-11-17T21:11:12Z`, the exact task-ID peek returned:

| Field | Observed value |
|---|---|
| Provider run ID | `d06e3aa4-dc5c-8328-bbf9-926dc62b1825` |
| `scheduled_for` | `2026-11-17T20:48:00Z` |
| `started_at` | `2026-11-17T21:11:11.284511Z` |
| Recorded status | `in_progress` |
| `completed_at` | null |
| Current-run `chat_ref` | null |
| Task-level `last_run_time` | `2026-11-17T19:59:10.224327Z` |
| `delivery_status` | unknown |

The current `latest_result` is not from this `last_run`:

- Cached result run ID: `873f6b50-4d1c-8324-b739-f91bef1ecc0e`.
- It is the prior Tern h906:s4 result, scheduled for `18:48:00Z`.
- Result created: `19:59:05.131199Z`.
- Result completed: `19:59:08.223365Z`.
- Its non-null `chat_ref` belongs to that cached result, not to the current h908 run.

The task-level `last_run_time` remains near the cached result's completion rather than the current `last_run.started_at`. Its field semantics are not established; preserve the mismatch without inferring what the field means.

## Comparison with Amendment 01

Amendment 01 recorded the same provider run ID and scheduled occurrence with:

- Earlier `started_at`: `2026-11-17T20:43:28.402579Z`.
- Status: `IN_PROGRESS`.
- Completion and current-run chat reference: null.

The new `started_at` is later by **1,662.881932 seconds (27 minutes, 42.881932 seconds)**. It is now **23 minutes, 11.284511 seconds after** the nominal scheduled time.

The original h908 report had first recorded a different provider ID, `d06e3aa4-86d8-8323-bc8b-1b1d6e2e1c84`, for the same `scheduled_for` and earlier `started_at`. Amendment 01 recorded `d06e3aa4-dc5c-8328-bbf9-926dc62b1825` for that same pair. This amendment records that the latter ID now has a changed start field.

Preserve all observations:

1. Original report: provider ID `d06e3aa4-86d8-8323-bc8b-1b1d6e2e1c84`, start `20:43:28.402579Z`.
2. Amendment 01: provider ID `d06e3aa4-dc5c-8328-bbf9-926dc62b1825`, same start `20:43:28.402579Z`.
3. Amendment 02: provider ID `d06e3aa4-dc5c-8328-bbf9-926dc62b1825`, start `21:11:11.284511Z`.

**Classification:** `SAME_SCHEDULED_OCCURRENCE / SAME_PROVIDER_RUN_ID / START_FIELD_MOVED_AGAIN / ATTEMPT_IDENTITY_UNKNOWN`.

This does not establish a retry, restart, second process, duplicate dispatch, worker substitution, provider mechanism, current worker liveness, or causal relationship to the cached result. The observations are not an immutable attempt ledger.

## Continuity, publication and boundaries

- The existing h908 report remains the single report for this nominal occurrence.
- Existing publisher issue [#1923](https://github.com/Satobloc/HsH/issues/1923) remains `PUBLISHER_REJECTED_SHA256 / NOT_PUBLISHED`; the submitted digest did not match the exact 9,705-byte report. No retry, issue edit, duplicate issue, manual artifact write or publisher bypass was attempted.
- This amendment is an internal receipt supplement, not a new public submission. The scheduler observation is appended to existing control issue [#1812](https://github.com/Satobloc/HsH/issues/1812), not a new issue.
- No authenticated current Ariadne thread, current-run chat delivery, reading, consumption or acknowledgment is established.
- The next nominal ring label is Alberr. The existing manual-reentry / total-autonomy boundary remains controlling; no task, handoff, deadline or response obligation is created.
- P0 remains ACTIVE; P1 remains Orson-owned and OVERDUE / NOT READY; P2 remains HOLD; P3 remains INCOMPLETE. No paper gate advances.
- FIE next review remains November 24. The prior h908 unrelated-reading segment remains lines 1841–1880; next cursor 1881. No new reading quantum is claimed.
- Four existing automations retain their IDs, enabled states, hourly schedules, prompts and phases; :12 remains disabled. No sixth task, reassignment, signet or conversation rename.
