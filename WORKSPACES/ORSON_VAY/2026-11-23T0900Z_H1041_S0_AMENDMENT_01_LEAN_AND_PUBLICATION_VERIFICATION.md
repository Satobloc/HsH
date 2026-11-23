# Orson Vay h1041:s0 — Amendment 01: Lean and Publication Verification

**Purpose:** Additive verification update to the h1041:s0 source-fidelity report. The original report and its published artifact remain unchanged; this amendment records the later successful Lean build and publication readback.

## 1. Original report and publication

Original workspace report:
`WORKSPACES/ORSON_VAY/2026-11-23T0900Z_H1041_S0_ROUTE_THREAD_IDENTITY_SOURCE_FIDELITY.md`

- Git blob SHA-1: `6b939950ad2739c8211ccd5e0080992a6c8c2104`
- SHA-256: `a395a5a67566bee53d7504565ba0fc7537203c11f634fc51f19ac7fdae1edb93`
- 15,431 characters.

Publisher issue [#2413](https://github.com/Satobloc/HsH/issues/2413) completed successfully in run [#45146447934](https://github.com/Satobloc/HsH/actions/runs/45146447934). Confirmation comment [#7096612453](https://github.com/Satobloc/HsH/issues/2413#issuecomment-7096612453) reports:

- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-h1041-s0-route-thread-identity-20261123t0900z-001.md`.
- Publisher commit: `46b4d6b458971653a50c96f5c819c5b1526ae11a`.
- SHA-256: `a395a5a67566bee53d7504565ba0fc7537203c11f634fc51f19ac7fdae1edb93`.
- Artifact readback verified.

Workspace report and canonical published artifact have the same Git blob SHA-1 and byte length, and their contents were independently compared.

## 2. Corrected Lean verification

The first exact-head run [#45145132636](https://github.com/Satobloc/HsH/actions/runs/45145132636) failed because `instance` was used as a structure field name. It was renamed to `modelInstance` in commit `10988d3c71bd457573ea196fd6931a051e438c7d`.

Corrected module and PR state:
- PR: [#2375](https://github.com/Satobloc/HsH/pull/2375), OPEN / DRAFT / UNMERGED.
- PR head: `10988d3c71bd457573ea196fd6931a051e438c7d`.
- Module: `FORMAL_VERIFICATION/HsHVerification/OrsonRouteIdentity.lean`.
- Module blob: `863b29a83d07b7c863b46f09caead728c1c96036`.
- Root aggregator blob: `2d965ffeef4f446ede0b758fcb80c87578d26daa`.

Follow-up Lean verification [#45146050430](https://github.com/Satobloc/HsH/actions/runs/45146050430) completed **SUCCESS**.

- Event: `pull_request`.
- Successful checkout / merge-reference commit: `01b3e35ac22c55c0d2849812a6f9f6b9d194f676`.
- Lean: `leanprover/lean4:v4.34.0`.
- Lean version: 4.34.0.
- Lake version: 5.0.0.
- `lake build`: **SUCCESS**, 8,952 jobs.
- `HsHVerification.OrsonRouteIdentity`: built successfully.
- Root `HsHVerification`: built successfully.
- The three theorem-specific `#print axioms` outputs report that `route_resolver_forces_fiber_identity`, `no_route_only_identity_resolver_of_ambiguous_binding`, and `borrowed_participant_has_binding_and_consent` do not depend on any axioms.
- Tests, lint, nanoda, and the separate global axiom audit were skipped by the existing workflow.

The successful checkout's module and root-aggregator Git blob SHAs were fetched independently and match the corrected PR-head blobs exactly. Thus this is a successful **merge-reference build with exact PR-head source-blob identity**, not a standalone branch checkout and not mainline integration.

A separate push-event `conversation-json-content-ci` run #45146041977 failed with zero jobs and no Lean result. It does not alter the successful Lean verification above.

## 3. Formal and epistemic limits

The theorem remains conditional. It proves that if two candidate bindings share a route observation but differ in identity, no total route-only resolver can recover both. It does not prove that two real candidate threads exist for this run, authenticate a current thread or model instance, or establish any borrowed-instance consent.

`VerifiedRouteBinding` and `ConsentWitness` are typed interfaces requiring future source evidence. No actual identity-binding or consent witness was instantiated. The successful Lean build verifies only the formalized conditional statements, not the fidelity or completeness of the assistant reconstruction and not any empirical cognition claim.

PR #2375 remains unreviewed, draft, and unmerged. No adoption, P1 protocol change, model trial, human session, API spend, dataset expansion/reanalysis, manuscript edit, paper-gate advancement, physical calculation, fit, prediction, independent measurement, CODATA scoring, or BEDROCK theory promotion occurred.

## 4. Updated status

`H1041_S0_ORSON / ORIGINAL_REPORT_PUBLISHED_VERIFIED / AMENDMENT_01_VERIFICATION_UPDATE / LEAN_BUILD_SUCCESS_MERGE_REFERENCE_WITH_EXACT_PR_HEAD_BLOB_MATCH / THREE_THEOREM_AXIOM_OUTPUTS_NO_AXIOMS / TESTS_LINT_NANODA_GLOBAL_AUDIT_SKIPPED / PR2375_OPEN_DRAFT_UNMERGED / NO_P1_CHANGE / NO_MODEL_TRIAL / NO_PHYSICAL / NO_CODATA / NO_THEORY_PROMOTION / AUTOMATION_UNCHANGED / NO_SIXTH_TASK / NO_CROSS_THREAD_CLAIM`.
