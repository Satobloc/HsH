import Mathlib

/-!
# Archive Equation 0053: curve-current to worldsheet-current bridge

Source-critical reconstruction.

Historical Module O8 contains a curve-supported vector current
`J_mu(x) = sum_gamma integral d lambda v_mu(lambda) delta^(4)(x-gamma(lambda))`.
A later Blockwave assistant response describes an antisymmetric conserved
worldsheet current `J^{mu nu}`.  Standard string geometry constructs the
surface density from two tangent directions.

This file proves only the linear-algebraic necessity and orientation behavior
of an alternating bilinear surface density.  It does not formalize
distributions, prove current conservation, validate the historical translation,
or establish SAT/H(s)H physics.
-/

namespace HsHVerification.ArchiveEQ0053

variable {R V B : Type*}
variable [CommRing R]
variable [AddCommGroup V] [Module R V]
variable [AddCommGroup B] [Module R B]

/-- Abstract alternating surface density: the algebraic core of
`partial_s X wedge partial_t X`. -/
def Alternating (area : V →ₗ[R] V →ₗ[R] B) : Prop :=
  ∀ v, area v v = 0

/-- Abstract antisymmetry, recording orientation reversal under tangent swap. -/
def Antisymmetric (area : V →ₗ[R] V →ₗ[R] B) : Prop :=
  ∀ v w, area v w = -area w v

/-- Reusing one tangent direction cannot produce nonzero oriented area. -/
theorem duplicate_tangent_zero
    (area : V →ₗ[R] V →ₗ[R] B)
    (hAlt : Alternating area) (v : V) :
    area v v = 0 :=
  hAlt v

/-- Any two scalar multiples of one tangent have zero alternating area. -/
theorem common_direction_zero
    (area : V →ₗ[R] V →ₗ[R] B)
    (hAlt : Alternating area) (a b : R) (v : V) :
    area (a • v) (b • v) = 0 := by
  simp [hAlt v]

/-- Therefore a nonzero surface density requires that the two tangents are not
both multiples of one common direction. -/
theorem nonzero_area_forces_two_direction_data
    (area : V →ₗ[R] V →ₗ[R] B)
    (hAlt : Alternating area) (v w : V)
    (hNonzero : area v w ≠ 0) :
    ¬ ∃ a : R, w = a • v := by
  rintro ⟨a, rfl⟩
  exact hNonzero (by simpa using common_direction_zero area hAlt (1 : R) a v)

/-- Swapping the two parameter directions reverses orientation. -/
theorem swap_reverses_orientation
    (area : V →ₗ[R] V →ₗ[R] B)
    (hAnti : Antisymmetric area) (v w : V) :
    area w v = -area v w := by
  have h := hAnti v w
  exact neg_eq_iff_eq_neg.mpr h.symm

/-- Reversing the first tangent reverses the oriented density. -/
theorem reverse_first_tangent
    (area : V →ₗ[R] V →ₗ[R] B) (v w : V) :
    area (-v) w = -area v w := by
  simp

/-- Reversing both tangents preserves the oriented density. -/
theorem reverse_both_tangents
    (area : V →ₗ[R] V →ₗ[R] B) (v w : V) :
    area (-v) (-w) = area v w := by
  simp

#print axioms duplicate_tangent_zero
#print axioms common_direction_zero
#print axioms nonzero_area_forces_two_direction_data
#print axioms swap_reverses_orientation
#print axioms reverse_first_tangent
#print axioms reverse_both_tangents

end HsHVerification.ArchiveEQ0053
