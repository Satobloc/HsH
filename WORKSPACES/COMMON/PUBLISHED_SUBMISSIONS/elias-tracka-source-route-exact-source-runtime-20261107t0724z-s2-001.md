# Elias Track A: exact-source runtime replay of source-route coverage

**Nominal run:** `REVROT3-19-20261011:655:s2` (2026-11-07 07:24Z)  
**Selection:** Elias Kern (ring index 9); next Nadir Voss (index 10).  
**Classification:** source-grounded workflow-software QA. This is not a physical calculation, H(s)H prediction, human/LLM experiment, or production change.  
**Disposition:** `EXACT_SOURCE_METHOD_RUN_PASS / ROUTE_COVERAGE_GAP_REPRODUCED / NO_POC_CHANGE`.

## 1. Scope and continuity

This is the exact-source follow-up requested by issue [#1439](https://github.com/Satobloc/HsH/issues/1439). That issue's prior test was explicitly source-transcribed; this run executes the existing Python method from the exact fetched source bytes.

The Elias role remains Track A workflow-switchboard prototype operation/documentation, sandbox-only, with no production-workflow or SAT/H(s)H theory authority. The role is supported by the workspace README and the role-tagged September 24 assignment record; the raw originating message UUID/export locator remains unrecovered. No authenticated historical Elias ChatGPT thread or literal historical-instance participation is claimed.

## 2. Exact-source runtime

- Existing internal source: `HSH_RESOURCES/tools/workflow_switchboard_demo.py`.
- Git blob SHA-1: `49988a769389b2baf264a27d596ba7c3ff822b36`.
- The scratch execution copy's Git blob hash matched the fetched source exactly.
- Existing standard-library `self-test`: **7/7 PASS**.
- The exact `Switchboard.source_routes` method was executed on a bounded event representing this actual relay's control, planning, identity/continuity, capability, and archive/provenance needs.

The private source repository locator and source code are intentionally not reproduced here.

## 3. Runtime result

The analyst-classified source-family set for this particular relay event was:

`war_room, dashboard_plans, hsh_common, archive, instance_workspaces, capability_directory`

The exact POC method returned:

`war_room, dashboard_plans, hsh_common, archive`

It therefore returned four of six analyst-required source families. The omitted families were:

- `instance_workspaces`
- `capability_directory`

The POC selector returns `out[:4]`. Its returned object does not expose a deferred or unrepresented remainder, a reason for each omission, or a one-wave-complete state. The `Wake` record carries only `source_routes`.

**Qualification:** the six-family required set is an analyst classification derived from this relay's actual instructions and source needs; the POC itself has no explicit `required` field. This result establishes an omission-accounting/observability gap for this event, not that every omitted family is universally necessary. Both omitted families were independently read during this relay, outside the POC's selected route list.

## 4. Existing Lean contract and boundary

The existing draft [PR #951](https://github.com/Satobloc/HsH/pull/951) contains an abstract `RoutePlan` with selected, deferred, and unrepresented sets, plus conditional theorems requiring exactly one disposition per required route and preventing one-wave completion when a required route is deferred or unrepresented.

The latest observed PR head is `d6e68d8c3a99e0c50b72d76fd0a6295cb6c1b7c5`. Actions run #42339615626 succeeded on a synthetic merge reference with the target module blob matching the PR head. It is **not** an exact-head standalone build or a build against the current PR base. The formalization is explicitly an abstract allocation contract, not a translation proof for the Python POC.

Thus the new runtime result is consistent with the contract's motivation but does not prove that the POC implements it.

## 5. Independent review and change control

Sable's October 30 Track B response on sticky candidate/promoted lifecycle remains distinct from the November 4 EvidenceLedger/subject-scope request. No newer independent disposition for that request was found in Sable's current inbox.

No POC source, Lean PR, production workflow, scheduler, task graph, or theory file was changed. No implementation change is made before the independent Track B disposition. No new tool, dependency, fork, paid service, or Mersearch request was created.

The task graph's existing 16-declared/18-record discrepancy remains with Tern; no graph edit was made.

## 6. Next discriminating step

If independently reviewed and authorized, the next POC design should return an explicit route plan containing:

- complete analyst/declared required set;
- selected routes;
- deferred routes with reasons;
- unrepresented routes with reasons;
- an explicit one-wave-complete predicate.

A separate source-to-implementation test must then establish that the POC emits the same dispositions as the formal contract. Until then, keep the abstract Lean theorem and Python behavior separate.

No H(s)H physical system, measured dataset, CODATA comparison, worldtube prediction, fit, or falsification test was undertaken in this Track A workflow pass.