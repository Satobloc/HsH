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

**DURABLE_NATHAN_DIRECT — publication/validation in progress.**

The raw archive-wide tag stream and package code exist. A previous complete runner pass successfully extracted, packaged, and validated Nathan Direct but failed only at the final non-fast-forward push. Publication logic has now been made concurrency-resilient.

## Active operations

### ND-A1 — Publish durable high-recall Nathan Direct substrate
- priority: P0
- state: IN_PROGRESS
- requires: archive-wide v1 autotag pass + packager + validation
- current run: GitHub Actions `34766611617` (run 5)
- success condition: `indexes/nathan-direct/` exists on `main`, manifest and shards validate, bounded sample matches raw provenance
- blocker class if failed: `DEPENDENCY` or infrastructure publish conflict; do not infer provenance failures from a push race
- produces: master unsorted/tagged Nathan-only substrate

### ND-A2 — Preserve raw branch graph in packaged context pointers
- priority: P0.5
- state: QUEUED
- requires: updated `package_nathan_direct.py` at commit `b20271ddc6785ac60e954db9b0289eceae42feba`
- queued run: GitHub Actions `34766849104` (run 6)
- success condition: chronological previous/next pointers remain; raw node IDs and resolved parent/child pointers are additionally present and sampled on branched conversations
- produces: stronger context recovery without changing Nathan text, tags, or message identity

### ND-B1 — Precision-v2 supplemental retrieval layer
- priority: P1
- state: BLOCKED_DEPENDENCY
- requires: ND-A1/A2 durable package + bounded sample audit
- source already present: `WORKSPACES/COMMON/scripts/layered_autotag_nathan_v2.py`
- rule: v2 may supplement v1; it must not replace/delete existing v1 tags or provenance
- intended outputs: separate precision/retrieval fields or secondary index, preserving master package unchanged

### ND-B2 — Non-destructive winnow / earliest-use / correction queues
- priority: P1
- state: BLOCKED_DEPENDENCY
- requires: durable sampled Nathan Direct package
- rule: winnow status is additive metadata only; no master deletion
- earliest-use claims must state actual corpus coverage

### ND-B3 — Context-recovery queue for inherited tags
- priority: P1
- state: BLOCKED_DEPENDENCY
- requires: durable package + branch-context sample
- use: prioritize messages whose topic is inherited from adjacency rather than directly present
- assistant material remains pointer/context only, never Nathan-authored content

## Verified prior-run checkpoint

Run `34765354003` successfully completed extraction, package generation, and validation before its final push race. On that checkout it reported:

- input records: 69,927
- raw `role=user` records: 21,451
- unique packaged `(conversation_id, message_id)` records: 14,306
- duplicate archive user-record copies collapsed: 7,145
- context-dependent/inherited-tag records: 14,269
- missing conversation/message IDs: 0
- shards: 2023 = 293; 2024 = 306; 2025 = 4,801; 2026 = 8,906

These counts belong to that specific run and are not permanent corpus totals.

## Safe alternates while P0 operations execute

Workers should avoid launching a duplicate full extractor. Useful eligible alternates include:

- inspect tag precision/selectivity and document retrieval pathologies;
- audit duplicate/prefix/superset identity handling;
- improve provenance/context pointer design without modifying source wording;
- reconcile archive paths/navigation and raw conversation identities;
- prepare non-destructive secondary-index methods;
- document handoffs/status in COMMON;
- continue independent corpus regions already assigned to another lane only when this does not duplicate active extraction/tagging.

## Coordination / complementarity

- **Nathan Words / this packaging lane:** durable Nathan-only substrate, provenance packaging, adjacency/context preservation, strategic secondary enrichment after landing.
- **Tag Conversation Corpus:** systematic cumulative tagging/enrichment; existing tags remain attached.
- **Morrow:** conversation-family identity, continuity, branch/context and provenance recovery.
- **Mercer:** retrieval/index QA, Nathan Direct methodology/source reconstruction, documentation/navigation reconciliation.
- **Meridian:** training-first source ingestion / 4D-thinking audit during theory standdown; later geometry/solver source reconstruction if released.

Do not duplicate another worker merely because an operation is technically available.

## Unresolved Nathan-required decisions

**None currently.** Infrastructure and dependency work can continue safely without Nathan intervention.

## Update discipline

After any material state change, update only the affected operation(s): state, run/output pointer, success/failure condition, and next eligible branch. Preserve historical run identifiers in the status note rather than pretending a later scan has the same coverage/counts.

Detailed packaging history: `WORKSPACES/COMMON/NATHAN_DIRECT_PACKAGING_STATUS_2026-09-13.md`.
