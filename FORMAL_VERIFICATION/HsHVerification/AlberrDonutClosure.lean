import Mathlib

/-!
# Source-conditional Donut closure gate (2026-10-29)

Sources:
- Nathan-attributed FINDING THE DONUT (nolat), PDF pages 23–27, archival
  extracted-text blob a788b5cc415f90de2d0382d3596ef07d68604687.
- Assistant-produced SAT 2026 WHIRLIGIG — Donut canon, archive blob
  8f95b9174657617c9976ff76e17fd8ef36ad660c.

The historical assistant defines Y(t)=X_T(t)+ε V(t), calls it a
closed torus trace after locking the base angles to a rational ratio.
These conditional theorems show the missing fiber-return condition
for a scalar component of that output. They do NOT formalize torus
geometry, non-Abelian holonomy, actual filament contact, or physical
validation. The later archive correctly distinguishes projected
base-curve closure from full lifted-state closure.
-/

namespace HsHVerification.AlberrDonutClosure

/-- Scalar component of the historical assistant's additive observable. -/
def fiberOutput (base fiber : ℝ → ℝ) (ε t : ℝ) : ℝ :=
  base t + ε * fiber t

/-- If the base component closes and the fiber coefficient is nonzero,
the full additive output closes exactly when its fiber closes. -/
theorem closed_output_iff_fiber_closed
    (base fiber : ℝ → ℝ) (ε t T : ℝ)
    (hbase : base (t + T) = base t)
    (hε : ε ≠ 0) :
    fiberOutput base fiber ε (t + T) = fiberOutput base fiber ε t ↔
      fiber (t + T) = fiber t := by
  unfold fiberOutput
  rw [hbase]
  constructor
  · intro h
    have hm : ε * fiber (t + T) = ε * fiber t := add_left_cancel h
    have hz : ε * (fiber (t + T) - fiber t) = 0 := by
      calc
        ε * (fiber (t + T) - fiber t) =
            ε * fiber (t + T) - ε * fiber t := by ring
        _ = 0 := sub_eq_zero.mpr hm
    rcases mul_eq_zero.mp hz with he | hv
    · exact False.elim (hε he)
    · exact sub_eq_zero.mp hv
  · intro h
    rw [h]

/-- A nonreturning fiber prevents closure of the full observable,
even when the base component returns. -/
theorem nonreturning_fiber_prevents_output_closure
    (base fiber : ℝ → ℝ) (ε t T : ℝ)
    (hbase : base (t + T) = base t)
    (hε : ε ≠ 0)
    (hfiber : fiber (t + T) ≠ fiber t) :
    fiberOutput base fiber ε (t + T) ≠ fiberOutput base fiber ε t := by
  intro hout
  exact hfiber ((closed_output_iff_fiber_closed base fiber ε t T hbase hε).mp hout)

/-- Equality of projected base values does not identify two
distinct lifted states. No claim of physical equivalence is made. -/
theorem same_base_distinct_fiber_distinct_lift
    {B F : Type*} (base : B) {fiber₀ fiber₁ : F}
    (hf : fiber₀ ≠ fiber₁) :
    (base, fiber₀) ≠ (base, fiber₁) := by
  intro h
  exact hf (congrArg Prod.snd h)

#print axioms closed_output_iff_fiber_closed
#print axioms nonreturning_fiber_prevents_output_closure
#print axioms same_base_distinct_fiber_distinct_lift

end HsHVerification.AlberrDonutClosure
