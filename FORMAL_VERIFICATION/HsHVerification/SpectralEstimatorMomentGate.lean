import Mathlib

/-!
# Fourth-moment requirement for quadratic-estimator uncertainty

For a finite real-valued law X, the variance of the quadratic output X^2 is
  Var(X^2) = E[X^4] - (E[X^2])^2.

The finite laws below are abstract mathematical witnesses only. They are not
measurements, physical fixtures, or a model of the Kelvin-vortex system.
They show that matching the first two moments of an input does not determine
the variance of its quadratic output. For a complex Fourier amplitude
Z = X + iY, the corresponding power variance requires fourth-order joint
information involving X and Y.
-/

namespace HsHVerification.SpectralEstimatorMomentGate

/-- A finite three-atom probability law on the real line. -/
structure FiniteLaw3 where
  weight : Fin 3 → ℝ
  outcome : Fin 3 → ℝ
  weight_nonneg : ∀ i, 0 ≤ weight i
  weight_sum : weight 0 + weight 1 + weight 2 = 1

/-- Raw moment E[X^n] for a finite three-atom law. -/
def rawMoment (law : FiniteLaw3) (n : ℕ) : ℝ :=
  law.weight 0 * law.outcome 0 ^ n +
  law.weight 1 * law.outcome 1 ^ n +
  law.weight 2 * law.outcome 2 ^ n

def mean (law : FiniteLaw3) : ℝ := rawMoment law 1
def secondMoment (law : FiniteLaw3) : ℝ := rawMoment law 2
def fourthMoment (law : FiniteLaw3) : ℝ := rawMoment law 4

/-- Variance of the input variable X. -/
def inputVariance (law : FiniteLaw3) : ℝ :=
  secondMoment law - mean law ^ 2

/-- Variance of the quadratic output X^2. -/
def quadraticOutputVariance (law : FiniteLaw3) : ℝ :=
  fourthMoment law - secondMoment law ^ 2

/-- First finite law: equal mass at -1 and +1. -/
def weightsA (i : Fin 3) : ℝ :=
  if i = 0 then (1 : ℝ) / 2 else if i = 1 then (1 : ℝ) / 2 else 0

def outcomesA (i : Fin 3) : ℝ :=
  if i = 0 then -1 else if i = 1 then 1 else 0

def lawA : FiniteLaw3 where
  weight := weightsA
  outcome := outcomesA
  weight_nonneg := by
    intro i
    fin_cases i <;> norm_num [weightsA]
  weight_sum := by norm_num [weightsA]

/-- Second finite law: mass 3/4 at 0 and 1/8 at each of -2 and +2. -/
def weightsB (i : Fin 3) : ℝ :=
  if i = 0 then (3 : ℝ) / 4 else (1 : ℝ) / 8

def outcomesB (i : Fin 3) : ℝ :=
  if i = 0 then 0 else if i = 1 then 2 else -2

def lawB : FiniteLaw3 where
  weight := weightsB
  outcome := outcomesB
  weight_nonneg := by
    intro i
    fin_cases i <;> norm_num [weightsB]
  weight_sum := by norm_num [weightsB]

theorem lawA_mean : mean lawA = 0 := by
  norm_num [mean, rawMoment, lawA, weightsA, outcomesA]

theorem lawB_mean : mean lawB = 0 := by
  norm_num [mean, rawMoment, lawB, weightsB, outcomesB]

theorem lawA_secondMoment : secondMoment lawA = 1 := by
  norm_num [secondMoment, rawMoment, lawA, weightsA, outcomesA]

theorem lawB_secondMoment : secondMoment lawB = 1 := by
  norm_num [secondMoment, rawMoment, lawB, weightsB, outcomesB]

theorem lawA_fourthMoment : fourthMoment lawA = 1 := by
  norm_num [fourthMoment, rawMoment, lawA, weightsA, outcomesA]

theorem lawB_fourthMoment : fourthMoment lawB = 4 := by
  norm_num [fourthMoment, rawMoment, lawB, weightsB, outcomesB]

/-- The two laws have the same mean and the same input variance. -/
theorem same_first_two_moments :
    (mean lawA, secondMoment lawA) =
      (mean lawB, secondMoment lawB) := by
  apply Prod.ext
  · exact lawA_mean.trans lawB_mean.symm
  · exact lawA_secondMoment.trans lawB_secondMoment.symm

theorem same_input_variance :
    inputVariance lawA = inputVariance lawB := by
  norm_num [inputVariance, lawA_mean, lawB_mean,
    lawA_secondMoment, lawB_secondMoment]

theorem lawA_quadraticOutputVariance :
    quadraticOutputVariance lawA = 0 := by
  norm_num [quadraticOutputVariance, lawA_fourthMoment,
    lawA_secondMoment]

theorem lawB_quadraticOutputVariance :
    quadraticOutputVariance lawB = 3 := by
  norm_num [quadraticOutputVariance, lawB_fourthMoment,
    lawB_secondMoment]

/--
No function of the input mean and second raw moment alone can recover the
variance of the quadratic output for every finite three-atom law.
This is a mathematical non-identifiability witness, not an empirical result.
-/
theorem second_order_moments_do_not_determine_quadratic_output_variance :
    ¬ ∃ f : ℝ × ℝ → ℝ,
      ∀ law : FiniteLaw3,
        f (mean law, secondMoment law) =
          quadraticOutputVariance law := by
  rintro ⟨f, hf⟩
  have h := congrArg f same_first_two_moments
  rw [hf lawA, hf lawB,
    lawA_quadraticOutputVariance,
    lawB_quadraticOutputVariance] at h
  norm_num at h

#print axioms same_first_two_moments
#print axioms same_input_variance
#print axioms lawA_quadraticOutputVariance
#print axioms lawB_quadraticOutputVariance
#print axioms second_order_moments_do_not_determine_quadratic_output_variance

end HsHVerification.SpectralEstimatorMomentGate
