# Loom source-provenance gate for vocabulary harvesting

**Status:** proposed pre-harvest control, not yet implemented in the shared harvester.
**Owner context:** Loom's historical remit covers corpus tagging, chronology, terminology crosswalks, corrections/supersession, glossary and source navigation. This document does not grant authority to alter global tag dictionaries or theory sources without review.

## Why this gate exists

The existing harvest_priority_vocabulary.py is the correct reusable pipeline. Its current discovery is intentionally broad and path-based. A path is not a source identity, a filename is not a content type, and an extracted text file is not an independent source from its parent PDF. Duplicate paths and misclassified NotebookLM exports can inflate frequency and document-frequency scores.

The gate must run before a candidate ranking is treated as evidence.

## Required source record

For each discovered path, preserve these fields:

| Field | Meaning |
|---|---|
| repository | Repository identity |
| path | Exact path as discovered |
| git_blob_sha | Immutable Git blob identity for exact bytes |
| content_sha256 | SHA-256 of exact bytes or a separately named normalized-text hash |
| alias_paths | Other paths with the same exact blob/content identity |
| source_kind | Raw conversation, primary artifact, curated timeline, summary/roundup, NotebookLM export, glossary, crosswalk, full-theory document, big paper, extracted text, external source |
| authorship_basis | Nathan Direct, assistant-generated, NotebookLM, external author, mixed, unknown |
| source_class | Vocabulary-harvest class, after content review |
| source_weight | Weight applied once per unique source body, not once per alias path |
| source_date | Date of the source object or export |
| event_date | Date of the event the source describes |
| event_kind | First mention, conceptual formulation, name adoption, formalization, artifact creation, first public discussion, compilation, repository ingestion, later revision |
| date_basis | Raw message timestamp, artifact inscription, direct recollection, secondary summary, filename, compilation header, repository commit |
| parent_source_id | Parent PDF or raw conversation for an extracted/rendered derivative |
| corrects / supersedes | Explicit source-to-source correction relationship |
| claim_status | Primary verified, secondary supported, reported, pending primary, superseded, disconfirmed for this source |

Do not collapse source_date, event_date, repository-ingestion date, compilation-header date, and first-public-discussion date.

## Deduplication rules

1. Preserve every alias path in the inventory.
2. Group exact duplicates by Git blob SHA before token counting.
3. For extracted text, retain the parent PDF identity and do not count the PDF's extracted derivative twice.
4. If two normalized text bodies match but exact bytes differ, keep both exact identities and record a separate normalized-content relation.
5. Compute document_frequency over unique source bodies, not paths.
6. Apply a source-class weight once per unique body. If aliases have different path-derived classes, require a manual content-role decision rather than summing weights.

## Content-type adjudication

Path patterns may discover candidates, but they cannot make the final source-kind decision. At minimum:

- A SAT_HISTORY_ROUNDUP is a summary/roundup even though its filename contains history.
- A NotebookLM conversation stored under a path containing TIMELINE is a NotebookLM review transcript, not a historical timeline.
- A NotebookLM-generated HISTORY_AND_VERSIONING analysis is a secondary synthesis, not primary chronology.
- A mixed human/generated roundup must retain its mixed authorship and line-level source limits.
- A glossary or SAT-to-standard map may be version-specific or assistant-generated; it is not automatically canonical terminology.

## Vocabulary scoring

Keep three separate counts:

- frequency: occurrences within a unique source body;
- document_frequency: unique source bodies containing the term;
- weighted_frequency: source-class weight applied once per unique source body.

Keep the candidate list separate from accepted tags. Manual review must be able to accept, reject, canonicalize, alias, or defer a candidate with a reason and source pointers. Do not add a term to the global tag dictionary merely because it is frequent.

## Chronology and terminology crosswalk

For every proposed term, preserve:

- earliest currently surfaced occurrence, not an absolute-origin claim;
- exact source and message/page locator;
- version era and source authorship;
- current definition first, historical definition second;
- relation type to standard terminology: synonym, near-synonym, analogy, projection, derived quantity, distinct object, or unresolved;
- correction/supersession chain.

A semantic resemblance is not an equivalence. A timeline entry is not primary evidence unless it points to the underlying source.

## Regression cases established in h809:s3

The following must be represented as test fixtures for the existing harvester before a full official run:

1. Three known SAT_HISTORY_ROUNDUP paths plus [[SAT PARADIGM]]/SAT TIMELINE [old].txt resolve to one exact 2,253-line body, blob 187d307853c070bb767ff034a89c7dd6fcc96df5.
2. SAT TIMELINE + GITHUB/SAT - Timelines .txt and 2026/Paradigm/SAT PARADIGM TIMELINE/SAT TIMELINE 2.txt resolve to one body, blob ac8e8e70bfec7b6b270834c0358acd6df9c972cc; the content is a NotebookLM critique conversation, not a historical timeline.
3. SATOBLOC MISC/SAT_HISTORY_AND_VERSIONING.txt, blob 060b5432728e1f706ed2626686e2a4c7580a5331, is explicitly a NotebookLM-generated analysis despite the history path.
4. A PDF plus its _AUTO_EXTRACTED_TEXT derivative must produce one source body with two linked representations, not two independent witnesses.

## Run gate

Do not treat a frequency ranking as ready until:

- the source inventory is generated;
- duplicate and parent-extraction relationships are recorded;
- path-derived classes are manually checked against content;
- the manual-review queue is generated;
- the accepted curation file is reviewed;
- the downstream conversation tagger is run only against accepted terms.

The current h809:s3 runtime had no callable workflow-dispatch action. No dummy push, direct output write, or bypass is authorized by this document.
