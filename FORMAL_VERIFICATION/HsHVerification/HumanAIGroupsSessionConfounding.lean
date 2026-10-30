import Mathlib

namespace HsHVerification.HumanAIGroupsSessionConfounding

/-
Source transcription: Lin Chen et al., "AI agents reshape consensus formation
in human groups", arXiv:2609.02122 (2026-09-02), Supplementary Information,
Participants and Game Procedure.

The paper reports eight conditions with human counts
24, 21, 16, 12, 6, 16, 16, 16, and says each experimental session has 24
participants (humans plus LLM agents). The list below pairs those counts with
the complementary agent counts. Lean verifies only the arithmetic in this
transcription. It does not validate the paper or the inference that each
condition corresponds to exactly one session.

The identifiability theorem is conditional: if a treatment level occurs in
exactly one group/session, its treatment indicator is identical to that
session's group indicator. A group fixed effect and that treatment effect
cannot then be separately identified. This theorem does not prove that the
source interpretation is correct, that any published p-value is wrong, or
that the paper's causal conclusions are false.
-/

/-- Reported (human, agent) composition for the eight experimental conditions. -/
def reportedConditions : List (Nat × Nat) :=
  [(24, 0), (21, 3), (16, 8), (12, 12), (6, 18),
   (16, 8), (16, 8), (16, 8)]

/-- Each transcribed condition fills one 24-member session. -/
theorem eachConditionHas24Slots :
    reportedConditions.all (fun p => p.1 + p.2 = 24) = true := by
  decide

/-- The transcribed human counts sum to the paper's reported 127. -/
theorem reportedHumanCount :
    (reportedConditions.map Prod.fst).sum = 127 := by
  decide

/-- The complementary agent counts sum to 65. -/
theorem reportedAgentCount :
    (reportedConditions.map Prod.snd).sum = 65 := by
  decide

/-- Eight 24-member sessions contain 192 total participant/agent slots. -/
theorem reportedTotalSlots :
    (reportedConditions.map (fun p => p.1 + p.2)).sum = 192 := by
  decide

/-- Indicator of a keyed category/value match, represented over the reals. -/
def indicator {α : Type} [DecidableEq α] (key value : α) : ℝ :=
  if value = key then 1 else 0

/-- A linear predictor containing a group intercept and a treatment effect. -/
def linearPredictor {G T : Type} [DecidableEq G] [DecidableEq T]
    (assign : G → T) (t : T) (g₀ : G)
    (groupEffect treatmentEffect : ℝ) (g : G) : ℝ :=
  groupEffect * indicator g₀ g +
    treatmentEffect * indicator t (assign g)

/--
If treatment t occurs in exactly one group g₀, its indicator is identical to
the indicator for that group. This is a conditional algebraic statement.
-/
theorem treatmentIndicator_eq_groupIndicator
    {G T : Type} [DecidableEq G] [DecidableEq T]
    (assign : G → T) (t : T) (g₀ : G)
    (h_unique : ∀ g, assign g = t ↔ g = g₀) :
    ∀ g, indicator t (assign g) = indicator g₀ g := by
  intro g
  by_cases h : assign g = t
  · have hg : g = g₀ := (h_unique g).mp h
    subst g
    simp [indicator, h]
  · have hg : g ≠ g₀ := by
      intro hg
      exact h ((h_unique g).mpr hg)
    simp [indicator, h, hg]

/--
Under the unique-group premise, shifting δ from the treatment coefficient to
the matching group intercept leaves every fitted value unchanged.
-/
theorem linearPredictor_shift_invariant
    {G T : Type} [DecidableEq G] [DecidableEq T]
    (assign : G → T) (t : T) (g₀ : G)
    (h_unique : ∀ g, assign g = t ↔ g = g₀)
    (alpha beta delta : ℝ) :
    ∀ g,
      linearPredictor assign t g₀ (alpha + delta) (beta - delta) g =
        linearPredictor assign t g₀ alpha beta g := by
  intro g
  unfold linearPredictor
  rw [treatmentIndicator_eq_groupIndicator assign t g₀ h_unique g]
  by_cases hg : g = g₀
  · simp [indicator, hg]
  · simp [indicator, hg]

/-- A nonzero shift produces a genuinely different coefficient pair. -/
theorem shiftedCoefficients_areDistinct
    (alpha beta delta : ℝ) (h_delta : delta ≠ 0) :
    (alpha + delta, beta - delta) ≠ (alpha, beta) := by
  intro h
  have h_first : alpha + delta = alpha := congrArg Prod.fst h
  have h_zero : delta = 0 := by linarith
  exact h_delta h_zero

/--
Conditional non-identifiability: with one group per treatment level, distinct
group/treatment coefficients can generate exactly the same fitted values.
-/
theorem groupTreatmentCoefficients_not_identifiable
    {G T : Type} [DecidableEq G] [DecidableEq T]
    (assign : G → T) (t : T) (g₀ : G)
    (h_unique : ∀ g, assign g = t ↔ g = g₀)
    (alpha beta delta : ℝ) (h_delta : delta ≠ 0) :
    (∀ g,
      linearPredictor assign t g₀ (alpha + delta) (beta - delta) g =
        linearPredictor assign t g₀ alpha beta g) ∧
      (alpha + delta, beta - delta) ≠ (alpha, beta) := by
  constructor
  · exact linearPredictor_shift_invariant assign t g₀ h_unique alpha beta delta
  · exact shiftedCoefficients_areDistinct alpha beta delta h_delta

#print axioms eachConditionHas24Slots
#print axioms reportedHumanCount
#print axioms reportedAgentCount
#print axioms reportedTotalSlots
#print axioms treatmentIndicator_eq_groupIndicator
#print axioms linearPredictor_shift_invariant
#print axioms shiftedCoefficients_areDistinct
#print axioms groupTreatmentCoefficients_not_identifiable

end HsHVerification.HumanAIGroupsSessionConfounding
