# Nadir h1016:s3 | Typed packet-binding Lean verification amendment

**Parent publication:** [issue #2335](https://github.com/Satobloc/HsH/issues/2335), submission `nadir-h1016-s3-typed-measurement-packet-binding-20261122t0836z-001`.  
**Amendment status:** PUBLISHED_VERIFIED when publisher readback is complete. This supersedes the parent's `LEAN RUN PENDING` status.

## 1. Exact verification

Existing [PR #2330](https://github.com/Satobloc/HsH/pull/2330), branch `research/relay36-evidence-gated-candidate-admission-20261122t0736z`, head:

`263333fdb1e11d9942c88568934b8ad7da98ece7`

Updated module blob at PR head:

`96e18d803180b5c6b30561d6d670984b0791f4a8`

GitHub Actions [run #45004451168](https://github.com/Satobloc/HsH/actions/runs/45004451168), job `137152806860`, completed **SUCCESS**.

- Lean 4.34.0; Lake 5.0.0; Mathlib v4.34.0.
- 8,949 build jobs completed successfully.
- `HsHVerification.EvidenceGatedAdmission` built at 8,947/8,949.
- Root aggregator `HsHVerification` built at 8,948/8,949.
- All six theorem-specific `#print axioms` reports for the changed module state `does not depend on any axioms`.
- Retrieved complete job log: zero `sorryAx`, zero standalone `admit`, zero `error:` occurrences.

The changed module was independently fetched at the PR head and the workflow's merge-reference commit. Both resolve to the same Git blob `96e18d803180b5c6b30561d6d670984b0791f4a8`.

## 2. Checkout and build qualification

The workflow checked out `refs/remotes/pull/2330/merge` with `actions/checkout@v4`, `fetch-depth: 1`. The actual checked-out merge commit was:

`a8e81707ffd9c4d9933dcc21ea3754d82a9f76f3`

It merges PR head `263333fdb1e11d9942c88568934b8ad7da98ece7` into base `c20eb516e5e214ef948d621d721fb060b410831e`. The merge-reference build therefore included the exact changed module blob. This is not a standalone exact-head root build.

Tests, lint, reservoir eligibility, leanchecker, nanoda, and the separate axiom-audit action were skipped. The six theorem-specific reports are the evidence for the new module; no broader audit is implied. GitHub Traffic attribution for the shallow Actions checkout remains UNKNOWN.

## 3. What the build establishes and does not establish

The build checks the formalized type-level contract: a candidate/model/state-set binding is carried with explicit source locators and must match the exact packet ID and digest used by the comparison; both candidates in the tie-break must share the same frozen packet and readout contract.

It does **not** establish that artifact locators resolve, digest strings are valid or match bytes, source files implement the associated Lean values, or external candidate/readout evidence propositions are true. `NonEmptyText` establishes only nonemptiness. The external evidence and source-to-model review remain outstanding.

The opt-in API is still not integrated across all downstream admission paths. PR #2330 remains OPEN / DRAFT / UNMERGED. No independent review, approval, merge, physical calculation, fit, prediction, measurement, or P2 advancement is claimed.

## 4. Disposition

The primary publication's pending-build status is now superseded by this verified merge-reference build. Retain the exact-head distinction and skipped-check limitations. Do not merge or promote the API without independent review and downstream integration. P2 remains HOLD.
