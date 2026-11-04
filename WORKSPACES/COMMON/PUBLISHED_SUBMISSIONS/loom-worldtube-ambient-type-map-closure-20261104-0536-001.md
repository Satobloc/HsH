# Worldtube ambient-type and observation-map contract

**Date:** 2026-11-04 05:36Z  
**Status:** ARCHITECTURE ADDENDUM / SOURCE-TYPING CORRECTION / CANDIDATES NOT SELECTED / NO H(s)H PREDICTION / NO THEORY PROMOTION  
**Relationship:** Addendum to the already-published Lane 24 candidate reconnaissance (issue #1339) and the Kestrel source-fidelity crosswalk (issue #1281). This is a distinct missing-interface specification, not a replacement or duplicate of either report.

## Executive result

The word **“4D” currently names at least four different structures in the source record and candidate experiments**:

1. historical SAT-O documents use a Lorentzian 3+1 spacetime and a 1D curve/worldline;
2. current H(s)H direct language uses a 4D filament, a 3D intersectional trace, literal 'cw=t', and '++++' notation; current BEDROCK interprets the latter as a positive-definite Euclidean ambient convention, with any Lorentzian metric treated as a separately derived structure;
3. laboratory vortex experiments use a product of three spatial coordinates and a time parameter, 'M_lab = R^3 × I'; “4D-LPT” means 3D space plus time, not four spatial dimensions;
4. the standard GR comparator uses a Lorentzian spacetime metric.

These objects cannot be joined because their dimensions happen to sum to four. A cross-domain test needs an explicit, typed map from the laboratory history into the H(s)H representation, and a forward projection back to the actual instrument record. The map must state its metric, time function, units, slice correspondence, information loss and composition conditions.

**New gate:** until that map is defined and calibrated, the vortex-ring experiments can test ordinary fluid-mechanics observation operators and finite-core reconstructions, but they cannot validate an H(s)H worldtube, its twist, or a Klein-Fabric embedding.

A source-fidelity correction is also required: the Blockwave quadratic-current term displayed under “Verbatim equation fragments” in issue #1339 is a normalized transcription, not a verbatim copy of the raw Blockwave file. The raw malformed tokens and the normalized candidate must remain separate.

No physical calculation, fit, raw-data download, new Lean theorem, P2 selection or BEDROCK change was made.

## 1. Source-typed geometry: do not merge the four “4D” objects

### A. Historical SAT-O / SAT4D documents

**SAT.O Official Directives** — internal date July 2025; blob '167136310cdf33ca8f986f33634692314c1a0946'. This is a project-directive document, not a raw Nathan message. It describes a four-dimensional differentiable manifold populated by one-dimensional filaments and a propagating three-dimensional wavefront. It supplies no current equation that constructs a finite-core support.

**SAT4D Live Draft** — internal date June 2025; Nathan McKnight document byline; blob '2a79fe25018cce7e99a2c33786d88b0551db6ae7'. This is a historical document, not automatically Nathan Direct for each embedded equation. It describes a static 4D block with a moving time surface and uses 'R^{3,1}' language. The current BEDROCK treats block-universe language as a methodological representation, not a settled metaphysical ontology.

The SAT4D draft's source-current sketch is preserved verbatim here:

'J_\mu(x) = \left\langle \text{Filament Flux and Linking Density} \right\rangle_{\mathcal{F}(x)},'

'\partial^\mu F_{\mu\nu}(x) = \mu_0 \left\langle \text{Filament Flux Density} \right\rangle_{\mathcal{F}(x)}.'

The right-hand side of the second line is prose, not a typed ν-component or a fully specified current. Later in the same draft, a separate section writes the standard Dirac current 'J_\mu(x) = e \bar{\psi}(x)\gamma_\mu(x)\psi(x)' and the corresponding standard-source Maxwell equation. These are distinct document strata; do not silently merge the early filament-flux placeholder with the later Dirac-current form.

**SAT O1 4D** — no internal date or byline located; blob '7577aa1ee5a6c3850ce3b226c75377de6367aedc'. The raw file describes a smooth one-dimensional object 'γ : R → R^{3,1}' parameterized by affine parameter 'λ', and defines the “Worldtube” as the “4D volume swept out by the vibrating filament.” Its displayed equations are:

'\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)'

'v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}'

'S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)'

'L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)'

The displayed action is an action on the 1D curve and its tangent. It contains no core-radius field, normal-bundle construction, support function, boundary action, or finite-thickness evolution. The 4D volume is therefore a document-level definition, not a volume derived by the displayed curve action.

### B. Assistant-authored Blockwave object

**BLOCKWAVE CLEAN ACTION** — blob 'ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d'; no internal date/byline; first extant HsH Git observation 2026-10-08. Its matching raw assistant message is '121d607d-53e7-4b5a-8a7a-75d7e09deb3d', 2025-10-19 12:29:46.538Z, raw conversation blob '1f074cc67057ae9df1e92bab45e8ba34c96b0d77'. The message is assistant-role material. This is not Nathan Direct.

The file introduces a conserved rank-2 current 'J^{μν}' and explicitly calls it a two-form filament-worldsheet current. It is a different object from both the SAT-O 1D curve and the current H(s)H 4D filament language. No source-defined map from this 2-form current to a 4D finite-core support is supplied.

The exact raw source strings include:

'\nabla_\mu J^{\mu\nu}=0'

'\;+\; \underbrace{\frac{1}{2}\,J{\mu\nu}\,\mathcal{M}^{\mu\nu}{}{\rho\sigma}(\theta,u)\,J^{\rho\sigma}}{\text{mixing / medium response}}'

Other raw tokens include 'u^\mu u\mu+1', 'P^\mu{}\nu', and '(\nabla\alpha u_\mu)'. Preserve the original file unchanged.

The normalized term shown in issue #1339,

'(1/2) J_{μν} \mathcal{M}^{μν}{}_{ρσ}(θ,u) J^{ρσ}'

is an **editorial normalization**, not the verbatim source. It repairs the malformed 'J{\mu\nu}' and '{}{\rho\sigma}' tokens. No source-owner confirmation or physical derivation authorizes adopting that normalization as the intended Blockwave equation. This addendum corrects the quotation status without editing issue #1339 or the raw file.

### C. Current H(s)H source strata

The following original messages are already covered by existing source-tag and provenance records; they are not retagged here.

- Nathan Direct, 2026-08-26 23:41:28.815Z, '062ad8ee-ef20-4857-9077-75fe57a6974f', raw conversation blob '92454acdaad701193e2a0c6cf64a7d7b70a03dbb': “Klein Fabric” is not simply the mathematical Klein bottle; the message proposes a torus/Klein-fabric parent and twisted ER-bridge worldtubes. This is a conceptual proposal, not a specified topology, metric or embedding.
- Nathan Direct, 2026-08-27 00:20:22.945Z, '95319111-ba02-4b45-885a-6e44bd5fed7d', same raw blob: describes θ₄, inverse helix pitch, intersectional oblateness and an ideal-vacuum 90° sheet-relative limit. It is descriptive geometry, not a defining equation.
- Nathan Direct, 2026-10-09, messages '28b2378a-846d-4c3f-a242-91f9007ce261' and '1178f25c-9f92-4d1c-b43b-06482e6bf1b1', Meridian Free Build raw blob '7af1561b321f4d9364da5eb111df689efc652827': distinguishes the 4D filament from its 3D intersectional trace and distinguishes coil scale from intrinsic filament thickness. The reported approximately 0.7 fm scale is a source claim, not an independent measurement.
- Nathan Direct, 2026-10-08, '6f00a97a-aa84-45bf-9429-4ff70736014a', same raw blob: one physical core; the larger second-order coil is hollow rather than a second core.
- The 2026-10-10 mixed-source message '59c5c4c6-c914-48d4-af4c-5f53a1698f37' contains a quoted Morrow/Kestrel passage followed by a direct correction. Only the user's correction is attributed to Nathan: the Kerr-shell surface-interaction boundary remains tentative; a responsive medium is separate/optional. The earlier quoted passage is not promoted to Nathan Direct.
- Nathan Direct, 2026-10-21 00:17:23.235Z, '090f5160-1020-486d-9c42-df3d7dff2063', raw Meridian Minkowski Ring Analysis blob '56a84cb85d5c386efa4ea11d322d11e95e2c7703': the older reciprocal filament/timesheet-deformation pair is superseded since Klein Fabric became common. Do not restore that reciprocal pair.
- Nathan Direct, 2026-10-21 13:55:40.205Z, 'c5525f53-b7cc-4444-8102-3bf6fdb1c892', same raw blob: preserves the literal 'cw=t', '++++', and Forest Normalization wording. The '(c+H₀)/2' expression in the same source context is tentative, not a locked equation. Do not silently rewrite 'cw=t' as 'w=ct'.

Current BEDROCK interprets '++++' as a positive-definite Euclidean ambient convention and treats any induced Lorentzian metric as a separate derived structure. That is a current BEDROCK interpretation of the direct signature notation; the direct message does not supply a complete metric tensor, connection, time function or coordinate chart.

### D. Laboratory and standard-relativistic objects

For the vortex experiments, the observation domain is 'M_lab = R^3 × I', with a distinguished time coordinate and spatial slices. The experimental papers' “4D-LPT” means three spatial coordinates plus time. It does not measure a fourth spatial coordinate and does not supply an H(s)H Euclidean metric.

The standard GR comparator is a Lorentzian spacetime '(M_GR, g_L)'. It is not identified with either the historical SAT-O document or current H(s)H '++++' convention.

## 2. Required map contract

For a laboratory system to become an H(s)H test, specify at least:

- 'M_lab': laboratory product domain, spatial coordinates, time coordinate, units and measured slice structure.
- 'M_HsH': the current H(s)H ambient object, its metric/signature, distinguished 'w' coordinate, time function 'τ', and the exact meaning of 'cw=t'.
- 'Φ: M_lab → M_HsH': the declared map class (embedding, chart, immersion, quotient or other), domain, codomain, injectivity conditions and calibration.
- 'Π: M_HsH → M_lab': the forward projection/retraction used to produce laboratory predictions. If both maps are claimed to be reversible on a calibrated subset, state and prove 'Π ∘ Φ = id' there. Otherwise specify the lost information and fibers.
- Time correspondence: 'τ ∘ Φ = f ∘ t_lab', with 'f' monotone and its units/scale stated. No automatic 'ct' or 'w=ct' substitution.
- Metric correspondence: state 'Φ* g_HsH' and whether it is isometric, conformal, or only topological/coordinate. Without this, do not transfer distances, angles, curvature, torsion, thickness or holonomy between domains.
- Slice correspondence: define how each laboratory 'Σ_t^lab' maps to the H(s)H time-wavefront/slice. Do not assume that a laboratory time plane is the H(s)H time sheet.
- Geometry-to-observation composition: define the complete forward map, for example 'D_pred = O_cam ∘ Π ∘ G_HsH', where 'G_HsH' constructs the predicted H(s)H geometry and 'O_cam' is the calibrated instrument map.
- Scale hierarchy: define the maps from parent Klein Fabric to local filament/core, from core to time-slice intersection, from intersection to coarse-grained representation, and from that representation to instrument data. Each composition must have declared domains, codomains and conditions.

The existing Kestrel fiber-compatibility module states the general condition: a claimed observable 'β' is recoverable from an observation map 'O' only if 'β = β̂ ∘ O', equivalently if 'O(x)=O(y)' implies 'β(x)=β(y)'. The current PR/build status is recorded below. A map that changes from dataset to dataset or uses unconstrained per-run parameters is not a discriminating prediction.

## 3. What is forced, and what remains optional?

| Feature | Source status | What is actually constrained |
|---|---|---|
| 4D H(s)H filament / 3D intersectional trace | Nathan Direct | Qualitative dimensional distinction. The embedding and intersection map remain undefined. |
| Klein Fabric parent | Nathan Direct | Conceptual parent proposal; not the standard mathematical Klein bottle and not a defined manifold construction. |
| Twisted ER-bridge language | Nathan Direct, qualitative | Twist is a source-level qualitative feature. No twist field, connection, pitch law or measured twist magnitude is specified. |
| Finite Kerr/Kerr-like core | Working hypothesis | A finite core is proposed; its radius/profile and dynamics are not derived. |
| 'ℓ_f' coil scale | Nathan Direct | Must not be relabelled as intrinsic filament thickness. |
| Intrinsic thickness 'ε' or support profile | Not specified by the SAT-O curve action | Optional additional structure until a source-grounded construction derives it. |
| Kerr shell/contact surface | Tentative source language | Optional boundary hypothesis; no forced contact law or surface dynamics. |
| Active time-wavefront thickness | Operational preference in current source record | No measured thickness or unique physical value established. |
| Laboratory vortex-core thickness/mode | Experimental observable | Constrains the laboratory fluid model, not H(s)H geometry without 'Φ' and 'Π'. |

The direct source therefore constrains the distinction between a 4D filament and its 3D trace, and qualitatively proposes twist and a finite Kerr-like core. It does **not** force a particular core thickness, cross-section, twist field, contact surface, or metric-preserving map from laboratory space-time.

## 4. Additional measured-system candidates and access ranking

These candidates extend the already-published issue #1339 reconnaissance. They remain separate physical systems, not H(s)H realizations.

| Candidate | Measurement / access | Best use | Limitation for an H(s)H test |
|---|---|---|---|
| Gunnarson & Dabiri, “Surfing vortex rings for energy-efficient propulsion,” PNAS Nexus 2025 (published 25 Feb 2025), DOI 10.1093/pnasnexus/pgaf031; CaltechDATA DOI 10.22002/x89a6-m0713 | Open CC0 dataset, approximately 2 GB; planar PIV in a laser sheet plus robot IMU/trajectory | Lowest-cost open pilot for observer, sensor and time/space readout mapping | Single-ring/planar-PIV dataset; not a simultaneous 3D finite-core reconstruction. The article says a quantitative vorticity estimate from the rotational-control signal requires a dynamics/transfer-function model. Not downloaded; checksum not verified. |
| de Aquino, Viroulet, Sasso & Albagnac, “Interaction regimes of a vortex ring and an inertial particle,” JFM 2025 (published 9 Dec 2025), DOI 10.1017/jfm.2025.10909 | Open-access article (CC BY); time-resolved PIV plus orthogonal 3D shadowgraphy; three particle/ring interaction regimes; public Basilisk code repository | Particle deviation/capture and interaction-regime benchmark | Raw experimental dataset availability not established from the accessible article page; public code is not a substitute for raw measurements; no H(s)H coupling law. |
| Han, Oh, Pan & Kim, “Evolution of three-dimensional vortex structures on interaction of vortex ring with free surface,” Physics of Fluids 2026 (published 21 Jan 2026), DOI 10.1063/5.0312376 | 3D Lagrangian particle tracking; Re = 4,500 and 7,400; reported azimuthal loop-like deformations, an approximately m = 12 mode at Re = 4,500, and a lower/shorter-lived mode at Re = 7,400 | Strongest surfaced candidate for 3D core-shape/mode observations | Article access is paywalled; raw-data access not confirmed. |
| Estepa-Cantero et al., “Three-dimensional experimental investigation of interaction between rising bubble and vortex ring,” JFM 2026, DOI 10.1017/jfm.2026.12078 | Six-camera 3D-LPT and bubble-shape reconstruction; raw supplementary movies public; processed tracks/calibration on reasonable request | Best current finite-core/inclusion geometry candidate | Processed tracks and full calibration/covariance still needed; the final journal PDF was not retrieved in the original candidate report. |
| Biswas & Govardhan, JFM 2025, DOI 10.1017/jfm.2025.10328 | Time-resolved 2D PIV; top and side views acquired separately; data on request | Particle spin, azimuthal drift and finite-core disruption | Not simultaneous 3D; do not infer full 3D topology from the separate views. |
| Dong et al., Scientific Reports 2026, DOI 10.1038/s41598-025-31163-2 | 2D PIV at 960 Hz; data on request | Merger/leapfrogging control | 2D-only control, not a 3D core test. |
| Satti & Peng 2013, DOI 10.1088/0169-5983/45/3/035503 | Published thick-core ring-pair observations; raw data not located | Historical noncontact/merger watchlist | No usable raw dataset located in this pass. |

**Access ranking by purpose, not by theoretical resemblance:**

- Open observer-map pilot: CaltechDATA, with the explicit limitation that it does not supply a 3D core.
- Particle interaction regimes: de Aquino et al.; article is open, raw data still unverified.
- 3D core geometry: Estepa-Cantero et al. and Han et al.; strongest spatial information, but processed data/access are constrained.
- 2D merger controls: Dong et al. and Satti/Peng; useful controls, not full worldtube tests.

No candidate is selected for P2. The existing P2 docket remains issue #565.

## 5. Test matrix and falsification boundary

| Candidate | Shared/calibrated parameters | Calibration → holdout | Observable | Standard comparator | Falsification threshold |
|---|---|---|---|---|---|
| Caltech single-ring robot | PIV calibration, IMU transfer function, robot inertia/controller, ring trajectory | Calibrate on a declared subset of trials; freeze sensor and flow-map parameters; predict held-out trials | Robot trajectory, IMU record and flow-field readout | Measured PIV/FTLE/LCS and the paper's standard flow/robot model | Pre-register from actual PIV/IMU covariance; no numerical threshold until calibration records are read. |
| Inertial-particle ring | Stokes number, initial radial position, particle/core size ratio, circulation and PIV calibration | Fit/calibrate one interaction regime; hold out a different Stokes-number/initial-position regime | Particle trajectory, spin, deviation/capture regime | The paper's one-way-coupled DNS and standard fluid/particle dynamics | Held-out residuals/regime boundary must exceed the combined measured uncertainty to count as failure; raw covariance required. |
| Free-surface ring | Re, circulation, core-extraction parameters, free-surface geometry | If data become available, calibrate at one Re and hold out the other | Core topology, circulation and azimuthal mode history | Standard Navier–Stokes/vorticity-core analysis | Threshold must come from the actual 3D-PTV uncertainty and core-extraction sensitivity; unavailable now. |
| Bubble-vortex ring | Re, bubble size/shape, circulation, camera calibration and 3D-PTV uncertainty | Calibrate one case; predict a held-out interaction case without per-case retuning | Bubble deformation/breakup, core-volume history and trajectory | Standard bubble/vortex dynamics and the paper's fitted/observed comparisons | Use published measurement covariance and recovered track/calibration records; no numeric threshold yet. |

**H(s)H-specific prediction field: UNDEFINED for every row.** No current source-defined 'G_HsH', 'Φ', 'Π', constitutive twist/core law or forward camera-readout map produces a numerical prediction. A standard-model fit or a successful geometric re-description would not distinguish H(s)H.

A candidate-map failure is a falsifier of that particular map/readout claim. It is not a falsification of the entire H(s)H framework unless the framework makes that map a required consequence. A theory-level test requires a frozen, source-grounded H(s)H prediction that differs from the standard comparator and survives a held-out measurement with actual covariance.

## 6. Formalization status

Existing PR #873 contains generic projection/fiber-compatibility and intersection-dimension modules. The current merge-reference Actions run '#41758925555' failed; the PR remains open/draft/unmerged. The generic modules do not define the source-specific maps in this report, and no current exact-head build establishes this new contract.

No new Lean module or theorem was written. Formalizing the cross-domain map now would encode missing assumptions rather than verify a recovered source construction.

## 7. Disposition and next cursor

- Preserve issue #1339 unchanged; its Blockwave equation excerpt is normalized, not verbatim, and this addendum supplies the source-typing correction.
- Keep the existing Kestrel and Loom source ledgers; do not retag already-covered direct messages.
- Do not select a P2 system or advance any paper gate.
- Do not edit BEDROCK or promote the Klein Fabric, Kerr-shell, twist or thickness proposals.
- Next: recover the full metric/time normalization and define 'Φ', 'Π', 'G_HsH', the slice map and camera-readout composition. Then obtain the Caltech open dataset and/or requested 3D-LPT tracks, freeze calibration, and only then run a held-out comparison against the standard model.

**Result:** a typed ambient-space and observation-map gate is now specified. The missing map is explicit; the candidate data are ranked by what they can actually observe; the Blockwave quotation is correctly separated into raw and normalized forms. No H(s)H physical prediction or empirical validation is claimed.