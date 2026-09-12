# SAT / H(s)H Federated Archive Map

> Cross-repository navigation surface. This is a router, not a theory-status ranking.

The project record is distributed across three repositories with different jobs. Search all three when the question spans development history, current formulation, external literature, public exposure, or priority.

## 1. Current development — `Satobloc/HsH`

Purpose: current H(s)H development, source conversations, synthesis/formalization, live provenance, public navigation, and point-of-use citation work.

Start with:

- `README.md`
- `!_ANNOTATED_ARCHIVE_SURVEY.md`
- `indexes/STRUCTURAL_INDEX.md`
- `indexes/index-state.json`
- `synthesis/SURVEYED_SOURCES.md`
- `synthesis/CURRENT_SYNTHESIS.md`
- `checkpoints/CURRENT.md`
- `ledgers/CITATION_LEDGER.md`

High-volume source areas:

- `DEVELOPMENT_FULL_CONVOS/`
- `LIVE CONVOS/`

Conversation material should be read from the source exports or Conversation Viewer, not inferred from titles alone.

## 2. Historical/development archive — `Satobloc/SAT_THEORY_ARCHIVE_2023-25`

Purpose: dated development record, early sketches/notebooks, SAT iterations, mathematical work, project history, and provenance extending into the SAT → H(s)H transition.

Start with:

- `!_ANNOTATED_ARCHIVE_SURVEY.md`
- `.[⚙️_AI_FILES]/🪧_WAYFINDING.txt`
- orientation / institutional / resources / Watercooler materials under `.[⚙️_AI_FILES]/`
- `..[🎛️_NATHAN_DASH]/🗄️_ARCHIVE_INDEX.txt`
- `..[🎛️_NATHAN_DASH]/..Derivation_Index.md`
- root `..findex.txt`
- `.AI_READING_PLAN/READING_PLAN.md`

Use the archive sequence:

**Observe → Catalog → Contextualize → Evaluate**

Historical placement is evidence about chronology and development context. It is not by itself evidence that a later interpretation, equation, or terminology was already fixed.

## 3. External evidence / research resources — `Satobloc/HSH_RESOURCES`

Purpose: outside literature, prior art, research updates, exposure/publication data, datasets, bibliography, extracted text, and research tooling.

Start with:

- `!_HSH_RESOURCES_INDEX.md`
- `indexes/RESOURCE_INDEX.md`
- `indexes/HUMAN_BIBLIOGRAPHY.md`
- `indexes/BIBLIOGRAPHY_COVERAGE.md`
- `info/RESEARCH_INFRASTRUCTURE_ROADMAP.md`

Important research areas:

- `PRIOR_ART/`
- `REDISCOVERED/`
- `OUTSIDE RESEARCH LIBRARY/`
- `LIVE_RESEARCH_UPDATES/`
- `H(s)H_Toolkit/`
- `EXPOSURE_STATS/`
- `DATA/`

Derived/accessibility areas:

- `derived/text/` — content-addressed PDF text extraction
- `derived/image_text/` — content-addressed image/scanned-PDF OCR when generated
- `derived/manifests/` — source-to-derived extraction state
- `indexes/` — structural, bibliographic, and human navigation products

Core tools:

- `tools/extract_papers.py`
- `tools/extract_image_text.py`
- `tools/audit_accessibility.py`
- `tools/arxiv_sat_scanner.py`
- bibliography/index builders under `tools/`

## Locatable is not the same as text-accessible

A structural index proves that a repository path was inventoried. It does not prove that the contents of a PDF, image, Office file, audio file, or other binary are searchable as text.

Use the accessibility audit to distinguish:

- native-readable text;
- extracted PDF text;
- OCR-extracted image/PDF text;
- PDF awaiting extraction;
- image/PDF needing OCR;
- binary formats needing a dedicated handler;
- unsupported or unresolved items.

For exact wording, equations, figures, dates, or priority evidence, always return to the canonical source page/image even when derived text exists.

## Cross-repository source identity

When a derived record refers to a source, preserve at least:

`repository + repository-relative path + content hash`

A human-friendly URI may be rendered as, for example:

`repo://HSH_RESOURCES/PRIOR_ART/1802.06039v2.pdf`

but the hash is the durable identity check.

## Retrieval guidance by question

**What does H(s)H currently say?** Begin in HsH synthesis/checkpoint material, then trace claims to source conversations and older archive material as needed.

**When did SAT/H(s)H first formulate X?** Search the historical archive and HsH development conversations chronologically. Prefer dated source language over later summaries.

**What external work resembles or predates X?** Search HSH_RESOURCES bibliography/full-text extracts, PRIOR_ART, OUTSIDE RESEARCH LIBRARY, REDISCOVERED, research updates, and then external literature services.

**What literature should support a sentence?** Start from the HsH citation ledger, inspect candidate sources in HSH_RESOURCES, verify the exact supporting passage, then place the citation.

**What mathematical machinery is available for a build?** Search `H(s)H_Toolkit` through its derived toolkit index/cards once generated, while distinguishing imported standard machinery from H(s)H constructions.

**What evidence exists for public exposure or chronology?** Use `EXPOSURE_STATS` and dated public-record material. Exposure statistics can document availability/reach; they do not alone establish influence.

## Coverage discipline

Do not treat a missing search hit as evidence that a concept is absent. Check whether the relevant file is text-accessible, whether OCR/extraction has run, whether terminology changed over time, and whether the likely source sits in another repository.

Folder names are routing hints, not semantic verdicts. Older sources may contain structures later renamed or revived.
