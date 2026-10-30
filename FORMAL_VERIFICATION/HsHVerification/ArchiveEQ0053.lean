import Mathlib

/-!
# Archive Equation 0053: curve-current to worldsheet-current bridge

Source-critical reconstruction.

Historical Module O8 contains a curve-supported vector current
`J_mu(x) = sum_gamma integral d lambda v_mu(lambda) delta^(4)(x-gamma(lambda))`.
A later Blockwave assistant response describes an antisymmetric conserved
worldsheet current `J^{mu nu}`. Standard string geometry constructs the
surface density from two tangent directions.

This file proves only the linear-algebraic necessity and orientation behavior
of an alternating bilinear surface density. It does not formalize
distributions, prove current conservation, validate the historical translation,
or establish SAT/H(s)H physics.
-/

namespace HsHVerification.ArchiveEQ0053

variable {R V B : Type*}
variable [CommRing R]
variable [AddCommGroup V] [Module R V]
variable [AddCommGroup B] [Module R B]

def Alternating (area : V →ₗ[R] V →ₗ[R] B) : Prop :=
  ∀ v, area v v = 0

def Antisymmetric (area : V →ₗ[R] V →ₗ[R] B) : Prop :=
  ∀ v w, area v w = -area w v

theorem duplicate_tangent_zero
    (area : V →ₗ[R] V →ₗ[R] B)
    (hAlt : Alternating area) (v : V) :
    area v v = 0 :=
  hAlt v

theorem common_direction_zero
    (area : V →ₗ[R] V →ₗ[R] B)
    (hAlt : Alternating area) (a b : R) (v : V) :
    area (a • v) (b • v) = 0 := by
  simp [hAlt v]

theorem nonzero_area_forces_two_direction_data
    (area : V →ₗ[R] V →ₗ[R] B)
    (hAlt : Alternating area) (v w : V)
    (hNonzero : area v w ≠ 0) :
    ¬ ∃ a : R, w = a • v := by
  rintro ⟨a, rfl⟩
  exact hNonzero (by simpa using common_direction_zero area hAlt (1 : R) a v)

theorem swap_reverses_orientation
    (area : V →ₗ[R] V →ₗ[R] B)
    (hAnti : Antisymmetric area) (v w : V) :
    area w v = -area v w :=
  hAnti w v

theorem reverse_first_tangent
    (area : V →ₗ[R] V →ₗ[R] B) (v w : V) :
    area (-v) w = -area v w := by
  simp

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
