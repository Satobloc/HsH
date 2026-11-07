# Two-channel vortex readout: source-to-observable and incremental-distinguishability gate

**Date:** 2026-11-07  
**Status:** DESIGN ONLY · SOURCE-ANCHORED · NO RAW-DATA REANALYSIS · NO P2 SELECTION · NO THEORY PROMOTION

## 1. Purpose and epistemic labels

This note adds a test-design layer to the existing Nadir two-channel readout formalization. It does not reopen or modify the independent all-plus SO(4)/stacked-holonomy playground.

Primary standard reference: Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), version of record 2026-02-10, DOI 10.1038/s41567-026-03175-w. The experiment is a **classical air–water bathtub vortex**, not a superfluid vortex and not an H(s)H measurement. The paper identifies a companion Figshare dataset, DOI 10.6084/m9.figshare.30903347.

Labels used below:
- **Source fact:** stated in the published article.
- **Standard comparator:** the article's classical hollow-core/Rankine Kelvin-wave model.
- **Existing formalization:** assistant-authored Lean statements in Nadir PR #1189.
- **H(s)H extension:** a proposal that must supply its own equation and observable map.
- **Independent measurement:** not performed in this run.

The Figshare DOI is identified, but the item metadata, file inventory, version, raw bytes, acquisition manifest, checksums and joint covariance were not retrieved. Searches of the three project repositories found no local copy. The data are **not retrieved**, not proven absent. All values below are published-summary values, not a reanalysis of raw samples.

## 2. Source-defined acquisition and observation chain

The article supports the following partial map. Each arrow is a distinct operation; the whole composition is not yet source-complete.

| Stage | Domain → codomain | Source-defined operation and evidence | Status / missing information |
|---|---|---|---|
| Physical system | Classical fluid state → air–water vortex interface | Finite air core in a draining water vortex; the interface is a sharp optical boundary. | Source fact. No H(s)H ontology implied. |
| Optical acquisition | Interface → Basler image sequence | Basler acA2040-120um, 2064×1564 px, camera normal to vortex axis; 8 mm and 12 mm lenses provide complementary views. | Camera intrinsics, distortion, extrinsics and lens-to-lens registration are not supplied in the retrieved Methods. |
| Contour extraction | Image sequence → left/right profiles r₀(z,t), rπ(z,t) | Reflected-light contour; 300 fps, 30 s typical recording; 12.5 cm axial window centred at z = 22 cm; 60 μm/px; 0.5 mm contour width; typical pointwise position/radius uncertainty about 0.1 mm. | Processing implementation, contour covariance and full calibration record remain missing. |
| Two-channel readout | (r₀,rπ) → (η,a) | η(z,t) = [r₀−rπ]/2, a(z,t) = [r₀+rπ]/2. | Exact algebraic map; see existing Lean result below. |
| Spectral readout | (η,a) → (Sη,Sa) | Two-dimensional Fourier analysis in z and t. The paper states that both left/right profiles contain every mode, then uses position and radius channels to select m = 1 versus m = 0,2,3,… . | The complete image-to-mode classifier, including how the reported cross-view handedness check is performed, is not specified. |
| PIV parameter path | Fluid motion → vθ(r) → Γ | Separate Phantom V1840 top-view PIV camera at 6000 fps; 10 μm hollow-glass tracers; PIVlab; 37×23 grid, 2.7 mm spatial resolution; Γ = 2πr vθ(r); reported δΓ ≈ 0.005 m²/s. | PIV plane and grid are a separate acquisition product, not the Basler contour stream. The grid does not resolve an internal core profile at the reported millimetre scale. |
| PTV parameter path | Tracer trajectories → vz(z) | 1.5 mm expanded-polystyrene tracers tracked at r = a(z); reported δvz ≈ 0.05 m/s. | Full time registration and joint covariance with contour/PIV products are not supplied. |
| Model comparison | (a₀,Γ,vz,Ω₀,m,k) → ω(k) | Full Rankine-core dispersion, Eq. (2), with solid-body rotation inside the core, irrotational flow outside, uniform downward vz, and velocity/pressure continuity at the perturbed surface. The printed convention is ω̃ = ω + mΩ₀ + kvz, with vz positive downward. | The published fit procedure is fit-conditioned, not a blind holdout prediction. |

