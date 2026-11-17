# h894:s3 | Hale | P2 holdout-claim ceiling crosswalk: NIST and Knister

**Disposition:** SUBSTANTIVE P2 EVIDENCE-ARCHITECTURE IMPROVEMENT COMPLETE / SOURCE-GROUNDED CANDIDATE PROFILE ONLY / P2 HOLD / NO PHYSICAL CALCULATION / NO NEW LEAN THEOREM.

## 1. Selection, authority, and continuity

Nominal UTC hour h=894; seq=5h+3=4473; 4473 mod 19 = 8.

- Selected ring label: Hale, index 8.
- Next ring label: Elias Kern, index 9.
- Run key: REVROT3-19-20261011:894:s3.
- HsH main at source-review intake: 33fa38c930c4fc316f45242c19dc735b8d32c6b3.

The selected label is a routing identity, not an authenticated ChatGPT instance or thread. This is a source-grounded current-assistant reconstruction. No authenticated current Hale thread or historical-instance participation was established.

The strongest historical Hale remit evidence is the 2026-09-12 Common check-in, preserved in Sable's REV-006-HALE-REENTRY wake packet: external-literature scanning, matched-period comparisons, Python/code/scoring/statistical analysis, calibration against controls, and explicit accounting of loaded versus merely accessible material. The check-in is a worker-authored self-report, not a signed Nathan-authored specialist charter. No standalone signed Hale charter was found. External literature exposure is part of the remit; this work is not a blind theory review. A clean first-blush was not performed because current project materials were read before the historical remit reconstruction.

Read continuity included Hale h841:s2, h852:s4, h860:s2 and h890:s4; the h893:s3 Ariadne receipt; and Calder h894:s2 report and receipt. No authenticated incoming Calder-to-Hale thread handoff was found; the published predecessor report and receipt were read directly.

## 2. One substantive improvement: make the P2 independence vector operational

The live P2 node already requires Ariadne's layer-resolved evidence fields. The existing contract separates readout identifiability from evidence independence and explicitly rejects a single Boolean independence flag. This run does not add a new schema or change the task graph. It supplies a source-specific candidate profile for two existing measured-system candidates and translates their dependency records into permissible holdout claims.

The important distinction is that **holdout exposure, acquisition separation, calibration separation, and independent replication are different properties**. A blind holdout can still share an instrument and calibration. A new acquisition can support a prediction conditional on a shared, externally frozen calibration without proving calibration transfer or independent replication.

### Claim-ceiling interpretation

| Evidence boundary | Permissible claim if the other relevant axes pass | Claim not established by that boundary alone |
|---|---|---|
| New segment, frame, field, or channel from the same raw acquisition | Within-acquisition consistency or reduction robustness | Independent acquisition or replication |
| New run or acquisition block on the same apparatus and calibration | Acquisition-level generalization conditional on that calibration | Calibration transfer or independent replication |
| New calibration batch on the same apparatus | Calibration-transfer performance | Independent-apparatus or independent-laboratory replication |
| New apparatus in the same laboratory | Instrument-transfer performance | Independent-laboratory replication |
| New laboratory and apparatus | Independent-laboratory replication, subject to source lineage, exposure, and covariance checks | Automatic independence if source, analysis, or prior dependencies remain shared or unresolved |

This is not a scalar ranking. Keep the existing independence dimensions separate: artifact/source lineage; raw acquisition and event/system; instrument and calibration; analysis, reduction and prior; fit/holdout exposure; and statistical dependence/covariance. If a relevant identifier or exposure audit is unknown, the claim is UNRESOLVED, not independent.

A shared calibration does not automatically invalidate a predictive holdout. If calibration was externally determined and frozen before the holdout was accessed, the result may be described as a prediction conditional on that calibration, with shared calibration uncertainty carried into the joint covariance. If calibration was estimated or tuned using holdout observations, the holdout is exposed. A distinct calibration batch is needed to claim calibration transfer.

## 3. Candidate evidence profile: NIST torsion-balance G campaign

**Primary source:** Metrologia 63, 025012 (2026), DOI 10.1088/1681-7575/ae570f. The source-specific crosswalk is in Hale's NIST acquisition-level identifiability addendum and four-cell factorial contrast gate.

Source-reported evidence includes eight torque differences, three copper source-mass orientations (0, 120, and 240 degrees), one sapphire orientation, and two readout methods. The paper reports four final G summary determinations and a 4-by-4 summary covariance matrix. The four-cell configuration/readout summary is saturated under the stated four-coefficient contrast; it has no residual degrees of freedom for an additional unconstrained H(s)H term. The published summary covariance is not the missing raw eight-observation covariance.

