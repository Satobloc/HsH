# Cross-source integrity validator feasibility audit

**Date:** 2026-09-14  
**Worker:** Mercer  
**Scope:** source/index/retrieval QA under the active theory-bearing standdown. No theory synthesis or source-content promotion.

## Conclusion

A useful v0 integrity validator is feasible without creating a parallel parser stack. Existing generated surfaces already expose enough metadata to validate several high-value cross-surface invariants mechanically. The correct first implementation is a thin join/check layer over those surfaces, with explicit `PASS/WARN/BLOCKED/UNKNOWN` results and no source mutation.

## Existing machine-readable inputs verified in this run

### 1. Development conversation date manifest

`indexes/manifests/development-conversation-dates.json`

Verified fields:

- `generated_at_utc`
- root + timezone + mode
- summary counts by status
- per-record `old_path`, `new_path`, `start_local`, `end_local`, `timestamp_source`, `message_count`, `status`, `warnings`

This is sufficient for path/status/count normalization checks. It does **not** contain Git blob SHA or raw conversation ID, so byte identity and stable-ID checks require a repository/file lookup or another existing metadata source.

### 2. Viewer catalog

`CONVERSATION_VIEWER/data/conversations.json`

Verified fields:

- `source_state_at_utc`
- repository + branch
- top-level conversation/corpus counts
- explicit input records with manifest path, status, record count, accepted count, and source generation timestamp
- per-conversation path, corpus, start/end time, message count, timestamp source, warnings, raw/GitHub URLs
- registered-external input is separately typed

This is sufficient to validate Viewer lineage arithmetic, source-manifest freshness relations, and path/message-count consistency for accepted conversation records.

### 3. Autotag summary

`indexes/autotag/AUTOTAG_SUMMARY.md`

The current artifact is human-readable Markdown rather than a small normalized manifest. It exposes corpus totals and bucket counts, but a validator should avoid brittle prose scraping if a machine-readable autotag output already exists elsewhere. For v0, these totals can remain an optional/manual invariant unless a stable JSON/JSONL summary path is confirmed.

### 4. Nathan Direct Stage 2 manifest

`indexes/nathan-direct/stage2/MANIFEST.json`

Verified fields:

- generator path
- source glob
- `source_records`
- queue counts
- explicit purpose/boundary metadata

This supports count continuity checks against the upstream Nathan Direct package once the upstream machine-readable count surface is identified.

## v0 checks that can be implemented now

1. **Viewer-input freshness join**
   - For each Viewer manifest input, resolve the referenced manifest.
   - Compare Viewer `source_generated_at_utc` to manifest `generated_at_utc`.
   - `PASS` on exact match; `WARN` if Viewer is older; `UNKNOWN` if either marker is absent.

2. **Viewer accepted-count arithmetic**
   - Sum accepted development/live manifest counts plus registered external accepted records.
   - Compare against Viewer top-level counts using each resulting conversation's declared corpus semantics.
   - Emit a mismatch without trying to infer cause.

3. **Viewer path/message-count reconciliation**
   - Join Viewer conversation path to a successful/accepted manifest record by normalized path.
   - Compare `message_count`, start/end timestamps, and timestamp source where both surfaces expose them.
   - External records remain separately typed and should not be forced through a development/live-manifest join.

4. **Manifest blocker classification**
   - Count `collision`, `blocked`, `skipped`, `unchanged` directly from records and compare to manifest summary.
   - Distinguish `blocked` from missing/unparseable source.
   - Preserve all warnings verbatim in validator output.

5. **Stage-2 queue arithmetic**
   - Sum queue counts and compare with `source_records` only where queue semantics are supposed to partition the source. Current queues overlap conceptually, so the validator must **not** assume they partition unless the generator contract states that. The safe invariant is only that `source_records` matches the upstream package count.

## Checks that need one additional metadata bridge

1. **Blob SHA / byte identity** — manifests do not currently carry Git blob SHA. A repository-tree lookup can provide it, but that should be a distinct adapter, not folded into conversation parsing.
2. **Stable raw conversation ID** — development manifest records do not expose conversation ID. Use an existing raw-source metadata index if one exists; otherwise mark stable-ID join `UNKNOWN` rather than reparsing all files in v0.
3. **Autotag → Nathan Direct machine count continuity** — current verified totals close, but the easiest public surface inspected here is Markdown. Prefer an existing JSON/JSONL metadata summary if available before automating this check.
4. **PDF/extraction parentage** — defer until explicit parent-source/checksum fields are confirmed in the PDF lane; filename similarity is not enough.

## Proposed v0 record/result schema

Each check result should contain:

- `check_id`
- `severity`: `PASS | WARN | BLOCKED | FAIL | UNKNOWN`
- `subject_path` or stable source key
- `left_surface` / `right_surface`
- compared field names and values
- source-state timestamps where relevant
- warning/dependency text
- no inferred authorship, authority, or theory status

The validator itself should be read-only and deterministic. It should emit JSON plus a compact Markdown summary. It should not rename, delete, regenerate, or repair sources automatically.

## Permanent regression specimens to encode

- Janus non-`parts` content-shape truncation (`MORROW-SOURCE-001`) — complete-content equality must not be inferred from partial serialization.
- Viewer historical LIVE path drift — generated path must resolve to actual source or explicit derived copy.
- legal/privacy source removal — source-driven corpus count reduction must not be classified as indexing loss.
- SAT_CONVOS_15 exact duplicate collision — one collision can legitimately produce many `blocked` normalization records.
- registered-external Viewer record — top-level corpus counts need not equal development/live manifest acceptance totals alone.

## Implementation recommendation

Build one small validator around **adapters to existing metadata surfaces**, not a new archive crawler:

- adapter: date manifests
- adapter: Viewer catalog + external registry
- adapter: Nathan Direct machine counts
- optional adapter: repository tree/blob metadata

The initial success criterion is modest: reproduce the already-audited Viewer arithmetic/freshness relations and current development-manifest blocker classification from generated metadata alone, with zero raw-source mutation and zero semantic/theory inference.

## Current blocker status

No Nathan decision is required. The v0 design can proceed under existing source-integrity authority. The open SAT_CONVOS_15 duplicate disposition remains an owner action; this validator should report it, not decide it.