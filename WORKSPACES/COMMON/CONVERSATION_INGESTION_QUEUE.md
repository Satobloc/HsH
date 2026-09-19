# Conversation Ingestion Queue

Status: ACTIVE / standing intake control
Updated: 2026-09-18
Owner/coordinator: Sable systems lane, with Tag Conversation Corpus / Nathan Words / Mercer QA support

## Immediate intake

### DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18 and SAT_CONVOS_19+

Nathan is actively uploading NotebookLM-derived material here. Treat these folders as OPEN intake streams until uploads stabilize; do not assume the current file lists are complete.

Immediate obligations:

1. Detect and inventory newly added files without waiting for a hand-written completion notice.
2. Classify export/source format **and active-frame target** before semantic processing. NotebookLM exports are not automatically equivalent to ChatGPT raw conversation exports, and two similarly named exports from one notebook are not automatically duplicate captures of the same thing.
3. Preserve exact source path, filename, size/hash or stable identity, upload chronology, notebook ID, and where recoverable the active frame/target that was harvested.
4. Check exact duplicate / prefix / superset / alternate-frame relationships, especially similarly named exports and `(1)` variants, without assuming identity from filenames alone.
5. Route eligible material through the downstream surfaces that should represent it:
   - Conversation Viewer / catalog where appropriate;
   - structural and chronology indexes where appropriate;
   - archive-wide autotag substrate where the parser/source type supports it;
   - Nathan Direct only where Nathan-authored material is actually identifiable and provenance-safe;
   - Stage-2 queues only from valid current packaged substrate.
6. Verify eventual convergence. A source file existing in the repo is not proof that all intended downstream representations are current.
7. Record parser/schema failures, silent omissions, unsupported source types, stale generated surfaces, publication races, or frame-target ambiguity as INFRA-QA findings rather than silently skipping them.

NotebookLM provenance rule: preserve NotebookLM-generated/assistant text as NotebookLM-generated material. Do not relabel it as Nathan-authored content merely because Nathan uploaded the export or because it discusses SAT/H(s)H. Nathan Direct extraction requires explicit authorship support in the source representation.

## NotebookLM active-frame / alternate-export rule

Nathan's exporter harvests the **currently active NotebookLM frame**. Therefore, repeated exports from the same notebook may represent materially different targets.

At minimum distinguish:

1. **NLM chat/conversation export** — the NotebookLM conversational exchange;
2. **NLM source-document export** — a source pane/document harvested instead of the chat;
3. **repeat/partial/superset chat capture** — another capture of substantially the same NLM conversation;
4. **repeat/partial/superset source capture** — another capture of substantially the same source document;
5. **mixed/unclear frame export** — target cannot yet be determined confidently.

A filename suffix such as `(1)` must not be interpreted as `duplicate` by itself.

### Source-document captures containing ChatGPT copypasta

NotebookLM source documents may themselves be large pasted ChatGPT conversations or extracts. These require two distinct provenance layers:

- **immediate source instance:** the NLM source-document export currently in hand;
- **underlying original source:** the ChatGPT conversation/document from which the pasted material came, if recoverable.

Theoretically, much of this underlying ChatGPT material should exist elsewhere in the archive with richer metadata and chronology. In practice, **do not assume it has already been exported or ingested**. A source-document capture may currently be the only available copy of otherwise unexported conversation material.

Therefore:

- never discard or suppress an NLM source-document export merely because it looks like ChatGPT copypasta;
- attempt exact/near-exact/prefix/superset matching against existing conversation corpus material;
- if an authoritative original is found, link the NLM copy as a derivative/source-instance rather than treating it as an independent theory occurrence;
- if no original is currently present, retain the NLM source export as a provisional source and make it fully retrievable/taggable with provenance warning;
- if the original later arrives, reconcile rather than silently replacing the earlier derivative;
- preserve differences, truncations, edits, selections, headings, or annotations introduced by the copy/paste or NotebookLM source representation.

### Deduplication classes

Use explicit relationship labels where practical:

