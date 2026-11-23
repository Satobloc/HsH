import Mathlib
import HsHVerification.NadirVortexTwoChannelReadout

/-!
# Paired-sample identity gate for the Kelvin-vortex two-channel readout

Source system: the air-water vortex experiment of Barckicke, Falcon & Gissinger,
"Kelvin wave propagation along vortex cores", Nature Physics (2026),
DOI 10.1038/s41567-026-03175-w. The source-cited data DOI is
10.6084/m9.figshare.30903347.

The existing NadirVortexTwoChannelReadout module proves the algebraic inverse
for two opposing contour radii r₀ and rπ at one common (run, acquisition,
view, frame, axial-sample) identity. This module adds the missing sample-
identity gate: two scalar observations may be transformed jointly only when
their complete sample keys match.

The key is deliberately stricter than a shared experiment label. It includes
run, acquisition, camera, lens, view, calibration, axial-grid, frame, and
axial-index identity. Cross-view fusion would require a separate registered-
view contract and is not admitted here.

This is a data-ingestion contract, not a claim that the cited Figshare files
have been retrieved or that their records carry these keys. It does not
formalize camera projection, synchronization hardware, contour detection,
PIV/PTV, or Kelvin-wave dynamics. Lean verifies only the stated type-level
conditions and their consequences.
-/

namespace HsHVerification.NadirVortexPairedSampleIdentity

/-- Identity of one contour sample before the two-channel transform. -/
structure SampleKey where
  runId : String
  acquisitionId : String
  cameraId : String
  lensId : String
  viewId : String
  calibrationId : String
  axialGridId : String
  frameIndex : Nat
  axialIndex : Nat
deriving DecidableEq

/-- One measured radial contour value with its complete sample identity. -/
structure RadialObservation where
  key : SampleKey
  radius : ℝ

/-- Two opposing contour radii admitted only under one identical sample key. -/
structure PairedContourSample where
  key : SampleKey
  rZero : ℝ
  rPi : ℝ

/-- Assemble an opposing-radius pair only when every identity field matches. -/
def assemblePair (left right : RadialObservation) : Option PairedContourSample :=
  if h : left.key = right.key then
    some ⟨left.key, left.radius, right.radius⟩
  else
    none

theorem assemblePair_eq_none_of_key_mismatch
    (left right : RadialObservation)
    (h : left.key ≠ right.key) :
    assemblePair left right = none := by
  simp [assemblePair, h]

theorem assemblePair_some_implies_key_eq
    (left right : RadialObservation) (p : PairedContourSample)
    (h : assemblePair left right = some p) :
    left.key = right.key := by
  by_cases hkey : left.key = right.key
  · exact hkey
  · simp [assemblePair, hkey] at h

theorem assemblePair_exists_iff_key_eq
    (left right : RadialObservation) :
    (∃ p, assemblePair left right = some p) ↔ left.key = right.key := by
  constructor
  · rintro ⟨p, hp⟩
    exact assemblePair_some_implies_key_eq left right p hp
  · intro hkey
    refine ⟨⟨left.key, left.radius, right.radius⟩, ?_⟩
    simp [assemblePair, hkey]

theorem assemblePair_rejects_different_acquisition
    (left right : RadialObservation)
    (h : left.key.acquisitionId ≠ right.key.acquisitionId) :
    assemblePair left right = none := by
  apply assemblePair_eq_none_of_key_mismatch
  intro hkey
  exact h (congrArg SampleKey.acquisitionId hkey)

theorem assemblePair_rejects_different_frame
    (left right : RadialObservation)
    (h : left.key.frameIndex ≠ right.key.frameIndex) :
    assemblePair left right = none := by
  apply assemblePair_eq_none_of_key_mismatch
  intro hkey
  exact h (congrArg SampleKey.frameIndex hkey)

noncomputable section

abbrev Readout :=
  HsHVerification.NadirVortexTwoChannelReadout.Readout

/-- Apply the existing (r₀,rπ) ↦ (η,a) map only after sample pairing succeeds. -/
def pairedReadout (left right : RadialObservation) : Option Readout :=
  (assemblePair left right).map fun p =>
    HsHVerification.NadirVortexTwoChannelReadout.observe p.rZero p.rPi

theorem pairedReadout_none_of_key_mismatch
    (left right : RadialObservation)
    (h : left.key ≠ right.key) :
    pairedReadout left right = none := by
  simp [pairedReadout, assemblePair, h]

theorem pairedReadout_eq_some_of_key_eq
    (left right : RadialObservation)
    (h : left.key = right.key) :
    pairedReadout left right =
      some (HsHVerification.NadirVortexTwoChannelReadout.observe
        left.radius right.radius) := by
  simp [pairedReadout, assemblePair, h]

theorem pairedReadout_some_implies_key_eq
    (left right : RadialObservation) (readout : Readout)
    (h : pairedReadout left right = some readout) :
    left.key = right.key := by
  unfold pairedReadout at h
  cases hp : assemblePair left right with
  | none =>
      simp [hp] at h
  | some p =>
      exact (assemblePair_exists_iff_key_eq left right).mp ⟨p, hp⟩

theorem pairedReadout_some_iff_key_eq
    (left right : RadialObservation) :
    (∃ readout, pairedReadout left right = some readout) ↔
      left.key = right.key := by
  constructor
  · rintro ⟨readout, hreadout⟩
    exact pairedReadout_some_implies_key_eq left right readout hreadout
  · intro hkey
    exact ⟨
      HsHVerification.NadirVortexTwoChannelReadout.observe
        left.radius right.radius,
      pairedReadout_eq_some_of_key_eq left right hkey
    ⟩

/-- A matched sample pair retains the two source radii under the existing
    algebraic readout and reconstruction map. -/
theorem pairedReadout_reconstructs_of_key_eq
    (left right : RadialObservation)
    (h : left.key = right.key) :
    ∃ readout : Readout,
      pairedReadout left right = some readout ∧
      HsHVerification.NadirVortexTwoChannelReadout.reconstruct
        readout.1 readout.2 = (left.radius, right.radius) := by
  refine ⟨
    HsHVerification.NadirVortexTwoChannelReadout.observe
      left.radius right.radius,
    ?_, ?_
  ⟩
  · exact pairedReadout_eq_some_of_key_eq left right h
  · exact HsHVerification.NadirVortexTwoChannelReadout.reconstruct_observe
      left.radius right.radius

#print axioms assemblePair_exists_iff_key_eq
#print axioms assemblePair_rejects_different_acquisition
#print axioms assemblePair_rejects_different_frame
#print axioms pairedReadout_some_iff_key_eq
#print axioms pairedReadout_reconstructs_of_key_eq

end
end HsHVerification.NadirVortexPairedSampleIdentity
