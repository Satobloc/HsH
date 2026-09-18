# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 109, 2026-09-18

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs/check-ins, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before write-capable scripts/shared generated state, read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / normalization / source identity
Last bounded Viewer audit: 453 conversations / 439 development / 9 live. SAT_CONVOS_15 `Cosmological Constant Summary` exact-byte duplicate collision remains the normalization blocker; do not recheck absent relevant source/script/manifest change.

Runs 71–74 specified a minimum additive Viewer relation sidecar with neutral navigation and diagnostic/source-state provenance. Sable review remains OPEN; do not implement shared Viewer schema/workflow without systems/interface review.

Runs 90–96 bounded Viewer reproducibility: one manual external record (Srena) lacks immutable source identity; manual-wins merge semantics do not enrich it; external-only sources cannot currently use local-path partial curation; dormant body-search code provides repository-aware GLASS precedent; wired Viewer is catalog-frozen for metadata but runtime-live for source bytes; historical HsH build inputs are reconstructable through the generated commit parent, while external GLASS build-tree provenance is weaker.

### Extraction / context + run provenance
Run 97 established that `extract_raw_window.py` selects `context_each_side` by globally timestamp-sorted message-list adjacency, not graph ancestry, while preserving each row's `parent`. Run 98 found one graph-local retained LAB1 window. Runs 99–101 reproduced graph/chronology divergence in three retained LAB1 positive-context outputs. Run 102 supplied a graph-local visible-window negative control. Run 103 reproduced divergence in non-LAB1 RUSSIA with `context_each_side: 2`, including a timestamp-order inversion. Run 104 reproduced divergence in RAVEL.

Run 105 added deterministic read-only classifier `WORKSPACES/MERCER/classify_extraction_context_graph.py`. It reconstructs target-user windows from each retained payload's request plus declared raw `source_path` and classifies chronological adjacent pairs as `immediate_graph_local`, `timestamp_order_inversion`, `same_branch_non_immediate`, `cross_branch_splice`, or `unresolved`. Execution remains pending because the available connector cannot materialize/read the required large raw-source checkout content for local execution; no prevalence figures are claimed.

Run 106 audited extraction source-tree/tool provenance and workflow publication safety. Historical extraction path provenance exists, but immutable repository-state provenance is incomplete: payloads preserve `request.source_path`, conversation/message ancestry fields and selection metadata, but not checked-out HsH SHA/ref, source blob SHA, extractor blob/version, workflow-run identity, or generated artifact hash. The workflow checks out moving `main` and does not persist `git rev-parse HEAD`; it also commits/pushes extraction outputs without the current execution standard's fresh-base publication reconciliation. Classification: provenance/observability + unattended-write infrastructure debt, not evidence that historical outputs are stale/corrupt/wrong.

Run 107 added the durable minimal patch specification `WORKSPACES/MERCER/RUN_107_2026-09-18.md`, routing exact checked-out HsH commit, raw-source blob identity, extractor blob identity, request/run identity, generated-artifact hash/manifest, and fresh-base non-force publication/retry discipline to Sable/infrastructure without locally changing shared workflow semantics.

Run 108 audited the classifier against the extractor's request-default semantics and found a fidelity defect: `extract_raw_window.py` defaults omitted `context_each_side` to `1`, while the classifier defaulted it to `0`. Repaired classifier default to `1`; code commit `101ebcb0f5bb772a4793a741e7711a5ca273ca79`. This establishes source-level semantic alignment only, not prevalence.

**Run 109:** inspected `meridian_ontology_math_check_opening_20260916.json` as a non-LAB1 negative control. Its request explicitly sets `context_each_side: 1`; the inspected visible opening sequence is graph-local, with each successor after the first recording the preceding visible node as parent. The first visible row's parent lies outside the retained prefix; boundary-missing ancestry alone is not a demonstrated splice and should remain distinct from incompatible internal adjacency. Durable record: `WORKSPACES/MERCER/RUN_109_2026-09-18.md` (creation commit `33f7be1a1bc2c4f38c2e04a4fa7a4fe2382977e5`). This does not classify the whole file or establish prevalence.

Preserve old extraction outputs; do not overwrite provenance. Keep context semantics and source-tree provenance as distinct QA dimensions.

### Operational currentness / formalization
Runs 81–85 established proposition-level currentness discipline. Runs 86–89 found `formalization/README.md` advertises an absent `formalization/leancheck/run.ps1`; inspected repository routes found no implementation. Classification: documented-but-unmaterialized; stop probing absent new evidence.

