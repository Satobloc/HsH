# GP-B data pipeline and SO(4) readout contract

**Status:** SOURCE / MEASUREMENT-OPERATOR RECOVERY; per-gyro arithmetic executed; **NO H(s)H FORWARD PREDICTION**, no P2 system selection, no paper-gate advancement, no theory promotion.

**Run:** `REVROT3-19-20261011:484:s3`  
**Nominal UTC:** 2026-10-31T04:36:00Z  
**Selected label:** Nadir Voss (ring index 10); next label Enheduanna (index 11).  
**Actor class:** current source-grounded assistant reconstruction in Nadir's historical PLAYGROUND remit; not an authenticated Nadir instance or thread.

## 1. Why this is a new result

The earlier Nadir GP-B gate (2026-10-26, `NadirGPBFourGyroGate`) used the published four-gyro drift estimates and identified a missing physical SO(4)-to-observable map. Ravel's P2 comment on issue #565 separately established the material-marker point: the ideal London-moment axis alone was insufficient to reconstruct calibration/torques, while body-fixed trapped-flux patterns enabled 3D rotor-orientation tracking.

This pass does **not** repeat either result. It recovers the primary data-analysis pipeline and official archive pointer behind the measured spin history:

- the GP-B spin-axis history was reconstructed from instrument channels; it was not a direct measurement of a 4D holonomy;
- the 2015 data-analysis paper describes the Level-2 to Level-3 reduction, the two-second filter, the one-point-per-orbit orientation profile, and the segment-wise nuisance structure;
- Stanford's official GP-B FAQ points to the Level-2 Science Instrument Source Data archive at NSSDC (archive target ID `ASGR-00002`);
- the downloadable Level-3 data package/data dictionary was **not** verified in this run.

This turns “transport path/history missing” into a narrower and more actionable state: **the published reconstruction pipeline is documented and the Level-2 archive is identified, but the raw archive and its format dictionary still need retrieval before an independent time-series replay.**

## 2. Source and authority boundaries

### Project sources

