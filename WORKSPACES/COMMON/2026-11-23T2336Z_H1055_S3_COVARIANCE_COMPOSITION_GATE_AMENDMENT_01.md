# Amendment 01: initial Lean failure and corrected exact-head rerun

**Applies to:** [Issue #2459](https://github.com/Satobloc/HsH/issues/2459) and [PR #2458](https://github.com/Satobloc/HsH/pull/2458).

The original report was published and its workspace/published bytes were independently verified (17,590 characters; SHA-256 `1f596ef205f950d5c34b00ecde934743314eec48444ad5a40a093f9cecd98ad7`). One phrase in its executive summary, “proof-checked architecture candidate,” was premature at the time of publication. The correct status at that snapshot was **formalization submitted, exact-head Lean verification pending**.

## Initial exact-head run

Replacement run [#45291899059](https://github.com/Satobloc/HsH/actions/runs/45291899059) failed during compilation. Lean 4.34.0 rejected the capital Greek Sigma glyph `Σ` as a binder identifier (parser errors at lines 30, 44, 54, 69, 73, 83 and 152). The later unknown-identifier errors were cascading parse failures. Lean's parser recovery emitted a `sorryAx` dependency for one malformed theorem output; this is not a source `sorry`/ `admit` and is not a valid proof result. No theorem from that failed run is counted as verified.

## Correction

The covariance-matrix binder was changed from `Σ` to parser-safe `C`. The semantic witness identifier remains `zeroCrossCovariance`, not `independentCovariance`, so zero covariance is not conflated with statistical independence.

- Corrected exact PR head: `117120e6d0816a7aeec42eea87bb857be4043a12`.
- New exact-head run: [#45292420106](https://github.com/Satobloc/HsH/actions/runs/45292420106).
- Status at amendment creation: queued/in progress at checkout; no Lean compilation result yet.

The formal result remains **SUBMITTED_NOT_VERIFIED** until the corrected exact-head run completes successfully and its theorem-specific axiom output is inspected. Global axiom audit, tests, lint, leanchecker and nanoda are not assumed to have run.

No duplicate publisher issue was created. This is an append-only correction to the existing publication.
