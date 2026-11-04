import Mathlib

/-!
# Meridian source-fidelity: zero-set versus gradient-channel representation

This module formalizes conditional algebra and map recoverability only.
Original archived Python source:
SAT_THEORY_ARCHIVE_2023-25/SOFTWARE/equation_true_curve_surface_projection_polar.py
Git blob 52107ba00737e5098f8557595096cc251b075300.
It extracts F=0 contours, computes |grad F|, normalizes channels, then
maps selected channels to sphere/torus traces. The source does NOT claim
that the entire symbolic equation is recovered from every trace.

A source equation and its cube have the same exact real zero set, but
the cubic representative's gradient is zero at every point on that set.
Thus the gradient channel is not invariant under the equivalence
relation "defines the same zero set" without extra representation rules.

No physical data, predictions, or new empirical claims.
-/

namespace HsHVerification.MeridianContourRepresentation

/-- A scalar function value and its cube have the same zero locus. -/
theorem cubic_zero_locus (z : ℝ) : z ^ 3 = 0 ↔ z = 0 := by
  simp

/-- For the formal chain-rule expression for the cube, the derivative
channel vanishes on the original zero set, irrespective of dF. -/
theorem cubic_gradient_vanishes_on_zero (z dz : ℝ) (hz : z = 0) :
    3 * z ^ 2 * dz = 0 := by
  simp [hz]

/-- An exact decoder that recovers every input forces its encoder to
be injective. This does not require a canonical encoder. -/
theorem exact_decoder_requires_injectivity {A B : Type*}
    (encode : A → B) (decode : B → A)
    (hrec : ∀ x, decode (encode x) = x) :
    Function.Injective encode := by
  intro a b hab
  calc
    a = decode (encode a) := (hrec a).symm
    _ = decode (encode b) := by rw [hab]
    _ = b := hrec b

/-- A collision of distinct inputs forbids any exact global decoder.
This is a conditional criterion, not proof that a particular Whirligig
composite actually collides. -/
theorem collision_blocks_exact_decoder {A B : Type*}
    (encode : A → B) (a b : A)
    (hne : a ≠ b) (hcollide : encode a = encode b) :
    ¬ ∃ decode : B → A, ∀ x, decode (encode x) = x := by
  rintro ⟨decode, hrec⟩
  apply hne
  calc
    a = decode (encode a) := (hrec a).symm
    _ = decode (encode b) := by rw [hcollide]
    _ = b := hrec b

#print axioms cubic_zero_locus
#print axioms cubic_gradient_vanishes_on_zero
#print axioms exact_decoder_requires_injectivity
#print axioms collision_blocks_exact_decoder

end HsHVerification.MeridianContourRepresentation