The three published copper orientations already contribute to the reported orientation correction and aggregate. The earlier phrase "additional source-mass orientation" must therefore be read operationally as a **new, pre-registered measurement**, not as an existing blind holdout hidden inside the published four-cell summary. A leave-one-orientation-out analysis could be an internal within-campaign prediction test only if the raw orientation-level observations, their covariance, and a genuine pre-access model freeze are recovered. It would not be independent replication.

| P2 evidence field | Current source-grounded status |
|---|---|
| System/event cluster | One torsion-balance G campaign; not a second independent system |
| Raw acquisition IDs and raw artifact IDs | Not retrieved; published torque differences and summary tables are not raw acquisition identifiers |
| Provenance parents | Paper and published tables located; raw acquisition-parent chain incomplete |
| Instrument/calibration IDs | Readout modes and apparatus described; calibration-batch IDs and calibration datasets not retrieved |
| Analysis and prior | Standard mass-integration and native readout analyses identified; CODATA 2022-centered prior is recorded in the existing audit; executable analysis/configuration hash not recovered |
| Uncertainty/covariance | Published four-summary covariance and dark-uncertainty treatment identified; raw eight-observation covariance not retrieved |
| Calibration dataset IDs | Not retrieved |
| Holdout dataset IDs and access audit | No verified blind holdout |
| Cross-channel consistency | Two readout methods and orientation contrasts are available at summary level; this is not independent replication |
| Independent replication | Not established |
| Standard comparator | Standard torsion-balance mass integration and native free-deflection / electrostatic-servo readout equations |
| H(s)H map and identifiability | No source-authorized geometry-to-torque/readout map; added geometric parameter is not identifiable from the saturated four-cell summary |
| Pre-registered score and falsification threshold | None; not assignable without the raw-level covariance and a frozen H(s)H map |

**H0:** standard torsion-balance mass integration, orientation correction, and native readout model.

**H1:** a source-authorized H(s)H map to the same torque/angle and servo channels, with the same mass geometry, calibration, nuisance budget, and shared parameters. That map is currently undefined.

**Next valid test:** acquire a new pre-registered orientation or acquisition block not used for fitting or calibration. A new orientation on the same apparatus tests angular-response prediction within the campaign. A new run with the same frozen calibration tests run-level generalization conditional on calibration. A separate calibration batch tests calibration transfer. A different apparatus/laboratory is needed for replication.

## 4. Candidate evidence profile: Knister counter-rotating vortex experiment

**Primary sources:** Knister, Ganesh and Ceccio, Journal of Fluid Mechanics 1032, A57 (2026), DOI 10.1017/jfm.2026.11120; related follow-up, JFM 1034, A37 (2026), DOI 10.1017/jfm.2026.11441; and the 2024 University of Michigan dissertation. The detailed measurement and uncertainty audit is Hale h841:s2 / h852:s4.

The source-derived measurement chain is:

calibrated camera images -> STB particle tracks -> VIC# Eulerian velocity, vorticity and pressure -> thresholded vortex regions -> local normal-plane moments.

The reported core radius is an algorithm-defined vorticity-weighted second moment of a thresholded connected region, not a directly imaged material boundary. Pressure is inferred from STB-VIC# with a remote static-pressure anchor; it is not directly probed in the core. The source reports roughly seven vectors spanning the secondary core against an eight-vector typical minimum. It also reports 1,000 subsampled velocity fields per case, but the raw run IDs, sampling dependence, and calibration-batch mapping have not been recovered. Those fields must not be counted as 1,000 independent acquisitions without the source-defined unit and dependence map.

The reported pressure-drop versus Gamma-squared-over-core-radius-squared relationship is not an independent cross-channel confirmation: both quantities are derived from the same reconstruction. PIV/PTV comparisons are retrospective consistency checks, not a blind holdout. Adjacent PIV/PTV pressure-uncertainty methods exist, but their transfer to this exact 3D STB-VIC# counter-rotating-vortex pipeline is not validated.

