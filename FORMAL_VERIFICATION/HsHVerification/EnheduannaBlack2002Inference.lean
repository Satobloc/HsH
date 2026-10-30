import HsHVerification.EnheduannaBlack2002Witness

/-!
# Black 2002: editorial grouping is not direct count preservation

Black (N.A.B.U. 2002/1, note 4, pp. 2-4) identifies A/O/Q as a
majority for the composite's line ordering, while acknowledging O's
hymn-count rubric is not preserved. This source-conditional model keeps
that EDITORIAL grouping separate from the three directly attested
rubric positions (A/Q before, B after). It does not refute Black's
interpretation or Sovegjarto 2022's 3/1 categorization.
-/

namespace HsHVerification.EnheduannaBlack2002Inference
open HsHVerification.EnheduannaBlack2002Witness

def reportedWitnesses : List Witness := [.A, .B, .O, .Q]

/-- Black's editorial line-order grouping, NOT four observed count positions. -/
def editorialMajority : List Witness := [.A, .O, .Q]

def directlyBefore : Nat :=
  (reportedWitnesses.filter (fun w => directBeforeCount w == some true)).length

def directlyAfter : Nat :=
  (reportedWitnesses.filter (fun w => directBeforeCount w == some false)).length

def missingCountOrder : Nat :=
  (reportedWitnesses.filter (fun w => directBeforeCount w == none)).length

theorem direct_positions_two_one_one :
    directlyBefore = 2 ∧ directlyAfter = 1 ∧ missingCountOrder = 1 := by decide

theorem editorial_majority_contains_O :
    Witness.O ∈ editorialMajority := by
  simp [editorialMajority]

theorem editorial_majority_has_three_members :
    editorialMajority.length = 3 := by decide

theorem editorial_majority_includes_unresolved_rubric :
    Witness.O ∈ editorialMajority ∧ directBeforeCount .O = none := by
  simp [editorialMajority, directBeforeCount]

theorem editorial_majority_not_three_directly_attested_before :
    directlyBefore ≠ editorialMajority.length := by decide

theorem editorial_majority_is_not_all_directly_before :
    (editorialMajority.all (fun w => directBeforeCount w == some true)) = false := by decide

#print axioms direct_positions_two_one_one
#print axioms editorial_majority_contains_O
#print axioms editorial_majority_has_three_members
#print axioms editorial_majority_includes_unresolved_rubric
#print axioms editorial_majority_not_three_directly_attested_before
#print axioms editorial_majority_is_not_all_directly_before

end HsHVerification.EnheduannaBlack2002Inference
