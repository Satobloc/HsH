# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 44, 2026-09-15

## Startup / authority

Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before touching write-capable scripts/shared generated state, also read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control.

The former blanket training standdown is superseded as a hard gate. Direct theory-bearing work/development remains sandbox-limited; quarantine remains hard/off-limits. Mercer owns the reliability layer between raw/tagged material and navigation/retrieval, while remaining free to explore permitted material.

## Epistemic boundary

Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Repository proximity, generated metadata, clean indexing, or successful automated checks never confer theory correctness or authority.

## Current verified state

### Viewer / manifests — Run 44 correction

Current generation is `2026-09-15T12:44:12.190935+00:00`; Viewer records that exact development-manifest generation. Development summary remains **364 unchanged / 121 skipped / 74 planned / 1 collision** across 560 records. Viewer remains **453 conversations**, `development: 439`, `live: 9`, `source_conversations_before_curation: 453`, while input metadata declares 439 development + 9 live + 6 external = 454.

**Important correction to Runs 41–43:** the production navigation workflow does not call `tools/build_conversation_viewer.py` directly. It calls `tools/build_conversation_viewer_resolved.py`. That wrapper deliberately treats `collision`/`blocked` as rename-operation statuses rather than Viewer ineligibility when a supported source path actually exists. It substitutes `existing_source_normalize_record`, which changes collision/blocked to unchanged for Viewer normalization. Therefore the current development acceptance is correctly reconstructed as `364 unchanged + 74 planned + 1 existing collision = 439`, not 438.

The wrapper also resolves `new_path` first when it exists, then `old_path`. In the known SAT_CONVOS_15 collision, the collision record can therefore normalize to the already represented dated target path. This restores the earlier structural explanation: **454 accepted input records can legitimately collapse to 453 post-dedup source conversations through one exact-path duplicate**. The Run-41 diagnostic was incomplete because it modeled the base builder's status exclusion rather than the resolved wrapper used in production.

Do not describe the Viewer input metadata as stale/incorrect on the present evidence. The generated state is internally explainable under the actual production wrapper.

### Validator contract defect — OPEN, now better localized

`WORKSPACES/MERCER/validate_cross_source_integrity.py` remains stale because it models base-manifest semantics rather than the production resolved-builder contract and hardcodes the manual external registry. Needed repair:
1. reconstruct accepted manifest records using production resolved semantics, including existing-source collision/blocked eligibility and `new_path`-then-`old_path` existence precedence;
2. separate pre-dedup accepted-input cardinality from post-dedup `source_conversations_before_curation`;
3. replay exact-path winner precedence and establish survivor provenance;
4. follow the Viewer-declared external input (`data/discovered_external_conversations.json` currently) rather than hardcoding `EXTERNAL_CONVERSATIONS.json`;
5. keep manifest normalization blockers separately `BLOCKED`; Viewer eligibility does not resolve rename disposition.

Specimen seven is now frozen in `test_integrity_failure_modes.py` as the **resolved collision + dedup current-defect** case. It intentionally records the current validator's arithmetic FAIL until the coherent validator repair; the original six specimens remain unchanged. Initial incorrect Run-44 specimen commit `190f574...` was immediately superseded by corrected commit `95a6b0e22c66a42e370bd83ba24fbc15463bc681` after production-wrapper reconstruction.

### Source-integrity machinery

Durable implementation:
- `WORKSPACES/MERCER/validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py`
- `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`
- `.github/workflows/mercer-cross-source-integrity.yml`

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; `BLOCKED` is operational dependency, not corruption.

### Nathan Direct / autotag

Last production artifact records Nathan Direct arithmetic at **15,133 packaged unique + 7,625 collapsed duplicates = 22,758 input user records**. Year shards sum to 15,133 (`293 + 306 + 5,467 + 9,067`), and Stage-2 `source_records = 15133`. Preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. Machine-readable autotag-side generation/freshness lineage remains unconfirmed.

### MORROW-SOURCE-001

Code-side resolved / historical-output-side pending. Preserve the earlier Janus export. `extract_raw_window.py` is only a bounded `content.parts` helper, not a complete-content serializer.

### Historical glossary / standard crosswalk

Source inventory/custody work complete; direct raw-message ancestry remains unresolved for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt`. Runs 16–22 exhausted current phrase-search, Viewer-candidate, and intrinsic-fingerprint routes. Reopen only with a stronger source anchor.

## Open dependencies

- `VALIDATOR REPAIR`: production resolved-wrapper semantics are now identified; implement acceptance + dedup + survivor-provenance reconstruction and discovered-external input following.
- `OWNER ACTION / RECHECK`: development manifest still has 1 collision; historical SAT_CONVOS_15 duplicate disposition is not resolved merely because Viewer can safely represent it.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `DEPENDENCY`: machine-readable autotag-side generation/freshness lineage.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- No current Nathan-required decision.

## Run history

Runs 1–7 training + scanner defect/repair; 8–12 Viewer path/navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 durable docs reconciliation; 27 corpus-count reconciliation; 28 registered-external semantics; 29 exact duplicate collision; 30 source-integrity systems map; 31 validator contract; 32 Nathan Direct machine bridge; 33 validator implementation + pre-meeting report; 34 production validation + CI; 35 failure-mode harness; 36 harness interface repair; 37 green harness + transient Viewer/manifest split; 38 settled convergence + external accounting change; 39–40 initial dedup/external-lineage diagnosis; 41 diagnostic instrumentation; 42 failure-output observability repair; 43 diagnostic localized an apparent acceptance discrepancy under incomplete base-builder semantics; **44 reconstructed the actual production resolved wrapper, corrected Runs 41–43 interpretation, and froze specimen seven around the real collision/dedup contract.**

## Last material run

Run 44: read production workflow and `build_conversation_viewer_resolved.py`; established that collision/blocked rename statuses do not hide valid existing Viewer sources; corrected the acceptance arithmetic and specimen seven. No conversation identity altered.

## Best next operations

1. Repair `diagnose_viewer_input_dedup.py` first so it imports/replays `build_conversation_viewer_resolved.py` semantics rather than base-builder status rules; use it to explicitly identify the current duplicate path and winner provenance.
2. Then repair `validate_cross_source_integrity.py` to model resolved acceptance, pre/post-dedup cardinality, survivor provenance, and Viewer-declared external input.
3. Flip specimen seven from documenting the current validator defect to expected PASS only when the repaired validator reproduces the production contract; rerun all seven plus production validation.
4. Keep the SAT_CONVOS_15 collision separately `BLOCKED` until provenance-preserving duplicate disposition is actually established.
