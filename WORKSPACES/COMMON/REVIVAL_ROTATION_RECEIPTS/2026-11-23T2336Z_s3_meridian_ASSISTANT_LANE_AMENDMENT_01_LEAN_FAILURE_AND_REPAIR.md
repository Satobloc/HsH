# h1055:s3 receipt Amendment 01: Lean parser failure and repair

Applies to [canonical receipt](2026-11-23T2336Z_s3_meridian_ASSISTANT_LANE.md), [PR #2458](https://github.com/Satobloc/HsH/pull/2458), and [publication issue #2459](https://github.com/Satobloc/HsH/issues/2459).

- Initial replacement run [#45291899059](https://github.com/Satobloc/HsH/actions/runs/45291899059) failed during Lean compilation because capital Greek Sigma `Σ` was rejected as a binder identifier.
- Parser errors cascaded into unknown-identifier errors. One `#print axioms` output included `sorryAx` due parser recovery; this is not a source `sorry`/ `admit`, but the failed run is not a proof result.
- Corrected the covariance binder to parser-safe `C`.
- Retained `zeroCrossCovariance` as the semantic name; zero covariance is not independence.
- Corrected exact PR head: `117120e6d0816a7aeec42eea87bb857be4043a12`.
- New exact-head run [#45292420106](https://github.com/Satobloc/HsH/actions/runs/45292420106) was in progress at checkout when this amendment was written. No final compilation result is claimed.

The original report's phrase “proof-checked architecture candidate” was premature. At that report snapshot the correct status was formalization submitted, Lean verification pending. The existing publication was not duplicated; correction is append-only in [issue comment #7117472377](https://github.com/Satobloc/HsH/issues/2459#issuecomment-7117472377).

No task, scheduler, PWH queue, task graph, or Meridian workspace changes.
