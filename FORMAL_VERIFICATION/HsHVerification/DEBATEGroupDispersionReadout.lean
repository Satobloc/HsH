import Mathlib

/-!
# DEBATE group-dispersion readout: a finite non-injectivity witness

Source: Chuang et al., *DEBATE: A Large-Scale Benchmark for Evaluating Opinion
Dynamics in Role-Playing LLM Agents*, arXiv:2510.25110v7 (2026-10-19),
Section 3.1 and equation (4):
https://arxiv.org/html/2510.25110v7

The source describes four-person groups and a group-level change in stance
standard deviation, ΔSD = SD(final) - SD(initial).

This module proves a deliberately constructed finite counterexample to
recovering identity-resolved trajectories from ΔSD alone. Two distinct
participant-labelled four-person profiles have the same population SD.
Starting from profileA, both "no change" (A -> A) and a complete reversal
(A -> B) therefore have ΔSD = 0, although every participant's assigned value
changes in the reversal.

This is a mathematical property of the scalar group readout, not a claim that
this trajectory occurred in the human dataset. The paper also reports
individual-update and transition-distribution metrics; this theorem does not
invalidate those complementary measurements or the benchmark as a whole.
The proof formalizes a finite witness, not the paper's complete data pipeline.
-/

namespace HsHVerification

/-- The mean stance of a four-member group. -/
def debateMean4 (x : Fin 4 → ℚ) : ℚ :=
  (∑ i : Fin 4, x i) / 4

/-- Population variance (ddof = 0) of a four-member group. -/
def debateVariance4 (x : Fin 4 → ℚ) : ℚ :=
  (∑ i : Fin 4, (x i - debateMean4 x) ^ 2) / 4

/-- Population standard deviation, cast to the real numbers. -/
noncomputable def debatePopulationSD4 (x : Fin 4 → ℚ) : ℝ :=
  Real.sqrt (debateVariance4 x)

/-- The source-style change in group dispersion between two endpoints. -/
noncomputable def debateDeltaSD4
    (initial final : Fin 4 → ℚ) : ℝ :=
  debatePopulationSD4 final - debatePopulationSD4 initial

/-- Four distinct ordered stances on the six-point scale. -/
def debateProfileA (i : Fin 4) : ℚ :=
  (i.val : ℚ) + 1

/-- The same four stance values assigned in reverse participant order. -/
def debateProfileB (i : Fin 4) : ℚ :=
  4 - (i.val : ℚ)

theorem debateMean_profileA :
    debateMean4 debateProfileA = (5 / 2 : ℚ) := by
  norm_num [debateMean4, debateProfileA]

theorem debateMean_profileB :
    debateMean4 debateProfileB = (5 / 2 : ℚ) := by
  norm_num [debateMean4, debateProfileB]

theorem debateVariance_profileA :
    debateVariance4 debateProfileA = (5 / 4 : ℚ) := by
  norm_num [debateVariance4, debateMean4, debateProfileA]

theorem debateVariance_profileB :
    debateVariance4 debateProfileB = (5 / 4 : ℚ) := by
  norm_num [debateVariance4, debateMean4, debateProfileB]

theorem debateProfileA0_ne_profileB0 :
    debateProfileA 0 ≠ debateProfileB 0 := by
  norm_num [debateProfileA, debateProfileB]

theorem debateProfiles_distinct :
    debateProfileA ≠ debateProfileB := by
  intro h
  have h0 := congrFun h 0
  exact debateProfileA0_ne_profileB0 h0

theorem debatePopulationSD_profiles_equal :
    debatePopulationSD4 debateProfileA =
      debatePopulationSD4 debateProfileB := by
  simp [debatePopulationSD4, debateVariance_profileA, debateVariance_profileB]

/--
The same initial group has zero ΔSD whether it remains unchanged or its
participant-labelled stance vector is completely reversed.
-/
theorem debateDeltaSD_no_change_eq_reversal :
    debateDeltaSD4 debateProfileA debateProfileA =
      debateDeltaSD4 debateProfileA debateProfileB := by
  simp [debateDeltaSD4, debatePopulationSD_profiles_equal]

/--
The ΔSD readout is not injective on participant-labelled four-person
trajectories: distinct final profiles can yield the same group-level change.
-/
theorem debateDeltaSD_noninjective :
    ∃ x y : Fin 4 → ℚ,
      x ≠ y ∧
      debateDeltaSD4 debateProfileA x =
        debateDeltaSD4 debateProfileA y := by
  exact ⟨debateProfileA, debateProfileB, debateProfiles_distinct,
    debateDeltaSD_no_change_eq_reversal⟩

/-- Executable exact-arithmetic checks for the finite witness. -/
#eval debateMean4 debateProfileA
#eval debateMean4 debateProfileB
#eval debateVariance4 debateProfileA
#eval debateVariance4 debateProfileB
#eval debateVariance4 debateProfileB - debateVariance4 debateProfileA

#print axioms debateDeltaSD_noninjective

end HsHVerification
