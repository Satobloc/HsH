# Meridian h964:s2 | Code Grurple Paper A presentation and PR #2009 rebase preflight

**Nominal slot:** 2026-11-20T04:24:00Z
**Run key:** REVROT3-19-20261011:964:s2
**Selected ring label:** Meridian (index 15)
**Next ring label:** Mercer (index 16)
**Disposition:** P0_ACTIVE / PAPER_A_SOURCE_PIN_EXACT / PR2009_PATHS_UNCHANGED_SINCE_MERGE_BASE / REBASE_NOT_PERFORMED / PRESENTATION_PENDING / LIVE_ROUTE_NOT_OBSERVED

## 1. Authority and current assignment

The historical Meridian source is conversation 6a9aa91b-11f4-83ea-80a1-4d502522e441, raw export blob d21e251df093013903cc19789ded562f83b6e6ea. The selected direct user-role messages were freshly parsed from that blob. They establish a solver/representation remit involving graticule symmetry and parity, configurable solver inputs/couplings, and preservation of multiple admissible answers under a least-wild preference. The assistant-authored title "Geometric Formalization & Representation Lead" is not Nathan Direct; no standalone signed specialist charter was recovered.

The live Code Grurple roster and Meridian BOOT narrow the current assignment to Paper A accepted-R1 presentation support while the P0 interlock remains active. This overrides ordinary Lane 24/H(s)H-CODATA research for this activation. It does not authorize manuscript-content changes, route edits, deployment, or release decisions.

No authenticated current historical Meridian ChatGPT thread was established. The scheduled task's conversation association is not treated as the historical worker thread. This is assistant-level, source-grounded work, not authenticated historical-instance participation.

## 2. Current main and PR #2009

HsH main was identified as 19220dcfecf41b6f8ba55769cdbb218eb3e096d2 and independently compared with the main ref; the comparison was identical.

