# Sable Archive Refresh — 2026-09-14

**Purpose:** structural memory refresh for systems/capability analysis. This is a navigation note, not theory authority.

## Three-repository architecture

### `Satobloc/SAT_THEORY_ARCHIVE_2023-25` — historical/developmental archive

Primary use: historical sources, old theory builds, derivations, conversations, notebooks, generated and human-authored artifacts, AI-era work, and archive-side orientation/institutional memory.

Important navigation surfaces:
- repository root and README;
- `.[⚙️_AI_FILES]/` — archive-side AI/navigation/workspace machinery, including indexes, archive conversations, cursors, shared resources, institutional map, dry-run reports, etc.;
- Nathan Dashboard / archive-index surfaces;
- original theory/build directories such as SAT-O, 4DHH, SAT 4D Theory Work, 2026 materials, and mathematical workshop artifacts.

Do not infer theory authority from filenames, checkmarks, labels such as `FULL THEORY`, or polished presentation.

### `Satobloc/HsH` — current public build/reconstruction repository

Repository architecture explicitly separates:
- `DEVELOPMENT_FULL_CONVOS/` — primary developmental conversation evidence;
- `synthesis/` — source-linked construction layer;
- `ledgers/` — equation/dependency/terminology/chronology/claim-status catalogs;
- `audits/` — dimensional, algebraic, numerical, source, benchmark checks;
- `formalization/` — curated machine-readable equation/assumption/unit/dependency records;
- `generated/equations/` and `generated/lean/` — deterministic checker/formal outputs;
- `indexes/` — navigation only;
- `tools/` — reproducible archive/validation machinery;
- `WORKSPACES/` — working layer; `WORKSPACES/COMMON/` is current-build coordination;
- `staging/` — incomplete/fragile assemblies.

Current `synthesis/` material must be handled carefully: some integration artifacts are explicitly quarantined after a category failure and are historical evidence, not controlling theory.

Current source-priority routing elevates SAT-O controls/derivations, 4DHH as local mathematical quarry, late-2025/early-2026 tightening, intermediate derivation/workshop artifacts, and the star-shaped derivation-map process. This is inspection priority, not correctness ranking.

### `Satobloc/HSH_RESOURCES` — private reference/evidence warehouse

Primary use: external papers/data, bibliography and research infrastructure, toolkit materials, historical sources, live research updates, source extraction/indexing, voice models, and controlled prior-art/research work.

Public HsH/archive documents should cite original external sources or public-safe extracts/summaries rather than depend on private repository links.

Human router: `!_HSH_RESOURCES_INDEX.md`.

At the current index build:
- 1211 PDF paths;
- 1136 unique PDF content groups;
- 1135 bibliographically indexed source groups;
- 70 reviewed unique-content groups;
- 1065 provisionally machine-indexed groups.

`reviewed` means bibliographic identity reviewed; it does not mean scientific content validated.

Structural areas checked in this refresh:
- `H(s)H_Toolkit/` — large technical/reference collection;
- `HISTORICAL/` — historical primary/reference texts;
- `LIVE_RESEARCH_UPDATES/` — live/current research inputs and scan machinery;
- `REDISCOVERED/` — rediscovered papers/artifacts; contains a `PRIOR_ART_LOG.md` that Sable did **not** open because prior-art content remains quarantined from Sable;
- `tools/` — PDF/image extraction, accessibility audit, bibliography/indexing, analytics store, arXiv scanner.

## Formalization / proof state

`formalization/README.md` defines four independent layers:
1. exact source record;
2. curated equation record;
3. Python checks;
4. Lean obligations.

Current `formalization/equations.json` contains three curated equations. The generated check report records six PASS checks, zero FAIL, five NOT_RUN. SymPy symbolic checks were not run because SymPy was unavailable in that run; Lean modules were not compiled because no Lean command was supplied. Therefore current formalization demonstrates a working pipeline prototype, not broad theory verification.

## Current navigation caution

`LIBRARY.md` is explicitly a discovery/read-ahead surface: inclusion means linked for reading/future audit, not endorsement or validation.

`!_ANNOTATED_ARCHIVE_SURVEY.md` in HsH is itself explicitly quarantined after the integration-lane category failure. It remains useful as historical/navigation evidence only where independently safe; do not let its synthesis judgments control reconstruction.

`!!_HIGH_PRIORITY_SAT_STATUS_HISTORY_REPORT_2026-09-12.md` is an institutional-memory checkpoint based partly on retained conversational context and repository cross-checking. It is orientation, not source-level proof.

## Structural principle retained

The repository architecture already states the distinction needed for Sable's systems work: provenance/maturity/check status are separate. Add two more independent axes in Sable analysis:
- presentation/polish;
- scientific/mathematical correctness under explicitly named checks.

No one axis promotes another.
