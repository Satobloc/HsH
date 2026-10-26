import Mathlib

/-!
# Aster: year-role erasure in provenance metadata

Source-grounded problem (not a historical-date theorem):
* Satobloc/SAT_THEORY_ARCHIVE_2023-25, 2026/DEEP_DIVE_INTERIORITY.txt
  Git blob 55c6d4ad32fb16a79bd0f69e9758eaf96a31b58c,
  excerpt at lines 237-238 includes the fictional name "Miss Poughkeepsie 1954".
* FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/INDEX_ROUGH.txt
  blob ad6e8f8ea59cc1c2b381e0b1a4aa1f825c6d1eb8, line 34
  labels it "Finished Flash, 2011".
* FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/TIMELINE_ROUGH.txt
  blob dd967490e3e57d8278f6f3c4a1981a247e4cecdb, line 83
  labels it "Finished Flash, 2004".
* Loom's 2026-10-26T20:12Z source audit, HsH issue #625, reports three
  derivative CSV entries that assign Date_BestGuess=1954.

These formal proofs concern *information loss when metadata roles are erased*.
They do not prove when the work was written, published, or discussed, nor
validate the role assigned to any particular source token.
-/

namespace HsHVerification.AsterYearRoleProvenance

inductive YearRole where
  | titleToken
  | composition
  | publication
  | narrativeTime
  | contextualEra
  deriving DecidableEq, Repr

structure DatedClaim where
  value : Nat
  role : YearRole
  deriving DecidableEq, Repr

/-- The lossy field used when a numeric year is stored without its role. -/
def eraseYearRole (c : DatedClaim) : Nat := c.value

/-- Same numeric year does not make a title token and a composition claim
    the same *typed* claim. -/
theorem title_and_composition_are_distinct (year : Nat) :
    (⟨year, YearRole.titleToken⟩ : DatedClaim) ≠
    (⟨year, YearRole.composition⟩ : DatedClaim) := by
  intro h
  have hrole : YearRole.titleToken = YearRole.composition :=
    congrArg DatedClaim.role h
  cases hrole

/-- Dropping the role is not injective, even when the numeric year is held
    fixed. This is an information-theoretic/typing statement, not an
    inference about any source's actual composition date. -/
theorem erase_year_role_not_injective (year : Nat) :
    ¬ Function.Injective eraseYearRole := by
  intro h
  have heq : (⟨year, YearRole.titleToken⟩ : DatedClaim) =
      (⟨year, YearRole.composition⟩ : DatedClaim) := h rfl
  exact title_and_composition_are_distinct year heq

/-- No decoder seeing only the numeric year can correctly reconstruct the
    role of *every* possible typed claim. -/
theorem no_universal_role_decoder (year : Nat) :
    ¬ ∃ decode : Nat → YearRole, ∀ c : DatedClaim,
        decode (eraseYearRole c) = c.role := by
  rintro ⟨decode, hdecode⟩
  have ht : decode year = YearRole.titleToken :=
    hdecode ⟨year, YearRole.titleToken⟩
  have hc : decode year = YearRole.composition :=
    hdecode ⟨year, YearRole.composition⟩
  have hbad : YearRole.titleToken = YearRole.composition :=
    ht.symm.trans hc
  cases hbad

end HsHVerification.AsterYearRoleProvenance
