# Nathan Direct workflow state

**Program:** Prototype Tri(or Quin)ary Mover
**Scope:** Nathan Direct corpus-first provenance/training lane
**State date:** 2026-09-19
**Authority:** operational state only; no theory authority
**Controlling policy:** `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md` plus newer explicit Nathan directives

## State model

`RAW_DISCOVERY → HIGH_RECALL_TAGGED → DURABLE_NATHAN_DIRECT → PRECISION/WINNOW_READY → CONTEXT/PROVENANCE_ENRICHMENT → CURATION_READY`

Side states: `BLOCKED_DEPENDENCY`, `NEEDS_SOURCE_CHECK`, `DEFERRED_INOPPORTUNE`.

This file records mutable execution state. Do not treat it as a substitute for raw sources, package manifests, or ledgers.

## Current phase

**PRECISION/WINNOW_READY with bounded Stage-2 review active; conversation-folder content indexing is now a P0 shared ingest/provenance priority.**

The master unsorted/tagged Nathan-only substrate is durable on `main` under `indexes/nathan-direct/`. Chronological adjacency plus raw parent/child branch pointers are present. Stage-2 operations may proceed non-destructively.

Archive-wide v3 precision tagging, repackaging, and Stage-2 queue generation have landed successfully through run 9. Precision output supplements historical v1 metadata; it does not authorize deleting or downgrading older tags. Mercer remains the precision/selectivity QA owner.

## WATCH PRIORITY — Q vs inverse-Q / braid smoothing and scaling

Nathan-direct clarification, 2026-09-19:

- **Neither the Q rule nor the inverse-Q rule is currently adequate. Both are insufficient.**
- Do not promote either formulation as the resolved/current rule merely because a document, reconstruction, or NLM synthesis presents it cleanly.
- Give special retrieval/indexing attention to documents and conversations dealing with **braid smoothing, scaling, scale transitions, and related attempts to reconcile or replace Q/inverse-Q behavior**.
- NotebookLM material contains substantial work in this area and is therefore potentially high-value for wayfinding/reconstruction, but must be handled with the usual NLM authorship and source-boundary caution.
- Treat proposed devices such as the **“holonomy bridge”** cautiously: they may represent exploratory repair/fudge attempts rather than established structure. Preserve them as historical/exploratory hypotheses until source chronology, derivation, necessity, and later correction/supersession are established.
- The reconstruction target is not “choose Q or inverse-Q.” It is to recover **why each proved insufficient, what smoothing/scaling problem each was trying to solve, what alternatives/bridges were attempted, and what later work actually superseded or constrained them**.
- Preserve exact source wording and distinguish Nathan-direct statements, assistant proposals, NLM synthesis, mathematical derivations/checks, and later retrospective interpretation.

Useful retrieval terms include: `Q`, `inverse-Q`, `inverse Q`, `braid smoothing`, `smoothing`, `scaling`, `scale transition`, `scale bridge`, `holonomy bridge`, `holonomy`, and adjacent terminology discovered in-source.

This is a **watch/reconstruction priority**, not a declaration that any replacement rule has already been identified.

## New P0 — conversation-folder content index

Nathan's 2026-09-19 directive prioritizes a **detailed content index of the exported conversation folders**, covering not only conversation exports but every other document/artifact in those folders. The index must track current ingest completion plus **explicitly tentative** value and priority assessments.

Controlling specification: `WORKSPACES/COMMON/CONVERSATION_FOLDER_CONTENT_INDEX_SPEC.md`.

Key rules:
- folder/upload order is not a value ranking, chronology ranking, or deprecation sequence;
- index every item, including NLM exports/source indices and non-conversation documents;
- preserve exact folder/source identity and duplicate/prefix/superset relationships;
- record actual read/ingest coverage rather than implying completion from inventory presence;
- value/priority labels are routing hypotheses and must remain easy to revise;
- `UNKNOWN` is preferable to false precision;
- use NLM source indices for wayfinding/crosswalks to underlying documents, not as replacements for those sources.

Current availability note: conversation folder 19 contains a very large, mostly-NLM tranche; folder 20 is being created/populated. These are newly available ingest fronts, **not** inherently more valuable than earlier folders.

### First bounded folder-19 index pass — 2026-09-19

Durable output: `WORKSPACES/COMMON/conversation_folder_index/SAT_CONVOS_19_INDEX_2026-09-19.md`.

