# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 92, 2026-09-17

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs/check-ins, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before write-capable scripts/shared generated state, read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / normalization / exact-path dedup
Current development dating manifest: **364 unchanged / 121 skipped / 74 planned / 1 collision**, dry-run, generated `2026-09-17T01:30:01.653259+00:00`. SAT_CONVOS_15 `Cosmological Constant Summary` undated/dated paths remain byte-identical at blob `40dd17e8d6114d65f54e5712ff8ee4e5fc3812a0`; apply remains globally blocked while collision persists. Common routing prose contains historical mutable counts; current audited Viewer state is **453 conversations / 439 development / 9 live** plus registered external entries. Viewer acceptance reconstruction remains **454 accepted -> 453 post-dedup**. Viewer-safe SHA/path dedup is presentation-only and does not disposition archive sources.

Runs 71–74 specified a minimum additive Viewer relation sidecar with neutral `Related exports: N` navigation, no hiding/merging/ranking/currentness inference, and diagnostic/source-state provenance. Synthetic seven-class contract harness `WORKSPACES/MERCER/test_conversation_relation_sidecar_contract.py` is runtime-green for encoded fixtures only. Sable review remains OPEN; do not implement shared Viewer schema/workflow without systems/interface review.

Runs 90–92 established the external-source provenance asymmetry, implementation locus, and present production scope. `CONVERSATION_VIEWER/EXTERNAL_CONVERSATIONS.json` currently contains exactly **one** manual record, Srena. It carries repository/branch/path/URLs/parser metadata but no content hash or immutable source commit/blob identity; canonical `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SRENA SAT2.txt` independently resolved at blob `fe01fc85b1874c1573843724f035ee292fd48961`. `tools/discover_external_conversations.py` computes `source_sha256` for structural discoveries, then initializes merged output from manual records and lets manual registrations win ID/path collisions; collided discoveries are skipped rather than enriching the manual record. Classify as **general implementation-level manual-wins/pass-through reproducibility gap with one presently observed production instance (Srena)**. Do not overstate it as an empirically demonstrated multi-record manual-catalog pattern. This is not demonstrated source error and not evidence of a formal policy exempting manual records from immutable identity.

### Operational-currentness / wayfinding
Runs 81–85 established proposition-level currentness discipline: Dashboard Sable programme ACTIVE/HOURLY agrees with current controls under that named check; Sable live inbox has one OPEN Mercer sidecar request; heartbeat surface remains ACTIVE while its embedded 2026-09-14 snapshot is stale; dated automation roster agreed with live worker membership/cadence/phase under tested fields; revival programme is active/design-level while REV-001 Alberr remained packet-ready/manual-launch-pending. Do not generalize these checks beyond named propositions.

### Formalization access
Runs 86–89: Dashboard routes to live `formalization/`, whose README advertises `formalization/leancheck/run.ps1` and `formalization/leancheck/README.md`; path is absent on current `main` and inspected visible branches. Commit `c4e6bfa6e848a165ee2c1761b1c85a5328cba2af` (`Add Windows Lean check wrapper`) changed only `formalization/README.md`; direct script lookup/history is absent. Signature searches found no implementation. Strongest repository-record classification: **documented-but-unmaterialized in inspected HsH repository state**. Stop repeated probing absent new evidence.

### Raw conversation-identity QA
Production v4 workflow `35118273709`, artifact `10456196155`, digest `sha256:fb095cef2a5e0d396f74634dce1fc4965934405046929f3fb4841c2e161d8d62` is green. Across **74 repeated conversation-UUID families / 222 pairwise comparisons**: **115 message-ID subset/superset, 56 exact-byte, 36 same-graph metadata-only, 9 same-graph readable-text-divergent, 4 branch/snapshot-divergent, 2 same-graph nontext-unresolved**. Among 115 simple subset/superset pairs, recorded `update_time` is later on larger/superset state in 106, tied in 9, later on smaller in 0. Supports monotonic snapshot growth only inside that class. Newest/largest/filename end-date/LIVE/shared UUID are not global authority heuristics.

