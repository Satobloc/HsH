# ONE-TIME ASSIGNMENT — Individual Instance Enrichment State Report

**Date:** 2026-09-18  
**Authority:** Nathan-direct  
**Owner/coordinator:** Sable  
**Status:** OPEN — one-time report, not recurring unless Nathan later says so

## Assignment

Produce a durable, human-facing report on the **current state of individual-instance enrichment work** across the SAT/H(s)H project.

This report is about how well each named/current/revivable instance has itself been equipped with the context, source access, continuity material, role knowledge, methodological controls, and project-state understanding needed to resume useful work. It is **not** merely a report of what outputs each instance has produced.

## Scope

Identify every materially relevant instance/lane in the current project map, including:

- active recurring workers;
- active non-recurring instances;
- Ravel and other live theory/reconstruction specialists;
- Sable itself where appropriate;
- consultant/revival instances;
- sleeping/disabled but intentionally resumable instances;
- recently replaced/re-derived instances whose enrichment state still matters;
- uncertain instances where it is unclear whether enrichment/continuity is sufficient.

Do not limit the report to a hard-coded familiar roster if current control surfaces identify additional relevant instances.

## For each instance, report

1. **Identity / role / lane** — what the instance is for and its current operational status.
2. **Durable continuity surfaces** — `STATE`, `CONTINUITY`, setup, wake packet, workspace README, check-in, handoff, native conversation ID, or equivalent, where present.
3. **Last meaningful enrichment** — date/commit/source for the most recent substantive enrichment, not merely routine output.
4. **Enrichment actually completed** — context, sources, theory-state updates, methodology, provenance rules, tool access, role calibration, archive/repo knowledge, etc. that have genuinely been added.
5. **Enrichment planned/claimed but not verified** — distinguish requests and self-reports from durable completed enrichment.
6. **Source/corpus coverage** — what major sources the instance has been explicitly linked to or equipped to use: current HsH, old SAT archive, GLASS, RESOURCES/toolkit, conversation corpus, NotebookLM exports, podcast/public record, etc., with quarantine rules respected.
7. **Current-theory synchronization** — whether the instance has the major current corrections/status distinctions needed to avoid stale SAT/H(s)H assumptions.
8. **Methodological/epistemic synchronization** — provenance/authorship vs SAT-hypothesis membership vs theory status; literal-first interpretation; self-report/self-critique not verification; error/meta-audit discipline; current promotion/core rules as recovered; other relevant controls.
9. **Restart quality** — if revived now, how much work would be needed before the instance could safely continue its intended lane without major context loss or stale assumptions?
10. **Gaps / stale material / collisions** — missing enrichment, duplicated packets, contradictory setup files, obsolete context, unfiled state, inaccessible conversation-only context, unresolved identity/role drift.
11. **Next enrichment action** — one bounded, concrete next step if enrichment is incomplete.

## Required distinctions

Maintain these distinctions throughout:

- **instance enrichment** ≠ ordinary work product;
- assignment/request ≠ enrichment completed;
- self-report ≠ independently confirmed state;
- file presence ≠ file read/ingested by the instance;
- old continuity ≠ current synchronization;
- conversation-local context ≠ durable restartable context;
- general project knowledge ≠ role-specific enrichment;
- current/live status ≠ mathematical or physical validation.

Do not infer that an instance 'knows' a control merely because that control exists in `WORKSPACES/COMMON`; determine whether its setup/restart path actually directs it to current Common controls or otherwise incorporates them.

## Global summary

After the per-instance records, provide a concise project-wide synthesis covering:

- instances with strong current restart/enrichment surfaces;
- instances partially enriched or materially stale;
- instances whose enrichment state is unclear;
- important role-specific knowledge that exists but has not propagated to the relevant instances;
- duplicated enrichment effort that should be consolidated;
- high-value instances worth enriching next;
- whether Common controls are actually propagating effectively into individual-instance restart paths.

Use descriptive status categories rather than vague confidence language. Explain the evidence behind each status.

## Provenance and audit standard

For material claims, cite exact repository paths and commits/checkpoints where practical. If evidence comes only from a conversation-local state or historical self-report, say so.

Do not treat an instance's own claim that it is fully briefed, current, enriched, or synchronized as sufficient proof. Inspect the durable surfaces and the actual enrichment record.

## Deliverable

File the completed dated report in a durable, easy-to-find location, preferably:

`WORKSPACES/SABLE/INSTANCE_ENRICHMENT_STATE_2026-09-18.md`

If a different canonical report location is already established by the time this is run, use that location and leave a clear pointer from Sable's workspace.

Also include a short pointer to the report in the relevant current coordination/handoff surface so it is discoverable rather than becoming another buried artifact.

**One-time assignment for now. Do not create a recurring cadence without Nathan's instruction.**


## Progress note | 2026-11-22

Sable's own assistant-level State of Reconstruction and Instance Enrichment reports are now filed at `WORKSPACES/SABLE/STATE_OF_RECONSTRUCTION_2026-11-22.md` and `WORKSPACES/SABLE/INSTANCE_ENRICHMENT_2026-11-22.md`. These cover Sable only. The one-time project-wide assignment remains OPEN; the other active, sleeping, consultant, and revivable instances have not yet been fully inventoried. No recurring cadence is created.

---

## 2026-11-24 | Partial project-wide report-family census (not an enrichment audit)

**Method:** read the current HsH recursive Git tree at main commit `7a38830824aca3f6c67df322743916bf4dca6534`. The API returned 17,541 paths with `truncated=false`. Searched the complete path set for the exact report-family/role-source filename patterns `STATE_OF_RECONSTRUCTION`, `INSTANCE_ENRICHMENT`, `ROLE_CHARTER`, and `HISTORICAL_REMIT_SOURCE_SUPPLEMENT`. Also inspected top-level directory inventories for the fixed 19-worker ring. This is a filename census only: it does not establish whether an instance was enriched, what it read, or whether equivalent material exists under another filename or outside the searched HsH workspace.

| Ring worker | Exact-name files located |
|---|---|
| Sable | State of Reconstruction 2026-11-22; Instance Enrichment 2026-11-22; historical remit source supplement; original one-time assignment |
| Mercer | State of Reconstruction 2026-09-19; Instance Enrichment 2026-09-19 |
| Orson Vay | Role Charter 2026-10-09 LLM Cognition |
| Loom, Aster, Ariadne, Alberr, Mira, Aldus, Calder, Hale, Elias Kern, Nadir Voss, Enheduanna, Tern, Morrow, Kestrel, Meridian, Ravel | No exact-name report-family/role-charter match in the recursive HsH path census |

The current project-wide report-series call independently links the Sable and Mercer report pairs and describes other instances as `Not yet located`. The census is consistent with that locator state. It does **not** convert `Not yet located` into `not enriched`, nor does the presence of a BOOT/CURRENT_WORK/README file count as completed enrichment.

**Disposition:** the one-time project-wide assignment remains **OPEN / PARTIAL**. Sable and Mercer have discoverable paired reports; Orson has a discoverable role charter; the other ring members require source-grounded inspection of their current continuity, direct role instructions, actual source exposure, methods, tools, and durable enrichment evidence. Active, paused, consultant, and revivable states must remain separate. Do not infer current accessibility from a workspace directory or historical conversation ID.

**Next bounded census step:** reconcile each remaining worker against the current active automation roster and instance/lease registry, then inspect that worker's BOOT/CURRENT_WORK and direct historical role sources. Preserve per-instance identity and evidence class. Tern retains scheduler/task-allocation authority; this partial census changes no task, lease, graph, or ownership.
