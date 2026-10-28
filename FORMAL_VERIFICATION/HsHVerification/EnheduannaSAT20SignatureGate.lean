import Mathlib

/-!
# SAT20 co-metric source-fidelity gate (conditional)
Primary archived sources:
* HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT20_Emergent_Filament_Surface_Theory_Neutral.txt
  Git blob 1b91341f43a18477837446dbc4f67d7711345032
* HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT20_Emergent_Filament_Surface_Theory_CriticHardened_v2.txt
  Git blob 8b523ce0acc18b9df1d2737c5b21c3c3ab92906a
* HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_16/Hostile Review Auditor Setup/SAT_20_AUDIT.txt
  Git blob 8501b7b37102f43cb5469eed5f826d93b265f884

A nonnegative-weight average of real outer products has a nonnegative
quadratic form. This theorem is conditional on weights and the stated
finite-dimensional construction. It does not establish the provenance
of those weights, a physical metric, Lorentzian signature, or any
empirical claim. No data-free physical calculation is executed.
-/

namespace HsHVerification.EnheduannaSAT20SignatureGate

/-- Source's co-metric outer-product construction as a finite weighted
    quadratic form, written without introducing an unearned metric. -/
def sourceQuadratic {ι : Type*} [Fintype ι]
    (w : ι → ℝ) (v : ι → Fin 4 → ℝ) (x : Fin 4 → ℝ) : ℝ :=
  ∑ i, w i * (∑ j, v i j * x j) ^ 2

/-- Nonnegative weights force the source's quadratic form to be
    nonnegative on every vector. -/
theorem sourceQuadratic_nonneg {ι : Type*} [Fintype ι]
    (w : ι → ℝ) (v : ι → Fin 4 → ℝ) (x : Fin 4 → ℝ)
    (hw : ∀ i, 0 ≤ w i) :
    0 ≤ sourceQuadratic w v x := by
  unfold sourceQuadratic
  apply Finset.sum_nonneg
  intro i hi
  exact mul_nonneg (hw i) (sq_nonneg _)

/-- The same construction cannot assign a negative quadratic value
    to any proposed time-direction vector under the same assumptions. -/
theorem sourceQuadratic_not_negative {ι : Type*} [Fintype ι]
    (w : ι → ℝ) (v : ι → Fin 4 → ℝ) (x : Fin 4 → ℝ)
    (hw : ∀ i, 0 ≤ w i) :
    ¬ sourceQuadratic w v x < 0 := by
  exact not_lt.mpr (sourceQuadratic_nonneg w v x hw)

#print axioms sourceQuadratic_nonneg
#print axioms sourceQuadratic_not_negative

end HsHVerification.EnheduannaSAT20SignatureGate
