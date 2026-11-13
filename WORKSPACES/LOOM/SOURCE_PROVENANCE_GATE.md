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


## Amendment 01 — typed artifact, representation, message and span provenance (2026-11-13)

**Status:** proposed control refinement. It does not change the shared harvester, tagger, source manifest, curation file, workflow, global tag dictionary, or theory status. Sable retains authority over shared cross-lane workflow redesign.

### Why file-level identity is insufficient

The original h809 gate correctly distinguishes file paths, exact Git blobs, extracted derivatives and content classes. A second failure surface exists below the file level: the same message can occur in several different whole-conversation exports, and a single outer user message can contain several authorship spans.

A fresh raw-source check of the archived ChatGPT conversation “Mass in SAT framework” found message 79bf888c-de7c-4c1c-8617-5e1b49250af2, timestamp 2025-10-24T22:19:44.952320Z, in three whole-file exports:

- 98237bd471553aa43ae5045dbe35a42a7267543d
- 71797fdc723a56456bcc4701ab51a592189eb617
- 8dde2b04023c4f10a8e28852fec35e358181f80e

The three raw files have different whole-file Git blob IDs and byte sizes, but the same conversation ID, message UUID, timestamp, and exact 15,022-character message body. This is one message occurrence represented in three export artifacts, not three independent messages or witnesses.

The message's existing source-span audit identifies these ranges (offset units must be preserved with the extraction/normalization profile):

| Range | Length | Source reading | Attribution state |
|---|---:|---|---|
| [0,138) | 138 | Nathan's framing asking about a NotebookLM exchange | NATHAN_DIRECT_VERIFIED |
| [138,928) | 790 | Quoted earlier question about filament/timesheet mass | NATHAN_QUOTE_PROBABLE; original source UUID not recovered |
| [928,7438) | 6,510 | Imported NotebookLM answer | NOTEBOOKLM_IMPORTED_TEXT |
| [7438,8212) | 774 | Quoted follow-up question | NATHAN_QUOTE_PROBABLE; original source UUID not recovered |
| [8212,15022) | 6,810 | Second imported NotebookLM answer | NOTEBOOKLM_IMPORTED_TEXT |

The current tag_priority_vocabulary.py concatenates message text parts and sets nathan_authored = (role == "user") for the whole message. It emits no matched-span offsets or attribution status. On this exact ChatGPT export, it would therefore label the whole 15,022-character message Nathan-authored, including the 13,320 characters explicitly identified as imported NotebookLM answers. This is a confirmed span-level design limitation, not a claim that the outer ChatGPT user turn itself is unauthenticated.

### Four identity layers plus independent-witness identity

Future manifests and tag records should keep these identities separate:

| Layer | Required fields | What it identifies |
|---|---|---|
| **Artifact** | repository, observed path(s), Git blob OID with hash algorithm, raw_bytes_sha256, Library file ID where applicable | Exact stored bytes and path aliases |
| **Representation** | representation_id, kind (raw, PDF, extracted text, OCR, normalized text, rendered), parent_artifact_id, transform/tool/version/settings/run ID, output hash | A source or derivative representation |
| **Unit** | source_system, source-schema profile, conversation/notebook ID, message UUID or record index, timestamp when present, exact unit-body hash | A message, page, record or other addressable source unit |
| **Span** | unit ID, start/end offsets and offset convention, attribution status/basis, role-semantics profile, claim locator | A bounded authored/imported/quoted/unknown segment |
| **Witness** | witness_id, independence status and basis, parent/source-family relation | An independently created source event, not merely another copy or rendering |

Keep source_family_id, content_body_id, and witness_id distinct. A parent PDF and its extracted text may be two representations of one source family and one lexical body. Two exports of the same ChatGPT message may be different artifacts but one message occurrence. Two documents with identical normalized text are not automatically the same source or independent witnesses.

Replace the ambiguous single content_sha256 field in future schema revisions with separately named fields:

- raw_bytes_sha256: SHA-256 of exact stored bytes before normalization;
- normalized_text_sha256: SHA-256 after a named, versioned normalization profile;
- unit_body_sha256: exact decoded message/record body under a declared encoding and newline convention.

