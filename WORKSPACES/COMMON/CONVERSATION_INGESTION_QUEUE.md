# Conversation Ingestion Queue

Status: ACTIVE / standing intake control
Updated: 2026-09-18
Owner/coordinator: Sable systems lane, with Tag Conversation Corpus / Nathan Words / Mercer QA support

## Immediate intake

### DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18

Nathan is actively uploading NotebookLM-derived material here. Treat this folder as an OPEN intake stream until uploads stabilize; do not assume the current file list is complete.

Immediate obligations:

1. Detect and inventory newly added files without waiting for a hand-written completion notice.
2. Classify export/source format before semantic processing. NotebookLM exports are not automatically equivalent to ChatGPT raw conversation exports.
3. Preserve exact source path, filename, size/hash or stable identity, and upload chronology where available.
4. Check duplicate / prefix / superset relationships, especially similarly named exports and `(1)` variants, without assuming identity from filenames alone.
5. Route eligible material through the downstream surfaces that should represent it:
   - Conversation Viewer / catalog where appropriate;
   - structural and chronology indexes where appropriate;
   - archive-wide autotag substrate where the parser/source type supports it;
   - Nathan Direct only where Nathan-authored material is actually identifiable and provenance-safe;
   - Stage-2 queues only from valid current packaged substrate.
6. Verify eventual convergence. A source file existing in the repo is not proof that all intended downstream representations are current.
7. Record parser/schema failures, silent omissions, unsupported source types, stale generated surfaces, or publication races as INFRA-QA findings rather than silently skipping them.

NotebookLM provenance rule: preserve NotebookLM-generated/assistant text as NotebookLM-generated material. Do not relabel it as Nathan-authored content merely because Nathan uploaded the export or because it discusses SAT/H(s)H. Nathan Direct extraction requires explicit authorship support in the source representation.

## Standing new-upload watch

At every Project Systems recurrence, perform a lightweight delta check on `DEVELOPMENT_FULL_CONVOS/` and `LIVE CONVOS/` sufficient to notice newly appearing files or `SAT_CONVOS_N` folders since the last recorded state. This is a detection/checkpoint operation, not a requirement to process an arbitrarily large batch in one recurrence.

When a new folder appears (including the expected `SAT_CONVOS_19` and later folders):

- register it here or in the backend continuity checkpoint;
- determine source/export family;
- queue the first bounded ingestion/QA slice immediately;
- make sure normal upload-triggered workflows actually fire for the new paths;
- then check downstream convergence across Viewer -> autotag -> Nathan Direct -> Stage-2 -> chronology/index/wayfinding as applicable.

Do not hard-code folder 19 as an endpoint. New numbered folders are an open-ended stream.

## Completion standard for a batch/folder

A folder is not `INGESTED` merely because its files are committed. Mark a bounded source region complete only when its intended downstream surfaces have been checked and any exclusions are explicit and reasoned. For actively changing folders, retain `OPEN` or `PARTIAL` status and continue delta checks.

## Current priority

1. SAT_CONVOS_18 NotebookLM intake and source-format compatibility.
2. Verify current automatic workflow convergence for newly uploaded folder-18 files, especially after the recent generated-artifact publish-race fixes.
3. Maintain periodic detection for additional folder-18 files and the appearance of SAT_CONVOS_19+.
4. Feed provenance-safe Nathan-authored material to Nathan Words / Nathan Direct only after source-format authorship checks.
5. Have Mercer independently sample source-to-downstream coverage after material batches land.
