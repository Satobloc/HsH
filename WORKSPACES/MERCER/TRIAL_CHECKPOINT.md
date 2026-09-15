# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** index/retrieval QA + Nathan Direct methodology/source reconstruction + documentation/navigation reconciliation  
**Current through:** Run 36, 2026-09-14

## Startup / authority

Every run read `WORKSPACES/COMMON/WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Nathan directives control.

The former blanket training standdown is superseded as a hard gate. Direct theory-bearing work/development remains sandbox-limited; quarantine remains hard/off-limits. Mercer may explore broadly but owns the reliability layer between raw/tagged material and navigation/retrieval. Do not silently absorb familiarity-dependent conversation-family causality/context interpretation or the active Nathan-words extraction/tagging lane.

## Epistemic boundary

Keep Nathan-authored direct material, present Nathan testimony, archive-corroborated history, established/tentative theory status, displaced/quarantined material, assistant interpretation, and Mercer reconstruction distinct. Repository proximity, worker agreement, generated metadata, thematic similarity, clean indexing, or successful automated checks never confer theory correctness or authority.

## Current verified state

### Viewer / manifests

Canonical Viewer catalog: `CONVERSATION_VIEWER/data/conversations.json`. Last verified source state: 374 conversations = 365 development / 9 live. Arithmetic is 364 accepted development-manifest records + 9 live-manifest records + 1 registered external development-class record. Registered external corpus labels do not imply manifest membership.

Last inspected development manifest state: generated `2026-09-13T12:30:33.434526+00:00`, 365 unchanged / 114 skipped / 48 blocked / 1 collision. Sole collision is the byte-identical SAT_CONVOS_15 pair:

- `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_15/Cosmological Constant Summary — raw.json`
- `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_15/26.06.22•26.09.12•Cosmological Constant Summary — raw.json`

Both previously verified as blob SHA `40dd17e8d6114d65f54e5712ff8ee4e5fc3812a0`, conversation ID `6a393d4e-0950-83ea-bcfd-b9ceb4783caf`. Owner disposition is required before 48 queued normalizations can clear. Do not conflate the distinct SAT_CONVOS_11 snapshot.

### Autotag / Nathan Direct

Current coherent counts: autotag 69,927 records / 21,451 user records; Nathan Direct 14,306 packaged unique + 7,145 collapsed duplicates = 21,451; yearly shards 293 + 306 + 4,801 + 8,906 = 14,306; Stage 2 `source_records = 14306`. Historical 388→387 conversation and 21,499→21,451 user-record reductions were reconciled to the known held/deleted legal raw source, not indexing loss.

Preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. Machine-readable autotag-side generation/freshness lineage remains unconfirmed.

### Source-integrity validator / competence harness

Durable implementation:
- `WORKSPACES/MERCER/validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py`
- `.github/workflows/mercer-cross-source-integrity.yml`

Validator is read-only and metadata-only; classes are `PASS/WARN/BLOCKED/FAIL/UNKNOWN`. `BLOCKED` is operational dependency, not corruption.

Run 34 production execution on complete checkout succeeded: **12 PASS / 1 BLOCKED / 0 FAIL / 0 WARN / 0 UNKNOWN**. Sole BLOCKED item was the known development-manifest collision state.

Run 35 added six synthetic specimens: clean PASS, stale Viewer WARN, Viewer count FAIL, Nathan Direct arithmetic FAIL, Stage-2 continuity FAIL, declared collision BLOCKED-without-FAIL. CI run `34918942881` subsequently failed specifically at the failure-mode harness while the older regression fixture passed and production validation was skipped.

Run 36 isolated the failure to stale/nonexistent check IDs in the harness, not changed expected classifications. `test_integrity_failure_modes.py` now calls the validator's actual IDs (`viewer.input_freshness.development`, `nathan_direct.user_record_arithmetic`, `nathan_direct.stage2_source_continuity`, and the manifest operational-blocker ID). Repair commit `fd948c412436a295eebaf78689b7e49325a8dc82`. Triggered Mercer workflow run `34926821342` was queued at Run-36 close; do not claim green until terminal result is inspected. Run record: `WORKSPACES/MERCER/RUN_036_2026-09-14.md`.

### MORROW-SOURCE-001

Code-side resolved / historical-output-side pending. Comparator hashes the entire content object under its explicit policy and retains the Janus regression case. Preserve the earlier Janus export. `extract_raw_window.py` is only a bounded `content.parts` helper, not a complete-content serializer.

### Historical glossary / standard crosswalk

Source inventory/custody work is complete; direct raw-message ancestry remains unresolved for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt`. Current phrase-search, Viewer-candidate, and intrinsic-fingerprint routes were exhausted in Runs 16–22. Reopen only with a stronger source anchor (exact paste, explicit generation instruction, raw-message match, original metadata, or independently attributable relation).

### Durable documentation / role development

- `WORKSPACES/COMMON/DURABLE_PROJECT_DOCUMENTATION_CONVENTION.md` established Run 13.
- Mercer README/CONTINUITY and Viewer documentation reconciled in Runs 23–28.
- `NATHAN_LIVE_THEORY_DEVELOPMENT_LOG.md` has durable September 13 referents; exact raw IDs remain pending attributable export.
- `PRE_MEETING_REPORT_2026-09-14.md` records tentative role direction: **Source Integrity Metrologist** — provenance-safe retrieval/index QA, generated-state integrity, archive-facing competence/regression tests.
- Safe Morrow inheritance: deterministic UUID/path/checksum/index reconciliation and machine-readable provenance joins. Do not inherit contextual causality/dialogue-significance judgments by default.

## Open dependencies

- `OWNER ACTION`: SAT_CONVOS_15 exact duplicate disposition + canonical regeneration.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `DEPENDENCY`: machine-readable autotag-side generation/freshness lineage.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- `COORDINATION WRITE GAP`: pre-meeting report not appended to heavily shared `CHECKINS.md`; do not use unsafe whole-file replacement merely to append.
- No current Nathan-required decision.

## Run history

Runs 1–7 training + scanner defect/repair; 8–12 Viewer path/navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance investigation; 23–26 durable docs reconciliation; 27 corpus-count reconciliation; 28 registered-external semantics; 29 exact duplicate collision; 30 source-integrity systems map; 31 validator contract; 32 Nathan Direct machine bridge; 33 validator implementation + pre-meeting report; 34 full-checkout production validation + CI harness; 35 failure-mode competence/regression harness; 36 CI failure diagnosis + harness check-ID repair.

## Best next operation

Inspect terminal result/logs for Mercer workflow run `34926821342`. If it passes, freeze the six Run-35/36 specimens as the initial source-integrity competence set and add specimens only when tied to observed failures; then inspect whether fresh navigation generation changed the manifest/Viewer collision state. If it fails, repair the demonstrated harness/contract defect without weakening expected classifications. If the SAT_CONVOS_15 pair is dispositioned or canonical manifests/Viewer regenerate first, verify changed state and zero collision-induced blocking. Do not reopen exhausted provenance searches without new evidence.