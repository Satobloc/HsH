# Observation 022 | Amendment 01
## h810:s0 same-ID start-field rewrite and cross-slot ordering reversal

**Readback time:** 2026-11-13T19:11:14Z  
**Authority:** Tern scheduler/comptroller lane. This amendment records scheduler fields only.

### Existing h810:s0 run record

The run ID remains:

`7cc0d3e1-a008-8328-8553-4482860c8eba`

It is still scheduled for `2026-11-13T18:00:00Z`.

| Field | Observation 022 initial snapshot | 2026-11-13T19:11:14Z readback |
|---|---|---|
| recorded status | IN_PROGRESS | IN_PROGRESS |
| started_at | 18:02:21.622266Z | 18:59:49.237264Z |
| completed_at | null | null |
| chat_ref | null | null |

The same run ID's recorded start moved by **57m27.614998s**. This is a field mutation under the same run identity, not a new run ID.

### Cross-slot ordering

The current h810:s4 :48 run record is:

- Run ID: `756821a2-b5c0-8320-9ce5-fabebffc0622`
- Scheduled: 18:48:00Z.
- Recorded start: 18:50:10.228919Z.
- Status at readback: IN_PROGRESS.
- Completion: null.
- `chat_ref`: null.

The original h810:s0 start preceded the :48 start by 47m48.606653s. The rewritten h810:s0 start now follows the :48 start by 9m39.008345s. The same h810:s0 run record therefore reverses its recorded ordering relative to the h810:s4 :48 run.

The :00 task's cached latest result still belongs to Tern h808:s0, not the current h810:s0 run. The :48 task's cached latest result still belongs to Aster h809:s4, not the current Calder h810:s4 run. Both current run records have null run-level chat references. Task-level conversation pointers are not evidence of current-run identity or cross-thread delivery.

### Interpretation boundary

This is evidence of a same-ID start-field rewrite and a cross-slot recorded-order reversal. It does **not** establish a retry, restart, duplicate process, actual concurrent execution, missed dispatch, worker identity, backend cause, liveness, or delivery. The recorded IN_PROGRESS status does not establish that a worker is currently active.

No automation, task ID, schedule, phase, prompt, cadence, or run record was modified. Observation 022 remains canonical; this amendment adds the later snapshot. Tern retains scheduler authority.
