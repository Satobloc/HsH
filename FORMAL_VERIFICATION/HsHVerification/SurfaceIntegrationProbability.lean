import Mathlib

/-!
Review-MIND probability clarification for Toxtli and Delaflor (CSCW Companion 2026).

Let S mean that sufficient unique evidence has been surfaced to the decision context,
and C mean that the observed group decision is correct.

The paper's conceptual product P(S) * P(C | S) is the probability of a correct
decision *through the surfaced-evidence path*. It equals P(C) only when there is
zero probability of a correct decision without S. If correctness is the observed
outcome, a chance-success term may remain.

This module formalizes the finite-additive decomposition and a four-outcome
countermodel. It does not estimate any probability in the paper, establish that
the paper's empirical data contain a particular unobserved path, or model an
LLM's internal cognition. The countermodel is logical, not an empirical fixture.
-/

namespace HsHVerification.SurfaceIntegrationProbability

variable {Ω : Type*} [Fintype Ω] [DecidableEq Ω]

/-- A finite nonnegative weighting. It is a probability model when total mass is 1. -/
structure FiniteMassModel where
  weight : Ω → ℚ
  weight_nonneg : ∀ ω, 0 ≤ weight ω

/-- Mass assigned to an event represented as a finite set. -/
def mass (P : FiniteMassModel (Ω := Ω)) (A : Finset Ω) : ℚ :=
  ∑ ω ∈ A, P.weight ω

/-- Conditional mass, defined only for events with nonzero mass. -/
def condMass (P : FiniteMassModel (Ω := Ω)) (A B : Finset Ω) : ℚ :=
  mass P (A ∩ B) / mass P B

theorem mass_mul_condMass (P : FiniteMassModel (Ω := Ω))
    (A B : Finset Ω) (hB : mass P B ≠ 0) :
    mass P B * condMass P A B = mass P (A ∩ B) := by
  unfold condMass
  field_simp [hB]
  ring

/-- Partition the correct outcomes into those with and without sufficient evidence surfaced. -/
theorem mass_partition (P : FiniteMassModel (Ω := Ω))
    (C S : Finset Ω) :
    mass P C = mass P (C ∩ S) + mass P (C \ S) := by
  unfold mass
  have hUnion : C ∩ S ∪ C \ S = C := by
    ext ω
    simp
  have hDisjoint : Disjoint (C ∩ S) (C \ S) := by
    refine Finset.disjoint_left.mpr ?_
    intro ω hCS hCnotS
    exact hCnotS.2 hCS.2
  rw [← hUnion, Finset.sum_union hDisjoint]

/-- Law of total probability for correctness, split by whether sufficient evidence surfaced. -/
theorem total_probability (P : FiniteMassModel (Ω := Ω))
    (C S : Finset Ω)
    (hS : mass P S ≠ 0)
    (hNotS : mass P (Finset.univ \ S) ≠ 0) :
    mass P C =
      mass P S * condMass P C S +
      mass P (Finset.univ \ S) * condMass P C (Finset.univ \ S) := by
  have hPart := mass_partition P C S
  have h1 := mass_mul_condMass P C S hS
  have h2 := mass_mul_condMass P C (Finset.univ \ S) hNotS
  have hComp : C \ S = C ∩ (Finset.univ \ S) := by
    ext ω
    simp
  calc
    mass P C = mass P (C ∩ S) + mass P (C \ S) := hPart
    _ = mass P S * condMass P C S + mass P (C \ S) := by rw [← h1]
    _ = mass P S * condMass P C S +
        mass P (C ∩ (Finset.univ \ S)) := by rw [hComp]
    _ = mass P S * condMass P C S +
        mass P (Finset.univ \ S) * condMass P C (Finset.univ \ S) := by rw [← h2]

/-- The product-only expression equals observed correctness iff correct outcomes
    without sufficient evidence have zero mass. -/
theorem product_only_iff_no_correct_without_surface
    (P : FiniteMassModel (Ω := Ω)) (C S : Finset Ω)
    (hS : mass P S ≠ 0)
    (hNotS : mass P (Finset.univ \ S) ≠ 0) :
    mass P C = mass P S * condMass P C S ↔ mass P (C \ S) = 0 := by
  have hTotal := total_probability P C S hS hNotS
  have hTail :
      mass P (Finset.univ \ S) * condMass P C (Finset.univ \ S) =
        mass P (C \ S) := by
    have h2 := mass_mul_condMass P C (Finset.univ \ S) hNotS
    have hComp : C \ S = C ∩ (Finset.univ \ S) := by
      ext ω
      simp
    rw [hComp] at h2
    exact h2
  constructor
  · intro h
    rw [hTotal, hTail] at h
    linarith
  · intro h
    rw [hTotal, hTail, h]
    simp

/-- Uniform four-outcome model: S = {0,1}; C = {0,2}.
    Outcome 2 is correct without sufficient evidence having surfaced. -/
def uniformFour : FiniteMassModel (Ω := Fin 4) where
  weight := fun _ => (1 : ℚ) / 4
  weight_nonneg := by
    intro ω
    norm_num

def surfaced : Finset (Fin 4) := {0, 1}
def correctDecision : Finset (Fin 4) := {0, 2}

theorem uniformFour_total_mass :
    mass uniformFour Finset.univ = 1 := by
  norm_num [mass, uniformFour, Finset.sum_const]

theorem uniformFour_correct_mass :
    mass uniformFour correctDecision = 1 / 2 := by
  norm_num [mass, uniformFour, correctDecision]

theorem uniformFour_surfaced_mass :
    mass uniformFour surfaced = 1 / 2 := by
  norm_num [mass, uniformFour, surfaced]

theorem uniformFour_conditional_correct_given_surface :
    condMass uniformFour correctDecision surfaced = 1 / 2 := by
  norm_num [mass, condMass, uniformFour, correctDecision, surfaced]

theorem uniformFour_correct_without_surface_mass :
    mass uniformFour (correctDecision \ surfaced) = 1 / 4 := by
  norm_num [mass, uniformFour, correctDecision, surfaced]

theorem uniformFour_product_only_is_not_total_correctness :
    mass uniformFour correctDecision ≠
      mass uniformFour surfaced *
        condMass uniformFour correctDecision surfaced := by
  norm_num [mass, condMass, uniformFour, correctDecision, surfaced]

#eval mass uniformFour correctDecision
#eval mass uniformFour surfaced
#eval condMass uniformFour correctDecision surfaced
#eval mass uniformFour (Finset.univ \ surfaced)
#eval condMass uniformFour correctDecision (Finset.univ \ surfaced)
#eval mass uniformFour surfaced * condMass uniformFour correctDecision surfaced

end HsHVerification.SurfaceIntegrationProbability
