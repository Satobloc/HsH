# Action Plan | Clone-footprint census and internal traffic reconciliation

**Plan ID:** CLONE-FOOTPRINT-CENSUS-2026-11-03  
**Created:** 2026-11-05  
**Status:** ACTIVE / coordinator reconciliation updated / telemetry still incomplete  
**Priority:** P2 / time-bounded operational investigation  
**Priority authority:** Nathan Direct, 2026-11-05 upkeep/priority instruction; complements the already-open issue #1315 and existing GitHub Traffic investigation.  
**Coordinator / control owner:** Tern (Comptroller), as task-graph and workflow-reconciliation owner.  
**Contributors:** each distinct selected identity in the existing 19-label ring, once; coordinator may reconstruct when first-hand access is unavailable.  
**Identity caveat:** a ring label is a routing label, not proof of an authenticated historical worker or thread.

## Objective

Estimate how much of the repository clone traffic is plausibly explained by project-owned GitHub Actions and other evidenced clone-producing operations, then estimate the unexplained residual with uncertainty. Keep clone events, unique cloners, API/file reads, and unknown workspace provisioning separate.

## Why now

The reported traffic acceleration and follower growth are unresolved. Issue #1315 remained unanswered since November 3 because the issue/log were not routed into worker prompts, the task graph, or an addressed handoff. The root delivery gap is now documented and the route repaired: the Steering Charter and active task graph contain the request, and coordinator packets are recorded in Tern's repository inbox. At the 2026-11-06T03:43Z readback, the issue remains open with four coordinator comments; the shared log has 13 reconstructed ring-label entries and zero authenticated first-hand worker-thread replies. The evidence window is time-sensitive and the question is bounded.

## Scope

**Included:** HsH, SAT_THEORY_ARCHIVE_2023-25, HSH_RESOURCES; actual Actions checkout steps, retries/matrices, Pages contribution, explicit git clones, and provisioning-unknown environments; comparison against daily Traffic data.

**Excluded:** inferring unique humans from unique-cloner counts; treating API/file reads or archive downloads as full clones; inferring worker intent from missing check-ins; assigning IP identity or credential stability without evidence; treating every worker turn as a new cloud environment.

## Current verified state

- Issue #1315 remains open with four coordinator comments (latest verified count; no new comment was made because the available GitHub comment action is PR-scoped, not a general issue-comment action). The shared log contains 13 reconstructed ring-label entries: Nadir Voss, Kestrel, Orson Vay, Mira, Loom, Meridian, Aldus, Calder, Enheduanna, Morrow, Mercer, Aster and Tern Rook. Six labels remain; there are zero authenticated first-hand worker-thread responses.
- Four fixed hourly leases are enabled at :00, :24, :36, :48; :12 remains disabled. Do not change them.
- The 19-label ring is not equivalent to 19 authenticated threads.
- A successful HSH_RESOURCES source-inventory run #41592883527 / job #125773422547 confirmed three completed checkout steps: HSH_RESOURCES, HsH, and GLASS, with the exact workflow YAML verifying GLASS is Satobloc/SAT_THEORY_ARCHIVE_2023-25.
- Nadir PR #1189 Actions run #41927513429 / job #126915668961 confirms one completed HsH checkout step with git init and depth-1 fetch in the job log. Classify it as a likely clone-producing workflow event, not a worker-initiated local clone.
- The census now has 13 reconstructed ring-label entries, not authenticated first-hand worker responses; six labels remain. Five inspected Actions runs provide seven completed checkout events in a limited sample: HsH=5, HSH_RESOURCES=1, SAT archive=1. The fifth HsH run is the Issue Publication Intake workflow for #1408; its rejection comment confirms the publisher script ran, but the workflow run ID/log was not independently retrieved. The newest HsH events are the existing Tern PR #824 merge-ref Lean build and the Issue Publication Intake run for #1408; both are project-level Actions checkouts, not worker-initiated local clones. The response requirement remains in the live Steering Charter and task graph; direct automation prompt edits were blocked by plan capacity, and no schedule/task configuration was altered. This remains a small sample, not a period-wide estimate or residual.
- Historical traffic reference: the supplied 14-day window had 48,880 clones and 4,686 unique cloners; an earlier daily series covered Oct 19-Nov 1. These are user-supplied dashboard readings, not recomputed in this action plan.

## Milestones

| Milestone | Owner | Exit criterion | State |
|---|---|---|---|
| Delivery repair | Common control-plane owner | #1315 and response log are embedded in the live Steering Charter and active task graph; the four existing prompts already read the charter; no schedule/task-ID change | ROUTING VERIFIED / PROMPT EDIT BLOCKED BY PLAN LIMIT |
| Identity check-ins | Each selected ring label once | 13 of 19 entries recorded (Nadir Voss, Kestrel, Orson Vay, Mira, Loom, Meridian, Aldus, Calder, Enheduanna, Morrow, Mercer, Aster, Tern Rook); all are explicitly reconstructed, not authenticated first-hand worker responses. Six labels remain. | IN PROGRESS |
| Telemetry reconstruction | Tern / Comptroller | Expand checkout counts by repo/run/job/attempt/day and classify retries, matrices, Pages and other mechanisms beyond the verified four-event sample | IN PROGRESS / 6-EVENT, 4-RUN SAMPLE VERIFIED |
| Reconciliation | Tern with independent Review lane | Compare internal event estimate against daily Traffic, publish low/central/high and residual range with limitations | OPEN |
| Closeout | Tern | Issue #1315 has summary, unresolved unknowns, and a durable return/monitoring decision | OPEN |

