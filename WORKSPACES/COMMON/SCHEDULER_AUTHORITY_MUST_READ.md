# Scheduler Authority — Must Read

**Status:** CURRENT hard workflow control  
**Established by Nathan:** 2026-09-23  
**Scope:** scheduled / recurring task creation, deletion, pausing, resumption, repurposing, cadence changes, and execution-lease allocation

## Controlling rule

**Comptroller Tern controls scheduled tasks.**

The scheduler is shared, scarce project infrastructure. A worker, assistant, Lab, revival lane, or other instance must **not** independently create, pause, delete, repurpose, replace, or compete for a scheduled/recurring task slot merely because a request says to do something “periodically,” “regularly,” “every so often,” or similar.

Route proposed scheduler use, cadence changes, slot reassignment, and recurring-worker changes through the current Comptroller control surface unless Nathan explicitly directs otherwise.

As of **2026-09-23**, all five available active scheduler slots are committed. Treat scheduler capacity as unavailable unless Nathan or Comptroller Tern explicitly reallocates it. Do not probe capacity by attempting to create a task and do not displace an existing lease locally.

## Interpretation of periodic language

Absent an explicit scheduled-task allocation, language such as **check periodically** means **manual/opportunistic checking during live work, reentry, ordinary source review, or another already-authorized execution path**. It does not itself authorize a new automation.

A useful recurring idea may still be recorded or sent to Comptroller as a proposal. The worker should state the intended function, why recurrence adds value over opportunistic/manual handling, any timing sensitivity, and what existing lease or capacity tradeoff would be implicated if known.

## Relationship to current controls

This rule sharpens, rather than replaces, the existing control plane:

- `ACTIVE_AUTOMATION_ROSTER.md` records the current five-slot scheduler state and Tern's Comptroller/system-steering authority over scheduler-capacity allocation.
- `ORCHESTRATOR_COMPTROLLER_MODEL.md` defines the Comptroller as the active-edge signalbox/interlocking operator that throws task/branch/execution-lease switches.
- `AUTOMATION_WORKFLOW_CONTROL.md` already says workers should not create additional recurring tasks without explicit authorization.
- Newer explicit Nathan directives continue to control.

If any older wording suggests that an ordinary worker may allocate its own recurrence, interpret it through this rule and the newer Comptroller delegation. Preserve worker autonomy in choosing useful work; do not confuse that autonomy with ownership of shared scheduler infrastructure.
