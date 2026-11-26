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


/-! ## Uncertainty-aware feature identification

A state may admit a set of compatible observations rather than a single point.
A prediction region could later be instantiated by a calibrated predictive set,
a deterministic tolerance envelope, or another predeclared observation set.
This module does not construct statistical coverage or derive a region from
covariance; those are external, source- and data-dependent obligations.
-/

/-- The observation set admitted by the prediction model for a state. -/
abbrev PredictionRegion (State Observation : Type*) := State → Set Observation

/-- A feature is identifiable under set-valued predictions when every observation
compatible with two states forces those states to share the same feature value. -/
def UncertaintyFeatureIdentifiable
    {State Observation Feature : Type*}
    (region : PredictionRegion State Observation)
    (feature : State → Feature) : Prop :=
  ∀ s₁ s₂ y, y ∈ region s₁ → y ∈ region s₂ → feature s₁ = feature s₂

/-- Prediction regions are separated when states with distinct feature values
have disjoint regions. -/
def DistinctFeatureRegionsDisjoint
    {State Observation Feature : Type*}
    (region : PredictionRegion State Observation)
    (feature : State → Feature) : Prop :=
  ∀ s₁ s₂, feature s₁ ≠ feature s₂ →
    Disjoint (region s₁) (region s₂)

/-- Global feature identification is equivalent to pairwise disjoint prediction
regions for every pair of states with different feature values. -/
theorem uncertaintyFeatureIdentifiable_iff_distinctFeatureRegionsDisjoint
    {State Observation Feature : Type*}
    (region : PredictionRegion State Observation)
    (feature : State → Feature) :
    UncertaintyFeatureIdentifiable region feature ↔
      DistinctFeatureRegionsDisjoint region feature := by
  constructor
  · intro hident s₁ s₂ hfeature
    apply Set.disjoint_left.mpr
    intro y hy₁ hy₂
    exact hfeature (hident s₁ s₂ y hy₁ hy₂)
  · intro hseparated s₁ s₂ y hy₁ hy₂
    by_contra hfeature
    exact (Set.disjoint_left.mp (hseparated s₁ s₂ hfeature)) hy₁ hy₂

/-- One observation lying in two prediction regions with different feature
values is a witness that the feature is not identifiable. -/
theorem overlappingPredictionRegions_block_identifiability
    {State Observation Feature : Type*}
    (region : PredictionRegion State Observation)
    (feature : State → Feature)
    (hoverlap : ∃ s₁ s₂ y,
      feature s₁ ≠ feature s₂ ∧
      y ∈ region s₁ ∧ y ∈ region s₂) :
    ¬ UncertaintyFeatureIdentifiable region feature := by
  rcases hoverlap with ⟨s₁, s₂, y, hfeature, hy₁, hy₂⟩
  intro hident
  exact hfeature (hident s₁ s₂ y hy₁ hy₂)

/-- Singleton prediction regions recover the ordinary exact-readout fiber
criterion. The set-valued gate is therefore a genuine generalization of the
deterministic identifiability condition. -/
theorem singletonPredictionRegions_iff_exactReadoutFiberIdentifiability
    {State Observation Feature : Type*}
    (readout : State → Observation)
    (feature : State → Feature) :
    UncertaintyFeatureIdentifiable
      (fun s => ({readout s} : Set Observation)) feature ↔
      ∀ s₁ s₂, readout s₁ = readout s₂ → feature s₁ = feature s₂ := by
  constructor
  · intro hident s₁ s₂ hreadout
    exact hident s₁ s₂ (readout s₁) (by simp) (by simp [hreadout])
  · intro hfiber s₁ s₂ y hy₁ hy₂
    have hy₁' : y = readout s₁ := by simpa using hy₁
    have hy₂' : y = readout s₂ := by simpa using hy₂
    exact hfiber s₁ s₂ (hy₁'.symm.trans hy₂')

#print axioms uncertaintyFeatureIdentifiable_iff_distinctFeatureRegionsDisjoint
#print axioms overlappingPredictionRegions_block_identifiability
#print axioms singletonPredictionRegions_iff_exactReadoutFiberIdentifiability


/-! ## Shared-parameter-conditioned identifiability

The context parameter represents whatever must be held fixed for a fair
comparison: shared physical parameters, calibration state, instrument version,
and the declared nuisance budget. Identifiability is tested within each such
context, not by comparing states that were allowed different shared settings.
-/

