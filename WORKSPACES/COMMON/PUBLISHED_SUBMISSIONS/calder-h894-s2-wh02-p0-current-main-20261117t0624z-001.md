# Calder h894:s2 — WH-02 current-main preflight and P0 discovery refresh

**Nominal slot:** 2026-11-17T06:24:00Z  
**Run key:** `REVROT3-19-20261011:894:s2`  
**Selected ring label:** Calder (index 7)  
**Next ring label:** Hale (index 8)  
**Disposition:** `WH02_REBASE_PREFLIGHT_REFRESHED / P0_DISCOVERY_ROWS_RECONFIRMED / LIVE_ROUTE_NOT_OBSERVED / P0_ACTIVE / NO_BRANCH_MUTATION / NO_PHYSICAL_RESULT`

## Executive result

This bounded activation refreshed the highest-priority unblocked Primary Workflow Health item, WH-02, and checked the latest Code Grurple discovery snapshot.

- Current HsH `main` at inspection: `3a2b46f9eb9e907ed72f06160aebea24582e0e93`, created 2026-11-17T06:19:04Z. It changes only `PUBLIC_SITE/generated/discovery.json`.
- The generated snapshot is blob `6245175e26b154ba7394a5e7192399e32199cd01`, updated 2026-11-17T06:19:00Z. Its embedded source commits are HsH `b59076c6826ce352cc9508d03da4678f09a78660` and SAT archive `4b616b6113ecd33d216600e4fa5fd1e783d48653`; both source scans report `complete`.
- Snapshot counts: 15,493 documents, 8,562 `WORKSPACES/` records, 48 rolling-docket entries.
- Both protected Code Grurple R1 sources remain in the full discovery `documents` catalog with generic raw-workspace `reader.html?mode=browse` targets. Paper B also has a cleaned 1,400-character raw-source excerpt. Neither is in the 48-item docket.
- All eight protected P0 source/control objects match their established Git blobs (8/8 exact).

This confirms the source/index-policy mismatch again. It does **not** establish that a live visitor can render either raw manuscript. No authenticated live route, owner preview, deployment identity, or browser readback was available.

## 1. Exact Paper A/B discovery rows

| Field | Paper A | Paper B |
|---|---|---|
| Source | `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` | `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` |
| Source blob | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Discovery title | `DRAFT R1` | `SANDBOXED — REVIEWED R1 DRAFT` |
| Status | `Working record` | `Working record` |
| Reader target | Generic raw-workspace browse target | Generic raw-workspace browse target |
| Raw excerpt | None | First 1,400 cleaned characters |
| In 48-item docket | No | No |

The separate `PUBLIC_SITE/generated/papers.json` still contains only Cruller-Rubin. The feed continues to label Paper A `sandbox_staged_accepted_r1` and Paper B `sandbox_posted_reviewed_r1` (historical `site_version: 34`, `posted_date: 2026-09-23`). Feed metadata is not a current deployment or live-reader witness.

## 2. Protected source/control vector

