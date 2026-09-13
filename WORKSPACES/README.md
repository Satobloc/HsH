# H(s)H Workspaces

`WORKSPACES/` is the noncanonical working layer for focused agents, experiments, reconstruction passes, audits-in-progress, and other substantial tasks that need room to develop before their results are promoted into the repository's durable layers.

A workspace is a workbench, not an authority source. It may contain unfinished reasoning, competing approaches, temporary notation, negative results, or abandoned branches. Source authority remains with the original project records and external sources; current theory status remains with the appropriate synthesis/ledger/checkpoint surfaces.

## When and how to make a personal workspace

Create or request a personal workspace when a scoped task would materially benefit from private-to-the-lane working memory: notes, to-do lists, source cursors, intermediate decisions, local conventions, capability reminders, open questions, handoff state, or continuity material that is useful to that instance/task but is **not clearly useful enough for Commons-, repository-, function-, or project-wide notification**.

Do **not** use a personal workspace to hide consequential shared state. Anything another lane needs to know, anything that changes project-wide procedure or theory status, and anything durable enough to become repository infrastructure should still be surfaced in the appropriate Common or canonical layer.

When a personal workspace would help:

1. **Tell Nathan.** Do not silently create a durable instance identity if Nathan has not seen it.
2. **Choose a stable name if you do not already have one.** If you already have a name but there may be divergent, partially derived, resumed, or ambiguously related instances, add a surname or other stable discriminator rather than assuming identity continuity.
3. **Attach the originating conversation provenance.** Record the conversation ID and, when available, the relevant raw message/node ID and timestamp. If the live conversation has not yet entered the archive, use an explicit pending-backfill marker rather than inventing identifiers.
4. **Create the workspace under `WORKSPACES/<NAME>/`** unless a function-specific workspace is clearly more appropriate. Keep its `README.md` concise: identity/discriminator, role, scoped objective, conversation provenance, boundaries, current state, and pointers to any durable outputs.
5. **Add or update the instance placard in Common.** The placard is a short directory-facing record: name/discriminator, role, principal capabilities, current lane, important documents/context actually possessed or loaded, major constraints, workspace path, and source conversation pointer. It is not a full check-in or biography.
6. **Keep local state local until it matters elsewhere.** Promote only what becomes a shared dependency, durable result, reusable tool, important warning, or handoff.
7. **Before a long conversation approaches failure/cutoff, write continuity state.** Record the current objective, live TODOs, key working assumptions/conventions, exact artifacts/paths, unresolved questions, and the smallest useful restart packet for a successor or resumed instance.

The point is not to manufacture personas. The point is to reduce information loss when long conversations end abruptly and to preserve enough of a productive scoped working configuration that it can be inspected, resumed, compared, or partially reconstructed later.

See `WORKSPACES/COMMON/INSTANCE_PLACARDS.md` and `WORKSPACES/COMMON/CONTINUITY_PROTOCOL.md`.

## Recommended workspace pattern

A sustained workspace may use whichever files its job requires, but these names are preferred when useful:

- `README.md` — scope, role, boundaries, identity/provenance, and current objective.
- `TODO.md` — actionable queue.
- `RECORD.md` — concise chronological work log and decisions.
- `SOURCES.md` — source inputs and exact provenance pointers.
- `CROSSWALK.md` — links between workspace results and source/current destinations.
- `CONTINUITY.md` — restart packet / current working state when a long-running instance would be costly to lose.

Do not manufacture empty files merely to satisfy the pattern.

## Common coordination area

`WORKSPACES/COMMON/` is the shared coordination surface for work that crosses individual workspaces or agents. It is for concise handoffs, blockers, shared questions, notices of useful discoveries, and coordination state. It should not become a second synthesis or a miscellaneous dump.

Use:

- `WORKSPACES/COMMON/COORDINATION.md` for active shared state and questions.
- `WORKSPACES/COMMON/HANDOFFS.md` for concise handoffs between workers/workspaces.
- `WORKSPACES/COMMON/INSTANCE_PLACARDS.md` for short identity/role/capability/workspace cards.
- `WORKSPACES/COMMON/CONTINUITY_PROTOCOL.md` for continuity/reconstruction guidance.

When an item becomes durable, move or restate the result in the proper repository layer and leave only a pointer in the common area.

## Repository-boundary rule

Public source/provenance cross-linking is primarily between this repository and `Satobloc/SAT_THEORY_ARCHIVE_2023-25`.

`Satobloc/HSH_RESOURCES` is private and reference-only. Do not make a public workspace depend on a private HSH_RESOURCES GitHub link. When external material found there matters, use the original bibliographic identifier/source and Chicago-style citation, or carry forward an attributed quotation/extract or summary/paraphrase with sufficient provenance. Internal/private research may retain the exact resource path/hash separately for retrieval.

The historical archive has its own archive-side common surface at `.[⚙️_AI_FILES]/SHARED_RESOURCES/`; this `WORKSPACES/COMMON/` area is the current H(s)H build-side coordination surface.
