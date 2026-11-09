import Mathlib

/-!
Tern Rook | 2026-11-09 | task-upkeep priority ordering, conditional formalization.

Source implementation:
* HsH `WORKSPACES/COMMON/task_upkeep_triage.py`, blob
  `49d2fdd8f36b6091a3b06e0a65ad6c5d4e69ed01`.
* HsH `WORKSPACES/COMMON/TASK_BRANCH_GRAPH.json`, blob
  `9e9f1b896fd5d4320a7b0142ddc3f8d9c524339c`.

The Python `triage_key` places `p_rank` in the first coordinate of a
lexicographic tuple. The remaining coordinates encode due-date bucket,
days-to-due, blocker status, unlock count, low-hanging status, value/effort,
review staleness, stale days, and title.

This module formalizes the intended first-coordinate ordering for the
canonical priority labels. It does NOT prove that Python's tuple comparator,
normalization, or source-to-Lean translation is implemented identically;
does not validate the task graph's metadata or the substantive assignment
of priority labels; and does not authorize automatic scheduling or mutation.

No physical data, physical model, or H(s)H theory claim is involved.
-/

namespace HsHVerification.TernTaskUpkeepPriority

def priorityRank (p : String) : Nat :=
  if p = "P0" then 0 else
  if p = "P1" then 1 else
  if p = "P2" then 2 else
  if p = "P3" then 3 else
  if p = "P4" then 4 else 5

structure PriorityKey where
  priority : String
  tail : Nat
deriving DecidableEq, Repr

def lexLess (a b : PriorityKey) : Prop :=
  priorityRank a.priority < priorityRank b.priority ∨
  (priorityRank a.priority = priorityRank b.priority ∧ a.tail < b.tail)

theorem p0_precedes_p1_for_any_tail (a b : Nat) :
    lexLess ⟨"P0", a⟩ ⟨"P1", b⟩ := by
  left
  decide

theorem p1_precedes_p2_for_any_tail (a b : Nat) :
    lexLess ⟨"P1", a⟩ ⟨"P2", b⟩ := by
  left
  decide

theorem p2_precedes_p3_for_any_tail (a b : Nat) :
    lexLess ⟨"P2", a⟩ ⟨"P3", b⟩ := by
  left
  decide

theorem p3_precedes_p4_for_any_tail (a b : Nat) :
    lexLess ⟨"P3", a⟩ ⟨"P4", b⟩ := by
  left
  decide

theorem p4_precedes_unclassified_for_any_tail (a b : Nat) :
    lexLess ⟨"P4", a⟩ ⟨"UNCLASSIFIED", b⟩ := by
  left
  decide

theorem equal_priority_uses_tail (p : String) (a b : Nat) (h : a < b) :
    lexLess ⟨p, a⟩ ⟨p, b⟩ := by
  exact Or.inr ⟨rfl, h⟩

#eval decide (lexLess ⟨"P0", 999999⟩ ⟨"P1", 0⟩)
#eval decide (lexLess ⟨"P1", 1⟩ ⟨"P1", 2⟩)
#eval decide (lexLess ⟨"P1", 2⟩ ⟨"P1", 1⟩)

#print axioms p0_precedes_p1_for_any_tail
#print axioms p1_precedes_p2_for_any_tail
#print axioms p2_precedes_p3_for_any_tail
#print axioms p3_precedes_p4_for_any_tail
#print axioms p4_precedes_unclassified_for_any_tail
#print axioms equal_priority_uses_tail

end HsHVerification.TernTaskUpkeepPriority
