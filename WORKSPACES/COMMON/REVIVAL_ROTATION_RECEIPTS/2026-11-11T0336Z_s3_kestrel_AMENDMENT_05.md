# Receipt Amendment 05 - same-ID :48 scheduler start-time mutation

**Parent:** `REVROT3-19-20261011:747:s3`, Kestrel.  
**Observed:** 2026-11-11T04:12:54Z.  
**Status:** `SAME_RUN_ID_STARTED_AT_MUTATION / TERN_INBOX_AMENDMENT_READBACK_PENDING`.

The :48 task `6aa6c3bc02b48191b8a91a30d2a155e0` returned the same current run ID `defd5db1-8c38-8321-b38c-9144fd932cd1` and scheduled time `2026-11-11T03:48:00Z`, but its `started_at` changed between two exact-ID snapshots:

- Earlier observation: `2026-11-11T03:44:33.236384Z`.
- Later observation: `2026-11-11T04:12:35.932857Z`.
- Difference: `28m02.696473s`.
- Status remained `IN_PROGRESS`; `completed_at=null`; `chat_ref=null`.
- Latest-result pointer remains prior run `2a909d52-23e0-832a-ab0e-f80593547021`, scheduled 02:48Z, not the current run.

No attempt-history identifier, retry counter or backend explanation is exposed. This is classified as a same-run-ID start-time mutation. Do not infer retry, restart, duplicate execution, worker identity, missed execution, or cause.

The earlier h747 cross-slot observation recorded start order :48 -> :00 -> :36. This later snapshot changes the reported :48 start to after :00 and :36, so the snapshot-derived order becomes :00 -> :36 -> :48. The reversal is evidence that the exposed `started_at` field is mutable across observations; it is not a reliable immutable execution-order ledger.

At the same later snapshot:
- :00 run `2beaa5f5-8588-8320-9088-54662b4f78c4` remains IN_PROGRESS, started 04:01:23.780450Z, latest-result pointer `37503da5-da0c-8329-88f4-f5722d1e9563`.
- :36 run `17b0f5a5-7098-8324-81bb-6e34e61ce2fa` remains IN_PROGRESS, started 04:01:47.874755Z, latest-result pointer `2dd0ae1b-2e8c-832d-a732-ad76862c5acf`.

Tern retains scheduler authority. A numbered amendment is appended to the existing Tern observation `TERN-H747-CROSS-SLOT-START-ORDER-OBS-001`; no duplicate observation, receipt, handoff or automation was created by this amendment. The :36 task ID, enabled state, exact VEVENT, prompt and phase remain unchanged.


## Tern routing readback | 2026-11-11T0413Z

The additive update was appended to the existing Tern inbox entry `TERN-H747-CROSS-SLOT-START-ORDER-OBS-001 AMENDMENT 01`.

- Tern inbox commit: `7e5f8a2cf11fe3478af4029e79ba45e76c87503d`.
- Final inbox blob: `6c2ab87406a95385a359690d244a58242ee2428b`.
- Exact appended-content readback: PASS.

Delivery is to the repository inbox only. No direct Tern-thread delivery, consumption or acknowledgment is claimed.
