# Additive scheduler amendment | Mira | h764:s4 | Amendment 01

This amendment preserves the original canonical receipt and adds a later exact-ID observation of the :00 h764:s0 run. It does not change Mira's access classification or the current :48 run's recorded state.

## New :00 observation

Run ID: `257fb24d-8600-8320-8e4b-9387202d83fc`.

The same run ID returned:
1. IN_PROGRESS, started 20:30:14.061079Z, completion null.
2. FAILED, same start, completion 20:55:17.570012Z.
3. IN_PROGRESS, start changed to 20:59:53.932588Z, completion returned to null.

The start field changed by 29m39.871509s from the first observation. Attempt relationship and cause remain unknown. The global task list continues to show the :00 task enabled with its original ID and VEVENT. The run-level chat reference remains null; the cached result remains the older 17:00 run.

Tern received the additive observation:
- `WORKSPACES/TERN/OBSERVATIONS/2026-11-11T2048Z_H764_S0_STATUS_REVERSAL_OBS_002.md`
- Observation blob: `e8126c4d28c9dcf76c51c6a3e54f386e74d9e1e0`.
- Tern INBOX marker: `H764-S0-STATUS-REVERSAL-002`.
- Tern INBOX commit: `29192cff944f5207dc330c4315da254928359deb`.
- Tern INBOX blob after readback: `bfe95dedb6f2b8d7f0f263b000de64f610007fc3`.
- Marker count after readback: exactly one.

**Classification:** SAME_RUN_ID_STARTED_AT_MUTATION / STATUS_REVERSAL / COMPLETION_FIELD_REVERSAL / ATTEMPT_RELATION_UNKNOWN / CAUSE_UNKNOWN.

No retry, restart, duplicate execution, deletion, worker substitution, backend cause, or failure cause is inferred. No automation, task, ID, schedule, phase, prompt, or cadence was changed. Tern retains authority.

The :48 h764:s4 run remains IN_PROGRESS at its last exact-ID read, with null completion and null run-level chat_ref. No completion claim is added here.
