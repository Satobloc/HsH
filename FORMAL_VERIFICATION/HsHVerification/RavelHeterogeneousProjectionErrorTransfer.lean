import Mathlib

/-!
# Ravel: heterogeneous projection-error transfer

This module fills a narrow gap between two existing formal contracts:

* NadirResolutionTolerance composes tolerance bounds when comparisons are made
  in one declared pseudometric space.
* RavelDirectedSliceChainComposition composes explicit slice maps across
  different carrier/sheet/ambient types, but its maps are exact and it has no
  metric-error transfer law.

The theorem below handles a two-stage chain whose intermediate and final
representations have different pseudometrics. The first-stage exact and
approximate outputs must both remain in an explicitly declared admissible
domain. The second-stage map must have a supplied Lipschitz bound on that
domain, and its approximation error must also be bounded there.

The resulting budget is epsilon₂ + L * epsilon₁. It is not valid to add
errors from different representation spaces without a declared transfer
bound. Iterating the theorem requires a separate domain and Lipschitz
certificate at every stage.

The real-line counterexample shows why some regularity condition is needed:
for any positive input tolerance and any proposed finite output bound, a
linear map can amplify the input discrepancy beyond that bound.

No H(s)H physical projection, metric, calibration, Lipschitz constant,
uncertainty value, Kerr map, or measured system is instantiated here. These
are conditional mathematical results only. The counterexample is abstract
mathematics, not a physical fixture or empirical calculation.
-/

namespace HsHVerification.RavelHeterogeneousProjectionErrorTransfer

/-- A two-stage projection/readout chain with different intermediate and
final metric spaces. The Lipschitz and approximation bounds are deliberately
restricted to an explicit admissible domain D. -/
theorem heterogeneousProjectionErrorBound
    {X Y Z : Type*}
    [PseudoMetricSpace Y] [PseudoMetricSpace Z]
    (D : Set Y)
    (P Papprox : X → Y)
    (R Rapprox : Y → Z)
    (L epsilon₁ epsilon₂ : ℝ)
    (hL : 0 ≤ L)
    (hε₁ : 0 ≤ epsilon₁)
    (hε₂ : 0 ≤ epsilon₂)
    (hStage1 : ∀ x,
      P x ∈ D ∧
      Papprox x ∈ D ∧
      dist (P x) (Papprox x) ≤ epsilon₁)
    (hLipschitz : ∀ y₁ y₂,
      y₁ ∈ D → y₂ ∈ D →
      dist (R y₁) (R y₂) ≤ L * dist y₁ y₂)
    (hStage2 : ∀ y, y ∈ D →
      dist (R y) (Rapprox y) ≤ epsilon₂) :
    0 ≤ epsilon₂ + L * epsilon₁ ∧
      ∀ x, dist (R (P x)) (Rapprox (Papprox x)) ≤
        epsilon₂ + L * epsilon₁ := by
  constructor
  · exact add_nonneg hε₂ (mul_nonneg hL hε₁)
  · intro x
    rcases hStage1 x with ⟨hPx, hPapprox, hErr⟩
    calc
      dist (R (P x)) (Rapprox (Papprox x))
          ≤ dist (R (P x)) (R (Papprox x)) +
              dist (R (Papprox x)) (Rapprox (Papprox x)) :=
            dist_triangle _ _ _
      _ ≤ L * dist (P x) (Papprox x) + epsilon₂ :=
        add_le_add (hLipschitz _ _ hPx hPapprox) (hStage2 _ hPapprox)
      _ ≤ L * epsilon₁ + epsilon₂ :=
        add_le_add (mul_le_mul_of_nonneg_left hErr hL) le_rfl
      _ = epsilon₂ + L * epsilon₁ := by ring

/-- Without a regularity/transfer bound on the second-stage map, no finite
uniform output-error bound follows from an input tolerance alone. For every
positive input tolerance and every proposed finite output bound, a linear
map can amplify a pair within that tolerance beyond the proposed bound. -/
theorem noUniformErrorTransferWithoutLipschitz
    (epsilon proposedBound : ℝ)
    (hε : 0 < epsilon)
    (hBound : 0 ≤ proposedBound) :
    ∃ f : ℝ → ℝ, ∃ x y : ℝ,
      |x - y| ≤ epsilon ∧
      proposedBound < |f x - f y| := by
  let scale : ℝ := (proposedBound + 1) / epsilon
  refine ⟨fun t => scale * t, 0, epsilon, ?_⟩
  constructor
  · change |(0 : ℝ) - epsilon| ≤ epsilon
    rw [zero_sub, abs_neg, abs_of_pos hε]
  · have hscale : scale * epsilon = proposedBound + 1 := by
      dsimp [scale]
      field_simp [ne_of_gt hε]
    change proposedBound < |scale * (0 : ℝ) - scale * epsilon|
    rw [show scale * (0 : ℝ) = 0 by ring, hscale]
    have hpos : 0 < proposedBound + 1 := by linarith
    rw [zero_sub, abs_neg, abs_of_pos hpos]
    linarith

#print axioms heterogeneousProjectionErrorBound
#print axioms noUniformErrorTransferWithoutLipschitz

end HsHVerification.RavelHeterogeneousProjectionErrorTransfer
