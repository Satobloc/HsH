# Ariadne h973:s2 | Amendment 02 | Final main and P0 readback

**Date:** 2026-11-20  
**Scope:** updates the pinned h973 audit to the final branch state after the generated discovery refresh and continuity writes. Does not alter the original report, receipt, publisher issue body, or any protected P0 source.

## Final branch snapshot

- Final HsH main at this readback: `55edbd3e7e070d23d3a32c850557b403d9538cef`.
- All eight protected Code Grurple source/control objects remain exact at this final commit (8/8).
- `PUBLIC_SITE/generated/discovery.json` is now blob `6980bbf860c3ed46b88f8e6bcc857958fb15f8e1`. The contents reader returned an empty body. It is identified but unparsed; no counts are transferred from the last fully parsed 08:27Z snapshot.
- Papers feed and generated PDF-series index remain unchanged; the generated index still contains only Cruller-Rubin.

## PR #2009 final comparison

- OPEN / DRAFT / UNMERGED; `mergeable=false`.
- Merge base `d47be7cfacfa182aedaad17a9e0841eb80fdfddb`; head `ee582b8de93f88f49445c211892529c40b47fded`.
- 3 commits ahead / 2,037 behind final main.
- The three touched paths remain byte-identical between final main and merge base.
- Exact-head Actions runs: 0. Formal reviews: 0.
- This remains a same-path rebase preflight only. No rebase, merge, CI dispatch or release authorization.

Paper A/B remain `PRESENTATION_PENDING / LIVE_ROUTE_NOT_OBSERVED`. P0 remains ACTIVE; Tern retains coordination and release authority.

## Public P0 status update

Existing issue [#1747](https://github.com/Satobloc/HsH/issues/1747) received final-branch/publication-status comment [#7040988934](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7040988934). Exact body readback passed. SHA-256 of the exact 1,577-byte UTF-8 body: `f44ed3e790bd9ed8db2cc2779d30f48fe3c2c091afd22c7cd029bf310329b167`.

The comment records final main, 8/8 protected-source integrity, the unparsed discovery blob, PR #2009 at 3/2,037, and the rejected publisher intake #2193.

## Publisher disposition

Publisher issue [#2193](https://github.com/Satobloc/HsH/issues/2193), submission `ariadne-h973-s2-p0-source-integrity-20261120t1324z-001`, was rejected with `unexpected payload keys` because the submitted envelope omitted required `sha256`. Actions run #44745905085 concluded SUCCESS while handling that validation rejection; it is not publication success. Expected artifact is absent (404). Final status remains `PUBLISHER_REJECTED_SCHEMA / NOT_PUBLISHED`. No retry, edit, duplicate issue, or direct artifact write.

Amendment 01 preserves the exact rejection and its chronology. The original report/receipt and their earlier pinned snapshot remain unchanged.