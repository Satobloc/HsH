# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 42, 2026-09-15

## Startup / authority

Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before touching write-capable scripts/shared generated state, also read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control.

The former blanket training standdown is superseded as a hard gate. Direct theory-bearing work/development remains sandbox-limited; quarantine remains hard/off-limits. Mercer owns the reliability layer between raw/tagged material and navigation/retrieval, while remaining free to explore permitted material. Do not silently absorb familiarity-dependent conversation-family causality/context interpretation or the active Nathan-words extraction/tagging lane.

## Epistemic boundary

Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Repository proximity, worker agreement, generated metadata, thematic similarity, clean indexing, or successful automated checks never confer theory correctness or authority.

## Current verified state

### Viewer / manifests

Settled development manifest generation: `2026-09-15T07:15:03.960820+00:00`; Viewer declares that same development input generation. Development summary: **364 unchanged / 121 skipped / 74 planned / 1 collision** across 560 records. One collision remains; do not declare the historical SAT_CONVOS_15 duplicate disposition resolved until directly established.

Settled Viewer: **453 conversations**, `development: 439`, `live: 9`, `source_conversations_before_curation: 453`. Inputs: 439 accepted development + 9 accepted live + 6 accepted external = 454 pre-dedup accepted inputs.

Builder contract from `tools/build_conversation_viewer.py`: accepted development/live/external records are appended, then deduplicated by exact `path`; an existing record is retained unless the later duplicate has `corpus == "live"`. `source_conversations_before_curation` is computed after this path deduplication. Therefore 454 accepted inputs → 453 source conversations is compatible with one exact-path duplicate and is not by itself evidence of Viewer corruption.

### Validator contract defect — OPEN, diagnostic observability repaired Run 42

`WORKSPACES/MERCER/validate_cross_source_integrity.py` is stale in four related places:
1. `viewer.accepted_input_arithmetic` compares raw accepted-input sum directly to post-dedup `source_conversations_before_curation`.
2. `viewer.manifest_record_reconciliation` excludes every Viewer development/live record whose path appears in its external path set, even when a manifest record wins builder precedence.
3. `viewer.external_registry_reconciliation` can match by path/corpus/count without establishing survivor provenance after path deduplication.
4. Validator hardcodes `CONVERSATION_VIEWER/EXTERNAL_CONVERSATIONS.json`, while current Viewer consumed `CONVERSATION_VIEWER/data/discovered_external_conversations.json` (1 manual + 5 structurally discovered public cross-repo records).

Run 41 added read-only `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`. Actions run `34954998631` completed **failure** specifically at that diagnostic step; ordinary regression fixture and frozen six-specimen competence harness passed, production validation was skipped. No artifact was retained because `/tmp/mercer-integrity` had not yet been created.

Run 42 re-read builder and diagnostic code; relevant acceptance/dedup semantics still appear aligned. Rather than infer the mismatch, CI was repaired to create `/tmp/mercer-integrity` before the diagnostic and tee its JSON to `viewer-input-dedup.json`, while preserving nonzero failure propagation. Workflow commit: `c30dfcd8d52c1189d3b7ea3cddaf0f5051ded975`. The next run of the workflow should therefore retain exact mismatch/duplicate provenance even on failure.

Repair remains one source-code-grounded precedence model: resolve external source from Viewer `inputs[]`, normalize accepted manifest records under builder rules, append Viewer-declared external records, replay exact-path precedence, then compare accepted totals, deduplicated totals, survivor provenance, and metadata. Do not weaken unrelated invariants.

### Source-integrity validator / competence harness

Durable implementation:
- `WORKSPACES/MERCER/validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py`
- `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`
- `.github/workflows/mercer-cross-source-integrity.yml`

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; `BLOCKED` is operational dependency, not corruption. Run 37 confirmed original regression fixture + frozen six-specimen competence harness green at Actions run `34926821342`, artifact `10379809650`, digest `sha256:edc63c62dbe5b712091a2fb805aaab7ef38bf833772389291fdfa97170f9e0a1`. Those six specimens remain frozen; observed Runs 39–42 contract warrants one additional specimen after exact diagnostic output is captured.

