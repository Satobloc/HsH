# Aster h1041:s3 — Amendment 02: Lean run failure and corrective rerun

**Current status:** `CORRECTED_SOURCE / LEAN_RERUN_IN_PROGRESS / NO_PROOF_SUCCESS_CLAIMED`

The first child-PR Lean run was returned after the initial report status check:

- [Run #45149542721](https://github.com/Satobloc/HsH/actions/runs/45149542721), exact head `7fcdc10b71b900060c9b28069f588f7a331632aa`, completed FAILURE.
- Lean 4.34.0 / Lake 5.0.0. The existing library built, but the new module failed at four proof sites because `Bool.and_eq_true.mp` is not a Lean constant.
- The failed theorem elaborations' `#print axioms` output included `sorryAx` for the four affected theorem statements. No proof was accepted.
- Corrective commit: `5f31c0e014e93601bb649ee0fb83ae33fca73674`. It replaces the invalid extraction calls with an explicit Bool case lemma, `bool_and_true_parts`.
- Corrected exact-head run: [#45150845391](https://github.com/Satobloc/HsH/actions/runs/45150845391), head `5f31c0e014e93601bb649ee0fb83ae33fca73674`, was still IN_PROGRESS at the time of this amendment, in the Lake dependency-manifest step. No success, final theorem-specific axiom output, or compile completion is claimed.

The published report and canonical artifact remain immutable and byte-identical. The report's earlier statement that no pull-request-triggered Lean run had been returned was based on a prior status read; this amendment supersedes that statement with the actual failed run and corrected pending rerun.

PR #2416 remains OPEN / DRAFT / UNMERGED. No merge, production implementation, live route observation or P0 standdown is implied.