Coverage:
- verified `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_19/` is populated with a large NLM-heavy tranche;
- targeted-read `2 Stringing Along Theory_ A Speculative Cosmological Framework__NotebookLM_export.json`;
- targeted-read `2025 Change__NotebookLM_export.json`;
- inventoried several additional visible NLM filenames without assigning semantic value from title alone.

Material findings:
- NLM exports inspected here serialize both Nathan prompts and obvious NLM-generated answer prose as `role=user`; therefore the role field alone is not valid Nathan-authorship evidence for these exports;
- `2025 Change` contains a detailed NLM-generated topic/source index over 36 uploaded papers and is tentatively VERY-HIGH value for bibliography/source-discovery work, while remaining secondary/wayfinding evidence until underlying sources are crosswalked;
- `2 Stringing Along Theory` contains early-SAT conceptual/formalization discussion and is tentatively HIGH value for historical reconstruction, but the inspected NLM characterizations must not be promoted to Nathan Direct without underlying-source recovery;
- an Asteroid Mining NLM export plus `(1)` variant is visible and should receive bounded duplicate/alternate-export comparison rather than filename-based disposition.

Current next cursor: continue folder-19 one high-information item/cluster per bite; strongest bounded candidates are the 36-source `2025 Change` crosswalk or the Asteroid Mining export-pair relationship check. Folder 20 should receive lightweight inventory when it becomes visible, without priority inflation from upload order.

## Active operations

### ND-A1 — Publish durable high-recall Nathan Direct substrate
- priority: P0
- state: DONE
- successful foundational run: GitHub Actions `34766849104` (run 6; branch-aware regeneration)
- durable output: `indexes/nathan-direct/`
- foundational manifest counts: 69,927 input records; 21,451 raw user records; 14,306 unique packaged messages; 7,145 duplicate archive copies collapsed; 0 missing conversation/message IDs
- bounded raw-source/sample audit: PASSED
- produces: master unsorted/tagged Nathan-only substrate

### ND-A2 — Preserve raw branch graph in packaged context pointers
- priority: P0.5
- state: DONE
- implementation commit: `b20271ddc6785ac60e954db9b0289eceae42feba`
- foundational successful run: GitHub Actions `34766849104`
- current durable manifest retains: 13,651 records with resolved parent graph pointer; 9,247 with child graph pointer
- local foundational artifact recomputation: 2,319 Nathan records have multiple child pointers, confirming real branch structure is retained
- chronological previous/next pointers remain alongside parent/child pointers
- produces: branch-aware context recovery without changing Nathan wording, tags, or message identity

### ND-B1 — Precision supplemental retrieval layer
- priority: P1
- state: LANDED / MERCER QA REMAINS INDEPENDENT
- v2 source: `WORKSPACES/COMMON/scripts/layered_autotag_nathan_v2.py`
- v3 source: `WORKSPACES/COMMON/scripts/layered_autotag_nathan_v3.py`
- v3 adds semantic guards for ambiguous/common lexical hits and retrieval-only `DEFINITION-CANDIDATE`, `CROSSWALK-CANDIDATE`, and `SUPERSESSION-CANDIDATE` surfaces
- rule: newer precision output supplements historical v1 metadata; it must not be used as justification to delete/downgrade previously attached tags
- current QA owner: Mercer; do not duplicate his selectivity/index evaluation
- recovery run 9: GitHub Actions `34774328685` — COMPLETED / SUCCESS
- durable run-9 manifest: 69,927 input records; 21,451 raw user records; 14,306 unique packaged messages; 7,145 duplicate archive copies collapsed; 13,698 context-dependent/inherited-tag records; 0 missing conversation/message IDs; 13,651 resolved parent graph pointers; 9,247 child graph pointers

### ND-B2 — Non-destructive winnow / correction / provenance queues
- priority: P1
- state: ACTIVE / CLAIMED BY NATHAN WORDS
- queue builder: `WORKSPACES/COMMON/scripts/build_nathan_direct_stage2_queues.py`
- durable queue target: `indexes/nathan-direct/stage2/`
- durable queue manifest: correction-refinement 2,616; definition 1,674; methodology 1,820; decision 667; duplicate-provenance 4,661; branch-context 2,319
- current focus/claim for this lane: bounded correction/refinement winnow/enrichment under `READ IT, TAG IT`, now secondary to bounded P0 conversation-folder indexing when a useful unindexed tranche is available
- earliest-use claims remain gated by precision filtering plus exact Nathan wording/raw-context review
- winnow/queue status is additive metadata only; no master deletion

