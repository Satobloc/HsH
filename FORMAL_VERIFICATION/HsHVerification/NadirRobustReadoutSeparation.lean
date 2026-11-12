import Mathlib

/-!
# Robust readout separation against a standard-only predictor

Let `S : X → Y` be the baseline/standard observable and `H : X → Z`
a proposed additional readout. A standard-only predictor has the form
`f ∘ S`.

This module proves a tolerance-aware separation criterion. If two states are
close in the baseline observable, the standard-only predictor is known to be
K-Lipschitz, and the proposed readouts are separated by more than the
baseline sensitivity allowance plus twice the output tolerance, then no
such standard-only predictor can fit both states within that tolerance.

The result is a conditional metric-space theorem. It does not construct
physical maps, derive the Lipschitz constant from a physical model, supply
measured uncertainties, or establish that an H(s)H observable exists.
For an empirical application, S, H, the metrics, K, the input-resolution
bound, and the output tolerance must be fixed from source-defined maps,
calibration, and real measured data before holdout evaluation. If K is not
independently bounded, the criterion is not yet operational.
-/

namespace HsHVerification.NadirRobustReadoutSeparation

universe u v w

variable {X : Type u} {Y : Type v} {Z : Type w}
variable [PseudoMetricSpace Y] [PseudoMetricSpace Z]

/--
A K-Lipschitz standard-only predictor cannot fit two proposed readouts
within tolerance δ when the baseline observations are within ε but the
candidate readouts are separated by more than K ε + 2 δ.

Interpretation:
* S is the baseline/standard readout;
* H is a proposed additional readout;
* f is any standard-only predictor;
* K is a justified sensitivity bound for f;
* ε is the baseline-observation resolution/uncertainty bound;
* δ is the allowed candidate-readout prediction error.
-/
theorem no_lipschitz_standard_predictor_can_fit_both
    (S : X → Y) (H : X → Z) (f : Y → Z)
    (K ε δ : ℝ≥0)
    (hLip : LipschitzWith K f)
    (x y : X)
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
    simpa using hLip (S x) (S y)
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

/--
Exact-fibre corollary: if two states have exactly the same baseline
readout, a proposed readout separation greater than twice the tolerance
cannot be fitted by any deterministic standard-only predictor, regardless
of its Lipschitz constant.
-/
theorem exact_baseline_fiber_separation_excludes_fit
    (S : X → Y) (H : X → Z) (f : Y → Z)
    (K δ : ℝ≥0)
    (hLip : LipschitzWith K f)
    (x y : X)
    (hSameBaseline : S x = S y)
    (hSeparation :
      2 * (δ : ℝ) < dist (H x) (H y)) :
    ¬ (dist (f (S x)) (H x) ≤ (δ : ℝ) ∧
       dist (f (S y)) (H y) ≤ (δ : ℝ)) := by
  apply no_lipschitz_standard_predictor_can_fit_both
    S H f K 0 δ hLip x y
  · simpa [hSameBaseline]
  · simpa using hSeparation

#print axioms no_lipschitz_standard_predictor_can_fit_both
#print axioms exact_baseline_fiber_separation_excludes_fit

end HsHVerification.NadirRobustReadoutSeparation
