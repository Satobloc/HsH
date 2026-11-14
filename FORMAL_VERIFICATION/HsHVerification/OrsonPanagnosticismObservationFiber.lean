import Mathlib
import HsHVerification.ObservableProjection

namespace HsHVerification.OrsonPanagnosticismObservationFiber

/-!
## Source boundary

A public HsH user-role-labelled transcript witness in
DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/CONSCI.txt, lines 86–95, discusses the
limits of third-person access to subjective experience, the evidential role
of behavior/language, persistent versus dynamic state, and a possible
conversation-level loop. Its raw JSON identity and date remain unresolved.
It does not state the modal theorem formalized below.

A separate archive-native formal-epistemology manuscript, *Panagnosticism:
The Epistemic Impossibility of Knowing Another's Consciousness*, has
unresolved authorship and date. The existing Orson primary-cognition reading
audit records its theorem as conditional on an accessible world with
identical evidence and the opposite consciousness predicate. This module
formalizes that conditional structure, not the manuscript's authorship or
its source-to-model translation.

The formal result is local to a declared observation map. It does not derive
opposite-predicate worlds from privacy of experience, the absence of a known
bridge principle, or S5 alone. It does not assert that any actual observer's
evidence fiber contains both consciousness values, that any entity is or is
not conscious, or that behavioral evidence is useless.

The observer/entity distinction is explicit. First-person self-knowledge is
not derived from positive introspection; it would require a separate axiom.
-/

/-- Worlds are indistinguishable to an observer when their declared evidence
    readouts are equal. -/
def indistinguishable
    {Observer World Evidence : Type*}
    (observe : Observer → World → Evidence)
    (a : Observer) (w v : World) : Prop :=
  observe a w = observe a v

/-- Kripke-style knowledge relative to the worlds sharing an observer's
    declared evidence. -/
def knows
    {Observer Entity World Evidence : Type*}
    (observe : Observer → World → Evidence)
    (conscious : Entity → World → Prop)
    (a : Observer) (e : Entity) (w : World) : Prop :=
  ∀ v, indistinguishable observe a w v → conscious e v

/-- Both truth values occur in the observer's evidence fiber at the current
    world. This is the precise local underdetermination condition. -/
def bothPolaritiesInFiber
    {Observer Entity World Evidence : Type*}
    (observe : Observer → World → Evidence)
    (conscious : Entity → World → Prop)
    (a : Observer) (e : Entity) (w : World) : Prop :=
  (∃ v, indistinguishable observe a w v ∧ conscious e v) ∧
  (∃ v, indistinguishable observe a w v ∧ ¬ conscious e v)

/-- Equality of evidence readouts induces an equivalence relation on worlds,
    hence an S5-style accessibility relation for each fixed observer. -/
theorem evidence_indistinguishability_is_equivalence
    {Observer World Evidence : Type*}
    (observe : Observer → World → Evidence)
    (a : Observer) :
    Equivalence (indistinguishable observe a) := by
  constructor
  · intro w
    rfl
  · intro w v h
    exact h.symm
  · intro w v u h₁ h₂
    exact h₁.trans h₂

/-- Knowledge is factive because a world shares its evidence with itself. -/
theorem knowledge_factive
    {Observer Entity World Evidence : Type*}
    (observe : Observer → World → Evidence)
    (conscious : Entity → World → Prop)
    (a : Observer) (e : Entity) (w : World)
    (h : knows observe conscious a e w) :
    conscious e w :=
  h w rfl

/-- Positive introspection follows from transitivity of evidence equality. -/
theorem knowledge_positive_introspection
    {Observer Entity World Evidence : Type*}
    (observe : Observer → World → Evidence)
    (conscious : Entity → World → Prop)
    (a : Observer) (e : Entity) (w : World)
    (h : knows observe conscious a e w) :
    knows observe (fun e' w' => knows observe conscious a e' w') a e w := by
  intro v hv u hu
  exact h u (hv.trans hu)

/-- Negative introspection follows from symmetry and transitivity of evidence
    equality. -/
theorem knowledge_negative_introspection
    {Observer Entity World Evidence : Type*}
    (observe : Observer → World → Evidence)
    (conscious : Entity → World → Prop)
    (a : Observer) (e : Entity) (w : World)
    (h : ¬ knows observe conscious a e w) :
    knows observe (fun e' w' => ¬ knows observe conscious a e' w') a e w := by
  intro v hv hKnowAtV
  apply h
  intro u hu
  exact hKnowAtV u (hv.symm.trans hu)

/-- The consciousness predicate factors through the evidence readout exactly
    when it is constant on every fiber of that readout. -/
