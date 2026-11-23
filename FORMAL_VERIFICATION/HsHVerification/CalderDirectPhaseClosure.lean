import Mathlib

/-!
# Calder: direct two-component phase closure

Primary source:
* HsH raw conversation `SAT theory clarification`, blob
  `507a7000082415373ee98dbc95f18a991dff3c5a`.
* Nathan Direct user-role message
  `1f8aee04-5599-478d-a925-150ef911c896`,
  timestamp 2025-12-24T16:05:29.724Z:
  `∑ T_i cos(φ_i) = 0` and `∑ T_i sin(φ_i) = 0`.

This module formalizes only the finite-index algebraic equivalence between
those two real equations, a zero vector in ℝ², and a single complex number
whose real and imaginary parts are the two balances.

The finite index type is explicit. No positivity, nonzero-weight,
pairwise-locking, dynamical, stability, or physical-realizability assumption
is added. The symbols T and φ are treated only as real-valued indexed data.
The complex packaging is defined from the two component sums; Euler's
exponential identity is not needed for the theorem.

This does NOT prove that the closure condition is physically necessary,
that T denotes physical tension, that φ denotes a particular phase field,
or that the equation is a central SAT law. It does not prove universal
worldline encoding or a bridge between physical theories.
-/

namespace HsHVerification.CalderDirectPhaseClosure

variable {ι : Type*} [Fintype ι]

/-- The first real component of the source's finite phase-balance pair. -/
def cosineBalance (T φ : ι → ℝ) : ℝ :=
  ∑ i, T i * Real.cos (φ i)

/-- The second real component of the source's finite phase-balance pair. -/
def sineBalance (T φ : ι → ℝ) : ℝ :=
  ∑ i, T i * Real.sin (φ i)

/-- The two source equations packaged as a vector in ℝ². -/
def phaseClosureVector (T φ : ι → ℝ) : ℝ × ℝ :=
  (cosineBalance T φ, sineBalance T φ)

/-- The same two balances packaged as one complex number. -/
def phaseClosureComplex (T φ : ι → ℝ) : ℂ :=
  Complex.ofReal (cosineBalance T φ) +
    Complex.I * Complex.ofReal (sineBalance T φ)

/-- The two real source equations are exactly zero-vector closure in ℝ². -/
theorem sourcePair_iff_vectorClosure
    (T φ : ι → ℝ) :
    (cosineBalance T φ = 0 ∧ sineBalance T φ = 0) ↔
      phaseClosureVector T φ = (0, 0) := by
  simp [phaseClosureVector]

/-- The two real source equations are exactly zero of their complex packaging. -/
theorem sourcePair_iff_complexClosure
    (T φ : ι → ℝ) :
    (cosineBalance T φ = 0 ∧ sineBalance T φ = 0) ↔
      phaseClosureComplex T φ = 0 := by
  constructor
  · rintro ⟨hcos, hsin⟩
    simp [phaseClosureComplex, hcos, hsin]
  · intro h
    constructor
    · have hRe := congrArg Complex.re h
      simpa [phaseClosureComplex] using hRe
    · have hIm := congrArg Complex.im h
      simpa [phaseClosureComplex] using hIm

#print axioms sourcePair_iff_vectorClosure
#print axioms sourcePair_iff_complexClosure

end HsHVerification.CalderDirectPhaseClosure
