# Worker Upkeep and Priority Review Protocol

**Established:** 2026-11-05  
**Status:** ACTIVE / standing control-plane practice  
**Authority:** Nathan Direct, 2026-11-05  
**Owner for control-plane reconciliation:** Tern / Comptroller, subject to live scheduler and autonomy rules.

## Purpose

Prevent valuable work from disappearing between conversations, issues, branches, worker rotations, and shifting priorities. Workers must periodically inspect the living to-do system, not merely execute the most recently visible instruction. They should notice unfinished commitments, changed dependencies, neglected high-value tasks, opportunities newly made cheap by current work, and tasks whose urgency has risen or fallen.

This is upkeep, not permission for uncontrolled scope expansion. The goal is a small, current, owned queue with useful next actions and honest return paths.

## 1. Required upkeep at every worker activation

Before selecting the substantive operation:

1. Read the live task branch graph, current milestone/priority controls, the selected worker's current work/continuity card, and the latest relevant receipt or handoff.
2. Inspect open work in the selected worker's remit and the immediately related shared queue. Check for:
   - unfinished work with no durable next action or owner;
   - overdue or stale checkpoints;
   - a formerly blocked dependency that has cleared;
   - a priority change caused by a new directive, deadline, result, or external event;
   - a lower-priority task that has become a low-cost complement to work already underway;
   - duplicate, superseded, or completed entries still consuming attention;
   - a survey, review, approval, or handoff that was opened but never actually delivered to a responsible worker.
3. Select at most one upkeep-derived task to execute in the current activation, unless the controlling priority owner has explicitly bundled several tiny dependent actions.
4. Execute it only when it is within remit, source/access-cleared, reversible, and does not displace a higher-priority commitment or break concentration on a fragile operation.
5. Otherwise update the existing issue/branch/plan with the reason it remains pending, a named owner or eligible owner class, the next action, the trigger for review, dependencies, and an exit criterion. Reuse existing records; do not create duplicate issues or parallel plans.

The scan can be brief. A worker does not need to conduct a full portfolio review every hour.

## 2. Deeper rolling review

At least once per **five actual completed worker activations** across the relay, perform a deeper open-work sweep. Count completed activations, not the number of enabled scheduler leases or nominal slots. Also trigger a deeper sweep when a major milestone closes, a major dependency clears, Nathan changes priorities, or evidence shows a recurring task has been stranded.

The deeper sweep should:
- compare active and blocked items against current priorities and deadlines;
- identify work that should resume, split, merge, be handed off, be parked, or be marked superseded/completed;
- select one useful low-hanging item when it complements current work;
- identify orphaned issues that lack an owner, delivery route, or review trigger;
- reconcile the task graph with newer receipts, issues, and verified artifacts;
- record what was reviewed, what changed, what did not change, and why.

Do not claim a full sweep when only one branch or one worker's own queue was inspected.

## 3. Priority hierarchy

Use this shared project-level hierarchy as a default. Specific Nathan Direct instructions, safety/access restrictions, active campaign controls, and explicit deadlines may make a local item higher or lower within its class; document the reason.

| Class | Meaning |
|---|---|
| **P0 — immediate control / emergency** | Active safety, integrity, publication, or operational emergency; explicit urgent Nathan direction. Active Code Grurple interlock remains an overriding current control while active. |
| **P1 — core theory and protected milestones** | Core SAT/H(s)H theory, required geometry-first gates, and fixed-date campaign commitments with named ownership. Existing P1 paper commitments remain protected; do not demote them merely because the broad subject is LLM cognition. |
| **P2 — strategic second tier** | Whirligig; bounded operational investigations whose evidence window or unresolved dependency makes timely completion important; other explicitly elevated strategic work. Whirligig remains below core theory and above general LLM-cognition and general provenance/archival work. |
| **P3 — general specialist and provenance work** | General LLM-cognition research outside protected P1 deliverables, general provenance/archival enrichment, and ordinary specialist development. |
| **P4 — discretionary / exploratory backlog** | Useful but non-urgent exploration, optional enrichment, and work without a current dependency or deadline. |
| **UNCLASSIFIED** | Priority has not been established from current authority. Do not silently assign a rank by intuition; surface it for review. |