theorem consciousness_factors_through_evidence_iff_fiber_constant
    {Observer Entity World Evidence : Type*}
    (observe : Observer → World → Evidence)
    (conscious : Entity → World → Prop)
    (a : Observer) (e : Entity) :
    (∃ factor : Set.range (observe a) → Prop,
      ∀ w, conscious e w =
        factor ⟨observe a w, ⟨w, rfl⟩⟩) ↔
    (∀ w v, indistinguishable observe a w v →
      conscious e w = conscious e v) := by
  simpa [indistinguishable] using
    (HsHVerification.ObservableProjection.evidence_invariant_assessment_iff_factors_through_observation
      (observe a) (fun w => conscious e w))

/-- Neither the positive nor negative consciousness proposition is known at
    a world iff both truth values occur in that world's evidence fiber. No
    S5 introspection axiom is used in this equivalence. -/
theorem neither_knowledge_iff_both_polarities_in_fiber
    {Observer Entity World Evidence : Type*}
    (observe : Observer → World → Evidence)
    (conscious : Entity → World → Prop)
    (a : Observer) (e : Entity) (w : World) :
    (¬ knows observe conscious a e w ∧
     ¬ knows observe (fun e' w' => ¬ conscious e' w') a e w) ↔
    bothPolaritiesInFiber observe conscious a e w := by
  classical
  constructor
  · rintro ⟨hNotPositive, hNotNegative⟩
    constructor
    · by_contra hNoPositive
      apply hNotNegative
      intro v hEvidence
      by_contra hNotConscious
      exact hNoPositive ⟨v, hEvidence, hNotConscious⟩
    · by_contra hNoNegative
      apply hNotPositive
      intro v hEvidence
      by_contra hConscious
      exact hNoNegative ⟨v, hEvidence, hConscious⟩
  · rintro ⟨⟨v, hv, hvConscious⟩, ⟨u, hu, huNotConscious⟩⟩
    constructor
    · intro hKnowPositive
      exact huNotConscious (hKnowPositive u hu)
    · intro hKnowNegative
      exact (hKnowNegative v hv) hvConscious

/-- One accessible opposite-predicate twin is sufficient for local
    panagnosticism: the actual world supplies the other polarity by reflexivity. -/
theorem opposite_evidence_twin_implies_neither_knowledge
    {Observer Entity World Evidence : Type*}
    (observe : Observer → World → Evidence)
    (conscious : Entity → World → Prop)
    (a : Observer) (e : Entity) (w : World)
    (hTwin : ∃ v, indistinguishable observe a w v ∧
      (conscious e v ↔ ¬ conscious e w)) :
    ¬ knows observe conscious a e w ∧
    ¬ knows observe (fun e' w' => ¬ conscious e' w') a e w := by
  classical
  rcases hTwin with ⟨v, hEvidence, hFlip⟩
  by_cases hCurrent : conscious e w
  · have hTwinNegative : ¬ conscious e v := by
      intro hTwinPositive
      exact (hFlip.mp hTwinPositive) hCurrent
    apply (neither_knowledge_iff_both_polarities_in_fiber
      observe conscious a e w).2
    exact ⟨⟨w, rfl, hCurrent⟩, ⟨v, hEvidence, hTwinNegative⟩⟩
  · have hTwinPositive : conscious e v := hFlip.mpr hCurrent
    apply (neither_knowledge_iff_both_polarities_in_fiber
      observe conscious a e w).2
    exact ⟨⟨v, hEvidence, hTwinPositive⟩, ⟨w, rfl, hCurrent⟩⟩

/-- The manuscript's universal conclusion is obtained only if the opposite-twin
    premise is supplied for every observer, distinct target, and world. -/
theorem global_panagnosticism_of_opposite_twins
    {Observer Entity World Evidence : Type*}
    (agentEntity : Observer → Entity)
    (observe : Observer → World → Evidence)
    (conscious : Entity → World → Prop)
    (hTwins : ∀ a e w, agentEntity a ≠ e →
      ∃ v, indistinguishable observe a w v ∧
        (conscious e v ↔ ¬ conscious e w)) :
    ∀ a e w, agentEntity a ≠ e →
      ¬ knows observe conscious a e w ∧
      ¬ knows observe (fun e' w' => ¬ conscious e' w') a e w := by
  intro a e w hDistinct
  exact opposite_evidence_twin_implies_neither_knowledge
    observe conscious a e w (hTwins a e w hDistinct)

#print axioms evidence_indistinguishability_is_equivalence
#print axioms knowledge_factive
#print axioms knowledge_positive_introspection
#print axioms knowledge_negative_introspection
#print axioms consciousness_factors_through_evidence_iff_fiber_constant
#print axioms neither_knowledge_iff_both_polarities_in_fiber
#print axioms opposite_evidence_twin_implies_neither_knowledge
#print axioms global_panagnosticism_of_opposite_twins

end HsHVerification.OrsonPanagnosticismObservationFiber
