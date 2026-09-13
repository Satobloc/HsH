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

**PRECISION/WINNOW_READY — durable Nathan Direct landed and bounded structural/provenance audit passed.**

The master unsorted/tagged Nathan-only substrate is now durable on `main` under `indexes/nathan-direct/`. Chronological adjacency plus raw parent/child branch pointers are present. Stage-2 operations may proceed non-destructively, subject to the precision caveat below.

## Active operations

### ND-A1 — Publish durable high-recall Nathan Direct substrate
- priority: P0
- state: DONE
- successful run: GitHub Actions `34766849104` (run 6; branch-aware regeneration)
- durable output: `indexes/nathan-direct/`
- manifest counts: 69,927 input records; 21,451 raw user records; 14,306 unique packaged messages; 7,145 duplicate archive copies collapsed; 0 missing conversation/message IDs
- bounded raw-source/sample audit: PASSED
- produces: master unsorted/tagged Nathan-only substrate

### ND-A2 — Preserve raw branch graph in packaged context pointers
- priority: P0.5
- state: DONE
- implementation commit: `b20271ddc6785ac60e954db9b0289eceae42feba`
- successful run: GitHub Actions `34766849104`
- manifest: 13,651 records with resolved parent graph pointer; 9,247 with child graph pointer
- local artifact recomputation: 2,319 Nathan records have multiple child pointers, confirming real branch structure is retained
- chronological previous/next pointers remain alongside parent/child pointers
- produces: branch-aware context recovery without changing Nathan wording, tags, or message identity

### ND-B1 — Precision-v2 supplemental retrieval layer
- priority: P1
- state: READY / COORDINATE WITH MERCER
- source already present: `WORKSPACES/COMMON/scripts/layered_autotag_nathan_v2.py`
- rule: v2 may supplement v1; it must not replace/delete existing v1 tags or provenance
- intended outputs: separate precision/retrieval fields or secondary index, preserving master package unchanged
- bounded Stage-2 audit confirmed v1 topic minima are unsafe for literal earliest-use claims; obvious false historical candidates occur in unrelated 2023 material
- current QA owner: Mercer; do not duplicate his selectivity/index work

### ND-B2 — Non-destructive winnow / earliest-use / correction queues
- priority: P1
- state: PARTIALLY READY
- ready now: correction/refinement, definition, methodology, decision, duplicate, branch-aware, and bounded manual-winnow queues
- still gated: literal earliest-use claims based solely on v1 topic minima; require precision filtering plus exact wording/raw-context review
- rule: winnow status is additive metadata only; no master deletion
- earliest-use claims must state actual corpus coverage
- readiness audit: `WORKSPACES/COMMON/NATHAN_DIRECT_STAGE2_READINESS_2026-09-13.md`

### ND-B3 — Context-recovery queue for inherited tags
- priority: P1
- state: READY BUT LOW-PRECISION / COORDINATE WITH MORROW
- package contains branch-aware parent/child plus chronological adjacency pointers
- v1 marks 14,269/14,306 records context-dependent, so inherited-tag presence is high-recall rather than a selective contextualization judgment
- use: select bounded messages/regions after additional precision or other independent signal
- current continuity/context owner: Morrow; reuse his work rather than duplicating conversation-family recovery
- assistant material remains pointer/context only, never Nathan-authored content

## Verified durable checkpoint

Run `34766849104` completed successfully and landed the branch-aware package on `main`.

Current manifest:

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

## Eligible Stage-2 work

Workers should avoid launching a duplicate full extractor. Useful eligible operations include:

- construct non-destructive correction/refinement queues from durable Nathan Direct;
- perform bounded manual winnow/context review under the tag-on-read rule;
- audit duplicate/prefix/superset identity handling;
- use branch pointers for selected contextual recovery;
- consume additive precision-v2 output once QA lands;
- build earliest-use candidate queues only after precision filtering, then verify exact Nathan wording/raw context before making historical claims;
- reconcile archive paths/navigation and raw conversation identities;
- fill specific extraction/provenance gaps discovered by Morrow/Mercer rather than rerunning the global extractor.

## Precision warning

The master package is complete as a high-recall substrate, but v1 topic tags are intentionally not treated as historical authority. Automated minima generated clearly spurious early `SAT-HSH`, `SPHERES`, and `QUANTIZATION` candidates in unrelated 2023 material. Preserve those v1 tags as cumulative metadata; do not erase them. Add a precision layer and verify raw context instead.

## Coordination / complementarity

- **Nathan Words / this packaging lane:** durable Nathan-only substrate, provenance packaging, adjacency/context preservation, strategic secondary enrichment after landing.
- **Tag Conversation Corpus:** systematic cumulative tagging/enrichment; existing tags remain attached.
- **Morrow:** conversation-family identity, continuity, branch/context and provenance recovery.
- **Mercer:** retrieval/index QA, Nathan Direct methodology/source reconstruction, documentation/navigation reconciliation; current precision-v2/selectivity owner.
- **Meridian:** training-first source ingestion / 4D-thinking audit during theory standdown; later geometry/solver source reconstruction if released.

Do not duplicate another worker merely because an operation is technically available.

## Unresolved Nathan-required decisions

**None currently.** Stage-2 provenance work can continue safely without Nathan intervention.

## Update discipline

After any material state change, update only the affected operation(s): state, run/output pointer, success/failure condition, and next eligible branch. Preserve historical run identifiers in the status note rather than pretending a later scan has the same coverage/counts.

Detailed packaging history: `WORKSPACES/COMMON/NATHAN_DIRECT_PACKAGING_STATUS_2026-09-13.md`.  
Stage-2 readiness audit: `WORKSPACES/COMMON/NATHAN_DIRECT_STAGE2_READINESS_2026-09-13.md`.
