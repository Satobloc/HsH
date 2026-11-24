# Mercer h949:s2 | Kelvin-vortex resolution boundary, readout typing, and source custody

**Nominal source time:** 2026-11-19T13:24Z  
**Ring selection:** h=949; seq=4747; index 16 = Mercer; next index 17 = Ravel.  
**Disposition:** bounded one-run Lane 24 overlay. The standing Mercer P0 Paper A/B presentation-QA assignment is unchanged. No authenticated current Mercer worker thread is established.

## Executive result

The published WKBJ estimate for Kelvin-wave spectral broadening reproduces to **7.973708 m⁻¹**, but the same experiment's 12.5 cm axial window has a nominal Fourier-bin spacing of **8 m⁻¹**. The estimate is therefore **0.9967 of one nominal wavenumber bin**.

This does not prove that the observed broadening is an instrumental artifact. It does mean that the published first-order broadening estimate is at the nominal resolution boundary and is not cleanly separable from finite-window broadening without the actual spectra, windowing details, and uncertainty analysis.

The paired contour readout is exactly invertible for its two sampled contour values. It is not an injective reconstruction of the full azimuthal core boundary. Existing exact-head Lean work proves the paired inverse and single-side non-injectivity; it does not prove a physical worldtube reconstruction.

## 1. Historical Mercer remit and current authority

The recovered historical source is the raw `Quantum Gravity and Experiments` conversation, ID `6a3a2037-3698-83ea-924d-2cb8c4ac7701`, blob `d828fef5352045cb4d9486fdbeabd04043c4c119`. Nathan's direct user message `bb8ecf64-8863-4ee7-a078-ca8cc4104974` assigns the historical Mercer slot equations, dimensional analysis, constitutive physics, coarse-graining, forces, and quantitative consequences. It authorizes exploratory derivation while requiring source material to remain distinct from new invention. This is a historical direct assignment, not a signed standalone Mercer charter or an authenticated current Mercer thread.

The live Code Grurple roster still gives Mercer the standing P0 Paper A/B presentation-QA assignment. This Lane 24 work is treated only as a one-run overlay. No P0 manuscript, PDF, site, or route action was performed; no permanent role change was made.

## 2. Measured system and source provenance

Primary experimental source: Barckicke, Falcon and Gissinger, *Kelvin wave propagation along vortex cores*, Nature Physics (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). The paper identifies a public Figshare deposit, DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347), for data supporting the findings, including data used to compute the spatiotemporal spectra.

The methods report a 12.5 cm axial observation window, 300 fps imaging over 30 s, 60 µm/pixel, typical local core-radius/position uncertainty about 0.1 mm, PIV circulation uncertainty about 0.005 m²/s, and PTV vertical-velocity uncertainty about 0.05 m/s. The paper reports a wavenumber resolution of 8×2π m⁻¹, equivalent to 8 cycles/m.

The Figshare locator was verified in the article, but the deposit's exact version, file inventory, file hashes, acquisition/run IDs, and whether it contains raw contours, spectra only, or PIV/PTV records were **not retrieved**. No raw dataset bytes were acquired. The public deposit is a locator, not an acquisition receipt.

The paper's Figure 3 parameter set is a₀=1.9 mm, Γ=0.022 m²/s, and v_z=0.57 m/s. The methods say Γ and v_z are fitted to the spectral dispersion relation and checked a posteriori against independent PIV/PTV measurements. Thus the dispersion comparison is fit-conditioned with independent measurement cross-checks, not a blind holdout prediction. The reported PIV uncertainty is a scale estimate; no complete joint covariance for Γ, v_z, and a₀ was recovered.

