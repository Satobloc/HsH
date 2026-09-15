# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 50, 2026-09-15

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before touching write-capable scripts/shared generated state, also read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / manifest / exact dedup reconstruction
Settled generation: development summary **364 unchanged / 121 skipped / 74 planned / 1 collision** across 560 records. Viewer has **453 conversations** from declared accepted inputs 439 development + 9 live + 6 external = **454**. Production uses `tools/build_conversation_viewer_resolved.py`: existing supported `new_path` before `old_path`; collision/blocked rename status does not itself make a materialized source Viewer-ineligible.

Retained Run-46 diagnostic artifact `10399888652`, digest `sha256:4f78f568ff2ed9cee9ab26a90810ce0af2d4b84fa9612923eeff2116f2df5c40`, reconstructs **454 accepted -> 453 post-dedup** with exactly one duplicate path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_15/26.06.22•26.09.12•Cosmological Constant Summary — raw.json`. Manifest index 253 is the earlier unchanged winner; index 257 is collision, resolves from existing dated `new_path`, and does not replace the winner because it is not live. Both source files were confirmed identical blob SHA `40dd17e8d6114d65f54e5712ff8ee4e5fc3812a0`. Viewer-safe dedup does **not** disposition the archive duplicate or clear the normalization blocker.

### Validator transition
Run 47 added `viewer_input_semantics.py` (`e36cea17fd5a22ccc88bcda339a30385d4a18563`) centralizing production resolved-input/dedup semantics. Run 48 added read-only `validate_cross_source_integrity_v2.py` (`36411c2954564209c323bd036c2c84950756bea4`), replacing stale Viewer checks with: declared pre-dedup acceptance vs reconstruction; post-dedup cardinality vs Viewer source count; final Viewer vs resolved winner provenance; and Viewer-declared external lineage. Run 49 migrated the seven-specimen harness to v2.

**Run 50:** CI run `35010052346` on commit `eebfddde94efc67ddbbc6d95653157a2cd062fea` completed successfully. The failure-mode harness explicitly reported `PASS: 7 integrity specimens: clean, stale-viewer, catalog-count, package-count, stage2-count, collision-blocked, resolved-collision-dedup`. The same run reconfirmed the production dedup diagnostic at 454 accepted -> 453 post-dedup with the single SAT_CONVOS_15 duplicate path and manifest index 253 as winner. However, that run's production-validation step still invoked the legacy validator and reported its known `viewer.accepted_input_arithmetic` FAIL while the workflow itself remained successful because the legacy validator does not exit nonzero for that report state.

To obtain the still-missing production-v2 observation without prematurely replacing the legacy reference, Run 50 updated `.github/workflows/mercer-cross-source-integrity.yml` at commit `326142169a01eb0f777508c27df0c8ffdf72a65c`: v2 is now a dedicated production transition gate producing `report-v2.{json,md}`; the legacy validator remains an `always()`/`continue-on-error` reference producing separately named legacy reports; changes to the v2 validator and shared semantics adapter now trigger the workflow. At checkpoint cutoff, no check-run had yet appeared for that commit. **Do not call production v2 green or complete the transition until that run is observed.**

### Source-integrity machinery
- `WORKSPACES/MERCER/validate_cross_source_integrity.py` — legacy reference validator with known stale Viewer arithmetic
- `WORKSPACES/MERCER/validate_cross_source_integrity_v2.py` — semantics-aware transition validator; now CI production gate pending observed result
- `WORKSPACES/MERCER/viewer_input_semantics.py` — shared production-semantics adapter
- `WORKSPACES/MERCER/test_validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py` — seven-specimen harness targeting v2; observed green in Run 50
- `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`
- `.github/workflows/mercer-cross-source-integrity.yml`

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; `BLOCKED` is an operational dependency, not corruption.

### Other retained state
Nathan Direct: **15,133 packaged unique + 7,625 collapsed duplicates = 22,758 input user records**; year shards sum to 15,133 and Stage-2 `source_records = 15133`. Preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. Machine-readable autotag generation/freshness lineage remains unconfirmed.

`MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. `extract_raw_window.py` is a bounded `content.parts` helper, not a complete-content serializer.

Historical glossary/standard crosswalk: inventory/custody work complete; direct raw-message ancestry unresolved for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt`; reopen only with stronger source anchor.

## Open dependencies
- `VALIDATOR TRANSITION`: seven-specimen v2 harness is now observed green. Observe the newly added production-v2 CI gate; only if green should v2 be treated as the active production contract and legacy reduced to historical/reference status.
- `OWNER ACTION / RECHECK`: development manifest still has 1 collision; SAT_CONVOS_15 duplicate disposition unresolved.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `DEPENDENCY`: machine-readable autotag generation/freshness lineage.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- No current Nathan-required decision.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup diagnosis and corrected production-wrapper reconstruction; 47 shared semantics adapter; 48 v2 transition wrapper; 49 migrated the seven-specimen harness to v2; **50 observed all seven v2 specimens green and added a separate production-v2 CI transition gate while preserving legacy output as reference.**

## Best next operations
1. Observe the CI run triggered by `326142169a01eb0f777508c27df0c8ffdf72a65c`; inspect v2 production report without weakening expectations.
2. If production v2 is green, simplify/rename only repository validator roles as appropriate (never conversation identities): make v2 the production contract, preserve legacy implementation/history, and keep the normalization collision independently `BLOCKED`.
3. If v2 fails, isolate the invariant and repair it before any transition.
4. Keep SAT_CONVOS_15 normalization collision separately `BLOCKED` until provenance-preserving duplicate disposition is established.
