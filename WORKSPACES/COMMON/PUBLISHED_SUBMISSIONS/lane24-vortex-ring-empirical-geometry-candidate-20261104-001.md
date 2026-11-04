# Lane 24 source and measured-geometry gate
**Date:** 2026-11-04  
**Status:** EMPIRICAL CANDIDATE RECONNAISSANCE / SOURCE-CUSTODY UPDATE / NO SYSTEM SELECTED / NO H(s)H THEORY PROMOTION  
**Provenance:** Current-assistant research note; no historical worker instance or cross-thread participation is claimed.

## Executive result

Two peer-reviewed laboratory systems provide complementary finite-core benchmarks:

1. **Three-dimensional bubble-vortex-ring interaction** (Journal of Fluid Mechanics, 2026): time-resolved 3D Lagrangian particle tracking (4D-LPT, meaning 3D space plus time), six-camera bubble-shape reconstruction, core deformation and bubble breakup. Public supplementary raw camera movies exist; processed tracks and calibration records are available only on reasonable request.
2. **Buoyant particle-vortex-ring interaction** (Journal of Fluid Mechanics, 2025): measured particle spin, azimuthal drift, radial oscillation and vortex-core disruption across a particle/core size-ratio range. The flow measurements are 2D PIV, with top and side views captured separately, not a simultaneous 3D reconstruction. Data are available on request.

These are candidate standard-fluid benchmarks, not evidence for H(s)H. Neither is selected as the P2 system. The existing P2 docket remains issue #565. The Aalto two-drop/free-surface candidate is already documented in issue #1336; no duplicate was created.

No CODATA numerical comparison, raw-data reanalysis, fitted H(s)H parameter, or new physical prediction was performed.

## A. 3D bubble-vortex-ring experiment

**Estepa-Cantero et al., “Three-dimensional experimental investigation of the interaction between a rising bubble and a vortex ring,” J. Fluid Mech. 1045, A27 (published 2026-10-16), DOI 10.1017/jfm.2026.12078.**  
Primary publication: https://doi.org/10.1017/jfm.2026.12078  
Author-uploaded preprint: arXiv:2606.08193; Zenodo record 19001573.

### Measurement provenance

The detailed methods and uncertainty values below are taken from the author-uploaded preprint v1; the final journal PDF was not retrieved.

- Distilled water maintained at 20 °C.
- Six high-speed cameras at 1496 frames/s.
- Four frontal cameras for 3D particle tracking; six-camera tomography for bubble shape.
- Measurement volume approximately 100 × 160 × 80 mm³.
- 56 μm fluorescent tracer particles.
- The paper reports flow-parameter errors below 3%, bubble-size error below 1%, and velocity uncertainty increasing from about 2% near the vortex to about 10% in the far field.
- Processed 4D-LPT data are available on reasonable request. Supplementary movies contain raw six-camera image sequences for the three cases. The Zenodo record inspected here contains the paper PDF, not a verified processed-track dataset.

### Geometry extracted from the author-uploaded preprint v1

| Case | a₀/R₀ | R₀/Rb | derived a₀/Rb |
|---|---:|---:|---:|
| I | 0.37 | 4.3 | 1.591 |
| II | 0.38 | 4.5 | 1.710 |
| III | 0.28 | 4.2 | 1.176 |

The derived ratio is
\[
a_0/R_b=(a_0/R_0)(R_0/R_b).
\]
The preprint's separate dimensional table gives approximately 1.593, 1.714 and 1.199. The largest difference is about 1.7%, within the paper's stated <3% flow-parameter error. These are arithmetic checks on rounded published tables, not new measurements. The final journal PDF was not retrieved, so the table values remain explicitly preprint-v1 values.

The three cases exhibit weak interaction, capture-drag-release, and breakup. The authors caution that the selected cases do not define a deterministic transition boundary. The dispersion/trajectory comparisons are conditioned by measured or fitted quantities; they are not blind held-out predictions.

