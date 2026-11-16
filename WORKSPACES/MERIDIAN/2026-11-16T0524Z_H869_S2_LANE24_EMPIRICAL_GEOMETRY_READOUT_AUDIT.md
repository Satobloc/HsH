# Meridian h869:s2 — Lane 24 empirical geometry/readout audit

**Run key:** REVROT3-19-20261011:869:s2  
**Selected label:** Meridian (index 15) · **Next:** Mercer (index 16)  
**Disposition:** one-run Lane 24 overlay; P2 remains HOLD; no theory promotion.

## 1. Authority and boundaries

The fixed ring gives h=869, seq=5h+2=4347, and 4347 mod 19=15. This is a deterministic label, not authentication of a historical Meridian instance or this thread.

The current Meridian BOOT retains Code Grurple P0 / Paper A-B presentation QA. Nathan's present instruction supplies Lane 24 for this appearance only; no persistent assignment, owner, queue, task graph, or other worker remit changed.

Historical role evidence:
- “🌐Meridian [HsH] Michelstein-on-Meinorly”, conversation 6a9aa91b-11f4-83ea-80a1-4d502522e441, raw export blob d21e251df093013903cc19789ded562f83b6e6ea. Direct user-role ancestry, 2026-09-08 02:45:59Z, 2026-09-09 01:04:25Z and 03:27:36Z: Graticule as peer geometric solver; multiple valid representations; isometric transformations; least-wild routes.
- “Meridian Free Build”, conversation 6ab339d2-8fb4-83ea-b728-c8001a034371, raw export blob 7af1561b321f4d9364da5eb111df689efc652827. Direct user-role ancestry, 2026-10-09 18:44:26Z: worldtube/timesheet/filament/medium geometry.

No standalone signed Nathan-authored Meridian specialist charter was recovered. The current thread is not authenticated as either historical conversation. “Least wild” remains a qualitative search heuristic, not a defined numeric cost or theorem.

Pre-write repository snapshots: HsH main 171add23561a0cee2129b3e107ee3f94f20daf7b; SAT archive main f6e3c914b3722cdd6b57b0a2f024446bb0247f97 (2026-11-13T17:16:24Z); HSH_RESOURCES main a9250b99319891f1effd0d3e49f72def65aa8dc5 (2026-11-15T18:58:40Z). Only the HSH_RESOURCES root README was read.

## 2. New measured comparator: quantized vortex-ring decay in He II

Yuan Tang, Wei Guo, Hiromichi Kobayashi, “Imaging quantized vortex rings in superfluid helium to evaluate quantum dissipation,” Nature Communications 14, 2941 (2023), DOI 10.1038/s41467-023-38787-w:
https://doi.org/10.1038/s41467-023-38787-w

The paper supplies a source-data workbook and supplementary information; additional raw data/code are available from the corresponding author on request. The workbook was identified but its binary bytes were not retrievable in this run. The supplementary coordinate tables and uncertainties were read; no raw movie/code was downloaded.

Measurement facts:
- He II at T=1.65 K, controlled to approximately ±1 mK.
- D2 tracer mean radius 1.1±0.2 μm; laser sheet approximately 0.8 mm; camera 200 Hz.
- Physical vortex-core radius is stated as about 1 Å = 0.1 nm. The tracer radius is about 1.1×10^4 core radii; the core profile is not resolved.
- Nine-particle event: reported ring radius about 312 μm. Two-particle event: fitted R(0)=140.8 μm, measured half-separation dp(0)/2=140.6 μm.

Assistant reconstruction from the nine published coordinates: PCA/SVD best-fit plane, projection to that plane, then nonlinear least-squares circle fit:
- R=310.1 μm;
- RMS radial residual 0.94 μm;
- plane RMS residual about 0.26 μm.
- 20,000-draw sensitivity Monte Carlo using the table's coordinate uncertainties as independent Gaussian errors gives 95% interval 307.6–312.7 μm, containing the paper's ~312 μm.

This is a reconstruction from published, already-derived coordinates, not independent 3D tomography. The full coordinate covariance is not supplied; the Monte Carlo is a diagonal-error sensitivity check, not a complete uncertainty budget.

