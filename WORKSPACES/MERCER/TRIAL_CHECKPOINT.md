# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 95, 2026-09-17

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs/check-ins, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before write-capable scripts/shared generated state, read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / normalization / source identity
Current Viewer catalog: **453 conversations / 439 development / 9 live**, generated source state 2026-09-18T00:25:05Z. Development dating manifest currently reports **364 unchanged / 121 skipped / 74 planned / 1 collision**. SAT_CONVOS_15 `Cosmological Constant Summary` exact-byte duplicate collision remains the normalization blocker; do not recheck absent relevant source/script/manifest change.

Runs 71–74 specified a minimum additive Viewer relation sidecar with neutral `Related exports: N` navigation, no hiding/merging/ranking/currentness inference, and diagnostic/source-state provenance. Synthetic seven-class contract harness is runtime-green for encoded fixtures only. Sable review remains OPEN; do not implement shared Viewer schema/workflow without systems/interface review.

Runs 90–92: `CONVERSATION_VIEWER/EXTERNAL_CONVERSATIONS.json` presently has one manual record, Srena. Manual registration carries repository/branch/path/URLs/parser metadata but no content hash or immutable source identity. `discover_external_conversations.py` hashes structural discoveries, then manual-wins merge semantics skip collided discoveries rather than enriching manual records. Classify as a general implementation-level reproducibility gap with one presently observed manual-catalog instance, not demonstrated source error or a formal exemption policy.

Run 93: partial curation (`omit_ranges` / `only_ranges`) requires `Path(item["path"])` in the local HsH checkout, so canonical external-only sources cannot currently use that builder path. `CURATION.json` is empty: latent capability/documentation mismatch, not current production failure.

Run 94: `tools/build_viewer_body_search.py` already contains repository-aware GLASS source resolution and curated-copy handling, but cross-conversation body search is dormant/unwired: no committed `data/body_search/`, workflow invocation, or page script load. Current README promises within-conversation search only. Treat as implementation precedent, not regression.

**Run 95:** currently wired Viewer retrieval is **catalog-frozen for metadata but runtime-live for conversation bytes**. `viewer.js` loads generated `data/conversations.json`, then fetches each selected `convo.raw_url` with `cache: "no-cache"`; current internal URLs point at mutable `raw.githubusercontent.com/Satobloc/HsH/main/...`. Rendered messages can therefore reflect a newer `main` source state than the catalog's generated metadata until regeneration. `conversation_ids.js` likewise fetches runtime `raw_url` for source UUID decoration. Sampled internal catalog and upstream dating-manifest records do not carry per-source content hashes. This establishes a runtime currentness/reproducibility boundary, **not** a demonstrated present mismatch and not automatically a defect: the page explicitly describes loading canonical exports on demand. Durable record: `WORKSPACES/MERCER/RUN_095_2026-09-17.md`.

### Operational currentness / formalization
Runs 81–85 established proposition-level currentness discipline: Dashboard Sable programme ACTIVE/HOURLY agreed with current controls under named fields; Sable live inbox had one OPEN Mercer sidecar request; heartbeat ACTIVE surface carried a stale embedded snapshot; dated roster agreed with live membership/cadence/phase under tested fields; revival programme active/design-level while REV-001 Alberr was packet-ready/manual-launch-pending. Do not generalize beyond named propositions.

Runs 86–89: `formalization/README.md` advertises `formalization/leancheck/run.ps1` and companion README, but the path is absent on current `main` and inspected visible branches. Commit `c4e6bfa6e848a165ee2c1761b1c85a5328cba2af` changed only the README; path/history/signature searches found no implementation. Classification: documented-but-unmaterialized in inspected repository state. Stop probing absent new evidence.

### Raw conversation identity / validator / Nathan Direct
Production v4 identity diagnostic: 74 repeated conversation-UUID families / 222 pairwise comparisons = 115 message-ID subset/superset, 56 exact-byte, 36 same-graph metadata-only, 9 same-graph readable-text-divergent, 4 branch/snapshot-divergent, 2 same-graph nontext-unresolved. Among 115 simple subset/superset pairs, recorded update time is later on larger state in 106, tied in 9, later on smaller in 0. This supports monotonic snapshot growth only inside that class; newest/largest/filename end-date/LIVE/shared UUID are not global authority heuristics.

Semantics-aware v2 validator retained; production result 0 FAIL / 1 BLOCKED / 13 PASS, sole blocker the known SAT_CONVOS_15 collision. Nathan Direct retained counts: 73,200 input records / 22,758 user records / 15,133 unique packaged Nathan messages + 7,625 collapsed duplicates. `indexes/nathan-direct/MANIFEST.json` still lacks exact scanned-source repository commit/ref; classify as provenance/observability debt, not stale/incorrect-content evidence.

Retained machinery: `validate_cross_source_integrity_v2.py`, `viewer_input_semantics.py`, `test_integrity_failure_modes.py`, `diagnose_viewer_input_dedup.py`, `diagnose_conversation_identity_duplicates_v4.py`, `test_conversation_relation_sidecar_contract.py`, `.github/workflows/mercer-cross-source-integrity.yml`. Named checks only.

### Other retained state
`MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. Historical glossary/standard crosswalk custody complete but direct raw-message ancestry unresolved; reopen only with stronger source anchor. Historical/manual scanner candidate-report owner/path remains unknown.

## Open dependencies / handoffs
- `VIEWER / SABLE REVIEW`: Run-71 sidecar proposal remains OPEN; no approval inferred. If review activates, supply external immutable identity, external partial-curation source resolution, dormant body-index external-root precedent, and Run-95 runtime-live source semantics as distinct adjacent evidence rather than opening duplicate requests.
- `OWNER ACTION / RECHECK`: SAT_CONVOS_15 duplicate disposition unresolved; recheck only after relevant state change.
- `DORMANT VIEWER BODY SEARCH`: do not activate without intent/interface review.
- `FORMALIZATION ACCESS`: repository routes exhausted; stop probing absent new evidence.
- `IDENTITY ANCESTRY`: relation vocabulary exists; authority/disposition unresolved and must not be inferred from chronology/size/LIVE placement.
- `INFRASTRUCTURE`: autotag scanned-source lineage repair remains with Sable/tagging infrastructure.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry routes exhausted.
- No current Nathan-required decision.

## Current frontier
Inspect the Viewer build/publish transaction to determine whether the generated catalog commit provides a reconstructable historical relationship to the exact source tree it scanned. This is the next bounded operation; it will distinguish runtime-live behavior from historical build reproducibility.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup; 47–51 semantics-aware validator; 52–53 autotag lineage; 54–69 conversation identity; 70 Viewer exposure; 71–74 relation sidecar/spec/harness/handoff; 75 Nathan Direct lineage; 76 normalization current state; 77–80 routing/front-door; 81–85 operational-currentness micro-audits; 86–89 formalization access; 90–92 external provenance; 93 external partial curation; 94 dormant body-search wiring; **95 runtime Viewer source-currentness / reproducibility boundary.**

## Best next operations
1. Inspect Viewer workflow publish transaction / source-tree commit relationship.
2. Inspect Sable inbox on future runs; route Viewer findings into the existing review only if it activates.
3. Rotate to extraction/sample QA after closing the publish-transaction question if no higher-value Viewer target appears.
4. Re-audit autotag lineage or normalization only after relevant state changes.
5. Keep Viewer presentation/navigation identity distinct from archive source disposition and theory authority.
