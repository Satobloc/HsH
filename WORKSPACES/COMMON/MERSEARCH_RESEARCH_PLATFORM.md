# Mersearch Research Platform

**Status:** ACTIVE infrastructure / research-tool project  
**Owner / primary lane:** Mercer (archive/index/retrieval/provenance QA); shared consumers include research workers, Conversation Viewer, and public-site clients.  
**Authority / epistemic type:** retrieval and provenance infrastructure. Search output is not theory authority, mathematical validation, currentness, supersession, or physical validation.  
**Direct Nathan provenance:** 2026-09-20 live directives: build Mercer_Searcher/Mersearch as a powerful research-team search system; support backend and frontend access; search conversations and other documents/text representations; Boolean partial filename/path search; mathematically optimized equation search; document thoroughly in Common. Raw message IDs pending backfill.

## Purpose

Mersearch is the common query layer for the SAT/H(s)H archive. It should let humans, workers, the Conversation Viewer, and approved public interfaces ask the same query of the same permitted corpus and receive reproducible, provenance-bearing results.

The design rule is **one search semantics, multiple clients**. Do not fork a Sites searcher, Viewer searcher, worker searcher, and CLI searcher with subtly different meanings.

## Architecture

### 1. Mersearch Core

Current implementation: `tools/search_archive_content.py` (`Mercer_Searcher_1.0` historical/internal tool identity).

Core owns:
- query parsing and Boolean semantics;
- `AND`, `OR`, `NOT`, parentheses and implicit AND;
- quoted phrases;
- `NEAR` / `NEAR/n` with auditable token distance;
- field predicates;
- path/name glob semantics;
- record extraction from supported source formats;
- conservative notation-normalized math retrieval;
- exclusions / corpus boundary enforcement;
- provenance-bearing hit construction;
- deterministic sorting;
- topic enrichment and co-occurrence;
- machine-readable result generation.

Core must remain usable without a web server or UI.

### 2. Mersearch Index

Target layer. Precompute search-oriented representations without replacing source files:
- inventory/file manifest;
- record/message index;
- normalized lexical tokens;
- mathematical-expression inventory;
- source SHA-256 and source commit/ref;
- Viewer/document targets;
- conversation-family / duplicate-relation sidecars;
- explicit document→text-representation relations where provenance establishes them;
- topic/concept indexes;
- optional chronology summaries.

Generated indexes are derived state and must be rebuildable. They must never silently confer authority or suppress a source merely because another representation is newer/larger.

### 3. Mersearch API / machine adapter

Target layer. A stable machine-facing wrapper over Core/Index for workers, Sites, Viewer and automation.

Minimum request:
- query expression;
- corpus/profile;
- sort/order;
- pagination;
- requested facets;
- explain level.

Minimum response:
- schema/tool/index versions;
- exact query and parsed representation;
- corpus/profile and exclusions;
- source/index commit identity;
- coverage counts;
- total hits before pagination;
- page/cursor;
- facets;
- hit records;
- per-hit provenance;
- match/explanation trace;
- warnings/limitations.

API must not accept a client request to bypass quarantine/private-corpus rules merely because the client can name a path.

### 4. Mersearch clients

**Research frontend:** advanced query bar, filters/facets, chronology, provenance cards, explain-match, source-family handling, equation views, saved queries, export.

**Conversation Viewer:** message-level retrieval/jump targets and conversation-local/global search using the same semantics where practical.

**Glass Sausage Factory / public site:** public-profile search only. The site is a client, not an independent search authority.

**Worker/automation clients:** JSON/JSONL/CSV/CLI/API access for reproducible research, batch archaeology and generated indexes.

## Corpus / capability profiles

Profiles define permitted corpus and expensive capabilities, not different meanings for the same query.

- **public** — only material explicitly available to the public/site.
- **viewer** — material legitimately exposed through the Viewer.
- **worker** — permitted project corpus for ordinary workers; quarantine and PRIOR_ART remain excluded unless a separately authorized lane/profile exists.
- **admin/maintenance** — diagnostics and index maintenance; access still follows repository/quarantine policy.

Profile names do not themselves grant access. Enforcement belongs server/index side.

## Query language — current

Unqualified terms search record body text.

Current fields:
- `body:` — explicit body phrase/term.
- `math:` — conservative notation-normalized mathematical substring search.
- `name:` — basename; supports shell-style `*`, `?`, character classes.
- `path:` — source path; same glob support.
- `ext:` — extension, without leading dot.
- `type:` / `kind:` — indexed record kind.
- `has:` — mechanically established properties such as conversation-source, pdf-source, text-source, message-id, conversation-id, viewer.
- `author:` / `speaker:`
- `role:`
- `title:`
- `conversation:` / `cid:`
- `date:` including `YYYY-MM-DD..YYYY-MM-DD`
- `status:` — lexical status-signal retrieval only.