The paper's two-particle projection is explicit:
\[
c_1=\frac{d_p(0)}{2R(0)},\qquad c_2=\frac{u_p(0)}{u(0)}=\cos\theta.
\]
The published values give c1=140.6/140.8≈0.99858. The paper bounds tan(theta)≤0.18 from the laser-sheet brightness profile. The 3D trajectory is not directly observed; R(0) is fitted and must remain distinct from the measured separation.

The paper compares Schwarz, two-way (2W), and self-consistent two-way (S2W) normal-fluid treatments; it reports S2W as the best match for the two-particle event. This is a comparison against the same events, not a blind holdout or independent validation.

**Source-unit issue:** Tang et al. print D2 tracer density as 202.8 g/cm³, physically implausible for solid D2. A 2025 PNAS paper citing the same Xu–Van Sciver 2008 reference prints 202.8 kg/m³. This strongly indicates a factor-1000 unit transcription error, but the original 2008 source and Tang's force-calculation code were not retrieved. The source is not silently corrected; the paper's drag/gravity ratios are not independently reproduced and should not be reused numerically until resolved.

## 3. Independent reconnection dataset: a stronger medium-response comparator

Piotr Z. Stasiak et al., “Experimental and theoretical evidence of universality in superfluid vortex reconnections,” PNAS 122(21), e2426064122 (2025), DOI 10.1073/pnas.2426064122:
https://doi.org/10.1073/pnas.2426064122

The paper reports two experimental reconnections with both approach and separation data, at 1.65 K and 2.0 K, plus six post-reconnection-only observations. It analyzes
\[
\delta^\pm(t)=A^\pm\bigl(\kappa|t-t_0|\bigr)^{1/2}.
\]
Reported experimental A− values are approximately 0.4–0.6; the six post-only A+ values span about 1.2–4.2. The authors report A+>A− and temperature dependence in the approach prefactor.

The paper gives D2 density 202.8 kg/m³, mean tracer radius 1.1×10^-6 m, and 200 Hz imaging, citing the same Xu–Van Sciver reference. This cross-source check strongly supports a unit typo in Tang 2023, but is not a retrieval of the original 2008 reference.

The approximately 5% normal-fluid energy jump is a **simulation result**, not a direct measurement. The paper deposits plotted minimum-distance and energy-injection data at Newcastle University, dataset DOI 10.25405/data.ncl.28727000.v1:
https://doi.org/10.25405/data.ncl.28727000.v1

The repository file listing was inaccessible in this run; no dataset bytes were downloaded. The deposited energy-injection series is simulation output; the minimum-distance series is the experimental readout. This is an additional unranked comparator, not a P2 selection or an amendment to Nadir's matrix.

## 4. WWRD rope/contact constraint

Gregory Kozyreff and Benoit Seron, “Dynamical elastic contact of a rope with the ground,” arXiv:2103.14395 (2021):
https://arxiv.org/abs/2103.14395

The experiment uses a 2-mm stranded metallic wire, not a climbing rope. Parameters include line density 15 g m^-1, bending stiffness about 5×10^-4 N m², and end height Z0=0.81 m. Tension is difficult to measure directly and is inferred via static contact length x0; the model assumes approximately constant tension and small slope. The authors note slip and non-small-slope effects, and a thicker-wire experiment shows bistability not reproduced by the small-slope model.

The weak-bending prediction is f1≈sqrt(g/(8Z0)). Using the paper's g=9.81 m s^-2 and Z0=0.81 m gives 1.2304 Hz. The seven tabulated frequencies are 1.18, 1.19, 1.20, 1.20, 1.23, 1.17, 1.20 Hz, each reported with uncertainty of order ±0.02 Hz:
- mean 1.1957 Hz;
- sample SD 0.0190 Hz;
- range 1.17–1.23 Hz;
- mean minus prediction −0.0347 Hz, about −2.8%.

This is descriptive, not a formal significance test: uncertainty coverage, run-to-run covariance, and Z0 uncertainty are not supplied; tension is a proxy, not a direct measurement. It constrains moving unilateral contact, bending, tension, slip, friction, and geometric nonlinearity. It is not a climbing-rope constitutive law and establishes no WWRD/H(s)H equivalence. Here g is local acceleration, not Newton's constant G.