- `EXACT_DUPLICATE`
- `PREFIX_OF`
- `SUPERSET_OF`
- `OVERLAPPING_CAPTURE`
- `SAME_NOTEBOOK_DIFFERENT_FRAME`
- `DERIVATIVE_OF_CHATGPT_SOURCE`
- `POSSIBLE_DERIVATIVE_SOURCE_NOT_YET_FOUND`
- `DISTINCT_SOURCE`
- `UNRESOLVED_RELATIONSHIP`

Deduplication is a provenance operation, not a deletion rule. Preserve all source instances until their relationship and information loss/gain are understood.

## NotebookLM chronology rule

Do **not** equate missing standard JSON timestamps with undatable NotebookLM material.

NotebookLM exports may contain usable chronological evidence in nonstandard locations or formats, including prose, copied source text, headers, titles, quoted conversation fragments, embedded date strings, notebook discussion, source citations, or other textual artifacts that the generic conversation-date parser does not recognize.

For each NLM export, chronology recovery should therefore proceed in this order:

1. explicit conversation/message timestamps if present in structured metadata;
2. explicit dates/times embedded elsewhere in the export or source text;
3. date-bearing references to the underlying ChatGPT conversation/source artifact;
4. source-document chronology and cross-repo provenance;
5. upload/commit chronology as a later bound;
6. `captured_at` only as the NotebookLM export/capture event, **not** as the conversation start date.

Record the timestamp source and confidence. Do not silently convert inferred dates into exact dates.

### Expected NLM lag relative to ChatGPT

Nathan's current guidance is that, **generally but not universally, NotebookLM discussion lags the corresponding ChatGPT theory-development conversations**. Treat this as a chronology prior / search heuristic, not a hard dating rule.

Accordingly:

- when an NLM notebook summarizes or interrogates a theory formulation, preferentially search earlier ChatGPT/GLASS material for the originating formulation;
- do not assign priority or first-appearance status to the NLM discussion merely because its export is easier to locate;
- distinguish an NLM **retrospective synthesis** from genuinely new theory development occurring inside NLM;
- where NLM appears to introduce a new consequence, interpretation, correction, or hypothesis not found in the earlier source corpus, preserve it as a possible later development rather than forcing an earlier origin;
- for the most important ideas, establish chronology from the underlying source chain rather than from the NLM capture date.

This lag prior is especially useful for theory-history reconstruction but should not override explicit contrary timestamps or source evidence.

## Standing new-upload watch

At every Project Systems recurrence, perform a lightweight delta check on `DEVELOPMENT_FULL_CONVOS/` and `LIVE CONVOS/` sufficient to notice newly appearing files or `SAT_CONVOS_N` folders since the last recorded state. This is a detection/checkpoint operation, not a requirement to process an arbitrarily large batch in one recurrence.

When a new folder appears:

- register it here or in the backend continuity checkpoint;
- determine source/export family and active-frame target where possible;
- queue the first bounded ingestion/QA slice immediately;
- make sure normal upload-triggered workflows actually fire for the new paths;
- then check downstream convergence across Viewer -> autotag -> Nathan Direct -> Stage-2 -> chronology/index/wayfinding as applicable.

Do not hard-code folder 19 as an endpoint. New numbered folders are an open-ended stream.

## Completion standard for a batch/folder

A folder is not `INGESTED` merely because its files are committed. Mark a bounded source region complete only when its intended downstream surfaces have been checked and any exclusions are explicit and reasoned. For actively changing folders, retain `OPEN` or `PARTIAL` status and continue delta checks.

## Current priority

1. SAT_CONVOS_18 and SAT_CONVOS_19 NotebookLM intake and source-format compatibility.
2. Classify chat-vs-source-document active-frame exports and reconcile same-notebook alternate exports.
3. Recover nonstandard embedded chronology before classifying NLM exports as undated.
4. Detect ChatGPT copypasta source documents and match them against richer originals where available without discarding unmatched copies.
5. Verify current automatic workflow convergence for newly uploaded NLM files.
6. Maintain periodic detection for further additions to 18/19 and creation of SAT_CONVOS_20+.
7. Feed provenance-safe Nathan-authored material to Nathan Words / Nathan Direct only after source-format authorship checks.
8. Have Mercer independently sample source-to-downstream coverage after material batches land.