Priority is not a substitute for ownership, access, or evidence. A high-ranked task can remain blocked. An item does not rise merely because it is interesting or easy.

## 4. Delivery and response accountability

Opening an issue, writing a log, or publishing a handoff pointer is not proof that a worker received a task.

For any action that requires a worker response:
- specify the exact action and response location;
- add it to the live task graph or current worker queue;
- place it in an actual enabled worker prompt or a verified addressed handoff/inbox route;
- identify who coordinates completion and who performs independent follow-up;
- set a response condition and a review trigger;
- inspect subsequent receipts and the artifact itself;
- distinguish delivered, consumed, acknowledged, completed, and independently verified states.

A missing response is not automatically refusal, failure, or lack of effort. Check notification/delivery and scheduler evidence first. A deterministic worker-ring label is not an authenticated human or historical ChatGPT identity. Any reconstructed report must be labelled as reconstructed from logs, not written as a fabricated first-person account. Unknown stays unknown.

## 5. Action plans and scope control

Material multi-step goals should use a durable action plan based on ACTION_PLAN_TEMPLATE_2026-11-05.md. Keep a compact goal packet in the repository, with pointers to authoritative data, branches, issues, and artifacts rather than copying large bodies of source material.

Each plan should carry:
- objective and why it matters now;
- priority and source of that priority;
- owner and contributors, with identity/authentication status;
- current state and evidence freshness;
- milestones and dependency edges;
- one next action and a bounded exit criterion;
- alternatives and explicit non-goals;
- scope budget / stop conditions;
- review triggers and next review date or activation count;
- links to durable artifacts and provenance;
- lessons learned and changes to the plan.

Plans should be revised when evidence, deadlines, dependencies, or value change. Do not preserve obsolete plans merely because effort has already been invested. Do not broaden scope without naming what new work displaces.

## 6. Scripting and deterministic triage

Use task_upkeep_triage.py to produce a reproducible candidate ordering from task-graph metadata. It is a sorting aid, not an authority or autonomous scheduler. It must never alter priority or task state. Missing metadata remains visible; it is not invented. The human/Comptroller/worker review supplies judgment, context and source-backed reasons.

Where useful, save dated machine-readable snapshots of ranked candidates and a short human decision note. Do not turn every scan into a new artifact; update the existing plan or task record when possible.

## 7. Safeguards

- Preserve P0/P1 commitments, Code Grurple, fixed paper gates and named specialist remits.
- Respect Nathan Direct, BEDROCK, original-statement-first, real-data-first, geometry-first, proof and hostile-review gates.
- Respect all quarantine, privacy, source-exposure and publication boundaries.
- Do not infer an authenticated worker instance from a ring label or a run ID.
- Do not change scheduler IDs, phases, cadence, enabled state, or task count as part of ordinary upkeep.
- Do not open new recurring automations for work that can be incorporated into the existing relay.
- Do not create work merely to fill a queue. A valid result of upkeep is to leave the queue unchanged and explain why.
- Preserve breaks and lateral reading. Upkeep must not become an excuse for continuous task-chaining.

## 8. Initial deployment and adoption test

The live Steering Charter contains this protocol and the census-specific action; the four existing enabled relay prompts already require workers to read that charter before work. A direct prompt-text update was attempted but the Automations service rejected all four updates because the account plan allows only three scheduled tasks. No recurrence, ID, schedule, phase, or enabled state was changed. Until a prompt-edit route is available, the mandatory delivery route is the live Steering Charter plus active task-graph branch, both surfaced through the existing prompt's charter/current-work preflight. Each activation runs the lightweight scan; the rolling deep sweep is due every five completed activations.

Adoption is provisional until receipts show:
- at least one actual upkeep scan per activation;
- deeper review at the stated interval;
- concrete orphan repair or defensible no-change findings;
- improved delivery of requests and follow-ups;
- no protected-priority displacement or scheduler drift.

The first live test is the one-time clone-footprint census in issue #1315. Its previous failure was a delivery failure: an issue and log existed, but the request was not embedded in worker prompts, a live task branch, or an addressed handoff, and it had no coordinator follow-up checkpoint.
