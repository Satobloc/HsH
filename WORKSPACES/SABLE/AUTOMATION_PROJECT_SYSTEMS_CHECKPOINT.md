# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Sable's human-facing continuity checkpoint remains Sable-owned semantic state.

## Current run finding — generated-artifact publish safety has converged

Direct inspection of `WORKSPACES/COMMON/INFRASTRUCTURE_QA_ROTATION.md` and `.github/workflows/layered-nathan-autotag.yml` shows that the archive-wide autotag/Nathan Direct publisher now implements the newer generated-artifact transaction rule rather than the older rebase-generated-output pattern.

The current workflow:
- uses a concurrency group;
- preserves a validated generated snapshot;
- fetches and hard-resets to current `origin/main` before each publish attempt;
- re-lays only the declared generated `indexes/autotag` and `indexes/nathan-direct` scope;
- revalidates the durable manifests/indexes;
- commits and pushes without force;
- on a push race, discards the generated commit and retries from latest main rather than rebasing/merging generated artifacts;
- exits nonzero after bounded failed publication attempts.

This resolves the specific publish-transaction mismatch previously visible in the September 15 autotag workflow. It does **not** by itself establish full source -> Viewer -> autotag -> Nathan Direct -> Stage-2 convergence; that remains a separate eventual-convergence QA question.

## Inventory provenance handoff remains open

The current private inventory remains a live, source-commit-bound observation rather than a stable project total. Current published tooling/output inspected by this automation still identifies as `sable-source-inventory/0.2.1`; the earlier human-facing continuity claim of a published `0.3.0` / `input_refs.json` state remains unsubstantiated by current-main evidence inspected here. Do not overwrite the human-facing continuity checkpoint from this backend loop; route this as worker-local handoff under `SHARED_STATE_WRITE_SAFETY.md`.

A reusable consistency check should compare atomically:

`sampler TOOL_VERSION -> workflow expected filenames -> published summary/run manifest -> continuity/Dashboard claim`

and include source commit triplet + inventory hash so ordinary source growth is not misdiagnosed as pipeline drift.

## Control / safety state

`AUTOMATION_WORKFLOW_CONTROL.md` requires `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md` before write-capable script/workflow publication. Shared semantic state uses fresh-read/current-SHA semantics; generated state uses deterministic rebuild plus current-main publication discipline. This automation re-fetched this worker-local checkpoint immediately before this update and used the returned current blob SHA.

No PRIOR_ART content was opened, listed, hashed, sampled, indexed, or exposed. No theory-bearing work was promoted. No Q&A/prior-art disposition changed. No Nathan decision is required.

## Next high-information operations

1. Inspect the other publishers named in the current INFRA-QA regression class (Cross podcast transcript index, GLASS structural indexing, mixed HsH navigation) and confirm their actual current publish semantics rather than relying on the control-surface statement.
2. Inspect workflow-run artifacts/logs or non-main refs for the unsupported inventory `0.3.0` identifiers before deciding whether that state was transient/unpublished versus subsequently replaced.
3. Implement or propose the reusable inventory-state consistency check above as generated QA output.
4. Resume full source -> Viewer -> autotag -> Nathan Direct -> Stage-2 identity/count/hash convergence QA.