| P2 evidence field | Current source-grounded status |
|---|---|
| System/event cluster | One counter-rotating hydrofoil-vortex experimental program; case/run IDs unresolved |
| Raw acquisition IDs and raw artifact IDs | No raw STB tracks, reconstructed volumes, camera calibration images, or run manifest identified |
| Provenance parents | Dissertation, journal article and supplementary movies located; raw acquisition parents missing |
| Instrument/calibration IDs | Camera and STB/VIC# pipeline described; exact calibration IDs and calibration datasets not retrieved |
| Analysis and prior | STB/VIC# reconstruction, thresholded vortex-region moments, and remote pressure anchor identified; exact configuration/version hash missing |
| Uncertainty/covariance | No joint velocity, vorticity, pressure, and derived-moment covariance package retrieved; adjacent methods are not a validated substitute |
| Calibration dataset IDs | Not retrieved |
| Holdout dataset IDs and access audit | No verified blind holdout; no pre-access freeze/access audit found |
| Cross-channel consistency | Pressure and circulation diagnostics share the same reconstruction; PIV/PTV checks are retrospective |
| Independent replication | Not established |
| Standard comparator | Rankine solid-body core with uniform vertical flow, hollow-core long-wavelength Kelvin model, and the source's stated centrifugal-wave alternatives |
| H(s)H map and identifiability | No source-authorized filament/timesheet-to-instrument map; practical identifiability is unscorable |
| Pre-registered score and falsification threshold | None; not assignable without raw tracks, calibration lineage, joint covariance, and a frozen forward map |

**H0:** the source's standard Rankine and hollow-core Kelvin descriptions, with the documented STB-VIC# measurement/reconstruction pipeline.

**H1:** a source-authorized H(s)H map to the same velocity, vorticity, pressure, circulation, and core-moment observables, without per-mode or per-channel retuning. That map is currently undefined.

**Next valid test:** hold out a whole source-identified run or forcing condition, not randomly selected fields or spatial points. If the new run shares the same calibration, label the test acquisition-level generalization conditional on calibration. A new calibration batch is required for calibration transfer; a different apparatus and laboratory are required for independent-laboratory replication.

## 5. Shared H0/H1 comparison and failure rule

For either candidate, H0 and H1 must use the same raw observations, acquisition-unit assignment, instrument operator, calibration data, uncertainty model, analysis pipeline, comparator, and holdout. Shared physical parameters and nuisance parameters must be frozen before holdout access. H1 may add only source-authorized geometric parameters with a defined map and identifiable observable; it may not gain per-channel retuning that H0 is denied.

The prospective failure rule is: a frozen H1 prediction falls outside the pre-registered joint predictive region for the held-out acquisition under the actual covariance model, or fails the pre-registered predictive improvement criterion against H0. The numerical threshold must be chosen before holdout access and derived from the actual uncertainty/covariance. No threshold is assigned here.

The P2 graph's required fields remain the controlling checklist: raw_acquisition_ids, raw_artifact_blob_ids, provenance_parent_ids, event_or_system_cluster, instrument_and_calibration_ids, analysis_pipeline_and_prior_ids, uncertainty_covariance_id, calibration_dataset_ids, holdout_dataset_ids, holdout_access_audit, independence_vector, cross_channel_consistency_status, independent_replication_status, standard_comparator, and pre_registered_score_and_falsification_threshold. This report supplies partial candidate profiles, not a completed independence_vector or P2 acceptance record.

## 6. What the experiments do and do not force geometrically

- A finite spatial fluid-vortex core is a standard physical feature; it is not, without a map, an H(s)H worldtube thickness.
- Kelvin-wave bending, core-radius variation, and the Rankine/hollow-core descriptions are standard fluid-mechanical comparators; they do not by themselves establish a normal-bundle twist.
- A pressure reconstruction or a correlation among quantities derived from the same velocity field does not force an additional contact surface.
- Neither candidate currently requires a distinct physical timesheet.

Worldtube thickness, twist, contact surfaces, and a separate timesheet remain optional representation choices until a source-authorized geometry-to-observation map produces a distinct, identifiable, covariance-resolved observable that survives the shared H0/H1 comparison.

## 7. Lean proof-first triage and formal limits

Existing formal work was checked rather than duplicated:

- PR #1515, current head b34a74885c79dbec983ad071b6f86db5676d5e28, has an exact-head build pass: Actions #44011692583, Lean 4.34.0 / Lake 5.0.0, 8,958 successful library jobs. Its acquisition-unit fold-factorization result ensures channels sharing a declared unit remain in one fold. It does **not** prove that different units are statistically independent.
- PR #1657 formalizes a run-dependent calibration factorization boundary. Its target module was built on the recorded head, but the full root build failed in the unrelated MovingPlaneTraceGeometry module. It does **not** prove that separate calibration labels correspond to independent calibration datasets.
- PR #790 is only a source/claim-lineage sublayer. It does not populate acquisition/event, instrument/calibration, analysis/prior, covariance, holdout exposure, or independent-replication fields.
- The existing NIST factorial-contrast work in PR #1387 is not treated as exact-head verified for its current head.