The Results refers to “two orthogonal cameras” for the m = 1 counter-rotation evidence. Methods identifies one Basler optical camera with two lens configurations and a separate Phantom top-view PIV camera. Those may be the two orthogonal views, but the paper does not explicitly connect the PIV view to the handedness classifier or specify synchronization, registration, calibration and the classifier. Treat this as **UNRESOLVED_SOURCE_MAP**, not a paper error. Do not assume a four-cardinal radial operator.

## 3. What the standard model already explains

The paper's long-wavelength hollow-core relation is Eq. (1), valid for ka₀ ≪ 1. At higher k it adopts the full Rankine-core Eq. (2), because the hollow-core expression omits axial flow. The Rankine model already contains a finite core radius, circulation, axial flow and a perturbed free surface with continuity conditions.

Published fit-conditioned examples:
- **m = 1:** U = 11 V, drain diameter d = 5 mm, a₀ = 1.9 mm, Γ = 0.022 m²/s, vz = 0.57 m/s. The source reports downstream and upstream bending branches.
- **m = 2:** U = 9 V, d = 7 mm, a₀ = 2.2 mm, Γ = 0.011 m²/s, vz = 0.85 m/s. The source reports a double-helix/fluted radius mode.

Crucial prediction-versus-fit distinction: Methods says a₀ = ⟨a(z)⟩z is measured, then (Γ,vz) are fitted to the dispersion data with Eq. (2), and that pair is checked **a posteriori** against PIV/PTV measurements. The published white curves are therefore fit-conditioned overlays with independent consistency checks, not a fully blind prediction from independently frozen parameters.

The paper also reports substantial axial variation in a(z) and uses a local WKBJ-type approximation; this contributes to spectral broadening. Surface-tension corrections are reported negligible relative to experimental uncertainty in the measured range. The m = 1 bending helix and m = 2 right-handed double helix are already standard Kelvin-mode shapes; neither is, by itself, evidence of an H(s)H internal twist or connection.

## 4. Forced versus optional geometry

| Geometric feature | What this experiment forces | What remains optional for H(s)H |
|---|---|---|
| Finite core / thickness | A finite, time-varying air-core radius a(z,t) and an air–water interface are directly measured. The standard Rankine model already uses a finite core. | Any additional thickness variable or internal radial structure beyond the measured a(z,t). It needs an independent radial-vorticity/velocity/profile observable; a redefinition of a₀ is not a distinguishing prediction. |
| Worldtube | Stacking the measured finite core through time gives a kinematic spacetime history of the core/interface. | An additional physical 4D medium, independent thickness field or new worldtube dynamics. Those are not measured merely by constructing the history of the observed core. |
| Twist / connection | Helical m = 1 and m = 2 mode shapes and counter-rotation are reported and are described by standard Kelvin-wave theory. | An internal director, normal-frame connection or holonomy. It requires a gauge-invariant cross-sectional orientation/phase-transport observable, not just a helical centreline or a right-handed mode shape. |
| Contact surface | The air–water interface is real, and the standard model already imposes velocity/pressure continuity at the perturbed surface. | A separate H(s)H contact layer or new boundary law. It must predict a residual beyond the standard free-surface conditions and capillary corrections. |
| Timesheet | The experiment supplies time-resolved a(z,t) and η(z,t) fields. | A separate physical timesheet field or coupling. It must predict a new temporal-memory or cross-channel signature, not merely relabel the Fourier time coordinate. |

**Minimal conclusion:** finite core and interface are forced by the measured system, but they are already in the standard comparator. Extra thickness, internal twist/holonomy, extra contact structure and independent timesheet dynamics are optional extensions until each is tied to a non-redundant observable.

## 5. Projection, information loss and parameter identifiability

