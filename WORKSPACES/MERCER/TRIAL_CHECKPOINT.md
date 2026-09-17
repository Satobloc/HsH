# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 79, 2026-09-17

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs/check-ins, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before write-capable scripts/shared generated state, read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / normalization / exact-path dedup
Current development dating manifest: **364 unchanged / 121 skipped / 74 planned / 1 collision**, mode **dry-run**, generated `2026-09-17T01:30:01.653259+00:00`. Run 76 rechecked the long-open SAT_CONVOS_15 `Cosmological Constant Summary` collision because generated state had materially changed since Run 29. Both undated and dated paths still exist and remain byte-identical at blob `40dd17e8d6114d65f54e5712ff8ee4e5fc3812a0`; the collision is unresolved. Current `tools/date_conversation_exports.py` still has an all-or-nothing apply guard: with `--apply`, any collision converts every `planned` record to `blocked`. Therefore current state is **1 unresolved exact-byte collision + 74 planned dry-run renames that would be blocked under apply while the collision remains**. Do not compare `planned` and `blocked` counts across manifests without carrying manifest `mode`. Durable record: `WORKSPACES/MERCER/RUN_076_2026-09-17.md`.

Run 77 found that the still-open Common `HANDOFFS.md` normalization entry retains the historical Run-29 wording that the collision leaves **48** other rename records blocked. That count is now stale relative to the current dry-run state above. Treat `48 blocked` as a historical snapshot, not current operational state. The shared handoff was not rewritten opportunistically; durable audit: `WORKSPACES/MERCER/RUN_077_2026-09-17.md`.

Viewer acceptance reconstruction remains **454 accepted -> 453 post-dedup**. Viewer-safe SHA/path dedup is presentation-only and does not disposition either archive source or clear normalization.

Run 70: generated Viewer catalog is **453 conversations / 439 development / 9 live** plus registered external entries. Viewer-local ID and exact source path are catalog metadata; embedded ChatGPT `conversation_id` is displayed as CID after opening a source, but repeated-family membership/relation is not first-class catalog/list metadata.

Run 78 found a second mutable-state drift in the long-lived Common routing layer: `COORDINATION.md` still advertises the 2026-09-13 Viewer state as **374 total / 365 development / 9 live**, while Mercer's later direct catalog audit established **453 conversations / 439 development / 9 live** plus registered external entries. Treat the 374/365/9 figures as a dated historical snapshot, not current Viewer state. This is documentation-currentness debt only; it does not imply Viewer/catalog corruption. The shared coordination surface was not rewritten opportunistically.

Run 79 checked the current root `README.md` front door for propagation of these mutable Viewer counts. The README links the Viewer/archive without stating total/development/live counts, so the specific stale-count defect is **not propagated onto the root public front door**. This is a bounded negative result, not an audit of every Dashboard/wayfinding surface. Durable record: `WORKSPACES/MERCER/RUN_079_2026-09-17.md`.

Runs 71–74: minimum additive Viewer relation sidecar specified, with neutral `Related exports: N` navigation, no hiding/merging/ranking/currentness inference, and diagnostic/source-state provenance. Synthetic seven-class contract harness `WORKSPACES/MERCER/test_conversation_relation_sidecar_contract.py` is runtime-green for its encoded fixtures only. Durable Sable inbox request exists and remains OPEN; do not implement shared Viewer schema/workflow without systems/interface review.

### Raw conversation-identity QA
Production v4 workflow `35118273709`, artifact `10456196155`, digest `sha256:fb095cef2a5e0d396f74634dce1fc4965934405046929f3fb4841c2e161d8d62` is green. Across **74 repeated conversation-UUID families / 222 pairwise comparisons**: **115 message-ID subset/superset, 56 exact-byte, 36 same-graph metadata-only, 9 same-graph readable-text-divergent, 4 branch/snapshot-divergent, 2 same-graph nontext-unresolved**. Among 115 simple subset/superset pairs, recorded `update_time` is later on the larger/superset state in 106, tied in 9, later on smaller in 0. This supports monotonic snapshot growth only inside that class. Graph-divergent counterexamples establish that newest, largest, filename end-date, LIVE placement, and shared conversation UUID are not global authority heuristics. Runs 54–69 contain the full diagnostic lineage and caveats.

