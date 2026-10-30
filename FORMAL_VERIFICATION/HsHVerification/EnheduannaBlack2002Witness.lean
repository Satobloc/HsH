import Mathlib

/-!
# Black 2002 original note: directly printed witness evidence

Source: Jeremy A. Black, "En-hedu-ana not the composer of The temple hymns",
N.A.B.U. 2002/1, note 4, printed pp. 2-4 (PDF pages 2-4),
https://sepoa.fr/wp/wp-content/uploads/2012/05/2002-1.pdf
The author prints excerpts for edition sigla A/B/O/Q. His manuscript O
has damaged line 22 and NO preserved count. Manuscript A has a distinct
colophon in column vi after the line-count rubric. Black groups A/O/Q
in an editorial majority argument, which is not a direct reading of O's
missing count. These are SOURCE-REPORTED documentary propositions,
not original clay collations or proof of ancient authorship.
-/

namespace HsHVerification.EnheduannaBlack2002Witness

inductive Witness where
  | A | B | O | Q
  deriving DecidableEq, BEq, Repr

inductive Token where
  | attribution | hymnCountRubric | damagedTail | separateColophon
  deriving DecidableEq, BEq, Repr

/-- Bounded final-hymn excerpts as printed by Black (2002), p. 4.
    Absence from a bounded excerpt does not prove absence on a tablet. -/
def reportedTail : Witness → List Token
  | .A => [.attribution, .hymnCountRubric, .separateColophon]
  | .B => [.hymnCountRubric, .attribution]
  | .O => [.attribution, .damagedTail]
  | .Q => [.attribution, .hymnCountRubric]

/-- Directly legible order relative to the preserved hymn-count rubric.
    none for O is missingness, not a reconstructed after/before. -/
def directBeforeCount : Witness → Option Bool
  | .A => some true
  | .B => some false
  | .O => none
  | .Q => some true

theorem A_printed_sequence :
    reportedTail .A = [.attribution, .hymnCountRubric, .separateColophon] := by decide

theorem B_printed_sequence :
    reportedTail .B = [.hymnCountRubric, .attribution] := by decide

theorem O_printed_sequence_and_missing_rubric :
    reportedTail .O = [.attribution, .damagedTail] ∧
    Token.hymnCountRubric ∉ reportedTail .O := by
  constructor
  · rfl
  · simp [reportedTail]

theorem Q_printed_sequence :
    reportedTail .Q = [.attribution, .hymnCountRubric] := by decide

theorem A_distinct_colophon_follows_rubric_in_report :
    reportedTail .A = [.attribution, .hymnCountRubric, .separateColophon] := by decide

theorem O_has_no_directly_readable_rubric_position :
    directBeforeCount .O = none := by decide

#print axioms A_printed_sequence
#print axioms B_printed_sequence
#print axioms O_printed_sequence_and_missing_rubric
#print axioms Q_printed_sequence
#print axioms A_distinct_colophon_follows_rubric_in_report
#print axioms O_has_no_directly_readable_rubric_position

end HsHVerification.EnheduannaBlack2002Witness
