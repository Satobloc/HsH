import HsHVerification.SableD2DensityGate
import Mathlib

/-!
Conditional geometry-to-mass map for the same source-identified D2 tracers.
Spherical tracer is the explicit model in Tang et al. (2023), Eq. (8).
No claim that the printed 2023 density was actually used in simulations.
-/

namespace HsHVerification.SableD2MassGate

open HsHVerification.SableD2DensityGate

def massFromVolume (rho volume : ℚ) : ℚ := rho * volume

theorem source_printed_mass_ratio (volume : ℚ) :
    massFromVolume tangPrintedKgM3 volume =
      1000 * massFromVolume stasiakPrintedKgM3 volume := by
  rw [printed_density_ratio]
  simp only [massFromVolume]
  ring

def sphereVolume (radius : ℝ) : ℝ :=
  (4 / 3 : ℝ) * Real.pi * radius ^ 3

def sphericalMass (density radius : ℝ) : ℝ :=
  density * sphereVolume radius

theorem spherical_mass_density_scaling (density radius : ℝ) :
    sphericalMass (1000 * density) radius =
      1000 * sphericalMass density radius := by
  unfold sphericalMass sphereVolume
  ring

theorem spherical_mass_radius_cubic (density radius scale : ℝ) :
    sphericalMass density (scale * radius) =
      scale ^ 3 * sphericalMass density radius := by
  unfold sphericalMass sphereVolume
  ring

end HsHVerification.SableD2MassGate
