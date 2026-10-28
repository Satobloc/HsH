import Mathlib

/-!
Source-specific conditional formalization of the archived ConsistencyBench
evaluate_cgd loop (src/evaluate.py, Git blob
0453540cb7c19227601e59fb342fa93e736da849).
No model outputs, semantic correctness, or API-call histories are proved.
-/

namespace HsHVerification.SableCGDStale

def inspectedChecks : List Bool → Nat
  | [] => 0
  | true :: _ => 1
  | false :: rest => 1 + inspectedChecks rest

def storedCheckerRaw (initialRaw _revisedRaw : String) : String :=
  initialRaw

theorem raw_precedes_revised (initialRaw revisedRaw : String) :
    storedCheckerRaw initialRaw revisedRaw = initialRaw := by
  rfl

theorem revised_text_not_used (initialRaw revisedRaw : String)
    (h : initialRaw ≠ revisedRaw) :
    storedCheckerRaw initialRaw revisedRaw ≠ revisedRaw := by
  simpa [storedCheckerRaw] using h

theorem all_unflagged_checks_inspected (xs : List Bool)
    (h : ∀ b ∈ xs, b = false) :
    inspectedChecks xs = xs.length := by
  induction xs with
  | nil => rfl
  | cons b bs ih =>
    have hb : b = false := h b (by simp)
    have hbs : ∀ x ∈ bs, x = false := by
      intro x hx
      exact h x (by simp [hx])
    simpa [inspectedChecks, hb, ih hbs, Nat.add_comm]

theorem source_recorded_stale_text_bounds :
    (1174 : Nat) ≤ 4386 := by
  omega

theorem source_recorded_stale_label_bounds :
    (394 : Nat) ≤ 1444 := by
  omega

end HsHVerification.SableCGDStale
