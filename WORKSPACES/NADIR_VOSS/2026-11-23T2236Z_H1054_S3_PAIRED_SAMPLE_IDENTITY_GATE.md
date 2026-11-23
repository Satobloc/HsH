# Nadir h1054:s3: sample-identity gate for the Kelvin-vortex two-channel readout

**Nominal slot:** 2026-11-23T22:36:00Z  
**Run key:** `REVROT3-19-20261011:1054:s3`  
**Deterministic ring label:** Nadir Voss (index 10)  
**Next ring label:** Enheduanna (index 11)  
**Disposition:** `SAMPLE_PAIRING_GATE_FORMALIZED / SOURCE_ACQUISITION_CLASSES_SEPARATED / FINAL_LEAN_HEAD_PENDING / RAW_DATA_NOT_RETRIEVED / NO_PHYSICAL_CALCULATION`

## Executive result

The existing two-channel formalization proves that two opposing contour radii from one common sample can be transformed exactly into displacement and core radius:

\[
\eta=(r_0-r_\pi)/2,\qquad a=(r_0+r_\pi)/2.
\]

It does not establish that two arrays drawn from different acquisitions are pointwise paired. The primary experiment's Methods distinguish a typical 300-fps, 30-s spatiotemporal video, from separate probability-density acquisitions: \(a(z,t)\) for 10 minutes at 100 fps and \(\eta(z,t)\) for 3 minutes at 360 fps. Those separate PDF streams cannot be treated as a joint \((\eta,a)\) time series unless the raw manifest supplies a common run/acquisition/frame/axial-sample identity.

I added a typed sample-key gate to the existing Nadir Lean branch. The new `assemblePair` function admits a two-radius sample only when the complete sample keys match. A mismatched acquisition or frame is rejected before the existing algebraic readout can be applied. This is an ingestion and identifiability safeguard, not a new physical model.

## 1. Primary measured system and provenance

Primary source: Jason Barckicke, Eric Falcon and Christophe Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w).

The paper identifies the source-data DOI as [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). That DOI is verified as a citation in the paper. The Figshare file inventory, version, checksums, raw array shapes and sample-level keys were **not retrieved or verified** in this run.

The measured system is a classical air-water bathtub vortex in a 21-cm-diameter, 45-cm-tall cylindrical container, with pump-driven circulation and a drain hole. The optical contour is the air-water interface. The measured channels are derived from two opposing contour radii, not from a directly measured four-dimensional worldtube.

Source-reported acquisition and uncertainty details:

| Stream | Source-reported method | Pairing status |
|---|---|---|
| Spatiotemporal spectra | Typical 300 fps, 30 s; 12.5-cm axial window; left/right profiles extracted from the same video frames | `PAIRABLE_IF_RAW_KEYS_MATCH` |
| Core-radius PDF | \(a(z,t)\), 10 min at 100 fps; 1,000 axial samples over 2.5 cm, concatenated into a temporal file | `MARGINAL_ONLY_UNTIL_MATCHED` |
| Position PDF | \(\eta(z,t)\), 3 min at 360 fps; 1,000 axial samples over 2.5 cm, concatenated into a temporal file | `MARGINAL_ONLY_UNTIL_MATCHED` |
| PIV circulation | Top-view Phantom V1840 at 6,000 fps; reported \(\delta\Gamma\approx0.005\,\mathrm{m^2\,s^{-1}}\) | Separate calibration stream |
| PTV axial velocity | Tracer tracking; reported \(\delta v_z\approx0.05\,\mathrm{m\,s^{-1}}\) | Separate calibration stream |

For the side-view contour, the paper reports 60 \(\mu\mathrm m/\mathrm{px}\) resolution, 0.5-mm contour width and approximately 0.1-mm uncertainty in core radius and position. These are channel-level uncertainty statements; no joint \((\eta,a)\) covariance matrix was retrieved.

The paper contains a view-description discrepancy that remains unresolved: the Results text refers to “two orthogonal cameras,” while Methods describes one Basler optical camera normal to the vortex axis with two lenses (8 mm and 12 mm), plus a separate top-view Phantom camera for PIV. The new sample key therefore includes camera, lens, view and calibration identity. No independent orthogonal-view fusion is assumed.

## 2. Typed sample-identity contract

Added `NadirVortexPairedSampleIdentity.lean` to the existing Nadir formalization branch and imported it into the branch's root aggregator.

The sample key contains:

