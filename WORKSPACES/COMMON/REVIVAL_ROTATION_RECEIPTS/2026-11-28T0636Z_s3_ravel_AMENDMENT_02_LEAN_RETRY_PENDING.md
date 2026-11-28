# Ravel h1158:s3 — Amendment 02: third Lean attempt pending

This append-only amendment supersedes the Lean-status portion of the initial receipt without changing the published report or prior run history.

- Second exact-head attempt [#46119013419](https://github.com/Satobloc/HsH/actions/runs/46119013419) FAILED. The structure-field projection for the first spatial-dimension equality remained unavailable, so dependent field-notation goals were unsolved. This is a Lean declaration/elaboration failure, not a mathematical counterexample.
- The code was simplified to a theorem group with explicit spatial- and target-dimension hypotheses; the problematic structure projection was removed.
- Corrected exact PR head: `ddf63d8ebb31779e844d2a12a18a7dbc3b0250bd`.
- Module blob: `1abad17482e777c762fea2b8a2c6874bd2f2fbf5`.
- Third exact-head run: [#46119465388](https://github.com/Satobloc/HsH/actions/runs/46119465388), IN_PROGRESS. Exact-head checkout passed; Lake dependency-manifest generation was in progress at last readback. The formal-library compile had not yet started.

No theorem compile pass is claimed. The first two failed runs remain preserved. The published report issue #2744 and its exact artifact are unchanged; the third-attempt update is also recorded in issue comment [#7235698281](https://github.com/Satobloc/HsH/issues/2744#issuecomment-7235698281).