The exact two-value transform is
\[
(r₀,rπ)\longleftrightarrow(η,a),\qquad
η=(r₀-rπ)/2,\quad a=(r₀+rπ)/2.
\]
It is invertible as a map between two real contour values and two real readouts. That does **not** make the preceding map from a full azimuthal mode field to two antipodal samples injective. Under the stated single-harmonic ansatz, the existing formalization exhibits m ↔ m+2 aliases. A downstream deterministic classifier fed only the two scalars cannot recover information already collapsed by that projection. The full images, spectra and cross-view information may contain more; the source-to-classifier composition is not yet specified.

The existing Nadir Lean module also contains a resolution-limited decoder bound. It can be used only after the readout and target metrics, units, measurement tolerance and decoder Lipschitz bound are supplied. The theorem does not manufacture those physical quantities.

Additional identifiability constraints:
- a₀ is a contour-derived mean over z ∈ [15.5, 28] cm; the article calls its mean-radius uncertainty negligible, while typical pointwise contour/radius uncertainty is about 0.1 mm.
- PIV uses a 2.7 mm grid and reports circulation near r ~ 1 cm. This does not resolve a new internal radial structure on the reported ~1–2 mm core scale.
- Γ and vz are fitted to the dispersion before the a-posteriori PIV/PTV consistency check. They must be independently frozen for a genuine holdout test.
- Axial variation a(z), local WKBJ broadening, camera projection and spectral-window resolution can mimic or absorb an added “thickness” parameter.
- A twist parameter is not identifiable without a calibrated director/phase observable. A contact parameter is not identifiable if its only effect is a capillary shift below the reported measurement uncertainty. A timesheet coupling is not identifiable if it only reparameterizes the fitted frequency or axial-flow term.

## 6. Incremental-distinguishability test matrix

This is a **pre-analysis design**, not an executed physical test. The raw dataset and joint covariance are still missing.

| Hypothesis | Shared parameters to freeze | Calibration / holdout | Predicted observable that must be specified | Standard comparator | Falsification / non-identifiability gate |
|---|---|---|---|---|---|
| H0: standard Kelvin/Rankine model | a₀, Γ, vz, Ω₀, a(z), mode, forcing and camera calibration | Obtain a₀ from contours, Γ from PIV and vz from PTV before scoring a held-out spectrum or propagation direction. | Sη(ω,k) for m = 1 and Sa(ω,k) for m = 2; upstream/downstream branches. | Source Eq. (2); Eq. (1) only as the low-k limit. | If the frozen-parameter model misses the held-out spectrum beyond the propagated prediction interval, reject H0 for that condition. This alone does not validate H(s)H. |
| H-thickness: extra core structure | Same shared parameters plus an independently defined radial-profile parameter | Calibrate the profile using a measurement that resolves the core interior; hold out a different z band or flow condition. | A radial profile or dispersion residual that cannot be absorbed into a₀,a(z),Γ,vz. | Full Rankine core with measured a(z). | If the added parameter only shifts a₀, it is non-identifiable. If no independently resolved radial profile or held-out residual exists, thickness is not established. |
| H-twist: internal frame/connection | Same shared parameters plus a defined director/connection variable | Calibrate camera orientation and a full azimuthal/cross-sectional director; hold out another view or propagation condition. | Gauge-invariant director rotation, phase transport/holonomy, or a preregistered cross-view phase relation. | Standard m = 1 and m = 2 Kelvin mode shapes and Eq. (2). | If the only evidence is a helical centreline or right-handed m = 2 shape, the extension is not distinguished. Absence of its preregistered signal on holdout falsifies that extension for the tested regime. |
| H-contact: extra contact/boundary law | Same shared parameters plus a separately defined surface/boundary parameter | Measure interface curvature/stress and relevant fluid properties; hold out a regime where the proposed boundary effect is resolvable. | A boundary-dependent dispersion or mode-coupling residual beyond standard velocity/pressure continuity and capillary corrections. | Rankine free-surface boundary conditions, including the source's capillary comparison. | The present source reports capillary corrections negligible in its range. No extra contact term is identified unless it produces a residual above the combined uncertainty in a suitable regime. |
| H-sheet: independent timesheet coupling | Same shared parameters plus an explicit sheet-coupling parameter | Require synchronized raw a(z,t) and η(z,t) arrays; calibrate on one time/forcing segment and hold out another. | A preregistered cross-spectrum Sηa, phase-locking or temporal-memory signature not already predicted by the standard model. | Standard Fourier spectra of a and η, with known nonlinear broadening considered. | If raw synchronized channels are absent, the test is unavailable. If the predicted signature is absent or lies inside the standard predictive envelope on holdout, the extension is not supported. |

