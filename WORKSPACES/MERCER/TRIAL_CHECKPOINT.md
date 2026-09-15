# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 51, 2026-09-15

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before touching write-capable scripts/shared generated state, also read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / manifest / exact dedup reconstruction
Settled generation: development summary **364 unchanged / 121 skipped / 74 planned / 1 collision** across 560 records. Viewer has **453 conversations** from declared accepted inputs 439 development + 9 live + 6 external = **454**. Production uses `tools/build_conversation_viewer_resolved.py`: existing supported `new_path` before `old_path`; collision/blocked rename status does not itself make a materialized source Viewer-ineligible.

Retained Run-46 diagnostic artifact `10399888652`, digest `sha256:4f78f568ff2ed9cee9ab26a90810ce0af2d4b84fa9612923eeff2116f2df5c40`, reconstructs **454 accepted -> 453 post-dedup** with exactly one duplicate path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_15/26.06.22•26.09.12•Cosmological Constant Summary — raw.json`. Manifest index 253 is the earlier unchanged winner; index 257 is collision, resolves from existing dated `new_path`, and does not replace the winner because it is not live. Both source files were confirmed identical blob SHA `40dd17e8d6114d65f54e5712ff8ee4e5fc3812a0`. Viewer-safe dedup does **not** disposition the archive duplicate or clear the normalization blocker.

### Validator production contract
Runs 47–49 built the shared resolved-input semantics adapter, semantics-aware v2 validator, and seven-specimen harness. Run 50 observed all seven specimens green and added a dedicated production-v2 gate while retaining the old validator as reference.

**Run 51:** GitHub Actions run `35016148194` on commit `326142169a01eb0f777508c27df0c8ffdf72a65c` completed `success`. The production v2 validator reported overall `BLOCKED` with **0 FAIL / 1 BLOCKED / 0 WARN / 0 UNKNOWN / 13 PASS**. The sole blocker is the known SAT_CONVOS_15 normalization collision. All four semantics-aware Viewer invariants passed: `viewer.accepted_input_reconstruction`, `viewer.post_dedup_cardinality`, `viewer.resolved_winner_reconciliation`, and `viewer.external_input_lineage`. The seven-specimen harness again passed all seven specimens. The dedup diagnostic again reconstructed 454 accepted -> 453 post-dedup with manifest index 253 surviving index 257 on the sole duplicate path.

The legacy validator in the same run still emitted its known false `viewer.accepted_input_arithmetic` FAIL from comparing pre-dedup 454 directly with post-dedup 453. It is now historical/reference behavior, not the production contract. Run 51 updated `.github/workflows/mercer-cross-source-integrity.yml` at commit `02b4ac3a8264fffd2d70afda7f5d4a2f2c8834ad` so the v2 step is labeled `Production metadata validation` and the old implementation `Legacy validator reference` with `continue-on-error`.

### Source-integrity machinery
- `WORKSPACES/MERCER/validate_cross_source_integrity_v2.py` — active semantics-aware production validator
- `WORKSPACES/MERCER/viewer_input_semantics.py` — shared production-semantics adapter
- `WORKSPACES/MERCER/validate_cross_source_integrity.py` — legacy reference validator with known stale Viewer arithmetic
- `WORKSPACES/MERCER/test_validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py` — seven-specimen harness targeting production v2; repeatedly observed green
- `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`
- `.github/workflows/mercer-cross-source-integrity.yml`

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; `BLOCKED` is an operational dependency, not corruption.

### Other retained state
Nathan Direct: **15,133 packaged unique + 7,625 collapsed duplicates = 22,758 input user records**; year shards sum to 15,133 and Stage-2 `source_records = 15133`. Preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. Machine-readable autotag generation/freshness lineage remains unconfirmed.

`MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. `extract_raw_window.py` is a bounded `content.parts` helper, not a complete-content serializer.

Historical glossary/standard crosswalk: inventory/custody work complete; direct raw-message ancestry unresolved for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt`; reopen only with stronger source anchor.

## Open dependencies
- `OWNER ACTION / RECHECK`: development manifest still has 1 collision; SAT_CONVOS_15 duplicate disposition unresolved. Viewer dedup is safe for navigation but does not disposition either source artifact.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `DEPENDENCY`: machine-readable autotag generation/freshness lineage.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- No current Nathan-required decision.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup diagnosis and corrected production-wrapper reconstruction; 47 shared semantics adapter; 48 v2 transition wrapper; 49 migrated seven-specimen harness to v2; 50 observed seven specimens green and added production-v2 gate; **51 observed production v2 green at 0 FAIL / 1 known BLOCKED / 13 PASS and promoted v2 to the active CI production contract while retaining legacy output as reference.**

## Best next operations
1. Observe the workflow run triggered by the production-role label change as a smoke check; if unchanged/green, do not manufacture more validator churn.
2. Return primary attention to unresolved archive provenance/duplicate work, especially a provenance-preserving disposition path for the SAT_CONVOS_15 identical duplicate while keeping Viewer dedup separate from source cleanup.
3. If duplicate disposition remains owner-blocked, inspect machine-readable autotag generation/freshness lineage as the next independent QA target.
