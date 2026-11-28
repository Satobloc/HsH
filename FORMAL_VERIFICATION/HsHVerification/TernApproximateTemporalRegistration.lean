import Mathlib

/-!
# Approximate cross-modal temporal registration

This module adds a relation-based temporal join for samples whose calibrated
time supports are intervals on one declared common timebase.

It is separate from exact sample-key equality and from window-level clock
registration. The relation is intentionally not assumed to be one-to-one.

The calibration references, digests, lock ticks, and external-check flags are
declared evidence fields. Lean does not authenticate their bytes, clocks,
instrument calibration, or source-to-model translation. No physical data
fixture or physical calculation is instantiated here.
-/

namespace HsHVerification.TernApproximateTemporalRegistration

/-- A closed, nonempty interval in a declared common time coordinate. -/
structure TimeInterval where
  lower : ℝ
  upper : ℝ
  ordered : lower ≤ upper

/-- Separation between two closed intervals; zero exactly when they overlap. -/
def intervalGap (a b : TimeInterval) : ℝ :=
  max 0 (max (a.lower - b.upper) (b.lower - a.upper))

/-- Closed intervals overlap, including a shared endpoint. -/
def IntervalsOverlap (a b : TimeInterval) : Prop :=
  a.lower ≤ b.upper ∧ b.lower ≤ a.upper

theorem intervalGap_nonneg (a b : TimeInterval) :
    0 ≤ intervalGap a b := by
  exact le_max_left _ _

theorem intervalGap_symm (a b : TimeInterval) :
    intervalGap a b = intervalGap b a := by
  simp [intervalGap, max_comm]

theorem intervalGap_eq_zero_iff_overlap (a b : TimeInterval) :
    intervalGap a b = 0 ↔ IntervalsOverlap a b := by
  constructor
  · intro h
    have houter :
        max 0 (max (a.lower - b.upper) (b.lower - a.upper)) ≤ 0 := by
      simpa [intervalGap] using (le_of_eq h)
    have hinner :
        max (a.lower - b.upper) (b.lower - a.upper) ≤ 0 :=
      (max_le_iff.mp houter).2
    have hleft :
        a.lower - b.upper ≤ 0 :=
      (max_le_iff.mp hinner).1
    have hright :
        b.lower - a.upper ≤ 0 :=
      (max_le_iff.mp hinner).2
    exact ⟨by linarith, by linarith⟩
  · rintro ⟨hleft, hright⟩
    have hinner :
        max (a.lower - b.upper) (b.lower - a.upper) ≤ 0 :=
      max_le_iff.mpr ⟨by linarith, by linarith⟩
    have houter :
        max 0 (max (a.lower - b.upper) (b.lower - a.upper)) ≤ 0 :=
      max_le_iff.mpr ⟨le_rfl, hinner⟩
    exact le_antisymm houter (le_max_left _ _)

/-- An interval produced by an externally calibrated local clock. The
    nonempty locators and digests preserve provenance references; they do not
    prove that calibration was correct or that the digest matches source bytes. -/
structure CalibratedTimeInterval where
  localTimebaseId : String
  commonTimebaseId : String
  calibrationRef : String
  calibrationDigest : String
  support : TimeInterval
  localTimebaseId_nonempty : localTimebaseId ≠ ""
  commonTimebaseId_nonempty : commonTimebaseId ≠ ""
  calibrationRef_nonempty : calibrationRef ≠ ""
  calibrationDigest_nonempty : calibrationDigest ≠ ""

/-- A precommitted tolerance policy on a named common timebase. Ticks are
    ordering metadata in the declared control timebase, not authenticated
    access logs. -/
structure FrozenRegistrationPolicy where
  commonTimebaseId : String
  tolerance : ℝ
  toleranceRef : String
  toleranceDigest : String
  lockTick : Nat
  firstExternalAccessTick : Nat
  commonTimebaseId_nonempty : commonTimebaseId ≠ ""
  tolerance_nonneg : 0 ≤ tolerance
  toleranceRef_nonempty : toleranceRef ≠ ""
  toleranceDigest_nonempty : toleranceDigest ≠ ""
  lock_precedes_access : lockTick ≤ firstExternalAccessTick

