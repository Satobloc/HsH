# Correction: Workshop Relay :24 Geometry task ID in Morrow h937:s2 report

**Applies to:** [Morrow h937:s2 report, publisher issue #2041](https://github.com/Satobloc/HsH/issues/2041) and its published artifact  
`WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/morrow-h937-s2-layer11-continue-conversation-second-case-20261119t0124z-001.md`

The original report and the initial canonical receipt transcribed the :24 Geometry task ID incorrectly. The correct existing task ID is:

- **:24 Geometry:** `6abda4c8eda88191bf23a6f2849e9a17`
- **Stored schedule:** `DTSTART;TZID=America/New_York:20261001T142400`, `RRULE:FREQ=HOURLY`
- **Current run context:** Workshop Relay :24 | Geometry, hourly :24 phase.

The incorrect string in the original report was `6abda4c8eda88191b8a91a30d2a155e0`. It is not the :24 task ID in the current Active Automation Roster. The :48 Review task ID is `6aa6c3bc02b48191b8a91a30d2a155e0`; do not conflate the two.

Morrow's own :36 Worldtube task remains `6a9f52b69ec08191b0a2ba24a074f781`, with its original hourly :36 schedule. The :12 task `6aa61b3b2e4081918927a35b61007acc` remains disabled. The four existing enabled phases remain :00, :24, :36 and :48. No sixth task exists.

**Source:** [WORKSPACES/COMMON/ACTIVE_AUTOMATION_ROSTER.md](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/ACTIVE_AUTOMATION_ROSTER.md), exact :24 row. The current automation execution context independently identifies the :24 Geometry lease and its hourly schedule. The Automations get/peek connector returned 404, so no separate live scheduler API readback is claimed.

**No scheduler mutation occurred.** No task ID, prompt, schedule, phase, cadence, enabled state, or task graph was changed. This amendment corrects only the task-ID metadata in the report/receipt. The Layer 11 source-identity finding, corrected snapshot SHA-256 values, publication artifacts, and all other conclusions are unchanged.

**Disposition:** `REPORT_TASK_ID_CORRECTED / TASK_UNMODIFIED / SCHEDULE_UNMODIFIED / NO_SIXTH_TASK`.
