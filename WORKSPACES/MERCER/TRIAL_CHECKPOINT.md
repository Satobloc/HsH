# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 62, 2026-09-16

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs/check-ins, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before touching write-capable scripts/shared generated state, also read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / manifest / exact-path dedup
Development summary: **364 unchanged / 121 skipped / 74 planned / 1 collision** across 560 records. Viewer has **453 conversations** from declared accepted inputs 439 development + 9 live + 6 external = **454**. Production uses `tools/build_conversation_viewer_resolved.py`: existing supported `new_path` before `old_path`; collision/blocked rename status does not itself make a materialized source Viewer-ineligible.

Run-46 diagnostic artifact `10399888652` reconstructs **454 accepted -> 453 post-dedup** with exactly one duplicate path, the SAT_CONVOS_15 dated `Cosmological Constant Summary`. Manifest index 253 is the earlier unchanged winner; index 257 is collision. Both source files are identical blob SHA `40dd17e8d6114d65f54e5712ff8ee4e5fc3812a0`. Viewer-safe dedup does **not** disposition the archive duplicate or clear the normalization blocker.

### Raw conversation-identity QA
Runs 54–56 established the identity-layer blind spot and built `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates.py`, a read-only corpus diagnostic over Viewer-resolved accepted JSON inputs. Identity model separates raw artifact/path/blob identity, raw ChatGPT `conversation_id`, message-graph/content relation, and Viewer presentation identity.

Run 57 observed production v1: Actions run `35049604577`, artifact `10427898109`, scanned **412 JSON conversations with raw IDs**, found **74 repeated-ID families**, and no unreadable inputs. The `4D Topological Model Assessment` pair is `top-level-order-only`: identical 53-message mapping graph, differing only in `safe_urls` ordering. Raw UUID equality is therefore an identity/provenance key, not a sufficient content-equivalence predicate.

Run 58 triaged all 222 pairwise comparisons. Taxonomy: 66 subset candidates, 49 superset candidates, 56 exact-byte pairs, 18 top-level-order-only, 17 same-message-graph/top-level-metadata differences, **12 same-message-ID-set divergent-payload pairs**, and **4 divergent/unclassified pairs**. The four divergent cases (`Geometric Foundations Evaluation`, `Geometry in Physics`, and two `SAT Daily Action` comparisons) have substantial graph-cardinality/overlap differences and remain branch/snapshot ancestry candidates. Durable record: `RUN_058_2026-09-16.md`.

Run 59 implemented privacy-preserving mapping-internal signatures at commit `e83c2c2fae2b5293cece1f4b275b3e363efffd71`.

Run 60 observed production v2: Actions run `35061454854` completed successfully; artifact `10432552752`, digest `sha256:c912619b5c8d56f2609e0a354209473ef82c7125395f32845691e598ac814ef3`. Across all 12 same-message-ID-set divergent-payload comparisons, **side-only mapping nodes = 0 and topology-changed nodes = 0**. Eleven comparisons contain at least one changed `message.content` node; one (`String Theory Particle Zoo`) is metadata-only at mapping level (`message.update_time` only, zero content changes). Content-bearing families include `SAT Theorizer Emeritus`, `AI Enclosure Critique`, `Population Social Thresholds`, `Priority assessment summary`, `ChatGPT Voice Glitch`, `Friday Research Briefs`, `Continue Conversation Here`, and `H(s)H Archive Audit`. `AI Enclosure Critique` is exceptional for large model/tool-response metadata churn in addition to 54 content-changed nodes. These signatures do not establish human-visible semantic difference because retained v2 output intentionally omits differing values. Durable record: `RUN_060_2026-09-16.md`.

Run 61 audited post-Run-60 publication freshness. Commit `c5cddd8e3bc82d6f5281dade17e2980d77670771` refreshed only Viewer/discovery/manifest generated surfaces and timestamps; its changed-file list contains no raw conversation sources, while shown development/live accepted counts remain 439/9. This specific refresh therefore makes publication timestamps newer without evidence of conversation-content drift and does not invalidate Run-60's content/topology taxonomy. Future freshness checks should distinguish publication-state freshness from accepted-source-content freshness and rerun identity QA when intervening commits touch accepted raw inputs, acceptance semantics, or the diagnostic—not solely for timestamp-only refreshes. Durable record: `RUN_061_2026-09-16.md`.

