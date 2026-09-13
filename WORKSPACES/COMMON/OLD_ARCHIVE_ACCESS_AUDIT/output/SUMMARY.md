# Old SAT archive — LLM accessibility audit

> Read-only audit of `SAT_THEORY_ARCHIVE_2023-25`. Tooling and outputs live in `HsH`; the old archive was not modified.

- Git-tracked files: **4,486**
- Archive artifacts (excluding machinery/catalog/derived-extraction layers): **3,811**
- Direct native text or located derived text: **2,749 / 3,811 (72.13%)**
- PDFs with located extraction: **271 / 512 (52.93%)**
- Images with located extraction: **0 / 563 (0.0%)**
- Current root `..findex.txt` basename visibility: **3,804 / 3,811 (99.82%)**
- Extraction outputs currently located in old repo and therefore migration/re-home candidates: **271**
- PDFs/images with no located extraction mapping: **804**
- Root index generated UTC: `2026-09-11T13:39:04.225948+00:00`

## Access classes

- `DIRECT_TEXT`: **2,478**
- `NEEDS_EXTRACTION`: **804**
- `DERIVED_TEXT_AVAILABLE`: **271**
- `UNKNOWN_OR_BINARY`: **220**
- `NEEDS_TRANSCRIPTION_OR_MEDIA_PROCESSING`: **21**
- `NEEDS_CONTAINER_INSPECTION`: **15**
- `NEEDS_FORMAT_PARSER`: **2**

## Format classes

- `native-text`: **2,478**
- `image`: **563**
- `pdf`: **512**
- `other-binary-or-unknown`: **211**
- `audio`: **20**
- `archive-container`: **15**
- `extensionless`: **9**
- `parser-required`: **2**
- `video`: **1**

## Interpretation

- `DIRECT_TEXT` means GitHub/LLM-readable text without a format-conversion step.
- `DERIVED_TEXT_AVAILABLE` means a PDF/image has a located extraction; quality may still vary and OCR uncertainty is not erased.
- `NEEDS_EXTRACTION` is the highest-priority legibility gap for PDFs/images.
- `NEEDS_FORMAT_PARSER`, media, archives, and unknown binary formats need separate ingestion paths.
- Index visibility is a structural-navigation check only; it does not mean semantic indexing or full-text search coverage.
- Legacy basename matching is explicitly weaker than manifest-backed source→output mapping and should be repaired during migration.

## Generated ledgers

- `ACCESSIBILITY_MANIFEST.csv` — one row per tracked file.
- `EXTRACTION_MIGRATION_CANDIDATES.csv` — old-repo extraction outputs that should be re-homed into HsH.
- `MISSING_EXTRACTION_QUEUE.csv` — PDFs/images with no located extraction.
- `INDEX_GAPS.csv` — source artifacts not visible by basename in the current root structural index.
- `EXTRACTION_MANIFESTS.csv` — extraction-run manifest inventory.
- `SUMMARY.json` — machine-readable totals.

## Coverage caveat

This is a repository-state/accessibility audit, not a content-read audit. It assesses tracked-file visibility and machine-readability, not whether an LLM has actually read, understood, tagged, or semantically indexed each source.
