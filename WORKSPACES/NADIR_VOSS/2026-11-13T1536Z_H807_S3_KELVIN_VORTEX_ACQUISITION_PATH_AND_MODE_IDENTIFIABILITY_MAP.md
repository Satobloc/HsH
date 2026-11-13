# H807:S3 — Kelvin-vortex acquisition-path map and mode-identifiability gate

**Date:** 2026-11-13T1536Z  
**Selected ring label:** Nadir Voss, index 10  
**Successor label:** Enheduanna, index 11  
**Run key:** \`REVROT3-19-20261011:807:s3\`  
**Status:** SOURCE-MAPPED / ARCHITECTURE-ADDENDUM / P2-CANDIDATE-ONLY / RAW-DATA-NOT-RETRIEVED / NO-PHYSICAL-CALCULATION / NO-NEW-LEAN / NOT-BEDROCK

## 1. Authority, identity and source boundary

The deterministic calculation is \(h=807\), \(seq=5h+3=4038\), \(4038\bmod19=10\). The selected label is Nadir Voss; the next label is Enheduanna.

No authenticated current Nadir thread was established; the current scheduler record has \`chat_ref=null\`. No standalone signed Nathan-authored Nadir specialist charter was recovered. The historical source is the raw conversation:

- Conversation: \`6a3a2037-3698-83ea-924d-2cb8c4ac7701\`
- Path: \`DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/26.06.23•26.10.01•Quantum Gravity and Experiments — raw.json\`
- Git blob: \`d828fef5352045cb4d9486fdbeabd04043c4c119\`
- Direct user messages read: \`bb8ecf64-8863-4ee7-a078-ca8cc4104974\`, \`11122adb-75c5-4418-9b59-29730a034811\`, \`de178e6a-d223-4ad1-9bc9-d37f178f8b21\`.

Those October 1 messages authorize an exploratory sandbox and source/invention separation. They do not override the later real-data-first rule or grant blanket permission for data-free physical calculations. The user-supplied Lane Charter 36 governs this run as an explicit architecture/prediction overlay; Nadir's standing Lane 24 sandbox remains unchanged.

## 2. Primary measured-system source

Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). The author-hosted article PDF is [here](https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/BarckickeFalconGissingerNatPhys2026.pdf).

The source describes a controlled, approximately 0.4 m bathtub vortex with a central air core. The paper's data-availability statement identifies the supporting spectra and other data at Figshare DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The DOI and direct Figshare/API routes were attempted, but no data-file inventory, version, raw bytes or checksums were retrieved in this run. The dataset is LOCATED BY DOI, not DATA-ACQUIRED.

### Source-reported acquisition facts

| Channel | Instrument / method | Readout and source-reported resolution |
|---|---|---|
| Contour / core position | Basler acA2040-120um, 2064 × 1564 px, normal to vortex axis; 8 mm wide-angle and 12 mm small-angle lenses | 300 fps, 30 s recordings; 12.5 cm axial window centered at 22 cm; 60 μm/px; contour width 0.5 mm; typical core-radius and position uncertainty about 0.1 mm |
| Azimuthal flow | Laser-sheet PIV with 10 μm hollow-glass tracers; Phantom V1840 camera from above at 6000 fps; PIVlab | 37 × 23 grid; 2.7 mm spatial resolution; \(\Gamma=2\pi r v_\theta(r)\); typical circulation uncertainty about 0.005 m²/s |
| Vertical flow | PTV of 1.5 mm expanded-polystyrene particles near the core, evaluated at \(r=a(z)\) | \(v_z(z)\); typical uncertainty about 0.05 m/s |
| Counterrotation / handedness | Results section says two orthogonal cameras evidence counterrotating \(m=1\) waves | The Methods section does not map this camera pair, calibration, synchronization or raw acquisition IDs onto the Basler/two-lens contour path. UNRESOLVED ACQUISITION PATH |

The Results description of “two orthogonal cameras” and the Methods description of one Basler camera with two lenses may refer to different acquisition roles or complementary views. The source text alone does not resolve this. It is an unresolved source-to-instrument mapping, not a demonstrated experimental error.

## 3. Typed observation-path architecture

The experiment must not be represented as one undifferentiated “vortex measurement.” Its observation graph has distinct channels:

\[
X_{\rm boundary}(z,\theta,t)
\xrightarrow{I_{\rm contour}}
I_{\rm Basler}
\xrightarrow{C_{\rm contour}}
(r_0,r_\pi)
\xrightarrow{T_{2pt}}
(\eta,a)
\xrightarrow{\mathcal F_{z,t}}
(S_\eta,S_a).
\]

\[
X_{\rm flow}
\xrightarrow{I_{\rm PIV}}
I_{\rm Phantom}
\xrightarrow{\rm PIVlab}
v_\theta(r)
\xrightarrow{2\pi r(\cdot)}
\Gamma(r).
\]

\[
X_{\rm flow}
\xrightarrow{I_{\rm PTV}}
\text{particle tracks}
\xrightarrow{\rm PTV}
v_z(z).
\]

A separate, incompletely specified path is required for the Results-section orthogonal-camera evidence:

\[
X_{\rm mode}
\xrightarrow{I_{\rm orth}}
\text{counterrotation / handedness evidence}.
\]

Each path needs its own acquisition IDs, instrument and calibration IDs, clock/synchronization record, spatial transform, analysis pipeline, uncertainty and covariance. Shared sample conditions and shared instruments must be represented as dependencies, not counted as independent acquisitions.

For any H(s)H candidate, the required forward map is explicitly compositional:

\[
X_{\rm HsH}
\xrightarrow{\Phi_{\rm HsH}}
X_{\rm lab}
\xrightarrow{\Pi_j}
X_j
\xrightarrow{\mathcal O_j}
Y_j,
\]

for each declared channel \(j\). A common “4D” label, a visual resemblance, or a core-radius number does not supply \(\Phi_{\rm HsH}\), \(\Pi_j\), or \(\mathcal O_j\).

## 4. Two-point readout: what it identifies and what it does not

The paper defines

\[
\eta=\frac{r_0-r_\pi}{2},
\qquad
a=\frac{r_0+r_\pi}{2},
\]

where \(r_0=r(z,t,\theta=0)\) and \(r_\pi=r(z,t,\theta=\pi)\).

This is an invertible change of coordinates on the two sampled contour values:

\[
r_0=a+\eta,\qquad r_\pi=a-\eta.
\]

Thus the transform itself loses no information about the pair \((r_0,r_\pi)\). It does not reconstruct the unsampled angular contour.

For a finite Fourier expansion \(r(\theta)=\sum_m c_m e^{im\theta}\), direct substitution gives

\[
a=\sum_{m\ {\rm even}}c_m,\qquad
\eta=\sum_{m\ {\rm odd}}c_m.
\]

So the two-antipodal-point operator is an even/odd parity readout. By itself it does not isolate the exact \(m=1\) coefficient from \(m=3,5,\ldots\), nor distinguish \(m=0\) from \(m=2,4,\ldots\). The paper's stronger mode assignment may rely on additional imaging, spectral or physical constraints; the missing acquisition map must be recovered before crediting those constraints to the two-point transform.

This is not a new Lean result. It is an assistant derivation from the source-defined readout. The existing Nadir formalization already contains the relevant \(m\mapsto m+2\) aliasing counterexample under its declared single-harmonic ansatz.

### Readout identifiability table

| Target | Available channel | Status |
|---|---|---|
| Two sampled contour values \((r_0,r_\pi)\) | \((\eta,a)\) | Bijective reparameterization |
| Two-point centerline offset | \(\eta\) | Geometric estimator for the sampled pair; not a unique \(m=1\) Fourier coefficient |
| Two-point mean radius | \(a\) | Average of two opposing samples; not a full azimuthal average |
| Even/odd mode parity | \((\eta,a)\) | Identifiable under the finite Fourier representation |
| Exact azimuthal mode number | \((\eta,a)\) alone | Not identifiable; \(m\) and \(m+2\) can alias |
| Counterrotation / handedness | Results-section orthogonal-camera claim | Source-to-instrument map unresolved |
| \(\Gamma\) | PIV | Source-reported measured channel; raw fields and covariance not acquired |
| \(v_z\) | PTV | Source-reported measured channel; raw tracks and covariance not acquired |

## 5. Fit versus prediction

The standard comparator is not a single formula:

- Equation (1) is the hollow-core Kelvin \(m=1\) long-wavelength limit.
- Equation (2) is the finite-core Rankine-vortex dispersion relation with vertical flow.

The Methods explicitly state that \(a_0=\langle a(z)\rangle_z\) is measured, then \(\Gamma\) and \(v_z\) are fitted to the spectra using Equation (2), followed by an a-posteriori consistency check against PIV/PTV measurements. The plotted dispersion curve is therefore a calibrated fit/check, not a blind prediction from parameters frozen independently of the target spectrum.

For a genuine held-out test, all shared parameters and calibration must be frozen using separate acquisition blocks or conditions. The entire holdout acquisition/condition must remain untouched; adjacent frames, Fourier bins or spatial points from one recording are not independent acquisitions.

## 6. Conditional model-comparison contract

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification |
|---|---|---|---|---|---|
| Standard fluid baseline | \(a_0,\Gamma,v_z\), forcing and instrument parameters with measured/fitted roles declared | Calibrate on independent runs; freeze before whole-run/condition holdout | \(\omega(k)\), \(S_\eta\), \(S_a\), flow profiles and cross-channel relations | Equations (1) and (2) | Held-out joint residual outside a pre-registered predictive region derived from actual covariance |
| H(s)H minimal worldtube–timesheet representation | Same shared parameters; explicit geometry-to-lab-to-instrument maps; no free extra response | Same acquisitions, calibrations and holdout as baseline | Same output space plus a pre-declared H(s)H-specific cross-channel relation | Same equations (1) and (2) | No distinct out-of-sample prediction, or held-out failure beyond the pre-registered region |
| H(s)H plus derived history/response | Add only if the declared reduced state fails a source-defined closure/fibre test; no free memory kernel | Derive from training-only unresolved state; freeze before holdout | A source-derived history-dependent residual or response | Standard baseline plus a separately specified causal-memory comparator | No reproducible held-out gain, or failure of the pre-registered response relation |
| H(s)H plus independently identified responsive-medium state | Admit only if that state has an independent measurement/readout and is not just a relabeling of ordinary water | Independent channel/calibration and same holdout; no per-channel retuning | Additional cross-channel observable fixed before holdout | Standard fluid model plus measured flow channels | Medium state not independently identifiable, or its predicted cross-channel effect fails |

No numerical rejection threshold is assigned. The paper's marginal uncertainties are not a substitute for the raw paired-channel covariance, calibration covariance, shared-instrument dependence and independent acquisition manifest. The threshold must be derived and pre-registered from those data.

## 7. Geometry: source-forced versus optional

**Forced by the experiment:** a finite air-core vortex, a physical air–water interface, an axial vortex structure, measured flow fields, azimuthal modes and the specified instrument readouts.

**Forced by the representation:** explicit contour extraction, two-point projection, PIV/PTV observation maps, spectral transforms, calibration and cross-channel uncertainty accounting.

**Not forced by this experiment:** identifying \(a_0\) with H(s)H worldtube thickness; identifying azimuthal mode number \(m\) with a SAT twist sector; identifying the air–water interface with an H(s)H contact surface; or adding a separate responsive-medium primitive. Each requires a source-grounded map and an independent observable. The laboratory's ordinary water is not automatically the H(s)H responsive medium.

## 8. Formal verification and existing-tool reuse

No new Lean theorem or PR was created because the existing formalization already covers the two-point readout and the \(m\leftrightarrow m+2\) non-injectivity.

- Nadir PR #1189 remains OPEN / DRAFT / UNMERGED at head \`33a7cb3cd3adaadabb5a7abd94eaf59bb0ef991e\`.
- Current PR-associated Actions run #43339252436 built \`NadirVortexTwoChannelReadout\` at 8945/8961 and replayed \`NadirProjectionCoarseGrainFactorization\` at 8946/8961. The theorem-specific output for \`antipodalModeReadout_two_step\` and \`downstreamModeClassifier_not_injective\` reports \`propext\`, \`Classical.choice\`, and \`Quot.sound\`. The overall root build FAILED later in \`NadirRotatingFluidPIVEnergyReadout.lean\` at lines 123, 133 and 144 because \`omit\` was parsed where a lemma was expected. Tests, lint, nanoda and the global axiom audit were skipped.
- Sable PR #1538 remains OPEN / DRAFT / UNMERGED and stacked on #1189. Its exact-head Actions run #42678421460 checked out head \`ae0e98444b97dcc61de41c15b08a16751f39a9bc\` and completed the 8,955-job root build successfully. It reuses the readout matrix and proves symbolic covariance propagation \(M\Sigma M^\mathsf T\) plus the zero cross-covariance condition. It does not supply measured covariance values or establish independence of the channels.
- No PR, branch, issue, formal source or CI state was modified.

Math Hopper #578 remains extraction-only; its three-repository pilot is configured but not end-to-end verified. Whirligig Kernel 0 remains sandbox-only and is not an equivalent measurement pipeline. SciSpace is available but was not needed after obtaining the primary article PDF. No new tool, fork, dependency, subscription or expenditure was introduced. No fork-enumeration action was exposed in this runtime.

## 9. Data gate and disposition

The Figshare DOI is identified, but no raw files, dataset version, acquisition IDs, checksums, camera metadata, calibration files, paired contour arrays, PIV fields, PTV tracks, analysis scripts or joint covariance were retrieved.

Required next package:

1. Versioned Figshare file inventory and checksums.
2. Raw contour images and paired \(r_0,r_\pi\) series, with acquisition IDs.
3. Camera/lens/camera-pair metadata, geometry, calibration, synchronization and the link to the Results-section orthogonal-camera evidence.
4. PIV fields, PTV tracks, calibration and run-condition records.
5. Analysis code and exact parameter-fitting/selection provenance.
6. Raw paired-channel covariance and shared-instrument dependence.
7. Independent acquisition/condition manifest and holdout-access audit.

P2 remains HOLD. The air–water vortex remains a candidate, not a selected system. No physical calculation, fit, new prediction, independent measurement, paper-gate advancement or theory promotion occurred. The task graph was not modified.

## 10. Workflow and upkeep

Mersearch was not callable in this runtime. All four live request files remain \`requested\`; their expected request-scoped manifests and search receipts were not found. No request was submitted, overwritten or retriggered. The original Nadir conversation was recovered directly from the HsH raw export as a bounded fallback; this is not represented as a Mersearch search.

The HsH default branch \`main\`, BEDROCK, Primary Operational Guideline, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, revival V3/V4, thread-first/routing rules, scheduler authority, current task graph and relevant Nadir receipts were read. SAT archive and HSH_RESOURCES front doors were read; HSH_RESOURCES private payload was not accessed. The task graph remains ACTIVE_SEED with 16 declared branches and 18 records. The P2 branch remains HOLD; no shared task-graph mutation was made.

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 cognition, Orson-owned | OVERDUE / NOT READY |
| P2 measured-system geometry | HOLD |
| P3 full theory | INCOMPLETE |
| FIE next rereview | November 24 |

Last FIE rereview was November 10; no new rereview was due.

Unrelated reading: Okakura, *The Book of Tea*, Project Gutenberg #769, HTML lines 36–133. The reading moved from the essay's opening account of tea's cultural transformation through the historical schools of preparation and into the opening of its Taoism/Zennism discussion. Next cursor: line 134. No physical break is claimed.

## 11. Successor and scheduler state

Next deterministic label: Enheduanna, h807:s4. Enheduanna's README identifies no authenticated current thread and no standalone Nathan-authored specialist charter; the available direct instruction is broad archive consideration. The handoff is repository-only optional context, with no task, response obligation, review request, deadline or ownership transfer. No direct thread delivery, consumption or acknowledgment is claimed.

The existing :36 automation remains enabled under ID \`6a9f52b69ec08191b0a2ba24a074f781\`, with its exact original America/New_York hourly DTSTART/RRULE, prompt and phase. Current run ID \`a4769f0c-ee78-832a-97c9-f26a70cfd397\` is recorded IN_PROGRESS, started \`2026-11-13T15:35:41.737032Z\`, completion null, chat_ref null. Its cached latest result belongs to Mira h806:s3, not this Nadir run. The :48 task remains enabled and unchanged. No task, ID, cadence or phase mutation; no sixth task; no signet or chat rename.

---

**Return pin:**  
\`H807:S3 / NADIR VOSS / ENHEDUANNA-NEXT / LANE36-ARCHITECTURE-OVERLAY / STANDING-LANE24-PRESERVED / KELVIN-VORTEX-SOURCE-MAPPED / FOUR-OBSERVATION-PATHS / TWO-POINT-READOUT-PARITY-ONLY / M1-M3-ALIAS-EXISTING-LEAN / CAMERA-TOPOLOGY-UNRESOLVED / FIT-NOT-BLIND-PREDICTION / FIGSHARE-LOCATOR-FOUND-DATA-NOT-RETRIEVED / NO-PHYSICAL-CALCULATION / NO-NEW-LEAN / PR1189-ROOT-FAILURE-UNRELATED-PIV / PR1538-EXACT-HEAD-SUCCESS-SYMBOLIC-COVARIANCE / P2-HOLD / P0-ACTIVE / P1-ORSON-OWNED-NOT-READY / P3-INCOMPLETE / FIE-NOV24 / BOOK-OF-TEA-134 / ENHEDUANNA-OPTIONAL-HANDOFF / AUTOMATION-UNCHANGED / NO-SIXTH-TASK / S36-IN_PROGRESS\`.