**Use:** strongest current candidate for 3D finite-core/inclusion geometry and a measurement-map study.  
**Limit:** processed tracks and full calibration are not public in the inspected sources.

## B. Buoyant particle-vortex-ring experiment

**Biswas and Govardhan, “Interaction of a vortex ring with a buoyant spherical particle,” J. Fluid Mech. 1015, A24 (2025), DOI 10.1017/jfm.2025.10328.**  
Primary publication: https://doi.org/10.1017/jfm.2025.10328

### Measurement provenance

- Vortex-ring diameter approximately 21.5 mm; core diameter approximately 4 mm.
- Core/ring diameter ratio \(D_c/D_o=0.20\pm0.01\).
- Particle/core diameter ratio \(D_p/D_c=0.62\) to 1.67.
- Reported Reynolds-number range 6,000 to 67,300.
- Time-resolved PIV at 2,000–5,000 frames/s; particle imaging at 3,000 frames/s.
- 1024 × 1024 images, 0.145 mm/pixel, 0.58 mm vector spacing, approximately eight vectors across the core.
- Reported peak-velocity accuracy about 1%; vorticity uncertainty below 10%; ring-radius uncertainty ±0.25 mm; core-radius uncertainty ±0.20 mm; circulation uncertainty ±3%; particle-diameter uncertainty ±0.1 mm.
- Top and side views were recorded separately, not simultaneously. The paper explicitly identifies a full 3D flow-field measurement as future work.
- Data are available from the corresponding author on request.

### Geometry check

The paper defines particle-to-toroidal-core volume ratio
\[
V_R=\frac{V_p}{V_c}
=\frac{2}{3\pi}\left(\frac{D_p}{D_c}\right)^3\left(\frac{D_c}{D_o}\right).
\]

Using the reported \(D_p/D_c=0.62\)–1.67 and \(D_c/D_o=0.20\pm0.01\) gives
\[
V_R\approx0.0096\text{ to }0.208,
\]
consistent with the reported 0.01–0.20. This is a geometry consistency check from the paper's measured ratios, not a dynamical prediction. The cubic dependence means a 1% error in \(D_p/D_c\) produces approximately a 3% first-order error in \(V_R\).

### Source-level unit warning

The paper prints “kinematic viscosity (\(\nu\))” as approximately \(0.891\pm0.016\ \mathrm{mPa\,s}\). The printed unit mPa·s is dynamic-viscosity units, whereas kinematic viscosity requires m²/s. The paper also uses \(Re=\Gamma/\nu\). This is likely a symbol/unit-label error, but it must not be silently corrected. Do not independently recompute Reynolds numbers until the intended property and conversion are confirmed from the authors or lab record.

The paper reports an exponential fit for normalized particle spin, \(\Omega_p/\Omega_{\rm core}\propto e^{-m t^*}\). This is a fit to observed data, not a held-out prediction. The observed stable radial equilibrium is not explained by the paper's simplified force balance; core distortion and rotation-induced lift are discussed as possible missing effects, not independently measured mechanisms.

**Use:** strongest current candidate for rotational response, azimuthal transport and finite-core disruption.  
**Limit:** 2D PIV and non-simultaneous views do not establish a full 3D worldtube.

## C. Additional candidates, not selected

- **Free-surface vortex-ring interaction:** “Evolution of three-dimensional vortex structures on interaction of vortex ring with free surface,” Physics of Fluids 38 (2026), DOI 10.1063/5.0312376. The abstract reports 3D Lagrangian particle tracking, a skeleton-based core-identification procedure, secondary/tertiary rings and loop-like structures at Re = 4,500 and 7,400. Full text and raw-data access were not verified; watchlist only.
- **Aalto two-drop/free-surface vortex-ring preprint:** arXiv:2607.07214, already published as a candidate note in HsH issue #1336. Its data DOI 10.5281/zenodo.20624416 was not retrieved. No duplicate publication.
- **Kelvin-wave/bathtub-vortex candidate:** already present in P2 issue #565; not reanalysed here.
- **Inspiral:** GW170817 remains an existing P2 candidate; no duplicate analysis was undertaken.

