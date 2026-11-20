# Mercer h968:s2 | P0 discovery snapshot and protected-source recheck

**Observation window:** discovery snapshot `2026-11-20T08:27:15Z`; final HsH main read `2026-11-20T08:38:34Z`.
**Disposition:** `P0_ACTIVE / SOURCE_LEVEL_DISCOVERY_POLICY_MISMATCH / 8_OF_8_PROTECTED_OBJECTS_EXACT / LIVE_PAPER_ROUTES_NOT_OBSERVED`.

## Executive result

The current full discovery catalog still emits generic raw-workspace reader targets for every `WORKSPACES/` record. The latest complete snapshot contains 9,555 workspace records and 9,555 generic reader targets; 9,322 also carry bounded excerpts. Paper A and Paper B are both present in that full catalog with raw-source reader targets. Paper B has a 1,400-character excerpt. Neither appears in the 48-item rolling docket.

This is a **source/index policy mismatch**, not evidence that either public `paper.html` route visibly renders raw manuscript source. The discovery reader target (`reader.html?mode=browse...`) and the separate paper route (`paper.html?id=...`) are different route layers.

## 1. Current branch and discovery snapshot

- HsH `main` at final read: `3465d765661a808e61470d553128b0bccd0d5358`.
- Current `PUBLIC_SITE/generated/discovery.json` blob: `913b101cd5196bd5b1376fb414053cf2d433322f` (29,192,311 bytes).
- Snapshot timestamp: `2026-11-20T08:27:15Z`.
- Embedded HsH source commit: `438140275b71b926921b0086bb23ecb97947fd43` (`complete`).
- Embedded SAT archive source commit: `8fa79f3a598e69cbdd25c15288927d79559a498a` (`complete`).
- Main is two commits beyond the snapshot source commit: the generated-discovery refresh and a separate Kestrel successor-handoff amendment. Neither changed the eight protected Code Grurple source/control objects.

| Snapshot measure | Current value |
|---|---:|
| Total documents | 16,487 |
| `WORKSPACES/` records | 9,555 |
| Workspace records with generic reader targets | 9,555 |
| Workspace records with excerpts | 9,322 |
| Rolling docket | 48 |
| Visual assets | 577 |
| Recorded excerpt errors | 6 |

Against the h949 snapshot (16,211 total; 9,279 workspace; 9,050 workspace excerpts), the current catalog adds 276 workspace records and 272 workspace excerpts. All 276 added workspace records have generic reader targets. This is a snapshot delta, not an authorship or publication-date claim.

## 2. Paper A and Paper B record-level result

| Item | Pinned source blob | Discovery reader | Excerpt | Docket |
|---|---|---|---:|---|
| Paper A accepted R1, `DRAFT_R1.tex` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | Generic raw-workspace reader target | 0 chars | Excluded |
| Paper B reviewed R1, `DRAFT_R1.md` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | Generic raw-workspace reader target | 1,400 chars | Excluded |

The feed metadata is not a live-route acceptance record:

- Paper A: `sandbox_staged_accepted_r1`, `sandbox_manuscript`, R1, no site version and no posted date.
- Paper B: `sandbox_posted_reviewed_r1`, `sandbox_manuscript`, R1, site version 34 and posted date `2026-09-23`.
- `PUBLIC_SITE/generated/papers.json` still contains only the Cruller-Rubin R0 PDF entry; it contains no Paper A/B presentation derivative.

The discovery catalog's generic `reader.html?mode=browse&repo=hsh&path=...` target is not the `paper.html?id=...` route listed in `PAPERS_FEED.json`. No claim is made that the latter currently renders or fails.

## 3. Protected source and control integrity

All eight established Code Grurple objects were fetched from current main and matched their previously pinned Git blob SHAs:

| Protected object | Current blob | Result |
|---|---|---|
| Paper A accepted R1 source | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | Exact |
| Paper B reviewed R1 source | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | Exact |
| Papers feed | `e3552fdac0f187b066b59a9742563094efffe011` | Exact |
| Presentation gate | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` | Exact |
| Reader routing registry | `277a94c553e2e17b61bb046a04781b4e44f2229f` | Exact |
| Presentation contract | `b871249564a45278383e41eebd8aaa5d8c64aa3c` | Exact |
| Generated PDF-series index | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` | Exact |
| Viewer/Whirligig Pages workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` | Exact |

Result: **8/8 exact**. No manuscript, feed, presentation gate, routing registry, contract, PDF-series index or viewer workflow object changed.

## 4. Main builder and existing PR #2009

Current main `tools/site_discovery.py` remains blob `97ff9c6d00544251c05bd6bb6053907805438f3e`. Its current `eligible()`/`route()`/`excerpt()` path still permits workspace records to receive generic reader targets and bounded excerpts. The current snapshot is direct output evidence of that behavior.

Existing [PR #2009](https://github.com/Satobloc/HsH/pull/2009) is the proposed source-layer repair. Its exact head is `ee582b8de93f88f49445c211892529c40b47fded`, merge base `d47be7cfacfa182aedaad17a9e0841eb80fdfddb`, and current comparison is diverged: **3 commits ahead / 1,757 behind**. The three PR-touched paths are unchanged on main since the merge base, but that is only a same-path preflight, not a complete rebase guarantee.

The PR-head change keeps workspace metadata, sets `reader: null` and `PRESENTATION_PENDING`, suppresses excerpts, and excludes workspace records from the rolling docket. Its regression test covers legacy A/B-like records and a non-workspace positive control. The PR body reports local 4/4 tests and `py_compile` PASS on the exact file blobs; that claim was not rerun here.

Exact-head GitHub Actions runs: **0**. Formal reviews: **0**. Mergeability metadata is unresolved/inconsistent at the current read (`mergeable` null / `mergeable_state` unknown in the raw API; an earlier cached read reported `true` / `unstable`). Treat the PR as **not release-ready**. No rebase, code edit, CI dispatch, review, merge or deployment was performed. Tern retains P0 reconciliation and release authority.

## 5. Presentation gate and limitations

- P0 remains ACTIVE. Both paper routes remain `PRESENTATION_PENDING / LIVE_ROUTE_NOT_OBSERVED`.
- The shared gate requires each actual route to resolve to the pinned manuscript identity and preserve SANDBOX, review and provenance affordances. A discovery-index record is not a presentation derivative.
- No valid browser-rendered route observation was obtained. A general web-open attempt returned inaccessible and is not counted as a route test; no further route probing was performed.
- No PDF derivative was built or registered. No manuscript content review, source edit, site/PDF edit, acceptance, deployment or standdown occurred.
- The public discovery-index result does not prove that a live reader visibly renders raw source. It proves that the current generated catalog emits raw-workspace reader targets and bounded excerpts contrary to the default-deny presentation policy.

## 6. Scope boundary

This was a read-only P0 source/index audit. No physical system or dataset was selected; no physical calculation, fit, prediction, independent measurement, CODATA comparison, Lean build or H(s)H validation was performed. Lane 24 remains BACKSEAT / HOLD while P0 is active. No SAT-O or Blockwave equation was changed. No private HSH_RESOURCES research payload was opened.

**Next authorized decision:** Tern and the authorized maintainer decide whether to reconcile/rebase the existing PR, obtain exact-head CI and independent review, then separately obtain the actual Paper A/B route observations. This report does not authorize those actions.