- run ID;
- acquisition ID;
- camera ID;
- lens ID;
- view ID;
- calibration ID;
- axial-grid ID;
- frame index;
- axial index.

`assemblePair(left, right)` returns a `PairedContourSample` only if all fields match. The downstream `pairedReadout` then reuses the existing `NadirVortexTwoChannelReadout.observe` function. The existing reconstruction theorem is reused rather than duplicated.

Formal results:

1. A pair can be assembled iff the complete sample keys are equal.
2. Different acquisition IDs force rejection.
3. Different frame indices force rejection.
4. A successful paired readout implies common sample identity.
5. A matched pair preserves the two source radii under the existing \((r_0,r_\pi)\leftrightarrow(\eta,a)\) readout and reconstruction.

The Lean model does not prove that Figshare files actually contain these keys, that camera clocks are synchronized, or that the paper's camera-view discrepancy is resolved. It formalizes the admission rule that a data loader must enforce.

## 3. Updated test matrix

| Hypothesis | Shared/calibrated parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification / admission threshold |
|---|---|---|---|---|---|
| \(H_0\): classical Rankine/Kelvin vortex | \(a_0,\Gamma,v_z\), with source-reported units and uncertainties | Source paper uses measured \(a_0\), fits \((\Gamma,v_z)\) to Eq. (2), then checks them a posteriori against PIV/PTV. Future test must freeze calibration values before a whole-run holdout. | \(S_\eta(\omega,k)\), \(S_a(\omega,k)\), and separately measured PIV/PTV inputs | Classical Kelvin dispersion relation for the Rankine core with uniform axial flow | Holdout residual outside a predeclared covariance-aware predictive region; numeric threshold not set without raw files and covariance |
| \(H_1\): H(s)H is a representation-only reparameterization | Same measured inputs and detector map as \(H_0\) | Identical run split and fixed shared parameters | Same projected \((\eta,a)\) readout | \(H_0\) | No discriminator exists if the complete detector predictions are identical |
| \(H_2\): H(s)H adds a finite-core feature (thickness, twist/framing or contact structure) | Standard fluid inputs plus only source-authorized, identifiable geometric parameters | Calibrate on one complete acquisition; freeze shared geometric parameters; hold out a separate whole run/regime | A predeclared residual in paired \(S_\eta,S_a\), cross-channel covariance, or a separately registered view | \(H_0\) with the same nuisance space and measurement operator | Feature is not identified if its projected effect lies within the standard nuisance span; reject the specific feature map if its held-out prediction fails the predeclared uncertainty region |
| \(H_3\): feature is hidden by the two-antipodal readout | Same as \(H_2\), plus view/angle registration | Requires an additional azimuthal sample or independently calibrated synchronized view | Angularly resolved contour or registered multi-view observable | Full standard projection through the same camera model | No test is scoreable until view identity, registration, synchronization and covariance are supplied |


### Forced versus optional geometric content

The measured core radius \(a_0\) is already a parameter of the standard Rankine/Kelvin comparator. A finite core is therefore not, by itself, an H(s)H-specific discriminator. The displacement channel \(\eta\) is likewise the standard \(m=1\) bending observable in this experiment. What remains optional is any additional H(s)H structure such as a material framing/twist field, a distinct contact surface, or a particular 4D worldtube thickness profile. Each would need an explicit map into the measured channels that survives the standard nuisance quotient and the camera projection. None is currently source-forced by this dataset.

The two-antipodal readout also has a separate angular-identifiability limit: the existing formalization contains mode-alias witnesses (including the \(m\leftrightarrow m+2\) pattern under the stated single-harmonic ansatz). Correct sample pairing does not remove that aliasing. A registered additional angular/view measurement would be needed to identify more of the angular structure.

The reported \(m=1\) values \(a_0=1.9\) mm, \(\Gamma=0.022\,\mathrm{m^2\,s^{-1}}\), \(v_z=0.57\,\mathrm{m\,s^{-1}}\), and the \(m=2\) values \(a_0=2.2\) mm, \(\Gamma=0.011\,\mathrm{m^2\,s^{-1}}\), \(v_z=0.85\,\mathrm{m\,s^{-1}}\), are source-reported fit/measurement-consistency values, not new independent predictions from H(s)H. No values were recalculated.

A joint \((\eta,a)\) statistic is admitted only for matching sample keys. If the key is missing or mismatched, the result is `UNPAIRED / NOT_SCOREABLE`, not evidence for or against either model. Adjacent video frames are not independent holdout units; the holdout unit must be a separate run/acquisition or a predeclared independent forcing regime.

