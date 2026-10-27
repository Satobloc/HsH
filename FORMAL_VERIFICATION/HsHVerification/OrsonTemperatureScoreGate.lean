import HsHVerification.OrsonTemperatureLogicGate
import Mathlib

/-!
Orson Vay P1: finite scoring sensitivity for actual archived
ConsistencyBench temperature-contrapositive Q2 outputs.
The published key is YES. The logically defensible answer to
"can we conclude t < 10?" is NO; explicit INDETERMINATE is also
accepted as a negative response for this question, conditional on
a source-faithful semantic adjudication. This is a declared
alternative scoring policy, not the original evaluator.
-/

namespace HsHVerification.OrsonTemperatureScoreGate

inductive Response where
  | yes
  | no
  | indeterminate
  | unclear
  deriving DecidableEq, Repr

def publishedPass (otherCorrect : Bool) (answer : Response) : Bool :=
  otherCorrect && decide (answer = .yes)

def semanticPass (otherCorrect : Bool) (answer : Response) : Bool :=
  otherCorrect && decide (answer = .no ∨ answer = .indeterminate)

/-- The two set-pass policies cannot both pass one response. -/
theorem no_joint_pass (otherCorrect : Bool) (answer : Response) :
    ¬ (publishedPass otherCorrect answer = true ∧
       semanticPass otherCorrect answer = true) := by
  cases otherCorrect <;> cases answer <;> decide

/-- If other questions fail, changing Q2 cannot rescue the set. -/
theorem other_failure_blocks_both (answer : Response) :
    publishedPass false answer = false ∧
    semanticPass false answer = false := by
  cases answer <;> decide

/-- A direct NO can change from published failure to semantic pass. -/
theorem no_reversal :
    publishedPass true .no = false ∧
    semanticPass true .no = true := by
  decide

/-- An explicitly indeterminate response has the same gate behavior. -/
theorem indeterminate_reversal :
    publishedPass true .indeterminate = false ∧
    semanticPass true .indeterminate = true := by
  decide

/-- An unclear response is not silently promoted. -/
theorem unclear_stays_failed :
    publishedPass true .unclear = false ∧
    semanticPass true .unclear = false := by
  decide

#print axioms no_joint_pass
#print axioms other_failure_blocks_both
#print axioms no_reversal
#print axioms indeterminate_reversal
#print axioms unclear_stays_failed

end HsHVerification.OrsonTemperatureScoreGate
