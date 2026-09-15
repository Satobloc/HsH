# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 43, 2026-09-15

## Startup / authority

Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before touching write-capable scripts/shared generated state, also read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control.

The former blanket training standdown is superseded as a hard gate. Direct theory-bearing work/development remains sandbox-limited; quarantine remains hard/off-limits. Mercer owns the reliability layer between raw/tagged material and navigation/retrieval, while remaining free to explore permitted material. Do not silently absorb familiarity-dependent conversation-family causality/context interpretation or the active Nathan-words extraction/tagging lane.

## Epistemic boundary

Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Repository proximity, worker agreement, generated metadata, thematic similarity, clean indexing, or successful automated checks never confer theory correctness or authority.

## Current verified state

### Viewer / manifests

Settled development manifest generation: `2026-09-15T07:15:03.960820+00:00`; Viewer declares that same development input generation. Development summary: **364 unchanged / 121 skipped / 74 planned / 1 collision** across 560 records. One collision remains; do not declare the historical SAT_CONVOS_15 duplicate disposition resolved until directly established.

Settled Viewer: **453 conversations**, `development: 439`, `live: 9`, `source_conversations_before_curation: 453`. Viewer input metadata declares 439 accepted development + 9 accepted live + 6 accepted external = 454.

Run 43 establishes that the earlier working explanation `454 accepted -> 453 after one exact-path dedup` is not supported by reconstruction. Retained diagnostic from Actions run `34960203633` reports **no duplicate paths**, reconstructs **453 accepted total and 453 post-dedup total**, while Viewer input metadata declares 454. The discrepancy is upstream of deduplication.

Development-manifest status arithmetic supplies the one-record location: `364 unchanged + 74 planned = 438` accepted development records under current builder status rules; live contributes 9 and discovered external contributes 6, yielding `438 + 9 + 6 = 453`. Viewer input metadata nevertheless says `accepted_json_conversations: 439` for development. Viewer catalog `development: 439` is a separate dimension because one discovered-external record itself declares corpus `development`.

Current `tools/build_conversation_viewer.py` and `diagnose_viewer_input_dedup.py` agree on excluding `skipped`, `collision`, and `blocked`. Do not infer the historical cause of the stale/incorrect `439` input count until commit-level generation provenance is reconstructed.

### Validator contract defect — OPEN

`WORKSPACES/MERCER/validate_cross_source_integrity.py` remains stale in these areas:
1. `viewer.accepted_input_arithmetic` compares Viewer-declared accepted-input sum directly to post-dedup `source_conversations_before_curation` rather than independently reconstructing acceptance from the declared source inputs.
2. `viewer.manifest_record_reconciliation` excludes Viewer records by external-path presence without establishing survivor provenance.
3. `viewer.external_registry_reconciliation` does not establish survivor provenance after path deduplication.
4. Validator hardcodes `CONVERSATION_VIEWER/EXTERNAL_CONVERSATIONS.json`, while current Viewer consumed `CONVERSATION_VIEWER/data/discovered_external_conversations.json` (1 manual + 5 structurally discovered public cross-repo records).

Run 43 production artifact `10392707034` has digest `sha256:6d1226df87aaa57836e41227df6c263a78b463a9fee3c692751f1eed378b16dd`. Production validator result is `FAIL` only at `viewer.accepted_input_arithmetic`, with the development-manifest collision separately `BLOCKED`; 11 other checks pass.

The seventh competence specimen should now encode the **observed declared-acceptance drift with zero path duplicates**, not a synthetic duplicate-path case. Freeze that before repairing the validator.

### Source-integrity machinery

Durable implementation:
- `WORKSPACES/MERCER/validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py`
- `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`
- `.github/workflows/mercer-cross-source-integrity.yml`

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; `BLOCKED` is operational dependency, not corruption. Original regression fixture + frozen six-specimen competence harness remain green. Do not weaken those six when adding specimen seven.

