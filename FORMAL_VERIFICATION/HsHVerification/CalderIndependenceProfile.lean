import Mathlib

/-!
# Claim-scoped acquisition and independence evidence

A verified channel-to-acquisition parentage map is necessary for unit-level
holdout assignment, but it is not evidence that distinct acquisition units
are statistically independent or independently replicated.

This module keeps two questions separate:

1. Is each scored channel assigned to one source-backed acquisition parent?
2. For the particular independence claim being made, are the required
   dependency axes documented as distinct?

The dependency axes are raw data, acquisition, apparatus, personnel,
calibration, analysis, evaluation, and laboratory. A claim policy declares
which axes must be distinct for that claim. There is deliberately no universal
independence Boolean or universal axis policy.

This is an evidence-admission specification. It does not authenticate a
source locator, verify a manifest digest, establish that an evidence statement
is true, estimate covariance, or prove physical/statistical independence.
No physical dataset or numerical fixture is represented here.
-/

namespace HsHVerification.CalderIndependenceProfile

/-- A source locator that is not empty. Its authenticity is external. -/
structure EvidenceLocator where
  value : String
  nonempty : value ≠ ""

/-- Parentage is unknown, ambiguous, or uniquely assigned with a source locator. -/
inductive ParentageEvidence (AcquisitionUnit : Type)
  | unknown
  | ambiguous (evidence : EvidenceLocator)
  | verified (unit : AcquisitionUnit) (evidence : EvidenceLocator)

/-- Only a source-backed unique parent assignment is eligible for unit-level splitting. -/
def parentageReady {AcquisitionUnit : Type} :
    ParentageEvidence AcquisitionUnit → Prop
  | .verified _ _ => True
  | .unknown => False
  | .ambiguous _ => False

/-- Dependency dimensions that may matter to a particular independence claim. -/
inductive DependencyAxis
  | rawData
  | acquisition
  | apparatus
  | personnel
  | calibration
  | analysis
  | evaluation
  | laboratory
  deriving DecidableEq, Fintype

/-- Relationship on one dependency axis. Partial is not silently treated as distinct. -/
inductive DependencyState
  | unknown
  | shared
  | distinct
  | partial
  deriving DecidableEq

/-- A source-backed state for one dependency axis. -/
structure AxisEvidence where
  state : DependencyState
  source : Option EvidenceLocator

/-- One profile records the dependency state independently on each axis. -/
abbrev DependencyProfile := DependencyAxis → AxisEvidence

/--
A claim-specific policy declares which dependency axes must be distinct.
A nonempty policy prevents vacuous independence claims.
-/
structure IndependenceClaimPolicy where
  requiredDistinct : DependencyAxis → Bool
  nonempty : ∃ axis, requiredDistinct axis = true

/--
Evidence-admission rule for an independence claim. This is not a truth
predicate: it checks only that unique parentage is recorded and every
policy-required axis is explicitly documented as distinct.
-/
def IndependenceClaimAdmissible {AcquisitionUnit : Type}
    (parentage : ParentageEvidence AcquisitionUnit)
    (profile : DependencyProfile)
    (policy : IndependenceClaimPolicy) : Prop :=
  parentageReady parentage ∧
    ∀ axis, policy.requiredDistinct axis = true →
      (profile axis).state = .distinct ∧ (profile axis).source.isSome

theorem unknown_parentage_blocks_claim
    {AcquisitionUnit : Type}
    (profile : DependencyProfile)
    (policy : IndependenceClaimPolicy) :
    ¬ IndependenceClaimAdmissible
      (ParentageEvidence.unknown : ParentageEvidence AcquisitionUnit)
      profile policy := by
  simp [IndependenceClaimAdmissible, parentageReady]

theorem ambiguous_parentage_blocks_claim
    {AcquisitionUnit : Type}
    (evidence : EvidenceLocator)
    (profile : DependencyProfile)
    (policy : IndependenceClaimPolicy) :
    ¬ IndependenceClaimAdmissible
      (ParentageEvidence.ambiguous evidence : ParentageEvidence AcquisitionUnit)
      profile policy := by
  simp [IndependenceClaimAdmissible, parentageReady]

theorem unknown_required_axis_blocks_claim
    {AcquisitionUnit : Type}
    (parentage : ParentageEvidence AcquisitionUnit)
    (profile : DependencyProfile)
    (policy : IndependenceClaimPolicy)
    (axis : DependencyAxis)
    (hParentage : parentageReady parentage)
    (hRequired : policy.requiredDistinct axis = true)
    (hUnknown : (profile axis).state = .unknown) :
    ¬ IndependenceClaimAdmissible parentage profile policy := by
  intro h
  have hDistinct := (h.2 axis hRequired).1
  rw [hUnknown] at hDistinct
  contradiction

theorem shared_required_axis_blocks_claim
    {AcquisitionUnit : Type}
    (parentage : ParentageEvidence AcquisitionUnit)
    (profile : DependencyProfile)
    (policy : IndependenceClaimPolicy)
    (axis : DependencyAxis)
    (hParentage : parentageReady parentage)
    (hRequired : policy.requiredDistinct axis = true)
    (hShared : (profile axis).state = .shared) :
    ¬ IndependenceClaimAdmissible parentage profile policy := by
  intro h
  have hDistinct := (h.2 axis hRequired).1
  rw [hShared] at hDistinct
  contradiction

theorem partial_required_axis_blocks_claim
    {AcquisitionUnit : Type}
    (parentage : ParentageEvidence AcquisitionUnit)
    (profile : DependencyProfile)
    (policy : IndependenceClaimPolicy)
    (axis : DependencyAxis)
    (hParentage : parentageReady parentage)
    (hRequired : policy.requiredDistinct axis = true)
    (hPartial : (profile axis).state = .partial) :
    ¬ IndependenceClaimAdmissible parentage profile policy := by
  intro h
  have hDistinct := (h.2 axis hRequired).1
  rw [hPartial] at hDistinct
  contradiction

/--
Even verified acquisition parentage alone does not admit an independence
claim: the claim policy and its required dependency-axis evidence remain
separate inputs.
-/
theorem verified_parentage_alone_does_not_admit_independence_claim
    {AcquisitionUnit : Type}
    (unit : AcquisitionUnit)
    (parentageEvidence : EvidenceLocator) :
    ∃ profile policy,
      parentageReady (ParentageEvidence.verified unit parentageEvidence) ∧
      ¬ IndependenceClaimAdmissible
        (ParentageEvidence.verified unit parentageEvidence) profile policy := by
  let profile : DependencyProfile := fun _ => ⟨.unknown, none⟩
  let policy : IndependenceClaimPolicy :=
    ⟨fun axis => decide (axis = .laboratory),
      ⟨.laboratory, by simp⟩⟩
  refine ⟨profile, policy, ?_, ?_⟩
  · simp [parentageReady]
  · intro h
    have hDistinct := (h.2 .laboratory (by simp [policy])).1
    simp [profile] at hDistinct

#print axioms unknown_parentage_blocks_claim
#print axioms ambiguous_parentage_blocks_claim
#print axioms unknown_required_axis_blocks_claim
#print axioms shared_required_axis_blocks_claim
#print axioms partial_required_axis_blocks_claim
#print axioms verified_parentage_alone_does_not_admit_independence_claim

end HsHVerification.CalderIndependenceProfile
