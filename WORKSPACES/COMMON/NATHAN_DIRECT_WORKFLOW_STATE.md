# Nathan Direct workflow state

**Program:** Prototype Tri(or Quin)ary Mover
**Scope:** Nathan Direct corpus-first provenance/training lane
**State date:** 2026-09-13
**Authority:** operational state only; no theory authority
**Controlling policy:** `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md` plus newer explicit Nathan directives

## State model

`RAW_DISCOVERY → HIGH_RECALL_TAGGED → DURABLE_NATHAN_DIRECT → PRECISION/WINNOW_READY → CONTEXT/PROVENANCE_ENRICHMENT → CURATION_READY`

Side states: `BLOCKED_DEPENDENCY`, `NEEDS_SOURCE_CHECK`, `DEFERRED_INOPPORTUNE`.

This file records mutable execution state. Do not treat it as a substitute for raw sources, package manifests, or ledgers.

## Current phase

**PRECISION/WINNOW_READY with bounded Stage-2 review active.**

The master unsorted/tagged Nathan-only substrate is durable on `main` under `indexes/nathan-direct/`. Chronological adjacency plus raw parent/child branch pointers are present. Stage-2 operations may proceed non-destructively.

Archive-wide v3 precision tagging, repackaging, and Stage-2 queue generation have now landed successfully through run 9. Precision output supplements historical v1 metadata; it does not authorize deleting or downgrading older tags. Mercer remains the precision/selectivity QA owner.

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
- run 8 (`34771136500`) passed tooling/tests but was cancelled at the former 45-minute workflow timeout before packaging/Stage-2 generation
- recovery commit `ed259c84012572b578d021c0fdaab7568e49e307` raised the workflow timeout from 45 to 90 minutes without changing tagging semantics
- recovery run 9: GitHub Actions `34774328685`
- run-9 status: **COMPLETED / SUCCESS**
- durable run-9 manifest verified on `main`: 69,927 input records; 21,451 raw user records; 14,306 unique packaged messages; 7,145 duplicate archive copies collapsed; 13,698 context-dependent/inherited-tag records; 0 missing conversation/message IDs; 13,651 resolved parent graph pointers; 9,247 child graph pointers

### ND-B2 — Non-destructive winnow / correction / provenance queues
- priority: P1
- state: ACTIVE / CLAIMED BY NATHAN WORDS
- queue builder: `WORKSPACES/COMMON/scripts/build_nathan_direct_stage2_queues.py`
- pipeline integration commit: `0025c194ca4861aea6a885500d34e53a1959414b`
- recovery run 9: GitHub Actions `34774328685` — **COMPLETED / SUCCESS**
- durable queue target: `indexes/nathan-direct/stage2/`
- durable queue manifest verified: correction-refinement 2,616; definition 1,674; methodology 1,820; decision 667; duplicate-provenance 4,661; branch-context 2,319
- current focus/claim for this lane: bounded correction/refinement winnow/enrichment under `READ IT, TAG IT`
- first bounded ledger: `WORKSPACES/COMMON/tagging_ledgers/2026-09-13-NATHAN-WORDS-correction-refinement-01.md`
- initial queue-head pass reviewed 3 queue items (2 complete queue reads, 1 partial); 3 queue items received additive review metadata; 6 raw adjacency/context messages exposed by verification were tagged because read; 0 passages promoted/curated; 0 destructive removals
- second bounded pass selected an independently SAT/H(s)H-relevant correction sequence from `DIMENSIONAL GRAVITY` (2024-03-22 local archive chronology): 6 Nathan turns manually reviewed/enriched and 6/6 rechecked against raw `author.role=user`; 0 new extraction, 0 promotion, 0 deletion
- reviewed correction chain includes terminology/conceptual-emphasis clarification, two context-dependent rejection turns, a detailed assistant-misread correction, local `filaments` terminology resolution, and a later correction distinguishing interaction-generated complexity from time-surface manifestation
- adjacency implementation note: internal raw assistant/bio/tool nodes can make literal raw-graph parent identity differ from normalized user-facing conversational adjacency; treat this as a context-boundary implementation detail, retain full raw pointer, and never infer authorship from normalized adjacency
- tranche precision finding remains: discourse-level `CORRECTIVE` is a broad behavioral retrieval signal and is not by itself selective for SAT/H(s)H correction history; combine with independent SAT/H(s)H relevance/provenance signals for concentration without deleting/downgrading `CORRECTIVE`
- still gated: literal earliest-use conclusions; require precision filtering plus exact Nathan wording/raw-context review
- rule: winnow/queue status is additive metadata only; no master deletion
- earliest-use claims must state actual corpus coverage
- readiness audit: `WORKSPACES/COMMON/NATHAN_DIRECT_STAGE2_READINESS_2026-09-13.md`

