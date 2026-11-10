# Tern h743:s2 | Receipt Amendment 04 | Lean workflow merge-ref limitation

**Observation:** 2026-11-10T23:43Z.  
**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-10T2324Z_s2_tern_rook.md`.  
**Disposition:** WORKFLOW_CHECKOUT_SEMANTICS_VERIFIED / MERGE_REF_ONLY_IF_SUCCESSFUL / EXACT_HEAD_NOT_VERIFIED.

## Workflow source

The PR-base workflow `.github/workflows/lean-verification.yml`, blob `f0cdc19cc9fdb6e1d1bf0ef1158bca11dbb4481b`, uses `actions/checkout@v4` without an explicit `ref` and prints `GITHUB_SHA` in its final environment step. On a pull-request event, the default checkout is the synthetic merge ref. There is no explicit PR-head checkout or checkout-identity assertion.

## Current run

- PR #1570 head: `0dd960f4a279700799930934971ab8bbc7d6d33c`.
- PR base branch: `infra/lean4-verification-20261023`.
- Base SHA at PR creation: `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Current base SHA at this observation: `c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- Actions run #42925403904, job #130210603328, IN_PROGRESS at “Generate Lake dependency manifest”.

If successful, this is a **merge-reference build**, not an exact-head-only build. No compilation success is claimed. Exact-head verification remains outstanding. The current primary report is `WORKSPACES/TERN/2026-11-10T2324Z_H743_SCHEDULER_EVENT_CROSS_SECTION_AND_UPKEEP_REVIEW.md`, blob `329890f9ba584940245b2b140b86d0a9b091b17b`.

No workflow, branch, scheduler task, ID, schedule, phase, cadence, enabled state, automation count, or ownership changed.
