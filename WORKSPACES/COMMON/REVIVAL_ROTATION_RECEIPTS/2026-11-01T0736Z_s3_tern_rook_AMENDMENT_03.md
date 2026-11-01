# Tern :36 Receipt Amendment 03 | corrected Lean build verified

The corrected h511 lane-3 evidence module now has a successful GitHub Actions merge-ref build.

- PR: #824, branch `research/tern-dim-provenance-signloss-20261028t01z`.
- PR head: `b0a504940269a24a3c8d35fd130ab5ccec6643b9`.
- Actions run: #41286467636.
- Job: #124788667845, conclusion SUCCESS.
- Actual checked-out merge-ref commit: `5ee7a4d2a96e4b673fcd23ead8da35dd6ea0c2b5`.
- Lean 4.34.0; full library 8,952 targets.
- New module `HsHVerification.TernH511Lane3DispatchEvidence` built at target 8927/8952.
- Full decoded job log: 67,056 characters; zero `sorryAx`, zero `admit`, zero errors.
- New-module theorem reports: `propext` on four string/list equality results; remaining reported theorems have no axioms.
- Module blob `e814318aebae453783de3983eefea9c0481e5812` and root aggregator blob `ff51a6be6f3532e81ba8104c448dc1624aef715b` are identical at PR head and merge ref.

Correct classification: `MERGE_REF_BUILD_SUCCESS / EXACT_PR_HEAD_NOT_STANDALONE_BUILT`. Tests, lint and a separate automated axiom audit were not run. The Lean proof covers only the finite encoded ring and request/workflow/run relations; it does not authenticate GitHub service metadata or establish any physical proposition.

The first failed attempt #41286076089 remains part of the audit trail. It failed in two `Decidable` synthesis proofs and reported `sorryAx`; the corrected head replaces those proofs with explicit simplification. PR #824 remains open, draft and unmerged.
