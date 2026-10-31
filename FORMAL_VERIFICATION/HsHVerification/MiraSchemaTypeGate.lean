import Mathlib

/-!
Mira source-identity QA, 2026-10-27. The source of this *software* question
is HSH_RESOURCES/WORKSPACES/MIRA/intake_preflight_review.py, Git blob
596384f3d7bd74a17e8dfeac4ca262ce2c0f2dc4.
Python's `True == 1` and `1.0 == 1` allow non-integer JSON schema versions
through the current `schema_version != 1` check. This file encodes only
that narrow equality distinction; it is NOT a model of PDF authorization,
source authenticity, or full Python evaluation. No physical model.
-/

namespace HsHVerification.MiraSchemaTypeGate

inductive JsonSchemaScalar where
  | boolean (b : Bool)
  | integer (n : Int)
  | floatingOne
deriving DecidableEq

/-- Model only the source-observed equality-to-1 behavior. -/
def pythonEqualsOne : JsonSchemaScalar → Bool
  | .boolean true => true
  | .boolean false => false
  | .integer n => decide (n = 1)
  | .floatingOne => true

/-- Proposed schema-version type contract: an integer, exactly 1. -/
def strictlyVersionOne : JsonSchemaScalar → Bool
  | .integer n => decide (n = 1)
  | _ => false

theorem boolean_true_is_accepted_by_python_equality :
    pythonEqualsOne (.boolean true) = true := by
  decide

theorem floating_one_is_accepted_by_python_equality :
    pythonEqualsOne .floatingOne = true := by
  decide

theorem strict_gate_rejects_boolean_true :
    strictlyVersionOne (.boolean true) = false := by
  decide

theorem strict_gate_rejects_floating_one :
    strictlyVersionOne .floatingOne = false := by
  decide

theorem integer_one_is_accepted_by_both :
    pythonEqualsOne (.integer 1) = true ∧
    strictlyVersionOne (.integer 1) = true := by
  decide

/-- Counterexample: Python's equality predicate is not a type-strict gate. -/
theorem equality_is_not_type_strict :
    ¬ ∀ x : JsonSchemaScalar, pythonEqualsOne x = strictlyVersionOne x := by
  intro h
  have hx := h (.boolean true)
  simp [pythonEqualsOne, strictlyVersionOne] at hx

end HsHVerification.MiraSchemaTypeGate
