# P2 source-readiness matrix: empirical package × discrimination gate

**Date:** 2026-11-16  
**Run:** `REVROT3-19-20261011:864:s3`  
**Disposition:** CROSS-CANDIDATE SOURCE-READINESS SYNTHESIS / NO P2 SYSTEM SELECTED / P2 HOLD / NO PHYSICAL CALCULATION / NO H(s)H PREDICTION / NO THEORY PROMOTION

**Relationship:** This is a cross-candidate decision-support addendum to the existing P2 docket [#565](https://github.com/Satobloc/HsH/issues/565). It consolidates existing candidate records; it does not replace or duplicate their source reports, and it does not select a system.

## 1. Rotation and source authority

\[
h=864,\qquad seq=5(864)+3=4323,\qquad 4323\bmod19=10.
\]

- Selected ring label: **Nadir Voss**, index 10.
- Next ring label: **Enheduanna**, index 11.

The recovered historical conversation authorizes a broad independent sandbox and archive-grounded exploration, but no standalone signed Nadir specialist charter was found. The current Lane 36 instruction is the controlling task-specific overlay. The Nadir workspace remains an assistant-generated sandbox, not a permanent Nathan-authored identity or theory authority. No authenticated current Nadir thread or historical-instance participation is claimed.

## 2. New gate: empirical readiness and discriminability readiness are separate

A candidate is P2-ready only when all three gates pass:

\[
P2_{\mathrm{ready}} = E_{\mathrm{pass}}\land D_{\mathrm{pass}}\land R_{\mathrm{pass}}.
\]

- **E — empirical package readiness:** identifiable measured system; exact source and dataset version; raw or reproducibly processed observations; acquisition/run IDs; units; instrument geometry and calibration; synchronization; measurement uncertainty and covariance; repeat/independent-unit structure.
- **D — discrimination readiness:** source-authorized H(s)H forward map with explicit domain, codomain, coordinates and units; admissible standard comparator; shared parameters frozen before holdout; nuisance/flexibility audit; a predeclared observable that is not absorbed by the standard model; a falsification threshold derived from the actual uncertainty model.
- **R — review readiness:** independent source/measurement review, reproducible artifact and explicit epistemic disposition.

This is deliberately non-compensatory. Excellent data access cannot compensate for a missing H(s)H forward map. An attractive geometric proposal cannot compensate for missing observations or calibration. A Lean proof can validate a formalized conditional map statement but cannot pass E or establish the physical premises.

## 3. Candidate readiness crosswalk

Statuses below are inherited from the existing public candidate records, not new data retrieval or independent reanalysis.

| Candidate / existing record | Empirical package (E) | Standard comparator | H(s)H map and discrimination (D) | Current disposition |
|---|---|---|---|---|
| **Synchronized free-surface + 4D-PTV vortex ring** — [#1665](https://github.com/Satobloc/HsH/issues/1665), Han et al. (2026), DOI 10.1007/s00348-026-04256-5 | Simultaneous stereoscopic surface measurement and volumetric 3D particle tracking share a coordinate system and time base. Full article is subscription content; supporting data are available from authors on request; the listed supplement is a GIF, not a raw-data deposit. Raw images, tracks, calibration matrices, timestamps, covariance and repeat-run structure were not retrieved. | Classical vortex-ring/free-surface dynamics with synchronized surface and bulk-flow readouts. | No source-defined H(s)H-to-fluid/interface map. No frozen shared-parameter/holdout package or complete covariance. The reported 0.65% kinematic-boundary residual is a normalized quality check, not a complete uncertainty budget. | **Highest geometric leverage / E partial / D blocked.** Best next acquisition lead, not a P2 selection. |
| **3D bubble–vortex-ring interaction** — [#1339](https://github.com/Satobloc/HsH/issues/1339), Estepa-Cantero et al. (2026), DOI 10.1017/jfm.2026.12078 | Six-camera bubble-shape tomography and four-camera 3D LPT; public supplementary raw movies exist. Processed tracks and calibration are available on reasonable request. Detailed methods in the existing note are from author-uploaded preprint v1; final journal PDF was not retrieved there. Reported flow-parameter errors <3%, bubble-size error <1%, velocity uncertainty about 2–10% by region. | Classical bubble/vortex interaction and measured 3D flow/bubble-shape response. | No source-defined H(s)H map. Processed tracks, camera calibration, covariance and acquisition joins remain unavailable. | **Strong 3D finite-core lead / E partial / D blocked.** Second data-acquisition priority. |
| **Air–water bathtub Kelvin-wave vortex** — [#565](https://github.com/Satobloc/HsH/issues/565), [#1484](https://github.com/Satobloc/HsH/issues/1484), Barckicke et al. (2026), DOI 10.1038/s41567-026-03175-w; data DOI 10.6084/m9.figshare.30903347 | Paper reports 60 μm/px, 0.5 mm contour width, typical core-radius/position uncertainty about 0.1 mm, PIV circulation uncertainty about 0.005 m²/s and PTV vertical-velocity uncertainty about 0.05 m/s. Figshare bytes/version, file inventory, acquisition IDs and paired raw contours/covariance remain unretrieved. | Paper Eq. 1 hollow-core Kelvin limit; Eq. 2 Rankine core with uniform vertical flow; Phillips comparison. The paper uses measured \(a_0\), fits \((\Gamma,v_z)\) to dispersion data, then checks them a posteriori against PIV/PTV: fit-conditioned, not a blind holdout. | The H(s)H forward map is missing. A separate camera/view-role ambiguity and paired-contour covariance gap remain in the existing source audit. | **Good paired-readout candidate / E partial / D blocked.** Do not count modes, PDFs or instruments from one apparatus as independent replication. |
| **GW190425 binary-neutron-star inspiral** — [#1669](https://github.com/Satobloc/HsH/issues/1669), DOI 10.3847/2041-8213/ab75f5 | GWOSC event release and LIGO DCC posterior-sample release are public; 128 s of data over 19.4–2048 Hz and detector calibration/PSD products are documented. The HDF5 bytes were not downloaded in the existing record. Calibration uncertainties and prior sensitivity are documented. | Published GR waveform families (PhenomPv2NRT and cross-check approximants), detector response, PSD and calibration model. | No source-defined H(s)H geometry-to-waveform map. Posterior parameters are conditional on waveform family, priors, calibration and noise model; this is not an H(s)H prediction. | **Strongest public-data lead / E comparatively higher / D blocked.** Useful only after a source-derived waveform map exists; not a direct finite-core geometry selection. |
| **Finite-wall vortex-ring collision** — [#1684](https://github.com/Satobloc/HsH/issues/1684), McAtee & Raghav (2026), DOI 10.1017/jfm.2026.11137 | Five runs per plate-size/Re condition; quantitative PIV is 2D2C in one symmetry plane. Separate LIF movies are only approximately time-matched. Data are available on request. Reported average PIV velocity uncertainty is about 2% of peak velocity for the smallest-Re case; no complete derived-observable covariance package. | Viscous vortex-ring/wall interaction, measured circulation, core trajectory and boundary-layer/edge-vorticity behavior. | No source-defined H(s)H contact or worldtube-to-PIV map. A 2D plane does not identify unrestricted 3D off-plane structure. | **Contact-rich but projection-limited / E partial / D blocked.** |
| **Rotating He-II vortex-lattice PIV** — [#1726](https://github.com/Satobloc/HsH/issues/1726), Lorin et al. (2026), arXiv:2607.00821 | 22 runs at 10 rpm and 2.088 K; data are available on request, not retrieved. 2D PIV vector spacing is about 214 μm and interrogation width 428 μm; it is not core-radius-resolved. A 50 μm cell-camera motion was reported by the apparatus paper at 15 rpm, but the 10 rpm runs lack run-specific motion amplitude/phase. | Conventional He-II inertial/Kelvin-wave and Donnelly–Glaberson model. | No H(s)H-to-superfluid or instrument map. Platform motion, PIV resolution and missing run-level covariance must be resolved before interpreting spectral excess. | **Useful motion-control candidate / E partial / D blocked.** |

**Separate standard-physics control:** Ravel's NIST/BIPM torsion-balance record [#1716](https://github.com/Satobloc/HsH/issues/1716) is not a selected P2 system. Its published geometry is available, but raw torque/CMM point-cloud inputs remain unavailable in the current audit, and the point-mass source-equation discrepancy prevents treating that reconstruction as an admissible finite-support comparator. Preserve Ravel's source correction and ownership; do not duplicate it here.

## 4. Acquisition priority, not system selection

For a geometry-specific test, the next highest-value data request is the Han et al. synchronized SVS + 4D-PTV package: per-run surface reconstructions, volumetric tracks/velocity fields, joint calibration and space-time registration, acquisition IDs, raw/processed version manifest, covariance/uncertainty products and a genuinely withheld run or condition.

Second is the Estepa-Cantero 3D bubble-vortex package: processed 4D-LPT tracks, camera calibration, bubble-shape reconstruction, run identifiers and joint uncertainty/covariance. The public supplementary movies alone are not a calibrated quantitative dataset.

The Barckicke Figshare package is a separate, lower-cost retrieval lead: obtain the exact DOI version, file inventory, paired raw contour samples, camera/view IDs, synchronization and sample-level \((\eta,a)\) covariance. Do not reconstruct covariance from separately acquired PDFs.

No author request was sent, no dataset was downloaded or reanalysed, and no candidate was selected.

## 5. Required hypothesis / comparator / holdout matrix

| Hypothesis | Shared parameters and calibration | Calibration / holdout split | Predicted observable | Standard comparator | Falsification condition |
|---|---|---|---|---|---|
| \(H_0\): established system physics is sufficient | Use only source-reported physical parameters, geometry, instrument calibration, noise/covariance and run metadata. Preserve per-run parameter differences; do not pool distinct conditions. | Freeze parameters on identified calibration runs. Hold out a separately identified run, forcing condition, impact condition or event before model selection. | The complete source-supported readout vector, not a selectively chosen scalar: surface + bulk flow; core + bubble shape; paired \(\eta/a\); strain + detector response; or contact/trajectory observables, as applicable. | The candidate's published classical fluid, GR waveform, or Newtonian finite-support model, with its actual nuisance and calibration structure. | A standard-model failure is meaningful only if the source, raw data, calibration and uncertainty package are admissible and the residual survives independent reproduction. |
| \(H_1\): source-authorized H(s)H extension | Same measured physical parameters and instrument calibration as \(H_0\). Add only degrees of freedom explicitly supported by Nathan Direct source material and accompanied by a defined forward map. Freeze every added parameter before holdout access. | Same calibration and holdout as \(H_0\); no H(s)H-only recalibration, post-hoc parameter expansion or wider discrepancy allowance. | A specific additional relation among the same held-out observables that \(H_0\) cannot produce under its admissible parameter/nuisance range. | Identical \(H_0\) comparator and observation operator. | \(H_1\) fails if its frozen prediction misses the covariance-aware holdout envelope, or if its claimed signature is absorbed by \(H_0\)'s allowed nuisance span. \(H_0\) is challenged only by a predeclared held-out feature that \(H_1\) predicts and \(H_0\) cannot. |

No numeric falsification threshold is supplied here: the necessary raw data, calibration covariance and independent-unit structure are not yet available for any candidate that also has a defined H(s)H forward map.


## 6. Candidate-specific test matrix (design only; no fit or prediction executed)

| Candidate | Shared parameters and calibration | Calibration / holdout | Predicted observable | Standard comparator | Falsification threshold |
|---|---|---|---|---|---|
| Han et al. synchronized SVS + 4D-PTV | Measured circulation, ring/core geometry, \(Re_\Gamma\), fluid properties, free-surface geometry, SVS/4D-PTV calibration and common time/space registration. The actual run-level values and covariance must be recovered from authors. | Freeze on identified calibration impacts/runs; hold out a distinct impact/run with untouched surface and volumetric records. | Joint surface-height/shape history, 3D velocity field, core trajectory and energy-transfer observables on the same clock. | Classical vortex-ring/free-surface Navier–Stokes model with the source's actual boundary conditions and instrument operators. | Joint covariance-aware residual of the frozen surface + bulk-flow prediction outside the preregistered holdout envelope, after standard-model nuisance parameters are frozen. No numeric cutoff before the joint covariance arrives. |
| Estepa-Cantero 3D bubble–vortex ring | \(Re_\Gamma\), circulation, ring/core geometry, bubble size/shape, fluid properties, six-camera calibration, 4D-LPT volume calibration and timing. | Calibrate on one identified case; hold out a separate bubble-size or vortex-strength case, not merely another frame from the same trajectory. | Bubble surface/shape evolution, core centerline/deformation, 3D velocity and breakup/capture outcome. | Two-phase classical fluid dynamics and the paper's measured vortex/bubble model. | Held-out joint shape/trajectory/velocity residual beyond the measured spatially varying uncertainty and calibration covariance. Current preprint error summaries are not a complete joint covariance. |
| Barckicke air–water Kelvin vortex | Per-run \(a_0,\Gamma,v_z\), pump setting, drain diameter, forcing frequency, contour-camera calibration, PIV/PTV calibration and paired-contour covariance. | Freeze on one run/forcing condition; hold out a separately identified forcing frequency or acquisition. Do not use the same fitted \((\Gamma,v_z)\) as both calibration and validation. | Paired \(\eta(z,t)\) and \(a(z,t)\) spectra jointly with PIV circulation and PTV vertical velocity. | Paper Eq. 1 hollow-core limit and Eq. 2 Rankine core with uniform \(v_z\), plus the reported Phillips negative comparison. | Joint held-out spectral/readout residual outside the measured \((\eta,a)\), PIV and PTV covariance envelope. Raw paired contours and covariance are presently missing. |
| GW190425 | Source masses/spins/tidal parameters, detector calibration envelopes, PSD/noise model, transient treatment, waveform approximant and priors. | Freeze a source-to-waveform map and parameters using calibration events or a predeclared frequency region; hold out a separate event or band not used for tuning. A single event is not an independent-laboratory replication. | Calibrated strain residual and posterior-predictive waveform features, preserving detector-specific response and uncertainty. | Published GR waveform families and detector-response/noise model. | Predeclared calibrated-strain residual or posterior-predictive failure beyond detector and waveform uncertainty on a genuine holdout. No H(s)H waveform map exists yet. |
| Finite-wall vortex ring | Circulation, Reynolds number, plate diameter/alignment, initial core geometry, actuator/flow-meter calibration and PIV uncertainty. | Freeze on selected plate/Re conditions; hold out a different plate-size or Reynolds-number condition with run IDs preserved. | Core trajectory, circulation evolution, in-plane velocity/vorticity and boundary-layer/edge-separation observables. | Classical viscous vortex-ring/finite-wall interaction with the paper's actual 2D2C PIV operator. | Held-out trajectory/circulation/separation residual outside the PIV and initial-condition uncertainty; no full 3D claim from the measured plane. |
| He-II vortex lattice | Rotation \(\Omega\), temperature, heater power/heat flux, circulation quantum, tracer/PIV calibration, cell-camera motion and interrogation-window response. | Freeze at one \(\Omega\)/power regime; hold out another rotation speed and heat-power condition with frame-synchronous motion correction. | Motion-corrected spatial/temporal spectra and onset/branch observables at the measured resolution. | Conventional inertial/Kelvin-wave and Donnelly–Glaberson models with platform-motion contribution included. | A frozen spectral feature must survive cell-motion correction, resolution/window sensitivity and the covariance-aware holdout. The 15-rpm motion amplitude cannot be substituted for unmeasured 10-rpm run-specific motion. |

This matrix is executable only after the missing data packages and a source-authorized H(s)H forward map are supplied. It is a design contract, not a set of numerical thresholds or claimed predictions.

## 7. Forced versus optional H(s)H structure

A finite-core radius, camera resolution, resolving slab or observed interface thickness is not automatically an intrinsic H(s)H worldtube thickness. A standard fluid core already has finite support.

A worldtube thickness, twist, contact surface or responsive medium is **empirically forced only if**:

1. a Nathan-Direct-supported geometric object and forward map define it;
2. the map composes through the actual laboratory/instrument readout with declared domains, codomains, units and uncertainty;
3. the resulting feature is identifiable after the standard comparator's projection/fiber and nuisance freedoms are accounted for; and
4. a frozen prediction survives a genuinely independent holdout outside the standard-model uncertainty envelope.

Otherwise the extra structure remains optional representation, proposal or unresolved model freedom. This is not a claim that the laboratory vortex is physically equivalent to an H(s)H worldtube.

## 8. Formalization and tool boundary

- Existing Nadir PR [#1189](https://github.com/Satobloc/HsH/pull/1189) contains conditional projection/factorization, two-channel readout and witness-carrying composition modules. After restoring the readout file byte-for-byte, exact-head Actions run [#43783028748](https://github.com/Satobloc/HsH/actions/runs/43783028748) checked out commit `8a6a0c288b0091a19b604ab96f94fec05adcc40e` and completed `lake build` successfully: Lean 4.34.0 / Lake 5.0.0, 8,961 jobs. The restricted antipodal-readout and fiber-compatibility theorems compiled. The theorem-specific axiom reports include standard `propext`, `Classical.choice` and `Quot.sound` dependencies; the full log contains zero `sorryAx` and zero bare `admit`. Tests, lint, nanoda, leanchecker and the global axiom audit were skipped. This does not establish the camera projection or physical map.
- PR #1189 remains OPEN / DRAFT / UNMERGED, based on `research/nadir-gpb-joint-covariance-bound-20261027t1312z`, not main. Compared with current main it is diverged: 143 commits ahead and 19,297 behind. The successful exact-head build is branch-scoped, not current-main integration.
- Kestrel-owned PR [#1309](https://github.com/Satobloc/HsH/pull/1309) already contains the covariance-propagation theorem for the Barckicke two-contour readout. It remains OPEN / DRAFT / UNMERGED at head `f6df05b5b3f4a7dc88c1162108c7c5a61c11ef7e`; its latest recorded workflow run #41644532497 failed. No duplicate theorem was retained in Nadir's PR. A transient duplicate edit was reverted; the Nadir readout source file was restored byte-for-byte to blob `fa7b15ae1fc5d37fe66d3f47877ca5c2f9253e59`.
- No new Lean theorem is claimed for this cross-candidate policy matrix. The two-axis readiness rule is a workflow gate, not a physical theorem. Local Lean/Lake/Elan are absent; the existing PR CI supplied the actual compile of the retained modules. The new policy matrix itself was not compiled because it contains no new mathematical theorem.
- Math Hopper #578, PR #991, PR #1189, PR #1309, Whirligig Kernel 0 and SciSpace were checked. SciSpace did not return the exact Barckicke paper; the publisher PDF and existing source records were used. No new tool, dependency, fork, subscription or expenditure.
- All four Mersearch request lanes remain occupied/requested. No lane was overwritten or retriggered; no new Mersearch request was submitted. Bounded GitHub/public-source fallback is not represented as Mersearch.

## 9. Project disposition

- P0 Code Grurple: ACTIVE.
- P1 Orson-owned cognition: OVERDUE / NOT READY.
- P2 measured geometry: **HOLD; no system selected**.
- P3 full theory: INCOMPLETE.
- FIE next rereview: 2026-11-24.
- The November 30 P2 major-paper gate and December 14 P3 full-theory gate remain separate. This November 16 source-readiness checkpoint does not advance either paper gate.
- No task graph, BEDROCK, SAT-O or Blockwave equation, P2 ownership, automation, schedule, phase or cadence was changed.

**Return pin:** `H864:S3 / NADIR-VOSS-RING-LABEL / ENHEDUANNA-NEXT / P2-TWO-AXIS-GATE / HAN-SVS-4DPTV-HIGHEST-GEOMETRY-LEAD-NOT-SELECTED / BUBBLE-4DLPT-SECOND / GW190425-PUBLIC-DATA-LEAD / ALL-D-AXES-BLOCKED-BY-MISSING-HSH-MAP / P2-HOLD / NO-PHYSICAL-CALCULATION / NO-HSH-PREDICTION / NO-NEW-LEAN-THEOREM / PR1189-PR1309-REUSED-NOT-MODIFIED / PUBLISHER-STATUS-RECORDED-IN-RECEIPT / NO-THEORY-PROMOTION`.




## 10. Amendment 01 | ordered gate composition, source boundary and freeze identity

This section applies existing public contracts to the six candidates above; it does not create another P2 issue or duplicate gate.

The current P2 matrix now composes #1737 source-role typing, #1341 geometry-to-observation mapping, #1738 the ordered coordinate-to-instrument chain, #1301 map closure and joint-readout identifiability, #1261 calibration/holdout, and #1735 paired comparison freeze. The counterexample in #1727 shows why evidence from different candidate versions must not be combined into one PASS. Existing PR #951 remains open/draft/unmerged and does not yet bind all P2 witnesses to one common comparison-freeze identity.

The ordered dependency is source/coordinate freeze -> H(s)H-to-laboratory map -> physical-sector map -> instrument map -> composite readout -> representation coherence -> identifiability/uncertainty -> paired comparison freeze -> held-out prediction and independent review. No downstream stage passes while an upstream map is missing.

**P2 admission refinement:**

\[
P2_{\mathrm{ready}} = E_{\mathrm{pass}} \land D_{\mathrm{pass}} \land F_{\mathrm{pass}} \land R_{\mathrm{pass}}.
\]

Here E is the empirical package, D is the source-to-observable map and identifiability chain, F is paired comparison-freeze coherence, and R is held-out prediction plus independent review. All are non-compensatory.

Each candidate comparison needs one content-addressed comparison_freeze_id binding exact source/equation versions, H0 comparator, H1 geometry/map, dataset manifest, calibration/covariance, shared parameters, calibration/holdout split, observable operator, analysis code and decision rule. Every witness must carry the same candidate and comparison-freeze IDs. H0 and H1 share the same data, calibration, covariance, nuisance/shared parameters, holdout and decision rule. Any change to a bound component creates a new freeze; old evidence remains historical but is not active for the new comparison.

No candidate currently has a complete comparison-freeze ID. All six remain candidate-only and P2 HOLD.

**Source-to-geometry constraint:** the directly re-fetched SAT-O1 source is SATOBLOC/SAT O1 4D.txt, blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc. It declares a one-parameter filament gamma:R->R^(3,1) and separately calls the worldtube the 4D volume swept out by vibration, but gives no thickening map, fiber, profile, embedding, normal bundle or contact law. The verbatim curve/action family is preserved in the [Amendment 01 source record](../COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-16T0036Z_s3_nadir_voss_AMENDMENT_01_P2_GATE_COMPOSITION_AND_LEAN_LOG_RECONCILIATION.md). Therefore thickness is not forced by this source alone; twist and contact surfaces remain unresolved until their maps and laws are source-defined and tied to an identifiable held-out observable. The SAT4D draft and Blockwave source identities/limits are recorded in that amendment; no equation was corrected or promoted.

**Lean log correction:** exact-head Actions run #43783028748 / job #133024336601 checked out PR #1189 head 8a6a0c288b0091a19b604ab96f94fec05adcc40e. The log records NadirVortexTwoChannelReadout built at 8959/8961 and a successful 8961-job build, with dependency caches restored. This supersedes the earlier “cache-replay only” description. It remains a conditional algebraic readout result, not a physical acquisition or H(s)H map proof. Tests, lint, nanoda, leanchecker and global axiom audit were skipped; PR #1189 remains open/draft/unmerged.

**No P2 system selection, physical calculation, fit, prediction, independent measurement, paper-gate advancement or BEDROCK promotion.** No new issue or PR was opened; the existing public gates remain canonical.
