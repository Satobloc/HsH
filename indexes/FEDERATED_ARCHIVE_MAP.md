# SAT / H(s)H Federated Archive Map

> Cross-repository navigation surface. This is a router, not a theory-status ranking.

The project record is distributed across three repositories with different jobs. Search all three when the question spans development history, current formulation, external literature, public exposure, or priority—but do **not** treat all three as equivalent public link targets.

## Public-link rule — read this first

The public project record is the **two-way pair**:

**`Satobloc/HsH` ↔ `Satobloc/SAT_THEORY_ARCHIVE_2023-25`**

Cross-link these two repositories freely and bidirectionally when doing so improves provenance, chronology, navigation, or theory-development traceability.

`Satobloc/HSH_RESOURCES` is **private and reference-only**. It is searchable research infrastructure, not a public evidence destination. A public HsH/archive document should therefore not rely on an HSH_RESOURCES GitHub link. When information found there is used publicly, export the evidence across that boundary as one of the following:

- a **Chicago-style citation** to the original external paper/source;
- an accurately attributed **quotation or extract**, with page/location and source identification;
- a clearly identified **summary/paraphrase**, with source citation/provenance;
- for private/raw project data, an appropriate **public-safe extract or summary** that records what was analyzed and where/when it came from.

Internal/private research records may preserve the exact HSH_RESOURCES path and content hash for retrieval. That locator is not a replacement for the public citation.

## 1. Current development — `Satobloc/HsH`

Purpose: current H(s)H development, source conversations, synthesis/formalization, live provenance, public navigation, and point-of-use citation work.

Start with:

- `README.md`
- `ARCHITECTURE.md`
- `!_ANNOTATED_ARCHIVE_SURVEY.md`
- `indexes/STRUCTURAL_INDEX.md`
- `indexes/index-state.json`
- `synthesis/SURVEYED_SOURCES.md`
- `synthesis/CURRENT_SYNTHESIS.md`
- `checkpoints/CURRENT.md`
- `ledgers/CITATION_LEDGER.md`
- `WORKSPACES/README.md`
- `WORKSPACES/COMMON/README.md`

High-volume source areas:

- `DEVELOPMENT_FULL_CONVOS/`
- `LIVE CONVOS/`

Conversation material should be read from the source exports or Conversation Viewer, not inferred from titles alone.

`WORKSPACES/` is the working layer. Individual workspaces can develop substantial tasks without pretending to be synthesis; `WORKSPACES/COMMON/` is the current-build common room for concise cross-agent handoffs, blockers, shared questions, and routing notices. Stable results must be promoted to the correct durable layer.

## 2. Historical/development archive — `Satobloc/SAT_THEORY_ARCHIVE_2023-25`

Purpose: dated development record, early sketches/notebooks, SAT iterations, mathematical work, project history, and provenance extending into the SAT → H(s)H transition.

Start with:

- `!_ANNOTATED_ARCHIVE_SURVEY.md`
- `.[⚙️_AI_FILES]/🪧_WAYFINDING.txt`
- orientation / institutional / resources / Watercooler materials under `.[⚙️_AI_FILES]/`
- `.[⚙️_AI_FILES]/SHARED_RESOURCES/` for archive-side shared resources and coordination aids
- `..[🎛️_NATHAN_DASH]/🗄️_ARCHIVE_INDEX.txt`
- `..[🎛️_NATHAN_DASH]/..Derivation_Index.md`
- root `..findex.txt`
- `.AI_READING_PLAN/READING_PLAN.md`

Use the archive sequence:

**Observe → Catalog → Contextualize → Evaluate**

Historical placement is evidence about chronology and development context. It is not by itself evidence that a later interpretation, equation, or terminology was already fixed.

This repository and HsH should carry reciprocal links where useful: historical source → later development/current use, and current construction → dated historical source.

## 3. External evidence / research resources — `Satobloc/HSH_RESOURCES`

Purpose: outside literature, prior art, research updates, exposure/publication data, datasets, bibliography, extracted text, and research tooling.

**Boundary:** use this repository to locate, inspect, compare, extract, and verify reference material. Do not make public HsH/archive navigation depend on private HSH_RESOURCES URLs. Carry useful results outward as citations, quotations/extracts, or sourced summaries.

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

For the two public project-record repositories, preserve a stable public path/link plus any useful content identity.

For private HSH_RESOURCES-derived work, preserve internally at least:

`repository + repository-relative path + content hash`

A private research record may render a retrieval URI such as:

`repo://HSH_RESOURCES/PRIOR_ART/1802.06039v2.pdf`

but that is an **internal locator only**. Public-facing work should point to the original external source/citation or contain an appropriately sourced extract/summary.

## Retrieval guidance by question

**What does H(s)H currently say?** Begin in HsH synthesis/checkpoint material, then trace claims to source conversations and older archive material as needed.

**When did SAT/H(s)H first formulate X?** Search the historical archive and HsH development conversations chronologically. Prefer dated source language over later summaries.

**What external work resembles or predates X?** Search HSH_RESOURCES bibliography/full-text extracts, PRIOR_ART, OUTSIDE RESEARCH LIBRARY, REDISCOVERED, research updates, and then external literature services. Publish the result through normal citation/quotation/summary rather than a private repo dependency.

**What literature should support a sentence?** Start from the HsH citation ledger, inspect candidate sources in HSH_RESOURCES, verify the exact supporting passage, then place a Chicago-style citation to the original source.

**What mathematical machinery is available for a build?** Search `H(s)H_Toolkit` through its derived toolkit index/cards once generated, while distinguishing imported standard machinery from H(s)H constructions. Carry the selected machinery into public work with source citation and/or a sourced summary.

**What evidence exists for public exposure or chronology?** Use `EXPOSURE_STATS` and dated public-record material. Exposure statistics can document availability/reach; they do not alone establish influence. If private/raw statistics are used publicly, publish a sufficiently described extract or summary rather than relying on the private repository location.

**Where should agents coordinate?** Use individual `HsH/WORKSPACES/<name>/` areas for sustained focused work and `HsH/WORKSPACES/COMMON/` for concise current-build coordination. Use the historical archive's `.[⚙️_AI_FILES]/SHARED_RESOURCES/` for durable archive-side shared resources and reconstruction aids.

## Coverage discipline

Do not treat a missing search hit as evidence that a concept is absent. Check whether the relevant file is text-accessible, whether OCR/extraction has run, whether terminology changed over time, and whether the likely source sits in another repository.

Folder names are routing hints, not semantic verdicts. Older sources may contain structures later renamed or revived.