## 5. Rotation, inspiral, and CODATA

The existing Nadir P2 matrix already contains rotating-He-II and compact-binary inspiral candidates, including GW190425; its ranking and queue were not changed. Peretti et al.'s 2023 rotating-He-II vortex-lattice visualization is a useful rotation comparator, but imaging orientation, depth of field, tracer size, and rotation-rate uncertainty must be carried; vortex positions are not a direct core-radius measurement.

For an inspiral source cross-check, GW170817's GWTC-1 release exposes H1/L1/V1 strain products and P1900040 calibration envelopes:
https://gwosc.org/eventapi/html/GWTC-1-confident/GW170817/v3/
https://dcc.ligo.org/LIGO-P1900040/public

GWTC-1 reports frequency-dependent calibration uncertainties: amplitude 2.6% LHO, 3.8% LLO, 5.1% Virgo; phase 2.4°, 2.1°, 2.3°; timing below 1 μs for LIGO and 20 μs for Virgo. The high-frequency merger/post-merger region is not a resolved contact measurement in this event. Posterior samples from different waveform/prior analyses are inference products, not independent detector measurements. No strain bytes were downloaded or reanalyzed.

The applicable official reference remains CODATA 2022, NIST version 9.0:
https://physics.nist.gov/cuu/Constants/

The 2022 adjustment used 133 input data for 79 adjusted constants. The G evaluation is a separate least-squares evaluation from 16 measurements with three reported correlations and a Birge-ratio expansion factor of 3.9; no new G input data were added relative to 2018. Nadir's h868 report already performed leave-one-out sensitivity; it was not repeated here.

For He-II circulation kappa=h/m4, pin the isotope-mass source/version before numerical comparison. The circle fit above uses only published millimetre coordinates. The rope calculation uses local g, not G. No H(s)H numerical prediction, CODATA comparison, or physical fit was performed.

## 6. SAT-O1 / Blockwave source fidelity

Mersearch was not callable in this runtime; all four existing request lanes remain requested. No request was overwritten or retriggered. Fallback was limited to the public SAT archive, HsH source ledgers, SciSpace, and accessible primary literature. HSH_RESOURCES was restricted to its root README; no research payload was opened.

**SAT-O1 source:** SATOBLOC/SAT O1 4D.txt; Git blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc; SHA-256 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937. File-index dates: created 2025-06-07 08:38:16; modified 2025-06-09 18:44:50; archive-ingest timestamp 2025-10-27 23:18:35. First archive Git commit b543eb3fbf16e50500ceadad83dc9a7dc0759e5b (2025-10-27T00:40:28Z).

Verbatim equation excerpt (raw LaTeX spelling retained):
~~~text
\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)
v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}
S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)
L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
~~~

The file is unbylined. It defines the filament as 1D and calls the worldtube the 4D volume swept by its vibration, but gives no thickening map, normal-bundle profile, finite-core constitutive law, or timesheet/readout composition.

**Blockwave Clean Action attachment:** conversation 68c990dd-df28-832e-b766-c267190aaffa, raw export blob fa2586add42b4d87afe89a5b00e1e48a01aaee54; attachment event 2025-09-16T16:31:26.687Z; attachment SHA-256 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664; HsH archive text blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d. It was supplied in the conversation; embedded authorship remains unresolved.

