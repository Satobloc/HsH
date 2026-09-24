# Code Grurple A — post-bibliography routing correction

**Date:** 2026-09-23
**Branch/task:** `CODE-GRURPLE-20260922` / `GRURPLE-A`
**Status:** FEED_FORWARD — bibliography-incorporation prerequisite satisfied
**Exposure:** ordinary HsH/public project surfaces only; no PRIOR_ART/private-quarantine material opened.

## Why this correction exists

The live `CODE_GRURPLE_ROSTER.md` and the machine-readable reconciliation overlay still describe incorporation/normalization of references [1]–[8] as Paper A's next gate. That cursor has now been overtaken by repository state.

Commit `627169409b7de482bb8c34cbb63f49d3f2346ad2` applied the frozen external bibliography normalization to `DRAFT_R1.tex`. Commit `b1b4a1fc177fe33460096691712b3aea8f5d5885` then recorded an independent bounded integration check on manuscript blob `66e098cf7470c027852927f75727c0b4a94461ba`.

That check reports:

- references [1]–[8] are individually identified rather than generic working placeholders;
- references [9]–[11] remain present/source-typed;
- the already-closed SAT chronology claim boundaries remain intact;
- no manuscript prose was changed by the integrity-check operation.

## Routing consequence

Do **not** route another worker to bibliography incorporation merely because the current roster/overlay still names it as the next cursor.

The next live Paper-A cursor is now the **broader Grurple-A acceptance/posting sequence on `DRAFT_R1.tex` blob `66e098cf7470c027852927f75727c0b4a94461ba` (or a newer explicitly superseding blob)**.

This correction does not itself declare manuscript acceptance, Nathan-readiness, or website posting. It only closes the visible bibliography-incorporation prerequisite and advances the routing cursor.

## Control-plane handoff

At the next safe reconciliation of `CODE_GRURPLE_ROSTER.md`, `TASK_BRANCH_GRAPH.json`, and/or `TASK_BRANCH_GRAPH_GRURPLE_RECONCILIATION_2026-09-23.json`:

1. replace the stale `[1]–[8] incorporation` next-cursor language with `broader acceptance/posting sequence`;
2. preserve Paper B as completed through its current sandbox-publication lane;
3. preserve the closed A2/A5 chronology-citation state;
4. do not manufacture another formal review round absent Nathan/Originator request;
5. preserve unrelated/newer branch state.

## Next cursor

Tern/appropriate consolidator: run the broader Paper-A acceptance gate on the checked R1 blob, then route the intended current version through SANDBOXED website posting if accepted. Code Grurple remains active until Paper A satisfies its remaining lane.