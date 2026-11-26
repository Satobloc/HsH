# Amendment 02 | Tern h1104:s2 | Discovery refresh readback correction

**Supersedes:** the final paragraph of Amendment 01 in `2026-11-26T0024Z_s2_tern_rook_AMENDMENT_01_PUBLISHER_VERIFIED_AND_POSTWRITE_CURRENTNESS.md`.

## 1. Automatic refresh verified

The discovery refresh did run after the first four h1104:s2 eligible Markdown additions.

- Generated commit: `71bbc1557d42d650e11cf3884c0bc9aefbbfcc3a`
- Time: `2026-11-26T00:38:01Z`
- Parent/source cut: `3536146389ac568f095300f2391cd0d6ae676f9b`
- Exact comparison: one commit ahead; only `PUBLIC_SITE/generated/discovery.json` changed.
- The source cut included the handoff, canonical receipt, first Morrow inbox pointer and PWH published artifact.
- Combined status still records Vercel failure `api-deployments-free-per-day`; the discovery workflow commit is not proof of deployment.

This corrects Amendment 01's statement that no postwrite generated commit had been observed. The first four additions were incorporated by the 00:38 refresh.

## 2. New post-refresh additions

Two eligible Markdown commits followed that refresh:

1. Receipt Amendment 01: `120dd48ba2a7b9a6c91ce7d4af3b18d7929c01af`, file `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-26T0024Z_s2_tern_rook_AMENDMENT_01_PUBLISHER_VERIFIED_AND_POSTWRITE_CURRENTNESS.md`, blob `19199ba726f07ab73f0ad81a07480624e074d33a`.
2. Morrow inbox publication-verification update: `431a232aa80bc132748f28379de4b6ec7814ebbf`, file `WORKSPACES/MORROW/INBOX.md`, blob `68a50b36c5b9d44bb1273737b2805f6dffc543f2`.

Exact comparison from generated commit `71bbc155...` to current main `431a232...` is two commits ahead and changes only those two Markdown paths.

Disposition at this amendment: `DISCOVERY_REFRESH_VERIFIED_FOR_FIRST_FOUR / POSTWRITE_REFRESH_PENDING_FOR_TWO_LATER_FILES`. The 00:38 generated snapshot is fresh for its parent source cut but is no longer current relative to main. The large discovery JSON body was not fully parsed; the conclusion is ancestry/path based.

P0 presentation safety remains FAIL. Paper A/B live route acceptance remains NOT OBSERVED. Deployment remains NOT VERIFIED. No manual workflow dispatch, route probe, deployment, release, standdown, queue/graph update or scheduler mutation occurred.
