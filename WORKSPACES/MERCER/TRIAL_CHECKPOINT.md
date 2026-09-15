# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan authorization, 2026-09-13  
**Role:** archive/index/retrieval/provenance/documentation QA + Nathan Direct methodology/source reconstruction  
**Current through:** Run 38, 2026-09-15

## Startup / authority

Every run read `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md` first and treat it as a hard UX rule: never rename, retitle, alter, or propose renaming a conversation/thread/chat. Then read `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, current coordination/handoffs, relevant Dashboard/wayfinding surfaces, newer Nathan directives, and this checkpoint. Nathan directives control.

The former blanket training standdown is superseded as a hard gate. Direct theory-bearing work/development remains sandbox-limited; quarantine remains hard/off-limits. Mercer may explore broadly but owns the reliability layer between raw/tagged material and navigation/retrieval. Do not silently absorb familiarity-dependent conversation-family causality/context interpretation or the active Nathan-words extraction/tagging lane.

## Epistemic boundary

Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, sandbox status, and quarantine status distinct. Repository proximity, worker agreement, generated metadata, thematic similarity, clean indexing, or successful automated checks never confer theory correctness or authority.

## Current verified state

### Viewer / manifests

Run 38 closed the Run-37 convergence split. Current default-branch `indexes/manifests/development-conversation-dates.json` is generated `2026-09-15T07:15:03.960820+00:00`; current `CONVERSATION_VIEWER/data/conversations.json` declares that exact generation as its development input and has source state `2026-09-15T07:15:04.276513+00:00`.

Current development-manifest summary: **364 unchanged / 121 skipped / 74 planned / 1 collision** across 560 records. The older `48 blocked` description is obsolete under the current generator state. One collision remains; do not declare the historical SAT_CONVOS_15 duplicate disposition resolved until directly established.

Current Viewer: **453 conversations**, top-level `development: 439`, `live: 9`, `source_conversations_before_curation: 453`. Inputs report 560 development-manifest records / 439 accepted JSON conversations; 13 live-manifest records / 9 accepted; and 6 discovered-external records / 6 accepted.

`CONVERSATION_VIEWER/data/discovered_external_conversations.json` now reports 6 merged external conversations: 1 manual (`Srena — H(s)H`, corpus `development`) + 5 structurally discovered public cross-repo conversations inspected as `glass-public`. Therefore naive accepted-input summation is not a valid Viewer-total invariant without builder merge/deduplication/corpus semantics. Next validator work must be source-code grounded, not arithmetic relaxation.

### Autotag / Nathan Direct

Last coherent counts: autotag 69,927 records / 21,451 user records; Nathan Direct 14,306 packaged unique + 7,145 collapsed duplicates = 21,451; yearly shards 293 + 306 + 4,801 + 8,906 = 14,306; Stage 2 `source_records = 14306`. Historical 388→387 conversation and 21,499→21,451 user-record reductions were reconciled to the known held/deleted legal raw source, not indexing loss.

Preferred package-count surface: `indexes/nathan-direct/MANIFEST.json`. Machine-readable autotag-side generation/freshness lineage remains unconfirmed.

### Source-integrity validator / competence harness

Durable implementation:
- `WORKSPACES/MERCER/validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_validate_cross_source_integrity.py`
- `WORKSPACES/MERCER/test_integrity_failure_modes.py`
- `.github/workflows/mercer-cross-source-integrity.yml`

Validator is read-only and metadata-only; classes are `PASS/WARN/BLOCKED/FAIL/UNKNOWN`. `BLOCKED` is operational dependency, not corruption.

Run 37 confirmed Actions run `34926821342` completed success on repair commit `fd948c412436a295eebaf78689b7e49325a8dc82`: regression fixture, six-specimen competence harness, production metadata validation, and report upload all succeeded. Artifact `10379809650`, digest `sha256:edc63c62dbe5b712091a2fb805aaab7ef38bf833772389291fdfa97170f9e0a1`. Keep the original six specimens frozen unless an observed failure class or materially new contract warrants expansion.

Run 38 observed exactly such a materially new contract candidate: the Viewer now consumes a six-record discovered-external surface with mixed corpus labels and possible merge/deduplication semantics. Inspect builder code against validator before changing tests or contract; if mismatched, add one regression specimen for this observed semantics change first.

### MORROW-SOURCE-001

Code-side resolved / historical-output-side pending. Comparator hashes the entire content object under its explicit policy and retains the Janus regression case. Preserve the earlier Janus export. `extract_raw_window.py` is only a bounded `content.parts` helper, not a complete-content serializer.

### Historical glossary / standard crosswalk

Source inventory/custody work is complete; direct raw-message ancestry remains unresolved for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt`. Current phrase-search, Viewer-candidate, and intrinsic-fingerprint routes were exhausted in Runs 16–22. Reopen only with a stronger source anchor.

