import Mathlib

/-!
Source-conditional provenance check, 2026-10-27 :48 Review-MIND.
Nine actual HsH NotebookLM export files (all exporter_version 0.2.2)
were JSON parsed; each recorded message.role was "user".
Observed message counts by source, in documented ledger order:
176, 88, 74, 6, 26, 100, 42, 4, 16.
This module proves only properties of the encoded counts and a
constant-role projection, NOT the actual human/model authorship of any turn.
No physical data or H(s)H claim.
-/

namespace HsHVerification.LoomNotebookLMRoleCollapse

def observedMessageCounts : List Nat := [176, 88, 74, 6, 26, 100, 42, 4, 16]

theorem source_count_is_nine : observedMessageCounts.length = 9 := by decide

theorem observed_message_count_is_532 : observedMessageCounts.sum = 532 := by decide

inductive Origin where
  | human
  | model
  deriving DecidableEq

def exportedRole (_ : Origin) : String := "user"

theorem distinct_origins_same_exported_role :
    exportedRole .human = exportedRole .model := rfl

theorem constant_role_projection_not_injective :
    ¬ Function.Injective exportedRole := by
  intro h
  have impossible : Origin.human = Origin.model := h rfl
  cases impossible

#print axioms source_count_is_nine
#print axioms observed_message_count_is_532
#print axioms distinct_origins_same_exported_role
#print axioms constant_role_projection_not_injective

end HsHVerification.LoomNotebookLMRoleCollapse