### Raw conversation identity / validator / Nathan Direct
Production v4 identity diagnostic retained: 74 repeated conversation-UUID families / 222 pairwise comparisons = 115 message-ID subset/superset, 56 exact-byte, 36 same-graph metadata-only, 9 same-graph readable-text-divergent, 4 branch/snapshot-divergent, 2 same-graph nontext-unresolved. Among 115 simple subset/superset pairs, recorded update time is later on larger state in 106, tied in 9, later on smaller in 0. This supports monotonic snapshot growth only inside that class; newest/largest/filename end-date/LIVE/shared UUID are not global authority heuristics.

Semantics-aware v2 validator retained; production result 0 FAIL / 1 BLOCKED / 13 PASS, sole blocker known SAT_CONVOS_15 collision. Nathan Direct retained counts: 73,200 input records / 22,758 user records / 15,133 unique packaged Nathan messages + 7,625 collapsed duplicates. `indexes/nathan-direct/MANIFEST.json` still lacks exact scanned-source repository commit/ref; classify as provenance/observability debt, not stale/incorrect-content evidence.

Retained machinery: `validate_cross_source_integrity_v2.py`, `viewer_input_semantics.py`, `test_integrity_failure_modes.py`, `diagnose_viewer_input_dedup.py`, `diagnose_conversation_identity_duplicates_v4.py`, `test_conversation_relation_sidecar_contract.py`, `classify_extraction_context_graph.py`, `.github/workflows/mercer-cross-source-integrity.yml`. Named checks only.

### Other retained state
`MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. Historical glossary/standard crosswalk custody complete but direct raw-message ancestry unresolved; reopen only with stronger source anchor. Historical/manual scanner candidate-report owner/path remains unknown.

## Open dependencies / handoffs
- `EXTRACTION CONTEXT / OWNER-SABLE`: Runs 99–104 reproduce retained graph/chronology divergence across LAB1, RUSSIA, and RAVEL; Runs 102 and 109 provide bounded graph-local negative controls; repaired classifier execution remains pending. Route eventual prevalence result through extraction/Nathan Words owner or Sable.
- `EXTRACTION PROVENANCE / OWNER-SABLE`: Run 107 supplies the minimal patch specification. No evidence of Sable consumption/supersession was found in the last inspected routing surfaces. Mercer should not implement shared workflow changes unless ownership/intent changes.
- `VIEWER / SABLE REVIEW`: Run-71 sidecar proposal remains OPEN; no approval inferred.
- `OWNER ACTION / RECHECK`: SAT_CONVOS_15 duplicate disposition unresolved; recheck only after relevant state change.
- `DORMANT VIEWER BODY SEARCH`: do not activate without intent/interface review.
- `FORMALIZATION ACCESS`: repository routes exhausted; stop probing absent new evidence.
- `IDENTITY ANCESTRY`: authority/disposition unresolved and must not be inferred from chronology/size/LIVE placement.
- `INFRASTRUCTURE`: autotag scanned-source lineage repair remains with Sable/tagging infrastructure.
- No current Nathan-required decision.

## Current frontier
Execute the repaired `WORKSPACES/MERCER/classify_extraction_context_graph.py` against an exact readable HsH checkout when a materialization/execution route can actually read the large raw JSON sources and report prevalence by file/window/edge category. Otherwise rotate to a fresh bounded archive/index/retrieval QA object with higher information value rather than accumulating more extraction examples.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup; 47–51 semantics-aware validator; 52–53 autotag lineage; 54–69 conversation identity; 70 Viewer exposure; 71–74 relation sidecar/spec/harness/handoff; 75 Nathan Direct lineage; 76 normalization; 77–80 routing/front-door; 81–85 operational currentness; 86–89 formalization access; 90–96 Viewer external/runtime/build provenance; 97–104 extraction-context semantics/sampling; 105 deterministic whole-window classifier materialized; 106 extraction source-tree/tool provenance + workflow publication-safety audit; 107 minimal extraction provenance/publication-safety patch specification routed; 108 classifier default-semantics fidelity repair; **109 Meridian graph-local negative control + boundary-classification refinement.**

## Best next operations
1. Execute and validate the repaired classifier at an exact readable HsH checkout when available; report prevalence without rewriting historical outputs.
2. If execution remains blocked, rotate to a fresh bounded archive/index/retrieval QA object with higher information value rather than accumulating extraction anecdotes.
3. Recheck Sable consumption/supersession only when its relevant routing/checkpoint state changes; do not duplicate shared-workflow design locally.
