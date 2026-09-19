# STANDING RULE — Assigned Report Filing + Instance Stamp

**Date established:** 2026-09-18  
**Authority:** Nathan-direct  
**Status:** ACTIVE / standing project-wide rule

## Core rule

Any report that is explicitly assigned to an instance, lane, worker, consultant, or coordinator must be **filed as a durable artifact in an accessible repository location** when completed.

A report is not considered fully delivered if it exists only in:

- a live ChatGPT conversation;
- an ephemeral handoff message;
- an automation response;
- an instance-local scratchpad;
- an unlinked temporary artifact;
- or a self-report saying that the report was completed.

The completed report must be recoverable later without needing the original live conversation.

## Instance stamp required

Every assigned report must carry an explicit **instance stamp** near the top of the filed artifact.

Minimum stamp fields:

- **Instance:** named instance / worker / lane that produced the report;
- **Role:** current role or assignment lane;
- **Report date:** date of the report;
- **Assignment:** short description of the assignment or pointer to the assigning control file/message;
- **Status:** COMPLETE / PARTIAL / BLOCKED / SUPERSEDED / other explicit state;
- **Native conversation ID:** where known and relevant;
- **Source scope:** major repositories/corpora/control surfaces actually inspected;
- **Filed path:** canonical repository path for the report;
- **Commit/checkpoint:** commit SHA or equivalent durable checkpoint once known.

Optional but useful:

- predecessor/derived-from instance;
- automation/task ID;
- reporting window;
- source cut-off date;
- known limitations;
- supersedes / superseded-by pointers.

The stamp identifies **who actually produced the report and from what operational context**. It is not an authorship claim about underlying source material quoted or summarized inside the report.

## Accessible filing location

Prefer a location appropriate to the report's scope:

- instance-specific report -> that instance's `WORKSPACES/<INSTANCE>/` area;
- project-wide / cross-instance report -> `WORKSPACES/COMMON/` or the current coordinator's durable reporting area;
- private-source report -> private repo/location where source restrictions require it, with a safe pointer from public coordination surfaces where appropriate.

Avoid burying completed assigned reports in arbitrary source folders, raw conversation directories, temporary processing outputs, or opaque generated-data trees unless there is also a clear human-facing pointer.

## Discoverability requirement

When a report is filed, leave a short pointer in the relevant current coordination/handoff surface so another instance can find it without guessing the filename.

At minimum the pointer should identify:

- report title;
- producing instance;
- filed path;
- date/status;
- commit/checkpoint where practical.

For one-time assignments, the assignment file should be updated or otherwise clearly linked to the completed report when practical.

## Completion semantics

Use these distinctions:

- **ASSIGNED** — report requested, no verified filed artifact yet;
- **IN PROGRESS** — work underway, no completed report yet;
- **FILED / COMPLETE** — durable report exists, instance-stamped, accessible, and linked from coordination;
- **FILED / PARTIAL** — durable partial report exists with explicit remaining gaps;
- **BLOCKED** — cannot complete for stated reason;
- **SUPERSEDED** — later report replaces it, with bidirectional pointers where practical.

Do not mark an assigned report `COMPLETE` merely because an instance says it completed the work. Verify the filed artifact.

## Existing-report cleanup

When older one-time reports are discovered only in conversations or obscure locations:

1. preserve the original;
2. file or index a durable accessible copy/pointer where appropriate;
3. add an instance stamp if the producing instance can be identified without guessing;
4. mark uncertain identity/provenance explicitly rather than inventing it;
5. link the recovered report back to its assignment/control surface.

## Standing audit rule

Whenever the project checks outstanding assignments, include a filing audit:

> **Was the assigned report actually filed, instance-stamped, and made discoverable?**

If not, the assignment remains administratively open even if substantive work may have occurred.

## Naming guidance

Prefer human-readable filenames containing the subject and date, for example:

`INSTANCE_ENRICHMENT_STATE_2026-09-18.md`

The filename need not contain the instance name if the instance stamp and containing workspace already make that unambiguous.

## Rationale

The project now contains many instances, recurring workers, historical revivals, handoffs, and one-time audits. Without durable filing and instance stamps, useful reports can become conversation-local, provenance can blur, and later coordinators cannot distinguish a completed report from a merely assigned or self-reported one.

This rule is therefore project-wide and standing until Nathan changes it.
