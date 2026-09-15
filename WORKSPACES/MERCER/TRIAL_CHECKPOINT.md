# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 49, 2026-09-15

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before touching write-capable scripts/shared generated state, also read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / manifest / exact dedup reconstruction
Settled generation: development summary **364 unchanged / 121 skipped / 74 planned / 1 collision** across 560 records. Viewer has **453 conversations** from declared accepted inputs 439 development + 9 live + 6 external = **454**. Production uses `tools/build_conversation_viewer_resolved.py`: existing supported `new_path` before `old_path`; collision/blocked rename status does not itself make a materialized source Viewer-ineligible.

Retained Run-46 diagnostic artifact `10399888652`, digest `sha256:4f78f568ff2ed9cee9ab26a90810ce0af2d4b84fa9612923eeff2116f2df5c40`, reconstructs **454 accepted -> 453 post-dedup** with exactly one duplicate path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_15/26.06.22•26.09.12•Cosmological Constant Summary — raw.json`. Manifest index 253 is the earlier unchanged winner; index 257 is collision, resolves from existing dated `new_path`, and does not replace the winner because it is not live. Both source files were confirmed identical blob SHA `40dd17e8d6114d65f54e5712ff8ee4e5fc3812a0`. Viewer-safe dedup does **not** disposition the archive duplicate or clear the normalization blocker.

### Validator transition
Legacy `validate_cross_source_integrity.py` remains the active production entry point and contains stale Viewer assumptions. Run 47 added `viewer_input_semantics.py` (`e36cea17fd5a22ccc88bcda339a30385d4a18563`) centralizing production resolved-input/dedup semantics. Run 48 added read-only `validate_cross_source_integrity_v2.py` (`36411c2954564209c323bd036c2c84950756bea4`), replacing the stale Viewer checks with: declared pre-dedup acceptance vs reconstruction; post-dedup cardinality vs Viewer source count; final Viewer vs resolved winner provenance; and Viewer-declared external lineage.

**Run 49:** `test_integrity_failure_modes.py` now imports the semantics-aware v2 validator and specimen seven expects the resolved collision+dedup condition to PASS its four Viewer invariants while remaining `BLOCKED` for the normalization collision. The synthetic baseline now materializes source-path placeholders because production resolution is existence-aware. The original six semantic expectations are retained; the collision-only fixture's Viewer-declared accepted count was corrected to 2 so it models the production rule while still asserting `BLOCKED` and no `FAIL`. Commit: `eebfddde94efc67ddbbc6d95653157a2cd062fea`.

This is an implementation state change, **not yet a green regression claim**. At cutoff the updated seven-specimen harness had not yet been observed executing in CI, and production v2 validation has not yet been observed green. Do not switch the active validator/CI entry point until both are established.

### Source-integrity machinery
- `WORKSPACES/MERCER/validate_cross_source_integrity.py` — legacy active validator
- `WORKSPACES/MERCER/validate_cross_source_integrity_v2.py` — semantics-aware transition wrapper
- `WORKSPACES/MERCER/viewer_input_semantics.py` — shared production-semantics adapter
- `WORKSPACES/MERCER/test_validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py` — seven-specimen harness now targeting v2
- `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`
- `.github/workflows/mercer-cross-source-integrity.yml`

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; `BLOCKED` is an operational dependency, not corruption.

### Other retained state
Nathan Direct: **15,133 packaged unique + 7,625 collapsed duplicates = 22,758 input user records**; year shards sum to 15,133 and Stage-2 `source_records = 15133`. Preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. Machine-readable autotag generation/freshness lineage remains unconfirmed.

`MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. `extract_raw_window.py` is a bounded `content.parts` helper, not a complete-content serializer.

Historical glossary/standard crosswalk: inventory/custody work complete; direct raw-message ancestry unresolved for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt`; reopen only with stronger source anchor.

## Open dependencies
- `VALIDATOR TRANSITION`: observe all seven v2 specimens, then run/observe v2 against production metadata; only then replace active validator/CI entry point.
- `OWNER ACTION / RECHECK`: development manifest still has 1 collision; SAT_CONVOS_15 duplicate disposition unresolved.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `DEPENDENCY`: machine-readable autotag generation/freshness lineage.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- No current Nathan-required decision.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup diagnosis and corrected production-wrapper reconstruction; 47 shared semantics adapter; 48 v2 transition wrapper; **49 migrated the seven-specimen failure-mode harness to v2 semantics and flipped specimen seven to expected Viewer PASS while preserving normalization BLOCKED status.**

## Best next operations
1. Observe/run the seven-specimen harness and inspect any failure without weakening expectations.
2. Run/observe `validate_cross_source_integrity_v2.py` against current production metadata.
3. Only if both are green, redirect the active validator/CI entry point; preserve legacy behavior in history.
4. Keep SAT_CONVOS_15 normalization collision separately `BLOCKED` until provenance-preserving duplicate disposition is established.
