# M87* Polarimetric Mode Readout: Uniform-Phase Null and the Worldtube-to-Stokes Gap

**Status:** source-grounded external-observable note. No H(s)H physical prediction or fit. No raw-data reanalysis. Lean formalization draft exists but is LEAN_NOT_RUN.

## Executive result

The Event Horizon Telescope Collaboration's M87* polarimetric observations from 2017, 2018 and 2021 provide an external observable for a future H(s)H geometry-to-radiation test. They do not directly measure a 4D worldtube, its torsion, material-frame twist, finite-core thickness or a contact surface.

For the finite-pixel polarization-mode operator, a spatially uniform unit-modulus phase applied to every complex linear-polarization pixel multiplies every azimuthal mode coefficient by that same phase and preserves every mode magnitude. Thus, with fixed image kernel and annular Stokes-I normalization, a measured change in |β₂| cannot be caused by a purely spatially uniform EVPA/Faraday rotation alone. This does not exclude spatially varying Faraday rotation, changing emission-region weights, intrinsic field evolution, image-kernel changes or standard GRMHD/radiative-transfer explanations.

The missing H(s)H composition is explicit: no source-grounded map currently takes a 4D filament/worldtube (or its twist/thickening) to electromagnetic current, magnetic-field orientation, synchrotron emissivity, Stokes Q/U, Faraday depth and finally β₂. EVPA helicity is therefore not yet worldtube twist. M87* polarimetry is also not a direct test of the recovered Newtonian-limit worldtube-inertia claim; it is a strong-field accretion-flow/emission readout.

## 1. Standard measurement and data provenance

EHT Collaboration et al. (2025), “Horizon-scale variability of M87* from 2017–2021 EHT observations,” Astronomy & Astrophysics 704, A91, DOI 10.1051/0004-6361/202555855, defines complex linear polarization P = Q + iU = I|m|e^(2iχ) and the azimuthal mode coefficient

β_m = (1/I_ann) ∫ P(ρ,φ) exp(−imφ) ρ dφ dρ.

The phase of β₂ is an EVPA-helicity observable. Its interpretation as electromagnetic energy-flow direction is conditional on the paper's Faraday and orientation assumptions; it is not a direct measurement of geometric torsion.

Official EHT data products identified:
- 2023-D01-01: calibrated 2017 M87* polarimetric data, DOI 10.25739/q46m-m857.
- 2026-D01-01: calibrated 2018 and 2021 polarimetric data, CyVerse collection EHTC_M87-2018+2021_Jul2026, catalogue update 2026-06-29.

The raw UVFITS/calibrated files were not downloaded, recalibrated or re-imaged. The calculations below use published method-ensemble ranges.

| Epoch | |β₂| (%) | angle β₂ (degrees) |
|---|---:|---:|
| 2017 Apr 11 | 4.5–5.5 | −141 to −128 |
| 2018 Apr 21 | 0.5–2.0 | −156 to −99 |
| 2021 Apr 18 | 1.8–3.9 | +156 to +168 |

The 2017 and 2021 amplitude ranges are disjoint. Conservative interval arithmetic gives

|β₂|₂₀₂₁ / |β₂|₂₀₁₇ ∈ [1.8/5.5, 3.9/4.5] = [0.3273, 0.8667],

with ratio of epoch midpoints 0.57. Unwrapping the 2021 phase interval by −360° gives a 2017-to-2021 phase-difference envelope of −76° to −51°, midpoint −63.5°. The 2018-to-2017 phase envelope is −28° to +42° and includes zero. These are interval envelopes over published method ranges, not joint posterior intervals, p-values or independent Gaussian confidence intervals.

The paper describes m=1 as broadly more stable while m=2 changes, subject to method-specific caveats. It reports a broadly stable ring diameter (combined estimate 43.9 ± 0.6 microarcseconds). Stable ring scale is not worldtube thickness. A two-component Faraday-screen model can make de-rotated m=2 phases consistent across epochs, but with large uncertainties. Unresolved ALMA rotation measures are not direct measurements of the approximately 40-microarcsecond core Faraday depth.

## 2. Exact finite-pixel null

For a pixelized image, β̂_m = I_ann⁻¹ Σ_j k_j P_j, where k_j packages pixel-area and angular weights and P_j = Q_j + iU_j. A uniform EVPA rotation gives P′_j = zP_j, z = exp(2iΔχ), |z| = 1. With fixed kernel and normalization, linearity gives β̂′_m = zβ̂_m and |β̂′_m| = |β̂_m|.

