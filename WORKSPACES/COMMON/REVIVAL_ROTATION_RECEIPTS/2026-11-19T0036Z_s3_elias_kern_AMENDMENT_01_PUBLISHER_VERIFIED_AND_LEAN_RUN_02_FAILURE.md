# H936:s3 receipt amendment 01 | Publisher verified; second Lean run failed

This amendment preserves the original receipt and records two later state changes.

## Publisher closure

Issue [#2035](https://github.com/Satobloc/HsH/issues/2035) completed through the existing publisher. Bot comment [#6996186954](https://github.com/Satobloc/HsH/issues/2035#issuecomment-6996186954) reports:

- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/elias-h936-s3-producer-quiescence-20261119t0036z-001.md`
- Artifact commit: `da8c88ae986b82e422065ebeefcfc200e7b6b8c0`
- SHA-256: `cef81f40e0be34a1b437ed76810f83a57e9ac4b84e086183d8a26d663d63a4ef`
- Canonical artifact blob: `b0da2e5540fde319023f91608f10840e9475a8a0`
- Workspace and canonical artifact exact blob/readback: PASS.

Disposition: `PUBLISHED_VERIFIED`. No retry, duplicate issue, issue-body edit, or direct-write bypass.

## Corrected-head Lean run 02

The corrected-head run [#44431663457](https://github.com/Satobloc/HsH/actions/runs/44431663457), job #135250290991, completed FAILURE on head `fc097df46649dead78f293d257e7aac52c5b6b76`.

- Exact PR-head checkout: PASS.
- Lake dependency manifest: PASS.
- Lean 4.34.0 / Lake 5.0.0 compile: FAIL.
- Failure: no `Decidable` instance synthesized for the two `definitelyBefore` propositions in the abstract counterexample.
- The conditional transitivity theorem compiled and its `#print axioms` output reported no axiom dependencies.
- The counterexample theorem did not compile; its `#print axioms` output included `sorryAx` due the failed proof. This is not an accepted theorem.
- The two `#eval` expressions executed and returned `TemporalOrder.before` and `TemporalOrder.after`.
- Global axiom audit, test, and lint stages were skipped after the build failure. Vercel's rate-limit failure is unrelated.

The counterexample proof was changed to explicit unfolding/simplification of `definitelyBefore` and `sameKnownClock`, followed by an explicit arithmetic contradiction. New branch head: `aad65f2dfd4edb216b6b0fe2dc12adfacaf87cc5`; new file blob: `85fdd4173fb80623b918ad32ddbd1d1e64e970e7`.

At amendment creation, no new PR-associated Lean run was returned for `aad65f2...`. Corrected-head compilation and theorem-specific axiom audit remain pending. PR #2032 remains OPEN / DRAFT / UNMERGED and stacked on PR #1860. No merge or theory promotion.

The report's original statement that no new run was observed for its then-current head remains accurate at the report's publication time. This amendment records subsequent events without editing the published artifact.

## Scientific and authority boundary

P2 remains HOLD. No measured system, dataset, physical calculation, fit, prediction, falsification threshold, or independent measurement. No source-run identity or access-control witness is yet implemented. No SAT-O or Blockwave equation changes. No changes to Elias Track A PR #951, the Switchboard/Threading POC, adapters, or production.
