import Mathlib

/-!
# TCS 3 bibliographic component-identity gate (1969)

This is a source-CONDITIONAL bibliographic projection, not a statement
about ancient composition or a proof that a catalogue is correct.

Original records consulted 2026-10-28:
* CiNii Books BA58073739: full title explicitly attributes
  "The collection of the Sumerian temple hymns" to A. W. Sjoberg
  and E. Bergmann, and "the Kes temple hymn" to Gene B. Gragg.
  https://ci.nii.ac.jp/ncid/BA58073739?l=en
* CDLI publication 86653: Sjoberg and Eugen Bergmann for Temple Hymns.
  https://cdli.earth/publications/86653
* CDLI publication 1686572: Gene Gragg for Kes Temple Hymn,
  pp. 155-188 of the same TCS 3 volume.
  https://cdli.earth/publications/1686572
* Open Library OL4541738M: flattened record displays Sjoberg
  and Gragg as authors of the volume under the Temple Hymns title.
  https://openlibrary.org/books/OL4541738M/
The Boolean model transcribes these bounded records. Lean verifies
only implications of this encoding, not catalogue truth.
-/

namespace HsHVerification.EnheduannaTCS3Bibliography

inductive Person where
  | sjoberg | bergmann | gragg
  deriving DecidableEq, Repr

inductive Component where
  | templeHymns | kesTempleHymn
  deriving DecidableEq, Repr

def credited : Component → Person → Bool
  | .templeHymns, .sjoberg => true
  | .templeHymns, .bergmann => true
  | .kesTempleHymn, .gragg => true
  | _, _ => false

/-- Flattening a shared bound volume takes the union of component credits. -/
def volumeCredit (p : Person) : Bool :=
  credited .templeHymns p || credited .kesTempleHymn p

theorem sjoberg_temple_credit :
    credited .templeHymns .sjoberg = true := by decide

theorem bergmann_temple_credit :
    credited .templeHymns .bergmann = true := by decide

theorem gragg_kes_credit :
    credited .kesTempleHymn .gragg = true := by decide

theorem gragg_not_temple_component_credit :
    credited .templeHymns .gragg = false := by decide

theorem volume_credit_not_component_credit :
    volumeCredit .gragg = true ∧
    credited .templeHymns .gragg = false := by decide

theorem volume_projection_not_component_faithful :
    ¬ (∀ p : Person, volumeCredit p = credited .templeHymns p) := by
  intro h
  have hg := h .gragg
  simp [volumeCredit, credited] at hg

#print axioms volume_credit_not_component_credit
#print axioms volume_projection_not_component_faithful

end HsHVerification.EnheduannaTCS3Bibliography