This is exact for any finite pixel set and every m. The continuous-integral analogue follows from linearity of integration but is not formalized in the current Lean module. A spatially varying Faraday factor z_j cannot be factored out and can change both phase and amplitude.

## 3. Source-critical H(s)H boundary

Recovered user-authored source exports:

- “DIMENSIONAL GRAVITY,” blob 2cea1924266418e19b825b95ae51e6b7cbace7e1 (2024-03-22/23): line/plane intersection picture and later references to four-dimensional structures interacting with a time surface. The recovered 2024 user text does not fully type the time surface as a 3D manifold.
- “Meridian Free Build,” blob 7af1561b321f4d9364da5eb111df689efc652827:
  - Message 3c657387-b80b-4982-a61a-8e6d8568b8d1, 2026-10-09T01:50:55Z: worldtube resistance to changes in motion is identified with inertia; at the Newtonian/Minkowski limit the user says worldtube shape is determined by force and mass and curvature corresponds to inertia by construction. Direct model claim, not a derivation.
  - Message 5a929b5e-515e-4f77-a32a-e49feef42812, 2026-10-09T02:46:38Z: the >>-prefixed “No elastic modulus” and d²x/dw² lines are quoted assistant text, not independent Nathan Direct evidence. The unquoted user text directly describes the time surface as a 3D slice/bulk overlapping the xyz bulk as wxyz and interacting with matter, not a passive readout; it calls time “moving space.”
  - Message 1178f25c-9f92-4d1c-b43b-06482e6bf1b1, 2026-10-09T07:40:38Z: the approximately 0.7-fm scale is first-order coil radius/scale, not filament thickness. It distinguishes ℓ_f from worldtube scale ℓ; “diameter” versus “axis-to-circumference length” leaves the radius/diameter convention unresolved. It distinguishes a 4D filament from a 3D intersectional trace and says 3D self-closure should not be assumed.
- “Minkowski Ring Analysis,” blob 56a84cb85d5c386efa4ea11d322d11e95e2c7703:
  - Message f658b2db-32f0-45cd-828b-140691cc9afb, 2026-10-20T23:53:30Z: “4D curvature of the donut is an acceleration” is explicitly an unproved working hypothesis.
  - Message 090f5160-1020-486d-9c42-df3d7dff2063, 2026-10-21T00:17:23Z: the reciprocal filament/timesheet-deformation construction is explicitly no longer current; the Klein Fabric model has become common.
  - Message c5525f53-b7cc-4444-8102-3bf6fdb1c892, 2026-10-21T13:55:40Z: direct cw=t, Forest Normalization and (++++) statement; the (c+H₀)/2 expression remains shorthand pending a proper unit-consistent form.

The 2026-10-29 TOPLESS intake note, blob 74ce884326a25877dd226977a1c91eb016174893, is an abbreviated index, not a verbatim transcript. Its raw conversation title/ID, message UUIDs, role graph and attachment locator remain unrecovered. Its w=ct wording conflicts with the recovered 2026-10-21 cw=t source; no normalization or metric correction is made here.

| Feature | Status |
|---|---|
| 4D filament distinct from 3D intersectional trace | Direct conceptual commitment |
| 3D time-surface/bulk interaction | Direct 2026-10-09 statement; interaction law unspecified |
| Newtonian-limit worldtube resistance associated with inertia; general morphology constrained by force/mass | Direct model claim; not independently proved |
| First-order coil scale distinct from filament thickness | Direct 2026-10-09 correction |
| Finite-core thickness parameter ε | Provisional; 2026-10-29 raw source and metric cross-section missing |
| Centerline helix, hollow outer winding, topological aperture | Provisional 2026-10-29 intake note; raw source missing |
| Material-frame twist/normal-bundle connection | Not specified; optional until defined |
| Physical contact surface/contact law | Not forced by a 3D bulk interaction |
| “4D curvature = acceleration” | Working hypothesis explicitly unproved |
| Reciprocal filament/timesheet deformation | Retired by 2026-10-21 direct statement |
| cw=t versus w=ct | Unresolved notation conflict |