Examples:

```text
name:*2026.txt
name:*26.txt OR name:26*.txt
(path:*SAT_CONVOS_20* AND ext:txt) AND body:"star shaped"
author:Nathan AND (holonomy NEAR/12 glitch)
math:"B=3/(4*pi)"
```

## Mathematical retrieval roadmap

### M0 — notation normalization — IMPLEMENTED

Normalize common presentation differences while preserving raw source:
- selected Unicode/LaTeX/plain symbol aliases;
- multiplication/division glyphs;
- Unicode minus / approximation;
- whitespace;
- simple LaTeX fractions.

A notation match is **not algebraic equivalence**. Current negative acceptance control requires `math:"4*pi*B=3"` not to match `B=3/(4*pi)` merely because a human can rearrange it.

### M1 — expression extraction

Identify probable equation spans from LaTeX delimiters, display blocks, inline formulas, Unicode/plain equations and code-like math. Store:
- exact raw expression;
- source locator;
- surrounding context;
- notation-normalized form;
- parse status;
- parser/version.

Never discard `UNPARSED` expressions.

### M2 — structural parsing

Parse supported expressions into a symbolic AST. Add:
- `contains:` structural/subexpression search;
- symbol/function/operator facets;
- equation-shape fingerprints;
- alpha-renaming option only when explicitly requested.

### M3 — algebraic relation

Add conservative CAS-backed relationship testing:
- `EXACT`
- `NORMALIZED-EQUIVALENT`
- `ALGEBRAICALLY-EQUIVALENT`
- `CONTAINS-SUBEXPRESSION`
- `NUMERICALLY-CONSISTENT`
- `POSSIBLE-RELATION`
- `UNPARSED`

Target query: `equiv:"B=3/(4*pi)"`.

CAS transformations must be recorded and bounded. Timeouts/failures remain visible. Do not silently equate expressions under unstated domain assumptions.

### M4 — equation genealogy / derivation archaeology

Target `derive:` searches documented archive relationships rather than inventing a derivation. Desired chain:
`first known occurrence → reformulation → substitution → numerical evaluation → cross-sector reuse → correction/reversal → latest known occurrence`.

Chronology alone never establishes supersession. Explicit source language and provenance review control those labels.

## Research-power roadmap

### High priority

1. **Facets and counts:** author, role, year/date, extension, kind, conversation, topic, status signal, source family.
2. **File-level inventory mode:** avoid returning one filename match per record/message when the research question is about files.
3. **Pagination/cursors and stable total-hit count:** current `--limit` truncates after sorting and should not be confused with total matches.
4. **Stable API schema:** separate request, response metadata, facets and hits.
5. **Duplicate/snapshot awareness:** attach established conversation-family relation classes; never infer canonical/newest/preferred.
6. **Saved/named queries:** versioned query + profile + sort + topic config + index/source identity.
7. **Explain-search:** human-readable and structured reason each hit matched.
8. **Regex mode:** explicit opt-in, bounded and clearly distinguished from literal search.
9. **Case control:** explicit sensitive/insensitive behavior.
10. **Prefix/wildcard/fuzzy lexical modes:** explicit, never silently applied.
11. **Neighbor-message proximity:** distinguish within-record `NEAR` from message-window proximity.
12. **Chronology/history mode:** first/latest occurrence, density and candidate correction/supersession signals without automatic authority inference.
13. **Exports:** JSON, JSONL, CSV, Markdown, TSV/plain-text; reproducibility manifest.
14. **Source representation graph:** PDF ↔ proven text extraction ↔ rendered/reader version; heuristic candidate relations must be labeled heuristic.
15. **Public-safe search profile:** required before live-site backend exposure.

### Later / heavier

- stemming/lemmatization as opt-in;
- multilingual/tokenization improvements;
- typo/fuzzy ranking;
- semantic/vector retrieval as a separately labeled retrieval mode;
- concept graph / topic adjacency;
- equation structural and CAS layers;
- citation/bibliographic entity search;
- image/figure metadata search;
- incremental indexing and cache invalidation;
- query-performance telemetry without leaking private query/source data;
- authenticated research API;
- rate limiting and resource budgets;
- UI query builder and syntax highlighting.

## Provenance / explain contract

