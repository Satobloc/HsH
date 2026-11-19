import Mathlib

/-!
# Kestrel: logarithmic acquisition time is not physical time

Source: Matsuzawa, Zhu, Goldenfeld & Irvine, PNAS 123 (2026),
Supporting Information §A.4, Eqs. (54)–(57).

For the source's n = -2 trigger schedule,
  Δ(t) = (t - t₀) * exp(d / sqrt(2*c) - 1).
Writing ρ for the positive exponential factor gives
  t_next - t₀ = (1 + ρ) * (t - t₀),
so τ = log(t - t₀) advances by the constant log(1 + ρ).

This module proves that discrete source-linked coordinate identity and
executes two arithmetic checks on source-reported acquisition values.
It does not formalize the turbulent PDE, infer a material boundary,
identify τ with physical time, or define an H(s)H time-surface map.
-/

namespace HsHVerification.KestrelLogTimeSampling

/-- The source-defined logarithmic sampling coordinate. -/
def logClock (t₀ t : ℝ) : ℝ := Real.log (t - t₀)

/-- Relative frame-interval factor in the source's n = -2 schedule. -/
def relativeStep (d c : ℝ) : ℝ := Real.exp (d / Real.sqrt (2 * c) - 1)

theorem relativeStep_pos (d c : ℝ) (_hc : 0 < c) :
    0 < relativeStep d c := by
  unfold relativeStep
  positivity

/-- One source-scheduled step multiplies the physical-time offset by 1 + ρ. -/
theorem source_step_offset (t₀ t ρ : ℝ) :
    (t + ρ * (t - t₀)) - t₀ = (1 + ρ) * (t - t₀) := by
  ring

/-- Under the n = -2 recurrence, adjacent samples are equally spaced in log time. -/
theorem logClock_step (t₀ t ρ : ℝ)
    (hρ : 0 < ρ) (ht : t₀ < t) :
    logClock t₀ (t + ρ * (t - t₀)) - logClock t₀ t
      = Real.log (1 + ρ) := by
  unfold logClock
  have hfactor : 0 < 1 + ρ := by linarith
  have hoffset : 0 < t - t₀ := sub_pos.mpr ht
  have hstep : (t + ρ * (t - t₀)) - t₀ = (1 + ρ) * (t - t₀) := by
    ring
  rw [hstep, Real.log_mul (ne_of_gt hfactor) (ne_of_gt hoffset)]
  ring

/-- The source-defined exponential factor instantiates the constant log step. -/
theorem source_logClock_step (t₀ t d c : ℝ)
    (hc : 0 < c) (ht : t₀ < t) :
    logClock t₀ (t + relativeStep d c * (t - t₀)) - logClock t₀ t
      = Real.log (1 + relativeStep d c) := by
  apply logClock_step
  · exact relativeStep_pos d c hc
  · exact ht

/-- The logarithmic coordinate advances strictly under a positive source step. -/
theorem logClock_step_pos (t₀ t ρ : ℝ)
    (hρ : 0 < ρ) (ht : t₀ < t) :
    0 < logClock t₀ (t + ρ * (t - t₀)) - logClock t₀ t := by
  rw [logClock_step t₀ t ρ hρ ht]
  apply Real.log_pos
  linarith

-- Source-reported PIV interval endpoints: 1 s / 2.5 ms = 400.
#eval (1 : ℚ) / ((25 : ℚ) / 10000)

-- Source-reported logarithmic acquisition duration: 1050 s = 17.5 min.
#eval (1050 : ℚ) / 60

#print axioms source_logClock_step
#print axioms logClock_step_pos

end HsHVerification.KestrelLogTimeSampling
