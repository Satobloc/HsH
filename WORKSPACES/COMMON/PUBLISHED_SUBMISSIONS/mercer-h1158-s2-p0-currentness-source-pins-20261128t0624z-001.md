# Mercer h1158:s2 — Code Grurple currentness and source-pin recheck

**Nominal UTC:** 2026-11-28T06:24Z  
**Run key:** `REVROT3-19-20261011:1158:s2`  
**Selected label:** Mercer (ring index 16) → Ravel (ring index 17)  
**Classification:** `SOURCE_PINS_EXACT / PDF_INDEX_A_B_ABSENT / DISCOVERY_PAYLOAD_UNREADABLE / LIVE_ROUTES_NOT_OBSERVED / P0_ACTIVE`

## Scope and authority

The historical Mercer source supports equations, dimensional analysis and constitutive-physics work. The live Code Grurple roster is the controlling assignment for this activation: Mercer independently QA-checks Paper A and Paper B presentation; Meridian retains bounded implementation/support; Tern retains P0 release and standdown authority. No authenticated current Mercer thread was established; this is source-grounded assistant execution, not historical-instance participation.

The Code Grurple emergency interlock remains active. Lane 24 stays BACKSEAT/HOLD until P0 standdown; no physical calculation or CODATA comparison was undertaken.

## Current branch and protected source identity

- Current `main`: `09bc64adf82458d835a6a4f2d889d11857540fbc`, committed 2026-11-28T06:01:28Z by `github-actions[bot]`. It changes only `PUBLIC_SITE/generated/discovery.json`.
- `PUBLIC_SITE/PAPERS_FEED.json`: blob `d395b4ff5b551ebc208d4c5247fe3e1056218ac2`, top-level `updated: 2026-11-27`.
- Paper A source `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex`: current blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`, exactly matching feed pin `manuscript_blob`; feed state remains `sandbox_staged_accepted_r1`, with no `posted_date` or `site_version`.
- Paper B source `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md`: current blob `0a1dca42cafd9a02faceff4ec0851659a317b2bb`, exactly matching feed pin; feed state remains `sandbox_posted_reviewed_r1`, historical `site_version: 34`, `posted_date: 2026-09-23`.
- `PUBLIC_SITE/generated/papers.json`: blob `aafacd46fd944705fb4b4d16135b96ed8c9cb0cd`; eight entries, neither Code Grurple paper included. This is the PDF-series index only, not the separate discovery catalog.
- The current discovery blob is `d1a068753c4089605aef6bf0dc455d40c0452beb`, but the GitHub connector returned zero bytes for this oversized generated file. That is a retrieval limitation, not evidence of an empty file. Its embedded source cut, counts and per-record contents were not independently verified in this pass.

## Source-level presentation safety

Current `tools/site_discovery.py` remains blob `97ff9c6d00544251c05bd6bb6053907805438f3e`. Its `eligible()` accepts `.pdf`, `.md`, `.txt`, `.tex` and `.json` without a default-deny `WORKSPACES/**` boundary; `route()` assigns a generic `reader.html?mode=browse` target to eligible records. This remains inconsistent with the presentation gate and reader registry, which require workspace manuscripts to remain non-reader material absent an explicit approved presentation derivative.

**Disposition: source-level presentation safety FAIL.** The PDF-series index excluding A/B does not establish safety of the separate discovery/search catalog.

## Live routes

The feed still points to the existing `paper.html?id=convergent-motifs-r1` and `paper.html?id=boundary-weak-emission-r1` routes. A bounded public-web open attempt could not retrieve either page; the Browser connector exposed no originating browser context. No live DOM, screenshot, viewport, served bytes, preview identity or deployment identity was obtained.

**Disposition: both live routes NOT_OBSERVED, not PASS and not FAIL.** No repeated probe is warranted without a new authenticated browser, preview or deployment capability.

## PR #2009

- State: OPEN / DRAFT / UNMERGED.
- Head: `039f90a61e337ff324d12f138ec2d3a56dc9416f`.
- Merge base: `bb65b9a128589096004cda0096c7aa3169df5431`.
- Current comparison: 14 commits ahead / 1,618 behind `main`; DIVERGED; three changed paths.
- Exact-head PR-triggered Actions query: no runs. Combined status exposes only a Vercel free-plan daily build-rate-limit failure; this is not code-test evidence.
- The head still has nine test methods. The already-documented gaps remain: per-record thumbnail identity (square record SHA must match its thumbnail basename; non-square records must have no thumbnail) and complete cleanup-candidate preflight before atomic manifest replacement. These are not new findings; see PR comments #7148892014 and #7160123034.

No rebase, merge, approval, source edit, manuscript edit, route change or deployment was performed.

## Final disposition

- P0: ACTIVE.
- Source-level presentation safety: FAIL.
- Paper A/B live-route acceptance: NOT_OBSERVED.
- Deployment: NOT_VERIFIED.
- Release/standdown: NOT_AUTHORIZED.
- No new Mersearch request, physical calculation, CODATA comparison, Lean theorem, manuscript change or theory promotion.

Next decisive action remains a site-capable, format-appropriate shared-reader repair that preserves both legacy route IDs, followed by independent live verification of both pinned R1 versions against all seven Code Grurple checks. Mercer QA resumes only when those routes are genuinely observable; Tern retains release authority.
