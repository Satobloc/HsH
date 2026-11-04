# Downstream non-recovery gate for the antipodal Kelvin-mode readout

**Submission ID:** nadir-antipodal-downstream-nonrecovery-20261104t2236z-s3-001  
**Run:** Workshop Relay :36, 2026-11-04 22:36Z  
**Status:** SOURCE-CONDITIONED FORMALIZATION / BASE ALIAS THEOREM VERIFIED / NEW DOWNSTREAM THEOREMS SUBMITTED_NOT_VERIFIED  
**P2 selection:** none  
**Physical calculation, fit, prediction, or independent measurement:** none  
**Factory Floor:** not admitted  
**Theory promotion:** none

## 1. Source and the exact measurement operator

Primary source: Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). Version of record published 2026-02-10. The article's PDF is available from the authors' laboratory at [the paper PDF](https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/BarckickeFalconGissingerNatPhys2026.pdf).

The paper states the single-harmonic radial ansatz

\[
r_c(z,t,\theta)=a_0+\epsilon\cos(kz+m\theta+\omega t),\qquad \epsilon\ll a_0,
\]

and defines the two opposing contour samples and derived channels

\[
r_0=r_c(z,t,0),\qquad r_\pi=r_c(z,t,\pi),
\]

\[
\eta=\frac{r_0-r_\pi}{2},\qquad
a=\frac{r_0+r_\pi}{2}.
\]

At fixed \((z,t)\), write \(\phi=kz+\omega t\). Then

\[
r_0=a_0+\epsilon\cos\phi,
\qquad
r_\pi=a_0+\epsilon(-1)^m\cos\phi,
\]

so

\[
\eta_m=\frac{\epsilon}{2}[1-(-1)^m]\cos\phi,
\qquad
a_m=a_0+\frac{\epsilon}{2}[1+(-1)^m]\cos\phi.
\]

Therefore, under this stated ansatz and this two-antipodal-sample operator:

- odd \(m\) modes enter \(\eta\);
- even \(m\) modes enter \(a-a_0\);
- \(m\) and \(m+2\) produce identical paired readouts;
- in particular, \(m=1\) and \(m=3\) alias, as do \(m=0\) and \(m=2\).

The linear transform \((r_0,r_\pi)\mapsto(\eta,a)\) is invertible on its two measured coordinates. That does **not** make the map from the underlying azimuthal mode index to those two coordinates injective. Coordinate recovery and mode identification are different claims.

## 2. Why this narrows, but does not overturn, the paper's mode assignment

The article's Results associate the bending branch with \(m=1\), report that it is absent from the radius spectrum, and describe two orthogonal cameras used to establish its counterrotating character. Extended Data Fig. 1 says only \(m=1\) displaces the vortex axis. The Methods, however, says the left/right profiles each feature every mode and that the derived position/radius signals select \(m=1\) versus the remaining modes \((m=0,2,3,\ldots)\).

The formal result establishes only that the two scalar antipodal samples, by themselves, cannot produce that unique mode classification under the stated radial ansatz. The paper's additional image geometry, contour processing, spectral/dispersion evidence, visual mode structure, or cross-view evidence may resolve the distinction. This is **UNRESOLVED_METHOD_MAPPING**, not a demonstrated experimental error.

A provenance edge remains: the Methods describes an optical camera normal to the vortex axis and two lenses (8 mm and 12 mm) for complementary views; the Results refers to two orthogonal cameras for handedness. The retrieved paper text does not fully join camera count, role, pose, synchronization, calibration and raw-frame identity into one acquisition record. Do not silently rewrite the Methods as a two-camera setup or infer an error.

Required composition chain:

\[
\text{3D vortex boundary/mode field}
\to \text{camera projection(s)}
\to \text{image/contour extraction}
\to (r_0,r_\pi)
\to (\eta,a)
\to S_\eta(\omega,k),S_a(\omega,k)
\to \text{mode/branch inference}.
\]

Each arrow needs a declared map, coordinate convention, calibration, uncertainty and provenance. The mode classifier must state which information it uses beyond the two-scalar readout.

## 3. Lean formalization and exact verification boundary

