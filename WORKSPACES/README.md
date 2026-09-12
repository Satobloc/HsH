# H(s)H Workspaces

`WORKSPACES/` is the noncanonical working layer for focused agents, experiments, reconstruction passes, audits-in-progress, and other substantial tasks that need room to develop before their results are promoted into the repository's durable layers.

A workspace is a workbench, not an authority source. It may contain unfinished reasoning, competing approaches, temporary notation, negative results, or abandoned branches. Source authority remains with the original project records and external sources; current theory status remains with the appropriate synthesis/ledger/checkpoint surfaces.

## Recommended workspace pattern

A sustained workspace may use whichever files its job requires, but these names are preferred when useful:

- `README.md` — scope, role, boundaries, and current objective.
- `TODO.md` — actionable queue.
- `RECORD.md` — concise chronological work log and decisions.
- `SOURCES.md` — source inputs and exact provenance pointers.
- `CROSSWALK.md` — links between workspace results and source/current destinations.

Do not manufacture empty files merely to satisfy the pattern.

## Common coordination area

`WORKSPACES/COMMON/` is the shared coordination surface for work that crosses individual workspaces or agents. It is for concise handoffs, blockers, shared questions, notices of useful discoveries, and coordination state. It should not become a second synthesis or a miscellaneous dump.

Use:

- `WORKSPACES/COMMON/COORDINATION.md` for active shared state and questions.
- `WORKSPACES/COMMON/HANDOFFS.md` for concise handoffs between workers/workspaces.

When an item becomes durable, move or restate the result in the proper repository layer and leave only a pointer in the common area.

## Repository-boundary rule

Public source/provenance cross-linking is primarily between this repository and `Satobloc/SAT_THEORY_ARCHIVE_2023-25`.

`Satobloc/HSH_RESOURCES` is private and reference-only. Do not make a public workspace depend on a private HSH_RESOURCES GitHub link. When external material found there matters, use the original bibliographic identifier/source and Chicago-style citation, or carry forward an attributed quotation/extract or summary/paraphrase with sufficient provenance. Internal/private research may retain the exact resource path/hash separately for retrieval.

The historical archive has its own archive-side common surface at `.[⚙️_AI_FILES]/SHARED_RESOURCES/`; this `WORKSPACES/COMMON/` area is the current H(s)H build-side coordination surface.