### ND-B3 — Context-recovery queue for inherited tags
- priority: P1
- state: READY BUT BROAD / COORDINATE WITH CONTINUITY WORK
- package contains branch-aware parent/child plus chronological adjacency pointers
- current run-9 manifest marks 13,698/14,306 records context-dependent/inherited-tag; this remains high-recall rather than a selective contextualization judgment
- assistant material remains pointer/context only, never Nathan-authored content

## Verified durable checkpoints

### Foundational branch-aware checkpoint — run 6

Run `34766849104` landed the branch-aware package on `main`:
- input records: 69,927
- raw `role=user` records: 21,451
- unique packaged `(conversation_id, message_id)` records: 14,306
- duplicate archive user-record copies collapsed: 7,145
- context-dependent/inherited-tag records: 14,269
- missing conversation/message IDs: 0
- resolved parent graph pointers: 13,651
- child graph pointers: 9,247
- shards: 2023 = 293; 2024 = 306; 2025 = 4,801; 2026 = 8,906

### Precision/repackaging checkpoint — run 9

Run `34774328685` completed successfully after timeout recovery. Durable `indexes/nathan-direct/MANIFEST.json` and `indexes/nathan-direct/stage2/MANIFEST.json` were directly verified on `main`.

Current durable counts remain 14,306 unique packaged Nathan/user messages and 7,145 collapsed duplicate archive copies, with 13,698 context-dependent/inherited-tag records.

## Eligible work

Useful operations now include:
- build/extend the conversation-folder content index under `CONVERSATION_FOLDER_CONTENT_INDEX_SPEC.md`;
- inventory newly arrived folder tranches without treating upload order as value order;
- add bounded semantic descriptions and tentative value/priority only after actual inspection;
- crosswalk NLM source-index entries to underlying archive documents and flag unresolved source candidates;
- continue bounded correction/refinement review under the tag-on-read rule when it is the better current operation;
- audit duplicate/prefix/superset identity handling;
- build earliest-use candidate queues only after precision filtering and exact raw-context verification;
- reconcile archive paths/navigation and raw conversation identities;
- fill specific extraction/provenance gaps rather than rerunning the global extractor.

## Precision warning

The master package is complete as a high-recall substrate, but machine topic/discourse tags are retrieval aids, not historical authority. Preserve cumulative metadata; do not erase older tags merely because later precision improves.

Conversation-folder value/priority scoring has the same epistemic constraint: it is a **tentative routing layer**, not a permanent importance judgment. Shallow inventory should not masquerade as semantic ingestion.

Blinded test families remain a separate selectivity class: deliberate provenance stripping is not missing context to be repaired. Preserve exact wording and methodological status, but do not reconstruct semantics from the test record itself absent a separate explicit bridge.

## Coordination / complementarity

- **Nathan Words:** durable Nathan-only substrate, provenance packaging, adjacency/context preservation, Stage-2 review, and now direct contribution to conversation-folder content indexing/source crosswalks.
- **Tag Conversation Corpus:** systematic cumulative tagging/enrichment; existing tags remain attached.
- **Continuity/revival work:** conversation-family identity, self-reconstruction, branch/context recovery; saved conversations may be used across folders, with instance-named conversations preferred as anchors but not exclusive.
- **Mercer:** retrieval/index QA, source integrity, documentation/navigation reconciliation, precision/selectivity QA.
- **Meridian:** geometry/solver/source reconstruction under current controls.

Do not duplicate another worker merely because an operation is technically available; do contribute bounded index rows/rollups when that advances the shared P0 index.

## Unresolved Nathan-required decisions

**None currently for Nathan Direct.** The new index can proceed with explicitly tentative assessments and revision history.

## Update discipline

After material state change, update only affected operation(s): exact sources/coverage, state, output pointer, checks performed, and next cursor. Preserve historical checkpoints rather than rewriting old coverage as if later scans had always existed.

Detailed packaging history: `WORKSPACES/COMMON/NATHAN_DIRECT_PACKAGING_STATUS_2026-09-13.md`.  
Stage-2 readiness audit: `WORKSPACES/COMMON/NATHAN_DIRECT_STAGE2_READINESS_2026-09-13.md`.  
Conversation-folder index specification: `WORKSPACES/COMMON/CONVERSATION_FOLDER_CONTENT_INDEX_SPEC.md`.
