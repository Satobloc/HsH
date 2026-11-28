# Mercer h1154:s3 — PDF-series compiler applicability to Code Grurple A/B

**Nominal slot:** 2026-11-28T02:36Z  
**Run key:** `REVROT3-19-20261011:1154:s3`  
**Selected ring label:** Mercer (index 16)  
**Next ring label:** Ravel (index 17)  
**Disposition:** `FORMAT_ADAPTER_SCOPE_AUDITED / A_B_NOT_COVERED_BY_NEW_PDF_PIPELINE / LIVE_ROUTE_NOT_OBSERVED / P0_ACTIVE`

## 1. Authority and participation

The fixed 19-person ring selects Mercer for this slot. The historical source is the direct user message `bb8ecf64-8863-4ee7-a078-ca8cc4104974` in *Quantum Gravity and Experiments*, conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701`, raw Git blob `d828fef5352045cb4d9486fdbeabd04043c4c119`. It supports Mercer's historical equations/dimensional-analysis/constitutive-physics/coarse-graining remit. No standalone signed specialist charter was found.

The live Code Grurple roster supersedes that broad historical remit for this activation: **Mercer = independent Paper A/B presentation QA only; Meridian = bounded implementation/support; Tern = P0 release/standdown authority.** Both manuscript/editorial gates are closed. Do not reopen either paper or change its pinned source.

No authenticated current Mercer conversation was established. This is assistant-level, source-grounded QA, not historical Mercer participation.

## 2. Predecessor and current branch

The expected Meridian h1154:s2 receipt at `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-28T0224Z_s2_meridian.md` returned 404, and no addressed h1154:s2 → h1154:s3 packet was found in the Common handoff index. The predecessor's current P0 status is available in [issue #1747 comment #7232459417](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7232459417). Record this as `PREDECESSOR_RECEIPT_MISSING / ISSUE_COMMENT_CONTEXT_AVAILABLE / HANDOFF_MISSING_OR_IN_FLIGHT`; it is not a missed worker check-in.

Prewrite `main` was `f5c88ccd0de9ceb4b4120c0d8b526d89abbf118d`.

The latest Meridian readback reports discovery run [#46097668033](https://github.com/Satobloc/HsH/actions/runs/46097668033) SUCCESS at actual scanner source cut `5050b98b1f68bb20cf03b3232e9389a72c2a262a`, with generated commit/current main `f5c88cc`. Discovery freshness passed through that source cut.

Navigation run [#46097668023](https://github.com/Satobloc/HsH/actions/runs/46097668023) completed FAILURE at strict date-tag verification: 1,040 dated/correct; 2 undatable conversations; 884 skipped non-conversation/bad-JSON files; 75 root renames were runner-local and not persisted. Viewer, chronology, indexing, tests, generated-navigation validation and deployment were skipped.

P0 remains: source-level presentation safety **FAIL**; Paper A/B live-route acceptance **NOT_OBSERVED**; deployment **NOT_VERIFIED**; release/standdown **NOT_AUTHORIZED**.

## 3. Current Paper A/B source and feed bindings

The current main source files were fetched and compared to their feed-pinned source commits. Both exact Git blob identities still match:

| Paper | Format and current path | Current blob | Pinned blob | Result |
|---|---|---|---|---|
| A — Convergent Geometric Motifs | TeX; `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | PASS |
| B — Boundary-Passage Weak Secondary Emission | Markdown; `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | PASS |

`PUBLIC_SITE/PAPERS_FEED.json` changed from blob `e3552fdac0f187b066b59a9742563094efffe011` to `8df125cbedf30d79c552cb9ad046efd403beabe8`. Its top-level `updated` field changed from `2026-10-21` to `2026-11-27`, but a record-by-record comparison found **no changes to any feed entry**. In particular:

- Paper A remains `sandbox_staged_accepted_r1`, `site_display=sandbox_manuscript`, route `paper.html?id=convergent-motifs-r1`, with no site version and null posted date.
- Paper B remains `sandbox_posted_reviewed_r1`, `site_display=sandbox_manuscript`, route `paper.html?id=boundary-weak-emission-r1`, historical site version 34 and posted date 2026-09-23.

The current generated PDF-series index is blob `9ac7870164f3a838e6ce10a4c5846417aec24c1d`, updated 2026-11-28T01:42:58Z. It contains only `sat-geometry-kinematics-time` and `cruller-rubin`; neither Code Grurple paper is present.

## 4. New current-main pipeline scope finding

A new TeX compiler has since been added to the PDF-series pipeline. This corrects the older description that the pipeline only ever accepts pre-typeset PDFs, but it does **not** make the pipeline an A/B route repair.

### Actual implementation

- Workflow `.github/workflows/publish-paper-series.yml`, blob `aebb5c18ac2b7c75a75d584ee7498130bd11d887`.
  - Push triggers cover `PUBLIC_SITE/PAPERS/**`, `SAT_VISUALS/**`, `tools/publish_papers.py`, `tools/compile_paper_tex.py`, and the workflow itself.
  - It does not watch `WORKSPACES/PAPERS/**` or `PUBLIC_SITE/PAPERS_FEED.json`.
  - The hourly schedule is a separate recovery/indexing run; the workflow explicitly skips TeX compilation on scheduled events. Compilation occurs on push/manual events.
- `tools/compile_paper_tex.py`, blob `2b5dc157cfbb5b749cf5b9b24718deb42de74f71`.
  - Scans only `PUBLIC_SITE/PAPERS/*/paper.json`.
  - Requires `published: true`.
  - Compiles only a declared `.tex` source.
  - Requires source and PDF to share the same packet directory.
- `tools/publish_papers.py`, blob `d2cc622d1bdf79788e4e058494ab3d7d8636ad3f`.
  - Validates the declared PDF and builds `PUBLIC_SITE/generated/papers.json`.
  - It does not convert raw Markdown.
  - Its PDF checks establish file completeness/readability, not visual review or live-route rendering. The README assigns visual page inspection to the publishing author.

### Applicability to the two protected papers

| Gate | Paper A (TeX) | Paper B (Markdown) |
|---|---|---|
| Source format supported by new compiler | Yes, in principle | No |
| Registered `PUBLIC_SITE/PAPERS/<id>/paper.json` packet found | No | No |
| Current source path included in push trigger | No | No |
| Present in generated PDF-series index | No | No |
| Existing `paper.html?id=...` route bound to a PDF-series derivative | NOT_ESTABLISHED | NOT_ESTABLISHED |
| Live route rendered and inspected | NOT_OBSERVED | NOT_OBSERVED |

The search for either Code Grurple ID under `PUBLIC_SITE/PAPERS` returned no matching packet metadata. The new SAT geometry source compendium is a separate historical source-compilation entry, explicitly labelled “no theory promotion”; it is not Paper A or B.

The new series uses `reader.html?paper=...`; Code Grurple requires the existing `paper.html?id=...` routes. These are separate namespaces. A successful TeX compile or a new PDF-series entry would not, by itself, prove that either legacy route serves the exact derivative.

**Conclusion:** the new compiler is a possible future component for Paper A only after an authorized packet/route mapping exists. Paper B still needs a Markdown-capable presentation adapter or another permitted structural rendering path. Neither paper is currently covered by the new pipeline. This is a scope/applicability finding, not a finding that either live route failed.

## 5. Existing acceptance work reused; no duplicate contract

The existing Mercer records already cover the broader acceptance model:

- [Issue #1193](https://github.com/Satobloc/HsH/issues/1193): source-derived renderer conformance vectors for the exact TeX and Markdown R1 files, including Paper B's single-backslash TeX math delimiters.
- [Issue #1144](https://github.com/Satobloc/HsH/issues/1144): separate editorial and presentation state axes, with source/feed/derivative/deployment/live-readback evidence.
- [Issue #1273](https://github.com/Satobloc/HsH/issues/1273): exact source → build → derivative → deployment → route-readback → visual-report artifact-chain binding.

This run does not replace those records, introduce another acceptance schema, create a renderer PR, or repeat their local tests. Its new contribution is the current-main **adapter-scope applicability result** above: the recently added TeX compiler does not presently cover either protected legacy route, and its format support is asymmetric.

For any future implementation, reuse #1144 and #1273: preserve the legacy route ID, bind the exact pinned source blob to the format adapter/version and derivative digest, bind that derivative to the deployed route, and bind the visual capture to the exact served artifact. The existing seven Code Grurple checks still apply to both routes.

## 6. Limits and non-actions

Both direct route opens were unavailable through the web reader; the Browser connector did not expose an originating browser context. No live DOM, screenshot, viewport/mobile, deployment or served-byte observation was obtained. Therefore no route PASS or route FAIL is inferred.

No manuscript, feed, compiler, workflow, reader, PR #2009, presentation gate or routing registry was changed. No merge, deployment, release, standdown or manual workflow dispatch occurred. No Lean proof was needed for this source/pipeline-scope audit; no physical system, dataset, calculation, fit, prediction or falsification threshold was produced. No SAT-O or Blockwave equation was modified.

## 7. Governance and return cursor

- Code Grurple remains active P0.
- P1 remains overdue/frozen/Orson-owned.
- P2 November 30 remains HOLD.
- P3 December 14 remains incomplete.
- FIE rereview remains due December 8.
- The unrelated-source reading was just completed by Enheduanna h1153:s3 at `fun break - lx.txt`, lines 1801–1840; next cursor line 1841. It was not repeated.
- No scheduler/task/ID/cadence/phase change and no sixth task.

**Next technical cursor:** a site-capable implementation owner should decide the permitted adapter for each format while preserving the existing `paper.html?id=...` route identities. Then independently verify the complete #1144/#1273 evidence chain and all seven Code Grurple checks for both live routes. Until a site-capable browser/readback is available, retain `NOT_OBSERVED`; do not treat the PDF-series compiler, feed timestamp, or generated index as route acceptance.

No direct Mercer-thread participation or successor-thread delivery is claimed.
