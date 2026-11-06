# Meridian — observed CME finite-core reach from GCS aspect-ratio evolution

**Date:** 2026-11-05  
**Status:** SANDBOX / established-physics spatial comparator, grounded in published multi-event observations. Not a SAT/H(s)H prediction, not a Cruller solution, and not a 4D native-coordinate derivation.

## Why this is the next useful physical system

The solar differential-rotation calculation gives a measured surface flow and its shear. It does not supply a finite-core tube. A coronal mass ejection (CME) flux rope does: it is a three-dimensional, finite-radius, croissant-shaped magnetic structure whose cross-section and apex geometry are reconstructed from multi-viewpoint observations.

Mishra, Agarwal & Srivastava (2026) study four fast and four slow Earth-directed CMEs, tracking the GCS flux-rope aspect ratio from the corona to 1 au. Their abstract reports a three-phase evolution: aspect ratio rises in the low-to-middle corona, saturates at intermediate heights, and declines in interplanetary space. They also report stronger early expansion and larger radial structures for the fast-CME sample.

**Primary source:** Mishra, W., Agarwal, A. & Srivastava, N. (2026), “Three-phase evolution of aspect ratio in fast and slow CMEs from the Sun to 1 au,” *MNRAS* 550(1), stag1145. https://doi.org/10.1093/mnras/stag1145

## Geometry and exact definition used

The paper explicitly defines the GCS aspect ratio as the flux-rope cross-section radius divided by the height of the flux-rope centre from the Sun. The GCS model approximates the CME as a hollow croissant with circular cross-section. It also warns that aspect-ratio definitions vary across the literature; this calculation uses only the paper's stated definition.

Call this ratio chi, to avoid confusing it with curvature:

\[
\chi \equiv \frac{a}{R_c},
\]

where a is the GCS cross-section radius and R_c is the apex-centre height, which is the local axis-curvature radius in the toroidal-apex construction. If h is the leading-edge height,

\[
h=R_c+a,\qquad
a=\frac{\chi}{1+\chi}h,\qquad
R_c=\frac{1}{1+\chi}h.
\]

This is a model-defined local geometry, not a direct measurement of every point on the full flux-rope axis.

## Local finite-core reach gate

For a tube around a smooth spatial centreline, the local normal-coordinate Jacobian has the standard form

\[
J(y_n)=1-\kappa_1 y_n,
\]

where kappa_1=1/R_c is the local centreline curvature and y_n is displacement along the inward principal normal. At the inner cross-section boundary y_n=a,

\[
J_{\min}=1-a\kappa_1=1-\chi.
\]

Thus chi<1 is the local regularity/reach condition. It is necessary for this local tubular chart to remain nonsingular, but it does **not** prove global injectivity or exclude distant self-contact between separate portions of the rope.

This local Jacobian is the part of the finite-core construction that transfers from the HsH Loom note to a three-dimensional spatial tube. The Loom energy factor for a four-dimensional normal 3-ball is **not** applied: a GCS CME is a 3D spatial shell with a 2D normal cross-section, and no matching magnetic bending-energy functional has been derived here.

## Observational dataset: eight CMEs

The 2026 paper's Table 2 gives aspect ratio at the first and last tracked coronal heights and at 1 au. The values below preserve the reported uncertainties:

| CME | Class | Initial corona chi | Last corona chi | 1 au chi |
|---|---|---:|---:|---:|
| 2011-06-02 | Fast | 0.19 ± 0.03 | 0.23 ± 0.03 | 0.110 ± 0.024 |
| 2012-07-12 | Fast | 0.36 ± 0.02 | 0.61 ± 0.03 | 0.370 ± 0.020 |
| 2013-04-11 | Fast | 0.10 ± 0.02 | 0.40 ± 0.07 | 0.140 ± 0.015 |
| 2013-09-29 | Fast | 0.42 ± 0.04 | 0.60 ± 0.06 | 0.110 ± 0.041 |
| 2008-12-12 | Slow | 0.13 ± 0.006 | 0.23 ± 0.01 | 0.050 ± 0.008 |
| 2010-04-03 | Slow | 0.26 ± 0.04 | 0.37 ± 0.05 | 0.220 ± 0.057 |
| 2010-04-08 | Slow | 0.14 ± 0.02 | 0.28 ± 0.04 | 0.068 ± 0.002 |
| 2011-09-13 | Slow | 0.34 ± 0.05 | 0.43 ± 0.06 | 0.100 ± 0.027 |

All eight central values rise from first to last coronal measurement and fall again by 1 au. Across the eight-event sample:
- mean chi: 0.2425 initially, 0.39375 at last coronal height, 0.146 at 1 au;
- last-corona range: 0.23–0.61;
- corresponding local Jacobian margin: J_min=1−chi ranges from 0.77 down to **0.39**;
- maximum central chi is 0.61 ± 0.03, so the closest case remains locally regular in this model.

Fast/slow sample means are respectively 0.46 versus 0.3275 at last coronal height. This is descriptive only (four events per class), not a population-level statistical claim.