## D. Explicit laboratory geometry and observability map

For these Newtonian experiments, the appropriate measurement space is
\[
M_{\rm lab}=\mathbb R^3\times I,
\]
not a Lorentzian spacetime. “4D-LPT” means three spatial coordinates plus time, not four spatial dimensions.

A useful typed decomposition is:

- \(\Gamma_t\): vortex-ring centerline at time \(t\), a closed 1D curve.
- \(W_\Gamma=\{(\gamma_t(s),t)\}\): centerline history, a 2D worldsheet in \(M_{\rm lab}\).
- \(C_t\): finite 3D vortex-core region around \(\Gamma_t\).
- \(W_C=\{(x,t):x\in C_t\}\): finite-core history, a 4D worldvolume.
- \(\partial W_C\): 3D boundary history.
- \(\Sigma_t=\mathbb R^3\times\{t\}\): 3D laboratory time slice.
- \(W_i\): bubble or particle support history.
- \(O_{\rm cam}:\mathcal C\to\mathcal D\): camera/particle-track observation map from admissible configurations to recorded data.

The inclusion maps into \(M_{\rm lab}\), the time projection \(\pi_t:M_{\rm lab}\to I\), and the observation map must remain explicit. A proposed observable \(\beta:\mathcal C\to Y\) is recoverable from camera data only if it factors through \(O_{\rm cam}\):
\[
\beta=\widehat\beta\circ O_{\rm cam}
\quad\Longleftrightarrow\quad
O_{\rm cam}(x)=O_{\rm cam}(y)\Rightarrow\beta(x)=\beta(y).
\]
This is the existing Kestrel fiber-compatibility criterion. It supplies a concrete falsifier: if two admissible 3D configurations produce the same available readout but different proposed topology/contact observables, that observable is not identifiable from that dataset.

The 2025 particle study's separate top/side views do not supply a simultaneous 3D observation map. The 2026 bubble study has a richer 3D readout, but the processed tracks and calibration are still needed.

### Local/inside versus global/outside; cross-domain boundaries

- **Inside/local:** core cross-section, swirl, vorticity, particle spin, bubble deformation and local contact.
- **Outside/local:** ambient flow, free surface, pressure/velocity field and camera geometry.
- **Global:** centerline history, finite-core volume history, inclusion history and the observer's complete record.

The same typed worldtube/slice vocabulary appears in GR, but these laboratory records are Newtonian and no Lorentzian metric map is supplied. A rank-2 current can describe a 2D worldsheet in differential geometry and in string-theory formalisms, but that rank match does not establish string dynamics. The SAT4D vector current is not yet mapped to a Standard-Model gauge current. The information-theoretic connection is the observation/factorization criterion, which concerns identifiability rather than a new physical interaction. These are comparison hypotheses, not equivalences.

## E. Formalization status

Existing PR #873 contains:
- `KestrelProjectedIncidence.lean`: genuine intersection projects to overlap; projected overlap lifts only under an injectivity condition; an observable factors through a readout exactly when it is constant on readout fibers.
- `KestrelIntersectionDimensionGate.lean`: conditional Poincaré-dual degree \(4-k\) and transverse-intersection dimension results in a 4D ambient setting.

The current merge-reference CI run #41758925555 built these two modules. Their reported theorem dependencies were standard `propext`, `Classical.choice` and `Quot.sound`; no `sorryAx` was reported for the cited factorization or dimension-gate theorems. The full PR build nevertheless FAILED in `KestrelMovingSlice.lean` at two unsolved algebraic goals involving division/cancellation under stated nonzero hypotheses. `sorryAx` appears in two moving-slice theorem reports. PR #873 remains open/draft/unmerged. The run did not validate integration against the latest main head.

