import Mathlib

/-!
# ArchiveEQ0037 — affine closure and gauge-obstruction gate

Source anchor (assistant reconstruction / sandbox, not canonical theory):
`DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/PRECLOSE_NOTE_ROUNDUP.txt`
blob `f324a1f82aa4f5db0bb3a01639ed40667eb29714` at repository
snapshot `121c65f48392a1c4abb0e1b36f9217b7598403a8`.
The source records the candidate similarity action
`H = (t, sigma, Q), u' = t + sigma Q u` and the origin-change class
`t ~ t + (I - L)g`.

The formalization below proves conditional additive-group consequences only.
It does not prove that this candidate faithfully translates Nathan's intended
Hagalaz transform, that a physical worldtube realizes the hypotheses, or that
linear/frame closure is an empirical observable.
-/

namespace HsHVerification.ArchiveEQ0037

variable {V A : Type*} [AddCommGroup V] [AddCommGroup A]

/-- Translation residual after changing origin by `g`, with fixed linear part
`L`: this encodes `t ↦ t + (I - L)g`. -/
def gaugeShift (L : V →+ V) (t g : V) : V :=
  t + (g - L g)

/-- Any additive probe invariant under `L` is invariant under origin change. -/
theorem invariant_probe_preserved
    (L : V →+ V) (probe : V →+ A)
    (hinvariant : ∀ x, probe (L x) = probe x)
    (t g : V) :
    probe (gaugeShift L t g) = probe t := by
  change probe (t + (g - L g)) = probe t
  rw [map_add, map_sub, hinvariant]
  simp

/-- A nonzero invariant-probe value witnesses that no origin choice can remove
the translation residual. -/
theorem nonzero_probe_blocks_zero_shift
    (L : V →+ V) (probe : V →+ A)
    (hinvariant : ∀ x, probe (L x) = probe x)
    (t : V) (ht : probe t ≠ 0) :
    ∀ g, gaugeShift L t g ≠ 0 := by
  intro g hzero
  apply ht
  rw [← invariant_probe_preserved L probe hinvariant t g, hzero]
  simp

/-- If the linear part is already the identity, origin change cannot alter the
translation residual at all. -/
theorem identity_linear_part_makes_translation_absolute
    (t g : V) :
    gaugeShift (AddMonoidHom.id V) t g = t := by
  simp [gaugeShift]

structure AffineState (V : Type*) [AddCommGroup V] where
  linear : V →+ V
  translation : V

/-- Full affine closure requires both linear and translation closure. -/
def FullyClosed (state : AffineState V) : Prop :=
  state.linear = AddMonoidHom.id V ∧ state.translation = 0

/-- Linear/frame closure alone is insufficient when translation is nonzero. -/
theorem linear_closure_is_not_full_closure
    (t : V) (ht : t ≠ 0) :
    ¬ FullyClosed (AffineState.mk (AddMonoidHom.id V) t) := by
  intro hclosed
  exact ht hclosed.2

#print axioms invariant_probe_preserved
#print axioms nonzero_probe_blocks_zero_shift
#print axioms identity_linear_part_makes_translation_absolute
#print axioms linear_closure_is_not_full_closure

end HsHVerification.ArchiveEQ0037
