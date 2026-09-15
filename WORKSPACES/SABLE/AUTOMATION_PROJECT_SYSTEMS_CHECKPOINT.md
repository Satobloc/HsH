# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Sable's human-facing continuity checkpoint remains Sable-owned semantic state.

## Current bounded operation — locate remaining named publication-regression publishers

This recurrence performed one bounded INFRA-QA diagnosis only: locate the two remaining publishers named by `WORKSPACES/COMMON/INFRASTRUCTURE_QA_ROTATION.md` before attempting any publish-semantics judgment or repair.

### Durable boundary reached

- The controlling INFRA-QA surface explicitly says the Cross podcast transcript index and GLASS full structural index were part of the 2026-09-15 generated-artifact publication regression class and were changed to the newer transaction rule.
- Direct listing of `Satobloc/HsH/.github/workflows` does not expose an obvious Cross transcript-index or GLASS structural-index workflow name.
- HsH code search for `cross-podcast`, `podcast`, `transcript_index`, and `structural index` returned no locator hit in the accessible default-branch search.
- Guessed HsH workflow paths `cross-podcast-transcript-index.yml` and `glass-full-structural-index.yml` returned 404 and are therefore not being treated as real paths.
- Guessed repositories `Satobloc/Cross` and `Satobloc/GLASS` were not resolvable through the current connector calls used here. This is a locator/access result only; it is not evidence that the repositories or publishers do not exist.
- No workflow semantics were inferred from the Common summary alone, and no repair was attempted.

### Current purpose / dependencies

The next step for this regression class is now a source-location problem, not a publication-semantics problem. Obtain the exact repository/path or commit that changed either named publisher, then inspect exactly one publisher in a later bounded recurrence.

No automation/cadence changes. No Q&A disposition changed. No prior-art content was accessed or exposed. No theory-bearing work was performed. No Nathan decision is required.

### One continuation cursor

Use repository/commit history around the 2026-09-15 generated-artifact transaction changes to recover the **exact Cross podcast transcript-index publisher repository/path**; stop once that locator is durable, without also auditing its semantics in the same recurrence.

## Prior finding — mixed navigation publisher

The mixed HsH navigation workflow now fails visibly on a rejected push rather than rebasing, merging, force-pushing, or replaying a stale mixed source/generated snapshot. This matches the active mixed-publisher race rule.

## Prior finding — archive-wide autotag generated-artifact publish safety

The archive-wide autotag/Nathan Direct publisher implements the newer generated-artifact transaction rule: concurrency group; validated generated snapshot; fetch/hard-reset to current `origin/main`; declared generated scope only; revalidation; non-force push; discard/retry after race; visible failure after bounded retries.

## Inventory provenance handoff remains open

Current published tooling/output inspected by this automation identifies as `sable-source-inventory/0.2.1`; the earlier human-facing continuity claim of a published `0.3.0` / `input_refs.json` state remains unsubstantiated by current-main evidence inspected here. Do not overwrite the human-facing continuity checkpoint from this backend loop; route this as worker-local handoff under `SHARED_STATE_WRITE_SAFETY.md`.

A reusable consistency check should compare atomically:

`sampler TOOL_VERSION -> workflow expected filenames -> published summary/run manifest -> continuity/Dashboard claim`

and include source commit triplet + inventory hash so ordinary source growth is not misdiagnosed as pipeline drift.

## Control / safety state

`AUTOMATION_WORKFLOW_CONTROL.md` requires `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md` before write-capable script/workflow publication. Shared semantic state uses fresh-read/current-SHA semantics; generated state uses deterministic rebuild plus current-main publication discipline. This automation re-fetched this worker-local checkpoint immediately before this update and used the returned current blob SHA.
