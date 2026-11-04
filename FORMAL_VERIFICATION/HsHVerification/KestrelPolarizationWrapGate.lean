import HsHVerification.KestrelPhaseWrapGate
import HsHVerification.AlberrPolarimeterPhaseGate

/-!
The 2015 neutron polarimeter's ideal polarization vector has BOTH sine
and cosine channels. A calibrated quadrature resolves some sign ambiguity,
but neither channel determines the integer number of whole windings.
No physical H(s)H twist count or calibrated apparatus uncertainty is proved.
-/

namespace HsHVerification.KestrelPolarizationWrapGate

open HsHVerification.AlberrPolarimeterPhaseGate

/-- Even both ideal polarization components lose full turns. -/
theorem polarization_pair_full_turn (alpha phi : ℝ) :
    (polarizationY alpha (phi + 2 * Real.pi),
     polarizationZ alpha (phi + 2 * Real.pi)) =
    (polarizationY alpha phi, polarizationZ alpha phi) := by
  apply Prod.ext
  · unfold polarizationY
    have h : alpha + (phi + 2 * Real.pi) =
        (alpha + phi) + 2 * Real.pi := by ring
    rw [h, Real.sin_add_two_pi]
  · unfold polarizationZ
    have h : alpha + (phi + 2 * Real.pi) =
        (alpha + phi) + 2 * Real.pi := by ring
    rw [h, Real.cos_add_two_pi]

/-- Any downstream detector processing of the same pair cannot
    restore a winding already erased by the pair readout. -/
theorem downstream_cannot_restore_winding {X : Type*}
    (postprocess : (ℝ × ℝ) → X) (alpha phi : ℝ) :
    postprocess
      (polarizationY alpha (phi + 2 * Real.pi),
       polarizationZ alpha (phi + 2 * Real.pi)) =
    postprocess (polarizationY alpha phi, polarizationZ alpha phi) := by
  rw [polarization_pair_full_turn]

#print axioms polarization_pair_full_turn
#print axioms downstream_cannot_restore_winding

end HsHVerification.KestrelPolarizationWrapGate