### Nathan Direct / autotag

Run-43 production artifact records current Nathan Direct arithmetic at **15,133 packaged unique + 7,625 collapsed duplicates = 22,758 input user records**. Year shards sum to 15,133 (`293 + 306 + 5,467 + 9,067`), and Stage-2 `source_records = 15133`. Preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. Machine-readable autotag-side generation/freshness lineage remains unconfirmed.

### MORROW-SOURCE-001

Code-side resolved / historical-output-side pending. Comparator hashes the entire content object under its explicit policy and retains the Janus regression case. Preserve the earlier Janus export. `extract_raw_window.py` is only a bounded `content.parts` helper, not a complete-content serializer.

### Historical glossary / standard crosswalk

Source inventory/custody work complete; direct raw-message ancestry remains unresolved for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt`. Runs 16–22 exhausted current phrase-search, Viewer-candidate, and intrinsic-fingerprint routes. Reopen only with a stronger source anchor.

### Durable documentation / role development

`WORKSPACES/COMMON/DURABLE_PROJECT_DOCUMENTATION_CONVENTION.md` established Run 13. Mercer README/CONTINUITY and Viewer documentation reconciled Runs 23–28. `NATHAN_LIVE_THEORY_DEVELOPMENT_LOG.md` has durable September 13 referents; exact raw IDs remain pending attributable export. `PRE_MEETING_REPORT_2026-09-14.md` records tentative role direction **Source Integrity Metrologist**. Safe Morrow inheritance remains deterministic UUID/path/checksum/index reconciliation and machine-readable provenance joins, not contextual causality/dialogue-significance judgments.

## Open dependencies

- `VALIDATOR REPAIR`: exact observed failure is now captured: Viewer declares 454 accepted, source reconstruction yields 453, no duplicate paths. Seventh specimen + generation-history provenance + coherent validator repair remain.
- `OWNER ACTION / RECHECK`: development manifest still has 1 collision; historical SAT_CONVOS_15 exact duplicate disposition not established.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `DEPENDENCY`: machine-readable autotag-side generation/freshness lineage.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- `COORDINATION WRITE GAP`: pre-meeting report not appended to heavily shared `CHECKINS.md`; do not unsafe-whole-file replace merely to append.
- No current Nathan-required decision.

## Run history

Runs 1–7 training + scanner defect/repair; 8–12 Viewer path/navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 durable docs reconciliation; 27 corpus-count reconciliation; 28 registered-external semantics; 29 exact duplicate collision; 30 source-integrity systems map; 31 validator contract; 32 Nathan Direct machine bridge; 33 validator implementation + pre-meeting report; 34 production validation + CI; 35 failure-mode harness; 36 harness interface repair; 37 green harness + transient Viewer/manifest split; 38 settled convergence + external accounting change; 39–40 initial dedup/external-lineage diagnosis; 41 diagnostic instrumentation; 42 failure-output observability repair; **43 retained diagnostic falsified the path-dedup explanation and localized the discrepancy to development accepted-input metadata**.

## Last material run

`WORKSPACES/MERCER/RUN_043_2026-09-15.md` records exact Run-43 coverage, retained diagnostic, revised interpretation, limits, and next operation.

## Best next operations

1. Add specimen seven reproducing Viewer-declared development acceptance `439` versus source-reconstructed `438`, with zero path duplicates and internally consistent post-reconstruction cardinality.
2. Reconstruct the Viewer generation commit/history enough to identify why the declared development acceptance diverged from the referenced manifest under current builder rules; distinguish older generator behavior, stale/generated publish transaction, or another deterministic source.
3. Only then repair `validate_cross_source_integrity.py` to separate source-input acceptance reconciliation, post-dedup cardinality, survivor provenance, and catalog corpus counts. Run frozen six + specimen seven before production validation.
4. Keep the SAT_CONVOS_15 collision as a separate `BLOCKED` dependency.