## Immediate procedure

1. Append a coordinator comment to issue #1315 explaining the actual delivery repair and follow-up. This remains OPEN: the available GitHub comment action in this runtime is PR-scoped, not a general issue-comment action; no PR-only action was misapplied to issue #1315.
2. The direct prompt-text mutation route was rejected by the Automations service because the current plan allows only three scheduled tasks. Use the live Steering Charter plus active task-graph branch as the delivery route; existing relay prompts already read the Steering Charter. Only the currently selected identity is handled per activation. Check the shared log first to avoid duplicates.
3. Report whether the run has first-hand execution evidence, log-reconstructed evidence, or only unknowns. Never claim the ring label is a verified persistent instance.
4. Do not wait for all identities before reconstructing Actions telemetry. Work independently evidenced event data in parallel.
5. Tern owns reconciliation. The :48 Review lane supplies independent QC when its selected worker is eligible, but does not replace Tern's coordinator ownership.

## Review triggers

- Every relay activation checks whether the current selected identity is missing from the census log.
- Coordinator reviews progress after each five newly appended identity entries, or after five actual worker activations if entries are slower. Current progress is 13/19; next identity-count review after five additional entries (18/19), or after five additional actual activations.
- Final synthesis begins when all 19 entries are present or their unavailability is explicitly documented; do not leave the task open indefinitely merely waiting for inaccessible identities.
- Reconcile telemetry incrementally; retain uncertainty rather than forcing estimates to match GitHub's aggregate total.

## Current follow-up state

- Tern coordinator handoff and two additive telemetry amendments are verified in the repository inbox. The intended h610:s2 packet was not consumed by the late h625:s3 Tern occurrence; retain it for h629:s2 / 2026-11-06T05:24Z. The h625:s3 scheduler record is FAILED/chat_ref=null. The immediate Morrow h625:s4 successor receipt already exists, so no forward handoff or inbox append was made. Repository presence does not establish thread delivery, consumption or acknowledgment.
- The direct edit route for the four saved relay prompts remains blocked by the Automations service plan limit. The existing prompt bodies are unchanged; the Steering Charter and task graph are the current route because all four prompt bodies require reading the Steering Charter.

## Nonclaims

No clone count is inferred from an API call, user profile follow, unique-cloner count, or current cloud task count. No authenticated worker has been contacted or acknowledged merely because an issue, log or repository handoff exists. The four checked-out source operations are a small workflow sample, not a period-wide internal estimate or a residual estimate. No completion is claimed until the full telemetry comparison is read back.


## Coordinator reconciliation — 2026-11-06T03:43Z

- Shared check-in log readback: 13 distinct ring-label sections, six absent, zero authenticated first-hand worker-thread replies. Aster's append preceded Tern's by nine seconds; Tern is the thirteenth current entry, correcting the stale twelfth-position statement in its original check-in. No entry was overwritten.
- The sample now contains seven completed checkout events across five inspected Actions runs: HsH=5, HSH_RESOURCES=1, SAT archive=1. The newest event is a project-level checkout from the Tern PR #824 merge-ref Lean build. No local worker clone is inferred.
- The read-only `task_upkeep_triage.py` source passed its self-test in a temporary runtime copy. The current task graph has 13 active/blocked branches and five completed nodes; the live triage initially ranked the two P2 upkeep/census branches ahead of unclassified P0/P1 branches because most active priorities were absent. Tern reconciled only priorities/dates explicitly supported by the live Steering Charter and Three Paper Campaign; unsupported solver/parent branches remain UNCLASSIFIED.
- The task graph's declared `branch_count=16` versus 18 array nodes remains unexplained; it is documented but not changed.
- No daily Traffic comparison, period-wide estimate, residual interval, cloud-provisioning attribution, or survey closeout is claimed. Reconciliation remains OPEN.


## Publisher status correction — 2026-11-06T03:50Z

The scheduler-observation public submission was created as issue #1408, but the existing publisher rejected it with `REJECTED: invalid schema`: the envelope used uppercase `HSH-PUBLISH-V1`, while `tools/issue_publish.py` requires lowercase `hsh-publish-v1`. The expected artifact path was checked and is absent. No duplicate issue or manual artifact write was made. Treat the public submission as REJECTED, not PUBLISHED or PENDING. The underlying Lean module remains publicly visible in existing PR #824 and its merge-reference build passed; the separate issue summary was not published.
