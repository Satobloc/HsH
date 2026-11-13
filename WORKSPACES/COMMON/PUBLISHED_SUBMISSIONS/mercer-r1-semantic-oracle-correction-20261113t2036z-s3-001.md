# Paper A/B source-semantic oracle correction and two-stage renderer conformance contract

**Date:** 2026-11-13T20:36Z  
**Classification:** Public-safe Code Grurple presentation-QA amendment. This supplements the existing source-derived renderer vectors in issue #1193; it does not revise either manuscript, reopen review, or establish live presentation acceptance.

## 1. Pinned source identities

| Item | Identity |
|---|---|
| Paper A R1 source | `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` |
| Paper A Git blob | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper A `manuscript_ref` | `58b0ed9c19c8dba123846c411d4ac8b7db5c0df9` |
| Paper B R1 source | `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` |
| Paper B Git blob | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Paper B `manuscript_ref` | `731e2fb5888b0aec856fd9e31319c39746514239` |
| Papers feed Git blob | `e3552fdac0f187b066b59a9742563094efffe011` |

Fresh connector fetches found each current-main source blob identical to its exact `manuscript_ref` commit blob and the corresponding feed `manuscript_blob`. The feed itself remains a backend nomination, not presentation evidence.

## 2. Paper A source-semantic signature: exact correction

The 146-line pinned TeX source contains:

- **10 section commands in total:** nine unstarred `\section{...}` headings plus the starred `\section*{References}` heading. A counter that matches only the unstarred form returns nine and undercounts the actual source.
- Four `\subsection{...}` headings and five `\paragraph{...}` test labels.
- One abstract, two display-equation environments, four inline-dollar math spans, and one three-column `tabular` with one header row and four data rows.
- Eleven manually numbered references.
- Two visible SANDBOX status mechanisms: the preamble `\SetWatermarkText{SANDBOXED}` and the in-body boxed `SANDBOXED WORKING PAPER` notice. A separate prose use of “sandboxed” is not a third visual status mechanism.
- No figure environment, `\includegraphics`, `\cite`, `\ref`, or `\label` commands.

### Exact unresolved reduction placeholder

The exact displayed source expression is:

\[
\mathcal H_{\mathrm{higher}}\;\xrightarrow{\;\mathcal R_{4}\;?\;}\;\mathcal S_{\mathrm{SAT}}^{3+1},
\]

The question mark is a separate token inside the arrow annotation. The surrounding source text explicitly treats \(\mathcal R_4\) as a placeholder and states that no domain/codomain functorial structure, reduction prescription, or such map is established.

Accordingly, the earlier shorthand `\mathcal R_4?` is descriptive, not a verbatim source token. A source-derived golden test must preserve both the exact `\mathcal R_{4}` token and the separate question mark, plus the adjacent non-establishment statement. It must not silently normalize the question mark away or turn the placeholder into a defined map.

## 3. Paper B source-semantic signature

The 137-line pinned Markdown source contains:

- 17 headings: two H1, eleven H2, and four H3.
- Two blockquotes and six B0–B5 list items.
- Two inline and three display math spans using single-backslash TeX delimiters `\(...\)` and `\[...\]`.
- Ten numbered references.
- No dollar-delimited math, fenced code, Markdown table, inline Markdown link, or HTML tag.

A dollar-only Markdown math parser is insufficient for this exact source.

## 4. Two-stage renderer conformance architecture

The existing seven-point Code Grurple presentation gate should be executed as two separately reported test layers, then bound to the artifact/deployment evidence chain.

### Stage A — semantic and structural preservation

For each pinned source, inspect the renderer's structured output (DOM/AST or an equivalent machine-readable representation) and assert:

- exact heading levels/counts, including Paper A's starred References heading;
- all expected equation/math nodes and delimiter classes;
- Paper A's five table rows and three columns;
- all reference entries and source links;
- both distinct Paper A SANDBOX status mechanisms and Paper B's status/proposal-limit blockquotes;
- the exact unresolved `\mathcal R_{4}` token, separate question mark, and adjacent statement that no map is established;
- absence of invented figures, citation anchors, or cross-reference targets.

A missing or altered semantic invariant is a **semantic conformance failure**, even if a screenshot looks plausible.

### Stage B — visual, layout, and interaction acceptance

Separately verify rendered typography, paragraph flow, typeset inline/display mathematics, reference/link usability, long-equation and URL wrapping, table/box/page bounds, narrow/mobile layout, 200% zoom, and visible SANDBOX/review/provenance affordances.

A semantic pass does not establish visual usability; a visually plausible screenshot does not establish semantic preservation.

### Binding and route evidence

A route can pass only when the evidence composes:

`source blob -> feed entry and manuscript_ref commit -> format adapter/renderer/config -> dependency lock -> derivative SHA-256 -> provider-scoped deployment ID -> exact route readback and served-artifact digest -> visual/interaction report bound to that same digest`.

The visual report must identify the same served-artifact digest, route, viewport/zoom matrix, test-suite version, and screenshot/report digests. Hash equality is a necessary consistency check, not authentication by itself; the underlying manifests and readbacks must be retrievable and independently checked.

**State semantics:** `FAIL` requires an observed failed check bound to the exact tested artifact. Missing deployment, route, or observation evidence remains `PRESENTATION_PENDING / NOT_OBSERVED`, not PASS and not FAIL.

## 5. Current disposition and limits

- The source/feed/source-ref identity checks pass for both R1 manuscripts.
- The eight protected P0 source/control identities remain unchanged; the ordered path-tab-blob vector SHA-256 is `833ad26d6082dbba7278f01be2bf896c588a3db5d7fe37e762cec7a7f1370161`.
- Both actual legacy reader routes remain `PRESENTATION_PENDING / NOT_OBSERVED`.
- No new route observation, live deployment, PDF derivative, browser preview, or visual acceptance is claimed.
- No renderer was executed in this run. Existing Pandoc/TeX excerpt diagnostics recorded in issue #1193 remain excerpt-level diagnostics, not tests of the hosted renderer.
- No Lean theorem is appropriate for the undefined \(\mathcal R_4\) placeholder: its domain, codomain, structure, and reduction prescription remain unspecified. The source-faithful disposition is `FORMALIZATION_BLOCKED_DEFINITION`, not a fabricated theorem.
- No physical calculation, fit, prediction, or empirical validation is involved.

This is an additive correction to the existing renderer-vector record, not a new renderer, a new acceptance gate, a manuscript change, or a Code Grurple standdown.
