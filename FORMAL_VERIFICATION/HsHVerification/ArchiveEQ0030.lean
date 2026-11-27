import Mathlib

/-!
EQ-0030: historical two-frequency R4 superhelix / Mercury closure audit.

Historical source:
Satobloc/SAT_THEORY_ARCHIVE_2023-25/% BIG PAPER (nolat).pdf
source SHA-256 5f1bc1638ced8553ac16bd077d70ec2209f88771cbee021fa528a68ace9f84b1
archived commit fdf30b2d636f023fd3c9282987ac19c514e9394e, 2026-05-30.

Empirical comparator:
Stark et al. (2015), Mercury orbit and MESSENGER rotation measurements.
These theorems certify dimensional and exact-rational arithmetic statements only.
They do not identify the R4 parametrization with Mercury or establish H(s)H physics.
-/

namespace HsHVerification.ArchiveEQ0030

structure ParamDim where
  exponent : Int
deriving DecidableEq, Repr

def mulDim (a b : ParamDim) : ParamDim :=
  ⟨a.exponent + b.exponent⟩

def parameterDim : ParamDim := ⟨1⟩
def angularFrequencyDim : ParamDim := ⟨-1⟩
def dimensionlessDim : ParamDim := ⟨0⟩

theorem phase_dimensionless :
    mulDim angularFrequencyDim parameterDim = dimensionlessDim := by
  rfl

theorem exact_three_two_closure
    (orbitPhase spinPhase : ℝ)
    (hOrbit : orbitPhase = 2 * Real.pi)
    (hSpin : spinPhase = (3 / 2 : ℝ) * orbitPhase) :
    2 * spinPhase = 6 * Real.pi := by
  rw [hSpin, hOrbit]
  ring

def orbitPeriod : ℚ := 8796934962 / 100000000
def resonantRate : ℚ := 6138506839 / 1000000000
def observedRate : ℚ := 613851804 / 100000000
def resonantUncertainty : ℚ := 28 / 1000000000
def observedUncertainty : ℚ := 94 / 100000000

theorem measured_rate_exceeds_resonant_model :
    resonantRate < observedRate := by
  norm_num [resonantRate, observedRate]

theorem one_sigma_intervals_are_separated :
    resonantRate + resonantUncertainty <
      observedRate - observedUncertainty := by
  norm_num [resonantRate, resonantUncertainty,
    observedRate, observedUncertainty]

theorem observed_two_orbit_phase_exceeds_resonant :
    2 * orbitPeriod * resonantRate <
      2 * orbitPeriod * observedRate := by
  norm_num [orbitPeriod, resonantRate, observedRate]

theorem inertial_resonant_phase_not_naive_1080 :
    2 * orbitPeriod * resonantRate ≠ 1080 := by
  norm_num [orbitPeriod, resonantRate]

theorem zero_orbit_radius_limit (r w : ℝ) :
    (0 : ℝ)^2 * w^2 + r^2 * w^2 = r^2 * w^2 := by
  ring

theorem derivative_norm_square_nonnegative
    (R r ws wh : ℝ) :
    0 ≤ R^2 * ws^8 + r^2 * wh^8 := by
  positivity

end HsHVerification.ArchiveEQ0030
