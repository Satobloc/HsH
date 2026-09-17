# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 86, 2026-09-17

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs/check-ins, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before write-capable scripts/shared generated state, read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / normalization / exact-path dedup
Current development dating manifest: **364 unchanged / 121 skipped / 74 planned / 1 collision**, mode **dry-run**, generated `2026-09-17T01:30:01.653259+00:00`. SAT_CONVOS_15 `Cosmological Constant Summary` undated/dated paths still exist and are byte-identical at blob `40dd17e8d6114d65f54e5712ff8ee4e5fc3812a0`. Current dating script retains the all-or-nothing apply guard, so the 74 dry-run planned renames would become blocked if apply were attempted while the collision remains. Durable audit: Run 76.

Common `HANDOFFS.md` still carries historical `48 blocked` Run-29 wording; treat it as a dated snapshot, not current state. Common `COORDINATION.md` likewise still advertises historical Viewer `374 total / 365 development / 9 live`; current audited Viewer state is **453 conversations / 439 development / 9 live** plus registered external entries. Root HsH README and Nathan Dashboard do not repeat those mutable counts. Durable audits: Runs 77–80.

Viewer acceptance reconstruction remains **454 accepted -> 453 post-dedup**. Viewer-safe SHA/path dedup is presentation-only and does not disposition archive sources or clear normalization.

Runs 71–74 specified a minimum additive Viewer relation sidecar with neutral `Related exports: N` navigation, no hiding/merging/ranking/currentness inference, and diagnostic/source-state provenance. Synthetic seven-class contract harness `WORKSPACES/MERCER/test_conversation_relation_sidecar_contract.py` is runtime-green for encoded fixtures only. The Sable review request remains OPEN; do not implement shared Viewer schema/workflow without systems/interface review.

### Dashboard / operational-currentness audits
Run 81: Dashboard `Sable systems / capability programme = ACTIVE HOURLY` agrees with current automation control/roster under the named active/hourly check only.

Run 82: current `WORKSPACES/SABLE/INBOX.md` has **1 OPEN item**, Mercer's 2026-09-16 20:49 ET Viewer relation-sidecar request. Sable's older continuity checkpoint statement that there were no open items is explicitly scoped to its 2026-09-15 update and is historical, not current queue state.

Run 83: Dashboard-linked `INSTANCE_HEARTBEAT_MONITOR.md` remains explicitly **ACTIVE**, so the Dashboard's narrow heartbeat/continuity ACTIVE proposition is current under that named check. But the monitor's embedded `Current snapshot — 2026-09-14 23:48 EDT` is stale as present-state evidence: it still describes Mercer at Run 35 and says Sable has no submitted worker questions, while Mercer is now through Run 83 and the live Sable inbox has 1 OPEN request. Treat operational-surface ACTIVE status and embedded snapshot freshness as independent fields. Durable record: `WORKSPACES/MERCER/RUN_083_2026-09-17.md`.

Run 84: `ACTIVE_AUTOMATION_ROSTER.md` is explicitly a 2026-09-14 snapshot, but its five enabled recurring-worker memberships, enabled/disabled classifications, hourly cadence, and phase minutes still agree with live scheduler state under the named comparison. Old Morrow and standalone Revival Rotation tasks are disabled live, consistent with the roster. This does not establish scheduler health, execution quality, checkpoint freshness, role-description currentness, or completeness outside the project-worker set. Durable record: `WORKSPACES/MERCER/RUN_084_2026-09-17.md`.

Run 85: Dashboard `Revival rotation / reentry = ACTIVE / SANDBOX-ROUTED` is defensible only at programme/design-controller level. The protocol is `ACTIVE DESIGN`, while the first explicitly ledgered revival (`REV-001 — Alberr`) is `PACKET-READY / CONSULTANT-OFFER-PENDING-MANUAL-LAUNCH`; no inspected roster entry is in an execution/post-launch state. Current durable reading: **programme active; first recorded packet ready; manual launch pending**. Do not infer an executing revival attempt or completed sandbox reentry from the Dashboard's `ACTIVE` token alone. Durable record: `WORKSPACES/MERCER/RUN_085_2026-09-17.md`.

Run 86: Dashboard `Equation / proof formalization = ACTIVE CAPABILITY TEST / LOW COVERAGE` still routes to the live HsH `formalization/` programme, but that programme's current README documents `formalization/leancheck/run.ps1` and `formalization/leancheck/README.md` while the current top-level directory has no `leancheck/` entry and direct fetch of the advertised README returns 404. Treat this as a **subordinate documentation/access-path consistency defect**, not evidence that the registry is inactive or that any Python/Lean/theory claim passes or fails. Durable record: `WORKSPACES/MERCER/RUN_086_2026-09-17.md`.

