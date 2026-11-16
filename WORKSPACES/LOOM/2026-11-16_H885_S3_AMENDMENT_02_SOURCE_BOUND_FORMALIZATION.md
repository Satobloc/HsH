# H885:S3 Amendment 02 | SourceBoundP2Bundle formalization update

This amendment updates the source-version report's proposed admission rule in light of the existing [PR #1858](https://github.com/Satobloc/HsH/pull/1858). No new PR or issue was created.

## What is now formalized

PR #1858 extends Nadir's ComparisonFreeze coherence contract with a source-bound P2 bundle. The current PR head specifies:

1. One nonempty source-bundle ID matching ComparisonFreeze.sourceBundleId.
2. The same source-bundle ID on E/D/F/R evidence receipts and H0/H1 prediction receipts.
3. An opaque nonempty source-witness digest carried through those receipts and the canonical manifest.
4. A canonical manifest digest identity matching ComparisonFreeze.canonicalManifestDigest.
5. Nonempty source-manifest and observation-manifest IDs, both declared members of the same canonical manifest member list.
6. No unjustified distinctness requirement between source and observation manifest IDs.
7. An additive wrapper whose forgetSourceBindings function recovers the existing P2EvidenceBundle.

## Verification status

- Previous PR head: 35df9d43602792e761710145703c3adb5b36ea0a.
- Previous exact-head Lean run: [#43966655498](https://github.com/Satobloc/HsH/actions/runs/43966655498), 8,950 build jobs; five theorem-specific axiom reports with no dependencies reported.
- Current PR head: 85780267a86bcadbcc4895e2031674f150f783e4.
- Current exact-head run: [#43969861179](https://github.com/Satobloc/HsH/actions/runs/43969861179). Exact-head checkout assertion passed; at last inspection Lake dependency-manifest generation was still in progress. No new-head compilation success is claimed.
- PR #1858 remains OPEN / DRAFT / UNMERGED, stacked on PR #1852. Vercel preview is rate-limited on the free tier; no upgrade or retry.

The previous successful build does not validate the current head. The current head must complete its own Lean build before its new membership theorems can be called compiled.

## Limits that remain

The formalization proves equality of declared identifiers and membership in a declared list. It does not hash or authenticate raw source bytes, verify that a manifest file exists or actually contains the asserted list, authenticate verified flags, prove reviewer independence or pre-unblinding, establish Python/repository/runtime refinement, or define a physical geometry map.

The JSON source-bundle witness remains an assistant-created custody index. Its digest is not cryptographically verified by Lean. The global-to-local, coordinate/signature, worldtube/core and lab/instrument maps remain undefined. P2 remains HOLD; no physical calculation, fit, prediction, independent measurement, numeric falsification threshold or theory promotion is added.

The separate source-bound evidence specification issue #1859 remains SUBMITTED_NOT_VERIFIED at last inspection. No publisher retry or duplicate submission was made. The original issue #1857 publisher artifact remains immutable; this amendment is additive.