A separate 2026 PRL follow-up, DOI [10.1103/t3bt-m431](https://doi.org/10.1103/t3bt-m431), is not the same data product. Its paper states that no research data or software are publicly available. Its Fig. 2 uses Γ=0.018 m²/s and a₀=1.47 mm; Figs. 3–5 use a₀=1.3 mm. These figure-specific parameter sets are kept separate, not averaged. The text defines v_z as downward-positive, while the Fig. 2 caption prints v_z=−0.63 m/s. This is an unresolved within-paper sign-convention discrepancy, not grounds to silently flip the value.

## 3. Source-reproduction calculations

### 3.1 Core rotation scale

Using the Nature paper's Fig. 3 values and the Rankine-core definition Ω₀=Γ/(2πa₀²):

- Γ=0.022 m²/s (dispersion-fit parameter, checked against PIV)
- a₀=1.9×10⁻³ m (measured mean core radius)
- Ω₀=969.919 s⁻¹
- 1/Ω₀=1.031 ms
- 2π/Ω₀=6.478 ms

Holding a₀ fixed, the reported approximate PIV circulation-uncertainty scale δΓ≈0.005 m²/s gives δΩ₀≈220.4 s⁻¹. This is a sensitivity propagation, not a complete standard uncertainty: no joint covariance is supplied, and the paper describes the 0.1 mm value as a typical local contour uncertainty while the mean-a₀ uncertainty is reported as negligible.

For the separate PRL Fig. 2 parameter set, Γ=0.018 m²/s and a₀=1.47 mm give Ω₀=1325.739 s⁻¹. With the separate 1.3 mm radius used in Figs. 3–5, the same Γ gives Ω₀=1695.141 s⁻¹. These are derived scales from different figure-specific inputs, not independent rotation measurements.

### 3.2 Reproduction of the published WKBJ broadening estimate

The Nature paper gives the first-order relation

\[
\frac{\delta k}{k_0}
\left[2\ln\!\left(\frac{2}{k_0a_0}\right)-1-2\gamma_E\right]
=\frac{\delta a}{a_0},
\]

with a₀=1.9 mm, δa=1 mm, and k₀/(2π)=25 m⁻¹. Using γ_E=0.5772156649015329:

- k₀a₀=0.2984513021
- δa/a₀=0.5263157895
- logarithmic bracket=1.650160034381
- δk/k₀=0.3189483314
- δk/(2π)=7.973708284 m⁻¹

This reproduces the paper's rounded estimate of approximately 8 m⁻¹.

### 3.3 Resolution-boundary finding

For the reported axial window L=0.125 m, the nominal Fourier spacing in cycles/m is 1/L=8 m⁻¹. Therefore

\[
\frac{\delta k/(2\pi)}{1/L}
=\frac{7.973708284}{8}
=0.996713536.
\]

The predicted broadening is essentially one nominal Fourier bin. The central wavenumber 25 m⁻¹ is only 3.125 such bins from zero.

The source also uses a first-order amplitude variation δa/a₀≈0.526. The long-wavelength condition k₀a₀≈0.298 is below one, but the radius-variation amplitude is about 53% of the mean radius. The first-order estimate is appropriately treated as rough, not as a controlled error bound. The WKBJ condition also depends on the actual axial gradient profile, which has not been recovered as raw data.

**New measurement implication:** the claimed broadening should not be treated as independently resolved from finite-window spectral width until the actual spectra, taper/window function, axial profile, and acquisition-level uncertainty are inspected. A longer axial baseline or an explicitly modeled spectral window is needed to separate physical broadening from resolution broadening.

## 4. Observation map and Lean verification

The paper's paired contour readout is

\[
\eta(z,t)=\frac{r_0(z,t)-r_\pi(z,t)}{2},
\qquad
a(z,t)=\frac{r_0(z,t)+r_\pi(z,t)}{2},
\]

with inverse

\[
r_0=a+\eta,\qquad r_\pi=a-\eta.
\]

This preserves exactly the two antipodal sampled contour values. It does not reconstruct a general angular boundary r(z,t,θ). For example, adding ε(z,t)sinθ leaves the samples at θ=0 and θ=π unchanged while changing the boundary elsewhere. That explicit sine perturbation is a mathematical counterexample in this report, not a new Lean theorem.

The relevant existing formalization is [PR #873](https://github.com/Satobloc/HsH/pull/873), exact head `94b6d96c91806a95505260a3c52220f4af294185`. Exact-head GitHub Actions run [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878), job `134062868110`, succeeded with Lean 4.34.0/Lake 5.0.0 and 8,956 build jobs. The log shows `KestrelKelvinVortexReadout` and `KestrelProjectedIncidence` built. The paired readout/inverse theorems and single-side non-injectivity theorem ran; theorem-specific axiom output uses only `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` appeared in the retrieved log. Tests, lint, nanoda, and the separate global axiom audit were skipped.

The WKBJ Lean theorem is conditional on the logarithmic bracket lying between 1.650 and 1.651. Python independently evaluates the bracket as 1.650160034381; Lean does not prove the logarithm interval. The theorem therefore proves the conditional rational bound, not the physical inputs or their translation.

No local `lean` or `lake` executable is installed in this runtime. The existing exact-head CI is reused; no new module, PR, branch, or tooling was created.

### Typed forward and reverse map

A candidate finite-core worldtube could be represented conditionally as

\[
\mathcal W=\{(x,y,z,t):(x-\eta_x(z,t))^2+(y-\eta_y(z,t))^2\le a(z,t)^2\}.
\]

This expression requires a specified two-component centerline and a cross-section model. The experiment supplies paired contour readouts and selected orthogonal views, not a complete volumetric reconstruction of every angular cross-section. The paper also distinguishes m=1 displacement from m=2 and other radius/shape modes.

The forward chain is therefore only partially observed:

\[
\mathcal W
\to r(z,t,\theta)
\to (r_0,r_\pi)
\leftrightarrow(\eta,a)
\to(S_\eta,S_a)
\to(\omega,k).
\]

The paired linear transform is invertible on its two samples. The full reverse map from the sampled fields or spectra to a unique 4D worldtube is not established without angular sampling, a boundary/axisymmetry model, calibration, and run identity.

An H(s)H test must specify this projection and composition chain before comparing equations. The H(s)H alternative must make a held-out prediction outside the one-bin resolution floor and not merely re-fit Γ, v_z, a₀, or window/calibration nuisance parameters.

## 5. SAT-O / Blockwave source custody

Mersearch-first retrieval was attempted conceptually but no callable Mersearch connector is exposed in this runtime, no local stable-1.0 checkout/executable was found, and all four canonical request lanes remain occupied/requested. The following is bounded GitHub fallback across HsH and the SAT archive, not a Mersearch result.

| Source | Exact identity and date | Equation / status |
|---|---|---|
| Legacy `SAT_O1.pdf` filename | Actual title **SAT20: Emergent 4D Filament–Surface Theory**; source PDF SHA-256 `fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d`; archive creation-date families 2025-06-03 and 2025-06-09; content-version date/author not established. Extracted text blob `bd244e49c6b668a72131b4f195e32820d4540746`, extraction 2026-09-10T16:03:13Z. | Vector filament current `J^μ(x)=Σγ∫dλ v^μ(λ)δ⁴(x−γ(λ))`; `τ_μ∝J_μ`; `dφ=τ_μdx^μ`; `g̃_μν=⟨v_μv_ν⟩`; `S_filament=−T∫dλ√(g_μνv^μv^ν)`. This is SAT20, not the SATO.4D O1 TeX. |
| SATO.4D Coherence Project O1 TeX | Blob `9a07893cf596e190486df17503626327d6023caa`; byline “SATO.4D Coherence Project”; date June 2025. | Hyperhelical 1D curve `γ^μ(λ)=(λ,A_x sin(k_xλ+φ_x),A_y sin(k_yλ+φ_y),A_z sin(k_zλ+φ_z))`; `v^μ=dγ^μ/dλ`; resolving surface `Σ_t`. It calls the swept object a worldtube but supplies no sweep/thickening map. |
| Nathan-byline SAT4D Live Draft | Blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`; author Nathan McKnight; date June 2025; explicitly internal draft. | Contains a related 1D hyperhelical curve and line Lagrangian. It is a separate document from the SATO.4D Project O1 TeX and from the SAT20 PDF. |
| Unbylined `SAT O1 4D.txt` | Blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; file-index last-write 2025-06-09 18:44:50, timezone unspecified; body has no byline. | `L=½ m v^μv_μ−V_tension(γ)`. Preserve as an unbylined source, not a verified Nathan Direct equation. |
| Original uploaded Blockwave artifact | Raw conversation `68c990dd-df28-832e-b766-c267190aaffa`; attachment `file-LwaFTKkMemPPrLU4qCLpYB`; event 2025-09-16T16:31:34.670358Z; file SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`; Git blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`. | Verbatim J2 representation `J^{μν}=½ ε^{μνρσ}∇_ρB_σ`, with `∇_μJ^{μν}=0`; equation-string SHA-256 `1f4edaaeda6691caf331b0b760db642ec0314a69bad6e02095600820b9dd6cf5`. Classification: user-supplied artifact, embedded content authorship unresolved, not Nathan Direct. |
| 2025-09-18 J3 editorial track | Raw conversation `68cad3d4-0ccc-8325-be36-94c5b5527997`; Nathan Direct rank-mismatch correction at 14:42:25Z and 3-form preference at 15:08:14Z; editorial decision message `e92efb17-2499-482e-b930-9ad11221bd7c` at 15:19:27Z. | The first J3 topological-term fragment `θ ε^{μνρσ}∂_μJ_{νρσ}` was assistant-generated, SHA `9daa1071de1eb94c175624148aabce4ac4d084539c5df2b098c7f9a367e5dc94`. Initial assistant dual with ½, SHA `80f1d1b602dccd9d256b2758960f8515372918c8f430ed28a4418fef2e04abd7`, was corrected by assistant to `J̃^μ=(1/3!)ε^{μνρσ}J_{νρσ}`, SHA `84479022ad5d98e154606803b3683f91718ab407f50e23393b3c154a16d76bfb`. The editorial preference is Nathan Direct; these equation fragments are assistant-authored. |

In four dimensions, the Hodge degree map is 2-form→2-form and 3-form→1-form. The archived assistant sentence “2-forms and 3-forms are Hodge duals” is false; its sentence hash is `646a92dba173bbac54055cbacfef0db060b7893984880ae9c612cb60b8ecaf7b`. Poincaré-dual support degree is separate: a 1D worldline has a 3-form dual, while a 2D worldsheet has a 2-form dual. No sweep/push-forward map connecting the SAT-O1 curve, SAT20 vector current, Blockwave J2 worldsheet current, and later J3 editorial track is established.

The 2025-10-19 Blockwave composite action is a separate assistant reconstruction, not the original 2025-09-16 attachment and not a Nathan Direct equation.

## 6. Contact-mechanics comparator

Sabater et al. (2026), [Frictional sliding strength of knotted and capstan configurations along the axis of a cylinder](https://doi.org/10.1016/j.jmps.2026.106628), reports actual braided climbing-rope experiments: 4.0 mm rope radius, effective bending stiffness 0.4×10⁻³ N·m², friction coefficient 0.28, 50 g–10 kg hanging masses, 1 mm/s cylinder translation, and five measurement repetitions. The reported transition depends on coupling between normal contact force and evolving contact-arc length.

This is a separate material-contact system and a first-blush mechanical heuristic only. It does not establish rope universality, a fluid-vortex equivalence, or an H(s)H law.

## 7. Lane 24 test gate

The Kelvin-vortex system remains a candidate, not a selected P2 system. P2 issue #565 remains HOLD.

Next admissible sequence:

1. Retrieve and version-pin the Figshare deposit; hash every file and identify whether it contains raw contours, spectra, PIV/PTV records, calibration, and acquisition IDs.
2. Establish the exact axial radius profile a(z), spectral window/taper, and run-level covariance.
3. Reproduce the published spectrum on one acquisition block, then freeze a genuinely independent acquisition block as holdout.
4. Compare the standard Rankine dispersion relation against an H(s)H model with a typed worldtube→boundary→readout map and identical fit budget.
5. Require an H(s)H residual or broadening prediction that survives the one-bin resolution floor and cannot be absorbed by Γ, v_z, a₀, or calibration nuisance parameters. Otherwise record a null/non-identifiable result.

No raw data, independent holdout, physical H(s)H prediction, or new measurement was obtained in this run. No CODATA numerical comparison is appropriate for this fluid-mechanics calculation; the inputs are experiment-specific Γ, a₀, v_z, and spatial-window measurements. NIST CODATA 2022 Version 9.0 was not used.

## 8. Tooling and project controls

The Mersearch stable-1.0 route is documented, but no callable connector or local checkout/executable is available here. All four existing Mersearch request lanes remain occupied/requested; none was overwritten or retriggered. GitHub search/readback across HsH and SAT archive was a bounded fallback. HSH_RESOURCES root/AI navigation was read; no restricted payload was opened. The HsH, SAT archive, and HSH_RESOURCES front doors were checked.

Math Hopper issue #578 and PR #991 were inspected: the extraction adapter is committed, but the full three-repository scan and exact CI/source-coverage gate remain NOT VERIFIED. Whirligig Kernel 0 remains explicitly SANDBOX ONLY; its restricted two-plane encoder is not a general equation-to-curve encoder or an H(s)H equivalence. SciSpace is available; external source research this run used the web sources cited above. No new tool, fork, dependency, subscription, paid API, or expense was introduced. The existing Kestrel Lean PR was reused; no new theorem, module, PR, or branch was created.

Final HsH main readback: `a077087b3f1efa4f5d651114840f3dad1a1d2f46` (2026-11-19T13:30:49Z).

Project status remains P0 ACTIVE; P1 Orson cognition OVERDUE / NOT READY / Orson-owned; P2 HOLD; P3 INCOMPLETE. FIE next review November 24, last reviewed November 10, so not yet due. The unrelated-reading return cursor remains Enheduanna annotated translation line 151; the reading quantum is not due. Task graph remains 16 declared branches against 18 records. No task, ID, schedule, phase, or cadence change; no sixth task. No theory promotion.
