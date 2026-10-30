import Mathlib

/-!
P1 review contribution | source-conditional formalization of the archived
ConsistencyBench pairwise-correctness predicate.

Source translation:
* a and b are Boolean flags for whether each normalized extracted answer
  matches its normalized expected answer.
* The archived evaluator's predicate is
    (a == b) || (a && b)
  (a direct Boolean abstraction of src/evaluate.py at blob
   0453540cb7c19227601e59fb342fa93e736da849).
* The paper's written PCR definition is a && b
  (final-paper/main.tex at blob
   dbd471235a310aa9821c95faf570432c21339592, line 105).

This module proves the Boolean identity and the finite-list count
decomposition. It does not prove that this source translation is sound,
that answer normalization is semantically valid, or that the archived
records are independent or representative. It is not a semantic/logical
consistency test.
-/

namespace HsHVerification.OrsonPairwisePCR

/-- The archived evaluator's pair predicate after reduction to correctness flags. -/
def evaluatorPCR (a b : Bool) : Bool :=
  (a == b) || (a && b)

/-- The paper's written definition: both answers in the pair are correct. -/
def writtenPCR (a b : Bool) : Bool :=
  a && b

/-- The pair contributes to the code metric but not the written metric. -/
def bothWrong (a b : Bool) : Bool :=
  (!a) && (!b)

/-- The evaluator predicate is exactly agreement of correctness status. -/
theorem evaluatorPCR_eq_sameCorrectnessStatus (a b : Bool) :
    evaluatorPCR a b = (a == b) := by
  cases a <;> cases b <;> rfl

/-- The evaluator predicate partitions into both-correct and both-wrong pairs. -/
theorem evaluatorPCR_eq_written_or_bothWrong (a b : Bool) :
    evaluatorPCR a b = (writtenPCR a b || bothWrong a b) := by
  cases a <;> cases b <;> rfl

/-- The two predicates differ exactly on pairs where both answers are wrong. -/
theorem evaluatorPCR_ne_writtenPCR_iff_bothWrong (a b : Bool) :
    evaluatorPCR a b ≠ writtenPCR a b ↔ bothWrong a b = true := by
  cases a <;> cases b <;> decide

/-- Count the pairs satisfying a Boolean predicate. -/
def countWhere (predicate : Bool × Bool → Bool)
    (pairs : List (Bool × Bool)) : Nat :=
  (pairs.filter predicate).length

def evaluatorPCRCount (pairs : List (Bool × Bool)) : Nat :=
  countWhere (fun pair => evaluatorPCR pair.1 pair.2) pairs

def writtenPCRCount (pairs : List (Bool × Bool)) : Nat :=
  countWhere (fun pair => writtenPCR pair.1 pair.2) pairs

def bothWrongCount (pairs : List (Bool × Bool)) : Nat :=
  countWhere (fun pair => bothWrong pair.1 pair.2) pairs

/-- For any finite list of pairwise correctness flags, the code count equals
    the written-definition count plus the both-wrong count. -/
theorem evaluatorPCRCount_decomposition (pairs : List (Bool × Bool)) :
    evaluatorPCRCount pairs =
      writtenPCRCount pairs + bothWrongCount pairs := by
  induction pairs with
  | nil =>
      rfl
  | cons pair rest ih =>
      rcases pair with ⟨a, b⟩
      cases a <;> cases b <;>
        simp [evaluatorPCRCount, writtenPCRCount, bothWrongCount,
          countWhere, evaluatorPCR, writtenPCR, bothWrong] at *
      <;> omega

#print axioms evaluatorPCR_eq_sameCorrectnessStatus
#print axioms evaluatorPCR_eq_written_or_bothWrong
#print axioms evaluatorPCR_ne_writtenPCR_iff_bothWrong
#print axioms evaluatorPCRCount_decomposition

end HsHVerification.OrsonPairwisePCR
