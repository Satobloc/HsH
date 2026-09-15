# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 39, 2026-09-15

## Startup / authority

Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before touching write-capable scripts/shared generated state, also read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control.

The former blanket training standdown is superseded as a hard gate. Direct theory-bearing work/development remains sandbox-limited; quarantine remains hard/off-limits. Mercer owns the reliability layer between raw/tagged material and navigation/retrieval, while remaining free to explore permitted material. Do not silently absorb familiarity-dependent conversation-family causality/context interpretation or the active Nathan-words extraction/tagging lane.

## Epistemic boundary

Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Repository proximity, worker agreement, generated metadata, thematic similarity, clean indexing, or successful automated checks never confer theory correctness or authority.

## Current verified state

### Viewer / manifests

Run 38 closed the transient Viewer/manifest generation split. Settled development manifest generation: `2026-09-15T07:15:03.960820+00:00`; Viewer declares that same development input generation. Development summary: **364 unchanged / 121 skipped / 74 planned / 1 collision** across 560 records. One collision remains; do not declare the historical SAT_CONVOS_15 duplicate disposition resolved until directly established.

Settled Viewer observed in Run 38: **453 conversations**, `development: 439`, `live: 9`, `source_conversations_before_curation: 453`. Inputs: 439 accepted development + 9 accepted live + 6 accepted external = 454 pre-dedup accepted inputs.

Run 39 read `tools/build_conversation_viewer.py` and established the exact accounting contract: accepted development/live/external records are appended, then deduplicated by exact `path`; an existing record is retained unless the later duplicate has `corpus == "live"`. `source_conversations_before_curation` is computed **after this path deduplication**. Therefore 454 accepted inputs → 453 source conversations is expected if one path collision exists and is not evidence of Viewer corruption.

### Validator contract defect — OPEN, source-code established Run 39

`WORKSPACES/MERCER/validate_cross_source_integrity.py` is stale in three related places:

1. `viewer.accepted_input_arithmetic` incorrectly compares the raw sum of accepted inputs directly to the post-dedup `source_conversations_before_curation`.
2. `viewer.manifest_record_reconciliation` excludes every Viewer development/live record whose path appears anywhere in the external registry, even when the manifest record wins the builder's path precedence.
3. `viewer.external_registry_reconciliation` can match by path/corpus/count without establishing whether the external or manifest source actually survived the builder's path deduplication.

This is a validator-contract defect, not a Viewer-integrity finding. Repair must be source-code grounded: identify the exact current colliding path(s), add one regression specimen reproducing manifest+same-path external+distinct externals, then model builder precedence explicitly. Do not weaken unrelated invariants.

### Source-integrity validator / competence harness

Durable implementation:
- `WORKSPACES/MERCER/validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py`
- `.github/workflows/mercer-cross-source-integrity.yml`

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; `BLOCKED` is operational dependency, not corruption. Run 37 confirmed the original regression fixture + frozen six-specimen competence harness green at Actions run `34926821342`, artifact `10379809650`, digest `sha256:edc63c62dbe5b712091a2fb805aaab7ef38bf833772389291fdfa97170f9e0a1`. Those six specimens remain frozen; Run 39 provides a genuinely observed new contract warranting one additional specimen.

### Autotag / Nathan Direct

Last coherent counts: autotag 69,927 records / 21,451 user records; Nathan Direct 14,306 packaged unique + 7,145 collapsed duplicates = 21,451; yearly shards 293 + 306 + 4,801 + 8,906 = 14,306; Stage 2 `source_records = 14306`. Preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. Machine-readable autotag-side generation/freshness lineage remains unconfirmed.

### MORROW-SOURCE-001

Code-side resolved / historical-output-side pending. Comparator hashes the entire content object under its explicit policy and retains the Janus regression case. Preserve the earlier Janus export. `extract_raw_window.py` is only a bounded `content.parts` helper, not a complete-content serializer.

### Historical glossary / standard crosswalk

Source inventory/custody work complete; direct raw-message ancestry remains unresolved for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt`. Runs 16–22 exhausted current phrase-search, Viewer-candidate, and intrinsic-fingerprint routes. Reopen only with a stronger source anchor.

### Durable documentation / role development

`WORKSPACES/COMMON/DURABLE_PROJECT_DOCUMENTATION_CONVENTION.md` established Run 13. Mercer README/CONTINUITY and Viewer documentation reconciled Runs 23–28. `NATHAN_LIVE_THEORY_DEVELOPMENT_LOG.md` has durable September 13 referents; exact raw IDs remain pending attributable export. `PRE_MEETING_REPORT_2026-09-14.md` records tentative role direction **Source Integrity Metrologist**. Safe Morrow inheritance remains deterministic UUID/path/checksum/index reconciliation and machine-readable provenance joins, not contextual causality/dialogue-significance judgments.

## Open dependencies

- `VALIDATOR REPAIR`: exact-path dedup/preference semantics identified Run 39; exact current colliding path(s) + regression specimen + validator repair remain.
- `OWNER ACTION / RECHECK`: development manifest still has 1 collision; historical SAT_CONVOS_15 exact duplicate disposition not established.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `DEPENDENCY`: machine-readable autotag-side generation/freshness lineage.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- `COORDINATION WRITE GAP`: pre-meeting report not appended to heavily shared `CHECKINS.md`; do not unsafe-whole-file replace merely to append.
- No current Nathan-required decision.

## Run history

Runs 1–7 training + scanner defect/repair; 8–12 Viewer path/navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 durable docs reconciliation; 27 corpus-count reconciliation; 28 registered-external semantics; 29 exact duplicate collision; 30 source-integrity systems map; 31 validator contract; 32 Nathan Direct machine bridge; 33 validator implementation + pre-meeting report; 34 production validation + CI; 35 failure-mode harness; 36 harness interface repair; 37 green harness + transient Viewer/manifest split; 38 settled convergence + external accounting change; 39 source-code isolation of exact-path dedup validator-contract defect.

## Last material run

`WORKSPACES/MERCER/RUN_039_2026-09-15.md` records exact Run-39 coverage, source-code findings, limits, and next operation.

## Best next operation

Compare current external registry paths against accepted development/live manifest paths to identify the exact collision(s). Then add one regression specimen reproducing the observed path collision and repair `validate_cross_source_integrity.py` to model `build_conversation_viewer.py` precedence exactly. Run the original frozen specimens plus the new specimen before production validation. If current source state changes first, re-establish the settled input contract before patching.