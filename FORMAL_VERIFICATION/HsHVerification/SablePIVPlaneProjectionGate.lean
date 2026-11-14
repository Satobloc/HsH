import Mathlib

/-!
# Sable PIV midplane projection gate

This module formalizes the information loss in an idealized 2D2C midplane
velocity readout. It does not assert an H(s)H identification, reconstruct a
physical flow, or supply experimental data.

The physical premise represented here is narrow: the cited PIV arrangement
records two in-plane velocity components on a measurement plane, not the
out-of-plane component at that same point.
-/

namespace HsHVerification.SablePIVPlaneProjectionGate

abbrev Velocity3 := ℝ × ℝ × ℝ
abbrev Velocity2 := ℝ × ℝ

/-- Idealized midplane 2D2C readout: retain the two in-plane components and
discard the out-of-plane component. -/
def midplaneReadout (v : Velocity3) : Velocity2 :=
  (v.1, v.2.1)

/-- Changing only the out-of-plane component leaves the 2D2C readout unchanged. -/
theorem midplaneReadout_ignores_out_of_plane
    (x y z z' : ℝ) :
    midplaneReadout (x, y, z) = midplaneReadout (x, y, z') := by
  rfl

/-- The idealized 2D2C midplane readout is not injective. -/
theorem midplaneReadout_not_injective :
    ¬ Function.Injective midplaneReadout := by
  intro hInjective
  have hReadout :
      midplaneReadout ((0 : ℝ), 0, 0) =
      midplaneReadout ((0 : ℝ), 0, 1) := by
    rfl
  have hVelocity :
      ((0 : ℝ), 0, 0) = ((0 : ℝ), 0, 1) :=
    hInjective hReadout
  have hThird : (0 : ℝ) = 1 :=
    congrArg (fun v : Velocity3 => v.2.2) hVelocity
  norm_num at hThird

/-- No deterministic function of the two in-plane components alone can
reconstruct all three components of an arbitrary 3D velocity vector. -/
theorem no_total_reconstruction_from_midplane :
    ¬ ∃ reconstruct : Velocity2 → Velocity3,
        ∀ v : Velocity3, reconstruct (midplaneReadout v) = v := by
  rintro ⟨reconstruct, hReconstruct⟩
  have hReadout :
      midplaneReadout ((0 : ℝ), 0, 0) =
      midplaneReadout ((0 : ℝ), 0, 1) := by
    rfl
  have hVelocity :
      ((0 : ℝ), 0, 0) = ((0 : ℝ), 0, 1) := by
    calc
      ((0 : ℝ), 0, 0) =
          reconstruct (midplaneReadout ((0 : ℝ), 0, 0)) :=
            (hReconstruct _).symm
      _ = reconstruct (midplaneReadout ((0 : ℝ), 0, 1)) :=
            congrArg reconstruct hReadout
      _ = ((0 : ℝ), 0, 1) :=
            hReconstruct _
  have hThird : (0 : ℝ) = 1 :=
    congrArg (fun v : Velocity3 => v.2.2) hVelocity
  norm_num at hThird

end HsHVerification.SablePIVPlaneProjectionGate
