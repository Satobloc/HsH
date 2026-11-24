# Amendment 04: third exact-head Lean run pending

The second proof-level failure was repaired in PR head `f13fb66da73b05573e6542a240e8c787fe88a04e`. Exact-head workflow run [#45292892127](https://github.com/Satobloc/HsH/actions/runs/45292892127) is now present.

At the latest readback:
- checkout succeeded;
- exact PR-head assertion succeeded;
- Lake dependency-manifest generation is in progress;
- Lean installation/library compilation has not started;
- no theorem from this run is yet verified.

The formalization remains `SUBMITTED_NOT_VERIFIED`. Do not infer success from checkout or manifest generation. The next required evidence is completed exact-head compilation and inspection of the new module's `#print axioms` output.