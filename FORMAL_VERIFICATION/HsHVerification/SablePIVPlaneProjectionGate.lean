import Mathlib

/-!
# Sable PIV midplane projection gate

This module formalizes the information loss in an idealized 2D2C midplane
velocity readout. It does not assert an H(s)H identification, reconstruct a
physical flow, or supply experimental data.

The physical premise represented here is narrow: the cited PIV arrangement
records two in-plane velocity components on a measurement plane, not the
out-of-plane component at that same point.
This is a pointwise linear readout idealization; finite laser-sheet thickness,
interrogation-window averaging, interpolation, and temporal processing are outside
this theorem and must remain separate operators in any empirical analysis.
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
      midplaneReadout ((0 : ℝ), (0 : ℝ), (0 : ℝ)) =
      midplaneReadout ((0 : ℝ), (0 : ℝ), (1 : ℝ)) := by
    rfl
  have hVelocity :
      ((0 : ℝ), (0 : ℝ), (0 : ℝ)) = ((0 : ℝ), (0 : ℝ), (1 : ℝ)) :=
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
      midplaneReadout ((0 : ℝ), (0 : ℝ), (0 : ℝ)) =
      midplaneReadout ((0 : ℝ), (0 : ℝ), (1 : ℝ)) := by
    rfl
  have hVelocity :
      ((0 : ℝ), (0 : ℝ), (0 : ℝ)) = ((0 : ℝ), (0 : ℝ), (1 : ℝ)) := by
    calc
      ((0 : ℝ), (0 : ℝ), (0 : ℝ)) =
          reconstruct (midplaneReadout ((0 : ℝ), (0 : ℝ), (0 : ℝ))) :=
            (hReconstruct _).symm
      _ = reconstruct (midplaneReadout ((0 : ℝ), (0 : ℝ), (1 : ℝ))) :=
            congrArg reconstruct hReadout
      _ = ((0 : ℝ), (0 : ℝ), (1 : ℝ)) :=
            hReconstruct _
  have hThird : (0 : ℝ) = 1 :=
    congrArg (fun v : Velocity3 => v.2.2) hVelocity
  norm_num at hThird



/-!
## Three-plane stereo-PIV sampling

The Delft free-surface-vortex study reports stereo-PIV measurements on three
horizontal planes at z = 0.29 m, 0.49 m, and 0.62 m. This finite-plane
restriction retains all three velocity components on each sampled plane, but
does not by itself determine an arbitrary field between those planes.

The witness below is an abstract function-space counterexample, not a
Navier–Stokes solution or a fabricated physical measurement. Physical
regularity, axisymmetry, constitutive assumptions, and governing equations
may restrict the admissible field space; those restrictions are not encoded
by the measurement map alone.
-/

abbrev Point2 := ℝ × ℝ
abbrev Point3 := ℝ × ℝ × ℝ
abbrev FlowField := Point3 → Velocity3
abbrev PlaneField := Point2 → Velocity3

/-- Restrict a 3D velocity field to a horizontal plane at fixed z. -/
def samplePlane (z : ℝ) (field : FlowField) : PlaneField :=
  fun p => field (p.1, p.2, z)

/-- The three measurement planes reported by Duinmeijer et al. (2020). -/
def threePlaneSample (field : FlowField) : PlaneField × PlaneField × PlaneField :=
  (samplePlane ((29 : ℝ) / 100) field,
   samplePlane ((49 : ℝ) / 100) field,
   samplePlane ((62 : ℝ) / 100) field)

def zeroFlow : FlowField := fun _ => ((0 : ℝ), (0 : ℝ), (0 : ℝ))

/-- Abstract witness that vanishes on the three sampled planes but not between them. -/
def betweenPlaneWitness : FlowField := fun p =>
  ((0 : ℝ), (0 : ℝ),
    (p.2.2 - (29 : ℝ) / 100) *
    (p.2.2 - (49 : ℝ) / 100) *
    (p.2.2 - (62 : ℝ) / 100))

/-- Three fixed horizontal planes do not injectively determine an arbitrary 3D field. -/
theorem threePlaneSample_not_injective :
    ¬ Function.Injective threePlaneSample := by
  intro hInjective
  have hSamples :
      threePlaneSample zeroFlow = threePlaneSample betweenPlaneWitness := by
    apply Prod.ext
    · funext p
      simp [threePlaneSample, samplePlane, zeroFlow, betweenPlaneWitness]
    · apply Prod.ext
      · funext p
        simp [threePlaneSample, samplePlane, zeroFlow, betweenPlaneWitness]
      · funext p
        simp [threePlaneSample, samplePlane, zeroFlow, betweenPlaneWitness]
  have hFields : zeroFlow = betweenPlaneWitness := hInjective hSamples
  have hAt :
      zeroFlow ((0 : ℝ), (0 : ℝ), (0 : ℝ)) =
      betweenPlaneWitness ((0 : ℝ), (0 : ℝ), (0 : ℝ)) :=
    congrFun hFields ((0 : ℝ), (0 : ℝ), (0 : ℝ))
  have hThird : (0 : ℝ) =
      ((0 : ℝ) - (29 : ℝ) / 100) *
      ((0 : ℝ) - (49 : ℝ) / 100) *
      ((0 : ℝ) - (62 : ℝ) / 100) :=
    congrArg (fun v : Velocity3 => v.2.2) hAt
  norm_num at hThird

/-- No deterministic inverse reconstructs every arbitrary 3D field from these
three plane samples alone. -/
theorem no_total_reconstruction_from_three_planes :
    ¬ ∃ reconstruct : (PlaneField × PlaneField × PlaneField) → FlowField,
        ∀ field : FlowField, reconstruct (threePlaneSample field) = field := by
  rintro ⟨reconstruct, hReconstruct⟩
  apply threePlaneSample_not_injective
  intro f g hfg
  calc
    f = reconstruct (threePlaneSample f) := (hReconstruct f).symm
    _ = reconstruct (threePlaneSample g) := congrArg reconstruct hfg
    _ = g := hReconstruct g

end HsHVerification.SablePIVPlaneProjectionGate
