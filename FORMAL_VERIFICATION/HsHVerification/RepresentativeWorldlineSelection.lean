import Mathlib

/-!
# Representative-worldline shift and angular-momentum compensation

This module formalizes one algebraic part of the standard extended-body
representative-worldline construction. A shift of the reference curve is
paired with a compensating change in the spin bivector so that total angular
momentum is unchanged.

The physical application uses the antisymmetrized orbital bivector
2 z^[mu P^nu]. Antisymmetry, the MPD equations, a spin supplementary condition,
the Moller-radius bound, and the validity of any H(s)H/GR map are not proved
here. They must be supplied by source-specific physics.
-/

namespace HsHVerification.RepresentativeWorldlineSelection

universe u v w

variable {R : Type u} [Ring R]
variable {V : Type v} [AddCommGroup V] [Module R V]
variable {B : Type w} [AddCommGroup B] [Module R B]

/-- A bilinear map representing the antisymmetrized orbital bivector
    2 z^[mu P^nu]. The algebraic theorem below needs bilinearity; the
    physical instantiation must additionally establish antisymmetry. -/
abbrev OrbitalBivectorMap := V →ₗ[R] V →ₗ[R] B

/-- Orbital angular momentum about a chosen representative point. -/
def orbitalAngularMomentum
    (orbitalBivector : OrbitalBivectorMap) (z p : V) : B :=
  orbitalBivector z p

/-- Total angular momentum: orbital contribution plus spin bivector. -/
def totalAngularMomentum
    (orbitalBivector : OrbitalBivectorMap)
    (z p : V) (spin : B) : B :=
  orbitalAngularMomentum orbitalBivector z p + spin

/-- Compensating spin change under a reference-point shift. -/
def shiftedSpin
    (orbitalBivector : OrbitalBivectorMap)
    (shift momentum : V) (spin : B) : B :=
  spin - orbitalAngularMomentum orbitalBivector shift momentum

/-- If the representative point shifts by a, and the spin bivector is
    shifted by the corresponding negative orbital bivector, total angular
    momentum is unchanged. This is an algebraic identity, not an MPD
    dynamics theorem or an empirical statement. -/
theorem totalAngularMomentum_invariant_under_representative_shift
    (orbitalBivector : OrbitalBivectorMap)
    (z shift momentum : V) (spin : B) :
    totalAngularMomentum orbitalBivector (z + shift) momentum
      (shiftedSpin orbitalBivector shift momentum spin)
      =
    totalAngularMomentum orbitalBivector z momentum spin := by
  simp [totalAngularMomentum, orbitalAngularMomentum, shiftedSpin,
    LinearMap.map_add, add_assoc, add_comm, add_left_comm]

#print axioms totalAngularMomentum_invariant_under_representative_shift

end HsHVerification.RepresentativeWorldlineSelection
