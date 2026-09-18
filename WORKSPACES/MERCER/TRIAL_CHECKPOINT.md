# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 100, 2026-09-18

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs/check-ins, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before write-capable scripts/shared generated state, read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / normalization / source identity
Current Viewer catalog at last bounded audit: 453 conversations / 439 development / 9 live. SAT_CONVOS_15 `Cosmological Constant Summary` exact-byte duplicate collision remains the normalization blocker; do not recheck absent relevant source/script/manifest change.

Runs 71–74 specified a minimum additive Viewer relation sidecar with neutral navigation and diagnostic/source-state provenance. Sable review remains OPEN; do not implement shared Viewer schema/workflow without systems/interface review.

Runs 90–96 bounded Viewer reproducibility: one manual external record (Srena) lacks immutable source identity; manual-wins merge semantics do not enrich it; external-only sources cannot currently use local-path partial curation; dormant body-search code provides repository-aware GLASS precedent; wired Viewer is catalog-frozen for metadata but runtime-live for source bytes; historical HsH build inputs are reconstructable through the generated commit parent, while external GLASS build-tree provenance is weaker.

### Extraction / context provenance
Run 97 established that `extract_raw_window.py` selects `context_each_side` by globally timestamp-sorted message-list adjacency, not graph ancestry, while preserving each row's `parent`. Run 98 sampled one retained LAB1 window and found both neighbors immediate graph-local.

Run 99 found a concrete positive retained-output counterexample in `WORKSPACES/COMMON/extraction_outputs/2026-09-15-LAB1-AFTER-015519.json` (`context_each_side: 1`): at least one chronological context row lies outside the target's immediate parent/child graph relation.

**Run 100:** second retained LAB1 output independently reproduces graph/chronology divergence: `WORKSPACES/COMMON/extraction_outputs/2026-09-14-LAB1-AFTER-154902.json` (blob `05eb3c565ba86f162af573093474d261d263e13b`, `context_each_side: 1`). Visible sequence crosses from assistant `df07ce94-3bbd-46dc-b28b-cd0b09cbc6d0` (parent `56438255-f240-4855-a046-7b9812e9b6ab`) to assistant `8493cc45-dd0b-4824-a167-0dc3c80f8149` (parent `acae344f-fccd-4d34-a14e-35c5f65aa0f2`), then user `cd28c7f7-13f5-4e51-9afc-170fd2d79f10` whose parent is `8493cc45-dd0b-4824-a167-0dc3c80f8149`. Therefore checking only the target-parent edge is insufficient: a retained context segment can splice branches one edge earlier while the target's immediate parent relation is locally correct. Durable record: `WORKSPACES/MERCER/RUN_100_2026-09-18.md`.

Classification remains extraction-context provenance/semantics issue, not source corruption; prevalence and downstream interpretive effect remain unmeasured. Next extraction cursor: deterministic read-only classification across retained extraction JSONs with positive context, evaluating whole context-segment graph continuity: immediate parent/child-local; same-branch/non-immediate; cross-branch/spliced; unresolved. Preserve old outputs; do not overwrite provenance. Keep separate source-commit/ref provenance audit distinct.

### Operational currentness / formalization
Runs 81–85 established proposition-level currentness discipline. Runs 86–89 found `formalization/README.md` advertises an absent `formalization/leancheck/run.ps1`; inspected repository routes found no implementation. Classification: documented-but-unmaterialized; stop probing absent new evidence.

### Raw conversation identity / validator / Nathan Direct
Production v4 identity diagnostic retained: 74 repeated conversation-UUID families / 222 pairwise comparisons = 115 message-ID subset/superset, 56 exact-byte, 36 same-graph metadata-only, 9 same-graph readable-text-divergent, 4 branch/snapshot-divergent, 2 same-graph nontext-unresolved. Among 115 simple subset/superset pairs, recorded update time is later on larger state in 106, tied in 9, later on smaller in 0. This supports monotonic snapshot growth only inside that class; newest/largest/filename end-date/LIVE/shared UUID are not global authority heuristics.

Semantics-aware v2 validator retained; production result 0 FAIL / 1 BLOCKED / 13 PASS, sole blocker the known SAT_CONVOS_15 collision. Nathan Direct retained counts: 73,200 input records / 22,758 user records / 15,133 unique packaged Nathan messages + 7,625 collapsed duplicates. `indexes/nathan-direct/MANIFEST.json` still lacks exact scanned-source repository commit/ref; classify as provenance/observability debt, not stale/incorrect-content evidence.

Retained machinery: `validate_cross_source_integrity_v2.py`, `viewer_input_semantics.py`, `test_integrity_failure_modes.py`, `diagnose_viewer_input_dedup.py`, `diagnose_conversation_identity_duplicates_v4.py`, `test_conversation_relation_sidecar_contract.py`, `.github/workflows/mercer-cross-source-integrity.yml`. Named checks only.

### Other retained state
`MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. Historical glossary/standard crosswalk custody complete but direct raw-message ancestry unresolved; reopen only with stronger source anchor. Historical/manual scanner candidate-report owner/path remains unknown.

## Open dependencies / handoffs
- `EXTRACTION CONTEXT / OWNER-SABLE`: Runs 99–100 now reproduce retained graph/chronology divergence in two LAB1 positive-context output files; route through extraction/Nathan Words owner or Sable. No Nathan decision currently required.
- `VIEWER / SABLE REVIEW`: Run-71 sidecar proposal remains OPEN; no approval inferred.
- `OWNER ACTION / RECHECK`: SAT_CONVOS_15 duplicate disposition unresolved; recheck only after relevant state change.
- `DORMANT VIEWER BODY SEARCH`: do not activate without intent/interface review.
- `FORMALIZATION ACCESS`: repository routes exhausted; stop probing absent new evidence.
- `IDENTITY ANCESTRY`: authority/disposition unresolved and must not be inferred from chronology/size/LIVE placement.
- `INFRASTRUCTURE`: autotag scanned-source lineage repair remains with Sable/tagging infrastructure.
- No current Nathan-required decision.

## Current frontier
Quantify extraction context graph-locality across retained positive-context JSON outputs with a deterministic read-only validator. Test whole retained context-segment continuity, not only target-adjacent edges. Keep extraction source-commit/ref provenance as a separate later bite.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup; 47–51 semantics-aware validator; 52–53 autotag lineage; 54–69 conversation identity; 70 Viewer exposure; 71–74 relation sidecar/spec/harness/handoff; 75 Nathan Direct lineage; 76 normalization; 77–80 routing/front-door; 81–85 operational currentness; 86–89 formalization access; 90–96 Viewer external/runtime/build provenance; 97 extraction-context implementation semantics; 98 first negative retained sample; 99 first positive retained immediate-ancestry mismatch; **100 second retained file reproduces graph/chronology divergence and sharpens validator requirement to whole-segment continuity.**

## Best next operations
1. Deterministically classify retained extraction JSONs with positive context by whole-segment graph-locality.
2. Route Runs 99–100 concrete finding through existing Sable/extraction ownership rather than silently redesigning another lane.
3. Audit exact checked-out source commit/ref persistence in extraction payload/run manifests as a separate bite.
4. Re-audit normalization/Viewer/autotag only after relevant state changes.