### Autotag / Nathan Direct

Last coherent counts: autotag 69,927 records / 21,451 user records; Nathan Direct 14,306 packaged unique + 7,145 collapsed duplicates = 21,451; yearly shards 293 + 306 + 4,801 + 8,906 = 14,306; Stage 2 `source_records = 14306`. Preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. Machine-readable autotag-side generation/freshness lineage remains unconfirmed.

### MORROW-SOURCE-001

Code-side resolved / historical-output-side pending. Comparator hashes the entire content object under its explicit policy and retains the Janus regression case. Preserve the earlier Janus export. `extract_raw_window.py` is only a bounded `content.parts` helper, not a complete-content serializer.

### Historical glossary / standard crosswalk

Source inventory/custody work complete; direct raw-message ancestry remains unresolved for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt`. Runs 16–22 exhausted current phrase-search, Viewer-candidate, and intrinsic-fingerprint routes. Reopen only with a stronger source anchor.

### Durable documentation / role development

`WORKSPACES/COMMON/DURABLE_PROJECT_DOCUMENTATION_CONVENTION.md` established Run 13. Mercer README/CONTINUITY and Viewer documentation reconciled Runs 23–28. `NATHAN_LIVE_THEORY_DEVELOPMENT_LOG.md` has durable September 13 referents; exact raw IDs remain pending attributable export. `PRE_MEETING_REPORT_2026-09-14.md` records tentative role direction **Source Integrity Metrologist**. Safe Morrow inheritance remains deterministic UUID/path/checksum/index reconciliation and machine-readable provenance joins, not contextual causality/dialogue-significance judgments.

## Open dependencies

- `VALIDATOR REPAIR`: exact-path dedup/preference semantics + stale external-source lineage established Runs 39–40; Run 41 diagnostic failed before production validation; Run 42 repaired diagnostic-output retention. Exact mismatch/duplicate result + seventh regression specimen + coherent validator repair remain.
- `OWNER ACTION / RECHECK`: development manifest still has 1 collision; historical SAT_CONVOS_15 exact duplicate disposition not established.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `DEPENDENCY`: machine-readable autotag-side generation/freshness lineage.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- `COORDINATION WRITE GAP`: pre-meeting report not appended to heavily shared `CHECKINS.md`; do not unsafe-whole-file replace merely to append.
- No current Nathan-required decision.

## Run history

Runs 1–7 training + scanner defect/repair; 8–12 Viewer path/navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 durable docs reconciliation; 27 corpus-count reconciliation; 28 registered-external semantics; 29 exact duplicate collision; 30 source-integrity systems map; 31 validator contract; 32 Nathan Direct machine bridge; 33 validator implementation + pre-meeting report; 34 production validation + CI; 35 failure-mode harness; 36 harness interface repair; 37 green harness + transient Viewer/manifest split; 38 settled convergence + external accounting change; 39 source-code isolation of exact-path dedup validator defect; 40 external-registry lineage defect isolated; 41 full-checkout dedup diagnostic + CI instrumentation; 42 failed diagnostic confirmed + failure-output observability repair.

## Last material run

`WORKSPACES/MERCER/RUN_042_2026-09-15.md` records exact Run-42 coverage, Actions failure diagnosis, code recheck, CI observability repair, limits, and next operation.

## Best next operation

Inspect the integrity run triggered by workflow commit `c30dfcd8d52c1189d3b7ea3cddaf0f5051ded975`. Retrieve retained `viewer-input-dedup.json` whether the diagnostic passes or fails. Freeze the exact observed duplicate/mismatch semantics as specimen seven before changing `validate_cross_source_integrity.py`. Then run frozen six + specimen seven before production validation. If source state changes first, re-establish settled input lineage before patching.
