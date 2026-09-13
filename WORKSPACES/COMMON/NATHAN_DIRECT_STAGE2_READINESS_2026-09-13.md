# Nathan Direct Stage-2 readiness audit — 2026-09-13

**Lane:** Nathan Direct / corpus-first provenance infrastructure  
**Authority:** operational/provenance only; no theory authority

## P0 package gate — PASSED

Branch-aware archive-wide workflow run `34766849104` completed successfully and durable outputs are present on `main` under `indexes/nathan-direct/`.

Current manifest reports:

- input records: 69,927
- raw `role=user` records: 21,451
- unique packaged `(conversation_id, message_id)` records: 14,306
- duplicate archive user-record copies collapsed: 7,145
- context-dependent/inherited-tag records: 14,269
- records missing conversation/message ID: 0
- records with resolved parent graph pointer: 13,651
- records with child graph pointer: 9,247
- shards: 2023 = 293; 2024 = 306; 2025 = 4,801; 2026 = 8,906

A bounded audit against the downloaded workflow artifact found the four shard counts sum to 14,306; duplicate-collapse count recomputes to 7,145; 13,651 records contain parent graph pointers; 9,247 contain child graph pointers; and 2,319 Nathan records have more than one child pointer, confirming that real conversation branching is represented rather than reduced to chronology alone.

A raw-source spot check against `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/23.04.07•23.04.08•Logic Characters Usage — raw.json` matched the package on conversation ID, message ID, `author.role=user`, timestamp, recipient, wording, and graph parent/child identity. Packaging strips surrounding whitespace through the extractor but does not paraphrase message content.

A duplicate exemplar, message `d25bcca1-bb43-472c-aa56-c25762d36d54` in conversation `699e4a02-26e4-832a-86ea-ad1dcaf3c4e3`, is represented once with `archive_copy_count=3` while retaining three source paths and their distinct source hashes. This is the intended archive-copy treatment: one message identity, multiple provenance paths, no multiplication of evidence.

## Stage-2 precision caution

The durable master substrate is ready. The **v1 topic layer is not sufficiently selective for literal earliest-use claims**.

A bounded automated earliest-tag probe produced obviously spurious historical candidates, including `MSG:SAT-HSH` in a 2023 epistemology conversation and `MSG:SPHERES` / `MSG:QUANTIZATION` in unrelated 2023 worldbuilding material. This is consistent with the already-documented v1 substring/adjacency pathologies and is not evidence about SAT/H(s)H history.

Therefore:

- preserve all v1 tags as cumulative high-recall metadata;
- do not use v1 tag minima as earliest-use conclusions;
- use the existing precision-v2 layer as an additive retrieval layer after its current QA owner validates it;
- earliest-use candidates must still be checked against exact Nathan wording and raw context before promotion.

## Stage-2 queues now structurally available

The master package can already support non-destructive queues that do not depend on v1 topic precision. Current machine-tag counts include:

- correction / clarification / self-correction signals: 1,977 records
- revision / countermand signals: 1,134 records
- union of correction/clarification/self-correction/revision/countermand signals: 2,616 records
- definition signals: 1,674 records
- methodology signals: 1,820 records
- decision signals: 667 records
- records with duplicate archive copies: 4,661
- records with multi-child branch structure: 2,319

These are **queue sizes, not verified semantic judgments**. Manual review remains governed by `READ_IT_TAG_IT_STANDING_POLICY.md`: anything actually read must receive cumulative tags; earlier tags/statuses are not erased.

## Ready / blocked split

### READY

- chronological Nathan Direct retrieval from durable shards;
- correction/refinement queue construction;
- duplicate/superset audit using stable conversation + message IDs;
- branch-aware contextual recovery on selected messages;
- selective winnowing on already-packaged material, with winnow status additive only;
- contextual/manual review of bounded prepared regions.

### READY BUT SHOULD BE COORDINATED

- inherited-tag contextualization: technically ready, but Morrow owns conversation-family/context continuity and should be reused rather than duplicated;
- precision/retrieval QA: Mercer owns current index/selectivity QA and the v2 precision question.

### STILL GATED

- literal earliest-use claims derived solely from v1 topic minima;
- destructive replacement of v1 tags/buckets with v2;
- canonical/theory promotion based on worker agreement or machine tags.

## Next Nathan Words operation

Prefer one of the following without duplicating active owners:

1. build a deterministic non-destructive correction/refinement queue from the durable Nathan Direct shards;
2. consume a precision-v2 output once Mercer has validated/landed it, preserving v1 metadata alongside v2;
3. select a bounded already-packaged region for manual winnow/context review under the tag-on-read rule;
4. fill genuine extraction/provenance gaps discovered by Morrow/Mercer rather than re-running the global extractor.