Run 62 implemented diagnostic v3 at commit `3f459f8d05f206f67fce563fe42deb4dd770fe97`. V3 adds a privacy-preserving normalized text projection over ordinary `message.content.parts` / `message.content.text` carriers and reports only counts/hashes: comparable changed nodes, normalized-text-changed nodes, and content-changed-but-normalized-text-equal nodes. It deliberately ignores representation metadata (`content_type`, language, response-format labels) and retains no body text. This can distinguish serialized-content churn with equal text from changed text, but it is **not** a complete human-visible-content serializer: images, attachments, citations, tool payloads, multimodal objects, and other non-text semantics remain outside the projection. Production v3 artifact not yet observed; no Run-60 pair is reclassified yet. Durable record: `RUN_062_2026-09-16.md`.

### Validator production contract
Runs 47–51 established the semantics-aware v2 validator and seven-specimen harness. Production v2 run `35016148194` completed with **0 FAIL / 1 BLOCKED / 13 PASS**; sole blocker is the known SAT_CONVOS_15 normalization collision. Legacy validator is reference-only because it retains the known false pre-dedup/post-dedup arithmetic failure. Active workflow contract commit: `02b4ac3a8264fffd2d70afda7f5d4a2f2c8834ad`.

### Autotag / Nathan Direct generation lineage
Runs 52–53 established coherent durable products at **73,200 input records / 22,758 user records / 15,133 unique packaged Nathan messages + 7,625 collapsed duplicate records**, but no adjacent retained machine-readable manifest records the exact source commit scanned by the autotag job. This is observability/provenance debt, not evidence outputs are stale or incorrect. Durable analysis: `AUTOTAG_LINEAGE_QA_2026-09-15.md`; handoff: `HANDOFF_AUTOTAG_LINEAGE_2026-09-15.md`. Implementation routed to Sable/tagging infrastructure; Mercer audits after repair.

### Source-integrity machinery
- `WORKSPACES/MERCER/validate_cross_source_integrity_v2.py` — active semantics-aware production validator
- `WORKSPACES/MERCER/viewer_input_semantics.py` — shared production-semantics adapter
- `WORKSPACES/MERCER/validate_cross_source_integrity.py` — legacy reference validator
- `WORKSPACES/MERCER/test_validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py` — seven-specimen harness
- `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`
- `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates.py` — repeated raw-UUID reporting diagnostic; v2 production-green under run `35061454854`; v3 normalized-text projection committed in Run 62, production artifact pending
- `.github/workflows/mercer-cross-source-integrity.yml`

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; `BLOCKED` is an operational dependency, not corruption.

### Other retained state
Nathan Direct: **15,133 packaged unique + 7,625 collapsed duplicates = 22,758 input user records**; year shards sum to 15,133 and Stage-2 `source_records = 15133`. Preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`.

`MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. `extract_raw_window.py` is a bounded `content.parts` helper, not a complete-content serializer.

Historical glossary/standard crosswalk: inventory/custody complete; direct raw-message ancestry unresolved for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt`; reopen only with stronger source anchor.

## Open dependencies
- `OWNER ACTION / RECHECK`: SAT_CONVOS_15 Cosmological Constant Summary duplicate disposition / normalization collision unresolved. Viewer path dedup does not disposition either source.
- `IDENTITY QA / NEXT`: observe v3 production output, then classify the 11 content-bearing same-ID-set comparisons by normalized text equality; do not treat text equality as complete semantic equivalence. Keep the four graph-divergent cases on the branch/snapshot ancestry track. Do not add suppression semantics locally.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `INFRASTRUCTURE / HANDOFF`: autotag scanned-source lineage repair remains with Sable/tagging infrastructure; Mercer audits implementation.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- No current Nathan-required decision.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup diagnosis; 47–51 semantics-aware validator transition; 52–53 autotag lineage audit/handoff; 54–55 raw-UUID candidate investigation; 56 built corpus diagnostic; 57 observed v1 production; 58 bounded high-risk identity residue; 59 implemented mapping-internal v2 signatures; 60 observed v2 production and separated metadata-only from content-bearing same-ID-set divergence; 61 audited post-v2 publication freshness and separated publication timestamp movement from source-content drift; **62 implemented privacy-preserving normalized-text projection v3; production observation pending.**

## Best next operations
1. Observe the next retained v3 identity artifact and classify the 11 content-bearing same-ID-set comparisons by normalized text equality.
2. Test whether the recurring `content_type/language/parts/response_format_name/text` signature is systematic serialization migration while keeping non-text semantics explicitly unresolved.
3. Inspect `AI Enclosure Critique` separately because of large tool/model metadata churn.
4. Reconstruct ancestry for the four graph-divergent cases independently of same-ID-set payload analysis.
5. Audit any implemented autotag lineage repair.
6. On identity-artifact freshness checks, compare intervening changed paths/acceptance semantics before deciding a rerun is required.
7. Keep Viewer navigation dedup separate from archive source disposition.
