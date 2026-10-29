import Mathlib

/-!
# ETCSL Temple Hymns bibliography: conditional source-line inventory

Source: Oxford ETCSL, `b4801.htm`, section Cuneiform sources, HTML lines
22--69, as directly read 2026-10-29. This is a real catalogue inventory.
Each of the 48 *rows* is a bibliographic source entry, not necessarily a
separate tablet, ancient witness, or independent attestation.

Literal source markers were transcribed by the accompanying Python audit:
* ` = ` catalogue aliases: 57, 67, 68, 69;
* ` + ` or `(+)` linked descriptions: 24, 36, 60;
* `??` qualifier: 60;
* `***` qualifier: 37, 42, 60.

These formal statements only check the source-row encoding and marker
relationships. They do not establish the transcription's accuracy,
physical joins, tablet identity, original ancient authorship, or completeness.
-/

namespace HsHVerification.EnheduannaETCSLWitnessInventory

/-- HTML line numbers in the inspected Oxford ETCSL witness list. -/
def sourceLines : List Nat := (List.range 48).map (· + 22)
def aliasLines : List Nat := [57, 67, 68, 69]
def linkedLines : List Nat := [24, 36, 60]
def questionLines : List Nat := [60]
def tripleAsteriskLines : List Nat := [37, 42, 60]

/-- Forty-eight bibliographic entries are listed in this bounded source section. -/
theorem listed_entry_count : sourceLines.length = 48 := by decide

/-- The inspected source line indices themselves are distinct. -/
theorem line_numbers_distinct : sourceLines.Nodup := by decide

theorem four_alias_marked_rows : aliasLines.length = 4 := by decide
theorem three_linked_rows : linkedLines.length = 3 := by decide
theorem one_question_marked_row : questionLines.length = 1 := by decide
theorem three_triple_asterisk_rows : tripleAsteriskLines.length = 3 := by decide

/-- All explicitly marked rows are inside the source inventory range. -/
theorem aliases_in_inventory : aliasLines.all (fun n => decide (n ∈ sourceLines)) = true := by decide
theorem links_in_inventory : linkedLines.all (fun n => decide (n ∈ sourceLines)) = true := by decide

/-- Source row 60 has BOTH an editorial link marker and a question mark. -/
theorem qualified_link_overlap :
    questionLines.all (fun n => decide (n ∈ linkedLines)) = true := by decide

/-- The two kinds of source marker occur on distinct rows in this inventory. -/
theorem alias_link_markers_disjoint :
    aliasLines.all (fun n => decide (n ∉ linkedLines)) = true := by decide

/-- Counts by the leading printed source-label family, not by artifact origin. -/
theorem leading_label_families_sum :
    14 + 12 + 8 + 1 + 6 + 4 + 1 + 2 = 48 := by norm_num

/-- A source-row-to-tablet identification needs injectivity as an extra
hypothesis. If two distinct rows designate the same tablet, it is not injective.
No claim is made that any such pair exists in the historical source. -/
theorem noninjective_if_two_rows_share_tablet
    {Tablet : Type*} (tabletOf : Nat → Tablet)
    {r s : Nat} (hne : r ≠ s) (heq : tabletOf r = tabletOf s) :
    ¬ Function.Injective tabletOf := by
  intro h
  exact hne (h heq)

#print axioms listed_entry_count
#print axioms line_numbers_distinct
#print axioms four_alias_marked_rows
#print axioms three_linked_rows
#print axioms one_question_marked_row
#print axioms three_triple_asterisk_rows
#print axioms aliases_in_inventory
#print axioms links_in_inventory
#print axioms qualified_link_overlap
#print axioms alias_link_markers_disjoint
#print axioms leading_label_families_sum
#print axioms noninjective_if_two_rows_share_tablet

end HsHVerification.EnheduannaETCSLWitnessInventory
