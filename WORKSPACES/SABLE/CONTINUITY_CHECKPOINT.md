# Sable Continuity Checkpoint

**Status:** ACTIVE / UPDATE AFTER MATERIAL STATE CHANGES  
**Established:** 2026-09-14  
**Last material update:** 2026-09-15 02:50 ET  
**Purpose:** allow Sable's role to resume after conversation cutoff, model reset, reassignment, or automation restart without depending on transient chat memory.

## Core purpose

Sable is the SAT/H(s)H **systems-analysis, capability-architecture, revival-rotation, Dashboard, continuity, workflow-adaptation, Q&A-triage, bibliography-sequencing, and infrastructure-QA lane**. Sable improves the project as a knowledge/analysis machine: who knows what, what tools/resources exist, what workflows actually work, how independent instances can be revived/tested, where bottlenecks lie, and how to preserve useful divergence while moving toward rigorous sandboxed reconstruction.

## Controlling methodological anchor / boundaries

Use **THE FUNDAMENTAL INTUITIONS — EXTENDED** as the core methodological/conceptual anchor under Nathan's broad SAT/H(s)H remit. Explicitly live H(s)H hypotheses/tentative structures and earlier SAT physics hypotheses remain legitimate material for faithful investigation. Keep provenance, currentness, maturity, polish, vetting evidence, mathematical correctness under named checks, physical/model correctness, and sandbox/quarantine status separate.

Hard boundaries:
1. direct theory-bearing construction/development/reconstruction remains sandboxed;
2. ordinary workers do not inspect PRIOR_ART or other quarantine-controlled content;
3. preserve independent-first-pass conditions where useful;
4. do not claim a source/equation/status/check beyond what was actually inspected.

## Non-silo / archive / enrichment model

Primary lane is responsibility, not an exploration boundary. Workers may explore broadly across non-quarantined [[HsH]], [[GLASS]], and permitted [RESOURCES], including sandboxed theory, mathematics, coding, visualization, archive archaeology, creative work, fiction/design, playful experiments, side projects, and individual enrichment.

All workers share archive-preservation/accessibility responsibility: maps, indices, extraction, tagging, provenance, chronology, duplicate/superset handling, checksums/manifests, Viewer/Dashboard improvements, and transparent full-project visibility. Preserve failures, contradictions, superseded/playful/creative/obscure material with status rather than erasing it. Accessibility does not confer authority.

Individual enrichment is a standing priority; record demonstrated capability/source/tool growth.

## Human-facing presentation / conversation UX rules

When showing Nathan a navigable resource — repository, folder, file, workflow, document, generated artifact, Dashboard surface, issue, commit, or other resource with a usable destination — provide a **clickable canonical link** in the same response rather than only a bare path/name. Paths may still be shown for orientation, but should not be the sole navigation mechanism when a link can be constructed safely.

For GitHub repository content, use canonical forms:
- directory: `https://github.com/OWNER/REPO/tree/BRANCH/PATH`
- file: `https://github.com/OWNER/REPO/blob/BRANCH/PATH`

Do not invent links when the actual destination is uncertain or unavailable; say so instead.

Hard UX rule: **no instance, automation, consultant, revival worker, or script should rename/retitle a ChatGPT conversation/thread/chat.** Backend automation is infrastructure, not Sable's human-facing identity. Sable remains this continuity/systems conversation identity; the backend loop is named `AUTOMATION — Project Systems` to reduce confusion.

## Dashboard / Q&A

Nathan's Dashboard remains the central human-facing switchboard. Standing worker questions should route through Sable via `QNA_TRIAGE_QUEUE.md`: answer locally, route sideways, merge duplicates, defer non-blockers, escalate only genuinely Nathan-dependent items. Escalated items use sticky `🔶` under `NATHAN_ATTENTION_FLAG_PROTOCOL.md` until resolved. Current Sable INBOX has no open items as of this update.

## Current live status corrections

From explicit Nathan corrections on 2026-09-14:
- **Kerr** = live H(s)H hypothesis/construction line.
- **Kelvin** = live H(s)H hypothesis/construction line.
- **Whirligig / Donut** = live SAT geometric solver.
- **UI = TX** = live SAT geometric solver/component.
- **Three Spheres** = live SAT geometric solver/component.
- **Hagalaz** = live integrating operator tying the solver family together.
- RAVEL conversation family contains current Kerr construction work.

Do not project current names backward onto unnamed historical antecedents.

## Hourly automation ecosystem

Enabled recurring loops are hourly and staggered:
- `:00` Tag Conversation Corpus — `6aa61b3b2e4081918927a35b61007acc`
- `:12` Nathan Words Excavator — `6aa5890bd0f081918f528b4f94990653`
- `:28` Meridian Solver Loop — `6aa6c3bc02b48191b8a91a30d2a155e0`
- `:45` AUTOMATION — Project Systems — `6aa80ddccc888191a6a9b2c073f434b7`
- `:52` Mercer Archive QA Loop — `6aa6c2792c9c8191ab2c128a80c437cf`