### Validator production contract
Runs 47–51 established semantics-aware v2 validator + seven-specimen harness. Production v2 run `35016148194`: **0 FAIL / 1 BLOCKED / 13 PASS**; sole blocker is the known SAT_CONVOS_15 normalization collision. `BLOCKED` is an operational dependency, not corruption. Legacy validator remains reference-only.

### Autotag / Nathan Direct lineage
Runs 52–53: **73,200 input records / 22,758 user records / 15,133 unique packaged Nathan messages + 7,625 collapsed duplicates**. Run 75 re-audited current package surfaces: `indexes/nathan-direct/MANIFEST.json` blob `109b6491fdeb5dc65e526e6d5aa62369fbf68418` still lacks exact scanned-source repository commit/ref; `WORKSPACES/COMMON/scripts/package_nathan_direct.py` blob `61922b7bd2d3ebd2e81e275a52e4c7e127072dfd` likewise does not accept/propagate/emit that lineage. This is provenance/observability debt, not evidence of stale/incorrect contents. Repair remains routed to Sable/tagging infrastructure; do not re-audit until relevant generator/workflow/manifest state changes.

### Source-integrity machinery
- `WORKSPACES/MERCER/validate_cross_source_integrity_v2.py`
- `WORKSPACES/MERCER/viewer_input_semantics.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py`
- `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`
- `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates.py` — v3 historical; denominator caveat
- `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates_v4.py` — production-green
- `WORKSPACES/MERCER/test_conversation_relation_sidecar_contract.py` — runtime-green for encoded synthetic fixtures; not production-integrated
- `.github/workflows/mercer-cross-source-integrity.yml` — invokes v4

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; named checks only.

### Other retained state
Nathan Direct preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. `MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. Historical glossary/standard crosswalk custody is complete but direct raw-message ancestry remains unresolved; reopen only with stronger source anchor. Exact raw IDs for September 13 Mercer live-source statements remain unavailable. Historical/manual scanner candidate-report owner/path remains unknown.

## Open dependencies
- `OWNER ACTION / RECHECK`: SAT_CONVOS_15 exact-byte duplicate disposition / normalization collision unresolved. Current measurable impact is 74 dry-run planned candidates that would block in apply mode. Do not recheck until duplicate paths, dating script, or manifest materially changes.
- `ROUTING CURRENTNESS`: Common `HANDOFFS.md` still carries historical `48 blocked` Run-29 state, and Common `COORDINATION.md` still carries historical Viewer `374 total / 365 development / 9 live` state. Current verified states are recorded above; root README does not repeat the Viewer counts. Refresh shared routing wording when its owner next maintains those surfaces.
- `VIEWER / SABLE REVIEW`: Run-71 sidecar proposal remains OPEN in Sable inbox; no approval inferred.
- `IDENTITY ANCESTRY`: relation vocabulary exists; authority/disposition remains unresolved and must not be inferred from chronology/size/LIVE placement.
- `INFRASTRUCTURE / HANDOFF`: autotag scanned-source lineage repair remains with Sable/tagging infrastructure.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- No current Nathan-required decision.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup diagnosis; 47–51 semantics-aware validator transition; 52–53 autotag lineage audit/handoff; 54–69 conversation-identity diagnostics through production v4 and all-family ancestry classification; 70 Viewer exposure audit; 71 sidecar specification; 72–73 synthetic sidecar harness staged/runtime-green; 74 continuity + Sable handoff repair; 75 Nathan Direct lineage re-audit; 76 normalization collision current-state reclassification; 77 shared-handoff currentness audit; 78 shared-coordination currentness audit; **79 root README front-door currentness audit: Viewer mutable counts are not copied there, bounding the known stale-count defect away from this public front door.**

## Best next operations
1. Inspect one actual Dashboard/wayfinding surface beyond the root README for copied mutable Viewer/normalization counts or stale operational status; stop after that one surface.
2. Inspect Sable response/state for the Run-71 Viewer relation-sidecar proposal; do not implement shared schema unilaterally.
3. Re-audit autotag lineage only after relevant generator/workflow/manifest state changes.
4. Recheck SAT_CONVOS_15 normalization only after duplicate paths, dating script, or manifest materially changes.
5. Keep Viewer navigation dedup separate from archive source disposition.
