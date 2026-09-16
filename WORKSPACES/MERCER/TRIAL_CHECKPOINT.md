# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 66, 2026-09-16

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

Run 58 triaged 222 pairwise comparisons: 66 subset candidates, 49 superset candidates, 56 exact-byte pairs, 18 top-level-order-only, 17 same-message-graph/top-level-metadata differences, **12 same-message-ID-set divergent-payload pairs**, and **4 divergent/unclassified pairs**. `Geometric Foundations Evaluation`, `Geometry in Physics`, and two `SAT Daily Action` comparisons remain graph branch/snapshot ancestry candidates.

Run 60 production v2 (`35061454854`, artifact `10432552752`, digest `sha256:c912619b5c8d56f2609e0a354209473ef82c7125395f32845691e598ac814ef3`) showed all 12 same-ID-set divergent-payload comparisons had zero side-only nodes and zero topology changes. Eleven contained changed `message.content`; `String Theory Particle Zoo` was metadata-only. `AI Enclosure Critique` had unusually broad model/tool metadata churn.

Run 61 established that publication freshness and source-content freshness are separate dimensions; generated timestamp movement alone does not require identity rerun.

Runs 62–63 implemented and production-tested v3 normalized ordinary-text projection (`35075994232`, artifact `10437669876`, digest `sha256:da5cb65ae8910977611c196877ed8d3f8ec5d55838469f8ae2278da0a5c2a16d`). Text-comparable content changes in `SAT Theorizer Emeritus`, `AI Enclosure Critique`, `Population Social Thresholds`, `Priority assessment summary`, `Friday Research Briefs`, `Continue Conversation Here`, and `H(s)H Archive Audit` include normalized-text changes. Same UUID + same message-ID set + same topology is insufficient for content-equivalence disposition.

Run 64 found a v3 denominator defect: `visible_text_comparable_changed_nodes` counts any changed shared node with visible text on both sides, not only content-changed nodes. `visible_text_changed_nodes` remains valid evidence; rates using the comparability denominator do not. `ChatGPT Voice Glitch` is localized to one content-changed node with only `message.content.parts` differing and is outside the narrow text projection.

Run 65 created `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates_v4.py` (commit `312d39d36d0bd8b48c874569fffbbd0e822e91ab`). V4 adds a genuinely content-scoped comparability counter and structural carrier signatures for content-changed/text-uncomparable nodes using only types, keys, list lengths/item-type counts, and structural SHA-256 hashes—no bodies/scalar values.

Run 66 safely wired v4 into `.github/workflows/mercer-cross-source-integrity.yml` using current-blob-SHA Contents-API CAS at commit `4925a964cebfd1dd8cfa63dbdfe87e8327e81f38`. Workflow run `35118273709` was triggered and observed `in_progress`; therefore v4 is workflow-selected but **not yet production-green**. Durable record: `RUN_066_2026-09-16.md`.

### Validator production contract
Runs 47–51 established semantics-aware v2 validator + seven-specimen harness. Production v2 run `35016148194`: **0 FAIL / 1 BLOCKED / 13 PASS**; sole blocker is known SAT_CONVOS_15 normalization collision. Legacy validator remains reference-only.

### Autotag / Nathan Direct lineage
Runs 52–53: **73,200 input records / 22,758 user records / 15,133 unique packaged Nathan messages + 7,625 collapsed duplicates**. No adjacent retained machine-readable manifest records the exact source commit scanned by the autotag job. This is provenance/observability debt, not evidence of stale/incorrect output. Repair remains routed to Sable/tagging infrastructure; Mercer audits after repair.

### Source-integrity machinery
- `WORKSPACES/MERCER/validate_cross_source_integrity_v2.py`
- `WORKSPACES/MERCER/viewer_input_semantics.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py`
- `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`
- `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates.py` — v3 historical production-green; denominator caveat from Run 64
- `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates_v4.py` — workflow-selected; first production run pending
- `.github/workflows/mercer-cross-source-integrity.yml` — invokes v4 as of Run 66

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; `BLOCKED` is an operational dependency, not corruption.

### Other retained state
Nathan Direct preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. `MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. Historical glossary/standard crosswalk custody is complete but direct raw-message ancestry remains unresolved; reopen only with stronger source anchor.

## Open dependencies
- `OWNER ACTION / RECHECK`: SAT_CONVOS_15 `Cosmological Constant Summary` duplicate disposition / normalization collision unresolved. Viewer path dedup does not disposition either source.
- `IDENTITY QA / NEXT`: observe production run `35118273709`; inspect `ChatGPT Voice Glitch` structural signature and corrected `AI Enclosure Critique` counts. Do not add suppression semantics locally.
- `IDENTITY ANCESTRY`: reconstruct ancestry/currentness for text-divergent families and four graph-divergent cases without assuming longer/newer path is authoritative.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `INFRASTRUCTURE / HANDOFF`: autotag scanned-source lineage repair remains with Sable/tagging infrastructure; Mercer audits implementation.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- No current Nathan-required decision.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup diagnosis; 47–51 semantics-aware validator transition; 52–53 autotag lineage audit/handoff; 54–55 raw-UUID candidate investigation; 56 diagnostic; 57 v1 production; 58 high-risk residue; 59 v2; 60 v2 production; 61 freshness semantics; 62 v3; 63 v3 production; 64 denominator defect; 65 staged v4 repair; **66 safe v4 workflow wiring, first production run pending.**

## Best next operations
1. Observe run `35118273709` and audit its retained v4 artifact.
2. Inspect `ChatGPT Voice Glitch` structural signature and corrected `AI Enclosure Critique` denominator/counts.
3. After production-green v4, reconstruct ancestry for text-divergent and graph-divergent families separately.
4. Audit any implemented autotag lineage repair.
5. Keep Viewer navigation dedup separate from archive source disposition.
