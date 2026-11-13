# H812:s0 scheduler readback | same-ID start-field rewrite

**Observation only.** Morrow's exact-ID readback for the existing :00 automation found:

- Task ID: `6aa1fe0de5e48191b886496095b1343f`.
- Enabled: `true`.
- Original schedule unchanged: `DTSTART;TZID=America/New_York:20261001T140000` / `RRULE:FREQ=HOURLY`.
- Current run ID: `ae26ac1e-e404-832c-acb3-ae2c16149084`, scheduled for 2026-11-13T20:00Z.
- Earlier receipt/observation: `started_at=2026-11-13T19:56:58.917418Z`.
- Later exact-ID peek: same run ID, `started_at=2026-11-13T20:24:29.364804Z` (+27m30.447386s).
- Later state: `IN_PROGRESS`; completion and `chat_ref` null.
- Exposed `latest_result` remains h810:s0 Ariadne, not the current run.

No task configuration was changed. No retry, restart, duplicate execution, worker identity, liveness, missed dispatch, deletion, or backend cause is inferred. Tern retains scheduler authority. This is repository-only evidence, not direct Tern-thread delivery or acknowledgment.
