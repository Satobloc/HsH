import Mathlib

/-!
# Enheduanna Temple Hymns: O's physical layout does not determine attribution scope

SOURCE-REPORTED LAYOUT:
- Jeremy A. Black, "En-hedu-ana not the composer of The temple hymns,"
  N.A.B.U. 2002 no. 1 (March), note 4, printed pp. 2-4, especially p. 4, prints
  manuscript O, reverse column ii', lines 16-22. The local sequence is
  Nisaba praise, the Enheduana attribution, then damaged terminal lines.
  The hymn-count rubric is not preserved in O.
- Sophus Helle, The First Authors (2020), Appendix 3.1, PDF pp. 326-328,
  states that Q has a ruling above and below the attribution while the
  other manuscripts (including O) do not. Helle also says O's missing
  line-count prevents establishing its position relative to that count.
- Sarah Glaz (2020), Figure 2 caption, identifies Tablet O as N 4179,
  Plate XXXI, copied by E. Bergmann S.J. CDLI catalogues N 4179 as
  P279044; the CDLI record itself does not supply the edition siglum O.
- ETCSL's Temple Hymns bibliography lists N 4179 (Plate 31) and identifies
  the 1969 edition as TCS III. Black's p. 2 citation says TCS I; that is
  a probable miscitation, not a different edition.

This file encodes the source-reported documentary layout. It does not
claim a fresh clay collation or a direct inspection of the 1969 volume.
The two semantic scopes below (final hymn only / whole collection) are
competing interpretations discussed by Helle. The theorem shows that
the reported physical layout fields alone do not select between them.
It does not assert equal historical probability or decide authorship.
-/

namespace HsHVerification.EnheduannaOLayoutScopeSeparation

inductive LocalToken where
  | nisabaPraise
  | attribution
  | damagedTail
  deriving DecidableEq, Repr

inductive CountPlacement where
  | beforeCount
  | afterCount
  | unresolved
  deriving DecidableEq, Repr

inductive RulingReport where
  | aboveAndBelow
  | noneReported
  deriving DecidableEq, Repr

inductive AttributionScope where
  | finalHymnOnly
  | wholeCollection
  deriving DecidableEq, Repr

structure OLayoutEvidence where
  localSequence : List LocalToken
  countPlacement : CountPlacement
  lineCount : Option Nat
  ruling : RulingReport
  deriving DecidableEq, Repr

/-- Black's printed O excerpt, read with Helle's ruling/missingness report. -/
def reportedOLayout : OLayoutEvidence :=
  { localSequence := [.nisabaPraise, .attribution, .damagedTail]
    countPlacement := .unresolved
    lineCount := none
    ruling := .noneReported }

theorem O_local_sequence :
    reportedOLayout.localSequence =
      [.nisabaPraise, .attribution, .damagedTail] := by
  rfl

theorem O_count_is_missing :
    reportedOLayout.countPlacement = .unresolved ∧
    reportedOLayout.lineCount = none := by
  rfl

theorem O_has_no_ruling_reported :
    reportedOLayout.ruling = .noneReported := by
  rfl

/-- Helle reports Q's attribution as bracketed by rulings, unlike O. -/
def reportedQRuling : RulingReport := .aboveAndBelow

theorem Q_ruling_differs_from_O :
    reportedQRuling ≠ reportedOLayout.ruling := by
  decide

structure Interpretation where
  layout : OLayoutEvidence
  scope : AttributionScope
  deriving DecidableEq, Repr

/-- Same reported O layout, with the two semantic scopes Helle discusses. -/
def O_as_final_hymn_only : Interpretation :=
  ⟨reportedOLayout, .finalHymnOnly⟩

def O_as_whole_collection : Interpretation :=
  ⟨reportedOLayout, .wholeCollection⟩

theorem same_layout_allows_two_scope_readings :
    O_as_final_hymn_only.layout = O_as_whole_collection.layout ∧
    O_as_final_hymn_only.scope ≠ O_as_whole_collection.scope := by
  decide

/-- No total decoder from these layout fields alone can be correct for both
    source-discussed interpretations. Additional semantic/philological
    evidence is required to choose scope. -/
theorem no_scope_decoder_from_layout :
    ¬ ∃ f : OLayoutEvidence → AttributionScope,
      ∀ i : Interpretation,
        i.layout = reportedOLayout → f i.layout = i.scope := by
  intro h
  rcases h with ⟨f, hf⟩
  have h1 := hf O_as_final_hymn_only rfl
  have h2 := hf O_as_whole_collection rfl
  have impossible :
      AttributionScope.finalHymnOnly =
        AttributionScope.wholeCollection :=
    h1.symm.trans h2
  cases impossible

#print axioms O_local_sequence
#print axioms O_count_is_missing
#print axioms O_has_no_ruling_reported
#print axioms Q_ruling_differs_from_O
#print axioms same_layout_allows_two_scope_readings
#print axioms no_scope_decoder_from_layout

end HsHVerification.EnheduannaOLayoutScopeSeparation
