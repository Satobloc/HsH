# Optional P1 source-QC context | Ravel to Orson

**Sender run key:** `REVROT3-19-20261011:573:s2`  
**Sender label:** Ravel, ring index 17.  
**Recipient target:** `REVROT3-19-20261011:577:s2`, Orson Vay, ring index 18, nominal `2026-11-04T01:24:00Z`.  
**Status:** `LATE_OPTIONAL_CONTEXT_ONLY`  
**Scope:** source-QC and denominator/identity cautions only. No task, ownership transfer, response obligation, P1 reassignment, or claim of chat delivery.

## Why this targets the next Orson appearance

The nominal Orson slot `h573:s3` at 2026-11-03T21:36Z failed at 21:41:51Z with `chat_ref=null`. Its automation record still displays the older Morrow result. No authenticated Orson activation, consumption, or acknowledgment is established. This packet is therefore retained for Orson's next deterministic ring appearance, `h577:s2`, rather than presented as delivered to the failed slot.

The existing Ravel `h569:s3` packet and its earlier inbox pointer remain intact. This packet adds later Morrow/Kestrel source-QC context and does not replace or duplicate that earlier work.

## 1. Kestrel: complete-case mask and partition identifiability

Source report: `WORKSPACES/KESTREL/2026-11-03T2048Z_REVIEW_MIND_COMPLETE_CASE_MASK_AND_PARTITION_IDENTIFIABILITY.md`  
Blob: `70d27a51ea3ce9412f1df42bf59f4b0bd94ebe57`.

The pinned replayer defines the pair-question complete-case set by excluding a pair whenever either endpoint model has an initial or final label exactly equal to `unclear`. `cannot_determine` is a separate normalized label. The source report records 17 models and 1,150 aligned questions:

- Possible pair-question slots: `1,150 × choose(17,2) = 156,400`.
- Eligible: 137,911.
- Excluded: 18,489.
- Independent arithmetic check: 137,911 + 18,489 = 156,400; eligible 88.18%, excluded 11.82%.
- Aggregate initial agreements: 102,797; final agreements: 102,881. The net difference is +84, descriptive only, not a causal revision effect.
- The separate 18,331 peer-majority count is a model-question denominator, not the pair-question denominator.

The aggregate pair count does not identify which model pairs agree. The full identity-labelled pair relation can identify the partition of the observed model identities; neither scalar counts nor the retrospective leave-one-out majority establish actual peer exposure, causal influence, source independence, or cross-model interaction.

## 2. Kestrel Lean status caveat

Kestrel PR #873 is open/draft. Its report records two generic modules replaying successfully on merge ref `c4a32c5b0e1a0ffa7e288138cdfb5454fcecc2f3` in Actions run #41690832586, but the full PR build failed with unsolved goals and `sorryAx` at `KestrelMovingSlice.lean` lines 114 and 125.

The reported PR base was `61cc8b65ffed70296e0121dbae067892a79c81d4`. The current `infra/lean4-verification-20261023` branch is `c7dc2c483f50ae03fc7a7c530829170135e18d92`, four commits ahead of that base. The successful two-module replay is therefore not current-base integration, and the full PR remains failed. No dataset-specific Lean instantiation was compiled.

## 3. Morrow: source-path count is not independent-source count

Source report: `WORKSPACES/MORROW/2026-11-03T2036Z_MERSEARCH_SOURCE_COVERAGE_AND_DEDUP_AUDIT.md`  
Blob: `0b82d7213ac4bc067610ecc3aee229bfdb8b23fd`.

The completed Mersearch request reports 16,884 files, 21,032,761 records, 68 hits, and 21 distinct source paths. The selected paths include exact same-blob mirrors and versioned snapshots of the same conversations. In particular, the raw `SAT theory clarification` conversation is mirrored in HsH and the SAT archive with the same blob SHA `507a7000082415373ee98dbc95f18a991dff3c5a`; it is one raw conversation, not two independent witnesses. The compact receipt withholds full search results, so this is not a claim that all 68 hits or all 21 paths were independently inspected here.

The useful P1 methods caution is to distinguish matching paths, unique raw blobs, unique conversation IDs, unique message UUIDs, and transcript/compiled-document hits. Path count is not source-independence count.

## 4. P1 boundary and protected ownership

The current Orson P1 protocol freeze remains the controlling scope: a methods/archival paper about shared-evaluator dependence and within-model self-revision. The archived ConsistencyBench peer-majority calculation is retrospective leave-one-out analysis, not an observed cross-model communication channel. No new LLM trial or cross-model peer-deliberation claim is authorized by these source-QC notes.

The user's standing instruction to protect approximately four-fifths of Orson's genuine LLM-cognition work remains intact. The Kestrel and Morrow reports are optional context only. Orson owns any decision to use, ignore, or defer them.

The current documented Mersearch lane 3 request is `orson-cognition-origin-bank-20261103-1745`, still `requested`. Do not overwrite it, duplicate it, or treat it as completed. P1 issue #564 remains open / source-experiment readiness; no paper gate advances from this packet.

## 5. Source-backed regeneration prompt if a fresh Orson thread is needed

You are a new assistant execution for the Orson Vay specialist lane, not the historical Orson instance or thread. First read the live Orson role charter, P1 protocol freeze, issue #564, current task graph, Mersearch lane 3 request, and latest receipts. Preserve P1 as a methods/archival analysis of shared-evaluator dependence and within-model self-revision. Do not infer cross-model peer interaction from retrospective peer-majority calculations. Do not conduct a new LLM trial or make human-subject claims. Protect the user's standing instruction that roughly four-fifths of Orson's genuine cognition work remains with Orson. Treat the Kestrel and Morrow reports linked above as optional source-QC context only. Do not inherit another worker's lane, alter tasks/branches/PRs, or advance the November 9 paper gate without the required primary sources, independent review, readable PDF/reader, and explicit epistemic status.

## Delivery boundary

This is a repository-only optional handoff pointer. `github_inbox_delivery` is verified only after the inbox append/readback below. `chat_delivery`, recipient consumption, and acknowledgment are not claimed.


## Scheduler recheck

A later scheduler read showed the same nominal :36 run ID `78bf6a57-8db0-8331-a3c7-ddf91de3307b` first recorded as failed at 21:41:51Z, then reopened/restarted under the same ID at 21:44:05Z with `recorded_status=in_progress` and `chat_ref=null`. The displayed `latest_result` remains the older Morrow report. This is retained as a scheduler-record inconsistency/retry, not interpreted as two distinct runs or evidence of Orson-thread authentication, consumption, or acknowledgment. The packet remains optional context for the next deterministic Orson appearance `h577:s2` at 2026-11-04T01:24Z.
