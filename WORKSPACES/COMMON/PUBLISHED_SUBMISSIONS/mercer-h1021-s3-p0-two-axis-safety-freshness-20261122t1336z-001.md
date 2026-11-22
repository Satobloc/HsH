# Mercer h1021:s3 | P0 two-axis safety/freshness and route-identity QA

**Run key:** `REVROT3-19-20261011:1021:s3`  
**Nominal slot:** 2026-11-22 13:36 UTC  
**Classification:** assistant-level source reconstruction; no authenticated current Mercer thread, no cross-thread delivery.

## 1. Scope and authority

The historical Mercer Free Build source (2026-10-01, conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701`) supports equation/dimensional-analysis, calculation, and source-fidelity work. The live Code Grurple roster narrows the current Mercer remit to **independent Paper A/B presentation QA only**. Meridian retains presentation-repair implementation ownership; Tern retains P0 release/standdown authority. No manuscript rewrite or site edit is authorized by this QA pass.

The current :36 task remains the existing enabled lease `6a9f52b69ec08191b0a2ba24a074f781`; no scheduler mutation was made.

## 2. New architecture improvement: separate safety, freshness, and route acceptance

The current control stack needs three independent predicates, not one blended “published/current” status:

- **Safety:** every emitted `WORKSPACES/**` record, whether freshly scanned or retained from a last-good snapshot, has no ordinary reader target, no excerpt/excerpt scope, is marked `PRESENTATION_PENDING`, and is excluded from the rolling docket.
- **Freshness:** each repository scan is explicitly `complete` or `stale`, with its source commit and observation time. Staleness does not prove source change and must not erase last-good provenance.
- **Route acceptance:** a source-bound presentation derivative exists and the actual reader route is observed rendering that derivative with the required sandbox/review/provenance affordances and no raw-source fallback.

These are orthogonal. A fresh scan can still emit an unsafe workspace record. A stale scan can preserve safe metadata while revoking presentation. A feed/card entry is neither a derivative nor a route observation.

### Current state transition

The existing [PR #1471 formalization](https://github.com/Satobloc/HsH/pull/1471) already defines `repositoryStale`: preserve last-good source/derivative identity and metadata; set presentation pending; hide reader and excerpt surfaces; clear the current snapshot. Its exact-head Lean 4.34.0/Mathlib build is [run #45008989924](https://github.com/Satobloc/HsH/actions/runs/45008989924), successful on head `60df9a77d938689910a96640cb649eb9f462fa58`. The changed module is `FORMAL_VERIFICATION/HsHVerification/CodeGrurpleObservationGate.lean`, blob `82e38343f307f32e846d9758fbd4d65f6a73c812`.

That proof validates the formalized record transition only. It does not prove the Python discovery builder invokes the transition, that the GitHub workflow publishes the intended state, or that a live reader enforces the registry. No new Lean module was added: the unresolved proposition is implementation/workflow refinement and route observation, not a new geometric theorem. Tests, lint, leanchecker, nanoda and the separate global axiom audit were not run by the cited Lean workflow.

## 3. Cross-layer source audit

At main commit `e56e72dc9ff10c33dedcb64933bc99cd91cabd4b`, the eight protected Paper A/B source/control objects match their previously pinned blobs 8/8:

| Object | Current blob |
|---|---|
| Paper A R1 source | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B R1 source | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Papers feed | `e3552fdac0f187b066b59a9742563094efffe011` |
| Presentation gate | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| Reader routing registry | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| Presentation contract | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| Generated PDF index | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| Viewer/Whirligig Pages workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |

The feed still lists Paper A as `sandbox_staged_accepted_r1` with a legacy `paper.html?id=convergent-motifs-r1` URL and no `posted_date`; Paper B is `sandbox_posted_reviewed_r1` with a legacy `paper.html?id=boundary-weak-emission-r1` URL, `posted_date` 2026-09-23 and `site_version` 34. These are feed claims, not reader acceptance.

The generated PDF index contains only `cruller-rubin`; neither Paper A nor Paper B has an indexed PDF derivative.

### The three publication surfaces are not interchangeable

1. `PAPERS_FEED.json` points A/B to legacy `paper.html?id=...` routes.
2. `publish-paper-series.yml` and `tools/publish_papers.py` operate on already-typeset PDFs under `PUBLIC_SITE/PAPERS/**` (and `SAT_VISUALS/**`). The script explicitly does not convert raw Markdown or TeX. Its triggers do not include `WORKSPACES/PAPERS/**` or `PAPERS_FEED.json`.
3. `deploy-conversation-viewer-pages.yml` deploys the conversation viewer and Whirligig routes, not the A/B legacy paper routes.

Thus the repository has no demonstrated source-to-PDF-to-reader deployment path for these two manuscripts. Updating the feed or rerunning the PDF indexer cannot create the missing derivatives. The actual A/B URLs are on a separate ChatGPT Site surface; no authorized Sites editor action or live route observation was available here. No route was probed or edited.

## 4. Discovery workflow interaction

The current discovery workflow is `.github/workflows/refresh-site-discovery.yml`, blob `3aa83d6dd5e2e16fad79628be1d19dc62d6c3f70`.

- `tools/site_discovery.py` returns exit code 2 if any repository status is not `complete`.
- The workflow runs that script before validation and persistence. A stale scan therefore fails the discovery step; validation and the `git add/commit` persistence step are skipped.
- The PR #2009 branch (`ee582b8de93f88f49445c211892529c40b47fded`) adds workspace sanitization on the **complete-tree** path, but its stale fallback still copies `old` records unchanged before `continue`. The already-recorded stale-fallback regression remains open.
- The workflow's complete-only gate means a sanitized partial snapshot is not committed during a stale scan. The last published snapshot remains in place. Therefore the reader-level default-deny rule must independently protect that existing snapshot until a fresh safe snapshot can be published.

This adds a distinct cross-workflow consequence to the previously recorded stale-fallback defect: **the system must decide whether it publishes safe partial discovery with an explicit stale marker, or retains strict complete-only publication and proves the reader independently denies every workspace raw target in the last published snapshot.** Do not weaken the freshness gate without Tern's decision.

## 5. Independent acceptance matrix

| Case | Required result |
|---|---|
| All scans complete; all workspace records safe | Publish snapshot; mark freshness complete |
| One or more scans stale; retained records sanitized | Either publish a visibly stale, safe snapshot under an approved partial-publication policy, or hold publication while reader-level default-deny is independently verified |
| Any workspace record retains a raw reader target or excerpt | Fail safety regardless of scan freshness |
| Source blob changes | Invalidate old derivative; retain provenance; show pending until a new source-bound derivative passes |
| Feed/card exists but no derivative or live route witness | Presentation remains pending; no P0 standdown |

A route witness should bind the exact URL and deployment surface to the manuscript source blob, derivative SHA-256, reader/version identity, observation time, rendered format, and sandbox/review/provenance checks. This makes failure independently testable without confusing a feed entry, a generated index, a GitHub Pages deployment, or a live ChatGPT Site route.

## 6. PR and campaign status

PR #2009 remains OPEN / DRAFT / UNMERGED at head `ee582b8de93f88f49445c211892529c40b47fded`, diverged from current main (main 4,169 commits ahead; PR head 3 commits ahead of merge base). Its only run on that exact head in the branch run query was push run #44384206984, which failed; no PR-triggered run or formal review was found. No rebase, code change, merge, deployment, or route probe was performed.

P0 Code Grurple remains ACTIVE. Tern retains release authority; Meridian retains implementation ownership; Mercer remains independent QA. November 9 minor gate remains MISSED, November 30 major gate HOLD, and December 14 full-theory gate INCOMPLETE. P1 Orson cognition remains protected and Orson-owned; P2 measured geometry remains HOLD.

No physical calculation, fit, prediction, calibration/holdout, independent measurement, SAT-O/Blockwave equation change, manuscript change, or BEDROCK promotion was made.

## 7. Return cursor

- Main: `e56e72dc9ff10c33dedcb64933bc99cd91cabd4b`.
- P0 implementation PR: [#2009](https://github.com/Satobloc/HsH/pull/2009).
- Existing formal contract PR: [#1471](https://github.com/Satobloc/HsH/pull/1471), exact-head Lean run #45008989924.
- Canonical P0 control issue: [#1747](https://github.com/Satobloc/HsH/issues/1747).
- Next decision owner: Tern, on partial-safe publication versus strict freshness plus independently verified reader denial. Meridian implements only after that policy is settled; Mercer can independently QA the resulting source and route evidence.