Verbatim source action excerpt, with formatting and defects preserved:
~~~text
\boxed{
\begin{aligned}
S \;=\; \int d^4x\,\sqrt{-g}\;\Big[
&\; \frac{M_{\rm P}^2}{2}\,R
\;+\; \underbrace{\frac{f_\theta}{2}\,\nabla_\mu\theta\,\nabla^\mu\theta \;-\; \Lambda_\theta^4\big(1-\cos\theta\big)}{\text{compact phase (elastic + compactness)}}
\\[2pt]
&\;+\; \underbrace{\tfrac{c_1}{2}\,P^{\alpha\beta}P^{\mu\nu}(\nabla\alpha u_\mu)(\nabla_\beta u_\nu)
\;+\; \tfrac{c_2}{2}\,(\nabla_\mu u^\mu)^2}{\text{time–flow elasticity (Lorentz-safe sector)}}
\;+\; \lambda\,(u^\mu u\mu+1)
\\[2pt]
&\;+\; \underbrace{\tfrac{\kappa_0}{4}\,J_{\mu\nu}\,P^{\mu}{}{\rho}P^{\nu}{}{\sigma}\,J^{\rho\sigma}
\;+\; \tfrac{\kappa_2\,\ell^2}{4}\,(\nabla_\alpha J_{\mu\nu})\,P^{\alpha}{}{\beta}P^{\mu}{}{\rho}P^{\nu}{}{\sigma}\,(\nabla^\beta J^{\rho\sigma})}{\text{filament spectrum: flex/twist/coil}}
\\[2pt]
&\;+\; \underbrace{\frac{g_h}{2}\,F_{\mu\nu}(\theta)\,J^{\mu\nu}}{\text{holonomy–trace coupling}}
\;+\; \underbrace{\frac{1}{2}\,J{\mu\nu}\,\mathcal{M}^{\mu\nu}{}{\rho\sigma}(\theta,u)\,J^{\rho\sigma}}{\text{mixing / medium response}}
\Big].
\end{aligned}
}
~~~

The source defines F_{μν}=∇_[μ A_{ν]}, A_μ=α_*∇_μθ, and ∇_μJ^{μν}=0. Preserve the source's index/typography defects; do not silently repair. The separate 2025-10-19 assistant reconstruction is later and non-identical, not Nathan Direct. The existing source-fidelity correction is Mercer h824 / issue #1730:
https://github.com/Satobloc/HsH/issues/1730
No duplicate was created.

Separate Blockwave drafts:
- SATOBLOC/SATOBLOCK-LIVE.txt, blob 1642375cfc3ad8fd46b178e2fd117b5b1a93dc2d, first Git commit f5cbe9aba986b39ace86c55a7bea53feb854445f (2025-10-28T00:04:17Z), contains a schematic transitional action S=∫√(-g)[L_Grav+L_theta+L_u+L_theta-u+L_J+L_int]+S_Top; the same file says coefficients, constraints, and kernels remain underdefined.
- SATOBLOC/SATOBLOCK Full Theory & Predictions.txt, blob 3893ef0acf9009b01c58c736ec97b8df2ba74943, first Git commit aaac961cfc519873eff650c12f39d005eda30e6a (2026-05-31T23:05:38Z), contains a separate nonrelativistic Phi-hydrodynamic draft:
  \[
  \mathcal L=\tfrac12\rho|\mathbf v|^2-\rho W(\Phi)-\tfrac{\kappa}{2}|\nabla\Phi|^2+\lambda\rho\Phi(\nabla\cdot\mathbf v).
  \]
  Its title calls it a corrected dimensionally consistent formulation; it is not a correction to the 2025 Clean Action or the 4D schematic.

Separate mathematical qualification, not an equation edit: for smooth real theta, constant alpha_*, and torsion-free exterior calculus, A=alpha_* dtheta implies F=dA=alpha_* d²theta=0 locally. Existing Loom PR #759 contains constant_smul_exact_phase_has_zero_field_strength; its recorded successful build was on a merge reference, not current-main integration. This does not formalize circle-valued phases, winding, bundles, defects, or physical premises. If J is conserved, the smooth bulk integral of F_{μν}J^{μν} is a boundary term by integration by parts; that is an assistant reconstruction here, not a new Lean theorem. No corrected SAT-O1 or Blockwave equation was written.

## 7. Explicit maps and minimality

For the He-II comparator, keep the stages typed:
\[
\mathcal H_{\rm candidate}
\xrightarrow{P_{H\to F}\;?}
\mathcal F_{\rm HeII}
\xrightarrow{P_{F\to I}}
\mathcal I_{\rm tracer/camera}
\xrightarrow{P_{I\to O}}
\mathcal O_{\rm measured}.
\]
The first map from H(s)H geometry to a helium two-fluid state is absent. The second must include normal/superfluid response, tracer drag/gravity, and laser/camera geometry. The third includes ellipse/projection/readout. Reverse reconstruction is non-unique without projection parameters and calibration.