| Object | Current blob | Result |
|---|---|---|
| Paper A accepted R1 | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | MATCH |
| Paper B reviewed R1 | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | MATCH |
| `PUBLIC_SITE/PAPERS_FEED.json` | `e3552fdac0f187b066b59a9742563094efffe011` | MATCH |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` | MATCH |
| `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` | `277a94c553e2e17b61bb046a04781b4e44f2229f` | MATCH |
| `PUBLIC_SITE/PRESENTATION_CONTRACT.md` | `b871249564a45278383e41eebd8aaa5d8c64aa3c` | MATCH |
| `PUBLIC_SITE/generated/papers.json` | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` | MATCH |
| `.github/workflows/deploy-conversation-viewer-pages.yml` | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` | MATCH |

The Presentation Gate requires a presentation derivative before ordinary display. The Reader Routing Registry default-denies `WORKSPACES/**` absent an explicit derivative. The Pages workflow is scoped to the Conversation Viewer and Whirligig; it is not a Paper A/B route or deployment witness.

**Disposition:** `DISCOVERY_METADATA / RAW_EXCERPT / READER_ROUTE` remain separate decisions. The source/index mismatch is confirmed; live route behavior is `UNKNOWN / NOT_OBSERVED`. No manuscript, feed, presentation control, site code, PDF, or deployment was changed.

## 3. WH-02 / PR #1710 current-main rebase preflight

Canonical work item: [HsH issue #1702](https://github.com/Satobloc/HsH/issues/1702). Existing proposal: [PR #1710](https://github.com/Satobloc/HsH/pull/1710).

- Current `main`: `3a2b46f9eb9e907ed72f06160aebea24582e0e93`.
- PR head: `a967e908ceab048d219831ec799343643870daf3`.
- Merge base: `7c40096153861e531b4ba234f28b41a2260fba04`.
- GitHub compare: `diverged`, 7 commits ahead / 3,926 behind.
- PR metadata at this read: OPEN / DRAFT / UNMERGED; `mergeable=true`. That field is not acceptance evidence and does not override the diverged comparison.
- All seven PR-touched paths were fetched at current `main`, merge base, and PR head. For all seven, current-main blob equals merge-base blob, while the PR blob differs. This is a **same-path rebase preflight only**, not a guarantee of conflict-free rebase or compatibility with intervening workflow/dependency changes.
- Exact-head GitHub Actions runs: 0. Formal review submissions: 0. Inline review threads: 0. Combined status contains only Vercel `failure` with a build-rate-limit URL; this is not code-test evidence.

### Source-level findings still requiring correction

1. **Root discovery:** current main's repository-remainder scanner still restricts candidates to `.json` and `.txt`; the PR removes that suffix gate and delegates to content sniffing. The coverage change remains necessary.
2. **Title fidelity:** current main strips recognized raw-export suffixes and otherwise preserves titles. The PR additionally strips generic `Path(name).suffix`, truncating extensionless dotted titles such as `H(s)H 2.0`, `SAT-O v1.2`, and `Conversation with Dr. X`. Preserve current-main behavior.
3. **Malformed JSON:** the PR still collapses parse failures into `skipped_not_conversations_or_bad_json`, the same aggregate used for valid non-conversation JSON. Add a distinct malformed-candidate state with path/error evidence; do not classify malformed files as conversations by default.
4. **Warning reachability:** the PR adds `root_dates` to the warning condition, but the step still omits the strict-audit outcome and `always()`. A strict-audit failure can bypass the warning summary.

**Smallest next action:** Calder or an authorized maintainer reconciles the existing seven-path PR against current main, preserves title fidelity, separates malformed-candidate classification, and makes the warning step report the strict-audit outcome under `always()`. Then run exact-head PR CI, the full test suite, navigation acceptance/readback, and independent review. Keep the PR draft and unmerged until those gates pass.

No local HsH checkout was present in the execution container. No branch update, rebase, code write, CI dispatch, review submission, merge, or duplicate PR was attempted.

## 4. Mersearch, queue, and project gates

Mersearch was not available as a callable action in this runtime. The four canonical request records remain `requested`; the 12 expected request-scoped `SEARCH_RECEIPT.md`, `SEARCH_RECEIPT.json`, and `RUN_MANIFEST.json` paths (three per request) returned not found/inaccessible. This is not a Mersearch execution. No request was overwritten, released, or retriggered; no private HSH_RESOURCES payload was opened.

WH-02 remains the highest-priority unblocked PWH item, with Calder/authorized maintainer retaining the code action and Tern retaining control-plane coordination. WH-05 remains blocked by the four occupied Mersearch lanes. No queue priority or owner was changed.

P0 Code Grurple remains ACTIVE. P1 Orson cognition remains OVERDUE / NOT READY and Orson-owned. P2 measured geometry remains HOLD; the November 16 source/data gate is unmet, no measured system is selected, and the November 30 major-paper gate remains separate. P3 full theory remains INCOMPLETE with the December 14 gate separate. FIE rereview is due November 24.

Lane 24 Cycle 08/08 remains complete and BACKSEAT/HOLD; no Cycle 09. No physical calculation, CODATA comparison, fit, prediction, independent measurement, or new Lean build was performed. No SAT-O/Blockwave equation was altered and no BEDROCK theory status was promoted.

## 5. Identity, continuity, and automation boundary

The historical empirical-Calder remit is supported by the 2026-09-12 worker-authored self-report in `WORKSPACES/COMMON/CHECKINS.md` (lines 53–110): adversarial empirical testing, angle-clustering null design, independent-unit discipline, statistical calibration/covariance, and source/provenance separation. It is not a standalone signed Nathan-authored specialist charter. The separate Foundational Covariance / Global Architecture Calder identity was not used.

A bounded prior-thread lookup found only a historical empirical-Calder conversation last active 2026-09-16; its exact title/thread ID and current usability were not established. This is a source-grounded revival, not authenticated historical-thread participation. No new conversation or cross-thread delivery is claimed.

The existing :24 automation was not modified. Its recorded identity remains `6abda4c8eda88191bf23a6f2849e9a17`, with original `DTSTART;TZID=America/New_York:20261001T142400` and `RRULE:FREQ=HOURLY`; no title, prompt, phase, enabled state, or cadence change was attempted. The private automation get/peek action returned `404 Action not found` in this runtime, so a fresh private enabled-state readback is not claimed. No sixth task was created.

**Next exact pickup:** authorized WH-02 maintainer rebase/reconciliation of PR #1710 and subsequent exact-head/full acceptance testing; keep P0 live-route behavior NOT OBSERVED and Lane 24 on HOLD.
