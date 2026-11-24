import Mathlib

/-!
# Cross-modal acquisition and sample-alignment gate for the Kelvin-vortex study

This module is the next layer after
`NadirVortexPairedSampleIdentity`. That module admits the two opposing
side-view contour radii only when their within-view sample keys match.
This module addresses a different question: when may a side-view contour
acquisition be joined to a different camera/modality such as top-view PIV
or a PTV stream?

A window-level join requires explicit, externally checked clock and spatial
registration records whose endpoints match the two acquisition identities.
A sample-level join additionally requires an explicit sample-alignment record
bound to that exact window join. Shared experiment/run identity alone is not
enough. Different cameras, lenses, acquisitions, and coordinate frames are
allowed; their mappings must be supplied rather than inferred.

The Boolean `externalCheckPassed` fields are ingestion attestations supplied
by an external validation process. Lean proves only that the gate requires
those attestations and matching identifiers. It does not validate a camera
calibration, clock map, registration artifact, source dataset, or physical
interpretation. No source data, synthetic fixture, or physical parameter is
instantiated here.
-/

namespace HsHVerification.NadirVortexCrossModalJoinGate

/-- Identity and support of one acquisition in one measurement modality. -/
structure AcquisitionIdentity where
  runId : String
  acquisitionId : String
  modalityId : String
  cameraId : String
  lensId : String
  viewId : String
  timebaseId : String
  timeWindowId : String
  coordinateFrameId : String
  calibrationId : String
  spatialRegionId : String
deriving DecidableEq

/-- Explicit source-to-target clock registration over a declared overlap window. -/
structure ClockRegistration where
  sourceTimebaseId : String
  targetTimebaseId : String
  sourceWindowId : String
  targetWindowId : String
  overlapWindowId : String
  evidenceRef : String
  externalCheckPassed : Bool
deriving DecidableEq

/-- Explicit source-to-target spatial registration over a declared overlap region. -/
structure SpatialRegistration where
  sourceFrameId : String
  targetFrameId : String
  sourceCalibrationId : String
  targetCalibrationId : String
  sourceRegionId : String
  targetRegionId : String
  overlapRegionId : String
  evidenceRef : String
  externalCheckPassed : Bool
deriving DecidableEq

/-- Conditions required before two different acquisition modalities may be
    joined at the window/region level. Camera and acquisition identities need
    not be equal; the clock and spatial registrations must explicitly connect
    their respective endpoints. -/
def WindowAdmissible
    (source target : AcquisitionIdentity)
    (clock : ClockRegistration)
    (spatial : SpatialRegistration) : Prop :=
  source.runId = target.runId ∧
  clock.sourceTimebaseId = source.timebaseId ∧
  clock.targetTimebaseId = target.timebaseId ∧
  clock.sourceWindowId = source.timeWindowId ∧
  clock.targetWindowId = target.timeWindowId ∧
  clock.overlapWindowId ≠ "" ∧
  clock.evidenceRef ≠ "" ∧
  clock.externalCheckPassed = true ∧
  spatial.sourceFrameId = source.coordinateFrameId ∧
  spatial.targetFrameId = target.coordinateFrameId ∧
  spatial.sourceCalibrationId = source.calibrationId ∧
  spatial.targetCalibrationId = target.calibrationId ∧
  spatial.sourceRegionId = source.spatialRegionId ∧
  spatial.targetRegionId = target.spatialRegionId ∧
  spatial.overlapRegionId ≠ "" ∧
  spatial.evidenceRef ≠ "" ∧
  spatial.externalCheckPassed = true

/-- A window-level cross-modal join carries both registration records and
    the proof that their declared identities satisfy the admission contract. -/
structure CrossModalWindowJoin where
  windowJoinId : String
  source : AcquisitionIdentity
  target : AcquisitionIdentity
  clock : ClockRegistration
  spatial : SpatialRegistration
  admissible : WindowAdmissible source target clock spatial
  windowJoinId_nonempty : windowJoinId ≠ ""

/-- Assemble a window-level join only when both registration records exist
    and all run, timebase, window, frame, calibration, region, and external
    validation conditions pass. -/
def assembleWindowJoin
    (windowJoinId : String)
    (source target : AcquisitionIdentity)
    (clock : Option ClockRegistration)
    (spatial : Option SpatialRegistration) : Option CrossModalWindowJoin :=
  match clock, spatial with
  | some c, some s =>
      if h : WindowAdmissible source target c s ∧ windowJoinId ≠ "" then
        some ⟨windowJoinId, source, target, c, s, h.1, h.2⟩
      else none
  | _, _ => none

theorem assembleWindowJoin_none_of_missing_clock
    (windowJoinId : String)
    (source target : AcquisitionIdentity)
    (spatial : Option SpatialRegistration) :
    assembleWindowJoin windowJoinId source target none spatial = none := by
  simp [assembleWindowJoin]

theorem assembleWindowJoin_none_of_missing_spatial
    (windowJoinId : String)
    (source target : AcquisitionIdentity)
    (clock : Option ClockRegistration) :
    assembleWindowJoin windowJoinId source target clock none = none := by
  cases clock <;> simp [assembleWindowJoin]

