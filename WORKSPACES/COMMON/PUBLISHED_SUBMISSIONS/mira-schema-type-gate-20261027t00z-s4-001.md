# Workshop :48 | Mira-selected source-identity QA | 2026-10-27 00Z

**Actor:** current assistant in Mira-selected rotation slot, not authenticated historical Mira. **Next:** Aldus. **Scope:** review-only software source-validation contract, not PDF extraction, physics, or a clearance decision.

## Original source and currentness
- Private HSH_RESOURCES `WORKSPACES/MIRA/intake_preflight_review.py`, current Git blob `596384f3d7bd74a17e8dfeac4ca262ce2c0f2dc4`, source predicate inside `parse_approvals`.
- The code tests `obj.get("schema_version") != 1`, which uses Python value equality rather than strict JSON integer type.
- Historical 2026-10-11 test receipt applies to older blobs `e910a751f3dc0dfe1a815e185f01ab71702b0db0` (source) and `18b1056f6c18677d90d1b65ca3ba9ad5cb3505a3` (tests). Current source and tests have different blobs. The intervening change adds a local file-size check and corresponding test. The old 29/29 pass must not be presented as a rerun of the current source.

## Executed bounded negative control
An isolated Python 3.13.5 reproduction of the original envelope predicate ran six cases: schema versions `1`, `True`, `1.0`, `False`, `'1'`, `2`. The current comparison accepts `1`, `True`, and `1.0`; the proposed integer-type-strict comparison accepts only integer `1`. All six assertions passed. This reproduces a narrow schema-validation type defect, **not** an approval bypass or an actual PDF opening. It does not run the complete original module.

Suggested review-only correction: require `type(obj.get("schema_version")) is int` in addition to equality with `1`, and add regression tests for Boolean and floating-point JSON versions. Do not remove the separate author/permission checks or enable extraction.

## Formal shape / Lean gate
The contract is a mapping from JSON scalar variants to acceptance decisions. A source-scoped Lean 4/Mathlib model was committed to the existing formal-verification branch, not to BEDROCK or production: `FORMAL_VERIFICATION/HsHVerification/MiraSchemaTypeGate.lean`, blob `9cab57056c0d9389a5e6f1b23c5c95f43971ac01`, commit `b829b852e2b1d99db530525a97e80af86765b609`; library import commit `20c05c89a182538d4ecade492d4895f74d7d7dfc`. Six candidate statements distinguish Python-style equality from type-strict acceptance. CI run `40429008788` was PENDING at initial inspection; successful Lean compilation is not yet established. The Lean model is intentionally limited and cannot prove the actual Python program, source ownership, or safe extraction.

## Provenance, authority and privacy
Current Nathan Direct (Oct 24) lifts the earlier prior-art research-access ban, while private/public exposure, source-owner authorization, and per-item clearance remain separate controls. Private Mira STATUS/README contain historical October 9 wording, which is source history rather than current authority. No PDF, protected source text, private manuscript, or extraction pipeline was opened or published; no production permission, license, scheduler, or theory change.

## Next cursor
1. Check Lean CI run 40429008788 and preserve failed diagnostics if any.
2. Rerun the complete current review-only Python suite on a pinned clean checkout before treating its old receipt as current; add strict-schema regressions.
3. Aldus: apply the existing ten-rung document-identity ladder to the type-validation defect, keeping source version, bibliographic identity and clearance distinct. Do not infer historical Mira participation or cross-chat delivery.
