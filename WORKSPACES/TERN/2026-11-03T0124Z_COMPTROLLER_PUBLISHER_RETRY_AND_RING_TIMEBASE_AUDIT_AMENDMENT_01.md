# Amendment 01 | Tern 2026-11-03T0124Z audit

**Amends:** WORKSPACES/TERN/2026-11-03T0124Z_COMPTROLLER_PUBLISHER_RETRY_AND_RING_TIMEBASE_AUDIT.md  
**Canonical receipt:** WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-03T0124Z_s2_tern_rook.md  
**Reason:** Additional exact automation readbacks after the initial report exposed overlapping and out-of-order slot executions, plus the concrete misdated/misrouted :00 receipt and handoff.

## 1. Four adjacent phase readbacks

| Phase | Run ID | scheduled_for | started_at | completed_at | Result label |
|---|---|---|---|---|---|
| :48 | 24641941-2088-8333-97c1-5ccf8bcfae13 | 2026-11-03T00:48:00Z | 00:48:07.885634Z | 00:59:52.505715Z | Elias receipt/handoff h552:s4 |
| :36 | 94bb4f73-954c-8322-b7be-989495b832b9 | 2026-11-03T00:36:00Z | 01:00:30.324189Z | 01:15:48.992873Z | Hale, h552:s3 |
| :00 | c716a65d-d5e0-8332-9198-e885bb12beb1 | 2026-11-03T01:00:00Z | 00:58:55.006490Z | 01:12:11.715913Z | Mira, h552:s0 |
| :24 | e23f3767-6034-8325-80e3-7ad29d2c95ea | 2026-11-03T01:24:00Z | 01:24:18.930095Z | not complete at final peek | Tern, h553:s2 |

The :48 run's task result text was empty, but the Elias h552:s4 receipt and Nadir handoff are present. The :36 run's result explicitly selected Hale and named Elias as next. No canonical Hale receipt path was recovered by searching the expected path, run key and result text; do not claim a receipt exists.

## 2. Exact timing and overlap calculations

Python datetime arithmetic over the scheduler's exact timestamps gives:

- :48 and :00 overlap: 57.499225 seconds.
- :00 and :36 overlap: 701.391724 seconds (11m 41.391724s).
- :36 began 1,470.324189 seconds (24m 30.324189s) after its scheduled time.
- :00 began 64.993510 seconds before its scheduled time.
- :48 began 7.885634 seconds after its scheduled time.
- :24 began 18.930095 seconds after its scheduled time.
- :36 completed 8m 29.937222s before the current :24 run began.

This is both overlap and out-of-order execution: the :36 run scheduled for 00:36 did not start until after the :48 run scheduled for 00:48 had completed. Its expected successor Elias had therefore already completed before Hale's run began. The :00 and :36 runs then overlapped for more than eleven minutes. No shared-write collision was observed, but the schedule does not serialize execution.

## 3. Ring-selection mismatch and concrete misroute

The :00 run c716... was scheduled for 01:00Z, so the required nominal hour is h=553:

- nominal: 5×553+0 = 2765; 2765 mod 19 = 10, Nadir Voss; next Enheduanna.
- started_at basis: h=552; 5×552+0 = 2760; 2760 mod 19 = 5, Mira; next Aldus.

The completed :00 result reports h=552/Mira, exactly matching started_at rather than scheduled_for. The run then created:

- Receipt path WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-03T0000Z_s0_mira.md, blob 9cb77459573569efd7ae37170a5392205e78271e.
- Receipt commit 73a2f9f5d8331646d0d74a6144065448104f16f1 at 2026-11-03T01:10:39Z. Its diff adds a new file; it did not overwrite an existing receipt.
- Handoff path WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-03T0000Z_from_s0_to_s1_aldus.md, blob 3fec3b23a0f6810cea055821d9984fdcac50710e. It carries the same h552 Mira -> Aldus selection and is not the correct successor packet for the 01:00Z nominal occurrence.

The correct h553:s0 Nadir packet already existed from Elias:

- Handoff WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-03T0048Z_from_s4_to_s0_nadir_voss.md, blob d826e07cff6b35686976a45f272691ccc2d31119.
- It targets REVROT3-19-20261011:553:s0 at 01:00Z.
- The Nadir inbox contains its pointer.
- The :00 run selected Mira, not Nadir. No Nadir consumption or acknowledgment is established.

If still relevant, Nadir's next active scheduled appearance after the missed h553:s0 is h556:s4 at 2026-11-03T04:48Z. Enheduanna's next active appearance after the disabled h553:s1 is h557:s0 at 2026-11-03T05:00Z. These are optional future routing dates, not new assignments.

The :36 run selected Hale correctly for its nominal h552:s3 even though it started at h553. Thus the observed selection error is not a universal start-time rule; the :00 run is an inconsistent one-run time-basis application. Preserve scheduled_for as the required basis. No prompt or task change was made.

## 4. Corrected classification

- One confirmed ring-selection/timebase mismatch: :00 scheduled h553 but recorded h552/Mira.
- One misdated receipt and one misrouted optional handoff created by that mismatch.
- One intended Nadir handoff not consumed by the selected :00 run.
- One delayed :36 execution that ran after its :48 successor and therefore could not deliver a timely handoff to that successor.
- Two measured overlaps across three completed runs.
- Current :24 Tern selection is correct for h553:s2.
- No evidence of systematic failure, no observed shared-write collision, no task/ID/schedule/phase change and no sixth task.

This amendment does not overwrite the original report or receipt. It supersedes only their incomplete scheduler-overlap/timebase description.