/-- A feature is identifiable within each shared context when an observation
compatible with two states in that same context forces equal feature values. -/
def ContextualUncertaintyFeatureIdentifiable
    {State Observation Feature Context : Type*}
    (region : PredictionRegion State Observation)
    (feature : State → Feature)
    (sharedContext : State → Context) : Prop :=
  ∀ s₁ s₂ y, sharedContext s₁ = sharedContext s₂ →
    y ∈ region s₁ → y ∈ region s₂ → feature s₁ = feature s₂

/-- Prediction regions for distinct feature values are disjoint when the
compared states share the same declared context. -/
def DistinctFeatureRegionsDisjointWithinContext
    {State Observation Feature Context : Type*}
    (region : PredictionRegion State Observation)
    (feature : State → Feature)
    (sharedContext : State → Context) : Prop :=
  ∀ s₁ s₂, sharedContext s₁ = sharedContext s₂ →
    feature s₁ ≠ feature s₂ →
    Disjoint (region s₁) (region s₂)

/-- Conditional feature identification is equivalent to pairwise disjoint
prediction regions inside each fixed shared-parameter context. -/
theorem contextualUncertaintyFeatureIdentifiable_iff_disjointWithinContext
    {State Observation Feature Context : Type*}
    (region : PredictionRegion State Observation)
    (feature : State → Feature)
    (sharedContext : State → Context) :
    ContextualUncertaintyFeatureIdentifiable region feature sharedContext ↔
      DistinctFeatureRegionsDisjointWithinContext region feature sharedContext := by
  constructor
  · intro hident s₁ s₂ hcontext hfeature
    apply Set.disjoint_left.mpr
    intro y hy₁ hy₂
    exact hfeature (hident s₁ s₂ y hcontext hy₁ hy₂)
  · intro hseparated s₁ s₂ y hcontext hy₁ hy₂
    by_contra hfeature
    exact (Set.disjoint_left.mp (hseparated s₁ s₂ hcontext hfeature)) hy₁ hy₂

/-- An overlap witness within one shared context blocks feature identification
for that context, even when the observation region is uncertainty-aware. -/
theorem overlappingPredictionRegionsWithinContext_block_identifiability
    {State Observation Feature Context : Type*}
    (region : PredictionRegion State Observation)
    (feature : State → Feature)
    (sharedContext : State → Context)
    (hoverlap : ∃ s₁ s₂ y,
      sharedContext s₁ = sharedContext s₂ ∧
      feature s₁ ≠ feature s₂ ∧
      y ∈ region s₁ ∧ y ∈ region s₂) :
    ¬ ContextualUncertaintyFeatureIdentifiable region feature sharedContext := by
  rcases hoverlap with ⟨s₁, s₂, y, hcontext, hfeature, hy₁, hy₂⟩
  intro hident
  exact hfeature (hident s₁ s₂ y hcontext hy₁ hy₂)

/-- Singleton regions recover exact readout-fiber identifiability while
holding the shared context fixed. -/
theorem singletonPredictionRegions_iff_exactReadoutFiberIdentifiabilityWithinContext
    {State Observation Feature Context : Type*}
    (readout : State → Observation)
    (feature : State → Feature)
    (sharedContext : State → Context) :
    ContextualUncertaintyFeatureIdentifiable
      (fun s => ({readout s} : Set Observation)) feature sharedContext ↔
      ∀ s₁ s₂, sharedContext s₁ = sharedContext s₂ →
        readout s₁ = readout s₂ → feature s₁ = feature s₂ := by
  constructor
  · intro hident s₁ s₂ hcontext hreadout
    exact hident s₁ s₂ (readout s₁) hcontext (by simp) (by simp [hreadout])
  · intro hfiber s₁ s₂ y hcontext hy₁ hy₂
    have hy₁' : y = readout s₁ := by simpa using hy₁
    have hy₂' : y = readout s₂ := by simpa using hy₂
    exact hfiber s₁ s₂ hcontext (hy₁'.symm.trans hy₂')

#print axioms contextualUncertaintyFeatureIdentifiable_iff_disjointWithinContext
#print axioms overlappingPredictionRegionsWithinContext_block_identifiability
#print axioms singletonPredictionRegions_iff_exactReadoutFiberIdentifiabilityWithinContext
