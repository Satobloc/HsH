import Mathlib

/-!
# Calibration-domain restriction for robust readout separation

The published robust-separation test contract bounds the standard-only
predictor's Lipschitz sensitivity on a declared calibration domain. The
global theorem in the existing Nadir module assumes a bound over the entire
baseline-observable space. This module states the corresponding domain-local
condition directly.

Both holdout baseline observations must lie inside the calibration-certified
domain. The theorem does not license extrapolation beyond that domain.

This is a conditional formal contract. It does not establish that a real
calibration procedure has correctly certified the Lipschitz bound, that
holdout observations are independent, or that any physical H(s)H readout
exists.
-/

namespace HsHVerification.Lane36CalibrationDomainReadoutSeparation

universe u v w

variable {X : Type u} {Y : Type v} {Z : Type w}
variable [PseudoMetricSpace Y] [PseudoMetricSpace Z]

/-- A standard-only predictor has a K-Lipschitz bound only on D. -/
def DistLipschitzWithOn (D : Set Y) (K : NNReal) (f : Y → Z) : Prop :=
  ∀ y₁ y₂, y₁ ∈ D → y₂ ∈ D →
    dist (f y₁) (f y₂) ≤ (K : ℝ) * dist y₁ y₂

/--
A domain-local standard-only predictor cannot fit both proposed readouts
within tolerance δ when the two baseline observations lie in the
calibration-certified domain D, are within ε, and the candidate readouts
are separated by more than K ε + 2 δ.
-/
theorem no_lipschitz_standard_predictor_can_fit_both_on_calibration_domain
    (S : X → Y) (H : X → Z) (D : Set Y) (f : Y → Z)
    (K ε δ : NNReal)
    (hLip : DistLipschitzWithOn D K f)
    (x y : X)
    (hSx : S x ∈ D)
    (hSy : S y ∈ D)
    (hBaseline : dist (S x) (S y) ≤ (ε : ℝ))
    (hSeparation :
      (K : ℝ) * (ε : ℝ) + 2 * (δ : ℝ) <
        dist (H x) (H y)) :
    ¬ (dist (f (S x)) (H x) ≤ (δ : ℝ) ∧
       dist (f (S y)) (H y) ≤ (δ : ℝ)) := by
  rintro ⟨hErrorX, hErrorY⟩
  have hLipXY :
      dist (f (S x)) (f (S y)) ≤
        (K : ℝ) * dist (S x) (S y) := by
    exact hLip (S x) (S y) hSx hSy
  have hScaled :
      (K : ℝ) * dist (S x) (S y) ≤
        (K : ℝ) * (ε : ℝ) :=
    mul_le_mul_of_nonneg_left hBaseline (by positivity)
  have hMiddle :
      dist (f (S x)) (H y) ≤
        (K : ℝ) * (ε : ℝ) + (δ : ℝ) := by
    calc
      dist (f (S x)) (H y) ≤
          dist (f (S x)) (f (S y)) +
            dist (f (S y)) (H y) := dist_triangle _ _ _
      _ ≤ (K : ℝ) * (ε : ℝ) + (δ : ℝ) :=
        add_le_add (le_trans hLipXY hScaled) hErrorY
  have hErrorX' :
      dist (H x) (f (S x)) ≤ (δ : ℝ) := by
    simpa [dist_comm] using hErrorX
  have hBound :
      dist (H x) (H y) ≤
        2 * (δ : ℝ) + (K : ℝ) * (ε : ℝ) := by
    calc
      dist (H x) (H y) ≤
          dist (H x) (f (S x)) +
            dist (f (S x)) (H y) := dist_triangle _ _ _
      _ ≤ (δ : ℝ) +
          ((K : ℝ) * (ε : ℝ) + (δ : ℝ)) :=
        add_le_add hErrorX' hMiddle
      _ = 2 * (δ : ℝ) + (K : ℝ) * (ε : ℝ) := by ring
  linarith

#print axioms no_lipschitz_standard_predictor_can_fit_both_on_calibration_domain

end HsHVerification.Lane36CalibrationDomainReadoutSeparation
