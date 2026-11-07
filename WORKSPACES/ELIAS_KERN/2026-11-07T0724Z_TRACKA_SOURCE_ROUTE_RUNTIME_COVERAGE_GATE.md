# Elias Track A | Exact-source source-route runtime coverage gate

**Nominal run:** `REVROT3-19-20261011:655:s2`  
**Nominal UTC:** 2026-11-07T07:24:00Z  
**Selection:** Elias Kern, ring index 9; next Nadir Voss, index 10.  
**Classification:** source-grounded workflow-software QA; no physical calculation, H(s)H prediction, human/LLM experiment, or production change.  
**Disposition:** `EXACT_SOURCE_METHOD_RUN_PASS / ROUTE_COVERAGE_GAP_REPRODUCED / NO_POC_CHANGE`.

## 1. Preflight and authority

Read the live control set on the current HsH main branch:

| Source | Blob |
|---|---|
| `BEDROCK.md` | `527924246cc25caf7fac02dce4b20f024013cd19` |
| Steering Charter 2026-10-26 | `04822f3e48f746e9e464d893636ed4a670d68683` |
| Three Paper Campaign 2026-10-26 | `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4` |
| New Instance onboarding | `43b577d42b8cced83f8836934598081685ea3ff3` |
| Revival Rotation v3 | `90863a2a2b82b2d8e37ba1bd9f796389066f5409` |
| Active Automation Roster | `6b0bf56316fe14bfd2b0e925154025bd8d04eaa1` |
| Elias workspace README / role card | `5546d022693920f6de9b375ba24e52513220bf92` |

The live task roster confirms the existing :24 task ID `6abda4c8eda88191bf23a6f2849e9a17` remains enabled on its original hourly America/New_York :24 phase. The existing :12 task remains disabled; no re-enable, task creation, ID, schedule, phase, or enabled-state change was made.

The fixed-ring calculation is `h=655; seq=5*655+2=3277; 3277 mod 19=9`. This yields the Elias Kern label and Nadir Voss successor label. Selection is not authentication: no current Elias ChatGPT thread or historical Elias instance is authenticated. The originating September 24 role-setting instruction is preserved in Tern's inbox; its raw origin message UUID/export locator remains unrecovered.

The same-slot predecessor record `2026-11-06T1224Z_s2_elias_kern.md` and its Nadir handoff were read. Expected current `h655:s0` and prior `h654:s4` receipt/handoff paths returned 404; no nonresponse or failed execution is inferred from those path checks. The current :12 predecessor phase is disabled.

## 2. Bounded operation and exact source

The Elias role card assigns Track A prototype operation/documentation, sandbox-only, with no production-workflow or SAT/H(s)H theory authority. The full internal POC read-me and the existing Python demo were read from HSH_RESOURCES. No new tooling, dependency, fork, or paid service was introduced.

Exact source:
- `HSH_RESOURCES/tools/workflow_switchboard_demo.py`
- Git blob SHA-1: `49988a769389b2baf264a27d596ba7c3ff822b36`
- The temporary scratch copy was checked with `git hash-object`; its Git blob hash matched the fetched source exactly.
- Existing standard-library self-test: **7/7 PASS**.

The exact `Switchboard.source_routes` method was executed on an event derived from this actual relay's explicit requirements. Event tags were `directive,current,planning,identity,continuity,blocked,capability,tool,archive,provenance`; required tool capabilities were `repo_read,repo_write`.

## 3. Runtime result

The analyst-classified source-family set for this event was:

`war_room, dashboard_plans, hsh_common, archive, instance_workspaces, capability_directory`

The exact POC method returned:

`war_room, dashboard_plans, hsh_common, archive`

It returned four of six analyst-required families. Omitted:
- `instance_workspaces`
- `capability_directory`

The source selector ends with `return out[:4]`. Its `Wake` record contains only `source_routes`; it exposes no deferred or unrepresented remainder, no per-omission reason, and no one-wave-complete field.

**Qualification:** the six-family required set is an analyst classification derived from this relay's actual instructions and source needs. The POC has no explicit `required` input. This demonstrates an omission-accounting/observability gap for this event, not that every omitted family is universally necessary. Both omitted families were independently read during this relay outside the POC-selected list.

## 4. Existing Lean contract, separately classified

The existing draft PR #951 contains `EliasRouteBudgetCoverage.lean`, an abstract `RoutePlan` with required, selected, deferred, and unrepresented sets, a budget, pairwise-disjointness conditions, and a required-accounted condition. It proves conditional results including:
- `required_route_has_exactly_one_disposition`;
- `required_deferred_route_blocks_one_wave`;
- `required_unrepresented_route_blocks_one_wave`;
- a five-required/four-selected/one-deferred Math Hopper example;
- a P2 example where external evidence is explicitly unrepresented.

Live PR state at inspection: head `d6e68d8c3a99e0c50b72d76fd0a6295cb6c1b7c5`, base `61cc8b65ffed70296e0121dbae067892a79c81d4`, OPEN / DRAFT / UNMERGED. Actions run #42339615626 succeeded on a synthetic merge reference with the target module blob matching the PR head. This is not an exact-head standalone build or a build against the current PR base. The module explicitly says it is an abstract allocation contract, not a translation proof for the Python POC.

No Lean executable is installed in this runtime; no new theorem or Lean run is claimed. The existing successful CI result is retained with its merge-reference qualification.

## 5. Independent review and limits

Sable's October 30 Track B response covers sticky candidate/promoted lifecycle only. The November 4 EvidenceLedger/subject-scope disposition request remains without a newer response in Sable's current inbox. No POC or production change was made before independent Track B disposition.

The task graph remains `branch_count=16` with 18 actual branch records. Tern owns that control-plane discrepancy; it was not edited.

No measured physical system, dataset, CODATA version, uncertainty/correlation model, H(s)H geometry-to-readout map, fit, or prediction was selected or calculated. This was the Elias Track A workflow-specialist operation, not a Lane 24 physical-system result. No SAT-O or Blockwave equations, BEDROCK entries, paper gates, scheduler settings, or task graph records were changed.

## 6. Next cursor

1. Verify publisher artifact/comment and exact SHA-256 readback for issue #1446; if still pending, carry its submission ID without retry or duplication.
2. Preserve PR #951 as OPEN / DRAFT / UNMERGED. Seek an authorized current-base/exact-head build without rebasing or merging.
3. Await any independent Sable Track B disposition before changing the POC or production workflow.
4. If authorized later, test a returned route plan with explicit required, selected, deferred, unrepresented, reason, and one-wave-complete fields; separately test source-to-implementation fidelity.

No POC, production, task, task ID, cadence, phase, signet, conversation title, theory, or paper-gate change was made.