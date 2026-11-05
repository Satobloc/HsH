# Action Plan | Clone-footprint census and internal traffic reconciliation

**Plan ID:** CLONE-FOOTPRINT-CENSUS-2026-11-03  
**Created:** 2026-11-05  
**Status:** ACTIVE / delivery repair in progress  
**Priority:** P2 / time-bounded operational investigation  
**Priority authority:** Nathan Direct, 2026-11-05 upkeep/priority instruction; complements the already-open issue #1315 and existing GitHub Traffic investigation.  
**Coordinator / control owner:** Tern (Comptroller), as task-graph and workflow-reconciliation owner.  
**Contributors:** each distinct selected identity in the existing 19-label ring, once; coordinator may reconstruct when first-hand access is unavailable.  
**Identity caveat:** a ring label is a routing label, not proof of an authenticated historical worker or thread.

## Objective

Estimate how much of the repository clone traffic is plausibly explained by project-owned GitHub Actions and other evidenced clone-producing operations, then estimate the unexplained residual with uncertainty. Keep clone events, unique cloners, API/file reads, and unknown workspace provisioning separate.

## Why now

The reported traffic acceleration and follower growth are unresolved. Issue #1315 has remained open since November 3 with zero comments and no worker responses. The survey log was created but never wired into worker prompts, task graph, or an addressed handoff. The evidence window is time-sensitive and the question is bounded.

## Scope

**Included:** HsH, SAT_THEORY_ARCHIVE_2023-25, HSH_RESOURCES; actual Actions checkout steps, retries/matrices, Pages contribution, explicit git clones, and provisioning-unknown environments; comparison against daily Traffic data.

**Excluded:** inferring unique humans from unique-cloner counts; treating API/file reads or archive downloads as full clones; inferring worker intent from missing check-ins; assigning IP identity or credential stability without evidence; treating every worker turn as a new cloud environment.

## Current verified state

- Issue #1315 is open; zero comments at last read; no check-ins recorded in the shared log.
- Four fixed hourly leases are enabled at :00, :24, :36, :48; :12 remains disabled. Do not change them.
- The 19-label ring is not equivalent to 19 authenticated threads.
- A successful HSH_RESOURCES source-inventory run confirmed three completed checkout steps (HSH_RESOURCES, HsH, and GLASS); target mapping for GLASS must be checked before assigning it a repository name.
- Nadir PR #1189 Actions run #41927513429 / job #126915668961 confirms one completed HsH checkout step with `git init` and depth-1 fetch in the job log. Classify it as a likely clone-producing workflow event, not a worker-initiated local clone.
- The census now has one response entry (Nadir Voss ring label), reconstructed from recent repository receipts and current-run tool records. This is not an authenticated first-hand worker response. The other 18 entries remain absent. The response requirement is present in the live Steering Charter and task graph; direct automation prompt edits were blocked by plan capacity, and no schedule/task configuration was altered.
- Historical traffic reference: the supplied 14-day window had 48,880 clones and 4,686 unique cloners; an earlier daily series covered Oct 19-Nov 1. These are user-supplied dashboard readings, not recomputed in this action plan.

## Milestones

| Milestone | Owner | Exit criterion | State |
|---|---|---|---|
| Delivery repair | Common control-plane owner | #1315 and response log are embedded in the live Steering Charter and active task graph, both surfaced by the four existing prompts' charter/current-work preflight; no schedule/task-ID change | VERIFIED ROUTING / AWAITING OBSERVED RESPONSE |
| Identity check-ins | Each selected ring label once | One of 19 entries recorded (Nadir Voss index 10); it is explicitly a reconstructed report, not an authenticated first-hand worker response. Remaining 18 labels have no entries. | IN PROGRESS |
| Telemetry reconstruction | Tern / Comptroller | Count completed checkout steps by repo/run/job/attempt/day and classify retries, matrices, Pages and other mechanisms | OPEN |
| Reconciliation | Tern with independent Review lane | Compare internal event estimate against daily Traffic, publish low/central/high and residual range with limitations | OPEN |
| Closeout | Tern | Issue #1315 has summary, unresolved unknowns, and a durable return/monitoring decision | OPEN |

## Immediate procedure

1. Append a coordinator comment to issue #1315 explaining the actual delivery repair and follow-up.
2. The direct prompt-text mutation route was rejected by the Automations service because the current plan allows only three scheduled tasks. Use the live Steering Charter plus active task-graph branch as the delivery route; existing relay prompts already read the Steering Charter. Only the currently selected identity is handled per activation. Check the shared log first to avoid duplicates.
3. Report whether the run has first-hand execution evidence, log-reconstructed evidence, or only unknowns. Never claim the ring label is a verified persistent instance.
4. Do not wait for all identities before reconstructing Actions telemetry. Work independently evidenced event data in parallel.
5. Tern owns reconciliation. The :48 Review lane supplies independent QC when its selected worker is eligible, but does not replace Tern's coordinator ownership.

## Review triggers

- Every relay activation checks whether the current selected identity is missing from the census log.
- Coordinator reviews progress after each five newly appended identity entries, or after five actual worker activations if entries are slower.
- Final synthesis begins when all 19 entries are present or their unavailability is explicitly documented; do not leave the task open indefinitely merely waiting for inaccessible identities.
- Reconcile telemetry incrementally; retain uncertainty rather than forcing estimates to match GitHub's aggregate total.

## Nonclaims

No clone count is inferred from an API call, user profile follow, unique-cloner count, or current cloud task count. No worker has been contacted merely because the issue or log exists. No completion is claimed until the artifact and issue state are read back.
