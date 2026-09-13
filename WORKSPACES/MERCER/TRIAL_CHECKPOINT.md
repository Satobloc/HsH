# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan invitation/authorization, 2026-09-13 11:33 EDT  
**First scheduled recurrence:** 2026-09-13 11:52 EDT  
**Cadence:** hourly at `:52` America/New_York  
**Role:** index/retrieval QA + Nathan Direct methodology/source reconstruction + documentation/navigation reconciliation  
**Workspace:** `WORKSPACES/MERCER/`

## Why this role

This continues Mercer's current task rather than declaring it complete. It is intentionally complementary to:

- **Morrow:** conversation-family identity, continuity, contextual/provenance recovery;
- **Nathan-words tagging lane:** archive-wide extraction, manual tagging/promotion, verified-word accumulation.

Mercer owns the layer between raw/tagged material and reliable project navigation/retrieval: index quality, source-path/catalog reconciliation, retrieval selectivity, durable documentation conventions, and source-grounded methodology mapping from already verified Nathan-authored material.

## Run startup

At the beginning of every run:

1. read `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md`;
2. read current Common coordination surfaces, especially `BULLETIN_BOARD.md`, relevant handoffs and unresolved issues;
3. treat newer explicit Nathan directives as controlling;
4. check whether another worker has already claimed/advanced the intended operation;
5. select the highest-value nonduplicative eligible operation.

## Primary measurable goalposts

1. **Autotag/index QA** — verify corpus coverage, selectivity, precision/recall behavior, duplicates and structural-index cross-checks; record concrete retrieval failures and small fixes.
2. **Viewer/catalog integrity** — reconcile generated Viewer/catalog paths with actual repository paths; make source links trustworthy and detect path-generation drift.
3. **Nathan Direct methodology map** — expand `SAT_METHOD_SOURCE_MAP.md` using verified raw Nathan-authored messages only; fill explicit gaps around representation/model choice, ontology/physical-reality caution, Minkowski/full-history primacy, minimality, validation/holdout/cross-sector testing, rejection/failure rules, and unconstrained-geometric-flexibility warnings.
4. **Documentation/navigation convention** — help standardize the pattern requested by Nathan: Common notice/handoff + durable project/index home + Dashboard/navigation link where appropriate.
5. **Directive provenance** — backfill live-directive raw conversation/message IDs when exports land; never invent them.
6. **Continuity** — keep this checkpoint and `CONTINUITY.md` current enough for a successor/resumed instance to restart safely.

## Current frontier at enrollment

- V1 archive-wide autotagging successfully recognized 388/408 JSON files as conversation exports with zero parse errors and zero structural-index gaps, but topic matching and adjacency promotion were overbroad.
- `layered_autotag_nathan_v2.py` was created to correct substring false positives and make adjacency selective; regenerated committed outputs still need validation.
- `SAT_METHOD_SOURCE_MAP.md` has an initial direct-source methodology spine from verified Nathan messages.
- Morrow reports that eight of nine LIVE Viewer paths contain date prefixes absent from the actual tree; this is a documentation/catalog reconciliation task, not missing-source evidence.
- Nathan has requested a repo-wide historical definitions/glossary initiative and a standard durable-project-documentation convention; these are eligible supporting tasks but should not displace the active Nathan-words/tagging priority.
- Project-wide theory-bearing standdown remains active; Mercer's current role is archive/tooling/provenance/documentation and source reconstruction, not unauthorized theory synthesis.

## Safe alternate work when primary branch is blocked

- inspect/directly read verified Nathan-word batches and fill methodology-map gaps;
- audit index/tag selectivity on bounded samples;
- reconcile duplicate/path/source metadata;
- improve continuity/provenance/docs machinery;
- examine glossary/standard-to-SAT resources for future historical-definition infrastructure without declaring theory meanings;
- produce concise critiques/handoffs for other workers where evidence warrants;
- bounded free archive exploration permitted by current control surface.

## Epistemic boundaries

Keep distinct:

- Nathan-authored direct material;
- established/tentative SAT/H(s)H status actually supported by controlling sources;
- historical/displaced material;
- assistant-generated interpretation;
- Mercer's reconstruction;
- Workshop/Clearinghouse speculation.

Do not promote worker consensus or quarantined/generated material into SAT/H(s)H authority.

## Run-end checkpoint schema

Each run should record:

- actual work completed;
- exact sources/regions covered;
- artifacts changed/created;
- current frontier;
- blockers/dependencies;
- useful discoveries/questions;
- best next operation;
- whether Nathan attention is genuinely required (`🔶` only when yes).

## Enrollment checkpoint — 2026-09-13 11:34 EDT

**Did:** accepted Nathan's trial invitation; read Automation Workflow Control and current Bulletin Board; selected a complementary recurring role; activated hourly recurrence for `:52`; converted current work from one-shot task to persistent role rather than declaring it complete.

**Sources/coordination checked:**
- `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md`
- `WORKSPACES/COMMON/BULLETIN_BOARD.md`
- existing Mercer continuity/source-map state

**Current frontier:** validate v2 autotag/index regeneration; reconcile Morrow's Viewer/catalog path discrepancy; continue verified methodology-source reconstruction.

**Blockers/dependencies:** no Nathan-required blocker at enrollment. Some operations depend on regenerated workflow outputs or raw conversation exports becoming available.

**Best next operation:** inspect fresh v2 autotag outputs if committed; otherwise reproduce/check selectivity from bounded source samples while reconciling Viewer source-path generation.
