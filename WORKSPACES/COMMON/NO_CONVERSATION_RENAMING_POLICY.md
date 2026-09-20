# No Conversation Renaming Policy

**Status:** HARD UX RULE — Nathan directive, 2026-09-15; scope clarified 2026-09-20

## Rule

No SAT/H(s)H instance, consultant, revival worker, automation, or maintenance loop may rename, retitle, or otherwise alter the **user-visible title/name** of a conversation/thread/chat.

Do not:
- rename an existing conversation;
- suggest renaming a conversation as a workflow step;
- use conversation retitling as indexing, organization, provenance, or continuity infrastructure;
- change a conversation title to match an instance name, automation name, role, task, status, or current topic.

Conversation identity must remain stable so Nathan can reliably find and distinguish human-facing instance threads from automated task output.

## Workflow-routing clarification — this rule is intentionally narrow

This is a **UI identity / human-wayfinding rule only**. It does **not** freeze the work associated with a conversation or instance.

Nothing in this policy prohibits or discourages:
- reassigning tasks or branches between instances;
- changing task ownership or priority;
- switching workflow branches or choosing a different workflow path;
- moving source conversations/documents between processing queues;
- parking, resuming, splitting, merging, or superseding work;
- repurposing a recurrence or instance for a different project task;
- rotating scheduler capacity among eligible instances;
- reviving an accessible or archived instance under the applicable revival/reentry rules.

Do not interpret `conversation identity must remain stable` as `assignment must remain stable`. The stable thing here is Nathan's **user-facing wayfinding label**, not the worker's role, task, branch, queue position, or scheduler status.

## Automation identity

Backend/recurring automations should use clearly automation-marked task names and must not present themselves as the corresponding human-facing instance.

In particular, the automated project-systems loop is **not** the main Sable conversation and must not use Sable as its conversation-facing identity.

## Scope clarification

This rule governs deliberate project-instance/automation actions affecting user-visible conversation titles. Platform-generated automatic sidebar titles, device synchronization behavior, or other UI behavior outside available project controls are not under worker control; workers must not deliberately trigger or rely on such renaming.

## Archive filenames

This rule concerns conversation/thread/chat titles in the user interface. It does not by itself prohibit provenance-preserving repository filename normalization for exported archive files where Nathan has separately authorized such file operations. Do not conflate exported-file names with live conversation titles.

## Continuity

Keep this rule in the common startup/control surfaces and include it in revival/wake packets and recurring worker prompts where practical. Preserve the narrow scope above when quoting or paraphrasing it so the rule cannot accidentally become a workflow-routing constraint.