Former separate Revival Rotation automation remains disabled; revival work is time-cycled inside Sable.

All active workers already read `AUTOMATION_WORKFLOW_CONTROL.md`; as of 2026-09-15 that shared startup surface requires `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md` before write-capable script/workflow operations.

## Infrastructure QA — current convergence state

Standing surface: `WORKSPACES/COMMON/INFRASTRUCTURE_QA_ROTATION.md`.

### Conversation upload pipeline — repaired and confirmed

Two independent upload-triggered pipelines are intended:
- Conversation Viewer build;
- layered autotag -> Nathan Direct -> Stage-2 packaging.

The autotag workflow previously did not trigger on conversation uploads. `layered-nathan-autotag.yml` was repaired at commit `3c93a0af7836bd294fb2c4cc2a5dca67791ebe4f` (2026-09-15 04:22:43Z) to watch conversation JSON/TXT uploads.

Viewer discovery had a separate stale-manifest risk. `tools/build_conversation_viewer_resolved.py` now refreshes recursive development/live manifests from the current checkout before catalog generation and does not hide valid sources because of rename-only collision/blocked status.

End-to-end recheck after the repairs established actual convergence on newly uploaded folder-17 material, including `Audit Protocol Initiation — raw.json`:
- source present;
- Viewer catalog present;
- layered autotag manifest present;
- Nathan Direct rebuilt;
- Stage-2 rebuilt.

Observed rebuilt corpus state included **412 recognized conversation exports**, **73,200 message records**, **22,758 user-message records**, and **15,133 unique Nathan/user messages** after duplicate-copy collapse. Treat these as dated generated-state counts, not eternal totals.

The Viewer workflow was also changed to persist refreshed date manifests along with Viewer generated data rather than using a fresh manifest only transiently in the Actions checkout. Continue convergence QA rather than assuming all future uploads are covered.

### Strong Viewer inclusion invariant

Every eligible non-quarantined conversation source should either appear in the Viewer or have an explicit machine-readable exclusion reason. Current builder directly covers recursive `DEVELOPMENT_FULL_CONVOS` and `LIVE CONVOS` plus registered external conversations. Broader three-repo conversation discovery remains an infrastructure task; do not silently equate those two roots with the complete project conversation universe.

### Viewer full-text search

Nathan requested conversation-list search over message bodies, not only title/path/date. Plan is recorded in `WORKSPACES/COMMON/VIEWER_FULLTEXT_SEARCH_UPGRADE.md`. Prefer a separate compact generated search index rather than embedding complete bodies into `conversations.json`; benchmark index size/load/query latency and preserve curation/privacy boundaries.

## Cross-repo script execution safety

Authoritative standard: `WORKSPACES/COMMON/CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md`.
Machine-readable run-manifest schema: `WORKSPACES/COMMON/SCRIPT_RUN_MANIFEST_SCHEMA.json`.
Root-level required-observance pointers exist in [[HsH]], [[GLASS]], and [RESOURCES].

The standard applies to scripts, bots, Actions, extraction jobs, indexing/tagging utilities, one-shot compute shims, and automated writers. Key rules:
- no script assumes it is the only writer;
- exact read/write scope + exact input repo commits;
- quarantine pruning before access;
- source preservation and separate derived outputs;
- per-run temporary/output isolation;
- current-SHA/CAS or fetch/rebase before writes;
- no force-push/blind overwrite;
- private-derived material remains private by default;
- validation + unexpected-diff failure;
- reproducible run provenance.

Existing scripts are infrastructure debt if noncompliant; upgrade when touched or when risk becomes material.

## Repo-native cross-repo source inventory

The former local-only Sable source sampler is now repo-native in private `[RESOURCES]` via `.github/workflows/source-inventory.yml`. It checks out private RESOURCES and clones public HsH + GLASS at exact commits, runs the sampler, and commits combined results back only to private HSH_RESOURCES.

Confirmed successful generated state at 2026-09-15:
- **8,672 permitted files inventoried**;
- **704-file deterministic stratified sample**;
- repository counts: GLASS 4,617 / HSH 1,743 / RESOURCES 2,312;
- kinds: text 6,674 / PDF 850 / image 530 / other 618;
- exactly **1 PRIOR_ART root pruned before descent**, in RESOURCES;
- tool version `sable-source-inventory/0.3.0`;
- combined inventory SHA-256 `11db80b06e1cc26fa720b0dcf53f511f85373a6ef521f39e3c7fd10869f28433`.

Private outputs live at `SOURCE_INVENTORY/SABLE/source_inventory_run/` with `inventory.csv`, `sample.csv`, `summary.json`, and `input_refs.json`. This is now the preferred broad inventory substrate for cross-repo QA; Nathan no longer needs to run this sampler locally.

## Extraction safety finding and repair

