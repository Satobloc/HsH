import Mathlib

/-!
# Aster: observed ConsistencyBench negation template/source projection

Source-conditional formalization of a published benchmark generator, not a
physical model, independent semantic adjudication, or a claim of human/LLM
cognition. Original src/generate_benchmark.py Git blob
8011bc432f5b5b2f3b728620213d473993cdeb1f.
Original sample/full JSON Git blobs
10eb2da27c84c706d8e9e2325afca864fcae6a0d and
3171d2899fd1eb4292794df5952514666b0e2f43.
Counts were independently replayed from these actual archived files.
-/

namespace HsHVerification.AsterNegationTemplate

structure GenerationSeed where
  premise : String
  person : String
  deriving DecidableEq, Repr

-- The source generator's first three negation questions use only stmt;
-- the fourth uses person and a randomly chosen activity.
-- The function template stands for the three source-defined strings.
def firstThree (template : Fin 3 → String → String)
    (seed : GenerationSeed) (slot : Fin 3) : String :=
  template slot seed.premise

theorem same_premise_same_first_three
    (template : Fin 3 → String → String) (a b : GenerationSeed)
    (h : a.premise = b.premise) (slot : Fin 3) :
    firstThree template a slot = firstThree template b slot := by
  simp [firstThree, h]

-- Both witness sets actually occur in the published 300-set sample:
-- CB-92210 (Sam) and CB-53694 (Iris), each with the same first question.
def witnessSam : GenerationSeed :=
  ⟨"Gravity pulls objects toward the center of the Earth", "Sam"⟩
def witnessIris : GenerationSeed :=
  ⟨"Gravity pulls objects toward the center of the Earth", "Iris"⟩

theorem source_witnesses_are_distinct : witnessSam ≠ witnessIris := by
  decide

theorem source_witnesses_share_all_three_templates
    (template : Fin 3 → String → String) (slot : Fin 3) :
    firstThree template witnessSam slot =
    firstThree template witnessIris slot := by
  rfl

theorem premise_projection_is_not_injective :
    ¬ Function.Injective GenerationSeed.premise := by
  intro hinj
  have heq : witnessSam = witnessIris := hinj rfl
  exact source_witnesses_are_distinct heq

-- Arithmetic consequences of the *measured corpus counts*, NOT a proof
-- that the parser counted correctly or that question labels are sound.
theorem sample_first_three_excess :
    (3 * 50 - 3 * 19 : Nat) = 93 := by
  norm_num

theorem full_first_three_excess :
    (3 * 85 - 3 * 20 : Nat) = 195 := by
  norm_num

#print axioms same_premise_same_first_three
#print axioms premise_projection_is_not_injective
#print axioms sample_first_three_excess
#print axioms full_first_three_excess

end HsHVerification.AsterNegationTemplate
