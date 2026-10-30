import Mathlib

/-!
# Enheduanna source-family count gate

This source-CONDITIONAL model separates three different counts for the
bounded TCS 3 bibliography checked on 2026-10-28:

* four catalogue/component records,
* three catalogue maintainers,
* one underlying 1969 bound volume.

The records are:
* CiNii Books BA58073739;
* CDLI publication 86653 (Temple Hymns component);
* CDLI publication 1686572 (Kes Temple Hymn component);
* Open Library OL4541738M.

Lean checks only the finite encoding and its projections. It does not prove
that the catalogues are correct, statistically independent, or exhaustive,
and it says nothing about ancient authorship or SAT/H(s)H physics.
-/

namespace HsHVerification.EnheduannaSourceFamilyCount

inductive Record where
  | ciniiTCS3
  | cdliTempleHymns
  | cdliKesTempleHymn
  | openLibraryTCS3
  deriving DecidableEq, Repr

inductive Catalogue where
  | cinii | cdli | openLibrary
  deriving DecidableEq, Repr

inductive UnderlyingVolume where
  | tcs3_1969
  deriving DecidableEq, Repr

def records : List Record :=
  [.ciniiTCS3, .cdliTempleHymns, .cdliKesTempleHymn, .openLibraryTCS3]

def catalogueOf : Record → Catalogue
  | .ciniiTCS3 => .cinii
  | .cdliTempleHymns => .cdli
  | .cdliKesTempleHymn => .cdli
  | .openLibraryTCS3 => .openLibrary

def volumeOf : Record → UnderlyingVolume
  | _ => .tcs3_1969

def distinctCatalogues : List Catalogue :=
  (records.map catalogueOf).eraseDups

def distinctUnderlyingVolumes : List UnderlyingVolume :=
  (records.map volumeOf).eraseDups

theorem four_records : records.length = 4 := by decide

theorem three_catalogues : distinctCatalogues.length = 3 := by decide

theorem one_underlying_volume : distinctUnderlyingVolumes.length = 1 := by decide

/-- Raw record count is not the number of underlying publication objects. -/
theorem raw_count_not_source_object_count :
    records.length ≠ distinctUnderlyingVolumes.length := by decide

/-- The two CDLI component records share both catalogue and bound volume. -/
theorem cdli_components_share_projections :
    catalogueOf .cdliTempleHymns = catalogueOf .cdliKesTempleHymn ∧
    volumeOf .cdliTempleHymns = volumeOf .cdliKesTempleHymn := by decide

/-- Different catalogue maintainers can still point to the same source object. -/
theorem different_catalogues_same_volume :
    catalogueOf .ciniiTCS3 ≠ catalogueOf .openLibraryTCS3 ∧
    volumeOf .ciniiTCS3 = volumeOf .openLibraryTCS3 := by decide

#print axioms four_records
#print axioms three_catalogues
#print axioms one_underlying_volume
#print axioms raw_count_not_source_object_count
#print axioms cdli_components_share_projections
#print axioms different_catalogues_same_volume

end HsHVerification.EnheduannaSourceFamilyCount
