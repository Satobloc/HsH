import Mathlib
import HsHVerification.MorrowABFlux

/-!
# Morrow: exact AB phase-parity class (conditional mathematics)

Osakabe et al. (1986) report electron-holography relative
phase classes 0 or pi for flux quantized in units h/(2e).
This module formalizes the parity classifier only.
It does NOT establish a physical field-free region, raw
uncertainties, independently measured flux n, or H(s)H.
-/

namespace HsHVerification.MorrowABParity

/-- Parity of the integer superconducting flux quantum count. -/
def phaseClass (n : ℕ) : ℕ := n % 2

theorem even_flux_phase_class (n : ℕ) :
    phaseClass (2 * n) = 0 := by
  simp [phaseClass]

theorem odd_flux_phase_class (n : ℕ) :
    phaseClass (2 * n + 1) = 1 := by
  omega

theorem phase_class_exhaustive (n : ℕ) :
    phaseClass n = 0 ∨ phaseClass n = 1 := by
  unfold phaseClass
  omega

theorem phase_class_two_periodic (n : ℕ) :
    phaseClass (n + 2) = phaseClass n := by
  unfold phaseClass
  omega

#print axioms even_flux_phase_class
#print axioms odd_flux_phase_class
#print axioms phase_class_exhaustive
#print axioms phase_class_two_periodic

end HsHVerification.MorrowABParity
