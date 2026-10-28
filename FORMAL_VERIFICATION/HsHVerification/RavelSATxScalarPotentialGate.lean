import Mathlib

/-!
Ravel source-fidelity audit | 2026-10-28 02:00 UTC.

Historical sources (assistant-authored formulations; not Nathan Direct):
- SAT_THEORY_ARCHIVE_2023-25/SAT X/SATx CANONICAL.txt
  Git blob afbf610347a6a39c74cf52cbe3818ef22ab3ebcf
- SAT_THEORY_ARCHIVE_2023-25/FREEFORM DISCUSSION/SAT Lagrangian and Variational Derivation.txt
  Git blob 9d5db44f16f1f2d853332efd8d91995a37e8d394
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Full Revamp.txt
  Git blob 2094f6d51c9f407a575a18057ec8330c4ae2ca72

The source scalar term is L_pot = -mu^2*cos(3*theta). Under the
standard L = kinetic - V convention, its potential is +mu^2*cos(3*theta).
These conditional theorems compare two phase locations. They do NOT prove
the source's physical field equation, H(s)H dynamics, or observational physics.
-/

namespace HsHVerification.RavelSATxScalarPotentialGate

noncomputable def inferredPotential (μ θ : ℝ) : ℝ :=
  μ ^ 2 * Real.cos (3 * θ)

theorem potential_at_aligned (μ : ℝ) :
    inferredPotential μ 0 = μ ^ 2 := by
  simp [inferredPotential]

theorem potential_at_shifted (μ : ℝ) :
    inferredPotential μ (Real.pi / 3) = -(μ ^ 2) := by
  have h : (3 : ℝ) * (Real.pi / 3) = Real.pi := by ring
  simp [inferredPotential, h, Real.cos_pi]

theorem shifted_is_lower (μ : ℝ) (hμ : 0 < μ) :
    inferredPotential μ (Real.pi / 3) < inferredPotential μ 0 := by
  rw [potential_at_shifted, potential_at_aligned]
  have hp : 0 < μ ^ 2 := pow_pos hμ 2
  linarith

theorem printed_potential_opposite (μ θ : ℝ) :
    inferredPotential μ θ = -(-(μ ^ 2 * Real.cos (3 * θ))) := by
  simp [inferredPotential]

end HsHVerification.RavelSATxScalarPotentialGate
