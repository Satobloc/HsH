# SAT/H(s)H source integration architecture

**Date:** 2026-09-13  
**Status:** infrastructure / documentation; not a theory surface

## Goal

Make the distributed SAT/H(s)H record continuously legible to LLMs without flattening source differences, losing provenance, or silently treating summaries as equivalent to timestamped conversations.

The system should answer, for any concept, term, equation, or theory state:

- what source material exists;
- where it lives;
- whether it is machine-readable;
- whether it is indexed;
- whether it is dated and how securely;
- what kind of source it is;
- what other sources corroborate or contextualize it;
- which conversation timestamps can verify chronology;
- what later sources clarify, supersede, or reinterpret it;
- what standard-physics terminology maps to it, and vice versa;
- which equations/theory roundups contain or summarize it.

## Primary internal source families

### 1. Explicit SAT/H(s)H glossaries

Files explicitly named or functioning as glossaries. High value for terminology and concise definitions, but each entry must retain date/version/provenance and historical-vs-current status.

### 2. Translation glossaries / crosswalks

`Standard-To-SAT`, `SAT-To-Standard`, and equivalent mappings. These are the central bridge for bidirectional search by SAT jargon or standard scientific terminology. Treat relation type explicitly: synonym, near-equivalent, structural overlap, broader/narrower relation, analogy, historical translation, or explicit non-equivalence.

### 3. Front-page timelines and historical summaries

Archive-front timelines, status histories, milestone lists, first-appearance summaries, and similar chronological navigation. These are useful chronology guides, not automatically final proof of first appearance; conversation timestamps and earlier dated artifacts should be used to verify important priority claims.

### 4. Conversation archives

Best source for exact timestamps, context, corrections, spontaneous development, distinctions, and Nathan-direct authority. Coverage is incomplete: absence from saved conversations is not evidence of non-occurrence. New conversation exports should enter the ingestion pipeline automatically.

### 5. Original general archive

Especially valuable for concentrated summaries, off-the-cuff idea dictation, what Nathan considered important, partial self-classification of ideas, and evidence of the project's early archival intent. Mixed file formats and uneven dating make accessibility/indexing critical. Preserve source exactly; use PDF/image extraction as derived access layers.

### 6. Equation roundups

Equation collections, master-equation files, Lagrangian roundups, equation sets, derivation summaries, formula sheets, and snapshots. These are a first-class source family, not merely search fodder. They should be linked bidirectionally to:

- the theory state in which each equation operated;
- derivation/provenance sources;
- terms/symbol definitions;
- later modifications or abandonment;
- standard-physics analogues or source equations where explicitly documented;
- conversation passages discussing meaning, assumptions, and status.

### 7. Theory roundups / snapshots

State-of-the-theory summaries, architecture roundups, snapshots, module inventories, and integrated formulations. These are crucial for connecting individual equations and terminology to a contemporaneous whole-theory state. A roundup should never erase conflicts or earlier branches; it gets a date/version node in the lineage.

## Derived accessibility layers

Every source should have a source record with at least:

`source_id, repo, path, source_family, file_type, original_or_derived, source_date, date_basis, date_confidence, machine_readable, extraction_path, indexed, index_locations, author/speaker, authority_role, chronology_notes, related_sources`

For PDFs/images:

- original binary remains canonical;
- extracted text is derived;
- OCR/extraction engine and timestamp are logged;
- page mapping is preserved when practical;
- low-text / OCR uncertainty is explicit;
- source record points both directions between original and extraction.

## Cross-reference graph

Use explicit edge types rather than prose-only association:

- `SAME-SOURCE-DERIVATIVE`
- `SUMMARIZES`
- `DEFINES`
- `TRANSLATES-TO`
- `STRUCTURALLY-OVERLAPS`
- `USES-EQUATION`
- `DERIVES-EQUATION`
- `MODIFIES-EQUATION`
- `SUPERSEDES`
- `CLARIFIES`
- `CONTRADICTS`
- `FIRST-APPEARANCE-CANDIDATE`
- `TIMESTAMP-VERIFIES`
- `ROUNDUP-CONTAINS`
- `THEORY-STATE-OF`
- `STANDARD-ANALOGUE`
- `PUBLIC-EXPOSURE-OF`

Edges are claims with provenance, not merely links.

## Bidirectional terminology search

Build one searchable term graph from:

- explicit glossaries;
- Standard↔SAT translations;
- timelines;
- equation/theory roundups;
- verified first-appearance conversation contexts;
- manually approved terminology relations.

A query for either SAT jargon or standard jargon should return the same concept neighborhood while preserving the relation type. Search results should distinguish exact synonymy from looser structural overlap.

## Chronology / first appearance workflow

1. Surface candidate first appearance from timeline, glossary version, original archive, or conversation scan.
2. Record the claim as `candidate`, never absolute priority by default.
3. Search all available earlier sources using SAT and standard terminology aliases.
4. Check saved conversations for exact timestamps and context.
5. Record missing-conversation coverage explicitly.
6. Promote only to scoped language such as `earliest located in current archive` or `earliest timestamped saved conversation`.
7. Re-run automatically when new documentation/conversation exports arrive.

## Equation ↔ theory linkage

This is a separate high-priority index.

For every equation candidate, create or recover:

`equation_id, normalized_expression, native_expression, symbols, first_located_source, first_located_date, theory_state, assumptions, role, derivation_sources, roundup_sources, conversation_contexts, standard_relations, later_versions, current_status`

For every theory-roundup/state node:

`theory_state_id, date/version, controlling source, terminology set, equation_ids, claimed mechanisms, explicit open problems, historical predecessor, successor, superseded_components`

The important object is then not a flat equation list but a bipartite/temporal graph:

`equation ↔ theory state ↔ source/provenance`

This makes it possible to see when the same equation survives across theory revisions, when a renamed concept retains the same formal role, or when an equation is dropped while its terminology persists.

## Continuous ingestion

New documentation should enter through a repeatable pipeline:

1. detect new/changed file;
2. classify source family provisionally;
3. extract text if needed;
4. record source metadata/date evidence;
5. update keyword/terminology bucket;
6. update equation/theory-roundup candidates;
7. update full-text search index;
8. run provenance/first-appearance back-searches affected by new terms;
9. update cross-links without deleting prior assessments;
10. surface conflicts or chronology changes for review.

The pipeline should be idempotent and additive. New evidence may refine chronology/status but should not silently rewrite the historical record.

## Coverage rule

All generated reports must state their coverage basis: full-read, full-text indexed, extracted-text indexed, metadata-only, filename-only, sampled, or unavailable. Because not all conversations are preserved, no internal first-appearance claim should imply exhaustive historical coverage unless the corpus truly supports it.
