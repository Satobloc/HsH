import Mathlib

/-!
# Enheduanna: source-conditional missing-rubric completion and citation ancestry

OBSERVED HISTORICAL REPORT (not direct tablet collation):
Sophus Helle, The First Authors (2020), Appendix 3.1 pp.326-328:
A and Q before the final hymn count, B after, O count not preserved.
https://sophushelle.com/wp-content/uploads/2021/12/Helle-2020-The-First-Authors-1.pdf

Szilvia Sövegjarto, Originators in the Old Babylonian Sumerian Literary
Tradition (2022), p.39 n.61: three of four before, one as subscript;
the note explicitly cites Jeremy Black 2002, p.3.
https://harjournal.com/wp-content/uploads/harassets/har202201-00027.pdf

Helle also explicitly cites Black's 2002 analysis at this locus.
The two modern analyses have a common cited source, not two
independently inspected clay tablets in this formalization.

The parameter o is a LOGICAL COMPLETION of a missing documentary
field, NOT a newly observed reading, physical fixture or claim
about manuscript O. The theorem proves compatibility of the aggregate
3/1 statement with Helle's explicitly observed 2/1/unknown pattern.
It does NOT establish the actual reading of O, correctness of either
scholarly source, semantic authorship scope, or historical authorship.
-/

namespace HsHVerification.EnheduannaPlacementCompletion

inductive Witness where
  | A | B | O | Q
  deriving DecidableEq, Repr

inductive Side where
  | beforeCount | afterCount
  deriving DecidableEq, Repr

def observed : Witness → Option Side
  | .A => some .beforeCount
  | .B => some .afterCount
  | .O => none
  | .Q => some .beforeCount

def completion (o : Side) : Witness → Side
  | .A => .beforeCount
  | .B => .afterCount
  | .O => o
  | .Q => .beforeCount

def witnesses : List Witness := [.A, .B, .O, .Q]

def beforeTotal (o : Side) : Nat :=
  (witnesses.filter (fun w => completion o w == .beforeCount)).length

def afterTotal (o : Side) : Nat :=
  (witnesses.filter (fun w => completion o w == .afterCount)).length

theorem completion_respects_A_B_Q (o : Side) :
    completion o .A = .beforeCount ∧
    completion o .B = .afterCount ∧
    completion o .Q = .beforeCount := by
  cases o <;> decide

theorem O_unobserved : observed .O = none := by decide

theorem before_completion_three_one :
    beforeTotal .beforeCount = 3 ∧ afterTotal .beforeCount = 1 := by decide

theorem after_completion_two_two :
    beforeTotal .afterCount = 2 ∧ afterTotal .afterCount = 2 := by decide

theorem aggregate_not_identified :
    beforeTotal .beforeCount ≠ beforeTotal .afterCount := by decide

theorem observed_report_allows_both_aggregates (o : Side) :
    (beforeTotal o = 3 ∧ afterTotal o = 1) ∨
    (beforeTotal o = 2 ∧ afterTotal o = 2) := by
  cases o <;> decide

inductive ModernReport where
  | helle2020 | sovegjarto2022
  deriving DecidableEq, Repr

inductive PriorSource where
  | black2002
  deriving DecidableEq, Repr

def cites : ModernReport → PriorSource → Bool
  | .helle2020, .black2002 => true
  | .sovegjarto2022, .black2002 => true

theorem two_reports_share_cited_Black2002 :
    cites .helle2020 .black2002 = true ∧
    cites .sovegjarto2022 .black2002 = true := by decide

#print axioms completion_respects_A_B_Q
#print axioms O_unobserved
#print axioms before_completion_three_one
#print axioms after_completion_two_two
#print axioms aggregate_not_identified
#print axioms observed_report_allows_both_aggregates
#print axioms two_reports_share_cited_Black2002

end HsHVerification.EnheduannaPlacementCompletion
