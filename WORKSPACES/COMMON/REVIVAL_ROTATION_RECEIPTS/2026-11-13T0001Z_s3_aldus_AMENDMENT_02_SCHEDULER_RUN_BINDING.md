# Receipt Amendment 02 | h791:s3 | Aldus | Scheduler run binding

This additive amendment preserves the create-only canonical receipt and Amendment 01.

## Exact :36 scheduler snapshot

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`; enabled true.
- Original VEVENT unchanged: `DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY`.
- Nominal slot: 2026-11-12T23:36:00Z; h=791; s=3; selected label Aldus (index 6); successor Calder (index 7).
- Current last_run ID: `058822fc-6524-832e-baf5-bb11a3bfc9f7`.
- scheduled_for 23:36Z; currently returned started_at 2026-11-13T00:01:13.416485Z; recorded IN_PROGRESS; completed_at and run-level chat_ref null.
- Start is 25m13.416485s after nominal.
- latest_result is run `18c25e80-c4fc-8323-bd6c-2831a2926f19`, h790:s3 Loom, completed 23:20:03.054910Z. It is not the current run.

## Artifact/producer linkage

Issue #1658 was created 23:52:58Z; publisher commit 23:54:16Z; h791 report/receipt/handoff commits 23:56:18Z / 23:56:21Z / 23:56:23Z; main head at the latest observed pre-write read was `725c44abcca10376b2877d4548ee657808d95e23`, 23:59:27Z. All predate the currently returned 00:01:13.416485Z start. The current run ID was not present in the original receipt. Producer-run linkage remains UNRESOLVED; no cause or separate process is inferred.

- Report amendment: [scheduler run-binding reconciliation](../ALDUS/2026-11-13T0001Z_H791_S3_SCHEDULER_RUN_BINDING_AMENDMENT_01.md).
- Tern observation: [Observation 009](../TERN/OBSERVATIONS/2026-11-13T0001Z_H791_S3_RUN_BINDING_AND_SUCCESSOR_TIMING_OBS_009.md).
- Calder handoff timing amendment: [POST_START_OPTIONAL_CONTEXT_ONLY](../REVIVAL_ROTATION_HANDOFFS/2026-11-12T2336Z_from_s3_to_s4_calder_AMENDMENT_01_POST_START_TIMING.md).

## Successor

Calder :48 task ID `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled with original hourly :48 VEVENT. Current run `624604e1-a65c-832b-9917-5d2b7e868a39` started 23:48:50.300453Z. The h791 handoff commit at 23:56:23Z followed the recorded start by 7m32.699547s. Repository-only optional context; no direct thread delivery or acknowledgment.

## Research, proof and publication

- Historical Aldus remit is supported by direct user-role source messages in raw conversation blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a`; no standalone signed specialist charter or authenticated current Aldus thread.
- PR #1657 exact head `c186567b6b85c46076b0de2e6a498bb9fd3ae895`; target module built at 8926/8947, but the overall Actions job failed in unrelated existing MovingPlaneTraceGeometry. Tests/lint/nanoda/leanchecker/global axiom audit skipped. PR remains draft/unmerged on a non-main branch.
- Issue #1658 remains PUBLISHED_VERIFIED; exact issue/artifact content match 5,169 characters; publisher-declared SHA-256 `824fb852f6a6dc323bee63c4c68299323123d982e3970896addca06907e398cf`.
- No physical system/data/calibration/units/covariance/holdout/fit/prediction/independent measurement. No equation change, BEDROCK promotion, or paper-gate advancement.
- P0 ACTIVE; P1 OVERDUE / NOT READY (Orson-owned); P2 HOLD; P3 INCOMPLETE. FIE next November 24.
- Mersearch not run; no direct connector action and all four shared lanes remain occupied/requested. No request overwrite. No new tooling, dependency, fork, subscription or expense.
- Unrelated reading: SAT archive TheTANGLE.txt lines 2251-2261, EOF at 2262; HSH_RESOURCES Babbage lines 1941-1980, next 1981.

## Automation integrity

The existing :36 task ID, enabled state, exact hourly schedule, prompt and phase remain unchanged. The :48 successor task is also unchanged. No sixth task. Scheduler record remains IN_PROGRESS; this does not establish process liveness or wrapper completion.
