import Mathlib

/-!
Orson Vay P1, 2026-10-27: source-anchored logical gate for the real
ConsistencyBench temperature-contrapositive questions.
Original benchmark sample blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d,
full benchmark blob 3171d2899fd1eb4292794df5952514666b0e2f43.
The source asks whether t < 10 follows from (t > 30 -> Q) and not Q.
The numbers 10 and 30 are from the actual archived question text.
These are conditional logical theorems, not measured temperatures,
LLM observations, a physics calculation, or validation of source translation.
-/

namespace HsHVerification.OrsonTemperatureLogicGate

/-- Valid classical contrapositive: not Q yields t <= 30. -/
theorem genuine_contrapositive (t : ℝ) (Q : Prop)
    (hRule : t > 30 → Q) (hNotQ : ¬ Q) : t ≤ 30 := by
  by_contra hNotLe
  have hGt : t > 30 := by linarith
  exact hNotQ (hRule hGt)

/-- The source's stronger threshold is not a consequence of t <= 30. -/
theorem threshold_gap :
    ¬ (∀ t : ℝ, t ≤ 30 → t < 10) := by
  intro h
  have hImpossible : (30 : ℝ) < 10 := h 30 (le_refl _)
  norm_num at hImpossible

/-- A rule and negated consequent do not universally imply t < 10. -/
theorem claimed_strong_contrapositive_invalid :
    ¬ (∀ (t : ℝ) (Q : Prop), (t > 30 → Q) → ¬ Q → t < 10) := by
  intro h
  have hRule : (30 : ℝ) > 30 → False := by
    intro hGt
    norm_num at hGt
  have hNotQ : ¬ False := by
    intro hf
    exact hf
  have hImpossible : (30 : ℝ) < 10 := h 30 False hRule hNotQ
  norm_num at hImpossible

/-- Extra premise explicitly required to obtain the stronger bound. -/
theorem stronger_bound_requires_extra (t : ℝ) (Q : Prop)
    (hRule : t > 30 → Q) (hNotQ : ¬ Q)
    (hExtra : t ≤ 30 → t < 10) : t < 10 := by
  exact hExtra (genuine_contrapositive t Q hRule hNotQ)

#print axioms genuine_contrapositive
#print axioms threshold_gap
#print axioms claimed_strong_contrapositive_invalid
#print axioms stronger_bound_requires_extra

end HsHVerification.OrsonTemperatureLogicGate