## Reconstructed physical scales at last coronal height

Table 1 provides the last tracked leading-edge height h and the GCS-fitted chi. Using the IAU nominal solar radius R_sun=6.957e8 m strictly as a conversion value, the GCS equations give:

| CME | h (R_sun) | chi | a (R_sun) | R_c (R_sun) | a/lP | R_c/lP | kappa_axis*lP |
|---|---:|---:|---:|---:|---:|---:|---:|
| 2011-06-02 | 13.5 | 0.23 | 2.524 | 10.976 | 1.087e44 | 4.724e44 | 2.117e−45 |
| 2012-07-12 | 14.9 | 0.61 | 5.645 | 9.255 | 2.430e44 | 3.984e44 | 2.510e−45 |
| 2013-04-11 | 16.3 | 0.40 | 4.657 | 11.643 | 2.005e44 | 5.012e44 | 1.995e−45 |
| 2013-09-29 | 15.2 | 0.60 | 5.700 | 9.500 | 2.454e44 | 4.089e44 | 2.445e−45 |
| 2008-12-12 | 15.1 | 0.23 | 2.824 | 12.276 | 1.215e44 | 5.284e44 | 1.892e−45 |
| 2010-04-03 | 13.7 | 0.37 | 3.700 | 10.000 | 1.593e44 | 4.304e44 | 2.323e−45 |
| 2010-04-08 | 13.8 | 0.28 | 3.019 | 10.781 | 1.299e44 | 4.641e44 | 2.155e−45 |
| 2011-09-13 | 14.1 | 0.43 | 4.240 | 9.860 | 1.825e44 | 4.244e44 | 2.356e−45 |

Here kappa_axis=1/R_c. Planck normalization is reported first; the solar radius conversion is the IAU nominal value, not a claim about the exact current solar radius.

## Interpretation

1. **Finite-core thickness is dynamic.** The aspect ratio increases during the coronal rise for all eight events, then decreases by 1 au. A fixed core-to-curvature ratio is not a generally adequate physical assumption.
2. **The observed tubes are locally thick but not at the focal threshold.** The largest measured coronal chi is 0.61, corresponding to R_c/a=1.64 and J_min=0.39. The inner local Jacobian remains positive.
3. **Local reach is not global reach.** The GCS aspect ratio does not determine the minimum separation between distant legs or nonlocal portions of the flux rope. Global self-contact requires the full 3D shell/axis reconstruction.
4. **This is a spatial slice, not a 4D worldtube reconstruction.** The GCS data give time-evolving spatial geometry. Material labels, internal velocity fields, and the native SAT/H(s)H cw=t mapping have not been supplied. Do not silently lift this model into the native 4D coordinate system.
5. **No bending energy is calculated.** The magnetic field, pressure balance, and plasma stress are not reduced here to a quadratic filament bending modulus. The four-dimensional Loom normal-3-ball energy factor is not transplanted to this three-dimensional CME shell.

## Cruller relevance

This is a strong external finite-core comparator because it supplies observed values for a real, curved, hollow magnetic tube:
- a cross-section radius;
- a toroidal-apex curvature scale;
- an evolving dimensionless core/reach ratio;
- a measurable difference between fast and slow event samples.

It does **not** establish the Cruller's topology, its native time map, its interbraid law, or a gravitational/optical effect. It does establish that a physical finite-core tube can have a substantial, evolving core-to-curvature ratio while remaining locally regular.

The next empirical step is to obtain the full GCS mesh/time sequence for one event and calculate global reach and inter-leg self-distance, then compare those results with the local chi gate. A later 4D reconstruction must preserve material labels and explicitly resolve the native cw=t mapping rather than substituting q=ct.

## Reproducibility

Executable script: WORKSPACES/MERIDIAN/meridian_cme_finite_core_reach_20261105.py

The script calculates the GCS core radius, apex-centre radius, local Jacobian margin, Planck-normalized scales, and sample summaries directly from the published tables.

## Sources

1. Mishra, W., Agarwal, A. & Srivastava, N. (2026), “Three-phase evolution of aspect ratio in fast and slow CMEs from the Sun to 1 au,” *MNRAS* 550(1), stag1145. https://doi.org/10.1093/mnras/stag1145
2. GCS model geometry and aspect-ratio definition as described in the above paper, especially its Sections 1–2 and Tables 1–2.
3. HsH conditional finite-core geometry comparison: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/loom-finite-core-fiber-bending-20261023t23z-001.md. Its 4D normal-3-ball integrated energy factor is not used here.
4. IAU 2015 Resolution B3 nominal solar radius: R_sun,N=6.957e8 m. https://arxiv.org/abs/1605.09788

**Verdict:** The finite-core reach gate now has a real observational benchmark. Across eight reconstructed CME flux ropes, chi rises to at most 0.61 in the corona and then declines by 1 au; the local tube Jacobian remains positive throughout the reported sample. This is a measured physical comparison, not a Cruller derivation.
