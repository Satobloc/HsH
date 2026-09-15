# Sable Continuity Checkpoint

**Status:** ACTIVE / UPDATE AFTER MATERIAL STATE CHANGES  
**Established:** 2026-09-14  
**Last material update:** 2026-09-15 00:45 ET  
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
- `:45` Sable Systems Loop — `6aa80ddccc888191a6a9b2c073f434b7`
- `:52` Mercer Archive QA Loop — `6aa6c2792c9c8191ab2c128a80c437cf`

Former separate Revival Rotation automation remains disabled; revival work is time-cycled inside Sable.

## Infrastructure QA — current convergence state

Standing surface: `WORKSPACES/COMMON/INFRASTRUCTURE_QA_ROTATION.md`.

### 2026-09-15 Viewer/upload incident and repair

Two independent upload-triggered pipelines are intended:
- Conversation Viewer build;
- layered autotag -> Nathan Direct -> Stage-2 packaging.

The autotag workflow previously did not trigger on conversation uploads. `layered-nathan-autotag.yml` was repaired at commit `3c93a0af7836bd294fb2c4cc2a5dca67791ebe4f` (2026-09-15 04:22:43Z) to watch conversation JSON/TXT uploads.

Viewer discovery had a separate stale-manifest risk. `tools/build_conversation_viewer_resolved.py` was changed to refresh recursive development/live manifests from the current checkout before catalog generation and to avoid hiding valid sources because of rename-only collision/blocked status.

### QA observation at 2026-09-15 00:45 ET

The generated Viewer catalog now reports source state around `2026-09-15T04:31:30Z`, with **448 Viewer conversations: 439 development + 9 live**, and explicitly includes newly uploaded `SAT_CONVOS_17` material (e.g. `Analyze Voice Models`). This is direct evidence that the refreshed Viewer build is seeing at least some newly uploaded folder-17 material.

The committed autotag summary is still older: **416 JSON scanned / 387 recognized conversation exports / 69,927 messages**, and its latest generated-output commit remains `27672894081dcc4bea0f3160bbb81176163df6a6` from 2026-09-13. Therefore Viewer -> autotag/Nathan Direct convergence is **not yet established** after the trigger repair. The repaired autotag workflow allows up to 90 minutes; do not diagnose failure merely from this early lag. Recheck later for a new bot commit and compare source paths/counts rather than assuming success.

The committed `indexes/manifests/development-conversation-dates.json` remains an older 2026-09-13 artifact because the Viewer refresh currently happens in the workflow workspace; Viewer catalog metadata records the freshly generated manifest state used during build. This is not itself a Viewer failure, but durable-manifest freshness should be considered in later infrastructure design.

### Viewer full-text search

Nathan requested conversation-list search over message bodies, not only title/path/date. Plan is recorded in `WORKSPACES/COMMON/VIEWER_FULLTEXT_SEARCH_UPGRADE.md`. Prefer a separate compact generated search index rather than embedding complete bodies into `conversations.json`; benchmark index size/load/query latency and preserve curation/privacy boundaries.

### Strong Viewer inclusion invariant

Every eligible non-quarantined conversation source should either appear in the Viewer or have an explicit machine-readable exclusion reason. Current builder directly covers recursive `DEVELOPMENT_FULL_CONVOS` and `LIVE CONVOS` plus registered external conversations. Broader three-repo conversation discovery remains an infrastructure task; do not silently equate those two roots with the complete project conversation universe.

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

1. Recheck autotag/Nathan Direct/Stage-2 generated commits after the repaired upload trigger has had enough runtime; compare against Viewer/source inventory.
2. Build a reusable convergence report/regression check: source inventory -> Viewer -> autotag -> Nathan Direct -> Stage-2, with explicit exclusions and source IDs.
3. Inventory conversation-like sources outside `DEVELOPMENT_FULL_CONVOS` / `LIVE CONVOS` across permitted [[HsH]], [[GLASS]], and [RESOURCES], respecting quarantine/private routing, and define Viewer registration/discovery policy.
4. Benchmark/implement compact full-body Viewer search when convenient.
5. Continue worker heartbeat/continuity and Q&A triage; no current Nathan-required item.
6. Continue deeper instance stratigraphy and first manual revival packet preparation without sacrificing current infrastructure priority.
7. Continue internal bibliography/source-ancestry architecture before broad external bibliography expansion.

## Resume rule after cutoff

Read, in order:
1. this file;
2. Nathan Dashboard;
3. `AUTOMATION_WORKFLOW_CONTROL.md`;
4. `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`;
5. `INFRASTRUCTURE_QA_ROTATION.md`;
6. `QNA_TRIAGE_QUEUE.md` and `NATHAN_ATTENTION_FLAG_PROTOCOL.md`;
7. `BIBLIOGRAPHY_SEQUENCE_ROADMAP.md`;
8. `COORDINATION.md` / `ACTIVE_AUTOMATION_ROSTER.md`;
9. `REVIVAL_ROTATION_PROTOCOL.md` / `REENTRY_RUBRIC_PUBLIC_INTERFACE.md`;
10. `INSTANCE_STRATIGRAPHY.md` / `INBOX.md`;
11. latest relevant worker checkpoints/check-ins.

Then inspect current repository/generated state and choose the highest-information permitted operation. Newer explicit Nathan directives always control.
