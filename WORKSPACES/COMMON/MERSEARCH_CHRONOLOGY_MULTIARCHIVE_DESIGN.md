# Mersearch 2.x: Unified Multi-Archive Search and Chronology Design
Status: DESIGN / NOT IMPLEMENTED. Owner: Mercer. Date: 2026-10-07.
Stable 1.0 remains pinned at `mersearch-stable-1.0`; do not silently promote development main.

## Non-negotiable defaults
- ONE search interface. Chronology is an enrichment/facet/sort mode of ordinary search, not a competing engine.
- **Search ALL configured public/authorized archives by default**: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`, `Satobloc/HsH`, `Satobloc/HSH_RESOURCES`. Report coverage explicitly (root, ref/SHA, indexed file counts, exclusions, failures). If only one root is mounted, mark **PARTIAL CORPUS** visibly; never call it a three-archive search.
- Honor hard PRIOR_ART quarantine and access boundaries; do not expand scope silently. Report excluded roots/counts without leaking content. Deduplicate mirrored records without discarding provenance.
- Every LLM invocation should expose **tool discovery**: `--help`, `--capabilities` (JSON machine contract), `--examples`, `--describe-fields`, `--coverage`. Every JSON response repeats `capabilities_url_or_command`, available modes, coverage, schema version, and warnings. Do not assume agents remember syntax.
- All filters optional; a plain query searches across all archives. Support unlimited-result inventory with cursor/pagination and honest `total_hits` vs `returned_hits`. A GitHub search result cap is never a corpus total.
- Backward-compatible 1.0 Boolean, phrase, NEAR/n, math notation, author/role/date/path and status queries; new chronology features are additive. Maintain stable sorting/tie breakers and query reproducibility.

## Chronology fields (document AND passage levels)
- `archive_date`: when archived/packaged, source path and evidence; never substitute for composition date.
- `earliest_date_mentioned`, `latest_date_mentioned`: contextual dates in text, with spans and interpretation; not necessarily document dates.
- `earliest_message_at`, `latest_message_at`: timestamps from structured exports, with original field paths/timezone, validated parsing. Hard evidence for those messages, not for all quoted/embedded material.
- `estimated_origin_start`, `estimated_origin_end`, `confidence`, `confidence_reasons`, `contradictions`: inference, never masquerading as timestamp.
- `earliest_version_mentioned`, `latest_version_mentioned`: chronological designation range, plus full list with spans and whether usage is contemporaneous, retrospective, quoted, or uncertain.
- `earliest_version_active`, `latest_version_active`: designations used to describe work in progress.
- `document_type`: direct structured conversation / plain-text conversation / laboratory log / compilation / retrospective / edited synthesis / unknown; allow mixed passage types.
- `date_evidence[]`: value, normalized range, type (structured/message, internal-reference, filename, folder, version-era, cross-match, git commit), source span, reliability, explanation.
- `version_evidence[]`: canonical designation, aliases, first-known-attestation, usage interval/distribution, context span, active-vs-historical classification.
- `source_identity`: repo/ref/SHA/path/record ID/message ID, content hash, conversation family, duplicate/snapshot/branch relationship if demonstrable; do not infer PDF↔TXT lineage from names.

## Era model
- Seed alias dictionary from original archive `detailed versioning.txt`, `SAT_HISTORY_ROUNDUP.txt`, timeline/index documents and corroborated dated conversations.
- Cover early 'toy theory', 'Stringing Along Theory' / SAT, SAT 2.0, Mark IV/IV.2/V, SAT X/XY/Z/O, Chronophysical proposed renames, H(s)H and additional names found in historical records.
- **Do not assume names form a linear rename chain**. Preserve parallel, proposed, rejected and overlapping designations; distinguish naming proposals from actual adoption.
- Learn calibrated designation usage distributions from timestamped original messages, not repeated compilations; record sample size, time bins, duplicate handling and uncertainty. Transition peaks can be more informative than mid-era generic 'SAT'.
- Later designation in an ostensibly older document flags later compilation/annotation or date conflict; never overwrite hard timestamps. Mixed old/new designations can signal transition OR retrospective discussion.
- A historical document's newest terminology is a terminus-post-quem clue only for the passage where it occurs, subject to editing/quotation. Dates mentioned in references are not composition dates.
- Keep `earliest_attested` distinct from `earliest_estimated`. Permit `unknown` and abstention; avoid fabricated precision.

## Search API / CLI contract (proposed, NOT CURRENT COMMANDS)
```
mersearch --help
mersearch --capabilities --format json
mersearch --coverage
mersearch search '"0.24" OR "phase shift"' --archives all --sort estimated-origin --mode passages
mersearch search '("refractive index" NEAR/15 "phase shift")' --era early-2025 --mode files
mersearch search '"Chronophysical"' --retrospective exclude --sort date
mersearch search 'math:"3/(4*pi)"' --include-aliases --limit 0 --format jsonl
mersearch chronology '"0.24"' --show-evidence --format json
```
Query DSL additions: `era:`, `version:`, `archive_date:`, `origin:`, `date_confidence:`, `retrospective:`, `document_type:`, `repo:`, `source:`, `duplicate:`. Existing `date:` continues to mean direct message timestamp where present; explicit alternative date filters never silently change that semantics. `math:` is notation normalization, NOT symbolic equivalence. Alias expansion is opt-in and explained.

## Result presentation
- Default columns: title/path, repository, match snippet, message date, estimated origin range, archive date, version range, confidence, type, duplication group, source link.
- Evidence drawer: every date/version inference with exact cited text, source location, confidence and contradictions. Preserve passage-level origins in compilations.
- Group by file/conversation family or show all matching passages; dedupe copies with toggle to expand mirrors.
- Date sorting: known message timestamps first where appropriate; inferred ranges with uncertainty and explicit tie breakers; undated results visible, not silently dropped.
- Response envelope: `schema_version`, `query`, `normalized_query`, `archives_requested`, `archives_searched`, `coverage_status`, `exclusions`, `total_hits`, `returned_hits`, `next_cursor`, `sort`, `capabilities`, `warnings`, `results`.

## Implementation sequence and acceptance gates
1. Preserve 1.0 regression suite. Fix current development syntax/compile issues before feature work; isolate new modules.
2. Implement configurable multi-root corpus manifest and coverage reporting; update connector-only request bridge (currently SAT archive only) to clone/index three authorized repositories, or clearly report partial coverage.
3. Add robust structured-export timestamps (per message), text date extraction with context, version/alias registry with provenance, passage segmentation, and conservative retrospective/compilation classification.
4. Add duplicate grouping, provenance links, explicit confidence/abstention, chronology fields and filters; build deterministic tests around contradictory and quoted dates.
5. Add LLM self-describing interface/capability manifest and concise quickstart that lists all tools, modes, limitations and examples at point of use.
6. Benchmark performance/memory on real corpora; index incrementally with SHA/cache, avoid scanning huge files for every query; do not claim complete coverage when parsing fails.
7. Acceptance fixtures: Feb-era optical phase shift without SAT name; late archival folder containing earlier messages; June plan referencing July deadline; Oct compilation quoting early versions; proposed Chronophysical name; JSON messages with timestamp; duplicate snapshots across repos; numeric aliases 0.24/0.239/0.2387; Unicode/LaTeX math; hard quarantine exclusions.
8. Promote only after compile, unit tests, real-corpus smoke tests, coverage audit and release notes. Keep stable pinned until green.

## Research starter: phase-shift lineage
Search optical phase, index of refraction/refractive index, lab logs, toy theory, torque/torquing, 0.24/0.239/0.2387, 14.1 degrees, B, and version aliases across ALL archives. Separate earliest laboratory numerical occurrence, earliest interpretation, and later generalized projection-constant claims. Correlate distinctive excerpts to dated structured conversations. Do not assume later phase-shift expressions are mathematically identical without derivation.
