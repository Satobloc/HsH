# Hale h1046:s3 | Amendment 01 — Lean and publication verification

**Recorded:** 2026-11-23T14:52Z  
**Status:** `LEAN_MERGE_REF_BUILD_PASS / PUBLISHED_VERIFIED / PR_DRAFT_UNMERGED`.

## Lean verification

The new child PR's existing CI run [#45198038464](https://github.com/Satobloc/HsH/actions/runs/45198038464) completed SUCCESS.

- PR: [#2427](https://github.com/Satobloc/HsH/pull/2427).
- PR head: `2e2f250603a27e7bb09127a0f8fe15adbe75dc71`.
- Merge-reference commit actually compiled: `68b68efa09fa16938327b10c74a5cdacc4b70930`.
- Lean 4.34.0 / Lake 5.0.0.
- The `ModelSelectionPreference.lean` blob in the PR head and compiled merge ref is identical: `7079a12a16d6036b9d92ac2a44355ab255fdfcb7`.
- `expandedModelBestTrainingLoss_le_baseline` elaborated successfully. Its theorem-specific `#print axioms` output is `[propext, Classical.choice, Quot.sound]`.
- No `sorry`, `sorryAx`, or `admit` occurs in the source. The only log occurrence of the word `sorry` is the workflow setting `nanoda-allow-sorry: true`; nanoda itself was skipped.
- Separate global axiom audit, leanchecker, tests, and lint were skipped.

This is a **MERGE_REF_BUILD_PASS**, not an exact-head-only certification. The theorem remains conditional on the stated embedding, score-preservation, and attained-minimum hypotheses. PR #2427 remains OPEN / DRAFT / UNMERGED; no independent review or merge is claimed.

## Publication verification

The original publisher issue [#2428](https://github.com/Satobloc/HsH/issues/2428) completed successfully:

- Publisher Actions run [#45198614808](https://github.com/Satobloc/HsH/actions/runs/45198614808): SUCCESS.
- Confirmation comment [#7104669415](https://github.com/Satobloc/HsH/issues/2428#issuecomment-7104669415).
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-h1046-s3-nested-model-fit-dominance-20261123t1436z-001.md`.
- SHA-256: `de77927396943d932b5bb0b4d7cf37c36d70592d5417e8cb004549c56b3d46b6`.
- Independent fetch of the workspace report and published artifact returned byte-identical content: 10,944 characters; both Git blob SHA-1 values are `b656f916efdf73b5695a027600aa04a751e19e53`.
- Independently recomputed SHA-256 matched the publisher's digest exactly.

No second publisher issue or duplicate submission was created. The original report remains an immutable publication snapshot; this file is its append-only verification amendment.

## Remaining limits

No actual H(s)H/standard parameter embedding has been established. No physical system, raw acquisition, fit, holdout score, physical prediction, uncertainty propagation, or falsification threshold was produced. P2 remains HOLD. No BEDROCK, SAT-O, Blockwave, or manuscript change.
