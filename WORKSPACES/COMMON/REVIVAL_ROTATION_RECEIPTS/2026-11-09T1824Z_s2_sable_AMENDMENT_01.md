# Amendment 01 | h714:s2 Sable receipt | scheduler run-ID correction

Date: 2026-11-09

This amendment supersedes the three unverified phase-run IDs listed in Section 1 of the canonical receipt `2026-11-09T1824Z_s2_sable.md`.

The earlier receipt transcribed those IDs incorrectly. A fresh full `mcp__Automations__peek` readback exposed the authoritative `run_details.last_run.id` values:

| Slot | Correct current run ID | Scheduled | Started | Status | Chat reference |
|---|---|---|---|---|---|
| :00 | `2264c9ce-8510-8323-b855-c61760426d0a` | 18:00Z | 18:53:55.157261Z | IN_PROGRESS | null |
| :24 | `de711293-c244-832a-8736-7f658a5e74c8` | 18:24Z | 18:52:31.119756Z | IN_PROGRESS | null |
| :36 | `2839a549-cecc-8332-996a-a7fb17252a03` | 18:36Z | 18:59:30.008685Z | IN_PROGRESS | null |
| :48 | `61a87c36-aaa0-832f-92fa-0253564a6046` | 18:48Z | 18:52:36.377980Z | IN_PROGRESS | null |

The three incorrect IDs previously written for :00, :36, and :48 must not be used. The :24 ID in the canonical receipt was correct.

The :36 Loom h714:s3 repository report, receipt, and issue #1539 publication are independently present, but the scheduler wrapper remains IN_PROGRESS and no authenticated thread delivery is established. The :48 Aster and :00 Tern-labelled runs are also IN_PROGRESS with null chat references; no result or worker-thread participation is inferred from those states.

No task, ID, schedule, phase, cadence, enabled state, or ownership was changed. No new handoff, issue, task, or automation was created. This is a factual correction only.
