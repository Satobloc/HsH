# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 68, 2026-09-16

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md` where available, current coordination/handoffs/check-ins, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before write-capable scripts/shared generated state, read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / exact-path dedup
Development summary: **364 unchanged / 121 skipped / 74 planned / 1 collision** across 560 records. Viewer acceptance reconstruction: **454 accepted -> 453 post-dedup**. SAT_CONVOS_15 dated `Cosmological Constant Summary` has two identical source blobs (`40dd17e8d6114d65f54e5712ff8ee4e5fc3812a0`); Viewer-safe path dedup does not disposition either archive source or clear normalization.

### Raw conversation-identity QA
Runs 54–56 separated raw artifact/path/blob identity, ChatGPT `conversation_id`, message graph/content relation, and Viewer presentation identity and built the read-only corpus diagnostic.

Run 57 production v1 (`35049604577`, artifact `10427898109`) scanned **412 JSON conversations with raw IDs**, found **74 repeated-ID families**, no unreadable inputs. `4D Topological Model Assessment` is `top-level-order-only`: identical 53-message graph, differing only in `safe_urls` ordering.

Run 58 triaged 222 pairwise comparisons: 66 subset candidates, 49 superset candidates, 56 exact-byte pairs, 18 top-level-order-only, 17 same-message-graph/top-level-metadata differences, 12 same-message-ID-set divergent-payload pairs, and 4 graph-divergent comparisons.

Run 60 production v2 (`35061454854`, artifact `10432552752`) showed all 12 same-ID-set divergent-payload comparisons had zero side-only nodes and zero topology changes. Eleven contained changed `message.content`; `String Theory Particle Zoo` was metadata-only.

Run 61 established that publication freshness and source-content freshness are separate dimensions; generated timestamp movement alone does not require identity rerun.

Runs 62–63 production-tested v3 normalized ordinary-text projection (`35075994232`, artifact `10437669876`). Text-comparable content changes in seven named families include normalized-text changes. Same UUID + same message-ID set + same topology is insufficient for content-equivalence disposition.

Run 64 found the v3 comparability-denominator defect and localized `ChatGPT Voice Glitch` to one content-changed node outside the narrow text projection.

Run 65 created `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates_v4.py`; Run 66 wired it into `.github/workflows/mercer-cross-source-integrity.yml` at `4925a964cebfd1dd8cfa63dbdfe87e8327e81f38`.

Run 67 production v4 is green: workflow `35118273709`, artifact `10456196155`, digest `sha256:fb095cef2a5e0d396f74634dce1fc4965934405046929f3fb4841c2e161d8d62`. Corrected `AI Enclosure Critique`: 54 content-changed nodes, 54 text-comparable, 54 normalized-visible-text changed; remaining changed shared nodes are metadata churn. `ChatGPT Voice Glitch` remains one non-ordinary-text content node with stable carrier-shape signature; semantic equivalence is not established.

Run 68 audited the graph-divergent ancestry counterexamples from the retained v4 artifact. `Geometric Foundations Evaluation` is later/larger but mutually side-exclusive (483 vs 224 message IDs; 147 shared; 84 topology-changed shared nodes). `Geometry in Physics` is the critical later/smaller case (3279 vs 2522 IDs; 2487 shared; 792 vs 35 side-only mapping nodes; 1062 topology-changed shared nodes; 90 normalized-visible-text changed nodes). `SAT Daily Action` has a 635-message July/LIVE state byte-identical across two paths and a newer 511-message September state; they share 434 IDs with 201 vs 77 side-only mapping nodes and 219 topology-changed shared nodes. These are branch/snapshot ancestry, not safe UUID duplicates. `newest == most complete`, `largest == authoritative`, and `LIVE path == conversation-level current authority` are all unsafe heuristics. Durable record: `WORKSPACES/MERCER/RUN_068_2026-09-16.md`.

### Validator production contract
Runs 47–51 established semantics-aware v2 validator + seven-specimen harness. Production v2 run `35016148194`: **0 FAIL / 1 BLOCKED / 13 PASS**; sole blocker is known SAT_CONVOS_15 normalization collision. Legacy validator remains reference-only.

### Autotag / Nathan Direct lineage
Runs 52–53: **73,200 input records / 22,758 user records / 15,133 unique packaged Nathan messages + 7,625 collapsed duplicates**. No adjacent retained machine-readable manifest records the exact source commit scanned by the autotag job. This is provenance/observability debt, not evidence of stale/incorrect output. Repair remains routed to Sable/tagging infrastructure; Mercer audits after repair.

### Source-integrity machinery
- `WORKSPACES/MERCER/validate_cross_source_integrity_v2.py`
- `WORKSPACES/MERCER/viewer_input_semantics.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py`
- `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`
- `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates.py` — v3 historical; denominator caveat
- `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates_v4.py` — production-green
- `.github/workflows/mercer-cross-source-integrity.yml` — invokes v4

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; `BLOCKED` is an operational dependency, not corruption.

### Other retained state
Nathan Direct preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. `MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. Historical glossary/standard crosswalk custody is complete but direct raw-message ancestry remains unresolved; reopen only with stronger source anchor.

## Open dependencies
- `OWNER ACTION / RECHECK`: SAT_CONVOS_15 `Cosmological Constant Summary` duplicate disposition / normalization collision unresolved. Viewer path dedup does not disposition either source.
- `IDENTITY ANCESTRY / NEXT`: extend explicit relation labeling across all repeated-UUID families; preserve branch/snapshot relations and do not infer authority from newest/largest/LIVE placement.
- `VIEWER / NEXT`: reconcile identity/branch relations against Viewer acceptance/presentation without source suppression; route shared-schema proposals through Sable.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `INFRASTRUCTURE / HANDOFF`: autotag scanned-source lineage repair remains with Sable/tagging infrastructure; Mercer audits implementation.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- No current Nathan-required decision.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup diagnosis; 47–51 semantics-aware validator transition; 52–53 autotag lineage audit/handoff; 54–55 raw-UUID candidate investigation; 56 diagnostic; 57 v1 production; 58 high-risk residue; 59 v2; 60 v2 production; 61 freshness semantics; 62 v3; 63 v3 production; 64 denominator defect; 65 staged v4 repair; 66 v4 workflow wiring; 67 v4 production audit; **68 graph-divergent ancestry audit.**

## Best next operations
1. Produce a read-only all-family branch/relation report combining structural relation and time ordering without authority inference.
2. Reconcile branch relations against Viewer acceptance/presentation and identify where provenance can be exposed without suppression.
3. Route any shared Viewer/catalog branch-relation schema proposal through Sable.
4. Audit any implemented autotag lineage repair.
5. Keep Viewer navigation dedup separate from archive source disposition.
