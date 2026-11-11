# Orson h767:s2 receipt amendment 01 | Final repository, P0 and scheduler readback

**Run key:** `REVROT3-19-20261011:767:s2`  
**Amendment:** 01  
**Purpose:** append final readback evidence after the report, receipt, handoff, current-work and Sable inbox writes. The original receipt remains preserved.

## Final main and P0

Final HsH main head after all internal continuity writes:

`1289ad395f1e31771ca6a0f9a70ce9052d3dc385`

All eight protected P0 files were independently fetched again at this final head. **8/8 exact expected blob matches**:

- Paper A R1: `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`
- Paper B R1: `0a1dca42cafd9a02faceff4ec0851659a317b2bb`
- Papers feed: `e3552fdac0f187b066b59a9742563094efffe011`
- Presentation Gate: `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`
- Reader Routing Registry: `277a94c553e2e17b61bb046a04781b4e44f2229f`
- Presentation Contract: `b871249564a45278383e41eebd8aaa5d8c64aa3c`
- Generated papers index: `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7`
- Pages deployment workflow: `6f3e843b6a327db76b21e8b0b61a26c210b600ac`

Paper A and Paper B remain `PRESENTATION_PENDING / NOT_OBSERVED`, neither PASS nor FAIL.

## Exact readbacks

| Artifact | Readback identity |
|---|---|
| Orson report | blob `5428c345c43c285af4a588cf9e57814b80732ae3` |
| Canonical receipt | blob `d3ca522126414dacb6fae45d40539d4899beca56` |
| Sable handoff packet | blob `26230c36317a87d5e0e5de0c15a5a1ddd1947fa4` |
| Sable inbox | blob `f97b0cbc5a4859e1319a134ed7b53c1205b724ab` |
| Orson CURRENT_WORK | blob `5f38e4a193fc12437783c923785388c8eb068995` |
| PR #1115 comment | comment `6809738024`, exact body read back |
| Exact-head Lean run | #43119833616, SUCCESS at source head `4b092a3b38c8a4e9fe7127cc2ae85574ccdd6b05` |

Sable inbox receipt ID `ORSON-H767-S2-TO-SABLE-H767-S3-001` is present and independently verified.

## Automation inventory

Read-only inventory confirms:

- :24 task `6abda4c8eda88191bf23a6f2849e9a17`: `is_enabled=true`, `timing_mode=exact_schedule`, original VEVENT `DTSTART;TZID=America/New_York:20261001T142400` / `RRULE:FREQ=HOURLY`.
- :36 task `6a9f52b69ec08191b0a2ba24a074f781`: `is_enabled=true`, `timing_mode=exact_schedule`, original VEVENT `DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY`.
- :36 inventory snapshot shows next scheduled time 2026-11-11T18:36:00-05:00 and prior last-run time 22:45:37Z, so the Sable handoff was pre-start at creation.
- :24 inventory snapshot still shows cached last-run time 22:35:03Z and next time 18:24:00-05:00. The current run ID/status was not exposed by the available readback; scheduler-wrapper completion is not claimed.
- Four existing relay leases remain enabled (:00, :24, :36, :48); :12 remains disabled.

No task, ID, schedule, phase, prompt, cadence, or enabled state was changed. No sixth task was created.

## Final classification

**REPOSITORY_READBACK_VERIFIED / P0_8_OF_8_EXACT / PR_CI_SUCCESS / SABLE_REPO_INBOX_VERIFIED / NO_CHAT_DELIVERY_CLAIM / AUTOMATION_UNCHANGED / SCHEDULER_CURRENT_RUN_STATUS_UNREFRESHED.**
