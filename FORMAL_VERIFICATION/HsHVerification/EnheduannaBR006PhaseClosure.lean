import Mathlib

/-!
# BR-006 relative-phase closure gate

The BR-006 working record contains a scalar phase-increment relation
ΔB = ΔΦ / (2π). The h1051 source-fidelity audit distinguishes the
assistant-originated equation from the direct user propositions and the
user-directed local approval witness.

This module proves only the mathematical endpoint condition under which
ΔΦ / p is an integer: the two lifted phase endpoints represent the same
point of the additive circle AddCircle p. The 2π specialization is the
conditional winding-count gate.

It does not define a map from worldtube configurations to a relative-phase
circle, prove that a physical history closes, recover a full multi-strand braid
word, or establish any H(s)H physical premise. The multi-strand nonabelian
loss is treated separately in the existing braid-map audit and PR #1066.
-/

namespace HsHVerification.EnheduannaBR006PhaseClosure

/--
A phase increment divided by period p is an integer exactly when the
endpoints are equal in AddCircle p.
-/
theorem phase_delta_integer_iff_same_addCircle_point
    (p x y : ℝ) (hp : p ≠ 0) :
    (∃ n : ℤ, (x - y) / p = n) ↔ (x : AddCircle p) = y := by
  constructor
  · rintro ⟨n, hn⟩
    have hmul : (n : ℝ) * p = x - y := by
      exact ((div_eq_iff hp).mp hn).symm
    have hzero : ((x - y : ℝ) : AddCircle p) = 0 := by
      exact AddCircle.coe_eq_zero_iff.mpr
        ⟨n, by simpa [zsmul_eq_mul] using hmul⟩
    have hsub : (x : AddCircle p) - y = 0 := by
      simpa only [AddCircle.coe_sub] using hzero
    exact sub_eq_zero.mp hsub
  · intro hxy
    have hzero : ((x - y : ℝ) : AddCircle p) = 0 := by
      rw [AddCircle.coe_sub]
      exact sub_eq_zero.mpr hxy
    rcases AddCircle.coe_eq_zero_iff.mp hzero with ⟨n, hn⟩
    refine ⟨n, ?_⟩
    have hmul : (n : ℝ) * p = x - y := by
      simpa [zsmul_eq_mul] using hn
    exact (div_eq_iff hp).2 hmul.symm

/--
The BR-006 scalar phase increment is an integer turn count precisely when
the endpoints close on the circle with period 2π.
-/
theorem br006_phase_increment_integer_iff_closed (x y : ℝ) :
    (∃ n : ℤ, (x - y) / (2 * Real.pi) = n) ↔
      (x : AddCircle (2 * Real.pi)) = y := by
  exact phase_delta_integer_iff_same_addCircle_point
    (2 * Real.pi) x y (by positivity)

open unitInterval

/--
For a continuous real lift of a relative-phase path, endpoint closure in
AddCircle (2π) makes the normalized phase increment an integer.
-/
theorem continuous_phase_loop_count_is_integer (Φ : C(I, ℝ))
    (hclosed : (Φ 1 : AddCircle (2 * Real.pi)) = Φ 0) :
    ∃ n : ℤ, (Φ 1 - Φ 0) / (2 * Real.pi) = n :=
  (br006_phase_increment_integer_iff_closed (Φ 1) (Φ 0)).mp hclosed

#print axioms phase_delta_integer_iff_same_addCircle_point
#print axioms br006_phase_increment_integer_iff_closed
#print axioms continuous_phase_loop_count_is_integer

end HsHVerification.EnheduannaBR006PhaseClosure
