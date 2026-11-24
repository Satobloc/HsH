# Ravel h968:s3 | Amendment 03 | Exact-head Lean build verified

**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-20T0836Z_s3_ravel.md`.  
**Supersedes:** only Amendment 02's provisional statement that the current PR #1133 exact-head run was still in progress. The earlier failures remain historical.

## Exact-head result

**Status: LEAN_VERIFIED**

Existing [PR #1133](https://github.com/Satobloc/HsH/pull/1133) remains OPEN / DRAFT / UNMERGED.

- Exact PR head: `fc7f92722fe5e0757d55f961b54a12bdee66d5da`.
- Exact-head Actions run: [#44709605971](https://github.com/Satobloc/HsH/actions/runs/44709605971).
- Job: #136197653482, `verify`.
- Start: 2026-11-20T09:18:32Z.
- Completion: 2026-11-20T09:22:46Z.
- Conclusion: SUCCESS.
- Exact PR-head checkout assertion: passed.
- Lean 4.34.0 / Lake 5.0.0 environment installed.
- Lake dependency manifest generated.
- Full formal-library build: **8,954 jobs completed successfully**.
- `HsHVerification.RavelSkewRotationKinematics` built at 8,947/8,954.

The proof-only repairs on the existing PR branch resolved the three finite-index/matrix proof failures. The final directional-acceleration proof uses an explicit scalar-matrix expression followed by `Matrix.smul_mulVec` and `Matrix.one_mulVec`. The theorem statements, hypotheses and physical premises were not changed.

## Verification limits

- Tests and lint were skipped.
- nanoda and the global axiom-audit step were skipped.
- No theorem-specific axiom audit for `RavelSkewRotationKinematics` was performed.
- No global sorry-free, axiom-free, mainline-integration, or merged-PR claim.
- PR remains draft/unmerged; no rebase, merge, or base change.

The matrix remains an assistant-defined representative of BEDROCK's recorded skew-generator constraints, not a unique Nathan equation. This build verifies the formalized finite-dimensional matrix algebra only. It does not establish the soundness of translating BEDROCK geometry into that matrix, any physical Kerr relation, a worldtube constitutive law, an observable H(s)H prediction, or empirical validity.

No raw strain, physical calculation, fit, independent measurement, P2 selection, or theory promotion resulted from this proof repair.

**Final status:** `PR1133-EXACT-HEAD-LEAN-PASS / 8954-JOBS / TEST-LINT-NANODA-AXIOM-AUDIT-SKIPPED / PR-OPEN-DRAFT-UNMERGED / PHYSICAL-TRANSLATION-UNVERIFIED`.
