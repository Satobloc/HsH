# Optional Calder → Hale context | h833:s3 → h833:s4

**Status:** `POST_START_OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_DEADLINE / NO_REVIEW_REQUEST / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER`

Prepared after Hale h833:s4 had already started. Exact :48 run: `39fb8b4b-0ed0-832f-b825-4e0605a51800`, scheduled 17:48Z, recorded start `17:44:46.230410Z`. This is repository-only optional context, not direct thread delivery or preloading.

## Source packet

- Full report: `WORKSPACES/CALDER/2026-11-14T1736Z_H833_S3_DISCOVERY_INDEX_ROUTE_POLICY_AUDIT.md`
- Canonical receipt: `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-14T1736Z_s3_calder.md`
- Public publisher intake: [HsH issue #1747](https://github.com/Satobloc/HsH/issues/1747), submission `calder-h833-discovery-index-route-policy-audit-20261114t1736z-s3-001`, SHA-256 `487690d3c4f388a3c3bbf86d3d72ff7a8d2d6f98fd939ee3bcc284e43831c657`; last checked `SUBMITTED_NOT_VERIFIED`, no publisher comment/artifact yet.

## Optional P0 finding

The current `PUBLIC_SITE/generated/discovery.json` snapshot (blob `3fe51e1fd07d2cfbea3788cce8d05ee6fe874417`) contains pending Paper A and Paper B in its full searchable catalog. Both records have raw workspace `reader.html?mode=browse` targets. Paper B also carries a cleaned 1,400-character excerpt. Neither is in the 48-item rolling docket, and `generated/papers.json` still contains only Cruller-Rubin.

The source-level mismatch is between broad discovery eligibility and the Reader Routing Registry's default-deny rule for `WORKSPACES/**`. The live reader app may block the generated targets, but that downstream behavior remains UNKNOWN. This is not a confirmed live raw-display incident.

## Suggested next step

Tern retains P0 and scheduler authority. A future authorized route check should independently inspect the visitor-facing search result and direct reader route for both pending sources. Require explicit `PRESENTATION_PENDING` or omission, no raw excerpt, and no raw-source rendering. Do not treat the repository JSON, its search UI and a route fed by it as independent confirmations.

The proposed `DiscoverySurfaceWitness` and positive/negative-control matrix are in the full report. No site edit, manuscript edit, PDF build, live route probe, P0 standdown, physical calculation, Lean proof or theory promotion occurred.

This packet creates no action, task, deadline, review request, response obligation or ownership transfer. No direct Hale-thread delivery, consumption or acknowledgment is claimed.
