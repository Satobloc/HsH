# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Sable's human-facing continuity checkpoint remains Sable-owned semantic state.

## Current run finding — inventory drift is live and provenance mismatch remains

Current direct repository inspection shows `Satobloc/HSH_RESOURCES/SOURCE_INVENTORY/SABLE/source_inventory_run/summary.json` has advanced again. It now reports:

- tool `sable-source-inventory/0.2.1`;
- 8,728 permitted files;
- 706 sampled files;
- inventory SHA-256 `ee75d9f7f537c123ca803edb4cbfe651b433b8b603f340cc89642c69eafe80eb`;
- repository counts: GLASS 4,499 / HSH 1,364 / RESOURCES 2,865;
- source commits: GLASS `d53b5fe72699deacf0b9e91c9c5f214136d90a24`, HSH `67a502ece48fd8c9e44dbe3cf81e849982653f98`, RESOURCES `d6b55bc60bbc8ccfc79c0302320c3601cb9ae2c8`;
- one PRIOR_ART root pruned before descent.

The changing file count is therefore normal live inventory movement and should not itself be treated as inconsistency. The unresolved provenance issue is narrower: current published tooling/output still identifies as `0.2.1` with `run_manifest.json`, while the human-facing continuity checkpoint previously recorded a `0.3.0` / `input_refs.json` state as confirmed. No current-main evidence inspected by this automation substantiates that claimed publication state.

## QA disposition

Do not overwrite Sable's human-facing continuity checkpoint from this backend loop. Route the mismatch as a worker-local handoff under `SHARED_STATE_WRITE_SAFETY.md`. Treat counts as time-dependent observations tied to source commit triplets and inventory hash, not as stable project totals.

A reusable consistency check should compare four things atomically:

`sampler TOOL_VERSION -> workflow expected filenames -> published summary/run manifest -> continuity/Dashboard claim`

and should include source commit triplet + inventory hash so ordinary source growth is not misdiagnosed as pipeline drift.

## Control / safety state

`AUTOMATION_WORKFLOW_CONTROL.md` currently requires `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md` before write-capable script/workflow publication. Shared semantic state uses fresh-read/current-SHA semantics; generated state uses deterministic rebuild plus fetch/rebase/non-force publication. This automation followed the worker-local checkpoint model and re-fetched this file immediately before this write.

No PRIOR_ART content was opened, listed, hashed, sampled, indexed, or exposed. No theory-bearing work was promoted. No Q&A/prior-art disposition changed. No Nathan decision is required.

## Next high-information operations

1. Inspect workflow-run artifacts/logs or non-main refs for the exact unsupported `0.3.0` identifiers before deciding whether the claim was transient/unpublished versus subsequently replaced.
2. Implement or propose the reusable inventory-state consistency check above, preferably as generated QA output rather than another shared semantic writer.
3. Resume broader source -> Viewer -> autotag -> Nathan Direct -> Stage-2 convergence QA after inventory provenance is either reconciled or explicitly annotated by the human-facing continuity owner.
