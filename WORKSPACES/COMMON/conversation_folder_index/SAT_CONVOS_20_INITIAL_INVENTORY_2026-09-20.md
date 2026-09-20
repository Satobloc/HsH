# SAT_CONVOS_20 — initial inventory / cross-folder identity check

**Assessed:** 2026-09-20  
**Status:** INITIAL / metadata-only bounded pass  
**Authority:** routing/provenance only; no semantic ingest implied.

## Operation

Lightweight inventory of newly populated `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_20/`, with direct SHA comparison against already indexed folder-19 items. This pass intentionally does not assign semantic value from filenames alone.

## Material finding: folder 20 contains exact cross-folder copies from folder 19

The visible folder-20 inventory includes multiple files whose blob SHAs exactly match files already present in folder 19. Confirmed examples:

| File | Folder 19 SHA | Folder 20 SHA | Relationship |
|---|---|---|---|
| `! CONSCIOUSNESS CLUB_ CONFUSING QUESTIONS__NotebookLM_export.json` | `c2fac91089d938ba188daebc38b45d39fcaacd80` | `c2fac91089d938ba188daebc38b45d39fcaacd80` | exact byte-identical cross-folder copy |
| `2 Stringing Along Theory_ A Speculative Cosmological Framework__NotebookLM_export.json` | `5bfe8bc4d98d33754ea3cbf247825178f8015b06` | `5bfe8bc4d98d33754ea3cbf247825178f8015b06` | exact byte-identical cross-folder copy; folder-19 semantic row already exists |
| `Asteroid Mining_ From Bagging to Acoustic Ore Assessment__NotebookLM_export.json` | `0601ba10d37abc9dd9e06134f6321ae459736f9e` | `0601ba10d37abc9dd9e06134f6321ae459736f9e` | exact byte-identical cross-folder copy; partial-capture member of resolved pair |
| `Asteroid Mining_ From Bagging to Acoustic Ore Assessment__NotebookLM_export (1).json` | `07353050aa8d67ee4cecabba2dbb4055e8628d1b` | `07353050aa8d67ee4cecabba2dbb4055e8628d1b` | exact byte-identical cross-folder copy; richer preferred member of resolved pair |
| `BLANK SLATE__NotebookLM_export.json` | `bc9864d0fe98a44b13ccf430ce47f942b64e39c4` | `bc9864d0fe98a44b13ccf430ce47f942b64e39c4` | exact byte-identical cross-folder copy |
| `CONSCIOUSNESS CLUB_ SUPERMETA CHAT__NotebookLM_export.json` | `68494a65937b24395030ccb861f79c4cb677f73f` | `68494a65937b24395030ccb861f79c4cb677f73f` | exact byte-identical cross-folder copy |

This establishes that folder number/upload position is not a unique-content boundary. Folder 20 must be indexed with cross-folder blob identity before semantic rereading, otherwise workers will duplicate ingest effort and may mistakenly treat repeated uploads as independent provenance witnesses.

## Newly visible folder-20 items in this bounded inventory

Visible examples not established by this pass as folder-19 copies include:
- `# SAT_SoT Scalar-Angular-Theory State of the Theory__NotebookLM_export.json` — SHA `50c4ae2b880804d0f4dd7bfb9e1ba7ef08ba19fc`, 49,163 bytes.
- `Alberrisch__NotebookLM_export.json` — SHA `6e29ff3dea9532c0eaf0cf5b26d58d9b49e75415`, 85,140 bytes.
- `BURNTHROUGH__NotebookLM_export.json` — SHA `8bb929b45a85f199021cd01c653db209679a436c`, 94,727 bytes.

These are inventory observations only. They are **not yet semantic-ingest rows** and receive no value/priority ranking here.

## Routing rule added

Before semantically ingesting a folder-20 item, compare its blob SHA against earlier conversation-folder inventories. If identical, inherit the existing semantic/source-boundary assessment by reference and record the new folder occurrence as another archive copy rather than rereading it as independent content. If SHA differs despite a matching filename, perform notebook/message/capture comparison before deciding duplicate, prefix, superset, or independent state.

## Existing folder-19 Asteroid Mining source-gap check

As a small adjacency check, exact-title/content searches for `ASTEROID MINING LLC` and `SONODART` across HsH and `SAT_THEORY_ARCHIVE_2023-25` returned no code-search hits in this run. This does **not** establish absence; it leaves the underlying source crosswalk unresolved and still an archive-gap candidate pending broader/path-based recovery.

## Next bounded cursor

1. Continue folder-20 SHA-dedup inventory before semantic reads.
2. Prefer genuinely new/high-information items after eliminating exact cross-folder copies.
3. `# SAT_SoT Scalar-Angular-Theory State of the Theory__NotebookLM_export.json` is a reasonable next semantic candidate because it is newly visible in this pass and theory-facing, but inspect authorship/source boundaries before promoting any content.
4. Preserve folder 19 and folder 20 as distinct archive occurrences even when their blobs are identical.
