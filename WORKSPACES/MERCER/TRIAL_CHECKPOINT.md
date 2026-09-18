# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 105, 2026-09-18

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs/check-ins, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before write-capable scripts/shared generated state, read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / normalization / source identity
Last bounded Viewer audit: 453 conversations / 439 development / 9 live. SAT_CONVOS_15 `Cosmological Constant Summary` exact-byte duplicate collision remains the normalization blocker; do not recheck absent relevant source/script/manifest change.

Runs 71–74 specified a minimum additive Viewer relation sidecar with neutral navigation and diagnostic/source-state provenance. Sable review remains OPEN; do not implement shared Viewer schema/workflow without systems/interface review.

Runs 90–96 bounded Viewer reproducibility: one manual external record (Srena) lacks immutable source identity; manual-wins merge semantics do not enrich it; external-only sources cannot currently use local-path partial curation; dormant body-search code provides repository-aware GLASS precedent; wired Viewer is catalog-frozen for metadata but runtime-live for source bytes; historical HsH build inputs are reconstructable through the generated commit parent, while external GLASS build-tree provenance is weaker.

### Extraction / context provenance
Run 97 established that `extract_raw_window.py` selects `context_each_side` by globally timestamp-sorted message-list adjacency, not graph ancestry, while preserving each row's `parent`. Run 98 found one graph-local retained LAB1 window.

Runs 99–101 reproduced graph/chronology divergence in three retained LAB1 positive-context outputs. Run 102 supplied a graph-local visible-window negative control. Run 103 reproduced divergence in non-LAB1 RUSSIA with `context_each_side: 2`, including a timestamp-order inversion. Run 104 reproduced divergence in RAVEL.

**Run 105:** added deterministic read-only classifier `WORKSPACES/MERCER/classify_extraction_context_graph.py` at commit `9f7e4544216b8a8596f828f098c959022b495322`. It reconstructs target-user windows from each retained payload's request plus declared raw `source_path`, rather than treating the unioned `selected` rows as sufficient. For every chronological adjacent pair in each reconstructed window it classifies: `immediate_graph_local`, `timestamp_order_inversion`, `same_branch_non_immediate`, `cross_branch_splice`, or `unresolved`; it reports per-window/per-file/aggregate counts to stdout only and does not rewrite historical extraction outputs. This addresses the whole-segment criterion identified in Runs 100–104. The connector available in this run has repository read/write but no code-execution/workflow-dispatch action, so the classifier was **not executed** and no prevalence figures are claimed. Exact current HsH tree observed before creation: `d5d9995fa08a1c2dbf4da9229c239773d98b6218`; extraction-output directory contained 11 JSON payloads, but positive-context eligibility remains to be measured by the classifier itself.

Classification remains extraction-context provenance/semantics issue, not source corruption. Preserve old outputs; do not overwrite provenance. Keep source-commit/ref provenance audit separate.

### Operational currentness / formalization
Runs 81–85 established proposition-level currentness discipline. Runs 86–89 found `formalization/README.md` advertises an absent `formalization/leancheck/run.ps1`; inspected repository routes found no implementation. Classification: documented-but-unmaterialized; stop probing absent new evidence.

### Raw conversation identity / validator / Nathan Direct
Production v4 identity diagnostic retained: 74 repeated conversation-UUID families / 222 pairwise comparisons = 115 message-ID subset/superset, 56 exact-byte, 36 same-graph metadata-only, 9 same-graph readable-text-divergent, 4 branch/snapshot-divergent, 2 same-graph nontext-unresolved. Among 115 simple subset/superset pairs, recorded update time is later on larger state in 106, tied in 9, later on smaller in 0. This supports monotonic snapshot growth only inside that class; newest/largest/filename end-date/LIVE/shared UUID are not global authority heuristics.

Semantics-aware v2 validator retained; production result 0 FAIL / 1 BLOCKED / 13 PASS, sole blocker known SAT_CONVOS_15 collision. Nathan Direct retained counts: 73,200 input records / 22,758 user records / 15,133 unique packaged Nathan messages + 7,625 collapsed duplicates. `indexes/nathan-direct/MANIFEST.json` still lacks exact scanned-source repository commit/ref; classify as provenance/observability debt, not stale/incorrect-content evidence.

Retained machinery: `validate_cross_source_integrity_v2.py`, `viewer_input_semantics.py`, `test_integrity_failure_modes.py`, `diagnose_viewer_input_dedup.py`, `diagnose_conversation_identity_duplicates_v4.py`, `test_conversation_relation_sidecar_contract.py`, `classify_extraction_context_graph.py`, `.github/workflows/mercer-cross-source-integrity.yml`. Named checks only.

### Other retained state
`MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. Historical glossary/standard crosswalk custody complete but direct raw-message ancestry unresolved; reopen only with stronger source anchor. Historical/manual scanner candidate-report owner/path remains unknown.

## Open dependencies / handoffs
- `EXTRACTION CONTEXT / OWNER-SABLE`: Runs 99–104 reproduce retained graph/chronology divergence across LAB1, RUSSIA, and RAVEL positive-context outputs; Run 105 materialized the read-only whole-window classifier but could not execute it through the available connector. Route eventual prevalence result through extraction/Nathan Words owner or Sable. No Nathan decision currently required.
- `VIEWER / SABLE REVIEW`: Run-71 sidecar proposal remains OPEN; no approval inferred.
- `OWNER ACTION / RECHECK`: SAT_CONVOS_15 duplicate disposition unresolved; recheck only after relevant state change.
- `DORMANT VIEWER BODY SEARCH`: do not activate without intent/interface review.
- `FORMALIZATION ACCESS`: repository routes exhausted; stop probing absent new evidence.
- `IDENTITY ANCESTRY`: authority/disposition unresolved and must not be inferred from chronology/size/LIVE placement.
- `INFRASTRUCTURE`: autotag scanned-source lineage repair remains with Sable/tagging infrastructure.
- No current Nathan-required decision.

## Current frontier
Execute `WORKSPACES/MERCER/classify_extraction_context_graph.py` against a checkout at an exact HsH commit and retain/report prevalence by file, target window, and edge category. Validate the classifier first on the known positive and negative controls from Runs 99–104. Keep extraction source-commit/ref provenance as a separate later bite.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup; 47–51 semantics-aware validator; 52–53 autotag lineage; 54–69 conversation identity; 70 Viewer exposure; 71–74 relation sidecar/spec/harness/handoff; 75 Nathan Direct lineage; 76 normalization; 77–80 routing/front-door; 81–85 operational currentness; 86–89 formalization access; 90–96 Viewer external/runtime/build provenance; 97 extraction-context implementation semantics; 98 first negative retained sample; 99–101 three positive LAB1 branch-splice reproductions; 102 LAB1 graph-local visible-window negative control; 103 non-LAB1 RUSSIA positive reproduction with timestamp-order inversion; 104 RAVEL positive cross-family reproduction; **105 deterministic whole-window classifier materialized, execution pending.**

## Best next operations
1. Execute and validate `classify_extraction_context_graph.py` at an exact HsH source commit; report prevalence without rewriting historical outputs.
2. Route the measured finding through existing Sable/extraction ownership rather than silently redesigning another lane.
3. Audit exact checked-out source commit/ref persistence in extraction payload/run manifests as a separate bite.
4. Re-audit normalization/Viewer/autotag only after relevant state changes.
