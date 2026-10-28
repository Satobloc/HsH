# Enheduanna :36 | source-family count gate | 2026-10-28 23:36 UTC

**Status:** public-safe source-critical architecture and source-conditional Lean formalization. This is current-assistant reconstruction, not an authenticated historical Enheduanna instance, not empirical source-independence measurement, not ancient-authorship proof, and not SAT/H(s)H physical evidence.

## Source basis and non-duplication

The prior Enheduanna result already established that the 1969 *Texts from Cuneiform Sources* volume 3 contains separately credited Temple Hymns and Kes Temple Hymn components. This turn does not repeat that finding. It isolates a different counting error using the same bounded records:

- CiNii Books BA58073739: https://ci.nii.ac.jp/ncid/BA58073739?l=en
- CDLI publication 86653: https://cdli.earth/publications/86653
- CDLI publication 1686572: https://cdli.earth/publications/1686572
- Open Library OL4541738M: https://openlibrary.org/books/OL4541738M/

These give four catalogue/component records, maintained across three catalogue systems, all pointing—under the encoded source premise—to one 1969 bound volume. Catalogue-maintainer diversity and underlying-source-object diversity are distinct axes. This does **not** assert statistical independence or completeness of any catalogue.

Mersearch-first was respected: the shared `MERSEARCH_REQUEST.json` slot remained occupied by the Indicatrix inventory and was not overwritten. Retrieval used already verified direct locators and repository records.

## Formal proposition

Types: `Record` (four bounded records), `Catalogue` (CiNii, CDLI, Open Library), and `UnderlyingVolume` (the 1969 TCS 3 bound volume). The projections are `catalogueOf : Record → Catalogue` and `volumeOf : Record → UnderlyingVolume`.

Exact Lean 4 / Mathlib module:

```lean
import Mathlib

namespace HsHVerification.EnheduannaSourceFamilyCount

inductive Record where
  | ciniiTCS3 | cdliTempleHymns | cdliKesTempleHymn | openLibraryTCS3
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

theorem raw_count_not_source_object_count :
    records.length ≠ distinctUnderlyingVolumes.length := by decide

theorem cdli_components_share_projections :
    catalogueOf .cdliTempleHymns = catalogueOf .cdliKesTempleHymn ∧
    volumeOf .cdliTempleHymns = volumeOf .cdliKesTempleHymn := by decide

theorem different_catalogues_same_volume :
    catalogueOf .ciniiTCS3 ≠ catalogueOf .openLibraryTCS3 ∧
    volumeOf .ciniiTCS3 = volumeOf .openLibraryTCS3 := by decide

end HsHVerification.EnheduannaSourceFamilyCount
```

## Executed repository result

Existing draft PR #890 was reused; no new PR or tool was built.

- Module: `FORMAL_VERIFICATION/HsHVerification/EnheduannaSourceFamilyCount.lean`
- Module commit: `884af57afc7cd4a9b0f702442228582bad77d094`
- Root import commit / exact CI head: `d13cd2ac42ef8c95f262b01ed39cc2cb51e66a02`
- Root import blob: `3eec2e52098e623e0f32bdb99aaeec56a74211f3`
- Lean workflow run: `40788333759` (pending at submission; no success claimed yet).

## Architecture consequence and falsifier

A source report must disclose the projection used for its count. A raw count of records is not an independent-source count unless the equivalence/family relation is defined and audited. Independent failure is straightforward: produce a record encoded as TCS 3 whose inspected physical source object is not the 1969 bound volume, or show that one of the four records does not point to that object. Either result requires revising `volumeOf`; Lean cannot decide the bibliography.

No physical calculation was performed. No BEDROCK promotion, scheduler change, duplicate submission, or cross-thread delivery claim is made.
