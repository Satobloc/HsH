import Mathlib
import HsHVerification.TimesheetQuotientComplement

/-!
# Timesheet quotient readout and splitting identifiability

The canonical quotient U/L forgets the directions in L. A linear readout
on U is a well-defined readout of that quotient exactly when it vanishes
on the collapsed directions. In that case every linear section of the
quotient map gives the same induced readout.

This is a pointwise linear-algebra result. It does not assert physical
timesheet/core containment, choose a metric or splitting, construct a
smooth bundle, or define an empirical observable.
-/

namespace HsHVerification.TimesheetReadoutFactorization

variable {K U Y : Type*}
variable [Field K] [AddCommGroup U] [Module K U]
variable [AddCommGroup Y] [Module K Y]

/-- A linear readout on U factors through U/L iff it annihilates L. -/
theorem readout_factors_through_quotient_iff
    (L : Submodule K U) (F : U →ₗ[K] Y) :
    (∃ G : (U ⧸ L) →ₗ[K] Y, G.comp L.mkQ = F) ↔
      L ≤ LinearMap.ker F := by
  constructor
  · rintro ⟨G, hG⟩ x hx
    change F x = 0
    rw [← hG, LinearMap.comp_apply]
    have hq : L.mkQ x = 0 := by
      apply (Submodule.Quotient.eq L).2
      simpa using hx
    simp [hq]
  · intro h
    refine ⟨L.liftQ F h, ?_⟩
    ext x
    simp

/-- If a readout factors through U/L, all linear sections of the quotient
map induce the same readout. The chosen complement cannot change an
observable that is genuinely a function of the quotient alone. -/
theorem quotient_readout_split_independent
    (L : Submodule K U) (F : U →ₗ[K] Y)
    (G : (U ⧸ L) →ₗ[K] Y)
    (hF : G.comp L.mkQ = F)
    (s₁ s₂ : (U ⧸ L) →ₗ[K] U)
    (h₁ : L.mkQ.comp s₁ = LinearMap.id)
    (h₂ : L.mkQ.comp s₂ = LinearMap.id) :
    F.comp s₁ = F.comp s₂ := by
  ext q
  have h₁q : L.mkQ (s₁ q) = q := by
    have h := congrArg (fun f : (U ⧸ L) →ₗ[K] (U ⧸ L) => f q) h₁
    simpa using h
  have h₂q : L.mkQ (s₂ q) = q := by
    have h := congrArg (fun f : (U ⧸ L) →ₗ[K] (U ⧸ L) => f q) h₂
    simpa using h
  have hF₁ : G (L.mkQ (s₁ q)) = F (s₁ q) := by
    have h := congrArg (fun f : U →ₗ[K] Y => f (s₁ q)) hF
    simpa using h
  have hF₂ : G (L.mkQ (s₂ q)) = F (s₂ q) := by
    have h := congrArg (fun f : U →ₗ[K] Y => f (s₂ q)) hF
    simpa using h
  calc
    F (s₁ q) = G (L.mkQ (s₁ q)) := hF₁.symm
    _ = G q := by rw [h₁q]
    _ = G (L.mkQ (s₂ q)) := by rw [h₂q]
    _ = F (s₂ q) := hF₂

#print axioms readout_factors_through_quotient_iff
#print axioms quotient_readout_split_independent

end HsHVerification.TimesheetReadoutFactorization
