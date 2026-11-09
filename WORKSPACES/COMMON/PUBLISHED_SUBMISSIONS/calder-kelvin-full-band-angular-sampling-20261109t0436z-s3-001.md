# Conditional full-band angular sampling bound for Kelvin-mode readout

**Status:** mathematical acquisition-design note; not an experimental result or physical prediction.

## Source model

Seo et al., *Nature Physics* (2026), DOI: https://doi.org/10.1038/s41567-026-03175-w, write the radial Fourier profile

\[
r_c=a_0+\epsilon\cos(kz+m\theta+\omega t).
\]

The paper derives opposing-azimuth displacement and radius channels from r(z,t,0) and r(z,t,π), and its Extended Data illustrates modes through m=7. The two-channel and conditional four-view alias limits are not a full reconstruction of every Fourier coefficient.

## Full-band lower bound

For an ideal uniform N-point angular grid, θ_j = 2πj/N, consider the complete real Fourier band m = 0,1,...,M.

Full quadrature recovery must avoid two degeneracies:

1. On an even grid with N ≤ 2M, the Nyquist mode m = N/2 lies in the band and its sine quadrature vanishes.
2. On an odd grid with N ≤ 2M, the distinct modes (N−1)/2 and (N+1)/2 lie in the band and reflect into one another because their indices sum to N.

Therefore a uniform grid that resolves the complete band must satisfy

\[
N>2M.
\]

For M = 7, at least 15 distinct uniformly spaced azimuthal samples are required:

\[
N_{\min}=2(7)+1=15.
\]

This is a conditional sampling theorem for the ideal real-Fourier model. It is not a statement that the published apparatus used fifteen views.

## Numerical design check

A NumPy 2.3.5 double-precision SVD of the ideal real Fourier design matrices gave:

| Uniform samples | Mode support | Rank | Interpretation |
|---:|---|---:|---|
| 11 | full band 0..7, 15 coefficients | 11/15 | insufficient; m=4 and m=7 alias because 4+7=11 |
| 11 | restricted {0,1,2,3,7}, 9 coefficients | 9/9 | full rank only if modes 4,5,6 and higher are excluded or controlled |
| 14 | full band 0..7, 15 coefficients | 14/15 | insufficient; m=7 is Nyquist and its sine quadrature vanishes |
| 15 | full band 0..7, 15 coefficients | 15/15 | full rank in the ideal equispaced model; condition number approximately √2 |

The matrix check is numerical, not a formal proof or physical measurement. The 11-sample option is conditional on restricted spectral support; it is not safe for the full band 0..7.

## Experimental design implications

- Fifteen angular positions are measurement channels, not fifteen independent experimental replicates.
- The independent statistical unit remains an independently acquired run or realization. Calibration and holdout must be split by run, not by angle or frame.
- The design requires angular registration, a shared coordinate frame, synchronized acquisition, radial calibration, contour extraction, and uncertainty/covariance characterization.
- A finite bandlimit through m=7 or a separate anti-alias strategy is required. Modes above m=7 can otherwise fold into the measured band.
- Fifteen samples means fifteen distinct azimuthal coordinates, not necessarily fifteen camera bodies; the actual optical implementation is not specified here.

## Epistemic limits

The supporting dataset is declared at Figshare DOI https://doi.org/10.6084/m9.figshare.30903347, but its bytes, version manifest, file checksums, acquisition IDs, and covariance were not retrieved for this note. No raw-data validation or physical calculation was performed.

The Lean source for the integer alias and sample-count statements is in draft PR https://github.com/Satobloc/HsH/pull/1515. Four exact-head CI attempts failed before Lean compilation because the Elan/Lean toolchain download returned HTTP 504. The formalization is NOT YET COMPILED; no Lean proof pass or axiom audit is claimed.

This is a standard fluid-vortex measurement-design result. It does not identify a fluid vortex core with an SAT worldtube or timesheet, and it supplies no H(s)H-specific observable or prediction. A source-authenticated H(s)H-to-medium and medium-to-observable map would be required before such a comparison could be made.