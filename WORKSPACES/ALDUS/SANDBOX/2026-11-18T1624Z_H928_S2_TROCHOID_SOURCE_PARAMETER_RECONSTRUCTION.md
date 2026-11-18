# Lane 24 | Rotation/contact source cross-read + trochoid kinematics

**Status:** SOURCE-METADATA-VERIFIED / SOURCE-PARAMETER-RECONSTRUCTION / RAW-DATA-NOT-ACQUIRED / P2-HOLD / NO-SYSTEM-SELECTION

## 1. New rotation/control dataset

**Gehlert & Babinsky, translating and rotating cylinder experiment**

- Cambridge repository dataset: [Planar PIV, force and kinematic data for a surging and rotating cylinder](https://www.repository.cam.ac.uk/items/8cd322fd-a31c-4081-88b7-f5f6acca4a87)
- DOI: [10.17863/CAM.37305](https://doi.org/10.17863/CAM.37305)
- Repository lists one **1.26 GB Open Access Data.zip**; the files are `.dat`.
- Description identifies planar PIV, force and kinematic data at **Re = 20,000**.
- License shown: **CC BY-SA 4.0**, except where otherwise noted.
- Experiment paper: [Gehlert & Babinsky, AIAA SciTech 2019, DOI 10.2514/6.2019-0347](https://doi.org/10.2514/6.2019-0347).

### Measurement provenance and uncertainty reported by the paper

The source paper describes a vertically mounted 0.06 m diameter, 0.48 m span cylinder (effective aspect ratio 16), translated horizontally and rotated about its vertical axis. It reports steady translation (U=0.43) m/s at (Re=2\times10^4), with 137 rpm (reported rotation ratio α=1) and 411 rpm (α=3). The rotation cases reach steady angular speed over different acceleration distances.

- Two-component force balance: ±50 N range, 0.01 N resolution, in-situ calibration; sampled at 3 kHz; force averaged over five runs.
- Typical random force error: approximately 1% of peak mean force; final force-coefficient uncertainty reported about 3%.
- Translation-speed uncertainty reported about 1%.
- Planar PIV: 900–1300 Hz; 5–6 runs; final 16×16 pixel interrogation window, 50% overlap; dual light sheet and two camera fields stitched into a continuous vector field.
- Estimated PIV velocity error below 3%; camera-angle correction below 0.5%.

These are paper-level measurement/error estimates. **Raw files, archive ReadMe, calibration files, joint covariance, and raw PIV/force/kinematic records were not acquired.** The dataset page was readable, but the 1.26 GB binary download route was not accessible through the available web/download runtime; an outbound DNS test also failed. Open metadata is not raw-data readback.

## 2. Geometry correction: trochoid, not helix

The cylinder's surge translation is perpendicular to its spin axis. A material point's horizontal trajectory is therefore a planar trochoid:

[
\mathbf X(t)=(Ut+r\cos\omega t,\ r\sin\omega t,\ z_0).
]

[
\dot{\mathbf X}=(U-r\omega\sin\theta,\ r\omega\cos\theta,0),\quad
\ddot{\mathbf X}=(-r\omega^2\cos\theta,-r\omega^2\sin\theta,0).
]

Let (v_\theta=r\omega). The phase-dependent speed is

[
V(\theta)^2=U^2+v_\theta^2-2Uv_\theta\sin\theta,
]

and the spatial curvature is

[
\kappa_3(\theta)=
\frac{r\omega^2|v_\theta-U\sin\theta|}
{(U^2+v_\theta^2-2Uv_\theta\sin\theta)^{3/2}}.
]

The material worldline is a spacetime curve. At these low speeds, its proper curvature is approximately (r\omega^2/c^2); this is not fluid vortex-sheet curvature or ambient Riemann curvature.

## 3. Source-parameter reconstruction

Rounded source inputs: (r=0.03) m, (U=0.43) m/s, and RPM 137/411. The reconstructed (r\omega/U) values differ from the paper's nominal α=1/3 by about 0.093%, consistent with rounding.

| Case | ω (rad/s) | (r\omega) (m/s) | α reconstructed | Trochoid class | Speed range (m/s) | Spatial curvature range (m⁻¹) | (r\omega^2) (m/s²) | Worldline curvature approx (m⁻¹) |
|---|---:|---:|---:|---|---:|---:|---:|---:|
| nominal α=1 | 14.346606 | 0.430398 | 1.000926 | Prolate (looped) | 0.000398–0.860398 | 8.34105–38,943,161 | 6.174754 | 6.87034×10⁻¹⁷ |
| nominal α=3 | 43.039819 | 1.291195 | 3.002778 | Prolate (looped) | 0.861195–1.721195 | 18.75868–74.93066 | 55.572782 | 6.18331×10⁻¹⁶ |

The α≈1 case is near the cycloid cusp condition (U=r\omega). The rounded nominal values place it just on the looped/prolate side, with a very small minimum speed.

## 4. Partial sensitivity to reported ∼1% translation-speed uncertainty

Radius and RPM are held fixed because their uncertainties were not retrieved. This is **conditional sensitivity, not a confidence interval**.

| Case | (U) (m/s) | α reconstructed | Trochoid class | Minimum speed (m/s) | Curvature min (m⁻¹) | Curvature max (m⁻¹) |
|---|---:|---:|---|---:|---:|---:|
| α=1 | 0.42570 | 1.011036 | Prolate | 0.004698 | 8.42505 | 279,742 |
| α=1 | 0.43000 | 1.000926 | Prolate | 0.000398 | 8.34105 | 38,943,161 |
| α=1 | 0.43430 | 0.991016 | Curtate | 0.003902 | 0 | 405,591 |
| α=3 | 0.42570 | 3.033109 | Prolate | 0.865495 | 18.85276 | 74.18796 |
| α=3 | 0.43000 | 3.002778 | Prolate | 0.861195 | 18.75868 | 74.93066 |
| α=3 | 0.43430 | 2.973048 | Prolate | 0.856895 | 18.66530 | 75.68457 |

For the α≈1 case, the continuous U uncertainty interval crosses (U=r\omega), where the ideal trochoid has a cusp and the spatial curvature maximum is unbounded. Thus the spatial-curve curvature is not robustly identifiable from the rounded source parameters. The α≈3 case remains prolate throughout the U-only sensitivity range.

The worldline curvature values use exact SI (c=299792458) m/s (NIST CODATA 2022, Web Version 9.0); relativistic correction is negligible at (V<1.73) m/s. This is a source-parameter kinematic reconstruction, not a fit, prediction, blind test, raw-data reanalysis, or independent validation.

Reproducible script: [lane24_h928_s2_trochoid_kinematics.py](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ALDUS/SANDBOX/lane24_h928_s2_trochoid_kinematics.py) (SHA-256 `902095c9371215c9bb6f5389b4e9c26ec69348bb443a271597faabfa163798c1`).

## 5. Contact-geometry cross-read

**Allan, Mishra & de Rooij (2025), three-strand aramid rope contact**

- [Open article](https://journals.sagepub.com/doi/full/10.1177/00405175251333381), DOI 10.1177/00405175251333381.
- Calibrated pressure-sensitive film reads contact pressure; optical microscopy reads contact width; contact force per unit length is pressure × width.
- Reported pressure-film accuracy around ±10%, usable range 10–50 MPa, and measurements limited to about 10–40 MPa because of low-range coloration and high-range saturation.
- Four contact readings/load/specimen from two films/two interfaces, at least two specimens/load. Nested readings are not automatically independent.
- Data available upon reasonable request, not acquired.
- The Batra–Hsu ideal-helix model overestimates contact force. The 0.74 helix-angle correction is fitted across tested configurations, not an independent prediction; strand flattening and filament-angle variation are explicit deviations from ideal geometry.

This is a construction-specific aramid-rope study, not climbing-rope data or a universal rope/vortex equivalence.

## 6. Candidate comparison and gate

| Candidate | Channels | Raw-data status | Lane 24 fit |
|---|---|---|---|
| Barckicke et al. (2026), air–water finite-core vortex | Contour position/radius, PIV circulation, PTV axial velocity | Figshare DOI identified; bytes/manifest/covariance not retrieved; parameters fit-conditioned | Best finite-core readout candidate, still incomplete |
| Han et al. (2026), vortex-ring interface | Synchronized surface imaging + 4D-PTV | Supporting data on request; not acquired | Richer spatial readout, no raw/calibration package |
| Gehlert & Babinsky cylinder | Planar PIV + kinematics + force balance | Open 1.26 GB archive; not downloaded | Rotation/control candidate, not finite-core test |
| Aramid rope contact | Calibrated pressure film + optical width + tensile load | Request-only; not acquired | Material-specific contact candidate |

Common admissible structure is the source-defined instrument/readout chain: measured state → calibration/registration → derived geometric/field observable → independent channel/comparator → covariance/holdout. These systems share measurement architecture only; no physical equivalence is asserted.

**Decision:** no P2 system selected. The cylinder is a useful rotation/control candidate and the source-parameter trochoid map is reproducible, but raw data and complete uncertainty/covariance remain unavailable. No numerical comparison, fit, prediction, independent measurement, or H(s)H theory promotion was performed.

## 7. Formalization status

Existing conditional work was reused, not extended:

- HsH PR #873 exact head `94b6d96c91806a95505260a3c52220f4af294185`: exact-head Lean verification run #44090154878 **SUCCESS**.
- PR #1657 exact head `c186567b6b85c46076b0de2e6a498bb9fd3ae895`: run #43332191359 **FAILURE** overall; target module built, but root build failed in `MovingPlaneTraceGeometry` (noncomputable-definition errors).
- PR #1189 exact head `da1e7d5dff0cdbc1d81303e3c573b79832087a38`: exact-head run #44106198466 **SUCCESS**.
- Math Hopper #991 smoke run #40841280647 **SUCCESS**.

Local Lean/Lake/Elan is absent. No new theorem/module/build was created. Lean CI checks formalized statements, not source-to-physical-map validity.

## 8. Stop conditions

P2 remains HOLD pending raw acquisition, source-version/hash manifest, instrument/calibration provenance, units, joint uncertainties/covariance, frozen observable, source-authorized H(s)H forward map, and independent holdout/review. No BEDROCK promotion or paper-gate advancement.
