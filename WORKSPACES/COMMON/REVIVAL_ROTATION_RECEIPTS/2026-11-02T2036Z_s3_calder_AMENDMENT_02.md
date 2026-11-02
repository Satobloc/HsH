# Calder :36 receipt amendment 02 — paired-contour covariance gate

This amendment supplements the primary receipt and Amendment 01. It records a further refinement to the local source-to-observable architecture; no repository research branch or public paper record was changed.

## New source-grounded readout requirement

The Nature Physics 2026 single-vortex paper defines:

`a(z,t)=[r(z,t,0)+r(z,t,π)]/2`

and

`η(z,t)=[r(z,t,0)-r(z,t,π)]/2`.

Both derived channels use the same two opposing interface-contour traces. They are not independent raw sensors. The published source presents separate radius and centerline spectra, but the inspected material does not provide the paired-contour cross-covariance or cross-spectrum.

The local test matrix now requires the raw paired contour samples and their joint covariance to be retained before treating the two channels as statistically independent. No covariance was calculated because the raw Figshare files were not retrieved.

## Updated local artifact integrity

- Updated report: `calder_kelvin_two_vortex_test_architecture.md`
  - SHA-256: `26791c2e0628c7b21554cf5f56e3e0da297ade3577078b35a41b9f7e5237bcfa`
- Updated test matrix: `calder_vortex_test_matrix.json`
  - SHA-256: `d523157b129098b0be9e06153a041917fd15b8b0700c5f04c1d71b28602e7f2f`
- Uncertainty script and output hashes remain unchanged and are listed in `calder_vortex_test_architecture_hashes.json`.

## Limits unchanged

No Lean proof was run; no data-free algebraic covariance proof was attempted without the required permission. No raw-data reanalysis, H(s)H fit, two-vortex prediction, branch/PR/issue change, public publisher submission, or theory promotion occurred. Code Grurple remains ACTIVE.
