import Mathlib
import HsHVerification.NadirVortexTwoChannelReadout

/-!
# Conditional four-view cardinal-azimuth readout

This module defines a *proposed observation operator*, not a recovered
camera map for the Nature Physics experiment.

Assumption: two calibrated antipodal radial pairs sample one common
azimuthal coordinate at 0, π/2, π, and 3π/2, at the same (z,t) and
within the same physical acquisition. The source paper says that two
orthogonal cameras were used to establish the counter-rotating character
of the m=1 mode, but the retrieved source does not establish that those
cameras implement these four radial samples.

Under this conditional operator:
* the four samples distinguish m=1 from m=3 exactly when ε sin φ ≠ 0;
* modes m and m+4 remain exactly aliased for every a₀, ε, and φ.

This is a statement about the formalized sampling map only. It does not
validate camera pose, calibration, synchronization, contour extraction,
the source-to-model translation, or the physical experiment.
-/

namespace HsHVerification.EnheduannaFourViewReadout

open HsHVerification.NadirVortexTwoChannelReadout

abbrev FourViewReadout := ℝ × ℝ × ℝ × ℝ

/-- Four hypothetical radial samples at cardinal azimuths. -/
def fourViewModeReadout (m : ℕ) (a₀ ε φ : ℝ) : FourViewReadout :=
  (radialModeContour m a₀ ε φ 0,
   radialModeContour m a₀ ε φ (Real.pi / 2),
   radialModeContour m a₀ ε φ Real.pi,
   radialModeContour m a₀ ε φ (3 * Real.pi / 2))

/-- Four cardinal samples retain a residual m ↔ m+4 alias. -/
theorem fourViewModeReadout_four_step (m : ℕ) (a₀ ε φ : ℝ) :
    fourViewModeReadout (m + 4) a₀ ε φ =
      fourViewModeReadout m a₀ ε φ := by
  unfold fourViewModeReadout
  apply Prod.ext
  · simp [radialModeContour]
  · apply Prod.ext
    · unfold radialModeContour
      have harg :
          φ + ((m + 4 : ℕ) : ℝ) * (Real.pi / 2) =
            (φ + (m : ℝ) * (Real.pi / 2)) + 2 * Real.pi := by
        push_cast
        ring
      rw [harg, HsHVerification.NadirVortexTwoChannelReadout.cos_add_two_pi]
    · apply Prod.ext
      · unfold radialModeContour
        have harg :
            φ + ((m + 4 : ℕ) : ℝ) * Real.pi =
              ((φ + (m : ℝ) * Real.pi) + 2 * Real.pi) + 2 * Real.pi := by
          push_cast
          ring
        rw [harg,
          HsHVerification.NadirVortexTwoChannelReadout.cos_add_two_pi,
          HsHVerification.NadirVortexTwoChannelReadout.cos_add_two_pi]
      · unfold radialModeContour
        have harg :
            φ + ((m + 4 : ℕ) : ℝ) * (3 * Real.pi / 2) =
              (((φ + (m : ℝ) * (3 * Real.pi / 2)) + 2 * Real.pi) +
                2 * Real.pi) + 2 * Real.pi := by
          push_cast
          ring
        rw [harg,
          HsHVerification.NadirVortexTwoChannelReadout.cos_add_two_pi,
          HsHVerification.NadirVortexTwoChannelReadout.cos_add_two_pi,
          HsHVerification.NadirVortexTwoChannelReadout.cos_add_two_pi]

/-- The four-view operator distinguishes m=1 from m=3 exactly when the
sampled phase signal ε sin φ is nonzero. This is conditional on the
four-cardinal radial sampling operator defined above. -/
theorem fourViewModeReadout_one_three_eq_iff_signal_zero
    (a₀ ε φ : ℝ) :
    fourViewModeReadout 1 a₀ ε φ = fourViewModeReadout 3 a₀ ε φ ↔
      ε * Real.sin φ = 0 := by
  constructor
  · intro h
    have h90 := congrArg (fun x : FourViewReadout => x.2.1) h
    have hEq : a₀ - ε * Real.sin φ = a₀ + ε * Real.sin φ := by
      simpa [fourViewModeReadout, radialModeContour, Real.cos_add] using h90
    nlinarith
  · intro h
    ext <;> simp [fourViewModeReadout, radialModeContour, Real.cos_add, h]

/-- Modes m=1 and m=5 remain indistinguishable under the four-cardinal
sampling operator, irrespective of phase or amplitude. -/
theorem fourViewModeReadout_one_five_eq (a₀ ε φ : ℝ) :
    fourViewModeReadout 1 a₀ ε φ = fourViewModeReadout 5 a₀ ε φ := by
  simpa using fourViewModeReadout_four_step 1 a₀ ε φ

/-- Consequently, the four-cardinal operator is not injective on modes
{0,1,2,3,4,5}; a downstream deterministic classifier cannot recover
the m=1 versus m=5 distinction from these four samples alone. -/
theorem fourViewModeReadout_not_injective (a₀ ε φ : ℝ) :
    ¬ Function.Injective
      (fun m : Fin 6 => fourViewModeReadout m.val a₀ ε φ) := by
  intro hinj
  have hEq :
      (fun m : Fin 6 => fourViewModeReadout m.val a₀ ε φ) 1 =
        (fun m : Fin 6 => fourViewModeReadout m.val a₀ ε φ) 5 := by
    simpa using fourViewModeReadout_one_five_eq a₀ ε φ
  have hne : (1 : Fin 6) ≠ 5 := by decide
  exact hne (hinj hEq)

#print axioms fourViewModeReadout_four_step
#print axioms fourViewModeReadout_one_three_eq_iff_signal_zero
#print axioms fourViewModeReadout_one_five_eq
#print axioms fourViewModeReadout_not_injective

end HsHVerification.EnheduannaFourViewReadout