### Raw conversation-identity QA
Production v4 workflow `35118273709`, artifact `10456196155`, digest `sha256:fb095cef2a5e0d396f74634dce1fc4965934405046929f3fb4841c2e161d8d62` is green. Across **74 repeated conversation-UUID families / 222 pairwise comparisons**: **115 message-ID subset/superset, 56 exact-byte, 36 same-graph metadata-only, 9 same-graph readable-text-divergent, 4 branch/snapshot-divergent, 2 same-graph nontext-unresolved**. Among 115 simple subset/superset pairs, recorded `update_time` is later on the larger/superset state in 106, tied in 9, later on smaller in 0. This supports monotonic snapshot growth only inside that class. Graph-divergent counterexamples establish that newest, largest, filename end-date, LIVE placement, and shared conversation UUID are not global authority heuristics. Runs 54–69 contain diagnostic lineage/caveats.

### Validator production contract
Runs 47–51 established semantics-aware v2 validator + seven-specimen harness. Production v2 run `35016148194`: **0 FAIL / 1 BLOCKED / 13 PASS**; sole blocker is the known SAT_CONVOS_15 normalization collision. `BLOCKED` is an operational dependency, not corruption. Legacy validator remains reference-only.

### Autotag / Nathan Direct lineage
Runs 52–53: **73,200 input records / 22,758 user records / 15,133 unique packaged Nathan messages + 7,625 collapsed duplicates**. Run 75 re-audited current package surfaces: `indexes/nathan-direct/MANIFEST.json` still lacks exact scanned-source repository commit/ref, and `WORKSPACES/COMMON/scripts/package_nathan_direct.py` does not accept/propagate/emit that lineage. This is provenance/observability debt, not evidence of stale/incorrect contents. Repair remains routed to Sable/tagging infrastructure; do not re-audit until generator/workflow/manifest state changes.

### Source-integrity machinery
- `WORKSPACES/MERCER/validate_cross_source_integrity_v2.py`
- `WORKSPACES/MERCER/viewer_input_semantics.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py`
- `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`
- `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates_v4.py` — production-green
- `WORKSPACES/MERCER/test_conversation_relation_sidecar_contract.py` — synthetic-fixture runtime-green; not production-integrated
- `.github/workflows/mercer-cross-source-integrity.yml` — invokes v4

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; named checks only.

### Other retained state
Nathan Direct preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. `MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. Historical glossary/standard crosswalk custody is complete but direct raw-message ancestry remains unresolved; reopen only with stronger source anchor. Exact raw IDs for September 13 Mercer live-source statements remain unavailable. Historical/manual scanner candidate-report owner/path remains unknown.

## Open dependencies
- `OWNER ACTION / RECHECK`: SAT_CONVOS_15 exact-byte duplicate disposition / normalization collision unresolved. Recheck only after duplicate paths, dating script, or manifest materially changes.
- `ROUTING CURRENTNESS`: Common `HANDOFFS.md` retains historical `48 blocked`; Common `COORDINATION.md` retains historical Viewer `374/365/9`; `INSTANCE_HEARTBEAT_MONITOR.md` remains ACTIVE but its embedded 2026-09-14 snapshot is stale. Refresh when respective owners next maintain those surfaces.
- `VIEWER / SABLE REVIEW`: Run-71 sidecar proposal remains OPEN in Sable inbox; no approval inferred.
- `FORMALIZATION ACCESS`: `formalization/README.md` advertises `formalization/leancheck/*`, but that path is not currently materialized on `main`. Determine history/intent before repair; do not infer Lean execution state from the missing path.
- `IDENTITY ANCESTRY`: relation vocabulary exists; authority/disposition remains unresolved and must not be inferred from chronology/size/LIVE placement.
- `INFRASTRUCTURE / HANDOFF`: autotag scanned-source lineage repair remains with Sable/tagging infrastructure.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- No current Nathan-required decision.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup diagnosis; 47–51 semantics-aware validator transition; 52–53 autotag lineage audit/handoff; 54–69 conversation-identity diagnostics through production v4/all-family ancestry classification; 70 Viewer exposure audit; 71 sidecar specification; 72–73 synthetic harness; 74 continuity + Sable handoff repair; 75 Nathan Direct lineage re-audit; 76 normalization current-state reclassification; 77–80 routing/front-door currentness audits; 81 Dashboard Sable-programme micro-audit; 82 Sable inbox/currentness audit; 83 Dashboard-linked heartbeat audit; 84 live-scheduler comparison; 85 revival-rotation status-granularity audit; **86 formalization access-path audit: top-level programme live, advertised `leancheck/` subordinate path absent.**

## Best next operations
1. Inspect Sable response/inbox state for the Run-71 Viewer relation-sidecar proposal; do not implement shared schema unilaterally.
2. Trace `formalization/leancheck` history/intent before proposing any README or tooling repair.
3. Re-audit autotag lineage only after relevant generator/workflow/manifest state changes.
4. Recheck SAT_CONVOS_15 normalization only after duplicate paths, dating script, or manifest materially changes.
5. Keep Viewer navigation dedup separate from archive source disposition.
6. If continuing Dashboard/Common currentness, audit one not-yet-covered proposition per micro-bite.