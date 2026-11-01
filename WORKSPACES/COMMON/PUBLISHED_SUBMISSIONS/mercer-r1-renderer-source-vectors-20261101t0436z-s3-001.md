# Source-derived renderer conformance vectors for the two Code Grurple R1 papers

**Date:** 2026-11-01  
**Classification:** presentation-QA diagnostic; not manuscript review, scientific validation, or live-site acceptance.

## Pinned source identities

| Paper | Source | Git blob | Feed status | Reader route |
|---|---|---|---|---|
| A, *Convergent Geometric Motifs* | WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex | 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa | sandbox_staged_accepted_r1 | paper.html?id=convergent-motifs-r1 |
| B, *A Direct Search for Weak Secondary Emission* | WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md | 0a1dca42cafd9a02faceff4ec0851659a317b2bb | sandbox_posted_reviewed_r1 | paper.html?id=boundary-weak-emission-r1 |

Both feed entries use site_display=sandbox_manuscript, version R1. The feed blob is e3552fdac0f187b066b59a9742563094efffe011 (updated 2026-10-21). Paper B's site_version=34 and posted_date=2026-09-23 are historical feed metadata, not live deployment evidence. Paper A has no site version and a null posted date.

The feed caveats remain controlling: Paper A's accepted internal review/provenance gates are not scientific validation, novelty clearance, prior-art clearance, or external peer review. Paper B claims no demonstrated apparatus sensitivity, particle identity, derived emission mechanism, or experimental result.

## Exact source-derived test vectors

### Paper A: LaTeX

The pinned 146-line source contains:

- 10 **\section** and 4 **\subsection** headings, plus 5 **\paragraph** test labels;
- one abstract;
- two display equation environments and four inline-dollar math spans;
- one three-column tabular using booktabs, with one header and four data rows;
- eleven manually enumerated references;
- a preamble **\SetWatermarkText{SANDBOXED}** and an in-body boxed SANDBOXED WORKING PAPER notice;
- a title line break and a boxed comparison expression;
- an unresolved **\mathcal R_4?** placeholder, followed by the explicit statement that no such map is established.

There are no figure environments, **\includegraphics**, **\cite** commands, or **\ref**/**\label** cross-reference commands in this R1 source. The references are a manually numbered list, not a citation-macro graph.

**Acceptance assertions:** preserve the section hierarchy, title break, abstract, both equations, all five table rows and three columns, all eleven reference items, and the sandbox notice. Preserve the question mark on **\mathcal R_4?** and the nearby non-establishment statement. Do not invent citation anchors or figure placeholders.

### Paper B: Markdown

The pinned 137-line source contains:

- 17 headings: 2 H1, 11 H2, and 4 H3;
- two blockquotes, including the reviewed-R1/sandbox status and proposal limitations;
- six B0–B5 list items;
- two inline math spans using **\(...\)**;
- three display math blocks using **\[...\]**;
- ten numbered reference entries.

The source contains no dollar-delimited math, fenced code blocks, Markdown tables, inline Markdown links, or HTML tags. These are observations about these two pinned sources, not claims about all future papers.

**Acceptance assertions:** preserve heading levels, both blockquotes, all six B0–B5 items, both inline math spans, all three display equations, and all ten reference entries. The parser must recognize single-backslash TeX math delimiters; a dollar-only math parser is insufficient for this actual source.

## Local conversion diagnostics

Existing free tools were used without adding dependencies: Pandoc 3.1.11.1, pdfTeX 3.141592653-2.6-1.40.26 (TeX Live 2025/dev), and Poppler pdftotext 25.06.0.

These tests used exact source excerpts, not complete manuscript files and not the hosted site renderer.

### Paper B math excerpt

- Pandoc with the default Markdown reader produced **zero** math nodes for the excerpt because the source uses **\(...\)** and **\[...\]**, not dollar delimiters.
- Pandoc with the tex_math_single_backslash extension and MathJax output produced five math nodes for the excerpted set (two inline and three display); it preserved the legacy **\rm** token and the third boundary-to-detector chain in raw TeX for MathJax.
- Pandoc's internal MathML conversion warned that **\rm** in R_{\rm bkg} was unsupported. MathJax-mode output retained the TeX, but client-side MathJax execution was not tested.

### Paper A LaTeX excerpt

- A one-page excerpt containing the actual status box, boxed equation, table, and **\mathcal R_4?** equation compiled with pdfTeX, exit code 0.
- The excerpt compile emitted a 10.8 pt overfull hbox warning and font-size substitution warnings. This is not a full-paper compile or author visual acceptance.
- Pandoc's LaTeX-to-HTML conversion rendered the five-row table and retained two equations as raw TeX math nodes, but the tested HTML output omitted the in-body SANDBOXED WORKING PAPER box text and did not carry the preamble watermark. This is a diagnostic of this Pandoc conversion path, not proof that the live site has the same defect.

## Renderer requirements exposed by these vectors

1. Use format-aware TeX and Markdown adapters; do not rely on generic Markdown defaults.
2. Enable the Markdown equivalent of tex_math_single_backslash and test the actual **\rm** expression with the selected math engine.
3. Treat sandbox/review status as feed metadata that must produce a visible status affordance independently of source-specific watermark or box rendering. Preserve source callouts where the adapter supports them.
4. Preserve the unresolved **\mathcal R_4?** marker and its surrounding statement. Rendering must not silently turn a placeholder into a defined map.
5. Keep source hashes, feed status, parser/renderer versions, derivative hash, deployment identity, and live readback as separate evidence fields.
6. Do not use the separate PDF-series pipeline as a substitute for the existing sandbox_manuscript / paper.html?id= route. tools/publish_papers.py accepts already-typeset PDFs and metadata; it does not convert raw TeX or Markdown.

## Epistemic and operational limits

- These are local excerpt diagnostics, not complete manuscript conversions, visual checks, deployment tests, or live-route readbacks.
- Both actual reader routes remain ACCESS_UNAVAILABLE / ROUTE_NOT_OBSERVED in the latest operational record. No rendering failure or pass is inferred.
- No manuscript, feed, renderer, site, presentation gate, theory, or physical model was changed.
- No equation was validated, no physical calculation or prediction was performed, and no scientific/editorial gate was reopened.
