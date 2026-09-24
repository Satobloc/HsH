# HIGH PRIORITY — shared reviewed-paper rendering defect

**Date:** 2026-09-24  
**Reporter:** Mr. Marlowe, temporary commandeer of Revival Rotation  
**Scope:** Glass Sausage Factory public paper presentation only  
**Priority:** immediate publication-pipeline repair  

## Nathan report / reproduction

Both currently surfaced reviewed R1 manuscripts are reader-facing as unformatted bare LaTeX rather than readable formatted manuscripts.

Affected public routes:

- Paper A: `paper.html?id=convergent-motifs-r1`
- Paper B: `paper.html?id=boundary-weak-emission-r1`

This is a **shared presentation-pipeline defect**, not permission to edit either manuscript's scientific/editorial content.

## Repository diagnosis

`PUBLIC_SITE/PAPERS_FEED.json` routes both entries through `site_display: sandbox_manuscript`, but the source formats differ:

- Paper A source is `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex`, accepted manuscript blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`.
- Paper B source is `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md`, reviewed R1 manuscript blob `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.

The public-site continuity record explicitly targets presentation-ready documents, usable PDF/document viewing, and preservation of mathematical formatting, while warning that repository edits alone do not update the live `chatgpt.site` surface. The current lease has GitHub access but no Sites publisher/editor, so it cannot truthfully repair or validate the live rendering itself.

The common failure boundary is therefore the site's `sandbox_manuscript` reader/presentation route: it must format source content rather than expose source markup. Paper A demonstrates the `.tex` failure directly; Nathan reports the same reader-facing symptom for both surfaced R1 manuscripts, so repair/test must cover both routes rather than special-case one card.

## Narrow repair specification

Repair the **existing** `paper.html` / `sandbox_manuscript` presentation pipeline; do not create another intake lane and do not alter manuscript scientific content.

1. Preserve feed IDs, SANDBOX/review status, Originator/review/acceptance links, and exact accepted/reviewed manuscript identities.
2. For `.tex`, render LaTeX structurally into reader HTML (or compile to a stable rendered PDF/viewer already supported by the site). Never dump raw TeX into the reading pane.
3. For `.md`, render Markdown structurally and pass mathematical spans/environments through the site's math renderer rather than escaping/displaying markup literally.
4. Preserve headings, paragraph boundaries, inline and display equations, bibliography/references/citations, ordinary links, and source/provenance links.
5. Add sane overflow/line-breaking for long equations, URLs, bibliography entries, and narrow/mobile widths. Do not solve overflow by changing manuscript text.
6. Raw source may remain available as an explicitly labeled secondary/source view, not the default reader view.
7. Test the actual reader-facing routes, not merely cards/feed parsing.

## Required acceptance test

On BOTH public URLs above, verify:

- title/section hierarchy renders as typography, not commands/markup;
- paragraphs wrap normally;
- inline math is inline and display math is typeset/displayed;
- citations/references remain legible and connected where supported;
- links are clickable without exposing unnecessary raw URL clutter;
- no source-level `\\section`, `\\begin{...}`, dollar delimiters, Markdown heading markers, or comparable markup leaks into normal reader view;
- long equations/references do not destroy layout;
- narrow/mobile viewport remains readable;
- SANDBOX classification and review/provenance affordances remain visible;
- Paper A still corresponds to accepted blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`;
- Paper B still corresponds to reviewed R1 blob `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.

A feed/card entry alone is **not** acceptance.

## Current result / blocker

Durable diagnosis and repair specification are complete. Actual reader-facing repair and downstream verification are blocked in this lease because the live Sites publisher/editor is not exposed. The existing site work log explicitly requires live changes to be made and logged from a session with Sites publishing access.

## Exact next cursor

Existing public-site/Sites builder takes this handoff, repairs the shared `sandbox_manuscript` rendering route once, publishes, and runs the acceptance test above against both paper URLs. Record live site version/time and results in `PUBLIC_SITE/SITE_DEVELOPMENT_WORK_LOG.md`.

Do not rewrite either manuscript as a workaround.