P0 issue [#1747](https://github.com/Satobloc/HsH/issues/1747) remains OPEN. The latest published control-plane replay is [Tern h963:s4, issue #2158](https://github.com/Satobloc/HsH/issues/2158), which already records the source-level discovery/reader-policy mismatch and distinguishes it from unobserved live rendering.

The existing [PR #2009](https://github.com/Satobloc/HsH/pull/2009) is still open and unmerged. Its inspected head is ee582b8de93f88f49445c211892529c40b47fded; merge base is d47be7cfacfa182aedaad17a9e0841eb80fdfddb. A fresh comparison against current main gives:

- main ahead of PR head: **1,590 commits**;
- PR head ahead of main: **3 commits**;
- exact-head PR-triggered Actions lookup: **0 runs returned**.

The PR changes exactly three files:

1. tools/site_discovery.py
2. tests/test_site_discovery.py
3. PUBLIC_SITE/AUTOMATIC_DISCOVERY.md

A fresh blob comparison shows that each of those three files is identical between the current main and the PR's merge base, while each differs on the PR head:

| Path | Current main = merge base blob | PR-head blob |
|---|---|---|
| tools/site_discovery.py | 97ff9c6d00544251c05bd6bb6053907805438f3e | c648a5666ddf87c3ab0ad6607f0762796bc7f160 |
| tests/test_site_discovery.py | 4d646dba614f50b912391c13cd516616700d2ac3 | e7ca2989115e44aab570f6baefa73e2882bc3caa |
| PUBLIC_SITE/AUTOMATIC_DISCOVERY.md | 36b2669c328466f0f579e188fbec5796d6ca44dc | 3e80e4fa05706d0182dd0cd887716f3e28cfc4cf |

**Bounded conclusion:** no same-path main-branch edits have accumulated against the PR's three changed files since the recorded merge base. This makes a clean rebase plausible for those paths. It does not prove a full rebase will succeed, validate dependencies or integration behavior, establish current mergeability, or authorize anyone to rebase. No rebase, branch write, CI dispatch, review, merge, or deployment was performed.

The current main collector still assigns a generic reader.html?mode=browse target to every eligible document record, including eligible WORKSPACES/** paths; the current test also permits a representative workspace Markdown file. The PR patch is a default-deny containment change: workspace records remain metadata-discoverable, but receive no default reader target or excerpt, are marked PRESENTATION_PENDING, and are removed from the rolling docket. It does **not** compile or supply a Paper A PDF, update the legacy paper.html?id=... route, or complete the presentation gate.

## 3. Paper A source and presentation crosswalk

The accepted R1 source was freshly fetched at:

WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex

Its Git blob is exactly 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa, matching the accepted source pin in the live roster and feed. The source itself carries a SANDBOXED watermark and identifies itself as an R1 working draft dated September 23, 2026.

The current PUBLIC_SITE/PAPERS_FEED.json entry remains:

- ID: convergent-motifs-r1;
- status: sandbox_staged_accepted_r1;
- display: sandbox_manuscript;
- posted_date: null;
- legacy route ID: paper.html?id=convergent-motifs-r1.

The separate generated PDF-series index contains only cruller-rubin; it contains no Paper A derivative. The two route namespaces are not interchangeable:

- legacy Code Grurple route: paper.html?id=convergent-motifs-r1;
- separate PDF-series route: reader.html?paper=....

The current Presentation Gate and Reader Routing Registry require a provenance-bound, audience-calibrated presentation derivative, with compiled PDF as the preferred reading surface. Raw TeX is not an ordinary reader fallback.

The existing publish-paper-series.yml workflow validates already-typeset PDFs under PUBLIC_SITE/PAPERS/** and SAT_VISUALS/**; it does not compile the Paper A TeX source. The existing GitHub Pages workflow deploys the Conversation Viewer and Whirligig, not the legacy A/B paper routes or the PDF-series feed. No current Sites editor/deployer or authenticated originating browser context was available. No live route probe was performed.

**Paper A remains PRESENTATION_PENDING / LIVE_ROUTE_NOT_OBSERVED, not PASS and not a confirmed live failure.** PR #2009 can close the raw-discovery exposure path if integrated, but it is not the Paper A presentation derivative or route repair.

## 4. Tooling and execution limits

The local runtime has pdflatex, lualatex, xelatex, latexmk, and pandoc, but no HsH checkout. Direct network retrieval from the container was unavailable, and no local source materialization or PDF build was attempted. The GitHub connector source read is not a compiled-PDF result.

Mersearch has no callable action in this runtime. The four existing request lanes remain requested; all twelve expected request-scoped manifest/receipt paths returned 404 in the bounded readback. No lane was overwritten, retriggered, or released. This P0 source/branch check did not require an archive search, so no Mersearch request was submitted.

No new tool, dependency, fork, subscription, expense, or repository branch was introduced.

## 5. Project and epistemic disposition

- P0 Code Grurple: **ACTIVE**.
- P1 November 9 cognition paper: **OVERDUE / NOT READY / ORSON-OWNED**.
- P2 November 30 measured-system paper: **HOLD**.
- P3 December 14 full-theory paper: **INCOMPLETE**.
- FIE next review: November 24; not yet due.
- Task graph: 16 declared branches / 18 records; discrepancy unchanged.

No Lean theorem/build was needed for this Git-object identity and workflow-state audit. No physical system or measured dataset was selected; no CODATA comparison, physical calculation, fit, prediction, independent measurement, or H(s)H validation was performed. No SAT-O/Blockwave equation was changed and no BEDROCK theory was promoted.

## 6. Next authorized action

The useful next action is for the authorized P0 maintainer to consider rebasing PR #2009 onto current main, then run exact-head CI and independent review. That would only establish the default-deny discovery containment. A separate site-capable presentation workflow must still produce and visually verify the Paper A derivative, register the correct source/deployment identity, and read back the existing legacy route before P0 can stand down.

Tern retains Comptroller/release authority. Meridian did not take over the rebase or site deployment.
