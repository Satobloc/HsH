# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 57, 2026-09-15

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs/check-ins, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before touching write-capable scripts/shared generated state, also read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / manifest / exact-path dedup
Development summary: **364 unchanged / 121 skipped / 74 planned / 1 collision** across 560 records. Viewer has **453 conversations** from declared accepted inputs 439 development + 9 live + 6 external = **454**. Production uses `tools/build_conversation_viewer_resolved.py`: existing supported `new_path` before `old_path`; collision/blocked rename status does not itself make a materialized source Viewer-ineligible.

Run-46 diagnostic artifact `10399888652`, digest `sha256:4f78f568ff2ed9cee9ab26a90810ce0af2d4b84fa9612923eeff2116f2df5c40`, reconstructs **454 accepted -> 453 post-dedup** with exactly one duplicate path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_15/26.06.22•26.09.12•Cosmological Constant Summary — raw.json`. Manifest index 253 is the earlier unchanged winner; index 257 is collision and resolves from the existing dated `new_path`. Both source files are identical blob SHA `40dd17e8d6114d65f54e5712ff8ee4e5fc3812a0`. Viewer-safe dedup does **not** disposition the archive duplicate or clear the normalization blocker.

### Raw conversation-identity QA
Runs 54–56 established the identity-layer blind spot and converted it into `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates.py`, a read-only corpus diagnostic over Viewer-resolved accepted JSON inputs. Identity model separates (1) raw artifact/path/blob identity, (2) raw ChatGPT `conversation_id`, (3) message-graph/content relation, and (4) Viewer presentation identity. A collision at one layer does not determine disposition at another.

**Run 57 observed the first production diagnostic.** Actions run `35049604577` completed successfully at head `309b42f72ce4ddb94ef2ac0e5b1494fe7c6a583c`. Artifact `10427898109`, digest `sha256:a48f7db9e4302af7483acff7b5168486679dc72e707051ff1bae65123d0013c8`, scanned **412 JSON conversations with raw conversation IDs** and found **74 repeated-ID families**, with no unreadable inputs. Pairwise taxonomy includes exact-byte duplicates, top-level-order-only variants, same-message-graph metadata variants, prefix/superset candidates, same-ID-set divergent payloads, and divergent/unclassified cases. Raw UUID equality is therefore an identity/provenance key, not a sufficient content-equivalence predicate.

The Run-54 target is now resolved: `SAT_CONVOS_15/4D Topological Model Assessment — raw.json` and `... raw (1).json`, raw UUID `69f9ee83-bac4-8330-8460-0ae605478757`, classify **`top-level-order-only`**. Both contain 53 message IDs, all shared; mapping hash is identical (`fed69d95b72bdad274516169d68e649597dbf326c9c76311399227f4c8a19fb3`); only top-level `safe_urls` differs, by ordering. This establishes two serializations/exports of the same message graph with order-only metadata variation. It does **not** authorize archive disposition or Viewer suppression. Durable record: `RUN_057_2026-09-15.md`.

Highest-risk remaining identity classes are the **12 same-message-ID-set divergent-payload pairs** and **4 divergent-branch-or-unclassified pairs**; inspect these before proposing content-equivalence behavior.

### Validator production contract
Runs 47–49 built the shared resolved-input semantics adapter, semantics-aware v2 validator, and seven-specimen harness. Run 50 observed all seven specimens green. Run 51 observed Actions run `35016148194` success: production v2 overall `BLOCKED` with **0 FAIL / 1 BLOCKED / 13 PASS**; sole blocker is the known SAT_CONVOS_15 normalization collision. All four semantics-aware Viewer invariants passed. Legacy validator retains its known false pre-dedup/post-dedup arithmetic failure and is reference-only. Active workflow contract commit: `02b4ac3a8264fffd2d70afda7f5d4a2f2c8834ad`.

### Autotag / Nathan Direct generation lineage
Runs 52–53 established durable autotag/Nathan Direct products and coherent arithmetic at **73,200 input records / 22,758 user records / 15,133 unique packaged Nathan messages + 7,625 collapsed duplicate records**, but no adjacent retained machine-readable manifest records the exact source commit scanned by the autotag job. This is observability/provenance debt, **not evidence outputs are stale or incorrect**. Durable analysis: `AUTOTAG_LINEAGE_QA_2026-09-15.md`; closure: `RUN_053_2026-09-15.md`; handoff: `HANDOFF_AUTOTAG_LINEAGE_2026-09-15.md`. Minimum repair contract: scanned `source_commit` distinct from publication-base identity plus run/time/tool/config provenance and practical output hashes. Implementation routed to Sable/tagging-infrastructure ownership; Mercer audits after repair.

### Source-integrity machinery
- `WORKSPACES/MERCER/validate_cross_source_integrity_v2.py` — active semantics-aware production validator
- `WORKSPACES/MERCER/viewer_input_semantics.py` — shared production-semantics adapter
- `WORKSPACES/MERCER/validate_cross_source_integrity.py` — legacy reference validator
- `WORKSPACES/MERCER/test_validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py` — seven-specimen harness
- `WORKSPACES/MERCER/diagnose_viewer_input_dedup.py`
- `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates.py` — repeated raw-UUID reporting diagnostic; first production execution observed in Run 57
- `.github/workflows/mercer-cross-source-integrity.yml`

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; `BLOCKED` is an operational dependency, not corruption.

### Other retained state
Nathan Direct: **15,133 packaged unique + 7,625 collapsed duplicates = 22,758 input user records**; year shards sum to 15,133 and Stage-2 `source_records = 15133`. Preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`.

`MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. `extract_raw_window.py` is a bounded `content.parts` helper, not a complete-content serializer.

Historical glossary/standard crosswalk: inventory/custody complete; direct raw-message ancestry unresolved for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt`; reopen only with stronger source anchor.

## Open dependencies
- `OWNER ACTION / RECHECK`: SAT_CONVOS_15 Cosmological Constant Summary duplicate disposition / normalization collision unresolved. Viewer path dedup does not disposition either source.
- `IDENTITY QA / NEXT`: inspect the same-message-ID-set divergent-payload and divergent/unclassified families from artifact `10427898109`; then propose a reporting-only identity invariant/summary if warranted. Do not add suppression semantics locally.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `INFRASTRUCTURE / HANDOFF`: autotag scanned-source lineage repair remains with Sable/tagging infrastructure; Mercer audits implementation.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- No current Nathan-required decision.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup diagnosis; 47–51 semantics-aware validator transition and production promotion; 52–53 autotag source-lineage audit/handoff; 54–55 repeated raw-conversation UUID candidate investigation; 56 built the corpus-wide diagnostic; **57 observed the first production report: 412 scanned conversations, 74 repeated-ID families, and resolved the 4D Topological Model Assessment pair as top-level-order-only over an identical message graph.**

## Best next operations
1. Inspect the 12 same-message-ID-set divergent-payload pairs and four divergent/unclassified pairs; distinguish serialization/metadata effects from actual message payload divergence.
2. Produce a compact reporting-only identity QA summary/invariant if the taxonomy remains stable; route any Viewer behavior change through Sable.
3. Audit any implemented autotag lineage repair against Runs 52–53.
4. Keep Viewer navigation dedup separate from archive source disposition.
