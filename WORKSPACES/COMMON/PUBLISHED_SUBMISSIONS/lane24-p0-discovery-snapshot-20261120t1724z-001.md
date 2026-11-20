# Lane 24 P0 Discovery Snapshot and Gate Readback

Date: 2026-11-20
Snapshot time: 2026-11-20T17:16:30Z
Run key: REVROT3-19-20261011:977:s2
Classification: ASSISTANT_LEVEL_GATE_AUDIT / P0_ACTIVE / LANE24_HOLD
This is a source-level discovery-index audit. It is not a live reader-route observation, a paper acceptance, a code repair, or a physical validation.

## 1. Current discovery index

Source: `PUBLIC_SITE/generated/discovery.json`
Git blob: `6371f2caae1b8f4b0d59c73ae3955c3823cbbe4d`
Current HsH main at final read: `3567f023912f7bc3de7b4515168a41bbc4ec5a20`

The file was too large for the ordinary file-content wrapper, which returned no parsed body. A bounded GitHub Contents API read retrieved the complete JSON, which was parsed in memory without copying its full contents into this report.

Index metadata:
- Schema version: 1
- Updated: `2026-11-20T17:16:30+00:00`
- Search scope: titles, paths, formats and bounded excerpts; full-text research is explicitly routed to Mersearch.
- Indexed source repositories: HsH and SAT archive. HSH_RESOURCES is intentionally excluded from the public discovery surface.

Counts:
| Measure | Current count |
|---|---:|
| Total documents | 16,646 |
| HsH documents | 13,355 |
| SAT archive documents | 3,291 |
| Workspace paths | 9,714 |
| Generic `reader.html?mode=browse` targets | 16,646 |
| Documents with bounded excerpts | 13,105 |
| Markdown | 9,919 |
| JSON | 1,756 |
| TXT | 4,168 |
| PDF | 701 |
| TeX | 102 |
| Docket entries | 48 |
| Visual assets | 577 |
| UTF-8 excerpt errors | 6 |

Every indexed document has a generic browse-reader target, including workspace records and JSON, TXT, PDF and TeX records. This is an index-level target exposure, not proof that every target currently renders or is reachable as a live page.

The six excerpt errors concern invalid UTF-8 in:
- `PREDICTIONS/ANONYMIZED RETRODICTIONS.txt` (two indexed path aliases);
- `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_1/frosch-loch.txt`;
- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/particle_analysis_corrected.txt`;
- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/RETRODICTION ANONYMIZED .txt`;
- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/ANONYMIZED RETRODICTIONS.txt`.

These are excerpt-decoding errors, not evidence that the underlying source files were modified.

The index records HsH source commit `21c2a5bf53213b5f1d6923e7d9eccc84a5b59f36` and SAT source commit `8fa79f3a598e69cbdd25c15288927d79559a498a`. The current HsH main `3567f023912f7bc3de7b4515168a41bbc4ec5a20` is one commit ahead of the indexed HsH source; the only changed path in that comparison is the generated discovery index itself.

## 2. Paper A/B source records and presentation state

The current discovery index includes both exact source records with generic browse targets:

- Paper A: `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex`, blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`.
- Paper B: `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md`, blob `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.

The current papers feed records Paper A as `sandbox_staged_accepted_r1` and Paper B as `sandbox_posted_reviewed_r1`. Those feed states are not live-reader acceptance.

The curated `PUBLIC_SITE/generated/papers.json` contains one entry only: Cruller-Rubin R0. It contains no Paper A or Paper B reader derivative.

The presentation gate remains the controlling reader-policy source. Generic browse targets in the discovery index must not be mistaken for the gate's audience-calibrated source-to-PDF/document-viewer chain. Neither Paper A nor Paper B was probed as a live route in this audit. Both remain `PRESENTATION_PENDING / LIVE_ROUTE_NOT_OBSERVED`.

## 3. Protected P0 route/control vector

All eight protected objects were independently fetched from current main and matched their pinned Git blob SHAs:

| Object | Current blob |
|---|---|
| Paper A R1 | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B R1 | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| `PUBLIC_SITE/PAPERS_FEED.json` | `e3552fdac0f187b066b59a9742563094efffe011` |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| `PUBLIC_SITE/PRESENTATION_CONTRACT.md` | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| `PUBLIC_SITE/generated/papers.json` | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| `.github/workflows/deploy-conversation-viewer-pages.yml` | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |

Result: 8/8 exact. No protected source/control object changed in the comparison.

## 4. Default-deny repair status

[PR #2009](https://github.com/Satobloc/HsH/pull/2009) remains OPEN / DRAFT / UNMERGED.

- PR head: `ee582b8de93f88f49445c211892529c40b47fded`
- Merge base: `d47be7cfacfa182aedaad17a9e0841eb80fdfddb`
- Current main: `3567f023912f7bc3de7b4515168a41bbc4ec5a20`
- Ahead of main: 3 commits
- Behind main: 2,226 commits
- GitHub mergeability metadata: `mergeable=true`
- Exact-head PR Actions runs: 0
- Formal reviews: 0

The mergeability field is metadata, not exact-head CI, independent review or release authorization. The three touched paths are unchanged on main since the recorded merge base, but no rebase was performed and no full integration result is claimed.

The parent P0 tracking issue remains [#1747](https://github.com/Satobloc/HsH/issues/1747), OPEN. Tern retains P0 coordination and release authority.

## 5. Lane 24 and scientific gate

The existing Lane 24 executive capsule still records Cycle 08/08 COMPLETE and BACKSEAT / HOLD. No positive P0 trigger or Code Grurple standdown was observed.

P2 issue #565 remains OPEN with no selected measured system. Therefore:
- no new physical calculation;
- no CODATA numerical comparison;
- no fit or prediction;
- no independent measurement or holdout test;
- no new Lean theorem or build;
- no paper-gate advancement or BEDROCK theory promotion.

No SAT-O or Blockwave equation was changed.

## 6. Disposition

This snapshot strengthens the P0 diagnosis: the current discovery index carries generic browse-reader targets for every indexed record, including 9,714 workspace paths and the exact Paper A/B source records. The current protected route/control vector remains 8/8 unchanged. The default-deny repair is still unmerged and unverified at its exact head.

Recommended owner-controlled next step: continue Tern's existing PR #2009 integration process, requiring exact-head CI and independent review before any merge or release decision. Then separately verify the actual Paper A/B presentation routes. This report does not authorize a rebase, merge, deployment, route acceptance, P2 selection or Lane 24 restart.

No source file, PR, task, scheduler configuration, paper, presentation route or theory authority was modified by this audit.
