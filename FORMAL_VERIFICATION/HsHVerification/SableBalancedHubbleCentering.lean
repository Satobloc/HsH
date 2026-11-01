import Mathlib

/-!
# Sable: dimensionally typed balanced relative-expansion centering

Source: HsH/BEDROCK.md, Nathan Direct entries ND-2026-10-21-02 and
ND-2026-10-21-03 (2026-10-21). The stated working representation is

  v_H = H₀ * L
  v_t = c + v_H
  v_s = v_H
  m   = (v_t + v_s) / 2

with centered residuals +c/2 and -c/2 under the co-oriented sign convention.
The length L must be physically justified by a separate source/measurement.

Historical source context: DEVELOPMENT_FULL_CONVOS/COSMO.txt, blob
c134a02db2a07723e0dc0d62efd7ae9083788f22, includes the earlier H₀ versus
H₀+c / two-reference-surface visualization. The later Nathan clarification
in 🔑/🔑.md, blob c05b39f8a84bcc95bcc59c9e09f8a3ac98064cab, says no dual shell
or multiple-speed expansion need be posited and identifies H₀ R_H = c as the
Hubble-law gradient normalization.

This module proves only the conditional algebra of the centered readout.
The wrapper types keep Rate, Length, and Speed distinct, but Lean does not
prove that a particular physical quantity has been assigned the right unit.
The module does not choose L, derive an FLRW or SAT metric, establish physical
shells, validate H₀, or establish a new physical prediction.
-/

namespace HsHVerification.SableBalancedHubbleCentering

/-- Nominal physical dimension wrappers; their unit interpretation is a premise. -/
structure Rate where
  value : ℝ

structure Length where
  value : ℝ

structure Speed where
  value : ℝ

/-- A rate multiplied by a length is represented as a speed. -/
def rateTimesLength (H₀ : Rate) (L : Length) : Speed :=
  ⟨H₀.value * L.value⟩

def addSpeeds (v w : Speed) : Speed :=
  ⟨v.value + w.value⟩

def subtractSpeeds (v w : Speed) : Speed :=
  ⟨v.value - w.value⟩

def midpointSpeed (v w : Speed) : Speed :=
  ⟨(v.value + w.value) / 2⟩

def halfSpeed (v : Speed) : Speed :=
  ⟨v.value / 2⟩

def negativeHalfSpeed (v : Speed) : Speed :=
  ⟨-v.value / 2⟩

/-- Time-side speed in the Nathan Direct centered representation. -/
def timeSectorSpeed (c : Speed) (H₀ : Rate) (L : Length) : Speed :=
  addSpeeds c (rateTimesLength H₀ L)

/-- Space-side speed in the Nathan Direct centered representation. -/
def spaceSectorSpeed (H₀ : Rate) (L : Length) : Speed :=
  rateTimesLength H₀ L

/-- Common midpoint removed by the centering operation. -/
def center (c : Speed) (H₀ : Rate) (L : Length) : Speed :=
  midpointSpeed (timeSectorSpeed c H₀ L) (spaceSectorSpeed H₀ L)

/-- The midpoint retains the common H₀L shift. -/
theorem center_value (c : Speed) (H₀ : Rate) (L : Length) :
    (center c H₀ L).value = c.value / 2 + H₀.value * L.value := by
  simp [center, midpointSpeed, timeSectorSpeed, spaceSectorSpeed,
    addSpeeds, rateTimesLength]
  ring

/-- The time-side residual is +c/2 for every physically supplied L. -/
theorem time_centered_residual (c : Speed) (H₀ : Rate) (L : Length) :
    subtractSpeeds (timeSectorSpeed c H₀ L) (center c H₀ L) =
      halfSpeed c := by
  ext
  simp [subtractSpeeds, halfSpeed, center, midpointSpeed,
    timeSectorSpeed, spaceSectorSpeed, addSpeeds, rateTimesLength]
  ring

/-- The space-side residual is -c/2 for every physically supplied L. -/
theorem space_centered_residual (c : Speed) (H₀ : Rate) (L : Length) :
    subtractSpeeds (spaceSectorSpeed H₀ L) (center c H₀ L) =
      negativeHalfSpeed c := by
  ext
  simp [subtractSpeeds, negativeHalfSpeed, center, midpointSpeed,
    timeSectorSpeed, spaceSectorSpeed, addSpeeds, rateTimesLength]
  ring

/-- Centered residuals cannot identify the length L: they are invariant
    under every change of L when the same common H₀L term is used. -/
theorem centered_residuals_independent_of_length
    (c : Speed) (H₀ : Rate) (L₁ L₂ : Length) :
    subtractSpeeds (timeSectorSpeed c H₀ L₁) (center c H₀ L₁) =
      subtractSpeeds (timeSectorSpeed c H₀ L₂) (center c H₀ L₂) ∧
    subtractSpeeds (spaceSectorSpeed H₀ L₁) (center c H₀ L₁) =
      subtractSpeeds (spaceSectorSpeed H₀ L₂) (center c H₀ L₂) := by
  constructor
  · calc
      subtractSpeeds (timeSectorSpeed c H₀ L₁) (center c H₀ L₁) =
          halfSpeed c := time_centered_residual c H₀ L₁
      _ = subtractSpeeds (timeSectorSpeed c H₀ L₂) (center c H₀ L₂) :=
          (time_centered_residual c H₀ L₂).symm
  · calc
      subtractSpeeds (spaceSectorSpeed H₀ L₁) (center c H₀ L₁) =
          negativeHalfSpeed c := space_centered_residual c H₀ L₁
      _ = subtractSpeeds (spaceSectorSpeed H₀ L₂) (center c H₀ L₂) :=
          (space_centered_residual c H₀ L₂).symm

/-- Although the residuals are scale-invariant, the uncentered midpoint
    moves with the chosen length. This is why L needs an independent basis. -/
theorem center_shift_with_length
    (c : Speed) (H₀ : Rate) (L₁ L₂ : Length) :
    (center c H₀ L₂).value - (center c H₀ L₁).value =
      H₀.value * (L₂.value - L₁.value) := by
  rw [center_value, center_value]
  ring

#print axioms HsHVerification.SableBalancedHubbleCentering.center_value
#print axioms HsHVerification.SableBalancedHubbleCentering.time_centered_residual
#print axioms HsHVerification.SableBalancedHubbleCentering.space_centered_residual
#print axioms HsHVerification.SableBalancedHubbleCentering.centered_residuals_independent_of_length
#print axioms HsHVerification.SableBalancedHubbleCentering.center_shift_with_length

end HsHVerification.SableBalancedHubbleCentering
