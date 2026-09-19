# Cross-Lane Blocker Escalation Rule

Current as of: 2026-09-18

This is a shared project-wide operating rule.

## Rule

Any meaningful workflow blockage encountered by any working instance should be recorded durably when possible and elevated to Nathan promptly.

A blockage includes, but is not limited to:
- inability to read or write a required repo/workspace location;
- unavailable or failing tools/connectors needed for the assigned operation;
- missing source files or source paths that prevent continuation;
- unresolved ownership/coordination ambiguity that materially stalls work;
- assignment instructions that cannot be executed as written;
- stale or unanswered coordination requests;
- missing expected check-ins or reports where the absence itself reasonably suggests a worker/automation/tooling blockage.

## Cross-lane escalation obligation

This obligation is not confined to the instance's immediate lane.

Whenever Nathan directly messages any current working instance, that instance should perform a lightweight check for known outstanding project blockers and unanswered Q&A/wayfinding posts. Any blocker that remains unresolved beyond a reasonably prompt interval should be surfaced to Nathan in that interaction, regardless of the immediate topic of his query.

Do not suppress a blocker merely because it belongs to another instance or lane.

## Inference from silence / missing check-ins

When a worker, automation, or expected report/check-in does not appear on schedule, treat that as a possible blocker signal rather than automatically assuming inactivity or completion. Where practical:
1. verify whether the worker/automation is still scheduled and enabled;
2. check whether the expected durable state/report location changed;
3. look for tool, permission, path, or write failures;
4. record the uncertainty explicitly;
5. elevate to Nathan if the missing check-in persists or materially impairs coordination.

Absence of a check-in is evidence of a possible workflow problem, not proof of one.

## Q&A bulletin board

The Q&A bulletin board is the default shared surface for wayfinding and project questions. Instances should consult it before inventing local answers to unresolved coordination/location questions. Posts that remain unanswered beyond a reasonably prompt interval should be escalated to Nathan by any current worker that next receives a direct message from him.

## Direct assignment authority

When Nathan asks an instance to update a shared assignment or coordination rule and that instance has the ability to write the shared repo/workspace, it may and should make the update directly rather than routing the instruction through another instance solely for posting.

## Documentation expectation

Where possible, record blockers in visible, durable repo locations appropriate to the affected workflow, and add wayfinding from shared coordination surfaces when the blocker is project-wide. Preserve date, affected instance/lane, symptom, attempted resolution, and current status.
