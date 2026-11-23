import Mathlib

/-!
# Extra-state sensitivity versus feature identifiability

This module separates two questions that can otherwise be conflated:

1. Does a readout depend on some extra state at fixed base state?
2. Does the complete readout identify the particular feature of that extra state?

A finite witness shows that the first can be true while the second is false.
The witness is purely logical; its finite labels are not physical thickness,
twist, contact, or measured data.

Lean checks only these definitions and proofs. It does not establish that a
physical H(s)H readout has these properties or that the source-to-model
translation is correct.
-/

namespace HsHVerification.ExtraStructureFeatureIdentifiability

/-- A family of typed readouts indexed by measurement channel. -/
abbrev Readout (Channel : Type*) (Observable : Channel → Type*) :=
  (i : Channel) → Observable i

/-- Two states have the same complete readout family. -/
def SameReadout
    {Channel : Type*} {Observable : Channel → Type*}
    (left right : Readout Channel Observable) : Prop :=
  ∀ i, left i = right i

/-- Every channel can be predicted from the base state alone. -/
def FactorsThroughBase
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable) : Prop :=
  ∃ basePredict : Base → Readout Channel Observable,
    ∀ b e i, predict (b, e) i = basePredict b i

/-- Some extra-state change at fixed base changes at least one channel. -/
def ExtraSensitive
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable) : Prop :=
  ∃ b e₁ e₂ i, predict (b, e₁) i ≠ predict (b, e₂) i

/-- A target feature is identifiable when it is constant on readout fibers. -/
def FeatureIdentifiable
    {Base Extra Channel Feature : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable)
    (feature : Base × Extra → Feature) : Prop :=
  ∀ s₁ s₂, SameReadout (predict s₁) (predict s₂) →
    feature s₁ = feature s₂

/-- A pair of observationally indistinguishable states with different feature values. -/
def FeatureAmbiguous
    {Base Extra Channel Feature : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable)
    (feature : Base × Extra → Feature) : Prop :=
  ∃ s₁ s₂, SameReadout (predict s₁) (predict s₂) ∧
    feature s₁ ≠ feature s₂

/-- A fixed-base, one-channel difference blocks every base-only predictor. -/
theorem extraSensitivity_blocks_base_factorization
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable)
    (hsensitive : ExtraSensitive predict) :
    ¬ FactorsThroughBase predict := by
  rcases hsensitive with ⟨b, e₁, e₂, i, hchange⟩
  rintro ⟨basePredict, hbase⟩
  apply hchange
  calc
    predict (b, e₁) i = basePredict b i := hbase b e₁ i
    _ = predict (b, e₂) i := (hbase b e₂ i).symm

/-- Any same-readout/different-feature pair blocks feature identifiability. -/
theorem featureAmbiguity_blocks_identifiability
    {Base Extra Channel Feature : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable)
    (feature : Base × Extra → Feature)
    (hambiguous : FeatureAmbiguous predict feature) :
    ¬ FeatureIdentifiable predict feature := by
  rcases hambiguous with ⟨s₁, s₂, hreadout, hfeature⟩
  intro hident
  exact hfeature (hident s₁ s₂ hreadout)

/-! ## Finite logical witness

There are three abstract extra states and two readout values. State 0 is
distinguished from states 1 and 2, but states 1 and 2 share the same readout.
This is enough to reject a base-only predictor while leaving the feature
identity unresolved. The labels have no physical interpretation.
-/

def witnessPredict
    (s : Unit × Fin 3) : Readout Unit (fun _ => Fin 2) :=
  fun _ => if s.2 = 0 then 0 else 1

def witnessFeature (s : Unit × Fin 3) : Fin 3 := s.2

theorem witness_extra_sensitive : ExtraSensitive witnessPredict := by
  refine ⟨(), 0, 1, (), ?_⟩
  simp [witnessPredict]

theorem witness_feature_ambiguous :
    FeatureAmbiguous witnessPredict witnessFeature := by
  refine ⟨((), 1), ((), 2), ?_, ?_⟩
  · intro i
    simp [witnessPredict]
  · simp [witnessFeature]

theorem witness_not_base_factorable :
    ¬ FactorsThroughBase witnessPredict :=
  extraSensitivity_blocks_base_factorization witnessPredict witness_extra_sensitive

theorem witness_not_feature_identifiable :
    ¬ FeatureIdentifiable witnessPredict witnessFeature :=
  featureAmbiguity_blocks_identifiability
    witnessPredict witnessFeature witness_feature_ambiguous

/-- The two dispositions can coexist: extra-state sensitivity does not identify
which extra-state feature produced the readout. -/
theorem witness_extra_required_but_feature_unidentified :
    ExtraSensitive witnessPredict ∧
      FeatureAmbiguous witnessPredict witnessFeature :=
  ⟨witness_extra_sensitive, witness_feature_ambiguous⟩

#print axioms extraSensitivity_blocks_base_factorization
#print axioms featureAmbiguity_blocks_identifiability
#print axioms witness_extra_sensitive
#print axioms witness_feature_ambiguous
#print axioms witness_not_base_factorable
#print axioms witness_not_feature_identifiable
#print axioms witness_extra_required_but_feature_unidentified

end HsHVerification.ExtraStructureFeatureIdentifiability
