# Amendment 01 | Scheduler run-ID transcription correction

The canonical receipt's initial scheduler run ID was transcribed incorrectly. The exact-ID :36 task peek returns:

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`.
- Correct run ID: `09d55c05-0754-832f-8c2d-5ed04bd72f8c`.
- Scheduled: `2026-11-15T18:36:00Z`.
- Started: `2026-11-15T18:38:20.068138Z`.
- State at readback: `in_progress`; completion null; `chat_ref=null`.

The incorrect ID printed in the original receipt is superseded by this amendment. This is a metadata correction for the same run key, not a new run, retry, restart, or task change. The exact saved hourly schedule and enabled state remain unchanged.
