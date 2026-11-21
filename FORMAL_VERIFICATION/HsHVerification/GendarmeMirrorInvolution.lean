import Mathlib

/-!
# Gendarme left/right display mirror: conditional formalization

Primary Nathan Direct sources in the raw conversation
`Meridian [HsH] Michelstein-on-Meinorly`:
- message `71ae32d1-1de0-45a0-83d6-11a58d7a7c31`
  (2026-09-04T16:38:16.684Z): ordinary/anti graticulae are precise mirror
  images; left/right flipped is all that changes.
- message `e380f83e-ba07-4889-8394-e898a95d448b`
  (2026-09-04T15:50:24.133Z): the two graticulae do not cancel.
- raw export blob: `1f841895a2585843373fe33d55a0180c91cc8423`.

The coordinate formula below is an **assistant reconstruction**, not a
verbatim Nathan equation. It assumes the first coordinate is the display
left/right coordinate, the second is the other cross-section coordinate,
and the third is the vector-angle coordinate. Only the first coordinate is
reflected. No physical parity, winding reversal, inner/outer exchange,
global-to-local projection, or field-negation law is encoded.

The theorems establish only the conditional mathematics of this chosen
passive display map. They do not establish that the map exhausts the intended
geometry or that a physical graticule is represented by this field.
-/

namespace HsHVerification.GendarmeMirrorInvolution

/-- Conditional display-only reflection: flip left/right, preserve the
    other cross-section coordinate and the vector-angle coordinate. -/
def mirrorLR (p : ℝ × ℝ × ℝ) : ℝ × ℝ × ℝ :=
  (-p.1, p.2.1, p.2.2)

@[simp] theorem mirrorLR_involutive (p : ℝ × ℝ × ℝ) :
    mirrorLR (mirrorLR p) = p := by
  rcases p with ⟨u, v, propagationAngle⟩
  simp [mirrorLR]

/-- Passive pullback/reindexing of a field under the display reflection. -/
def pullback {Value : Type*}
    (ordinary : ℝ × ℝ × ℝ → Value) :
    ℝ × ℝ × ℝ → Value :=
  fun p => ordinary (mirrorLR p)

/-- Reflecting the pulled-back field a second time recovers the original
    field. This is not pointwise negation or physical parity. -/
@[simp] theorem pullback_twice_eq_original {Value : Type*}
    (ordinary : ℝ × ℝ × ℝ → Value) (p : ℝ × ℝ × ℝ) :
    pullback (pullback ordinary) p = ordinary p := by
  simp [pullback]

/-- A display mirror alone does not force a field to become its negative:
    the constant scalar field is a counterexample. -/
theorem mirror_pullback_does_not_force_negation :
    ∃ ordinary : ℝ × ℝ × ℝ → ℝ, ∃ p : ℝ × ℝ × ℝ,
      pullback ordinary p ≠ -ordinary p := by
  refine ⟨fun _ => (1 : ℝ), (0, 0, 0), ?_⟩
  norm_num [pullback]

/-- For the constant-one field, the ordinary and mirrored values add to 2,
    so mirror symmetry alone does not imply cancellation. -/
theorem mirrored_constant_pair_sum (p : ℝ × ℝ × ℝ) :
    pullback (fun _ : ℝ × ℝ × ℝ => (1 : ℝ)) p
      + (fun _ : ℝ × ℝ × ℝ => (1 : ℝ)) p = 2 := by
  norm_num [pullback]

#print axioms mirrorLR_involutive
#print axioms pullback_twice_eq_original
#print axioms mirror_pullback_does_not_force_negation
#print axioms mirrored_constant_pair_sum

end HsHVerification.GendarmeMirrorInvolution