A moving 1D vortex centerline Gamma(t) sweeps a 2D spacetime worldsheet. A finite-core 4D worldtube would require an explicit normal-bundle thickening/profile around that worldsheet. A 2-form current J^{μν} requires a support/normalization map. A timesheet trace requires a declared foliation/intersection and instrument map. SAT-O1 and the Clean Action do not supply these maps.

The least-wild route is to retain, rather than collapse, filament, finite-core tube, two-form current, timesheet, and responsive-medium descriptions. Rank them only after maps, units, uncertainties, and held-out observables are specified. He-II's normal fluid is a real lab comparator, not an H(s)H medium.

## 8. Existing formalization and tooling

No new tool, branch, PR, dependency, or subscription was created.
- Nadir PR #1189 exact-head run #43783028748: Lean 4.34.0 build success, 8,961 jobs; projection/coarse-grain, witness-composition, and two-channel-readout modules.
- Calder PR #1515 exact-head run #42722996625: Lean 4.34.0 build success, 8,957 jobs; includes the Nadir readout/composition modules plus angular-sampling and unit-lineage/holdout modules.
- Ravel PR #1133 exact-head run #43636677645 failed in MovingPlaneTraceGeometry.lean because definitions need noncomputable.
- Covariance PR #1309 exact-head run #41644532497 failed in ContourReadoutCovariance.lean for the same class of error.
- Loom PR #759's exact-phase theorem has a successful merge-reference build, not exact-head/current-main integration.

The #1515 build is the strongest existing connected measurement-side chain, but Ravel's representation-conversion and covariance pieces are not integrated into it. The CI logs include dependencies such as propext, Classical.choice, and Quot.sound; global axiom audit, tests, lint, and nanoda were skipped. No local Lean/Lake/Elan executable is installed, so no new Lean build is claimed.

Whirligig remains a sandboxed reconstruction aid: multiple admissible paths are expected; equation↔curve encoding, composition, information preservation, bending-energy ranking, and representation-invariance still need source-grounded definitions. Math Hopper PR #991 and existing Lean PRs were checked. Repository metadata reports zero forks for HsH, SAT archive, and HSH_RESOURCES. SciSpace was used as secondary discovery; primary sources controlled claims. No new tooling or paid service was justified.

## 9. Project disposition

The Tang ring-decay and Stasiak reconnection sources are additional unranked empirical comparators, not P2 selections and not amendments to Nadir's P2 matrix #1813:
https://github.com/Satobloc/HsH/issues/1813

- Evidence/source package: PARTIAL (papers, SI, source-data links, coordinate uncertainties; Tang workbook and Stasiak repository bytes/raw movies/code not retrieved).
- H(s)H forward map: NOT READY.
- Frozen falsification/holdout: NOT READY.
- Independent hostile review: NOT READY.

P0 Code Grurple remains ACTIVE. P1 Orson cognition remains OVERDUE / NOT READY. P2 measured geometry remains HOLD. P3 full theory remains INCOMPLETE. FIE rereview remains November 24. No task graph, PWH queue, ownership, P0 object, manuscript, site route, or BEDROCK theory changed.

Unrelated reading quantum: Kenneth Grahame, The Wind in the Willows, Chapter I, Project Gutenberg #289, lines 25–180 read. Next cursor: line 181.

## 10. Final disposition

H869_S2_MERIDIAN / ONE_RUN_LANE24_OVERLAY / TANG_HEII_RING_SOURCE_PARTIAL / STASIAK_PNAS_RECONNECTION_DATASET_IDENTIFIED / D2_DENSITY_UNIT_DISCREPANCY_FLAGGED / 3D_CIRCLE_RECONSTRUCTION_310.1UM / ROPE_CONTACT_DESCRIPTIVE_QC / GW170817_SOURCE_CROSSCHECK / CODATA_2022_VERSION_PINNED / SAT_O1_BLOCKWAVE_PROVENANCE_RECHECKED / EXISTING_LEAN_CHAIN_AUDITED / P2_HOLD / P0_ASSIGNMENT_PRESERVED / NO_NEW_TOOLING / NO_NEW_LEAN_RUN / NO_THEORY_PROMOTION / MERCER_NEXT_NO_HANDOFF / AUTOMATION_UNCHANGED.