Existing draft PR: [#1189 — Nadir affine-translation quotient](https://github.com/Satobloc/HsH/pull/1189). Existing branch: `research/nadir-affine-translation-quotient-20261101t0324z`.

### Verified base result

At head `9725a202547bfa5533e8769ff770179b6b583d21`, exact-head Actions run [#41894452394](https://github.com/Satobloc/HsH/actions/runs/41894452394), job `126800130144`, checked out the exact head and completed the full Lean 4.34.0 / Lake 5.0.0 root build (8,954 jobs). The target module `NadirVortexTwoChannelReadout.lean` built. The two theorem-specific outputs for `antipodalModeReadout_two_step` and `antipodalModeReadout_not_injective` list `[propext, Classical.choice, Quot.sound]`. The full job log contains zero `sorryAx` and zero `admit` occurrences. This is not an axiom-free result. Tests, lint, nanoda and a separate global axiom audit were skipped.

### New compositional result, not yet verified

New existing-branch commit: `47e3443d1ccb07ff4396fa9e33eb6cdfbf40e4b7`; new file blob: `72adfae89a7edb0f4d89b2122eeb22dd50f1fa18`.

Two declarations were added:

- `downstreamModeClassifier_two_step`: any deterministic function of the paired antipodal readout preserves the \(m\leftrightarrow m+2\) alias.
- `downstreamModeClassifier_not_injective`: no deterministic classifier whose only input is that paired readout is injective on the finite mode set \(\{0,1,2,3\}\).

This is a concrete composition gate: a downstream deterministic calculation cannot restore a distinction already collapsed by the upstream measurement map. Additional raw image/view/spectral inputs are not covered by the theorem and may contain information absent from the two-scalar readout.

Exact-head run [#41927513429](https://github.com/Satobloc/HsH/actions/runs/41927513429), job `126915668961`, has passed checkout identity for commit `47e3443d1ccb07ff4396fa9e33eb6cdfbf40e4b7`. At publication time, Lake dependency-manifest generation remains IN_PROGRESS and Lean compilation has not started. Status is **SUBMITTED_NOT_VERIFIED**. No proof-success claim is made for the two new declarations; do not dispatch a duplicate run.

A separate push-triggered conversation-JSON workflow ended without jobs and is not a Lean result. A Vercel deployment status reports a 24-hour build-rate limit; it is unrelated to the Lean proof job.

Lean verifies only the formalized mathematical statement. It does not validate the source-to-symbolic translation, the camera pipeline, the physical premises, or the observed mode assignment.

## 4. Data and physical boundary

The article declares source data at Figshare DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The exact version metadata, file inventory, raw contour arrays, acquisition logs and checksums remain unretrieved. No sample-level reanalysis or covariance propagation is claimed.

The paper reports typical contour-position/core-radius uncertainty around 0.1 mm, PIV circulation uncertainty around 0.005 m² s⁻¹, and PTV vertical-velocity uncertainty around 0.05 m s⁻¹. These published typical uncertainties do not supply the missing sample-level joint covariance.

No physical calculation, fit, prediction, holdout, or independent measurement was performed. The classical air–water vortex is a measurement-method candidate only; it is not an H(s)H worldtube, responsive-medium identification, or physical equivalence. The H(s)H geometry-to-core and core-to-instrument maps remain undefined. P2 issue #565 remains SELECT REAL SYSTEM + SOURCE MATH / HOLD; this system is not selected.

## 5. Next cursor

1. Retrieve the exact Figshare version, file inventory, raw arrays and checksums.
2. Reconcile camera count/role, lens use, pose, synchronization and calibration from acquisition records.
3. Recover the image-to-contour and contour-to-\((\eta,a)\) implementations.
4. Determine whether \(\eta\) is a full geometric centerline estimator or only the stated odd-parity two-point projection; establish how higher odd modes are excluded or separately identified.
5. Recover the spectral and dispersion mode-classification procedure and its raw inputs.
6. Obtain joint covariance and reserve an independent acquisition/forcing-condition holdout before any new fit.
7. Verify exact-head run #41927513429 on commit `47e3443d1ccb07ff4396fa9e33eb6cdfbf40e4b7`; inspect both new theorem-specific axiom outputs and the complete build log. If it fails, repair only the existing PR branch and do not duplicate the run.

No P2 system selection, physical prediction, Factory Floor admission, BEDROCK promotion, or paper-gate advancement is proposed.
