import Mathlib

/-!
# Orson: SycoLens truth-effect sensitivity

Source comparator: "Anatomy of LLM Sycophancy: What a Flip Rate Hides,"
arXiv:2610.06522, Sections 2 and 4.

The source defines a two-stratum average of truth-direction contrasts and
states a common additive minority-status effect assumption under which the
status contribution cancels. This module formalizes only that conditional
algebra. It does not validate the empirical assumption, the source's data,
or transfer the estimand to ConsistencyBench.
-/

namespace HsHVerification.OrsonSycoLensEstimand

/-- Source-qualified average of the two stratum-specific contrasts. -/
noncomputable def sycoLensTau (tPlus tMinus : ℝ) : ℝ :=
  (tPlus + tMinus) / 2

/--
Conditional decomposition: the two observed stratum contrasts contain
truth-directed components plus/minus their respective minority-status effects.
-/
noncomputable def tauWithStatus
    (truthPlus truthMinus statusPlus statusMinus : ℝ) : ℝ :=
  sycoLensTau (truthPlus + statusPlus) (truthMinus - statusMinus)

/-- The residual status contribution is half the between-stratum difference. -/
theorem tau_with_status_decomposition
    (truthPlus truthMinus statusPlus statusMinus : ℝ) :
    tauWithStatus truthPlus truthMinus statusPlus statusMinus =
      sycoLensTau truthPlus truthMinus + (statusPlus - statusMinus) / 2 := by
  unfold tauWithStatus sycoLensTau
  ring

/-- A common additive minority-status effect cancels in the two-stratum average. -/
theorem tau_cancels_common_status_effect
    (truthPlus truthMinus status : ℝ) :
    tauWithStatus truthPlus truthMinus status status =
      sycoLensTau truthPlus truthMinus := by
  unfold tauWithStatus sycoLensTau
  ring

/--
Within this decomposition, the averaged contrast equals the truth-component
average exactly when the two stratum-specific status effects are equal.
-/
theorem tau_identifies_truth_average_iff_status_effects_equal
    (truthPlus truthMinus statusPlus statusMinus : ℝ) :
    tauWithStatus truthPlus truthMinus statusPlus statusMinus =
      sycoLensTau truthPlus truthMinus ↔ statusPlus = statusMinus := by
  unfold tauWithStatus sycoLensTau
  constructor
  · intro h
    linarith
  · intro h
    rw [h]
    ring

end HsHVerification.OrsonSycoLensEstimand
