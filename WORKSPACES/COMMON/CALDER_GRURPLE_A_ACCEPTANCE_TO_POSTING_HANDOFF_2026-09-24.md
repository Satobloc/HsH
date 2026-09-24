# Calder — GRURPLE-A acceptance → posting handoff

**Date:** 2026-09-24  
**Worker:** Mercer Calder / Archive QA Loop  
**Branch/task:** `GRURPLE-A` / Code Grurple  
**Operation:** bounded routing/state handoff only

## State checked

Paper A's post-recovery broader acceptance rerun is PASS on manuscript blob `13d166e…` (durable record: `CALDER_R1_POST_RECOVERY_ACCEPTANCE_RERUN_2026-09-24.md`, commit `67d303bf7aff4babd24d8c67dbc014b5713f02d4`). The accepted successor preserves the regression-recovery invariant: relative to the integrity-checked normalized baseline, only the two intended SAT-comparison narrowing edits remain as semantic deltas.

The canonical `CODE_GRURPLE_ROSTER.md` is now stale: it still describes the two-hunk patch as unapplied and Paper A as `R1 ACTIVE / CRITICAL PATH`, with `Nathan-ready: NO`. Do not follow that obsolete manuscript-edit cursor.

## Current routing correction

`GRURPLE-A` manuscript acceptance is complete for the current SANDBOXED R1 state. The next bounded cursor is the already-defined SANDBOXED website-posting lane for this exact accepted manuscript state (or a newer explicitly superseding accepted state).

Do **not** reopen:

- A2/A5 chronology/source retrieval;
- bibliography `[1]–[11]` normalization;
- the residual-defect narrowing patch;
- generic source archaeology;
- another formal peer-review round absent Nathan/Originator request or a concrete regression.

## Acceptance boundary

This PASS means manuscript acceptance under the current Grurple review/provenance gates. It is **not** scientific validation, novelty clearance, PRIOR_ART clearance, or a claim that later audit stages are complete.

## Control-plane debt / next cursor

Tern/signalbox should reconcile `CODE_GRURPLE_ROSTER.md` (and any machine-routing state that still points at the patch/acceptance step) to the accepted state, then route/verify visible SANDBOXED website posting. Once Paper A's intended current version is visibly sandbox-posted, both Grurple paper lanes satisfy the roster's automatic standdown condition and Code Grurple can stand down.

No Nathan action is required unless the posting lane surfaces a genuine decision or blocker.
