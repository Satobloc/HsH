# Janus export comparison — 2026-09-13

Status: completed bounded source-identity audit; no theory assessment.
Tags: `ADMIN`, `SOURCE-IDENTITY`, `RAW-ID-COMPARED`, `CONTENT-DIFF`, `CORRECTION`, `COVERAGE-LIMIT`.

**Finding:** later Janus exports retain every earlier message ID and every earlier user payload, but one tool-output body is shortened. The latest identified copy is not a lossless replacement for the earliest. No original was moved, deleted, rewritten, or newly quarantined.

## Sources and coverage

One raw conversation UUID: `6a9f3d4b-54e4-83ea-81de-19908068ceb7`. Four paths, three unique blobs:

| Label | Source | Blob SHA | Mapping nodes / messages / active-branch messages |
|---|---|---|---|
| A | [LIVE raw](https://github.com/Satobloc/HsH/blob/main/LIVE%20CONVOS/%F0%9F%97%BFORCHESTRATOR%20JANUS%20H(s)HvO%20%E2%80%94%20raw.json); [SAT_CONVOS_12 copy](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_12/26.09.07%E2%80%A226.09.08%E2%80%A2%F0%9F%97%BFORCHESTRATOR%20JANUS%20H(s)HvO%20%E2%80%94%20raw.json) | `bb0aed39b357990cdcfa8c91f84a682b044eb831` | 1,225 / 1,224 / 1,202 |
| B | [SAT_CONVOS_13 raw](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.09.07%E2%80%A226.09.10%E2%80%A2%F0%9F%97%BFORCHESTRATOR%20JANUS%20H(s)HvO%20%E2%80%94%20raw.json) | `8086aa3e467c4e055bad1f236b894b5e4ee261b2` | 1,715 / 1,714 / 1,690 |
| C | [SAT_CONVOS_13 raw (1)](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.09.07%E2%80%A226.09.10%E2%80%A2%F0%9F%97%BFORCHESTRATOR%20JANUS%20H(s)HvO%20%E2%80%94%20raw%20(1).json) | `4d0db6713b677026af6a8409410c22ff31d735a8` | 2,370 / 2,369 / 2,341 |

Observed against repository tree `26381598a1df31bfe1b8566cb47c16b1f9d0ead6`. A's two paths have the same Git blob. The first message timestamp in each is 2026-09-07T22:41:11.950Z; latest message timestamps are A 2026-09-09T02:26:21.682Z, B 2026-09-10T17:18:57.660Z, C 2026-09-11T01:25:14.353Z. These are message timestamps, not claimed export-creation times.

Coverage: complete computational traversal of all three raw message mappings and active-branch ancestry; NOT complete dialogue reading. Targeted full reading of the 22:13 user message below; targeted inspection of the changed tool-output boundary. The long tool output was not fully manually read or interpreted. The shared scanner and the existing 22:13 staging ledger were read completely.

## Exact relationship

Payload means `author.role`, `author.name`, the **entire** `content` object, `recipient`, `channel`, and `create_time`. JSON object-key order is ignored; array order and string contents are retained. Full raw-message objects were compared separately, including metadata and `update_time`.

| Comparison | Earlier IDs missing | Added IDs | Changed payloads | Earlier active branch |
|---|---:|---:|---:|---|
| A → B | 0 | 490 | 1 tool output | ID prefix; not unchanged-content prefix |
| B → C | 0 | 655 | 0 | ID and payload prefix |
| A → C | 0 | 1,145 | same 1 tool output | ID prefix; not unchanged-content prefix |

All **119** A user messages retain their IDs and compared payloads in B and C. No duplicate message IDs, active-ancestry cycles/missing nodes, changed shared-message parents, or lost old child edges were found. This describes export structure, not shared execution or experiential continuity.

Raw-message metadata qualification: A→B and A→C also change `update_time` on `c5fc6612-8711-4823-b252-23351d93cddb`; B→C changes only `update_time` on `7b2669f7-8963-4a44-b827-51ce05c6a4f1`. Thus B→C is a content-preserving extension under the stated payload rule, not byte-for-byte equivalence of all metadata or of whole export files. Export-wide metadata outside the message graph was not audited.

## Shortened tool body and comparator gap

- Message/node ID: `cf053d90-2d2a-4d7b-b66f-d78bafd307bf`.
- Author: `role=tool`, `name=container.exec`; `content_type=execution_output`.
- Body lives in `content.text`, not `content.parts`.
- A: 20,023 Unicode code points. B and C: the same 16,146-code-point text.
- An 8,006-code-point prefix and 8,121-code-point suffix survive; the intervening 3,896 code points become the literal marker `\n...[truncated]...\n`.
- Parent: `2a24910b-ddd3-4dc6-bd89-e6f62d0a0277`; child: `4b87769b-a1de-4ced-ad16-a7cb651558e7`.

[Shared superset scanner](../COMMON/scripts/find_superset_conversation_duplicates.py), blob `de5478b26c01a5cfe4a591be7e154295233710b3`, compares `content_type` and `parts` but omits `text`. Replaying that field selection yields zero changed A→C payloads; whole-content comparison detects the one change. This is a reproducible false positive in its content-equality gate, not evidence that any source has already been deleted. The scanner only emits review candidates and already requires point-of-use checks.

Requested maintainer action: include the whole content object (or a documented exhaustive, fail-closed equivalent); retain this execution-output case as a regression fixture; regenerate affected candidate reports with explicit metadata policy and index/tag/point-of-use checks. Preserve A meanwhile. No shared scanner or existing report was changed by this audit. Issue: `MORROW-SOURCE-001`.

## One raw-ID recapture

The [22:13 staging ledger](../COMMON/tagging_ledgers/2026-09-13-NATHAN-WORDS-Janus-2213-worldtube-transition.md), blob `b8466f897a5fa6fea9a67b6a5f0194c84660349c`, left this UUID unresolved. Direct A/B/C inspection now establishes:

- Message/node UUID: `6fe35c0b-9715-4925-b4a1-00c0f9de44d1`.
- `author.role=user`; `create_time=1788920023.949` (2026-09-08 22:13:43.949 EDT).
- Raw pointer: `mapping["6fe35c0b-9715-4925-b4a1-00c0f9de44d1"].message`.
- Parent: `44124bed-7673-4f4e-9d40-b09417b29ba6`; child: `a4449ba8-1d41-4171-a3d7-cee8d20f13a2`. These are adjacency pointers, not a claim of reading either adjacent message.
- Complete raw message objects agree across A, B and C.
- Tags added: `RAW-ID-RECAPTURED`, `RAW-USER-VERIFIED`, `TASK-TRANSITION`, `PROVENANCE-LANDMARK`. Preserve previous tags and the historical pending record.

Text, with one trailing space retained in the raw JSON:

> Ok. Let's package our convo about operators, all of it, into a package. I've had Ravel set up a workspace where we can get down to business on world tubes.

This is a historical Nathan workflow instruction, not a current authorization to resume theory. The distinct 20:01–20:08 UUID disagreements are **not** resolved by this recapture.

## Reproduction, limits, and next operation

Use [the read-only comparator](compare_conversation_exports.mjs) with the exact A, B and C raw files in that order: `node compare_conversation_exports.mjs A.json B.json C.json`. It reports Git blob hashes, message counts, content and raw-message differences, and branch inclusion. It does not mutate inputs or authorize deduplication. Small checks passed: changed `text` detected by full-content comparison but missed by the old field selection; key-order changes ignored; array order and channel changes retained. The actual three-export comparison also reproduced the tables above.

The [Nathan Direct manifest](../../indexes/nathan-direct/MANIFEST.json) and [README](../../indexes/nathan-direct/README.md) are now accessible (blobs `b5b617aad967ff245a31485759e1de480c1f7f0b` and `1e5463dc9c76763dc080a39f87a423dda4f37f53`). Both were fully read; yearly message shards were not. Their extraction counts remain producer-reported, not independently verified here. A scoped Drive search for `Morrow` returned no results; this is not an all-Drive absence claim.

Next bounded operation: use the [Janus 20:01–22:07 ledger](../COMMON/tagging_ledgers/2026-09-13-NATHAN-WORDS-Janus-2001-to-2207.md) as a map and recapture the disputed 2026-09-08 20:01–20:08 EDT user-message IDs directly, preserving competing old ledger records. Do not extend bulk tagging. All other families' content-superset relationships and broader dialogue continuity remain open. No training completion, theory resumption, canonical promotion, or runtime-identity conclusion is asserted.
