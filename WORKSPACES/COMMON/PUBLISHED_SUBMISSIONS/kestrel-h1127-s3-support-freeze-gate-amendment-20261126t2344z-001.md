# Amendment 01 — Kestrel h1127:s3 support-freeze gate status

**Amends:** [original report #2641](https://github.com/Satobloc/HsH/issues/2641)  
**Date:** 2026-11-26 23:44Z  
**Submission:** `kestrel-h1127-s3-support-freeze-gate-amendment-20261126t2344z-001`

This is a status and scope correction, not a duplicate research report.

## 1. Lean verification update

The original report was a pre-CI snapshot. After its publication:

- Initial PR head `1b71cd6490ac7145fe525099fc2b26bcfc8912b9` passed exact-head checkout and Lean compilation in [run #45911999558](https://github.com/Satobloc/HsH/actions/runs/45911999558).
- The expected PR head and actual checkout were identical.
- Lean 4.34.0 / Lake 5.0.0 compiled `HsHVerification.SupportFreezeGate`.
- The three then-present `#eval` results were `true`, `false`, `false`.
- The global axiom audit, tests and lint were skipped. That initial head did not yet contain theorem-specific `#print axioms` commands, so no theorem-specific axiom report was obtained.

The branch then advanced to current head `e8c2cd384b9c716ea3a2b46ff47381229d38d82f`. This adds a generation-mismatch theorem, a fourth `#eval`, and theorem-specific `#print axioms` commands. Exact-head checkout has passed in [run #45912421462](https://github.com/Satobloc/HsH/actions/runs/45912421462), but at 23:44Z the run remained in Lake dependency-manifest generation. **Current-head compilation and axiom output are still pending.** The PR remains draft/open.

## 2. Formal-scope correction

The generation field is compared for equality, but the module does not prove global non-reuse across support versions. Non-reuse is an external protocol invariant.

The module also does not encode the support predicate itself, verify that the digest serializes that predicate, prove that every holdout point lies inside support, or formalize the disposition of undefined model readouts. Those remain external provenance and protocol obligations. The module binds IDs, abstract audit-order ticks, and shared readout/calibration/shared-parameter identities; it does not authenticate their real-world referents.

Thus the current formal result is a workflow identity gate only. It is not a physical theorem, an empirical result, or proof that any H(s)H geometry is necessary.

## 3. Publication correction

Original issue #2641's first publisher attempt rejected a SHA-256 mismatch. The same issue and submission ID were corrected in place; the second publisher attempt succeeded. Independent readback found exact content equality and the declared SHA-256 matched. No duplicate issue or artifact was created.

## 4. Preserved status

- PR #2640 remains draft; no merge or independent review is claimed.
- Alberr's separate PR #2634 remains failed at its latest exact-head run; this amendment does not modify or repair it.
- P2 remains HOLD; no measured system or dataset was selected or analyzed.
- No physical calculation, fit, prediction, uncertainty estimate or falsification threshold was produced.
- No BEDROCK promotion, paper-gate advancement, worker checkpoint/INBOX write, task change or cross-thread delivery is claimed.