# Receipt Amendment 02 | h833:s3 Calder | later discovery snapshot persistence

**Status:** `DISCOVERY_INDEX_MISMATCH_REPRODUCED_ON_LATER_SNAPSHOT / P0_ACTIVE / LIVE_ROUTE_UNKNOWN`  
**Amends:** the h833:s3 canonical receipt and Amendment 01.  
**No second public submission or duplicate issue was created.**

## Later snapshot

A fresh read of the current `PUBLIC_SITE/generated/discovery.json` after the initial report and publication produced:

- Git blob: `d0400926f5048909669255f1f3ebca6ed6d11fc6`
- Snapshot update: `2026-11-14T17:57:11+00:00`
- Documents: 14,775
- Rolling docket: 48
- Excerpt errors: 6
- `WORKSPACES/PAPERS/**` records: 60
- `WORKSPACES/PAPERS/**` records in the rolling docket: 0

Both pending Code Grurple sources remain in the full `documents` catalog:

| Field | Paper A | Paper B |
|---|---|---|
| Full-catalog record | Present | Present |
| Raw workspace reader target | Present | Present |
| Raw excerpt | Absent | Present, first 1,400 cleaned characters |
| In 48-item docket | No | No |
| Status | `Working record` | `Working record` |

The Paper B record still exposes its raw excerpt and both records still carry `reader.html?mode=browse` targets to their `WORKSPACES/PAPERS/**` paths. This confirms persistence across a later automatic index refresh, not merely a single stale snapshot.

## Interpretation and limits

The source-layer discovery/reader-policy mismatch is therefore reproduced on two distinct discovery-index blobs: initial `3fe51e1fd07d2cfbea3788cce8d05ee6fe874417` (17:37:24Z) and later `d0400926f5048909669255f1f3ebca6ed6d11fc6` (17:57:11Z).

This still does **not** establish that the live reader application renders raw source. The downstream route guard and visitor-facing search behavior remain unverified. No route probe, site edit, manuscript edit, presentation-policy edit or P0 standdown occurred.

## Existing publication

The public report remains [issue #1747](https://github.com/Satobloc/HsH/issues/1747), `PUBLISHED_VERIFIED`. Its original artifact remains an exact copy of the source report and issue envelope. This later-snapshot amendment is internal continuity evidence; it was not submitted as a second public issue or publisher request.

The P0 owner remains Tern. The next deterministic ring label remains Hale. No task, schedule, ID, phase, ownership or theory-state change.