The missing formal step is not another abstract theorem. It is a source-faithful mapping from actual raw records to acquisition units, calibration batches, apparatus, analysis versions, and holdout exposure. Those identifiers are absent from both candidate packages. A new Lean proposition that assigns invented unit or calibration groups would be data-free formalization and would not satisfy the source/measurement gate. No new Lean module, build, branch, PR, synthetic fixture, or physical calculation was attempted. Local Lean, Lake, and Elan are absent in this runtime.

Lean build success for an existing conditional proposition does not establish the truth of the source metadata, statistical independence, soundness of the physical translation, or an H(s)H prediction.

## 8. Mersearch and tool reconnaissance

Mersearch was not callable in this runtime, and no local pinned checkout or mersearch command was present. The stable worker release remains mersearch-stable-1.0 at commit 89933c358b67ccbfbbaa680aadeb1f35d22d91b2. All four canonical request lanes remain occupied/requested; the current-main PWH record reports no request-scoped manifest or receipt for those snapshots. The extra MERSEARCH_REQUEST_LANE_1.json is outside the four canonical lanes and was not touched. No request was overwritten, retriggered, released, or duplicated.

Bounded direct GitHub search was used in HsH and SAT_THEORY_ARCHIVE_2023-25 as a disclosed fallback, not represented as a Mersearch run. HSH_RESOURCES was limited to its root README; no private payload was opened. Existing Math Hopper #578 / PR #991, Whirligig Kernel 0, the relevant Lean PRs, and the available SciSpace connector were checked. No new tool, dependency, fork, subscription, or expenditure was created.

## 9. Governance, reading, and successor

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 Orson cognition | OVERDUE / NOT READY; Orson ownership protected |
| P2 measured geometry | HOLD; neither candidate selected |
| P3 full theory | INCOMPLETE |
| FIE | Last review November 10; next review November 24 |

The November 9 minor manuscript gate remains overdue. November 30 major P2 and December 14 full-theory gates remain separate. The November 16 P2 source/data gate remains unmet. No paper gate advanced. WH-02 remains Calder-owned; Tern retains graph and scheduler authority. No task graph or BEDROCK change was made.

Unrelated reading continued in the SAT archive's SAT Mark V/TheTANGLE.txt, lines 1881-1920. Next cursor: 1921. This is a deliberate unrelated reading quantum, not a physical break or theory evidence. FIE rereview was not due.

Elias Kern is next by ring selection. His protected Track A workflow-switchboard remit has no actionable assignment from this P2 candidate profile. No handoff, inbox write, task, review request, response obligation, or ownership transfer was created. No direct-thread delivery, consumption, or acknowledgment is claimed.

No SAT-O or Blockwave equation was changed, re-transcribed, or corrected. No H(s)H theory promotion, physical calculation, fit, prediction, independent measurement, P2 system selection, or Factory Floor admission occurred.

## 10. Automation integrity

The existing :36 relay remains under task ID 6a9f52b69ec08191b0a2ba24a074f781 with its original schedule DTSTART;TZID=America/New_York:20261001T143600 / RRULE:FREQ=HOURLY and Lane Charter 36 phase unchanged. No task, ID, schedule, cadence, enabled-state, or phase mutation; no sixth task, signet, or conversation rename.

**Return pin:** H894:S3 / HALE / ELIAS-KERN-NEXT / NIST-KNISTER-CANDIDATE-PROFILES / CLAIM-CEILING-NOT-SCALAR / HOLDOUT-EXPOSURE-DISTINCT-FROM-REPLICATION / P2-VECTOR-PARTIAL-NOT-INSTANTIATED / PR1515-EXACT-HEAD-PASS / PR1657-TARGET-BUILD-ROOT-BLOCKED / PR790-SOURCE-LINEAGE-ONLY / NO-NEW-LEAN / NO-PHYSICAL-RESULT / P2-HOLD / P0-ACTIVE / P1-ORSON-PROTECTED / P3-INCOMPLETE / FIE-NOV24 / READING-1921 / MERSEARCH-FOUR-LANES-OCCUPIED / AUTOMATION-UNCHANGED / NO-SIXTH-TASK
