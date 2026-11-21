import Mathlib

/-!
# Orson cognition methods: paired-discordance dependence counterexample

This is an abstract finite counterexample for the independence assumption
behind the conditional binomial step in the exact McNemar test.

The two coordinates represent the harmful/protective directions of two
already-discordant case pairs. In the coupled sample space, a shared session
state forces both directions to be equal. In the product sample space, the
two directions vary independently. Every coordinate has the same Bernoulli
(1/2) marginal in both spaces, but the count of harmful directions has
different distributions.

This formalizes only the mathematical counterexample. It does not establish
that OV-95/96 sessions are clustered, estimate an ICC, validate any model
response, or supply a cluster-adjusted test. The source-to-design premise
must be established separately from session and exposure records.
-/

namespace HsHVerification.OrsonPairedDiscordanceDependence

/-- Two pair-direction indicators coupled by one shared session state. -/
def coupledDirections (ω : Fin 2) : Fin 2 × Fin 2 := (ω, ω)

/-- Product sample space for two independent pair-direction indicators. -/
def independentDirections (ω : Fin 2 × Fin 2) : Fin 2 × Fin 2 := ω

/-- Number of harmful directions in the first coordinate of the coupled space. -/
def coupledFirstHarmfulCount : ℕ :=
  (Finset.univ.filter (fun ω : Fin 2 =>
    (coupledDirections ω).1.val = 1)).card

/-- Number of harmful directions in the second coordinate of the coupled space. -/
def coupledSecondHarmfulCount : ℕ :=
  (Finset.univ.filter (fun ω : Fin 2 =>
    (coupledDirections ω).2.val = 1)).card

/-- Number of coupled outcomes with exactly one harmful direction. -/
def coupledExactlyOneHarmfulCount : ℕ :=
  (Finset.univ.filter (fun ω : Fin 2 =>
    (coupledDirections ω).1.val + (coupledDirections ω).2.val = 1)).card

/-- Number of harmful directions in the first coordinate of the product space. -/
def independentFirstHarmfulCount : ℕ :=
  (Finset.univ.filter (fun ω : Fin 2 × Fin 2 =>
    (independentDirections ω).1.val = 1)).card

/-- Number of harmful directions in the second coordinate of the product space. -/
def independentSecondHarmfulCount : ℕ :=
  (Finset.univ.filter (fun ω : Fin 2 × Fin 2 =>
    (independentDirections ω).2.val = 1)).card

/-- Number of product outcomes with exactly one harmful direction. -/
def independentExactlyOneHarmfulCount : ℕ :=
  (Finset.univ.filter (fun ω : Fin 2 × Fin 2 =>
    (independentDirections ω).1.val +
      (independentDirections ω).2.val = 1)).card

theorem coupled_first_harmful_count :
    coupledFirstHarmfulCount = 1 := by
  decide

theorem coupled_second_harmful_count :
    coupledSecondHarmfulCount = 1 := by
  decide

theorem coupled_exactly_one_harmful_count :
    coupledExactlyOneHarmfulCount = 0 := by
  decide

theorem independent_first_harmful_count :
    independentFirstHarmfulCount = 2 := by
  decide

theorem independent_second_harmful_count :
    independentSecondHarmfulCount = 2 := by
  decide

theorem independent_exactly_one_harmful_count :
    independentExactlyOneHarmfulCount = 2 := by
  decide

/-- Both constructions give each pair-direction indicator a 1/2 marginal,
but the exactly-one count has mass 0 in the coupled space and 1/2 in the
independent product space. Marginal symmetry alone therefore does not
identify the Binomial(2, 1/2) count distribution. -/
theorem equal_marginals_do_not_determine_binomial_count :
    (coupledFirstHarmfulCount : ℚ) / 2 =
        (independentFirstHarmfulCount : ℚ) / 4 ∧
    (coupledSecondHarmfulCount : ℚ) / 2 =
        (independentSecondHarmfulCount : ℚ) / 4 ∧
    (coupledExactlyOneHarmfulCount : ℚ) / 2 ≠
        (independentExactlyOneHarmfulCount : ℚ) / 4 := by
  constructor
  · rw [coupled_first_harmful_count, independent_first_harmful_count]
    norm_num
  · constructor
    · rw [coupled_second_harmful_count, independent_second_harmful_count]
      norm_num
    · rw [coupled_exactly_one_harmful_count,
        independent_exactly_one_harmful_count]
      norm_num

/- The evaluated finite counts expose the dependence directly:
   coupled = (1, 1, 0), independent = (2, 2, 2). -/
#eval (coupledFirstHarmfulCount, coupledSecondHarmfulCount,
  coupledExactlyOneHarmfulCount, independentFirstHarmfulCount,
  independentSecondHarmfulCount, independentExactlyOneHarmfulCount)

#print axioms equal_marginals_do_not_determine_binomial_count

end HsHVerification.OrsonPairedDiscordanceDependence