## 4. Epistemic boundaries

- The two-channel algebraic inverse is already formalized in `NadirVortexTwoChannelReadout.lean`; this addition formalizes sample identity before applying that inverse.
- The existing antipodal-mode alias result remains in force: a valid paired \((\eta,a)\) readout does not by itself identify the complete angular profile or every mode label.
- The source's Rankine/Kelvin model is the standard comparator. Its published parameter procedure is fit-conditioned, with a posteriori PIV/PTV consistency checks.
- No H(s)H forward map from thickness, twist or contact-surface structure to this instrument's readout has been established. No H(s)H physical prediction is formed.
- No raw Figshare file, manifest, covariance, synchronized cross-view record or independent measurement was retrieved.
- No physical calculation, fit, parameter optimization, uncertainty propagation or numerical falsification threshold was performed.
- No SAT-O or Blockwave equation was changed. No BEDROCK theory promotion or paper-gate advancement is claimed.

## 5. Lean verification

The new module was added to the existing Nadir formalization branch and existing draft PR #1189, not to a new PR and not to main.

- The first workflow run, #45283339417, was cancelled when the immediately following aggregator commit superseded it. This was concurrency cancellation, not a failed proof.
- The next exact-head run, #45283344666, passed on commit `847f8ae2cade60d54a478a56341a0c0d4e784dcd`: 8,962 build jobs, Lean 4.34.0, Lake 5.0.0, exact source-checkout assertion passed, and the new module built at job 8958/8962. It emitted one style warning for an unused proof binder in the `if` expression.
- The warning was removed in commit `9e563ee330c8bdbdcf16f746eb1baff931751677` by removing the unused binder. The final exact-head run #45284099363 checked out that commit and passed the source-checkout assertion and dependency-manifest step; at report preparation the Lean compilation step was still in progress. Final-head status is therefore `SUBMITTED_NOT_VERIFIED`.
- The previous successful run's five printed theorem dependencies were `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or `admit` was found in the new module. Tests, lint, leanchecker, nanoda and the global axiom audit were skipped.

Lean compilation checks only the formalized sample-key gate and reuse of the existing algebraic readout theorem. It does not validate the source-to-model translation, actual dataset metadata, camera synchronization or physical premises.

## 6. Continuity and authority

The deterministic ring selection is Nadir Voss, with Enheduanna next. The Nadir label and workspace remain assistant-derived; no standalone Nathan-authored specialist charter or authenticated current Nadir thread is established. This is assistant-level repository work, not a claim of direct Nadir participation.

PR #1189 remains OPEN / DRAFT / UNMERGED. No merge, rebase, review approval, physical validation, new tool, subscription or expense is claimed. The existing Mersearch request lanes remain occupied and unchanged; no new request was created or retriggered.

P0 Code Grurple remains protected and active. The latest source-level disposition is record-safety FAIL / live visitor route NOT OBSERVED; no P0 code or ownership was changed. P1 remains overdue and Orson-owned; P2 remains HOLD; P3 remains incomplete. FIE's next full review remains December 4; the unrelated-reading break was completed November 21.

The latest completed PWH deep review is Morrow h1051:s2. Kestrel h1051:s3, Sable h1052:s3, Mira h1053:s3 and this h1054:s3 run make four subsequent completed work products; the next deep review is due after one more completed activation. The central PWH queue still points to h1049:s2, so its last-review pointer is stale relative to the newer Morrow receipt. No queue edit was made because Tern owns that control surface.

The existing :36 Worldtube automation ID, schedule, phase and prompt were not changed. No sixth task was created. No cross-thread delivery or acknowledgment is claimed.

**Return pin:** `H1054:S3 / NADIR-LABEL / PAIRED-SAMPLE-IDENTITY-GATE / 300FPS-30S-SPECTRAL-STREAM-PAIRABLE-IF-RAW-KEYS-MATCH / 100FPS-A-PDF-AND-360FPS-ETA-PDF-MARGINAL-ONLY-UNTIL-MATCHED / CAMERA-VIEW-DISCREPANCY-UNRESOLVED / RAW-FIGSHARE-NOT-RETRIEVED / FINAL-LEAN-RUN-45284099363-PENDING / PR1189-DRAFT-UNMERGED / NO-PHYSICAL-CALCULATION / NO-THEORY-PROMOTION / P0-PROTECTED / AUTOMATION-UNCHANGED / ENHEDUANNA-NEXT`.
