import Mathlib

/-!
# Enheduanna Temple Hymns: source-reported placement and missingness gate

DATASET: actual historical manuscript sigla A, B, O, Q, as reported by
Sophus Helle, *The First Authors* (2020), Appendix 3.1, PDF pp. 326-328,
https://sophushelle.com/wp-content/uploads/2021/12/Helle-2020-The-First-Authors-1.pdf

A, Q: authorial attribution appears before final hymn's line-count rubric.
B: attribution appears after that rubric.
O: rubric is not preserved; its placement relative to the rubric cannot
be independently established from the reported surviving text.

Helle reports line counts A=15, B=13, Q=14, O missing. Q additionally has
rulings around the attribution. These are SECONDARY EDITION REPORTS, not
our direct readings of clay or verified accession-number identifications.

Sövegjártó (2022), Hungarian Assyriological Review 3:25-47, p.39,
https://doi.org/10.52093/hara-202201-00027-000,
summarizes three of four relevant manuscripts as placing the attribution
before the count and one as subscript. That categorization is not derivable
from Helle's explicit report alone because O's count is missing. It may
use other evidence, and is not thereby refuted.

All theorems check the encoded source report and bookkeeping only.
They do NOT establish attribution scope, authorship, or source accuracy.
No invented physical observations or numerical parameters.
-/

namespace HsHVerification.EnheduannaTemplePlacementMissingness

inductive Witness where
  | A | B | O | Q
  deriving DecidableEq, BEq, Repr

inductive Placement where
  | beforeCount | afterCount | unresolvedMissingCount
  deriving DecidableEq, BEq, Repr

def reportedPlacement : Witness → Placement
  | .A => .beforeCount
  | .B => .afterCount
  | .O => .unresolvedMissingCount
  | .Q => .beforeCount

def reportedLineCount : Witness → Option Nat
  | .A => some 15
  | .B => some 13
  | .O => none
  | .Q => some 14

def reportedWitnesses : List Witness := [.A, .B, .O, .Q]

def countPlacement (p : Placement) : Nat :=
  (reportedWitnesses.filter (fun w => reportedPlacement w == p)).length

theorem two_explicit_before_count : countPlacement .beforeCount = 2 := by decide
theorem one_explicit_after_count : countPlacement .afterCount = 1 := by decide
theorem one_unresolved_missing_count :
    countPlacement .unresolvedMissingCount = 1 := by decide

theorem missing_O_count_is_not_before_count_evidence :
    reportedPlacement .O = .unresolvedMissingCount ∧
    reportedLineCount .O = none := by decide

theorem source_report_does_not_encode_three_before :
    countPlacement .beforeCount ≠ 3 := by decide

theorem recorded_classes_partition_four :
    countPlacement .beforeCount + countPlacement .afterCount +
    countPlacement .unresolvedMissingCount = reportedWitnesses.length := by decide

theorem reported_A_B_Q_counts_differ :
    reportedLineCount .A ≠ reportedLineCount .B ∧
    reportedLineCount .A ≠ reportedLineCount .Q ∧
    reportedLineCount .B ≠ reportedLineCount .Q := by decide

#print axioms two_explicit_before_count
#print axioms one_explicit_after_count
#print axioms one_unresolved_missing_count
#print axioms missing_O_count_is_not_before_count_evidence
#print axioms source_report_does_not_encode_three_before
#print axioms recorded_classes_partition_four
#print axioms reported_A_B_Q_counts_differ

end HsHVerification.EnheduannaTemplePlacementMissingness