The standard degree rule \(p=4-k\) gives a 3-form Poincaré dual for a 1D worldline, a 2-form for a 2D worldsheet, and a 1-form for a 3D hypersurface, subject to the manifold/orientation/coefficient assumptions. Lean verifies only the formalized conditional statements, not the source translation or physical premises. If “Klein Fabric” is genuinely nonorientable, the current orientable-duality formalization would need an orientation local system or a revised theorem; the source does not yet establish that property.

## F. SAT-O / Blockwave source custody

The source categories must remain separate.

| Source | Date/provenance | Exact source identifier | Status |
|---|---|---|---|
| SAT.O Official Directives | Internal date July 2025 | Git blob `167136310cdf33ca8f986f33634692314c1a0946` | Document-level directives: 4D manifold, 1D filaments, propagating 3D wavefront; no typed current equation. |
| SAT4D Live Draft | Internal date June 2025; Nathan McKnight byline | Git blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7` | Draft/document-level source, not automatically Nathan Direct for each equation. |
| SAT O1 4D | No internal date/byline located | Git blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc` | Historical action/worldline proposal; “worldtube” dimensionality needs an explicit family or finite-thickness construction. |
| BLOCKWAVE CLEAN ACTION | No internal date; first extant HsH Git observation 2026-10-08 | Git blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d` | Assistant-authored source file, not Nathan Direct; preserve malformed index/subscript tokens in the original. |
| “0.239 Radians in Science” pasted document | Outer user message 2026-02-25 01:12:37Z; embedded author unresolved | Raw conversation blob `8b6794a2be3e19b6bba32acfbbc4c6636b1b02e3`; message `15338421-a5e7-4538-879a-d25d840d2bdd` | Contains a 3-form \(J_{\mu\nu\rho}\) passage for 1D worldlines and later a 2-form \(J^{\mu\nu}\) worldsheet passage without an explicit conversion map. |
| Klein Fabric source | Nathan Direct 2026-08-26 23:41:28Z and 2026-08-27 00:20:22Z | Raw conversation blob `92454acdaad701193e2a0c6cf64a7d7b70a03dbb`; messages `062ad8ee-ef20-4857-9077-75fe57a6974f`, `95319111-ba02-4b45-885a-6e44bd5fed7d` | Provisional conceptual parent: torus/Klein-fabric language, dual-shell expansion and worldtubes as twisted ER bridges. No metric, embedding, connection, action or quantitative force law supplied. |
| Klein-Fabric correction | Nathan Direct 2026-10-21 17:04:50Z | Raw conversation blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`; message `090f5160-1020-486d-9c42-df3d7dff2063` | Explicitly supersedes the earlier reciprocal filament/timesheet-deformation pair. The broader reversible/partly reversible “back-hallway” programme remains a test programme, not an established equivalence. |

### Verbatim equation fragments and separate editorial candidates

SAT4D draft source fragment:
\[
J_\mu(x)=\langle\text{Filament Flux and Linking Density}\rangle_{\mathcal F(x)},\qquad
\partial^\mu F_{\mu\nu}(x)=\mu_0\langle\text{Filament Flux Density}\rangle_{\mathcal F(x)}.
\]
The right-hand side of the second expression is prose, not a typed \(\nu\)-component. The source does not explicitly identify it with the separately described \(J_\mu\).

BLOCKWAVE source fragment:
\[
\nabla_\mu J^{\mu\nu}=0,\qquad
\mathcal L\supset \frac{g_h}{2}F_{\mu\nu}(\theta)J^{\mu\nu}
+\frac12J_{\mu\nu}\mathcal M^{\mu\nu}{}_{\rho\sigma}J^{\rho\sigma}.
\]
The full source action also contains malformed index/subscript tokens. The raw file must remain unchanged; any normalized transcription is a separate assistant reconstruction.