/-- Interval compatibility at a declared nonnegative tolerance. -/
def WithinTolerance (a b : TimeInterval) (δ : ℝ) : Prop :=
  0 ≤ δ ∧ intervalGap a b ≤ δ

theorem withinTolerance_mono
    (a b : TimeInterval) {δ₁ δ₂ : ℝ}
    (hδ : δ₁ ≤ δ₂)
    (h : WithinTolerance a b δ₁) :
    WithinTolerance a b δ₂ := by
  exact ⟨h.1, le_trans h.2 hδ⟩

/-- A pair is temporally admissible only when both calibrated intervals use
    the policy's common timebase and their separation is within its frozen
    tolerance. -/
def ApproximateJoin
    (policy : FrozenRegistrationPolicy)
    (source target : CalibratedTimeInterval) : Prop :=
  source.commonTimebaseId = policy.commonTimebaseId ∧
  target.commonTimebaseId = policy.commonTimebaseId ∧
  WithinTolerance source.support target.support policy.tolerance

theorem approximateJoin_rejects_source_timebase_mismatch
    (policy : FrozenRegistrationPolicy)
    (source target : CalibratedTimeInterval)
    (h : source.commonTimebaseId ≠ policy.commonTimebaseId) :
    ¬ ApproximateJoin policy source target := by
  intro hJoin
  exact h hJoin.1

theorem approximateJoin_rejects_target_timebase_mismatch
    (policy : FrozenRegistrationPolicy)
    (source target : CalibratedTimeInterval)
    (h : target.commonTimebaseId ≠ policy.commonTimebaseId) :
    ¬ ApproximateJoin policy source target := by
  intro hJoin
  exact h hJoin.2.1

/-- Increasing a precommitted tolerance on the same common timebase can only
    add admissible pairs; it cannot remove an existing pair. -/
theorem approximateJoin_mono
    (p q : FrozenRegistrationPolicy)
    (source target : CalibratedTimeInterval)
    (hCommon : p.commonTimebaseId = q.commonTimebaseId)
    (hTolerance : p.tolerance ≤ q.tolerance)
    (hJoin : ApproximateJoin p source target) :
    ApproximateJoin q source target := by
  rcases hJoin with ⟨hSource, hTarget, hWithin⟩
  exact ⟨hSource.trans hCommon, hTarget.trans hCommon,
    withinTolerance_mono source.support target.support hTolerance hWithin⟩

/-- If the calibrated supports overlap on the declared common timebase, the
    pair is admitted for every nonnegative frozen tolerance. -/
theorem approximateJoin_of_overlapping
    (policy : FrozenRegistrationPolicy)
    (source target : CalibratedTimeInterval)
    (hSource : source.commonTimebaseId = policy.commonTimebaseId)
    (hTarget : target.commonTimebaseId = policy.commonTimebaseId)
    (hOverlap : IntervalsOverlap source.support target.support) :
    ApproximateJoin policy source target := by
  refine ⟨hSource, hTarget, policy.tolerance_nonneg, ?_⟩
  rw [(intervalGap_eq_zero_iff_overlap source.support target.support).2 hOverlap]
  exact policy.tolerance_nonneg

/-- One admitted sample pair carries distinct source/target sample IDs and
    its own alignment-evidence reference. externalCheckPassed is an
    ingestion attestation, not an independently verified calibration. -/
structure ApproximateSampleJoin
    (policy : FrozenRegistrationPolicy) where
  sourceSampleId : String
  targetSampleId : String
  source : CalibratedTimeInterval
  target : CalibratedTimeInterval
  alignmentEvidenceRef : String
  externalCheckPassed : Bool
  sourceSampleId_nonempty : sourceSampleId ≠ ""
  targetSampleId_nonempty : targetSampleId ≠ ""
  alignmentEvidenceRef_nonempty : alignmentEvidenceRef ≠ ""
  admissible : ApproximateJoin policy source target
  externalCheck : externalCheckPassed = true

