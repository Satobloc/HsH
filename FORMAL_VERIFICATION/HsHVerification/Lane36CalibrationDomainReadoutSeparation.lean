import Mathlib
import HsHVerification.NadirRobustReadoutSeparation

/-!
# Calibration-domain restriction for robust readout separation

The existing Nadir separation theorem assumes a global Lipschitz bound on the
entire baseline-observable space. A calibration-derived bound is ordinarily
certified only on a declared domain. This adapter makes that domain part of
the predictor's type and restricts the tested states to those whose baseline
readouts lie inside it.

Consequently, the theorem applies to a holdout pair only when both baseline
readouts are covered by the calibration domain. It does not license
extrapolation beyond that domain.

This is a conditional formal contract. It does not establish that a real
calibration procedure has correctly certified the Lipschitz bound, that
holdout observations are independent, or that any physical H(s)H readout
exists.
-/

namespace HsHVerification.Lane36CalibrationDomainReadoutSeparation

universe u v w

variable {X : Type u} {Y : Type v} {Z : Type w}
variable [PseudoMetricSpace Y] [PseudoMetricSpace Z]

/-- States whose baseline readouts are inside the calibration-certified domain. -/
abbrev CalibrationAdmissibleState (S : X → Y) (D : Set Y) :=
  {x : X // S x ∈ D}

/--
A domain-restricted form of Nadir's robust readout-separation theorem.

The standard-only predictor is defined on the subtype of baseline observations
inside D. The Lipschitz premise therefore needs to hold only on D, while
the subtype witnesses ensure that both tested holdout states remain inside
that certified domain.
-/
theorem no_lipschitz_standard_predictor_can_fit_both_on_calibration_domain
    (S : X → Y) (H : X → Z) (D : Set Y)
    (f : {y : Y // y ∈ D} → Z)
    (K ε δ : NNReal)
    (hLip :
      HsHVerification.NadirRobustReadoutSeparation.DistLipschitzWith K f)
    (x y : CalibrationAdmissibleState S D)
    (hBaseline : dist (S x.1) (S y.1) ≤ (ε : ℝ))
    (hSeparation :
      (K : ℝ) * (ε : ℝ) + 2 * (δ : ℝ) <
        dist (H x.1) (H y.1)) :
    ¬ (dist (f ⟨S x.1, x.2⟩) (H x.1) ≤ (δ : ℝ) ∧
       dist (f ⟨S y.1, y.2⟩) (H y.1) ≤ (δ : ℝ)) := by
  let S_D : CalibrationAdmissibleState S D → {y : Y // y ∈ D} :=
    fun x => ⟨S x.1, x.2⟩
  let H_D : CalibrationAdmissibleState S D → Z := fun x => H x.1
  have hBaseline' :
      dist (S_D x) (S_D y) ≤ (ε : ℝ) := by
    simpa [S_D] using hBaseline
  have hSeparation' :
      (K : ℝ) * (ε : ℝ) + 2 * (δ : ℝ) <
        dist (H_D x) (H_D y) := by
    simpa [H_D] using hSeparation
  have hNoFit :=
    HsHVerification.NadirRobustReadoutSeparation.no_lipschitz_standard_predictor_can_fit_both
      S_D H_D f K ε δ hLip x y hBaseline' hSeparation'
  simpa [S_D, H_D] using hNoFit

#print axioms no_lipschitz_standard_predictor_can_fit_both_on_calibration_domain

end HsHVerification.Lane36CalibrationDomainReadoutSeparation