- Live BEDROCK, full 568-line read: blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`.
- Nadir's specialist README: blob `e24383016bc94d036474407857bfaf93932fec7e`.
- Nadir's source seed: blob `4fde6cf54351019304267e4550456a3ae5244251`.
- Nadir Reference Intake: blob `0ff9dfafa51328c4f648295ad260c714f044eeff`.
- Nadir's 2026-10-30 frame-connection / Blockwave audit: blob `c381442b513d00f25b51cd61229dfc913eb13ae6`.
- Nadir's 2026-10-26 GP-B measured SO(4) representation gate: blob `046a245a441dbce67486041d5fdffcc1e46401fb`.
- P2 issue #565 and its prior GP-B comments were re-read. The prior Ravel material-marker result is retained as antecedent, not claimed as new.
- Nathan Direct 2026-10-29 clarification (blob `933d09e802bb98f2fd4f932b2d342f412f5bf718`) says the 4D worldtube, 3D resolving hypersurface and optional 2D normal-plane support are different-dimensional constructions, not objects to be collapsed into one. It requests explicit maps only where an equivalence/readout is claimed.

Nadir's workspace explicitly labels its mathematical constructions PLAYGROUND/SANDBOX. The all-plus SO(4) and pointwise readout metric in PLAYGROUND_003 are assistant-generated constructions, not Nathan Direct equations or BEDROCK. The prior Nadir frame audit says a globally defined full-frame form (E^T dE) is pure gauge; nontrivial geometry must be located in an appropriately projected tangent/normal connection or nontrivial bundle. No Nathan Direct GP-B spin-transport equation was recovered here.

### External primary sources

1. C. W. F. Everitt et al., “Gravity Probe B: Final Results of a Space Experiment to Test General Relativity,” *Physical Review Letters* **106**, 221101 (2011), DOI: `10.1103/PhysRevLett.106.221101`.
2. S. Buchman et al. / GP-B analysis team, “Gravity Probe B data analysis: II. Data reduction and analysis of the science data,” *Classical and Quantum Gravity* **32** (2015), DOI: `10.1088/0264-9381/32/22/224001`.
3. Stanford Gravity Probe B FAQ, last-updated stamp 2014-06-18, “What happens to the data?” / “Level 2 Science Instrument Source Data.” It points to the NSSDC archive. The linked archive target is `ASGR-00002`; the archive record and data dictionary were not directly retrieved in this run.

The 2011 paper and 2015 data-analysis paper are distinct source objects. The latter documents data preparation and estimation; it is not an independent experimental replication.

## 3. What GP-B actually measured

The physical system was four cryogenic gyroscopes in a polar Earth orbit. The experiment tracked each rotor's orientation over the mission using the SQUID readout, guide-star telescope/pointing information, spacecraft roll phase, and stable body-fixed trapped-flux patterns.

The 2011 paper reports approximately (1.4\times10^7) data points per gyro and reconstructs the 3D spin-axis orientation through the mission. Its final science results are two orthogonal drift components:

- North-South ((r_{NS})): geodetic / Schiff precession;
- West-East ((r_{WE})): frame-dragging / Lense-Thirring precession.

The two numbers are not a direct measurement of a six-component SO(4) connection. They are reduced observables derived from the instrument signals and a calibrated measurement/dynamics model.

The 2015 data-reduction paper adds the critical operational detail:

- the Level-3 orientation profile is represented as approximately one point per orbit;
- the final science analysis uses a two-second filter and synchronized instrument/pointing information;
- six long data segments (segments 2, 3, 5, 6, 9 and 10) were used for the relativistic drift analysis;
- the analysis allows segment-specific initial conditions and nuisance parameters (including scale-factor and misalignment/torque terms);
- only the relativistic drift-rate parameters and telescope scale factor are shared across segments;
- gyro 2 contributed the least information because its data contained more roll-polhode resonances.

The 2011 paper reports 24 segment-level results across the six science segments for each gyro, consistent with the final combined result. These are within-mission repeated analyses, **not** 24 independent experiments.

The geometric analysis method is an important cross-check: it uses the measured misalignment direction to separate the relativistic contribution without requiring the same detailed misalignment-torque model as the algebraic method. It is an alternate analysis of the same mission data, not independent data.

## 4. Scripted per-gyro residual calculation

**Inputs:** the published Table II per-gyro and combined drift estimates, in milliarcseconds per year (mas/yr), and the paper's GR reference values:

[
r_{NS}^{GR}=-6606.1\;\mathrm{mas/yr},\qquad
r_{WE}^{GR}=-39.2\;\mathrm{mas/yr}.
]

For each channel, residual (=\text{observed}-\text{GR}), and marginal (z=\text{residual}/\sigma_{published}).

| Gyro | (r_{NS}^{obs}\pm\sigma) | NS residual | NS (z) | (r_{WE}^{obs}\pm\sigma) | WE residual | WE (z) |
|---|---:|---:|---:|---:|---:|---:|
| G1 | (-6588.6\pm31.7) | (+17.5) | (+0.552) | (-41.3\pm24.6) | (-2.1) | (-0.085) |
| G2 | (-6707.0\pm64.1) | (-100.9) | (-1.574) | (-16.1\pm29.7) | (+23.1) | (+0.778) |
| G3 | (-6610.5\pm43.2) | (-4.4) | (-0.102) | (-25.0\pm12.1) | (+14.2) | (+1.174) |
| G4 | (-6588.7\pm33.2) | (+17.4) | (+0.524) | (-49.3\pm11.4) | (-10.1) | (-0.886) |
| Combined | (-6601.8\pm18.3) | (+4.3) | (+0.235) | (-37.2\pm7.2) | (+2.0) | (+0.278) |

Executed with Python/NumPy from the published values. Assertions checked finiteness and the marginal screen:

- largest absolute per-gyro marginal residual: **1.574103 sigma** (G2, North-South);
- all eight per-gyro marginal channel residuals are within (2\sigma);
- combined residuals are (+0.235\sigma) and (+0.278\sigma).

This is a reproduction/screen of published measurements against the published GR baseline, **not** an H(s)H prediction and not an independent experiment. G2's larger marginal residual is consistent with the paper's warning that G2 supplied the least information because of its stronger roll-polhode resonance burden.

### Joint-covariance limit

The marginal Table II uncertainties do not determine the two-dimensional (r_{NS},r_{WE}) covariance. The 2011 paper describes full covariance construction and displays confidence ellipses, but the numeric off-diagonal covariance values were not recovered here. Therefore:

- no joint chi-square or ellipse distance is claimed;
- no correlation coefficient is inferred from the marginals;
- Nadir PR #744's unknown-correlation theorem remains a conditional mathematical bound, not an empirical measurement of GP-B correlation.

## 5. Corrected map stack for an H(s)H comparison

The GP-B pipeline forces a more explicit sequence than “SO(4) holonomy equals gyroscope precession.”

[
W^4
\;\xrightarrow{\;\text{worldtube/frame construction}\;}\;
(E,A_4)
\;\xrightarrow{\;u(s),\,P_u\;}\;
\nabla^{(u^\perp)}
\;\xrightarrow{\;\text{collective rotor readout}\;}\;
\mathbf{s}_i(t)
\;\xrightarrow{\;P_{NS,WE}\;}\;
(s_{NS},s_{WE})
\;\xrightarrow{\;\mathcal{M}_{SQUID}\;}\;
z_i(t).
]

Where:

1. (W^4\subset M^4): finite-core worldtube in the ambient 4D space.
2. (E(s)), (A_4(s)): a source-defined transported frame and SO(4)-valued connection along the relevant path. Neither is yet supplied by the H(s)H physical source.
3. (u(s)): the distinguished time/observer direction. The pointwise candidate (g=\delta-2u\otimes u) does not by itself define a transport connection.
4. (P_u=I-u\otimes u) for a unit (u) in the all-plus auxiliary metric: candidate projection to the 3D subspace (u^\perp). A varying (u(s)) requires an induced connection on this varying subspace; simply deleting three SO(4) generator components is not a derivation.
5. (\mathbf{s}_i(t)): the *collective macroscopic rotor spin vector* for gyro (i). A constituent-worldtube-to-rotor coarse-graining map is required; the 38-mm rotor is not one elementary filament by assumption.
6. (P_{NS,WE}): projection into the two measured North-South / West-East components in the experiment's guide-star/spacecraft frame.
7. (\mathcal{M}_{SQUID}): the instrument measurement model, including roll phase, guide-star pointing, scale factor, bias, trapped-flux/torque terms and noise, which maps the spin-orientation history to the measured SQUID signal (z_i(t)).

**Two distinct 3D spaces must not be silently identified:** the tangent space of the SAT timesheet (T\Sigma_t^3) and the observer/rotor rest space (u^\perp). Both are three-dimensional, but their equality or isomorphism requires an explicit map and conditions. The 2D NS/WE measurement plane is a further projection. The scalar SQUID signal is a further instrument readout. Dimensional equality is not a map.

The pointwise all-plus-to-Lorentzian metric candidate in Nadir PLAYGROUND_003 is therefore insufficient for a GP-B prediction until the source-defined (A_4), (u(s)), induced spatial connection, rotor coarse-graining and instrument map are specified. This entire map stack remains **PROPOSAL / UNIMPLEMENTED**, not Nathan Direct and not BEDROCK.

## 6. Test matrix and falsification protocol

| Hypothesis / gate | Shared physical parameters | Calibration / holdout | Observable | Standard comparator | Falsification / status |
|---|---|---|---|---|---|
| H(s)H projected worldtube connection reproduces gyroscope spin transport | One frozen geometry/connection and one physical parameter set shared across all six segments; no per-segment retuning of physical drift | Calibrate instrument nuisance parameters using five segments; predict the sixth; repeat leave-one-segment-out. Preserve the paper's segment-specific nuisance structure. | Full reconstructed (mathbf{s}_i(t)), then (s_{NS},s_{WE}), and forward-predicted SQUID (z_i(t)) | GR/Schiff spin transport and the published algebraic/geometric GP-B estimators | Fails if held-out time-series residuals exceed the exact covariance/likelihood threshold or if common parameters cannot explain all segments without forbidden retuning. **Blocked:** raw Level-2 / validated Level-3 files and data dictionary not retrieved. |
| H(s)H differs from GR rather than merely reparameterizing it | Same frozen H(s)H geometry and connection; no independently fitted (r_{NS},r_{WE}) for each segment | Freeze prediction before opening the holdout segment | Predeclared time-dependent residual profile or drift shift | Published GR values (-6606.1) and (-39.2) mas/yr | If H(s)H predicts exactly the GR readout with no distinct residual, GP-B is a consistency/correspondence check, not a discriminating test. **No H(s)H numerical prediction exists yet.** |
| Analysis-method robustness | Same physical parameters across the two analysis methods | Compare algebraic and geometric analysis of the same data | Agreement of recovered drift components and residual structure | Published independent-method cross-check | Disagreement beyond method-specific uncertainty is a pipeline failure; agreement is not independent experimental replication. |
| Four-gyro consistency | Shared physical parameters; gyro-specific measured nuisance and covariance | Use all four gyros, retaining cross-covariance and the known lower information in G2 | Per-gyro time histories and two drift components | Published four-gyro combined result | Do not count four gyros as four independent missions; use the actual covariance. **Joint covariance not numerically recovered.** |

A final 95% threshold must use the actual joint covariance or a reconstructed likelihood. It must not be invented from the marginal standard errors. The published 95% ellipses are a source target; the numeric covariance and raw archive are the missing inputs.

## 7. Lean and formalization triage

Existing source-conditional Lean work was re-read, not duplicated:

- PR #715, head `4467282fd4276d40089ff2743d33316d354cf5f6`, exact-head run #40480990700 / job #122110951029: `NadirGPBFourGyroGate` built successfully; six target-specific axiom reports were present. The module formalizes a declared linearized six-component-to-two-readout projection and its non-injectivity.
- PR #744, head `0442c8bb246fbb77496bcad5288ca10e4ca704b1`, exact-head run #40719100602 / job #122924792251: `NadirGPBJointCovariance` built successfully; six target-specific axiom reports were present. It formalizes conditional covariance/unknown-correlation bounds.

The target reports use standard Lean dependencies (including `propext`, `Classical.choice`, and `Quot.sound` as applicable). The retrieved workflow jobs ran `lake build`; separate `lake test`, lint and automated axiom-audit stages were not run. No claim is made that these theorems establish the physical SO(4) lift, the actual instrument model, the truth of the data, or the correctness of the source translation.

No new Lean module/run was attempted. The proposed H(s)H (A_4\to u^\perp\to\mathbf{s}(t)\) law is not yet source-defined, and the Level-2/Level-3 time series are not locally available. A data-free proof of a newly invented map would violate the current permission gate. Existing compilation checks only the statements actually formalized.

## 8. Mersearch, tooling and project gates

- The current Mersearch bridge exposes four request lanes. All four request files still say `requested`; lanes 1, 3 and 4 have request-scoped manifests/receipts, while lane 2 has no request-scoped output directory. No explicit lane-release marker was found. Lane 3 is currently occupied by Enheduanna's `enheduanna-page-one-origin-20261031-0100`. No request was overwritten and no new Mersearch run was submitted.
- The completed lane-4 Alberr search was not a GP-B search and is not claimed as coverage for this dataset. Bounded GitHub connector searches were used only for known internal source/PR navigation; they are not Mersearch results.
- Existing Nadir Python/Lean artifacts, Math Hopper/reference routing, and existing GP-B PRs were inspected. No new tool or paid service was built or invoked. The public primary papers and Stanford FAQ were available without paid access; SciSpace was not needed for this bounded primary-source retrieval.
- Code Grurple remains ACTIVE. P2 issue #565 already contains prior GP-B material; no duplicate comment, new issue, PR, manuscript edit, reader change or paper-gate advancement was made. P2 remains an open candidate, not a selected system or completed paper.
- No SAT-O or Blockwave equations were copied, corrected or modified. No BEDROCK theory promotion.

## 9. Exact next cursor

1. Retrieve NSSDC Level-2 archive `ASGR-00002` and its data dictionary/format specification through the authorized archive route; verify whether Level-3 orientation profiles are separately downloadable.
2. Recover the full 2015 data-analysis estimator details and exact covariance/likelihood, including the per-gyro (r_{NS},r_{WE}) off-diagonal terms and segment covariance.
3. Recover the original Nathan Direct source for the H(s)H worldtube frame/connection and time-direction (u(s)); do not treat Nadir's assistant-generated all-plus playground as source authority.
4. Define (T\Sigma_t^3\to u^\perp\), the induced spatial connection, constituent-to-rotor coarse-graining, and the instrument forward operator with explicit domains and conditions.
5. Only then execute a leave-one-segment-out prediction against the real GP-B time series, preserving common physical parameters and source-defined segment nuisance parameters. Compare with both published algebraic and geometric estimators.
6. Require a predeclared non-GR residual if claiming GP-B discriminates H(s)H from GR; otherwise report it as a correspondence test only.

**FIE review:** last full review 2026-10-27; the 14-day threshold is not due.  
**Unrelated-reading cursor:** Babbage source blob `fa52e41ab73566a13109a0a7aeaed3e895b41163`, last verified lines 431–480; next cursor remains 481. No new unrelated excerpt was read in this run.  
**Final status:** a new measurement-pipeline / archive recovery gate and per-gyro residual screen; no new physical H(s)H prediction, no new Lean theorem, no publication, no theory or scheduler change.