For any eventual test, define a held-out residual vector r and total predictive covariance C = Cmeas + Cparam + Cmodel. A statistic such as Q = rᵀ C⁻¹ r is only a proposed analysis object here. The decision threshold must be preregistered from the recovered covariance, effective independent spectral bins and multiplicity policy. **No numerical threshold is supplied or calculated in this note.**

The essential distinction is between:
1. a representation that can reproduce the standard data after refitting shared parameters; and
2. an extension that predicts a non-reparameterizable, independently measurable residual on held-out data.

Only the second can distinguish H(s)H from the standard model.

## 7. Formalization status and limits

Existing draft PR #1189 contains FORMAL_VERIFICATION/HsHVerification/NadirVortexTwoChannelReadout.lean at head cef7e8ab994973c4a91fd87aa0afa315c5d23b07. Exact-head Actions run #42114292197 succeeded with Lean 4.34.0 / Lake 5.0.0; the target module built. The recorded theorem-specific axiom outputs were [propext, Classical.choice, Quot.sound]; the full log reported no sorryAx or bare admit. Tests, lint, nanoda and a separate global axiom audit were not run. The PR remains draft/unmerged.

That run proves only the encoded two-channel algebra, conditional antipodal alias and decoder-stability statements. It does not prove the full camera projection, contour extraction, PIV/PTV registration, experimental mode classifier, Rankine model's physical premises, or any H(s)H extension. The new full observation map cannot yet be faithfully formalized because its camera calibration, cross-view registration and classifier are not source-defined. No new Lean code or CI run was made because no source-complete map was available to formalize.

## 8. Shared map-closure rule

The same architecture applies outside physics. A projection or route-selection result is not “complete” merely because some outputs were returned. Its input universe must be explicit, every input must receive a typed disposition, and any information loss must be reported. The Elias h655:s2 source-route POC returned four of six analyst-classified families but did not expose a complete requested-set/disposition record; this is an event-specific coverage gap, not a universal route-necessity claim. No change was made to Elias's PR or issue.

For every physical or workflow map, require:
1. explicit domain and codomain;
2. coordinate frame, units, time basis and provenance;
3. calibration and uncertainty at each arrow;
4. explicit composition conditions;
5. inverse or fiber/alias description where information is lost;
6. an observable and held-out failure condition.

## 9. Scope controls and next gate

- Mersearch's four request lanes remain occupied; no new request was created. Repository source retrieval and the primary article PDF were used as bounded fallbacks, not described as exhaustive Mersearch.
- Existing Math Hopper, Lean PR #1189, Whirligig Kernel 0, repository tools and SciSpace were checked before proposing any new tooling. No tool, package, branch, PR or issue was created.
- No SAT-O or Blockwave equation was imported, changed or corrected. No equation-level H(s)H prediction is claimed.
- No raw-data retrieval, physical calculation, fit, simulation, numerical prediction, covariance propagation or independent measurement occurred.
- No P2 system selection, Factory Floor admission, paper-gate advancement or BEDROCK promotion occurred. Code Grurple P0 remains controlling.
- FIE's last full review was 2026-10-27; the 14-day re-review is due 2026-11-10, not yet due.
- This note is an internal design artifact, not a public paper or public-safe result. No issue-publisher submission is required.

**Next evidence gate:** retrieve and checksum the Figshare item; inventory whether it contains raw Basler frames, contour arrays, PIV fields, PTV tracks, timestamps, calibration and covariance; then freeze shared parameters independently and run the preregistered holdout. Until that package exists, keep all added H(s)H sectors at **PROPOSAL / NOT IDENTIFIED**.
