import Mathlib
import HsHVerification.NadirVortexTwoChannelReadout

/-!
# Conditional four-view cardinal-azimuth readout

This module defines a *proposed observation operator*, not a recovered
camera map for the Nature Physics experiment.

Assumption: two calibrated antipodal radial pairs sample one common
azimuthal coordinate at 0 and π/2, synchronized at the same (z,t) and
expressed in one azimuthal frame. The source paper says that two orthogonal
cameras were used to establish the counter-rotating character of the m=1
mode, but the retrieved source does not establish that those cameras implement
these four radial samples.

The second pair is composed explicitly as the original antipodal readout
with the mode-dependent phase shift φ ↦ φ + mπ/2. Under this conditional
operator:
* the four samples distinguish m=1 from m=3 exactly when ε sin φ ≠ 0;
* modes m and m+4 remain exactly aliased for every a₀, ε, and φ.

This is a statement about the formalized sampling map only. It does not
validate camera pose, calibration, synchronization, contour extraction,
the source-to-model translation, or the physical experiment.
-/

namespace HsHVerification.EnheduannaFourViewReadout

open HsHVerification.NadirVortexTwoChannelReadout

noncomputable section

abbrev FourViewReadout := Readout × Readout

/-- Two antipodal radial pairs: the first at azimuth 0, the second at π/2.
The phase shift in the second pair is the model's mπ/2 azimuthal phase. -/
def fourViewModeReadout (m : ℕ) (a₀ ε φ : ℝ) : FourViewReadout :=
  (antipodalModeReadout m a₀ ε φ,
   antipodalModeReadout m a₀ ε (φ + (m : ℝ) * Real.pi / 2))

/-- The two-channel antipodal readout is 2π-periodic in its phase. -/
theorem antipodalModeReadout_phase_two_pi (m : ℕ) (a₀ ε φ : ℝ) :
    antipodalModeReadout m a₀ ε (φ + 2 * Real.pi) =
      antipodalModeReadout m a₀ ε φ := by
  unfold antipodalModeReadout
  apply congrArg (fun p : Readout => p)
  congr 1
  · unfold radialModeContour
    have harg :
        (φ + 2 * Real.pi) + (m : ℝ) * 0 =
          (φ + (m : ℝ) * 0) + 2 * Real.pi := by ring
    rw [harg, HsHVerification.NadirVortexTwoChannelReadout.cos_add_two_pi]
  · unfold radialModeContour
    have harg :
        (φ + 2 * Real.pi) + (m : ℝ) * Real.pi =
          (φ + (m : ℝ) * Real.pi) + 2 * Real.pi := by ring
    rw [harg, HsHVerification.NadirVortexTwoChannelReadout.cos_add_two_pi]

/-- Four cardinal samples retain a residual m ↔ m+4 alias. -/
theorem fourViewModeReadout_four_step (m : ℕ) (a₀ ε φ : ℝ) :
    fourViewModeReadout (m + 4) a₀ ε φ =
      fourViewModeReadout m a₀ ε φ := by
  unfold fourViewModeReadout
  apply Prod.ext
  · calc
      antipodalModeReadout (m + 4) a₀ ε φ =
          antipodalModeReadout (m + 2) a₀ ε φ :=
        antipodalModeReadout_two_step (m + 2) a₀ ε φ
      _ = antipodalModeReadout m a₀ ε φ :=
        antipodalModeReadout_two_step m a₀ ε φ
  · have hphase :
        φ + ((m + 4 : ℕ) : ℝ) * Real.pi / 2 =
          (φ + (m : ℝ) * Real.pi / 2) + 2 * Real.pi := by
        push_cast
        ring
    rw [hphase]
    calc
      antipodalModeReadout (m + 4) a₀ ε
          ((φ + (m : ℝ) * Real.pi / 2) + 2 * Real.pi) =
        antipodalModeReadout (m + 4) a₀ ε
          (φ + (m : ℝ) * Real.pi / 2) :=
        antipodalModeReadout_phase_two_pi (m + 4) a₀ ε
          (φ + (m : ℝ) * Real.pi / 2)
      _ = antipodalModeReadout (m + 2) a₀ ε
          (φ + (m : ℝ) * Real.pi / 2) :=
        antipodalModeReadout_two_step (m + 2) a₀ ε
          (φ + (m : ℝ) * Real.pi / 2)
      _ = antipodalModeReadout m a₀ ε
          (φ + (m : ℝ) * Real.pi / 2) :=
        antipodalModeReadout_two_step m a₀ ε
          (φ + (m : ℝ) * Real.pi / 2)