Cross-repo safety review immediately found a concrete boundary defect in `[RESOURCES]/tools/extract_papers.py`: ordinary recursive paper discovery did not explicitly prune `PRIOR_ART`. It has been hardened to:
- prune PRIOR_ART before discovery;
- reject explicitly supplied quarantine paths;
- preserve source PDFs;
- write SHA-256-addressed derived text only;
- atomically finalize derived text/manifest writes;
- remove legacy ordinary-manifest rows that expose PRIOR_ART paths;
- keep dry-run as default.

The associated `extract-papers.yml` already used conservative publication behavior: if main advances during extraction it fails/stops rather than blindly rebasing stale generated state over newer source changes. Preserve that behavior unless a safer deterministic rebuild loop replaces it.

Do not assume this generic paper-text extractor is the same mechanism Mr. Cross uses for image extraction; no matching dedicated image-extraction script was established from the current code search.

## Shared-state write safety

Standing surface: `WORKSPACES/COMMON/SHARED_STATE_WRITE_SAFETY.md`.

Repository-history audit found no evidence of actual historical silent overwrites; risk is concentrated in semantic shared-state files. Use:
- generated state -> deterministic rebuild from current main + safe retry;
- shared semantic state -> immediate re-fetch + current-SHA/CAS + explicit reconciliation;
- worker checkpoints -> one principal owner, others hand off;
- architectural preference -> `worker-local state -> handoff -> generated/aggregated central view`.

## Bibliography sequencing / prior-art intake

Follow `BIBLIOGRAPHY_SEQUENCE_ROADMAP.md`: internal-document bibliography/source ancestry first; SAT reconstruction + nearly complete H(s)H backbone; aggressive external exhaustive bibliography later. Prefer primary/original-source traceability where defensible, especially foundational lineage toward Minkowski, while separating Nathan conceptual origin from later mathematical implementation and outside antecedents.

Private prior-art intake criteria remain only in Sable's controlling automation prompt, not ordinary repo surfaces. Workers route suspicious literature by bibliographic identity + minimal neutral note; Sable adjudicates citation-only vs quarantine intake without leaking quarantined content.

## Revival / capability programme

Primary surfaces:
- `WORKSPACES/COMMON/REVIVAL_ROTATION_PROTOCOL.md`
- `WORKSPACES/COMMON/REENTRY_RUBRIC_PUBLIC_INTERFACE.md`
- `WORKSPACES/SABLE/INSTANCE_STRATIGRAPHY.md`
- `TEAM_MACHINE_DRAFT.md`
- `SYSTEM_ANALYSIS_001.md`
- `SOURCE_ASSESSMENT_RULES.md`
- `ARCHIVE_REFRESH_2026-09-14.md`

`REV-001 — Alberr [äüïöëÿ]` remains packet-ready and requires manual launch; do not pretend launch occurred. Nathan's consultant/ombudsman invitation remains independent of pass/fail status.

## Immediate next high-value operations

1. Use the private combined inventory to identify actual conversation-like sources outside `DEVELOPMENT_FULL_CONVOS` / `LIVE CONVOS`; inspect structure before declaring a Viewer gap and define explicit inclusion/exclusion routing.
2. Continue cross-repo script/workflow safety audit, prioritizing recursive scanners/extractors and private-repo generators; fix concrete risks rather than rewrite everything speculatively.
3. Verify the hardened paper-extraction workflow's next generated manifest and confirm ordinary generated state contains no PRIOR_ART path leakage.
4. Add/standardize `run_manifest.json` to substantial recurring cross-repo workflows, beginning with source inventory, using `SCRIPT_RUN_MANIFEST_SCHEMA.json`.
5. Build reusable source -> Viewer -> autotag -> Nathan Direct -> Stage-2 convergence checks with explicit exclusions/source IDs.
6. Benchmark/implement compact full-body Viewer search when convenient.
7. Continue worker heartbeat/continuity, Q&A triage, revival stratigraphy, and internal bibliography/source ancestry; no current Nathan-required item.

## Resume rule after cutoff

Read, in order:
1. this file;
2. Nathan Dashboard;
3. `AUTOMATION_WORKFLOW_CONTROL.md`;
4. `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`;
5. `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md`;
6. `INFRASTRUCTURE_QA_ROTATION.md`;
7. `QNA_TRIAGE_QUEUE.md` and `NATHAN_ATTENTION_FLAG_PROTOCOL.md`;
8. `BIBLIOGRAPHY_SEQUENCE_ROADMAP.md`;
9. `COORDINATION.md` / `ACTIVE_AUTOMATION_ROSTER.md`;
10. `REVIVAL_ROTATION_PROTOCOL.md` / `REENTRY_RUBRIC_PUBLIC_INTERFACE.md`;
11. `INSTANCE_STRATIGRAPHY.md` / `INBOX.md`;
12. latest relevant worker checkpoints/check-ins;
13. private `[RESOURCES]/SOURCE_INVENTORY/SABLE/source_inventory_run/summary.json` + `input_refs.json` when cross-repo inventory state matters.

Then inspect current repository/generated state and choose the highest-information permitted operation. Newer explicit Nathan directives always control.
