# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 64, 2026-09-16

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs/check-ins, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before touching write-capable scripts/shared generated state, also read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / manifest / exact-path dedup
Development summary remains **364 unchanged / 121 skipped / 74 planned / 1 collision** across 560 records. Viewer acceptance reconstruction established **454 accepted -> 453 post-dedup** with one duplicate path: the SAT_CONVOS_15 dated `Cosmological Constant Summary`. Manifest index 253 is the earlier unchanged winner; index 257 is collision. Both source files are identical blob SHA `40dd17e8d6114d65f54e5712ff8ee4e5fc3812a0`. Viewer-safe dedup does not disposition the archive duplicate or clear normalization.

### Raw conversation-identity QA
Runs 54–56 established the identity-layer blind spot and built `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates.py`, a read-only corpus diagnostic over Viewer-resolved accepted JSON inputs. Identity model separates raw artifact/path/blob identity, raw ChatGPT `conversation_id`, message graph/content relation, and Viewer presentation identity.

Run 57 production v1 (`35049604577`, artifact `10427898109`) scanned **412 JSON conversations with raw IDs**, found **74 repeated-ID families**, no unreadable inputs. `4D Topological Model Assessment` is `top-level-order-only`: identical 53-message graph, differing only in `safe_urls` ordering.

Run 58 triaged 222 pairwise comparisons: 66 subset candidates, 49 superset candidates, 56 exact-byte pairs, 18 top-level-order-only, 17 same-message-graph/top-level-metadata differences, **12 same-message-ID-set divergent-payload pairs**, and **4 divergent/unclassified pairs**. `Geometric Foundations Evaluation`, `Geometry in Physics`, and two `SAT Daily Action` comparisons remain graph branch/snapshot ancestry candidates.

Run 60 production v2 (`35061454854`, artifact `10432552752`, digest `sha256:c912619b5c8d56f2609e0a354209473ef82c7125395f32845691e598ac814ef3`) showed all 12 same-ID-set divergent-payload comparisons had zero side-only nodes and zero topology changes. Eleven contained changed `message.content`; `String Theory Particle Zoo` was mapping-content unchanged / metadata-only. `AI Enclosure Critique` had unusually broad model/tool metadata churn.

Run 61 separated publication freshness from source-content freshness: generated Viewer/manifest timestamp movement alone is not a reason to rerun identity QA when accepted raw inputs, acceptance semantics, and diagnostic code are unchanged.

Run 62 implemented v3 normalized ordinary-text projection. Run 63 observed production v3 (`35075994232`, artifact `10437669876`, digest `sha256:da5cb65ae8910977611c196877ed8d3f8ec5d55838469f8ae2278da0a5c2a16d`). Text-comparable content changes in `SAT Theorizer Emeritus`, `AI Enclosure Critique`, `Population Social Thresholds`, `Priority assessment summary`, `Friday Research Briefs`, `Continue Conversation Here`, and `H(s)H Archive Audit` include normalized ordinary-text changes. `String Theory Particle Zoo` remains metadata-only. Same UUID + same message-ID set + same topology is therefore insufficient for content-equivalence disposition.

Run 64 audited v3 denominator semantics and the unresolved `ChatGPT Voice Glitch` residue. The SAT_CONVOS_7 vs SAT_CONVOS_8 same-ID-set pair has 2,413 shared nodes, zero side-only/topology changes, exactly one changed shared/content node, and only `message.content.parts` differs; that changed content is not comparable under the narrow text projection. Separately, implementation inspection found `visible_text_comparable_changed_nodes` is incremented for any changed shared node with visible text on both sides, not only content-changed nodes. This explains `AI Enclosure Critique` reporting 344 comparable changed/shared nodes despite 54 content-changed nodes. `visible_text_changed_nodes` remains valid evidence of normalized-text divergence; the comparability denominator is semantically mislabeled and must be repaired/versioned before rate use. Durable record: `RUN_064_2026-09-16.md`.

### Validator production contract
Runs 47–51 established semantics-aware v2 validator + seven-specimen harness. Production v2 run `35016148194`: **0 FAIL / 1 BLOCKED / 13 PASS**; sole blocker is known SAT_CONVOS_15 normalization collision. Legacy validator remains reference-only.

### Autotag / Nathan Direct lineage
Runs 52–53 established coherent products at **73,200 input records / 22,758 user records / 15,133 unique packaged Nathan messages + 7,625 collapsed duplicates**, but no adjacent retained machine-readable manifest records the exact source commit scanned by the autotag job. This is provenance/observability debt, not evidence of stale/incorrect output. Implementation repair remains routed to Sable/tagging infrastructure; Mercer audits after repair.

### Source-integrity machinery
- `WORKSPACES/MERCER/validate_cross_source_integrity_v2.py`
- `WORKSPACES/MERCER/viewer_input_semantics.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py`
- `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`
- `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates.py` — v3 production-green, but Run-64 found one misleading comparability counter name/denominator
- `.github/workflows/mercer-cross-source-integrity.yml`

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; `BLOCKED` is an operational dependency, not corruption.

### Other retained state
Nathan Direct preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. `MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. Historical glossary/standard crosswalk custody is complete but direct raw-message ancestry remains unresolved; reopen only with stronger source anchor.

## Open dependencies
- `OWNER ACTION / RECHECK`: SAT_CONVOS_15 `Cosmological Constant Summary` duplicate disposition / normalization collision unresolved. Viewer path dedup does not disposition either source.
- `IDENTITY QA / NEXT`: repair/version v3 comparability denominator; add privacy-preserving structural carrier signatures for content-changed/text-uncomparable nodes; then rerun production QA. Do not add suppression semantics locally.
- `IDENTITY ANCESTRY`: reconstruct ancestry/currentness for text-divergent families and four graph-divergent cases without assuming longer/newer path is authoritative.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `INFRASTRUCTURE / HANDOFF`: autotag scanned-source lineage repair remains with Sable/tagging infrastructure; Mercer audits implementation.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- No current Nathan-required decision.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup diagnosis; 47–51 semantics-aware validator transition; 52–53 autotag lineage audit/handoff; 54–55 raw-UUID candidate investigation; 56 built corpus diagnostic; 57 v1 production; 58 high-risk identity residue; 59 v2 signatures; 60 v2 production; 61 freshness semantics; 62 v3 text projection; 63 v3 production classification; **64 audited Voice Glitch residue and found v3 comparability-denominator defect.**

## Best next operations
1. Repair/version `visible_text_comparable_changed_nodes` semantics by adding a content-scoped comparability counter; preserve prior artifact interpretability.
2. Add structural carrier signatures (types/keys/list lengths/hashes only, no values/bodies) for content-changed/text-uncomparable nodes and rerun production QA; use this first on `ChatGPT Voice Glitch`.
3. Reconstruct ancestry for text-divergent and graph-divergent families separately.
4. Inspect `AI Enclosure Critique` separately after denominator repair because of large tool/model metadata churn.
5. Audit any implemented autotag lineage repair.
6. Keep Viewer navigation dedup separate from archive source disposition.