theorem assembleWindowJoin_none_of_different_run
    (windowJoinId : String)
    (source target : AcquisitionIdentity)
    (clock : ClockRegistration)
    (spatial : SpatialRegistration)
    (hRun : source.runId ≠ target.runId) :
    assembleWindowJoin windowJoinId source target (some clock) (some spatial) = none := by
  unfold assembleWindowJoin
  have hBad : ¬ (WindowAdmissible source target clock spatial ∧ windowJoinId ≠ "") := by
    intro h
    exact hRun h.1.1
  simp [hBad]

theorem assembleWindowJoin_some_iff_admissible
    (windowJoinId : String)
    (source target : AcquisitionIdentity)
    (clock : ClockRegistration)
    (spatial : SpatialRegistration) :
    (∃ join,
      assembleWindowJoin windowJoinId source target (some clock) (some spatial) =
        some join) ↔
      (WindowAdmissible source target clock spatial ∧ windowJoinId ≠ "") := by
  unfold assembleWindowJoin
  by_cases h : WindowAdmissible source target clock spatial ∧ windowJoinId ≠ ""
  · simp [h]
  · simp [h]

/-- Evidence for pairing individual samples after a window-level join exists. -/
structure SampleAlignment where
  windowJoinId : String
  clockEvidenceRef : String
  spatialEvidenceRef : String
  sourceSampleId : String
  targetSampleId : String
  evidenceRef : String
  externalCheckPassed : Bool
deriving DecidableEq

/-- Sample-level pairing must refer to the exact admitted window join and
    carry its own nonempty sample identities and external alignment evidence. -/
def SampleAdmissible
    (windowJoin : CrossModalWindowJoin)
    (sample : SampleAlignment) : Prop :=
  sample.windowJoinId = windowJoin.windowJoinId ∧
  sample.clockEvidenceRef = windowJoin.clock.evidenceRef ∧
  sample.spatialEvidenceRef = windowJoin.spatial.evidenceRef ∧
  sample.sourceSampleId ≠ "" ∧
  sample.targetSampleId ≠ "" ∧
  sample.evidenceRef ≠ "" ∧
  sample.externalCheckPassed = true

/-- A sample-level join is strictly stronger than a window-level join. -/
structure CrossModalSampleJoin where
  windowJoin : CrossModalWindowJoin
  sample : SampleAlignment
  admissible : SampleAdmissible windowJoin sample

/-- Assemble a sample-level join only with explicit sample-alignment evidence
    bound to the exact previously admitted window join. -/
def assembleSampleJoin
    (windowJoin : Option CrossModalWindowJoin)
    (sample : Option SampleAlignment) : Option CrossModalSampleJoin :=
  match windowJoin, sample with
  | some w, some s =>
      if h : SampleAdmissible w s then
        some ⟨w, s, h⟩
      else none
  | _, _ => none

theorem assembleSampleJoin_none_of_missing_alignment
    (windowJoin : Option CrossModalWindowJoin) :
    assembleSampleJoin windowJoin none = none := by
  cases windowJoin <;> simp [assembleSampleJoin]

theorem assembleSampleJoin_none_of_mismatched_window
    (windowJoin : CrossModalWindowJoin)
    (sample : SampleAlignment)
    (hMismatch : sample.windowJoinId ≠ windowJoin.windowJoinId) :
    assembleSampleJoin (some windowJoin) (some sample) = none := by
  unfold assembleSampleJoin
  have hBad : ¬ SampleAdmissible windowJoin sample := by
    intro h
    exact hMismatch h.1
  simp [hBad]

theorem assembleSampleJoin_some_iff_admissible
    (windowJoin : CrossModalWindowJoin)
    (sample : SampleAlignment) :
    (∃ joined,
      assembleSampleJoin (some windowJoin) (some sample) = some joined) ↔
      SampleAdmissible windowJoin sample := by
  unfold assembleSampleJoin
  by_cases h : SampleAdmissible windowJoin sample
  · simp [h]
  · simp [h]

theorem assembleSampleJoin_none_of_mismatched_clock_registration
    (windowJoin : CrossModalWindowJoin)
    (sample : SampleAlignment)
    (hMismatch : sample.clockEvidenceRef ≠ windowJoin.clock.evidenceRef) :
    assembleSampleJoin (some windowJoin) (some sample) = none := by
  unfold assembleSampleJoin
  have hBad : ¬ SampleAdmissible windowJoin sample := by
    intro h
    exact hMismatch h.2.1
  simp [hBad]

theorem assembleSampleJoin_none_of_mismatched_spatial_registration
    (windowJoin : CrossModalWindowJoin)
    (sample : SampleAlignment)
    (hMismatch : sample.spatialEvidenceRef ≠ windowJoin.spatial.evidenceRef) :
    assembleSampleJoin (some windowJoin) (some sample) = none := by
  unfold assembleSampleJoin
  have hBad : ¬ SampleAdmissible windowJoin sample := by
    intro h
    exact hMismatch h.2.2.1
  simp [hBad]

#print axioms assembleWindowJoin_none_of_different_run
#print axioms assembleWindowJoin_some_iff_admissible
#print axioms assembleSampleJoin_none_of_mismatched_window
#print axioms assembleSampleJoin_some_iff_admissible

end HsHVerification.NadirVortexCrossModalJoinGate