### ND-B3 — Context-recovery queue for inherited tags
- priority: P1
- state: READY BUT BROAD / COORDINATE WITH MORROW
- package contains branch-aware parent/child plus chronological adjacency pointers
- current run-9 manifest marks 13,698/14,306 records context-dependent/inherited-tag; this remains high-recall rather than a selective contextualization judgment
- use: select bounded messages/regions after additional precision or another independent signal
- current continuity/context owner: Morrow; reuse his work rather than duplicating conversation-family recovery
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

A bounded raw-source check matched package role metadata, message/conversation identity, timestamp, recipient, wording, and graph relationship. A duplicate exemplar retained three archive paths under one stable message identity. See `WORKSPACES/COMMON/NATHAN_DIRECT_STAGE2_READINESS_2026-09-13.md`.

### Precision/repackaging checkpoint — run 9

Run `34774328685` completed successfully after the timeout recovery. Durable `indexes/nathan-direct/MANIFEST.json` and `indexes/nathan-direct/stage2/MANIFEST.json` were directly verified on `main`.

Current durable counts remain 14,306 unique packaged Nathan/user messages and 7,145 collapsed duplicate archive copies, with 13,698 context-dependent/inherited-tag records. The six Stage-2 queue files are now durable and eligible for non-destructive work. This later checkpoint supplements rather than erases the run-6 historical checkpoint.

## Eligible Stage-2 work

Workers should avoid launching a duplicate full extractor. Useful eligible operations include:

- continue bounded correction/refinement review tranches under the tag-on-read rule;
- preferentially select correction candidates with independent SAT/H(s)H relevance so the concentrate lane is not dominated by generic discourse corrections;
- continue within the already-extracted `DIMENSIONAL GRAVITY` region for definition/decision/refinement review, while preserving historical/superseded status rather than harmonizing it;
- audit duplicate/prefix/superset identity handling where not already owned;
- use branch pointers for selected contextual recovery, coordinated with Morrow;
- consume additive v3 precision output after Mercer QA rather than overwriting old metadata;
- build earliest-use candidate queues only after precision filtering, then verify exact Nathan wording/raw context before making historical claims;
- reconcile archive paths/navigation and raw conversation identities;
- fill specific extraction/provenance gaps discovered by Morrow/Mercer rather than rerunning the global extractor.

## Precision warning

The master package is complete as a high-recall substrate, but machine topic/discourse tags are retrieval aids, not historical authority. Earlier automated minima generated clearly spurious early `SAT-HSH`, `SPHERES`, and `QUANTIZATION` candidates in unrelated 2023 material. Preserve those tags as cumulative metadata; do not erase them.

Run 9 materially improves precision retrieval and reduces broad inherited/context-dependent marking, but earliest-use/history still requires exact Nathan wording and raw-context verification.

The first correction/refinement tranche independently demonstrates another selectivity issue: queue membership based on `CORRECTIVE` can surface genuine Nathan corrections in unrelated epistemology material. Such items stay in Nathan Direct and keep the correction tag; Stage-2 winnow metadata may mark them incidental to SAT/H(s)H correction-history concentration.

The second pass demonstrates that independent SAT/H(s)H relevance plus local chronology is a productive concentration strategy: it surfaced a coherent correction → rejection → explicit restatement → terminology-resolution sequence without requiring theory reconstruction or assistant-intent inference.

## Coordination / complementarity

- **Nathan Words / this packaging lane:** durable Nathan-only substrate, provenance packaging, adjacency/context preservation, Stage-2 queue generation, bounded strategic secondary review.
- **Tag Conversation Corpus:** systematic cumulative tagging/enrichment; existing tags remain attached.
- **Morrow:** conversation-family identity, continuity, branch/context and provenance recovery.
- **Mercer:** retrieval/index QA, Nathan Direct methodology/source reconstruction, documentation/navigation reconciliation; current precision/selectivity owner.
- **Meridian:** training-first source ingestion / 4D-thinking audit during theory standdown; later geometry/solver source reconstruction if released.

Do not duplicate another worker merely because an operation is technically available.

## Unresolved Nathan-required decisions

**None currently.** Stage-2 provenance work can continue safely without Nathan intervention.

The Common unresolved issue `MORROW-SOURCE-001` remains a worker dependency/scanner-policy issue, not a Nathan-required decision; preserve the earlier Janus export while that review proceeds.

## Update discipline

After any material state change, update only the affected operation(s): state, run/output pointer, success/failure condition, and next eligible branch. Preserve historical run identifiers in the status note rather than pretending a later scan has the same coverage/counts.

Detailed packaging history: `WORKSPACES/COMMON/NATHAN_DIRECT_PACKAGING_STATUS_2026-09-13.md`.  
Stage-2 readiness audit: `WORKSPACES/COMMON/NATHAN_DIRECT_STAGE2_READINESS_2026-09-13.md`.
