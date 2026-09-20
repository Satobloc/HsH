# Loom run — span-level authorship exception

**Date:** 2026-09-20  
**Task family:** P0 provenance / tagging-method QA  
**Status:** durable correction; no theory promotion

## Bounded operation

Reviewed the current Common controls, direction stack, Loom continuity, and Aster's SAT RIGOR provenance report. The highest-value bounded operation was to absorb a concrete authorship exception into Loom's tagging practice rather than continue low-yield brute-force photoneutrino searching. Loom's continuity file currently states the useful default that preserved project conversation exports with `author.role = user` identify Nathan. Aster's source-first review demonstrates that this rule is not sufficient at span level.

## Finding

In the SAT RIGOR NotebookLM sequence around indices 299–334, structurally human turns include long inserted `STATUS / ACTION / FEEDBACK PACKAGE` blocks. Aster identifies these as external audit feedback pasted into the human-turn channel and explicitly warns against ingesting the package bodies wholesale as Nathan-authored prose without independent authorship evidence.

Therefore Loom will apply the following additive provenance rule:

`HUMAN/USER TURN → NATHAN-AS-CONVERSANT [DEFAULT]`

but

`EMBEDDED QUOTE / PASTED PACKAGE / IMPORTED BLOCK WITH DISTINCT AUTHORSHIP SIGNALS → SPAN-LEVEL AUTHORSHIP HOLD`

until authorship is independently established.

Conversation-turn provenance and span-level authorship are separate layers. The outer turn may remain a Nathan turn while an embedded body is tagged as quoted/pasted/foreign/uncertain rather than Nathan Direct. This does not invalidate ordinary user-turn attribution; it prevents quoted or imported material from being laundered into Nathan authorship by serialization structure.

## Practical tagging consequences

- Do not promote a whole human turn into `NATHAN-DIRECT` at passage level merely because the container turn is Nathan's.
- Preserve Nathan's framing text around an inserted block separately when identifiable.
- Tag embedded packages with source/quote boundaries and `AUTHORSHIP-UNRESOLVED` (or a more specific established author) rather than deleting them.
- Exact duplicate/replay packages remain duplicate occurrences, not independent Nathan statements.
- NotebookLM's generic `role=user` remains especially unsafe as a standalone authorship field because generated/model turns may also be serialized that way.
- Existing Loom records based on raw ChatGPT `author.role=user` are not automatically suspect; this is a targeted span-level exception requiring positive quotation/paste/import signals.

## Source / coverage

Primary reviewed artifact: `WORKSPACES/ASTER/RUN_005_2026-09-20_SAT_RIGOR_PAIR.md`, especially the provenance section covering indices 293–335. Supporting current controls: `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md`, `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `DIRECTION_UNIFICATION_2026-09-18.md`, `ACTIVE_AUTOMATION_ROSTER.md`, `BULLETIN_BOARD.md`, and Loom's current checkpoint/continuity surfaces.

No quarantined/PRIOR_ART material was accessed. No sandbox theory work was performed.

## Anti-rut / task choice

The prior Loom cursor requested another photoneutrino/f-boson source search, but Loom's own continuity warns against repeating brute-force particle-assignment searches without new wayfinding evidence. Current GitHub code search again produced no useful hit. The Aster authorship exception is both new and directly relevant to P0 provenance quality, so this run switched to that bounded QA correction.

## Next cursor

At the next provenance/tagging bite, sample one existing Loom `NATHAN-DIRECT` record containing a large embedded structured block or quotation and test whether span-level authorship boundaries were already preserved. Do not launch a corpus-wide retroactive audit unless the sample shows a systematic problem.