Every substantive hit should be able to answer:
1. What exact source object matched?
2. What corpus/profile allowed it?
3. What exact query clause matched?
4. Where in the record did it match?
5. What normalization/transformation, if any, occurred?
6. What source hash/ref/index version was searched?
7. Is the displayed source original, extraction, generated representation, or heuristic relation?
8. Is any status label lexical, source-authored, reviewed, or inferred?

A numeric relevance score without this information is insufficient for research use.

## Source relationships

Do not infer `PDF → TXT export` solely from similar filenames. Relations may be:
- **PROVEN** — explicit manifest/provenance/tool output.
- **CONTENT-VERIFIED** — independently compared content establishes the relation.
- **CANDIDATE** — basename/path/metadata suggests a relation.
- **NONE/UNKNOWN**.

Clients must be able to distinguish them.

## Duplicate / snapshot policy

Use the established conversation-relation axes and sidecar work. Search presentation may group related exports, but grouping must not:
- delete or hide unique branch material;
- call the newest/largest/LIVE copy authoritative;
- silently suppress a branch;
- convert byte identity into semantic/currentness authority.

Expose relation class and allow expand/collapse.

## Security / boundary rules

- Default exclusions include `QUARANTINE` and `PRIOR_ART`.
- Public clients use an allowlisted public corpus/profile, not merely a denylist.
- Do not expose filesystem/repository secrets, private paths or hidden source excerpts through error messages/facets.
- Regex/CAS/fuzzy/semantic operations require bounded resource budgets.
- Query logs, if retained, are operational data and need an explicit retention/privacy rule.
- Backend responses must escape/render source text safely; source text is data, never executable markup.
- API/client cannot override server-side corpus policy.

## Testing

The existing GitHub Actions acceptance gate compiles Core and runs deterministic synthetic semantics tests. Every query-language change should add a positive and negative fixture. Maintain regression tests for:
- precedence;
- quoted Unicode;
- NEAR boundaries/distances;
- field parsing;
- globs;
- exclusion policy;
- math normalization and false-equivalence controls.

Add future fixture families for inventory dedup, pagination totals, API schema, duplicate-family annotations, source relations, regex resource limits, and symbolic math assumptions.

## Current implementation status — 2026-09-20

Runtime-green before this document:
- Boolean/implicit Boolean/parentheses;
- phrases;
- NEAR;
- author/role/title/date/CID/status fields;
- body/name/path/ext/kind/has fields;
- filename/path globs;
- Unicode quoted fields;
- sorting;
- default quarantine/PRIOR_ART exclusions;
- conservative math notation normalization;
- JSON/JSONL/CSV/Markdown outputs;
- topic co-occurrence enrichment;
- provenance/explanation traces.

First bounded real-corpus smoke run has been launched through the repo-native acceptance workflow; at last check it was delayed in GitHub checkout and had not yet reached the corpus-query steps. Do not report live-corpus success until those steps complete.

## Outputs / navigation

- Core: `tools/search_archive_content.py`
- Acceptance fixture: `WORKSPACES/MERCER/test_mercer_searcher_1_0.py`
- Acceptance workflow: `.github/workflows/mercer-searcher-1-0.yml`
- Derivation-chain topic config: `WORKSPACES/MERCER/search_topics_derivation_chain.json`
- Mercer detailed continuity: `WORKSPACES/MERCER/TRIAL_CHECKPOINT.md`
- This durable shared architecture/status home: `WORKSPACES/COMMON/MERSEARCH_RESEARCH_PLATFORM.md`
- Throughput/concurrency architecture for multi-worker use: `WORKSPACES/COMMON/MERSEARCH_THROUGHPUT_CONCURRENCY.md`
- Stable releases and worker quick-start: `WORKSPACES/COMMON/MERSEARCH_RELEASES.md`

## Next operations

1. Complete and inspect the first bounded real-corpus smoke run.
2. Add file-level inventory result mode, total-hit-before-limit and facets.
3. Version a stable machine/API response schema around Core.
4. Attach established conversation-family relation sidecar where available.
5. Build mathematical expression extraction/index M1 before CAS equivalence.
6. Define the public allowlisted corpus/profile before Sites consumes a live backend.
7. Prototype research frontend against the stable API contract.
8. Consult Sable before assigning recurring shared automation/cadence or redistributing ownership.

## Supersession / history

- `Mercer_Searcher_1.0` remains the historical/internal executable identity.
- **Mersearch** is the umbrella research-platform name used for Core + indexes + API + clients.
- No existing search output is retroactively upgraded to mathematical proof, authority, currentness or provenance relation by this architecture document.
