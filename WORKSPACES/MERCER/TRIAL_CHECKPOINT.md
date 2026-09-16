# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 56, 2026-09-15

## Startup / authority
Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first. Never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs/check-ins, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Before touching write-capable scripts/shared generated state, also read `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`. Nathan directives control. Direct theory-bearing work remains sandbox-limited; quarantine is hard/off-limits.

## Epistemic boundary
Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Clean indexing or successful automated checks do not confer theory correctness.

## Current verified state

### Viewer / manifest / exact-path dedup
Development summary: **364 unchanged / 121 skipped / 74 planned / 1 collision** across 560 records. Viewer has **453 conversations** from declared accepted inputs 439 development + 9 live + 6 external = **454**. Production uses `tools/build_conversation_viewer_resolved.py`: existing supported `new_path` before `old_path`; collision/blocked rename status does not itself make a materialized source Viewer-ineligible.

Run-46 diagnostic artifact `10399888652`, digest `sha256:4f78f568ff2ed9cee9ab26a90810ce0af2d4b84fa9612923eeff2116f2df5c40`, reconstructs **454 accepted -> 453 post-dedup** with exactly one duplicate path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_15/26.06.22•26.09.12•Cosmological Constant Summary — raw.json`. Manifest index 253 is the earlier unchanged winner; index 257 is collision and resolves from the existing dated `new_path`. Both source files are identical blob SHA `40dd17e8d6114d65f54e5712ff8ee4e5fc3812a0`. Viewer-safe dedup does **not** disposition the archive duplicate or clear the normalization blocker.

### Raw conversation-identity QA
Runs 54–55 established a separate identity-level blind spot: `SAT_CONVOS_15/4D Topological Model Assessment — raw.json` and `... raw (1).json` are both 361104 bytes with different Git blobs (`3ae831d...`, `7bc6ff0...`) but direct headers expose the same raw `conversation_id` `69f9ee83-bac4-8330-8460-0ae605478757`, title, create/update times; visible `safe_urls` ordering differs. Viewer presents them separately because current uniqueness/dedup is path/Viewer-ID based. This is a strong same-conversation export/serialization candidate, **not yet a semantic-equality or disposition finding**. Durable runs: `RUN_054_2026-09-15.md`, `RUN_055_2026-09-15.md`.

**Run 56:** created `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates.py`, a read-only corpus diagnostic over Viewer-resolved accepted JSON inputs. It groups raw exports by `conversation_id` and reports raw-byte, canonical-JSON, and mapping hashes; message/shared-ID counts; differing top-level keys; and conservative pairwise classes (exact, semantic exact, top-level order-only, same-message-graph metadata difference, subset/superset candidate, same-ID-set divergent payload, unresolved/divergent). It never suppresses, renames, deletes, or dispositions sources. `.github/workflows/mercer-cross-source-integrity.yml` now runs it and retains `conversation-identity-duplicates.json`. Commits: `2cbe76de...` initial, `bd78940c...` adapter correction, `309b42f7...` CI integration. Actions run `35049604577` was in progress at last observation; corpus classification is therefore pending and must not be inferred from the wiring alone. Durable record: `RUN_056_2026-09-15.md`.

Identity model now explicitly separates: (1) raw artifact/path/blob identity, (2) raw ChatGPT `conversation_id`, and (3) Viewer presentation identity. A collision at one layer does not determine disposition at another.

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
- `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates.py` — repeated raw-UUID reporting diagnostic; Run-56 CI observation pending
- `.github/workflows/mercer-cross-source-integrity.yml`

Classes: `PASS/WARN/BLOCKED/FAIL/UNKNOWN`; `BLOCKED` is an operational dependency, not corruption.

### Other retained state
Nathan Direct: **15,133 packaged unique + 7,625 collapsed duplicates = 22,758 input user records**; year shards sum to 15,133 and Stage-2 `source_records = 15133`. Preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`.

`MORROW-SOURCE-001`: code-side resolved / historical-output-side pending; preserve earlier Janus export. `extract_raw_window.py` is a bounded `content.parts` helper, not a complete-content serializer.

Historical glossary/standard crosswalk: inventory/custody complete; direct raw-message ancestry unresolved for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt`; reopen only with stronger source anchor.

## Open dependencies
- `OWNER ACTION / RECHECK`: SAT_CONVOS_15 Cosmological Constant Summary duplicate disposition / normalization collision unresolved. Viewer path dedup does not disposition either source.
- `IDENTITY QA / NEXT`: observe Actions run `35049604577`, inspect retained repeated-UUID report, classify every family, and specifically resolve the 4D Topological Model Assessment pair before proposing any Viewer identity invariant.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `INFRASTRUCTURE / HANDOFF`: autotag scanned-source lineage repair remains with Sable/tagging infrastructure; Mercer audits implementation.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- No current Nathan-required decision.

## Run history
Runs 1–7 training/scanner; 8–12 Viewer navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance; 23–26 docs reconciliation; 27 corpus counts; 28 external semantics; 29 duplicate collision; 30–37 integrity validator/harness; 38–46 Viewer acceptance/dedup diagnosis; 47–51 semantics-aware validator transition and production promotion; 52–53 autotag source-lineage audit/handoff; 54–55 repeated raw-conversation UUID candidate investigation; **56 converted identity QA into a reproducible corpus-wide read-only diagnostic and CI artifact, with first execution pending observation.**

## Best next operations
1. Observe run `35049604577`; inspect `conversation-identity-duplicates.json` and classify all repeated raw UUID families.
2. Verify the Run-54 pair as order-only, metadata-only, prefix/superset, or divergent; preserve both raw artifacts regardless until explicit disposition.
3. If family taxonomy warrants it, propose a reporting-only identity invariant before any Viewer suppression behavior; route cross-lane policy through Sable.
4. Audit any implemented autotag lineage repair against Runs 52–53.
5. Keep Viewer navigation dedup separate from archive source disposition.