### Validator / Nathan Direct / source machinery
Runs 47–51 established semantics-aware v2 validator + seven-specimen harness. Production v2 run `35016148194`: **0 FAIL / 1 BLOCKED / 13 PASS**; sole blocker is known SAT_CONVOS_15 normalization collision. `BLOCKED` is an operational dependency, not corruption.

Nathan Direct Runs 52–53: **73,200 input records / 22,758 user records / 15,133 unique packaged Nathan messages + 7,625 collapsed duplicates**. Run 75 found `indexes/nathan-direct/MANIFEST.json` still lacks exact scanned-source repository commit/ref and `package_nathan_direct.py` does not emit it. Provenance/observability debt, not evidence of stale/incorrect contents; repair remains routed to Sable/tagging infrastructure.

Retained machinery: `validate_cross_source_integrity_v2.py`, `viewer_input_semantics.py`, `test_integrity_failure_modes.py`, `diagnose_viewer_input_dedup.py`, `diagnose_conversation_identity_duplicates_v4.py`, `test_conversation_relation_sidecar_contract.py`, `.github/workflows/mercer-cross-source-integrity.yml`. Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; named checks only.

### Other retained state
Nathan Direct preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. `MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. Historical glossary/standard crosswalk custody complete but direct raw-message ancestry unresolved; reopen only with stronger source anchor. Exact raw IDs for September 13 Mercer live-source statements remain unavailable. Historical/manual scanner candidate-report owner/path remains unknown.

## Open dependencies
- `OWNER ACTION / RECHECK`: SAT_CONVOS_15 exact-byte duplicate disposition / normalization collision unresolved. Recheck only after relevant source/script/manifest change.
- `ROUTING CURRENTNESS`: historical mutable counts remain in Common routing prose; heartbeat embedded snapshot stale. Refresh when owners maintain those surfaces.
- `VIEWER / SABLE REVIEW`: Run-71 sidecar proposal remains OPEN in Sable inbox; no approval inferred.
- `EXTERNAL VIEWER PROVENANCE`: implementation can pass manual external records through without immutable identity; current manual catalog has one record only. Do not create a duplicate Sable request while Viewer-interface review is already open; supply as adjacent design consideration if review activates.
- `FORMALIZATION ACCESS`: repository search/history/signature/visible-branch routes exhausted; stop repeated probing unless new evidence appears.
- `IDENTITY ANCESTRY`: relation vocabulary exists; authority/disposition unresolved and must not be inferred from chronology/size/LIVE placement.
- `INFRASTRUCTURE / HANDOFF`: autotag scanned-source lineage repair remains with Sable/tagging infrastructure.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- No current Nathan-required decision.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup diagnosis; 47–51 semantics-aware validator transition; 52–53 autotag lineage audit/handoff; 54–69 conversation-identity diagnostics; 70 Viewer exposure audit; 71 sidecar specification; 72–73 synthetic harness; 74 continuity + Sable handoff repair; 75 Nathan Direct lineage re-audit; 76 normalization current-state reclassification; 77–80 routing/front-door currentness; 81–85 Dashboard/operational-currentness micro-audits; 86–89 formalization access/history/signature/branch checks; 90 external Viewer provenance-field comparison; 91 merge implementation trace; **92 scoped current manual catalog to exactly one record, preventing overgeneralization of the observed production gap beyond Srena while retaining the general implementation-level risk.**

## Best next operations
1. Rotate to a fresh Viewer/catalog/source-path or extraction/sample QA target rather than further elaborating Srena absent interface movement.
2. Inspect Sable inbox on future runs; if Run-71 review activates, supply the manual-external immutable-identity issue as adjacent design evidence rather than opening a duplicate request.
3. Re-audit autotag lineage only after generator/workflow/manifest state changes.
4. Recheck SAT_CONVOS_15 normalization only after duplicate paths, dating script, or manifest materially changes.
5. Keep Viewer navigation relations/dedup separate from archive source disposition.
6. Do not spend further cycles probing the missing Lean wrapper without new evidence.
