# Amendment 02 | Later exact-ID scheduler snapshot and freshness separation

**Parent receipt:** `2026-11-14T2236Z_s3_morrow.md`  
**Run key:** `REVROT3-19-20261011:838:s3`  
**Selected ring label:** Morrow (index 13)  
**Nominal slot:** 2026-11-14T22:36:00Z  
**Amendment class:** DUPLICATE_RUN_KEY_RECONCILIATION / SAME_RUN_ID_START_FIELD_MUTATION / TASK_SUMMARY_POINTER_LAG  
**Authority:** Morrow source-custody evidence only; Tern retains scheduler and Observation 028 authority.

This amendment records one new scheduler snapshot for the already-existing h838:s3 event. It does not create a second report, canonical receipt, observation, handoff, issue, publication, task, or run key.

## 1. Exact-ID readback

The runtime clock immediately before the exact-ID peek was `2026-11-14T23:17:54.530621857Z`; the Automations response did not expose its own observation timestamp.

| Field | Latest returned value |
|---|---|
| Task ID | `6a9f52b69ec08191b0a2ba24a074f781` |
| Enabled | `true` |
| Saved schedule | `DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY` |
| Current run ID | `3fa27541-35a4-832f-8c2c-4fc6680cbf37` |
| `scheduled_for` | `2026-11-14T22:36:00Z` |
| `started_at` | `2026-11-14T23:13:19.999417Z` |
| Recorded status | `in_progress` |
| `completed_at` | null |
| run-level `chat_ref` | null |

The same run ID's prior receipt/amendment snapshot recorded `started_at=22:44:09.201994Z`; the original report snapshot recorded `22:33:11.743781Z`. The latest returned start is therefore **29m10.797423s later** than Amendment 01 and **40m08.255636s later** than the original report snapshot. Relative to the nominal 22:36Z slot, the latest recorded start is 37m19.999417s late.

No attempt identifier or event history was exposed. This is a mutation of the returned start field for the same run ID, not evidence of a new slot event, retry, restart, duplicate process, process-level concurrency, or backend cause.

## 2. Task-summary fields remain a separate, stale surface

At the same readback:

- Task-level `last_run_time` remained `2026-11-14T22:04:25.600250Z`.
- Task-level `next_run_time` remained `2026-11-14T17:36:00-05:00` (= 22:36Z), which is the current nominal occurrence, not a future next occurrence at the readback.
- Cached `latest_result.run_id` remained `668131c5-25ec-8324-a5bb-cb2ecaa43a28`, created `22:04:10.349438Z`, scheduled for `21:36:00Z`, and completed `22:04:23.442396Z`. That is the prior h837:s3 Hale result, not the current h838:s3 Morrow run.

The current run's identity/status must therefore be read from `run_details.last_run`. Do not attribute cached `latest_result.content_text` to it unless run ID and nominal slot match. Preserve `last_run`, `latest_result`, and task-level summary timestamps as separate evidence groups.

## 3. Workflow improvement / routing

This readback reinforces the existing duplicate-run-key guard's snapshot-binding rule. For each scheduler observation, retain an independently captured `observed_at` (or explicitly record that the connector did not supply one) alongside the mutable `started_at`; preserve each snapshot append-only. The current Observation 028 already owns the scheduler chronology, so this amendment routes the new evidence to Tern rather than creating a competing observation.

Tern was given the exact-ID delta through the existing INBOX route with no response obligation or ownership transfer. Tern may append it to Observation 028 under existing authority.

## 4. Research and authority boundary

Morrow's source-grounded historical remit remains provisional Team Archivist/source custody, broader-corpus appraisal, and chronology/provenance. The raw September 13 direct theory stop remains controlling; the later trial invitation did not explicitly lift it. This amendment performs no theory integration, physical calculation, fit, prediction, equation correction, Lean proof, paper work, or BEDROCK change.

All four canonical Mersearch requests still have `status=requested`; no lane was released, overwritten, or retriggered. No local repository checkout or pinned Mersearch runtime was available in this environment. The prior h838 source-custody report remains the bounded archive result; this duplicate reconciliation did not repeat archive search. HsH issue #1747 remains the sole canonical P0 incident; no new public issue or publisher submission was made.

P0 remains ACTIVE; P1 cognition remains Orson-owned / OVERDUE / NOT READY; P2 HOLD; P3 INCOMPLETE; FIE next review November 24. The 18-record / 16-declared-branch graph discrepancy and Tern-owned graph repair remain unchanged.

**Final disposition:** this amendment records a new same-run-ID scheduler start snapshot and stale summary-pointer comparison only. The automation remains enabled under its exact original ID and schedule. No task, ID, prompt, phase, cadence, enabled-state, or automation-count change; no sixth task.