lemma cos_add_pi_div_two (x : ℝ) :
    Real.cos (x + Real.pi / 2) = -Real.sin x := by
  rw [Real.cos_add]
  simp

lemma cos_add_three_pi_div_two (x : ℝ) :
    Real.cos (x + 3 * Real.pi / 2) = Real.sin x := by
  rw [Real.cos_add]
  simp

/-- The four-view operator distinguishes m=1 from m=3 exactly when the
sampled phase signal ε sin φ is nonzero. This is conditional on the
four-cardinal radial sampling operator defined above. -/
theorem fourViewModeReadout_one_three_eq_iff_signal_zero
    (a₀ ε φ : ℝ) :
    fourViewModeReadout 1 a₀ ε φ = fourViewModeReadout 3 a₀ ε φ ↔
      ε * Real.sin φ = 0 := by
  constructor
  · intro h
    have h90 := congrArg Prod.snd h
    have h3 :
        antipodalModeReadout 3 a₀ ε (φ + 3 * Real.pi / 2) =
          antipodalModeReadout 1 a₀ ε (φ + 3 * Real.pi / 2) :=
      antipodalModeReadout_two_step 1 a₀ ε
        (φ + 3 * Real.pi / 2)
    rw [h3, antipodalModeReadout_one_formula,
      antipodalModeReadout_one_formula] at h90
    have hcos := congrArg Prod.fst h90
    rw [cos_add_pi_div_two, cos_add_three_pi_div_two] at hcos
    nlinarith
  · intro h
    apply Prod.ext
    · exact (antipodalModeReadout_two_step 1 a₀ ε φ).symm
    · have hcos :
          ε * Real.cos (φ + Real.pi / 2) =
            ε * Real.cos (φ + 3 * Real.pi / 2) := by
          rw [cos_add_pi_div_two, cos_add_three_pi_div_two]
          nlinarith
      calc
        antipodalModeReadout 1 a₀ ε (φ + Real.pi / 2) =
            (ε * Real.cos (φ + Real.pi / 2), a₀) :=
          antipodalModeReadout_one_formula a₀ ε (φ + Real.pi / 2)
        _ = (ε * Real.cos (φ + 3 * Real.pi / 2), a₀) := by
          exact Prod.ext hcos rfl
        _ = antipodalModeReadout 1 a₀ ε (φ + 3 * Real.pi / 2) :=
          (antipodalModeReadout_one_formula a₀ ε
            (φ + 3 * Real.pi / 2)).symm
        _ = antipodalModeReadout 3 a₀ ε (φ + 3 * Real.pi / 2) :=
          (antipodalModeReadout_two_step 1 a₀ ε
            (φ + 3 * Real.pi / 2)).symm

/-- Modes m=1 and m=5 remain indistinguishable under the four-cardinal
sampling operator, irrespective of phase or amplitude. -/
theorem fourViewModeReadout_one_five_eq (a₀ ε φ : ℝ) :
    fourViewModeReadout 1 a₀ ε φ = fourViewModeReadout 5 a₀ ε φ := by
  simpa using (fourViewModeReadout_four_step 1 a₀ ε φ).symm

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
    simpa using (fourViewModeReadout_one_five_eq a₀ ε φ).symm
  have hne : (1 : Fin 6) ≠ 5 := by decide
  exact hne (hinj hEq)

#print axioms antipodalModeReadout_phase_two_pi
#print axioms fourViewModeReadout_four_step
#print axioms fourViewModeReadout_one_three_eq_iff_signal_zero
#print axioms fourViewModeReadout_one_five_eq
#print axioms fourViewModeReadout_not_injective

end
end HsHVerification.EnheduannaFourViewReadout
