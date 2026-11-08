import Mathlib

namespace HsHVerification.ComposedMapErrorBound

/-!
A generic deterministic error-composition contract for a chain of approximate maps.

This module supplies no H(s)H map, metric, physical parameter, or measured error.
The constants below are hypotheses that a source-defined map and its approximation
must independently justify.  The bounds are deterministic metric errors, not
statistical standard deviations, covariance matrices, or set-valued fiber
ambiguities.
-/

/-- Two-stage composition: an upstream approximation error is multiplied by a
Lipschitz bound for the exact downstream map, then the downstream local error
is added. -/
theorem two_stage_composition_error_bound
    {X Y Z : Type*}
    [PseudoMetricSpace X] [PseudoMetricSpace Y] [PseudoMetricSpace Z]
    (f f' : X → Y) (g g' : Y → Z)
    (L ε₁ ε₂ : ℝ≥0)
    (hLip : ∀ y₁ y₂, dist (g y₁) (g y₂) ≤ (L : ℝ) * dist y₁ y₂)
    (hFirst : ∀ x, dist (f x) (f' x) ≤ (ε₁ : ℝ))
    (hSecond : ∀ y, dist (g y) (g' y) ≤ (ε₂ : ℝ)) :
    ∀ x, dist (g (f x)) (g' (f' x))
      ≤ (L : ℝ) * (ε₁ : ℝ) + (ε₂ : ℝ) := by
  intro x
  calc
    dist (g (f x)) (g' (f' x))
        ≤ dist (g (f x)) (g (f' x)) +
            dist (g (f' x)) (g' (f' x)) :=
          dist_triangle _ _ _
    _ ≤ (L : ℝ) * dist (f x) (f' x) + (ε₂ : ℝ) :=
          add_le_add (hLip _ _) (hSecond _)
    _ ≤ (L : ℝ) * (ε₁ : ℝ) + (ε₂ : ℝ) := by
          exact add_le_add_right
            (mul_le_mul_of_nonneg_left (hFirst x)
              (show 0 ≤ (L : ℝ) from L.2))
            _

/-- Three-stage composition.  The middle-stage error is first propagated
through the final exact map; the first-stage error is propagated through both
exact downstream maps. -/
theorem three_stage_composition_error_bound
    {X Y Z W : Type*}
    [PseudoMetricSpace X] [PseudoMetricSpace Y]
    [PseudoMetricSpace Z] [PseudoMetricSpace W]
    (f f' : X → Y) (g g' : Y → Z) (h h' : Z → W)
    (L₁ L₂ ε₁ ε₂ ε₃ : ℝ≥0)
    (hLipG : ∀ y₁ y₂, dist (g y₁) (g y₂) ≤ (L₁ : ℝ) * dist y₁ y₂)
    (hLipH : ∀ z₁ z₂, dist (h z₁) (h z₂) ≤ (L₂ : ℝ) * dist z₁ z₂)
    (hFirst : ∀ x, dist (f x) (f' x) ≤ (ε₁ : ℝ))
    (hSecond : ∀ y, dist (g y) (g' y) ≤ (ε₂ : ℝ))
    (hThird : ∀ z, dist (h z) (h' z) ≤ (ε₃ : ℝ)) :
    ∀ x, dist (h (g (f x))) (h' (g' (f' x)))
      ≤ (L₂ : ℝ) * ((L₁ : ℝ) * (ε₁ : ℝ) + (ε₂ : ℝ)) +
          (ε₃ : ℝ) := by
  have hInner := two_stage_composition_error_bound
    f f' g g' L₁ ε₁ ε₂ hLipG hFirst hSecond
  intro x
  calc
    dist (h (g (f x))) (h' (g' (f' x)))
        ≤ dist (h (g (f x))) (h (g' (f' x))) +
            dist (h (g' (f' x))) (h' (g' (f' x))) :=
          dist_triangle _ _ _
    _ ≤ (L₂ : ℝ) * dist (g (f x)) (g' (f' x)) + (ε₃ : ℝ) :=
          add_le_add (hLipH _ _) (hThird _)
    _ ≤ (L₂ : ℝ) *
          ((L₁ : ℝ) * (ε₁ : ℝ) + (ε₂ : ℝ)) + (ε₃ : ℝ) := by
          exact add_le_add_right
            (mul_le_mul_of_nonneg_left (hInner x)
              (show 0 ≤ (L₂ : ℝ) from L₂.2))
            _

/-- If the exact downstream map is nonexpansive, the two local errors add
without amplification. -/
theorem two_stage_nonexpansive_error_bound
    {X Y Z : Type*}
    [PseudoMetricSpace X] [PseudoMetricSpace Y] [PseudoMetricSpace Z]
    (f f' : X → Y) (g g' : Y → Z)
    (L ε₁ ε₂ : ℝ≥0)
    (hL : (L : ℝ) ≤ 1)
    (hLip : ∀ y₁ y₂, dist (g y₁) (g y₂) ≤ (L : ℝ) * dist y₁ y₂)
    (hFirst : ∀ x, dist (f x) (f' x) ≤ (ε₁ : ℝ))
    (hSecond : ∀ y, dist (g y) (g' y) ≤ (ε₂ : ℝ)) :
    ∀ x, dist (g (f x)) (g' (f' x))
      ≤ (ε₁ : ℝ) + (ε₂ : ℝ) := by
  have hGeneral := two_stage_composition_error_bound
    f f' g g' L ε₁ ε₂ hLip hFirst hSecond
  intro x
  calc
    dist (g (f x)) (g' (f' x))
        ≤ (L : ℝ) * (ε₁ : ℝ) + (ε₂ : ℝ) := hGeneral x
    _ ≤ (ε₁ : ℝ) + (ε₂ : ℝ) := by
          exact add_le_add_right
            (mul_le_mul_of_nonneg_right hL
              (show 0 ≤ (ε₁ : ℝ) from ε₁.2))
            _

#print axioms HsHVerification.ComposedMapErrorBound.two_stage_composition_error_bound
#print axioms HsHVerification.ComposedMapErrorBound.three_stage_composition_error_bound
#print axioms HsHVerification.ComposedMapErrorBound.two_stage_nonexpansive_error_bound

end HsHVerification.ComposedMapErrorBound
