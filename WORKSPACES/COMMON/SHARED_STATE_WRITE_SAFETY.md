# Shared-State Write Safety

**Owner:** Sable systems / infrastructure QA  
**Status:** ACTIVE  
**Established:** 2026-09-15 after repository history audit

## Evidence basis

A retrospective audit of 1,503 commits found no evidence of actual silent overwrites. Commit pairs within a two-minute window overwhelmingly showed serialized stage/run/cleanup or immediate correction patterns rather than independent writers racing on the same content.

The risk is therefore **concentrated rather than general**: frequently modified semantic shared-state files deserve stronger write discipline even though historical coordination has held.

## Risk classes

### Regenerable generated state
Examples: structural indices, chronology/manifests, Conversation Viewer catalog.

Preferred protection:
- deterministic rebuild from current `main`;
- fetch/rebase/reset before publish;
- non-destructive push retry;
- checksums/manifests/regression tests;
- tolerate regeneration instead of manual merge where safe.

### Shared semantic state
Examples: central checkpoints, synthesis/control rollups, coordination/status summaries.

Preferred protection:
- re-fetch immediately before modifying;
- never construct a full replacement from stale cached content;
- use compare-and-swap/current-blob-SHA semantics where available;
- if the file changed after read, reconcile explicitly rather than overwrite;
- prefer append/merge semantics or generated aggregation when practical;
- reduce the number of independent writers.

### Per-worker checkpoints
Examples: `WORKSPACES/<worker>/TRIAL_CHECKPOINT.md` and similar.

Preferred protection:
- one primary owner/writer per checkpoint;
- other workers hand off/propose rather than rewrite the checkpoint directly;
- Sable may repair/reassign ownership only with durable handoff;
- re-fetch before every direct update.

## Current-path observations

- `indexes/*`, chronology/manifests, and Viewer generated data are high-churn but mostly regenerable; race protection should live in the automation/publish pattern.
- `checkpoints/CURRENT.md` has historically been meaningful shared state and should not be treated as a casual scratch file.
- `synthesis/CURRENT_SYNTHESIS.md` is currently quarantined/non-controlling after the 2026-09-13 integration halt; its historical write frequency should not be mistaken for a current active shared-state mandate.
- per-worker checkpoints remain active semantic continuity surfaces and should be owner-local.

## Access-path notes

The GitHub Contents API requires the current blob SHA for replacement updates. This acts as a compare-and-swap guard: a stale SHA should fail rather than silently replacing a newer version. This is preferred for direct semantic-file updates.

Git checkout/commit/push paths must explicitly fetch/rebase/reset against current `main` before publishing. One-shot GitHub Actions used as compute shims have historically included this behavior in the better-behaved cases; preserve that pattern.

## Central-state design direction

Where multiple workers need to contribute to one project-wide state surface, prefer:

`worker-local checkpoint / handoff -> aggregator -> central generated/read-only rollup`

rather than multiple workers hand-editing the same central file.

Central state should increasingly be a view over worker-owned state, not a shared mutable notebook.

## QA tripwires

Infrastructure QA should periodically check:
- files with rising writer count or modification frequency;
- direct whole-file replacement of semantic state;
- writes made without a fresh source SHA/ref;
- CI jobs that push without fetch/rebase/reset;
- repeated conflict/retry failures;
- central files receiving edits from multiple autonomous lanes;
- generated files whose source coverage changed but output did not.

A detected risk is not evidence of corruption; record the exact write path and failure mode before intervening.
