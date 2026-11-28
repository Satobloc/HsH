import Mathlib

/-!
# Timesheet quotient and selected complement

For a core subspace L contained in a timesheet subspace U, the quotient
U / L is the choice-independent object. An ambient complement W to L
selects a representative subspace U ∩ W inside U, but the identification
depends on W and its complement witness.

This is pointwise linear algebra only. It does not assert that a physical
core is contained in a timesheet, construct a smooth vector bundle, choose
a physical metric, or establish a worldsheet readout.
-/

namespace HsHVerification.TimesheetQuotientComplement

open Submodule
open Module

variable {K V : Type*}
variable [Field K] [AddCommGroup V] [Module K V]

/-- The core, regarded as a submodule of the timesheet tangent U. -/
def corePart (L U : Submodule K V) : Submodule K U :=
  L.comap U.subtype

/-- The representative of a chosen ambient complement W inside U. -/
def chosenSector (U W : Submodule K V) : Submodule K U :=
  W.comap U.subtype

/-- If L is contained in U and W complements L in V, then L and U ∩ W
are complementary submodules of U.

This is the precise internal direct-sum statement behind the
timesheet-contained-core construction. -/
theorem containedCoreSectorIsCompl
    (L U W : Submodule K V)
    (hLU : L ≤ U)
    (hLW : IsCompl L W) :
    IsCompl (corePart L U) (chosenSector U W) := by
  constructor
  · rw [disjoint_iff_inf_le]
    intro x hx
    change (x : V) ∈ L ∧ (x : V) ∈ W at hx
    have hxbot : (x : V) ∈ (⊥ : Submodule K V) :=
      hLW.disjoint.le_bot ⟨hx.1, hx.2⟩
    have hxzero : (x : V) = 0 := by simpa using hxbot
    exact Subtype.ext hxzero
  · rw [codisjoint_iff_le_sup]
    intro x _
    rw [mem_sup']
    have hxLW : (x : V) ∈ L ⊔ W := by
      rw [hLW.sup_eq_top]
      simp
    rcases (mem_sup'.mp hxLW) with ⟨l, w, hsum⟩
    have hwU : (w : V) ∈ U := by
      have hxMinusL : (x : V) - (l : V) ∈ U :=
        U.sub_mem x.property (hLU l.property)
      simpa [← hsum] using hxMinusL
    let lU : corePart L U :=
      ⟨⟨l, hLU l.property⟩, l.property⟩
    let wU : chosenSector U W :=
      ⟨⟨w, hwU⟩, w.property⟩
    refine ⟨lU, wU, ?_⟩
    exact Subtype.ext hsum

/-- A chosen complement identifies the canonical quotient U/L with a
selected representative subspace inside U. The quotient depends only on
the core inclusion; this equivalence depends on the chosen complement W
and its complement witness. -/
noncomputable def quotientEquivChosenSector
    (L U W : Submodule K V)
    (hLU : L ≤ U)
    (hLW : IsCompl L W) :
    (U ⧸ corePart L U) ≃ₗ[K] chosenSector U W :=
  (corePart L U).quotientEquivOfIsCompl (chosenSector U W)
    (containedCoreSectorIsCompl L U W hLU hLW)

/-- The quotient identification returns the chosen representative when
applied to a class represented in the selected complement. -/
theorem quotientEquivChosenSector_apply_mk
    (L U W : Submodule K V)
    (hLU : L ≤ U)
    (hLW : IsCompl L W)
    (x : chosenSector U W) :
    quotientEquivChosenSector L U W hLU hLW (Quotient.mk (x : U)) = x := by
  simpa [quotientEquivChosenSector] using
    (Submodule.quotientEquivOfIsCompl_apply_mk_right
      (containedCoreSectorIsCompl L U W hLU hLW) x)

/-- Under the one-dimensional-core / three-dimensional-timesheet
assumptions, the quotient U/L is two-dimensional without choosing an
ambient complement. -/
theorem quotientFinrankTwo
    [FiniteDimensional K V]
    (L U : Submodule K V)
    (hLU : L ≤ U)
    (hL : finrank K L = 1)
    (hU : finrank K U = 3) :
    finrank K (U ⧸ corePart L U) = 2 := by
  letI : FiniteDimensional K U :=
    Submodule.finiteDimensional_of_le (le_top : U ≤ ⊤)
  have hcore : finrank K (corePart L U) = 1 := by
    change finrank K (L.comap U.subtype) = 1
    rw [LinearEquiv.finrank_eq (Submodule.comapSubtypeEquivOfLe hLU)]
    exact hL
  have hsum :=
    Submodule.finrank_quotient_add_finrank (corePart L U)
  omega

/-- Any selected complement representative has the same two-dimensional
rank as the canonical quotient. The representative depends on W; the
quotient rank does not. -/
theorem chosenSectorFinrankTwo
    [FiniteDimensional K V]
    (L U W : Submodule K V)
    (hLU : L ≤ U)
    (hLW : IsCompl L W)
    (hL : finrank K L = 1)
    (hU : finrank K U = 3) :
    finrank K (chosenSector U W) = 2 := by
  letI : FiniteDimensional K U :=
    Submodule.finiteDimensional_of_le (le_top : U ≤ ⊤)
  calc
    finrank K (chosenSector U W) =
        finrank K (U ⧸ corePart L U) :=
      (quotientEquivChosenSector L U W hLU hLW).finrank_eq.symm
    _ = 2 := quotientFinrankTwo L U hLU hL hU

#print axioms containedCoreSectorIsCompl
#print axioms quotientEquivChosenSector_apply_mk
#print axioms quotientFinrankTwo
#print axioms chosenSectorFinrankTwo

end HsHVerification.TimesheetQuotientComplement