Keep the repository's Git blob OID as a separate repository-object identifier; it is not interchangeable with any of these SHA-256 values.

### Attribution is source-system-specific and span-scoped

A role label has meaning only under a verified source-system/schema profile.

- For authenticated raw ChatGPT conversation exports, author.role=user ordinarily identifies Nathan's outer turn, subject to embedded quotation, pasted, imported and coauthored spans.
- For NotebookLM exports, role=user is non-discriminating. Do not map it to Nathan.
- For unknown JSON schemas, do not infer Nathan authorship from a field named role.
- A mixed outer user message must not inherit one author label across all its text. Preserve direct framing, probable quoted material, imported model output and unresolved spans separately.
- The archived Tag Conversation Corpus instruction “User is always me” is scoped to the ChatGPT archive context in which it was given; it is not a universal rule for every source platform.

The Library-held “SAT-QR: Emergent Constants and Phenomena” NotebookLM export is a useful negative/control case: it has 50 records in a top-level messages[] array, all labeled role=user, with no per-record author UUID/timestamp. The current tagger's conversations() helper accepts only objects with a top-level mapping dictionary, so this particular messages[] export is currently skipped rather than misattributed by that parser. Record the skip reason explicitly in a future run manifest; do not treat it as a ChatGPT conversation. The separate h807 audit reports two byte-identical Library captures with the same notebook ID, capture time, size and SHA-256; they are duplicate captures, not independent witnesses.

### Separate the counting units

Do not collapse these metrics:

- path_count: discovered path occurrences;
- representation_count: raw/derived representations;
- unique_source_body_count: exact bodies used for lexical frequency;
- unique_message_body_count: unique message bodies after message-level duplicate resolution;
- independent_witness_count: sources whose independence is actually established.

For vocabulary scoring, count each unique source body once, not each path or extraction. For conversation tagging, count a message UUID/body occurrence once across duplicate whole-export snapshots, while retaining every artifact/path alias. Keep independent-witness count separate: identical text does not prove common authorship, and multiple copies do not prove independent corroboration.

### Required regression cases before any official tagger run

1. Three “Mass in SAT framework” exports above resolve to one exact message UUID/body occurrence; preserve three artifact identities and all source paths.
2. The 15,022-character mixed ChatGPT user message resolves to five source spans with the statuses above; no whole-message nathan_authored=true shortcut.
3. The 50-record NotebookLM messages[] export is classified as NotebookLM schema and explicitly skipped by a ChatGPT-only tagger; its role=user labels never become Nathan authorship.
4. Two Library copies of that NotebookLM export resolve to one exact capture artifact with two Library file IDs, not two independent witnesses.
5. A PDF and _AUTO_EXTRACTED_TEXT derivative resolve to one source family with two linked representations.
6. Existing h809 duplicate-path cases remain one source body, while path aliases and differing path-derived classes remain visible for adjudication.
7. Same normalized text with different raw bytes remains two artifact identities and a candidate normalized-equivalence relation; no automatic provenance merge.

### Implementation boundary and run gate

The shared tagger currently scans JSON roots and recognizes mapping shape, but does not carry a source-system profile or span-attribution map into its output. The existing h809 file-level gate remains necessary but is not sufficient for message-level attribution. The next safe implementation must add a source-schema allowlist, explicit skipped-schema accounting, message-level duplicate resolution, and span-level match/attribution records before any accepted vocabulary is applied to Nathan-authored messages.

The existing Loom PR #759 formalizes the abstract constant-role non-injectivity and the fact that an outer role does not determine embedded origin. Its prior successful Actions run was on a synthetic PR merge reference, not current-main integration. That proof is reused as conditional mathematical support; it does not validate a source parser or attribute any actual message by itself.

No shared code, manifest, curation file, workflow, PR, Lean module, issue, or publication was changed in this amendment. No new Lean run was made: the new work is a source/schema and span-provenance contract, and the existing formal result already covers the abstract role-map point. Any later code implementation requires Sable's shared-workflow review and the exact regression corpus above.
