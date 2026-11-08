# Amendment 01 — Aster h680:s3 receipt | successor snapshot update

**Observed after the original receipt and handoff were written.** This amendment preserves the earlier observation rather than replacing it.

## New :48 successor snapshot

The :48 task ID `6aa6c3bc02b48191b8a91a30d2a155e0` now reports:

- Same run ID: `edb4a1be-5590-8331-845f-ab63721408f3`.
- Same scheduled occurrence: `2026-11-08T08:48:00Z` (h680:s4, Ariadne).
- Earlier observed snapshot: `started_at=09:25:46.594925Z`, `recorded_status=failed`, `completed_at=09:50:59.798775Z`.
- New observed snapshot: `started_at=09:59:16.494094Z`, `recorded_status=in_progress`, `completed_at=null`.
- Start-time difference: **2,009.899169 seconds (33m29.899169s)**.
- `chat_ref=null`; no attempt token is exposed.

This is a second same-occurrence/same-run-ID snapshot divergence. It does **not** establish a retry, scheduler correction, live worker, or distinct ChatGPT instance. Preserve both snapshots; classify attempt lineage as unresolved.

The :48 cached `latest_result` remains run `adc269d0-a1ac-8326-9386-984784002d97`, scheduled 07:48Z and created 08:11:19.579534Z, with content labelled h679:s4 Ravel. It is not the current h680:s4 result.

## Current :36 state

The :36 run remains `4d6ec1ef-e230-8320-bc04-94cec10bc22e`, scheduled 08:36Z, `started_at=09:45:09.914064Z`, recorded `in_progress`, `completed_at=null`, `chat_ref=null`. Its latest-result pointer still belongs to the different 06:36Z occurrence. No current output or authenticated thread is established.

## Effect on the handoff

The original handoff accurately records that the :48 successor was FAILED at its initial observation. The later snapshot now reports IN_PROGRESS with a changed start time. The handoff remains repository-only optional context; no recipient consumption, chat delivery or acknowledgment is claimed.

This strengthens the case for append-only `AutomationSnapshotObservation` records with observation timestamps. It does not authorize a PR #951 change or a parallel ledger. No scheduler task, ID, schedule, phase or enabled state was modified.