/-- The relation induced by one frozen policy and two calibrated sample maps. -/
def ApproximateJoinRelation
    {A B : Type*}
    (policy : FrozenRegistrationPolicy)
    (source : A → CalibratedTimeInterval)
    (target : B → CalibratedTimeInterval)
    (a : A) (b : B) : Prop :=
  ApproximateJoin policy (source a) (target b)

/-- A relation is a partial one-to-one matching only when it is functional
    in both directions. Temporal compatibility alone does not supply this. -/
def IsPartialMatching {A B : Type*} (R : A → B → Prop) : Prop :=
  (∀ a b₁ b₂, R a b₁ → R a b₂ → b₁ = b₂) ∧
  (∀ b a₁ a₂, R a₁ b → R a₂ b → a₁ = a₂)

/-! The following finite construction is an abstract mathematical
counterexample, not a physical data fixture. Two distinct source samples and
two distinct target samples are assigned the same abstract calibrated
interval. Even at zero tolerance, every pair is temporally compatible. -/

/-- Abstract frozen policy used only to witness non-uniqueness of the relation. -/
def abstractPolicy : FrozenRegistrationPolicy where
  commonTimebaseId := "common"
  tolerance := 0
  toleranceRef := "abstract-policy"
  toleranceDigest := "abstract-digest"
  lockTick := 0
  firstExternalAccessTick := 0
  commonTimebaseId_nonempty := by decide
  tolerance_nonneg := le_rfl
  toleranceRef_nonempty := by decide
  toleranceDigest_nonempty := by decide
  lock_precedes_access := le_rfl

/-- Abstract interval used only for the finite logical counterexample. -/
def abstractInterval : CalibratedTimeInterval where
  localTimebaseId := "local"
  commonTimebaseId := "common"
  calibrationRef := "abstract-calibration"
  calibrationDigest := "abstract-digest"
  support := ⟨0, 1, by norm_num⟩
  localTimebaseId_nonempty := by decide
  commonTimebaseId_nonempty := by decide
  calibrationRef_nonempty := by decide
  calibrationDigest_nonempty := by decide

def abstractSource : Fin 2 → CalibratedTimeInterval := fun _ => abstractInterval
def abstractTarget : Fin 2 → CalibratedTimeInterval := fun _ => abstractInterval

theorem abstract_zero_tolerance_all_pairs
    (a b : Fin 2) :
    ApproximateJoinRelation abstractPolicy abstractSource abstractTarget a b := by
  norm_num [ApproximateJoinRelation, ApproximateJoin, abstractPolicy,
    abstractSource, abstractTarget, abstractInterval, WithinTolerance,
    intervalGap]

/-- A tolerance relation, even with a frozen zero tolerance, does not imply
    a unique one-to-one sample pairing. A separate partial-matching witness
    or a source-derived event identity is required. -/
theorem approximate_compatibility_does_not_imply_unique_pairing :
    ¬ IsPartialMatching
      (ApproximateJoinRelation abstractPolicy abstractSource abstractTarget) := by
  intro hMatching
  have h00 :
      ApproximateJoinRelation abstractPolicy abstractSource abstractTarget
        (0 : Fin 2) (0 : Fin 2) :=
    abstract_zero_tolerance_all_pairs 0 0
  have h01 :
      ApproximateJoinRelation abstractPolicy abstractSource abstractTarget
        (0 : Fin 2) (1 : Fin 2) :=
    abstract_zero_tolerance_all_pairs 0 1
  have hEq : (0 : Fin 2) = 1 := hMatching.1 0 0 1 h00 h01
  exact (by decide : (0 : Fin 2) ≠ 1) hEq

#print axioms intervalGap_eq_zero_iff_overlap
#print axioms approximateJoin_mono
#print axioms approximateJoin_of_overlapping
#print axioms abstract_zero_tolerance_all_pairs
#print axioms approximate_compatibility_does_not_imply_unique_pairing

end HsHVerification.TernApproximateTemporalRegistration
