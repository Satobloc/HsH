# Scheduler Authority — Must Read

**Status:** CURRENT hard workflow control  
**Established by Nathan:** 2026-09-23  
**Scope:** scheduled / recurring task creation, deletion, pausing, resumption, repurposing, cadence changes, and execution-lease allocation

## Controlling rule

**Comptroller Tern controls scheduled tasks and execution-time allocation.**

The scheduler is shared, scarce project infrastructure. A worker, assistant, Lab, revival lane, or other instance must **not** independently create, pause, delete, repurpose, replace, or compete for a scheduled/recurring task slot merely because a request says to do something “periodically,” “regularly,” “every so often,” or similar.

Workers **may request scheduled execution time or make a case for prioritization**. Route those requests through the current Comptroller control surface. Tern decides whether, when, and through which execution lease the requested work should receive time unless Nathan explicitly directs otherwise.

As of **2026-09-23**, all five available active scheduler slots are committed. This does **not** mean all useful new requests are blocked: the normal model is that Tern allocates work across the existing hourly execution leases according to current workflow value. Do not probe capacity by attempting to create a task and do not displace an existing lease locally.

## Default scheduled-worker model

Unless Nathan and Tern deliberately establish a different model for a particular recurrence, scheduled tasks run **hourly** and act as **generalist execution leases**, not permanently fixed single-purpose jobs.

At each recurrence, the worker should:

1. reread the current workflow, active edge, directives, blockers, handoffs, and overall project state relevant to the run;
2. assess the highest-value safe bounded operation it can perform at that time, using its historical strengths as biases rather than jurisdictional limits;
3. perform a useful bounded quantum when possible;
4. leave durable state / continuity / next cursor sufficient for later routing.

A request to Tern therefore normally asks for **some share of existing execution attention when the work becomes comparatively valuable**, not necessarily a dedicated scheduler slot or permanent recurrence identity.

Workers may remind Tern of a request or make a stronger prioritization case when a **real need, material blocker, or credible workflow-productivity boon** emerges. Do not create routine pressure or repeated escalation merely to keep a request visible.

## Interpretation of periodic language

Absent an explicit scheduled-task allocation, language such as **check periodically** means **manual/opportunistic checking during live work, reentry, ordinary source review, or another already-authorized execution path**. It does not itself authorize a new automation.

A useful recurring idea may still be recorded or sent to Comptroller as a proposal. The worker should state the intended function, why recurrence or periodic execution adds value over opportunistic/manual handling, any timing sensitivity, and what workflow benefit or tradeoff is expected.

## Relationship to current controls

This rule sharpens, rather than replaces, the existing control plane:

- `ACTIVE_AUTOMATION_ROSTER.md` records the current five-slot scheduler state and Tern's Comptroller/system-steering authority over scheduler-capacity allocation.
- `ORCHESTRATOR_COMPTROLLER_MODEL.md` defines the Comptroller as the active-edge signalbox/interlocking operator that throws task/branch/execution-lease switches.
- `AUTOMATION_WORKFLOW_CONTROL.md` already says workers should not create additional recurring tasks without explicit authorization.
- Newer explicit Nathan directives continue to control.

If any older wording suggests that an ordinary worker may allocate its own recurrence, interpret it through this rule and the newer Comptroller delegation. Preserve worker autonomy in choosing useful work; do not confuse that autonomy with ownership of shared scheduler infrastructure.
