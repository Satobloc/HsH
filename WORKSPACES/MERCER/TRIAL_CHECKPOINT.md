# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 46, 2026-09-15

## Startup / authority

Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before touching write-capable scripts/shared generated state, also read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control.

Direct theory-bearing work/development remains sandbox-limited; quarantine remains hard/off-limits. Mercer owns the reliability layer between raw/tagged material and navigation/retrieval, while remaining free to explore permitted material.

## Epistemic boundary

Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Repository proximity, generated metadata, clean indexing, or successful automated checks never confer theory correctness or authority.

## Current verified state

### Viewer / manifest / dedup — Run 46 exact reconstruction

Settled generation audited by the retained Run-45/46 integrity artifact uses development summary **364 unchanged / 121 skipped / 74 planned / 1 collision** across 560 records. Viewer records **453 conversations**, while declared accepted inputs are 439 development + 9 live + 6 external = **454**.

Production navigation uses `tools/build_conversation_viewer_resolved.py`. Existing supported `new_path` is preferred over `old_path`; `collision`/`blocked` are rename-operation statuses and do not by themselves make an existing source Viewer-ineligible.

The repaired diagnostic executed successfully in Mercer integrity run `34977962790` on commit `4ec472ff2e78724a0cf8e9981af7e9c35863666a`. Retained artifact `10399888652` has digest `sha256:4f78f568ff2ed9cee9ab26a90810ce0af2d4b84fa9612923eeff2116f2df5c40`.

Exact result under `production-resolved-existing-source-v1`:
- reconstructed accepted inputs = **454**;
- reconstructed post-dedup records = **453**;
- exactly **one duplicate path**:
  `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_15/26.06.22•26.09.12•Cosmological Constant Summary — raw.json`;
- manifest source index **253**: `unchanged`, old/new already the dated path, 55 messages;
- manifest source index **257**: `collision`, old path undated, new path dated, resolves from existing `new_path`, 55 messages;
- winner = source index **253**, the earlier unchanged record. The later collision record does not replace it because it is not `live`.

Thus Viewer metadata/cardinality is coherent under the production resolved-builder contract. Viewer-safe dedup does **not** disposition the underlying archive duplicate or clear the normalization blocker.

Both SAT_CONVOS_15 source files were independently confirmed on current `main` in Run 45 with identical blob SHA `40dd17e8d6114d65f54e5712ff8ee4e5fc3812a0`.

### Validator contract defect — OPEN, now fully localized

`WORKSPACES/MERCER/validate_cross_source_integrity.py` still reports `viewer.accepted_input_arithmetic` FAIL because it compares pre-dedup accepted total **454** directly with post-dedup `source_conversations_before_curation` **453**. In the retained artifact, the separate manifest collision is correctly `BLOCKED` and all other reported checks pass.

Needed coherent repair:
1. reconstruct accepted manifest records using production resolved existence semantics;
2. follow the Viewer-declared external input (`data/discovered_external_conversations.json` currently), not only the manual registry;
3. separate pre-dedup accepted cardinality from post-dedup source cardinality;
4. replay exact-path winner precedence and survivor provenance;
5. keep manifest normalization blockers independently `BLOCKED`.

Specimen seven is frozen as the resolved collision + dedup case. Flip it to expected PASS only after validator repair; original six specimens remain unchanged.

### Source-integrity machinery

- `WORKSPACES/MERCER/validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py`
- `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`
- `.github/workflows/mercer-cross-source-integrity.yml`

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; `BLOCKED` is operational dependency, not corruption.

### Other retained state

Nathan Direct: **15,133 packaged unique + 7,625 collapsed duplicates = 22,758 input user records**; year shards sum to 15,133 and Stage-2 `source_records = 15133`. Preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. Machine-readable autotag generation/freshness lineage remains unconfirmed.

`MORROW-SOURCE-001`: code-side resolved / historical-output-side pending. Preserve earlier Janus export. `extract_raw_window.py` is a bounded `content.parts` helper, not a complete-content serializer.

Historical glossary / standard crosswalk: source inventory/custody work complete; direct raw-message ancestry remains unresolved for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt`. Reopen only with a stronger source anchor.

## Open dependencies

- `VALIDATOR REPAIR`: implement the confirmed production-resolved acceptance + dedup + survivor-provenance contract and Viewer-declared external-input following.
- `OWNER ACTION / RECHECK`: development manifest still has 1 collision; SAT_CONVOS_15 duplicate disposition is not resolved merely because Viewer safely deduplicates it.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `DEPENDENCY`: machine-readable autotag-side generation/freshness lineage.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- No current Nathan-required decision.

## Run history

Runs 1–7 training + scanner defect/repair; 8–12 Viewer path/navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 durable docs reconciliation; 27 corpus-count reconciliation; 28 registered-external semantics; 29 exact duplicate collision; 30 source-integrity systems map; 31 validator contract; 32 Nathan Direct machine bridge; 33 validator implementation + pre-meeting report; 34 production validation + CI; 35 failure-mode harness; 36 harness interface repair; 37 green harness + transient Viewer/manifest split; 38 settled convergence + external accounting change; 39–40 initial dedup/external-lineage diagnosis; 41 diagnostic instrumentation; 42 failure-output observability repair; 43 apparent discrepancy under incomplete base-builder semantics; 44 production-wrapper reconstruction + specimen-seven correction; 45 repaired diagnostic to production resolved semantics; **46 retrieved the successful retained diagnostic and identified the exact 454→453 duplicate path, both manifest antecedents, and the unchanged-record winner provenance.**

## Last material run

Run 46: read controlling startup/safety surfaces; retrieved integrity run `34977962790` artifact `10399888652`; confirmed exactly one post-acceptance duplicate path and winner; localized the remaining validator FAIL to pre-vs-post-dedup arithmetic; recorded durable run note `WORKSPACES/MERCER/RUN_046_2026-09-15.md`. No conversation identity altered.

## Best next operations

1. Repair `validate_cross_source_integrity.py` to model production-resolved acceptance, Viewer-declared external input, pre/post-dedup cardinality, and survivor provenance.
2. Flip specimen seven to expected PASS only after that repair; rerun all seven specimens plus production validation.
3. Keep SAT_CONVOS_15 normalization collision separately `BLOCKED` until provenance-preserving duplicate disposition is established.