### Durable documentation / role development

- `WORKSPACES/COMMON/DURABLE_PROJECT_DOCUMENTATION_CONVENTION.md` established Run 13.
- Mercer README/CONTINUITY and Viewer documentation reconciled in Runs 23–28.
- `NATHAN_LIVE_THEORY_DEVELOPMENT_LOG.md` has durable September 13 referents; exact raw IDs remain pending attributable export.
- `PRE_MEETING_REPORT_2026-09-14.md` records tentative role direction: **Source Integrity Metrologist**.
- Safe Morrow inheritance: deterministic UUID/path/checksum/index reconciliation and machine-readable provenance joins. Do not inherit contextual causality/dialogue-significance judgments by default.

## Open dependencies

- `VALIDATOR CONTRACT REVIEW`: inspect current Viewer builder external merge/deduplication/counting semantics against `validate_cross_source_integrity.py`; current discovered-external input is 6 records with mixed corpus labels.
- `OWNER ACTION / RECHECK`: current development manifest still has 1 collision; historical SAT_CONVOS_15 exact duplicate disposition not yet established. Prior `48 blocked` wording is obsolete; current manifest has 74 planned.
- `DEPENDENCY`: exact raw IDs for September 13 Mercer live-source statements.
- `DEPENDENCY`: machine-readable autotag-side generation/freshness lineage.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `AMBIGUOUS PROVENANCE`: glossary/standard-map raw-message ancestry; current routes exhausted.
- `COORDINATION WRITE GAP`: pre-meeting report not appended to heavily shared `CHECKINS.md`; do not use unsafe whole-file replacement merely to append.
- No current Nathan-required decision.

## Run history

Runs 1–7 training + scanner defect/repair; 8–12 Viewer path/navigation QA; 13 documentation convention; 14–22 glossary/crosswalk provenance investigation; 23–26 durable docs reconciliation; 27 corpus-count reconciliation; 28 registered-external semantics; 29 exact duplicate collision; 30 source-integrity systems map; 31 validator contract; 32 Nathan Direct machine bridge; 33 validator implementation + pre-meeting report; 34 full-checkout production validation + CI harness; 35 failure-mode competence/regression harness; 36 CI failure diagnosis + harness check-ID repair; 37 green repaired harness confirmation + transient Viewer/manifest split; 38 settled Viewer/manifest convergence + new discovered-external accounting semantics identified.

## Last material run

`WORKSPACES/MERCER/RUN_038_2026-09-15.md` records exact Run-38 coverage, checks, limits, and next operation.

## Best next operation

Inspect current Viewer builder code for discovered-external merge, deduplication, corpus classification, and top-level count construction; compare that contract directly with `validate_cross_source_integrity.py`. If the validator is stale, first encode one regression specimen reproducing the observed six-record mixed-corpus external surface, then repair the validator without weakening unrelated invariants. If already correct, record the semantics and move to the next highest-value QA dependency.