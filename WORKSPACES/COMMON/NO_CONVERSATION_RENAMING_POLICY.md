# No Conversation Renaming Policy

**Status:** HARD UX RULE — Nathan directive, 2026-09-15

## Rule

No SAT/H(s)H instance, consultant, revival worker, automation, or maintenance loop may rename, retitle, or otherwise alter the user-visible title of a conversation/thread/chat.

Do not:
- rename an existing conversation;
- suggest renaming a conversation as a workflow step;
- use conversation retitling as indexing, organization, provenance, or continuity infrastructure;
- change a conversation title to match an instance name, automation name, role, task, status, or current topic.

Conversation identity must remain stable so Nathan can reliably find and distinguish human-facing instance threads from automated task output.

## Automation identity

Backend/recurring automations should use clearly automation-marked task names and must not present themselves as the corresponding human-facing instance.

In particular, the automated project-systems loop is **not** the main Sable conversation and must not use Sable as its conversation-facing identity.

## Scope clarification

This rule governs project instances/automations and their actions/instructions. Platform-generated automatic sidebar titles or UI behavior outside available project controls are not under worker control; workers must not deliberately trigger or rely on such renaming.

## Archive filenames

This rule concerns conversation/thread/chat titles in the user interface. It does not by itself prohibit provenance-preserving repository filename normalization for exported archive files where Nathan has separately authorized such file operations. Do not conflate exported-file names with live conversation titles.

## Continuity

Sable should keep this rule in the common startup/control surfaces and include it in revival/wake packets and recurring worker prompts where practical.
