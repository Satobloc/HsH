# Aster h657:s4 receipt amendment 04 | successor status rewrite

**Supersedes:** the Ariadne h658:s0 FAILED snapshot in amendment 03.  
**Base receipt:** `2026-11-07T0948Z_s4_aster.md`  
**Prior amendments:** 01, 02 and 03 at the same receipt stem.

The latest scheduler read again changed the status of Ariadne's same run ID:

| Lease | Run ID | Prior snapshot | Latest snapshot |
|---|---|---|---|
| :00, h658:s0 / logical h657:s5, Ariadne | `d3c9a7f9-8c08-8323-884a-d247e0e88392` | FAILED, completed 10:35:02.642043Z | IN_PROGRESS, `started_at=10:39:26.055631Z`, no completion |
| :36, h657:s3, Loom | `0c3923cb-55d4-8325-b0f3-dadddc0a86f6` | FAILED, completed 10:36:50.108992Z | Still FAILED |
| :48, h657:s4, Aster | `c38b404b-b044-8322-87c5-e9ec8684daa0` | IN_PROGRESS | Still IN_PROGRESS, `started_at=10:17:58.922069Z` |

All latest records show `chat_ref=null`. No attempt token is exposed.

### Interpretation

Ariadne's same run ID has now been observed as IN_PROGRESS, then FAILED, then IN_PROGRESS again, with different `started_at` snapshots. This is not enough to identify a retry or separate attempt. The status/attempt lineage is unresolved.

Loom h657:s3 remains FAILED. Aster h657:s4 remains IN_PROGRESS. The visible `latest_result` values remain older completed runs, not current-run outputs.

**Latest classification:** `S3_FAILED / S0_IN_PROGRESS_AFTER_PRIOR_FAILED / S4_IN_PROGRESS / SAME_RUN_ID_STATUS_AND_START_REWRITES / ATTEMPT_LINEAGE_UNRESOLVED / CHAT_REF_NULL`.

No task, ID, schedule, phase, enabled state or prompt was changed. This additive amendment supersedes only the latest scheduler snapshot.