A candidate typed chain (proposal, not Nathan Direct) is γ ⊂ M⁴, Σ_t³ ⊂ M⁴, with γ ∩ Σ_t zero-dimensional when transverse. If a finite tubular neighborhood U_ε(γ) is separately defined, then V_t = U_ε(γ) ∩ Σ_t is a candidate 3D slice-volume and S_t = ∂_{Σ_t}V_t a candidate 2D slice-boundary under regularity/transversality assumptions. The point intersection, finite-volume overlap and boundary surface are different objects; no source currently selects one as the “mouth.”

## 4. Test architecture

The required H(s)H forward map is W₄D → (EM current, B^μ, n_e, T_e, …) → P_ν(x,y) → P_obs_ν(x,y) → β_m(ν,t), including sky projection, synchrotron/general-relativistic radiative transfer and Faraday propagation. The first map is missing. The standard comparator is GRMHD plus synchrotron radiative transfer and a spatially structured/two-component Faraday screen.

| Hypothesis | Calibration/shared parameters | Holdout | Observable | Falsification |
|---|---|---|---|---|
| Source-fixed H(s)H geometry contributes to m=2 phase | Frozen geometry, sky projection, pixel kernel, annulus, Stokes-I normalization, EVPA convention and Faraday nuisance model | 2021 is only a retrospective holdout here; prefer a genuinely prospective epoch/frequency | angle β₂, |β₂|, other mode phases, RM frequency dependence | Reject if frozen model's held-out predictive region excludes measured modes after predeclared instrument/Faraday treatment; no epoch-specific retuning |
| Finite-core thickness causes a depolarization/mode-amplitude signature | Source-defined ε, projection, beam, annulus, electron density, field and frequency response | Independent frequency/epoch | |β₂|, mean fractional polarization, radial Stokes profiles | Reject if no single source-fixed thickness predicts held-out multi-band profiles within propagated uncertainty |
| Contact boundary produces a distinct edge | Explicit boundary/contact law and projection; calibrated Stokes I/Q/U and RM | Independent epoch/frequency | Resolved edge/discontinuity in Stokes or Faraday-depth maps | Not active until a source requires contact and predicts a resolvable signature |

No numerical falsification threshold is selected: the H(s)H forward model, raw-data covariance, imaging transfer function and independent holdout are not yet available. Current published-range arithmetic is a benchmark, not a fit or prediction.

## 5. Lean status and reproducibility

A finite-pixel module was added to the existing Lean 4.34.0/Mathlib project:
- Branch research/worldtube-polarization-mode-rotation-20261103t0336z.
- Draft PR #1296, base infra/lean4-verification-20261023.
- Head a673f1a38f9bacae42fe5e31807192cd64f2857a; merge reference 856a117fd57e19880b58b763db20403c996025bf.
- The module states uniform-phase covariance, unit-modulus amplitude invariance and the conditional no-go corollary; theorem-specific #print axioms commands are present.

**LEAN_NOT_RUN.** PR #1296 has no status checks. The available Lean workflow is on the non-default infra branch but absent from default main; opening the draft PR did not schedule it. The available GitHub connector has no workflow-dispatch action and no local Lean/Lake/Elan executable was found. A corrective PR comment records the no-run status. The module is a formalization candidate, not a Lean-verified proof. No sorry or admit was intentionally added, but their absence has not been checked by Lean.

The Decimal interval script completed 5/5 assertions. This verifies only the arithmetic over published ranges, not the Lean theorem or any physical model.

No SAT-O or Blockwave equation was copied, rewritten or corrected. Their original equation-source provenance remains on the existing Mersearch/source-audit route; no equation attribution or correction is proposed here. All Mersearch lanes remain occupied and no new request was opened.

## Next cursor

1. Obtain an authorized exact-head or clearly identified merge-ref Lean execution route and independently review the module.
2. Recover the raw 2026-10-29 TOPLESS message and attachment locator; preserve the cw=t / w=ct discrepancy until resolved from originals.
3. Define the source-faithful Klein-Fabric/worldtube-to-EM/Stokes/Faraday composition.
4. Retrieve calibrated 2017/2018/2021 data and full uncertainty/covariance products; freeze the model and test a genuinely held-out epoch/frequency against GRMHD plus spatially structured Faraday rotation.

No H(s)H prediction, fit, BEDROCK promotion or paper-gate advancement is claimed.
