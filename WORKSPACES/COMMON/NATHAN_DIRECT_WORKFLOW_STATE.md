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

The master unsorted/tagged Nathan-only substrate is durable on `main` under `indexes/nathan-direct/`. Chronological adjacency plus raw parent/child branch pointers are present. Stage-2 operations may proceed non-destructively.

The autotag workflow on `main` has since advanced from the original high-recall v1 pass to `layered_autotag_nathan_v3.py`, which retains the v2 selectivity corrections and adds semantic guards plus retrieval-only definition/crosswalk/supersession candidate surfaces. Treat this as a precision/retrieval transition, not as permission to erase earlier v1 metadata. Durable outputs from the new pass must be verified after the run lands before its precision behavior is treated as current substrate state.

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

### ND-B1 — Precision supplemental retrieval layer
- priority: P1
- state: IN PIPELINE / COORDINATE WITH MERCER
- v2 source: `WORKSPACES/COMMON/scripts/layered_autotag_nathan_v2.py`
- v3 source now present and selected by the workflow: `WORKSPACES/COMMON/scripts/layered_autotag_nathan_v3.py`
- v3 adds semantic guards for ambiguous/common lexical hits and retrieval-only `DEFINITION-CANDIDATE`, `CROSSWALK-CANDIDATE`, and `SUPERSESSION-CANDIDATE` surfaces
- rule: newer precision output supplements historical v1 metadata; it must not be used as justification to delete/downgrade previously attached tags
- current QA owner: Mercer; do not duplicate his selectivity/index evaluation
- run 8 (`34771136500`) passed tooling/tests but was cancelled exactly at the workflow's former 45-minute job timeout while v3 was still scanning; packaging/Stage-2 generation never ran
- the timeout was operational rather than a semantic/test failure; the partial artifact was uploaded for audit
- recovery commit `ed259c84012572b578d021c0fdaab7568e49e307` raises the workflow job timeout from 45 to 90 minutes without changing tagging semantics
- recovery run 9: GitHub Actions `34774328685`; in progress at last verification
- verification gate: inspect durable run-9 output before declaring v3 current/validated

### ND-B2 — Non-destructive winnow / correction / provenance queues
- priority: P1
- state: CLAIMED / RECOVERY RUN IN PROGRESS BY NATHAN WORDS
- queue builder: `WORKSPACES/COMMON/scripts/build_nathan_direct_stage2_queues.py`
- pipeline integration commit: `0025c194ca4861aea6a885500d34e53a1959414b`
- generated queue target: `indexes/nathan-direct/stage2/`
- integration run 8 (`34771136500`) did not reach queue generation because the preceding v3 archive scan hit the old 45-minute timeout
- recovery commit: `ed259c84012572b578d021c0fdaab7568e49e307`
- recovery run 9: GitHub Actions `34774328685`
- queues: correction-refinement, definition, methodology, decision, duplicate-provenance, branch-context
- current focus/claim for this lane: correction-refinement queue generation and later bounded review
- still gated: literal earliest-use conclusions; require precision filtering plus exact Nathan wording/raw-context review
- rule: winnow/queue status is additive metadata only; no master deletion
- earliest-use claims must state actual corpus coverage
- readiness audit: `WORKSPACES/COMMON/NATHAN_DIRECT_STAGE2_READINESS_2026-09-13.md`

### ND-B3 — Context-recovery queue for inherited tags
- priority: P1
- state: READY BUT LOW-PRECISION / COORDINATE WITH MORROW
- package contains branch-aware parent/child plus chronological adjacency pointers
- original v1 package marks 14,269/14,306 records context-dependent, so inherited-tag presence is high-recall rather than a selective contextualization judgment
- use: select bounded messages/regions after additional precision or other independent signal
- current continuity/context owner: Morrow; reuse his work rather than duplicating conversation-family recovery
- assistant material remains pointer/context only, never Nathan-authored content

## Verified durable checkpoint

Run `34766849104` completed successfully and landed the branch-aware package on `main`.

Verified run-6 manifest:

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

**Do not silently substitute later run counts for this checkpoint until the corresponding durable manifests are verified.**

## Eligible Stage-2 work

Workers should avoid launching a duplicate full extractor. Useful eligible operations include:

- after recovery run 9 lands, verify the generated Stage-2 queue files and updated package/manifests;
- take bounded correction/refinement review tranches from `indexes/nathan-direct/stage2/correction-refinement.jsonl` under the tag-on-read rule;
- audit duplicate/prefix/superset identity handling;
- use branch pointers for selected contextual recovery, coordinated with Morrow;
- consume additive v3 precision output after Mercer QA rather than overwriting old metadata;
- build earliest-use candidate queues only after precision filtering, then verify exact Nathan wording/raw context before making historical claims;
- reconcile archive paths/navigation and raw conversation identities;
- fill specific extraction/provenance gaps discovered by Morrow/Mercer rather than rerunning the global extractor.

## Precision warning

The verified run-6 master package is complete as a high-recall substrate, but its v1 topic tags are intentionally not historical authority. Automated minima generated clearly spurious early `SAT-HSH`, `SPHERES`, and `QUANTIZATION` candidates in unrelated 2023 material. Preserve those tags as cumulative metadata; do not erase them.

The workflow now selects v3 for new corpus passes, but the durable result must be inspected after landing. Precision layers aid retrieval; earliest-use/history still requires exact Nathan wording and raw-context verification.

## Coordination / complementarity

- **Nathan Words / this packaging lane:** durable Nathan-only substrate, provenance packaging, adjacency/context preservation, Stage-2 queue generation, bounded strategic secondary review.
- **Tag Conversation Corpus:** systematic cumulative tagging/enrichment; existing tags remain attached.
- **Morrow:** conversation-family identity, continuity, branch/context and provenance recovery.
- **Mercer:** retrieval/index QA, Nathan Direct methodology/source reconstruction, documentation/navigation reconciliation; current precision/selectivity owner.
- **Meridian:** training-first source ingestion / 4D-thinking audit during theory standdown; later geometry/solver source reconstruction if released.

Do not duplicate another worker merely because an operation is technically available.

## Unresolved Nathan-required decisions

**None currently.** Stage-2 provenance work can continue safely without Nathan intervention.

## Update discipline

After any material state change, update only the affected operation(s): state, run/output pointer, success/failure condition, and next eligible branch. Preserve historical run identifiers in the status note rather than pretending a later scan has the same coverage/counts.

Detailed packaging history: `WORKSPACES/COMMON/NATHAN_DIRECT_PACKAGING_STATUS_2026-09-13.md`.  
Stage-2 readiness audit: `WORKSPACES/COMMON/NATHAN_DIRECT_STAGE2_READINESS_2026-09-13.md`.
