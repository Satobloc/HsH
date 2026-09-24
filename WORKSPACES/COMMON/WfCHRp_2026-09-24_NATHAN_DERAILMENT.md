# WfCHRp — Workflow Conversational Hazard Report

**Pronounced:** `wiff-chirp`
**Date:** 2026-09-24
**Hazard:** Nathan derailment / conversational drift obscuring active work continuity
**Severity:** LOW / normal operating condition

## Hazard

Nathan may conversationally derail an active work thread into an interesting, useful, funny, personal, historical, or apparently unrelated direction. This is expected behavior and not itself a problem.

The hazard occurs when the worker follows the conversational branch and silently loses, forgets, or appears to abandon an already-active job without making its state visible.

## Standing rule

If a worker has an active job and conversation wanders:

1. **Keep doing the job within the same interaction whenever practical**, while also engaging the conversation.
2. If the work is intentionally paused, blocked, deferred, or displaced, **say so briefly and visibly** rather than letting it disappear.
3. If the user does not need operational detail, a tiny status line is sufficient.
4. Conversation itself does not automatically cancel, reprioritize, or complete active work.
5. A genuinely better/new directive may supersede the old job, but make that transition legible.
6. Do not scold Nathan for derailment; design around it.

Important implementation note: workers cannot claim invisible/background work that is not actually executing. `Keep doing the job while we talk` means continue performing available work in the current turn and/or through an explicitly live recurrence, not pretending asynchronous work exists.

## Ambient status line

Preferred minimal form:

`— <worker> <state> <time/range if useful>`

Examples:

`— Tern Rook ⚙️ working`

`— Tern Rook 🥱 17:00–?`

`— Sable 🌲 archive walk`

`— Meridian ⏸ paused: waiting on source`

The symbols are human-readable ambient cues, not a rigid taxonomy. Workers may choose natural equivalents. Do not turn this into clerical overhead.

## Why this exists

The project's conversational style is generative. Tangents can produce useful concepts, personal provenance, methodological rules, jokes, names, analogies, and unexpected research directions. The goal is therefore **not to suppress derailment**. The goal is to prevent interesting conversation from making ongoing work state invisible.

## Repair behavior

When a worker notices it has been conversationally carried away:

- recover the active cursor;
- continue the promised operation if still appropriate;
- or state what changed and why;
- leave a durable cursor when the task matters;
- optionally emit a tiny status line.

No blame packet is needed. A WfCHRp is a design signal, not a disciplinary report.

## Exit / standing status

This WfCHRp establishes a standing operating rule rather than a one-time defect closure. It can be considered mitigated when active workers reliably expose work/pause state during conversational drift without making the conversation feel bureaucratic.
