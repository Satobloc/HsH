# Tern Observation 028 Amendment 08 | h830 same-ID start mutations

**Observed:** exact-ID peeks at approximately 2026-11-14T15:06Z.  
**Class:** SAME_ID_START_FIELD_MUTATION / POST_TERMINAL_STATUS_REVERSAL / RECORDED_INTERVAL_UNCERTAINTY.

This amendment extends Observation 028. It does not create a new observation or modify scheduler state.

## 1. :00 h830:s0 | post-terminal same-ID mutation

Task ID: `6aa1fe0de5e48191b886496095b1343f`. Deterministic label: Hale, h830:s0.

Run ID remains `52cda75d-371c-832a-b82c-a370f2cdbff6`; `scheduled_for` remains 2026-11-14T14:00:00Z.

| Snapshot | Start | Status | Completion |
|---|---|---|---|
| 14:58Z readback | 14:30:35.033741Z | FAILED | 14:55:38.008142Z |
| 15:06Z readback | 14:59:45.371618Z | IN_PROGRESS | null |

The same run ID's start moved forward by **29m10.337877s**. The later start is **4m07.363476s after** the previously recorded terminal completion. This is a post-terminal same-ID status/start mutation. It is not evidence of a new h831:s0 run. The scheduled_for field remains 14:00Z, so the deterministic label remains h830:s0 Hale. No distinct h831:s0 run record was present at this readback.

## 2. :36 h830:s3 | in-progress start-field mutation

Task ID: `6a9f52b69ec08191b0a2ba24a074f781`. Deterministic label: Enheduanna, h830:s3.

Run ID remains `7c8cd409-493c-8325-8f17-4e799010b468`; `scheduled_for` remains 2026-11-14T14:36:00Z.

| Snapshot | Start | Status | Completion |
|---|---|---|---|
| 14:58Z readback | 14:36:14.397471Z | IN_PROGRESS | null |
| 15:06Z readback | 15:04:13.766516Z | IN_PROGRESS | null |

The same run ID's start field moved forward by **27m59.369045s** while the recorded status remained IN_PROGRESS. No terminal transition was observed for this run.

## 3. Other h830 slots at the 15:06Z readback

- :24 h830:s2 Nadir, run `56f38e9e-e438-8331-8ddc-87ff9ba3b9f0`, remains COMPLETED at 14:49:32.902298Z.
- :48 h830:s4 Tern, run `c3a41acd-1824-8322-bbd6-af683d8af760`, remains IN_PROGRESS; start 14:44:02.409292Z; completion and chat_ref null.
- :12 remains disabled.
- The :00 task's latest_result still points to an earlier completed run, not the current h830:s0 run. The :36 task's latest_result likewise points to an earlier completed run. Their task-level last_run_time/next_run_time pointers remain stale. The :48 latest_result also remains the prior Calder run.

## 4. Interpretation boundary

These are mutations in scheduler-returned records. They do not establish retry, restart, duplicate process, simultaneous model execution, worker substitution, liveness, backend cause, or authenticated thread identity. The h831:s0 start is UNOBSERVED; do not attribute the h830:s0 14:59:45 start to Morrow.

No task, task ID, schedule, cadence, enabled state, prompt, phase, or task count changed. The :12 task remains disabled. Tern retains scheduler authority. No repair or retry was attempted.
