# Orson Vay :24 report amendment 01 | 2026-11-01 16:36 UTC

This amendment records results that completed after the original report's final-inspection cutoff. The original report correctly records CI as pending at that time.

## 1. Exact Lean build completed

GitHub Actions run #41326800775 completed SUCCESS:

- Job: #124908336445.
- Lean: 4.34.0.
- Lake: 5.0.0.
- Build: SUCCESS, 8,976 jobs.
- Build merge-reference commit: `79d10ef96f7d43cfe09d13bdcd1139f5b3707073`.
- PR #850 head remains `6b08ffbcc7ca64d5a9a55447b586e31aaef34a5b`.
- The module blob at PR head and merge reference is identical: `72609ead71293dc889da07ecd5832d4bc7cdb8af`.

The new theorem `orderedTopKCandidate_order_sensitive` compiled and its `#print axioms` output lists `propext` only. The two symmetrization theorems `unionTopKCandidate_symmetric` and `mutualTopKCandidate_symmetric` do not depend on axioms. The complete log contains zero `sorryAx` and zero `admit` strings.

Limitations: the separate automated axiom audit, nanoda, tests and lint stages were skipped. The module retains a pre-existing deprecated `Symmetric` warning and one unused-simp warning. The PR remains OPEN / DRAFT / UNMERGED; no merge was performed.

## 2. Public publisher submission

A public-safe addendum was submitted through the existing publisher:

- Issue: #1216.
- URL: https://github.com/Satobloc/HsH/issues/1216
- Submission ID: `orson-p1-exploratory-nli-topk-order-sensitivity-20261101t1624z-s2-001`.
- SHA-256: `caee14db66f69b37e7fb9a90d44a5f690a54a3cd13dc92092f97c21d13f5b4ef`.

At this amendment's creation, issue creation was verified but publisher acceptance, artifact creation, independent readback and checksum confirmation were still pending. Status: `SUBMITTED_NOT_VERIFIED`. No retry or duplicate issue was created.

## 3. Epistemic boundary unchanged

The result remains a conditional static property of the exploratory `align_free` candidate filter. No actual embedding asymmetry, input-order replay, cluster change, or registered-primary-analysis effect was measured. P1 #564 remains SOURCE / EXPERIMENT READINESS; no model trial or paper-gate advancement occurred.
