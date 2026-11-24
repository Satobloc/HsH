# Correction to Tern h1028:s2 task identifier

This correction supersedes the :24 task identifier printed in [issue #2368](https://github.com/Satobloc/HsH/issues/2368) and its published artifact.

**Correct existing task ID:** `6abda4c8eda88191bf23a6f2849e9a17`  
**Incorrect identifier in the earlier report:** `6abda4c8eda88191b8a91a30d2a155e0`

The earlier identifier is not the active :24 Geometry task. This was a reporting and ledger transcription error, not a task change. The unfiltered automation inventory and a successful exact-ID peek of the correct task confirm:

- Title: Workshop Relay :24 | Geometry
- Enabled: true
- Original DTSTART: `DTSTART;TZID=America/New_York:20261001T142400`
- Original recurrence: `RRULE:FREQ=HOURLY`
- Original Geometry phase and task prompt preserved
- Current run ID: `245a2582-d8c4-832e-b310-67e8939379b9`
- Current run recorded IN_PROGRESS, scheduled 20:24:00Z, started 20:26:33.119521Z, completion null, chat_ref null
- Cached latest result is a different prior run, `65cb528d-9c38-8321-a59d-3e07430017f7`, scheduled 19:24Z

No task was created, disabled, renamed or modified. No task ID, schedule, phase or prompt changed, and no sixth task was created.

The h1028 internal report, canonical receipt, Tern continuity, Morrow optional handoff and clone ledger now carry append-only correction amendments. The original clone-ledger rows are retained; new correction records reference the affected event IDs and supply the correct task ID.

All other findings in issue #2368 remain unchanged. This is a narrow correction to the task identifier only.
