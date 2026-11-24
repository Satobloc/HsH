# H951:s3 additive amendment 01 — charged-vortex force attribution and measured Coulomb readout benchmark

**Parent:** [H951:s3 Blockwave medium-response source gate](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/HALE/2026-11-19T1536Z_H951_S3_BLOCKWAVE_MEDIUM_RESPONSE_SOURCE_GATE.md), published as [issue #2103](https://github.com/Satobloc/HsH/issues/2103).  
**Classification:** assistant reconstruction under the deterministic Hale label; not an authenticated historical Hale instance or current ChatGPT thread.  
**Purpose:** add a source-typed causal attribution matrix and one reproducible, measured standard-physics force/readout benchmark. This is additive to the parent report; it does not replace or edit it.

**Parent publication reconciliation:** issue #2103 is now PUBLISHED_VERIFIED. Its publisher confirmation is comment #7014398146; canonical artifact path is WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-h951-s3-blockwave-medium-source-gate-20261119t1536z-001.md, publisher commit a091ac6fad63f6dd8384c36ff12fb4a59a87af91, SHA-256 3780216f86128aae23fb1d20f3744a550c283d4ccb456c36cc30b734086b2f63. Exact artifact readback was verified. This resolves the original receipt's SUBMITTED_NOT_VERIFIED placeholder without editing or resubmitting issue #2103.

## 1. New distinction: a charged vortex is not automatically a vortex-mediated electrostatic force

The external literature separates at least four mechanisms that can produce force-like observations in charged-vortex experiments:

1. **Electric force on charge carried by a vortex.** An ion is attached to a vortex core; an applied electric field acts on the ion, and the vortex responds.
2. **Hydrodynamic interaction of vortex structures.** Charged vortex rings scatter from or are captured by quantized vortex lines; ring motion also depends on dispersion, Magnus response, drag and the surrounding fluid state.
3. **Ordinary Coulomb interaction between charged vortex rings.** A beam of charged rings can evolve under charge-charge repulsion while the vortex dispersion contributes an effective pressure.
4. **Mechanical impulse attribution at a boundary.** A diaphragm response can be interpreted as vortex-carried impulse, but Huggins later argued that the measured force instead arose from the electric force applied to the charged rings.

The tentative H(s)H hypothesis is a fifth, distinct proposition: a responsive-medium vortex state mediates an additional electrostatic attraction/repulsion between source charges. The cited standard results establish that charge-carrying vortices and vortex-mediated hydrodynamic responses exist in particular helium systems. They do **not** establish that fifth proposition.

### Source-typed comparison

| Source | Evidence class | What it reports | What it does not establish |
|---|---|---|---|
| Rayfield & Reif, 1964, [Phys. Rev. 136, A1194](https://doi.org/10.1103/PhysRev.136.A1194) | Primary experiment | Charged particles in He II can be accelerated into freely moving charge-carrying vortex rings; circulation inferred from energy/velocity is one quantum h/m; core radius about 1 Å; ring dynamics are described using a dispersion relation and hydrodynamic Magnus force. | No new charge-charge force law mediated by the vortex. |
| Schwarz & Donnelly, 1966, [Phys. Rev. Lett. 17, 1088](https://doi.org/10.1103/PhysRevLett.17.1088) | Primary experiment | Charged vortex rings propagate across an array of quantized vortex lines; scattering and capture of charge carriers are observed. | No measured electrostatic attraction/repulsion between independently controlled source charges. |
| Schwarz, 1968, [Phys. Rev. 165, 323](https://doi.org/10.1103/PhysRev.165.323) | Primary experiment plus model comparison | Rotation-dependent changes in a charged-ring beam are interpreted as strong ring-line interactions for a fraction of rings plus collective effects; an inviscid-hydrodynamic calculation with a uniform distribution of vortex lines gives fair agreement. | No evidence that the ring-line interaction is a new Coulomb-like force. |
| Gamota & Barmatz, 1969, [Phys. Rev. Lett. 22, 874](https://doi.org/10.1103/PhysRevLett.22.874) | Primary experiment; interpretation contested | Measures impulse of a beam of charged quantized vortex rings versus energy; reports approximate impulse proportional to energy squared and describes this as a direct detection not relying on charged particles bound to the rings. | The interpretation of the diaphragm force is not uncontested. |
| Gamota, Hasegawa & Varma, 1971, [Phys. Rev. Lett. 26, 960](https://doi.org/10.1103/PhysRevLett.26.960) | Primary experiment plus model interpretation | A pulsed beam of charged quantized vortex rings evolves toward a steady-state distribution; the authors attribute this to Coulomb interaction among the vortices plus negative effective pressure from the vortex dispersion law. | Does not require a new medium-mediated electrostatic term beyond ordinary Coulomb interaction and vortex dispersion. |
| Huggins, 1972, [Phys. Rev. Lett. 29, 1067](https://doi.org/10.1103/PhysRevLett.29.1067) | Theoretical reanalysis of the 1969 force interpretation | Argues that the diaphragm force reported by Gamota & Barmatz arises from electric force applied to the charged rings rather than impulse carried by the rings; consequently the diaphragm should not be a sensitive detector of uncharged vortices. | Not a new independent measurement; it is a competing interpretation that must be retained alongside the 1969 authors' claim. |
| Samuels & Donnelly, 1991, [Phys. Rev. Lett. 67, 2505](https://doi.org/10.1103/PhysRevLett.67.2505) | Theoretical calculation | A localized electric force on an ion carried by a quantized vortex ring produces vortex waves, a symmetric ring-radius change and a small drift component perpendicular to the applied field. | Not a measured charge-charge interaction; it is an electromechanical response of a charged vortex. |
| Golov, Walmsley & Tompsett, 2010, [J. Low Temp. Phys. 161, 509–525](https://doi.org/10.1007/s10909-010-0241-0) | Primary experiment / peer-reviewed article | Negative ions injected into superfluid 4He at different durations, quantities and applied fields reveal vortex-assisted transport on isolated rings and in two different vortex-tangle regimes. | Does not supply a signed inter-charge force law or an H(s)H worldtube-to-medium map. |

**Causal attribution rule added:** any force-like readout in a charged-vortex experiment must be decomposed into (a) electric force acting on attached charge, (b) ordinary Coulomb interaction among charged carriers, (c) hydrodynamic vortex/ring/line interaction, (d) momentum/impulse transfer to the detector, and only then (e) any separately predicted H(s)H residual. A detector force alone cannot identify which path generated it.

## 2. Measured standard-physics benchmark: Open University three-sphere experiment

**System and provenance:** Open University, *The Electric Force*, section 4 and Appendix A, including the experiment video/transcript and six displayed readings per condition:  
https://www.open.edu/openlearn/science-maths-technology/physics/the-electric-force/content-section-4

The experiment uses a test charge at the origin, sphere A 10 cm to its left, and sphere B in two positions: directly above the test charge, then diagonally above/left of A. The source states that each sphere is positively charged to approximately 30 nC using a 17 kV charging arrangement. The force meter reads only the x-component. Six values are displayed at 20 ms intervals before and after charging for each geometry.

### 2.1 Source measurements

All force readings are in mN. The six displayed samples are retained exactly as published.

| Geometry | Before charging | After charging |
|---|---|---|
| (i) A only | −0.05, −0.05, −0.07, −0.05, −0.07, −0.06 | 0.62, 0.63, 0.65, 0.64, 0.68, 0.69 |
| (ii) B directly above test charge | −0.08, −0.09, −0.11, −0.12, −0.11, −0.10 | 0.65, 0.64, 0.64, 0.65, 0.67, 0.68 |
| (iii) B diagonally above/left | −0.04, −0.05, −0.06, −0.05, −0.07, −0.07 | 0.98, 0.99, 0.99, 0.99, 0.98, 1.00 |

### 2.2 Reproducible descriptive calculation

For each geometry, subtract the mean pre-charge baseline from the mean charged reading. The resulting descriptive baseline-corrected x-force estimates are:

| Geometry | Mean baseline (mN) | Mean charged reading (mN) | Baseline-corrected ΔFx (mN) |
|---|---:|---:|---:|
| (i) A only | −0.05833 | 0.65167 | 0.71000 |
| (ii) B perpendicular | −0.10167 | 0.65500 | 0.75667 |
| (iii) B diagonal | −0.05667 | 0.98833 | 1.04500 |

The standard point-charge comparator uses the source's nominal q = 30 nC and r = 0.100 m. The source gives no numeric uncertainty for either quantity. With the 2022 CODATA vacuum permittivity ε₀ = 8.8541878188(14) × 10⁻¹² F m⁻¹ ([NIST value](https://physics.nist.gov/cgi-bin/cuu/Value?ep0%7Csearch_for=electron-neutron)), k = 1/(4π ε₀):

- A-only x-force: kq²/r² = **0.80888 mN**.
- Perpendicular B contributes zero to Fx, so geometry (ii) has the same point-charge prediction: **0.80888 mN**.
- For geometry (iii), the diagonal B contribution is kq²/(2√2 r²) = **0.28598 mN**, giving total **1.09486 mN**.

These reproduce the Open University model-solution values to its stated rounding (0.81, 0.81 and 1.1 mN). The measured baseline-corrected means are respectively 12.22%, 6.45% and 4.55% below those point-charge predictions. The six readings are rounded to 0.01 mN; extra decimal places in the means are arithmetic summaries, not claims of instrument resolution. The CODATA uncertainty is negligible relative to the unspecified experimental calibration/geometry uncertainty and is not the limiting term. The source itself notes that point-charge approximation, charge leakage, external forces and limited geometric precision contribute to the difference.

### 2.3 The useful differential contrast and the null

The added diagonal sphere's measured incremental contribution, using the two baseline-corrected means, is:

ΔFx(iii) − ΔFx(ii) = 1.04500 − 0.75667 = 0.28833 mN.

The standard Coulomb vector prediction for that added diagonal x-component is **0.28598 mN**. The descriptive residual is **+0.00235 mN**, about **+0.82%** of the predicted increment.

This is numerically close, but **not a statistical agreement claim**: the six samples are time samples 20 ms apart, not documented independent preparation replicates; their autocorrelation is not reported; and the charge-transfer, force-meter and geometry uncertainty budget is not numerically supplied.

The perpendicular-B configuration is an x-component null: its predicted added Fx is zero. Yet the baseline-corrected estimate in (ii) exceeds (i) by **0.04667 mN**. The Open University discussion explicitly notes that the pre-charge baseline variation is close to the difference between (i) and (ii). This is a concrete warning against interpreting a small condition-to-condition residual as a new force before baseline and preparation effects are modeled.

### 2.4 Benchmark eligibility

This is a genuine measured demonstration with source-specified charge magnitude, geometry, units and displayed readings. It is suitable as a **standard Coulomb force-to-readout / vector-superposition benchmark**.

It is **not** an H(s)H test and is not a responsive-medium or vortex experiment. It has no charge-polarity reversal, no separation sweep, no independent preparation IDs, no complete high-rate raw series, no numeric covariance/uncertainty budget, and only one measured force component. It cannot test the worldtube-to-medium or medium-to-force maps.

## 3. Revised discriminating test matrix

| Hypothesis | Shared parameters / calibration | Holdout | Predicted observable | Standard comparator | Falsification / identifiability gate |
|---|---|---|---|---|---|
| H0: standard charged-vortex physics | q and polarity calibration; E-field map; separation/geometry; ring radius/energy/circulation; fluid density and temperature; charge leakage; detector gain/offset; background and boundary response | Independent charge preparations and ring/line configurations | Full vector force, ring velocity/radius/energy, beam profile and detector response under ordinary electric and hydrodynamic forces | Maxwell/Coulomb force on charge carriers + established vortex dispersion, Magnus response, drag and ring-line interaction | H0 residuals must be evaluated with a measured covariance and source-backed uncertainty budget. |
| H1: H0 plus an H(s)H medium-mediated term ΔF_HsH | All H0 parameters, plus an explicitly source-authorized worldtube→medium coupling and medium→force constitutive map | Blind polarity × separation × medium-state combinations, with independent preparation and detector channels | A pre-registered signed residual in force and/or vortex response that cannot be absorbed into H0 or calibration parameters | Same H0 model, with identical shared nuisance/calibration parameters | Reject H1 if its required sign/scale/state dependence is absent from held-out data outside the pre-registered predictive region. No numeric threshold is authorized until the actual covariance and uncertainty budget exist. |

Minimum useful polarity design: (++), (+−), (−+), (−−) at multiple separations, with matched medium state and independent preparation runs. Add controls for (a) charge without the candidate vortex state, (b) vortex state without the relevant source charge, and (c) charge carried by a vortex under a known external field. Measure both the force vector and the medium/vortex state; do not infer a force law from a diaphragm or beam-current readout alone.

### Parameter identifiability

An H(s)H correction must have an observable signature outside the span of the shared nuisance and standard-model response. Otherwise a parameter redefinition can absorb it, and the added term is not separately identifiable.

The existing Hale formalization same_span_extra_is_absorbed in [PR #1387](https://github.com/Satobloc/HsH/pull/1387) proves one conditional first-harmonic case of this absorption. The current PR head 2214b0c5492f0c4844e6cc6214ff2aabc253b2c6 has a successful pull-request merge-reference Actions run [#42595895210](https://github.com/Satobloc/HsH/actions/runs/42595895210). That run compiled the theorem; the theorem-specific axiom output includes propext, Classical.choice and Quot.sound. The Vercel check failed its own build-rate limit. This is not a general force-model identifiability proof, and it does not establish that any actual H(s)H term lies in the nuisance span. No new Lean module was created because the physical H(s)H coupling and constitutive force map remain undefined; inventing a formal interface would be premature.

## 4. What this changes in the H(s)H architecture

The earlier three-map chain is retained:

worldtube → responsive-medium state → force → measured observable.

This amendment adds a causal-attribution layer inside the last two transitions, separating external electric force on attached charge, ordinary Coulomb interactions among charged rings, hydrodynamic vortex interactions, and detector impulse. A Kelvin-vortex response in a medium is not by itself evidence that the medium mediates the electrostatic force.

The H(s)H candidate remains tentative and active under the Primary Operational Guideline. The responsive medium remains a provisional third primitive, not an established ontological commitment. The simpler worldtube–timesheet alternative remains open. No extra mechanism, worldtube thickness, twist, contact surface, or physical equivalence is promoted.

## 5. Status and next source cursor

- **P2 remains HOLD.** The OpenLearn experiment is a standard readout benchmark only; no P2 system is selected.
- No H(s)H numerical prediction, fit, parameter estimate, physical falsification threshold, or independent measurement is claimed.
- No SAT-O or Blockwave original equation was copied, normalized, corrected or changed.
- No BEDROCK theory promotion or paper-gate advancement.
- No new tool, dependency, fork, subscription or expense.
- Mersearch was not callable in this runtime; all four shared request lanes were occupied/requested. No request was overwritten or retriggered. The bounded GitHub fallback is not a complete three-archive Mersearch search. HSH_RESOURCES root navigation was read, but no private payload was opened.

**Next scientific cursor:** recover the highest-refinement original SAT-O/Blockwave source for the Kelvin-vortex responsive-medium proposal, preserving exact equation bytes, source SHA and date. Determine whether it actually defines (1) worldtube→medium coupling, (2) medium→force law, both, or neither. Do not substitute the assistant-generated trial Lagrangian or import the ordinary-fluid vortex-core equations into the SAT worldtube.

**Unresolved data requirement:** locate a source-versioned helium experiment dataset with run IDs, charge polarity, field calibration, ring/medium state, separation or interaction geometry, detector calibration, uncertainties and a genuinely independent holdout. The published abstracts and secondary lecture are literature evidence, not a raw dataset.

## 6. Provenance and epistemic status

- **Nathan Direct:** the Kelvin-vortex / responsive-medium electrostatic mechanism is an explicitly tentative working hypothesis, preserved in the parent H951 source-gate report and its cited primary message.
- **Historical sources:** the Rayfield/Reif, Schwarz, Gamota/Barmatz, Huggins, Samuels/Donnelly and Golov/Walmsley/Tompsett papers are external scientific sources with the evidence classes stated above.
- **Standard reference:** NIST 2022 CODATA vacuum permittivity.
- **Measured system:** Open University three-sphere electrostatic demonstration; six published time samples per geometry.
- **Assistant calculation:** baseline-corrected descriptive means and point-charge vector comparison, using the published measurements and stated geometry.
- **Proposal:** the H0/H1 polarity–separation–medium-state holdout matrix.
- **Not established:** an H(s)H medium-mediated electrostatic force, its constitutive law, or independent empirical confirmation.