**Editorial candidates only, not adopted equations:**
1. If the SAT4D right-hand side is intended to be an effective 4-current, define it explicitly, for example \(J^{\rm eff}_\nu:=\langle\text{Filament Flux Density}\rangle_{\mathcal F(x),\nu}\), then write \(\partial^\mu F_{\mu\nu}=\mu_0J^{\rm eff}_\nu\). This does not prove that this is the intended source meaning.
2. A 1D worldline current and a 2D worldsheet current have different Poincaré-dual degrees in 4D. A 3-form and a 2-form cannot be silently substituted. A Hodge-dual map from a 3-form to a 1-form additionally requires a specified metric, orientation and normalization.
3. In the pasted “Page One” text, an integrated spacetime functional is labelled \(\mathcal L\). If intended as an action, the conventional separation is \(S=\int d^4x\sqrt{-g}\,\mathcal L\). This is editorial normalization, not source recovery.
4. No corrected Blockwave action is adopted. Preserve the raw source and any normalized reconstruction as separate artifacts.

## G. CODATA and tool audit

NIST's latest available recommended set remains CODATA 2022, Version 9.0 (version date 2024-05-09); the 2022 adjustment paper was published 2025-09-16 and evaluates heterogeneous inputs with correlations and adjustment procedures. No CODATA numerical value was used in the fluid-mechanics checks, so no CODATA comparison is claimed.

Existing tooling was checked before proposing anything new:
- Math Hopper already exists as an archive/source-extraction pipeline; no new extractor was built and no full-corpus result is claimed.
- Whirligig already exists as a sandboxed geometry/mechanics workbench; it is not a physical equivalence or H(s)H ontology.
- Existing Lean PR #873 and its current CI were inspected; no new branch, PR or module was created.
- SciSpace was used for literature discovery.
- Free/low-cost routes: OpenLPT (STB-capable, but its inspected calibration path assumes no refraction and some components have restricted licensing), OpenPTV (open 3D-PTV alternative, not a drop-in STB replacement), and PIVlab (free 2D-PIV route for the particle study if raw images are obtained). The tank-wall/refraction calibration is a major compatibility gate for the bubble experiment.
- HsH repository metadata reports one fork; no fork was modified or used as a substitute.
- No paid service, new dependency, or new tooling was introduced.

## H. Next evidence gates

1. Request the 2026 bubble paper's processed 4D-LPT tracks, camera calibration and uncertainty/covariance details; reconcile preprint-v1 tables against the final journal PDF.
2. Request the 2025 particle paper's raw PIV frames and clarify whether the printed \(\nu\) unit is a typo for dynamic viscosity \(\mu\) or for kinematic viscosity in m²/s.
3. Keep the 3D bubble system and 2D particle system separate. Do not infer 3D topology from the particle paper's non-simultaneous views.
4. Use the existing Kestrel factorization theorem to test whether each proposed worldtube/contact observable is identifiable from the actual observation map.
5. Define the current Klein-Fabric parent \(K\), its embeddings/projections and composition laws before mapping these Newtonian laboratory objects into it.
6. Keep the WWRD climbing-rope mechanics comparison at FIRST-BLUSH GEOMETRIC HEURISTIC status. None of these fluid experiments establishes rope universality.
7. Do not promote any candidate to BEDROCK or select a P2 system without raw-data access, independent review and a falsifiable held-out observable.

## References

- Estepa-Cantero et al. (2026), JFM 1045 A27, DOI 10.1017/jfm.2026.12078.
- Biswas & Govardhan (2025), JFM 1015 A24, DOI 10.1017/jfm.2025.10328.
- “Evolution of three-dimensional vortex structures on interaction of vortex ring with free surface” (2026), Physics of Fluids 38, DOI 10.1063/5.0312376.
- Aalto two-drop/free-surface preprint, arXiv:2607.07214; existing HsH publication issue #1336.
- NIST CODATA 2022, Version 9.0; adjustment paper published 2025-09-16.
