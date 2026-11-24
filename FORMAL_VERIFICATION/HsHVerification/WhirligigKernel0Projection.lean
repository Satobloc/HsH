import Mathlib

/-!
# Whirligig Kernel 0: restricted exact identities

Source status:
- The historical design intent is anchored in the role-tagged raw conversation
  "Ontology and Math Check" (conversation
  `69b3b56e-7540-8325-b93b-e9331fe95430`), especially Nathan Direct messages
  `da8dbf89-5a15-48b7-8b18-9dd6f68a1d04`,
  `e0fb5c67-8c3b-4cc2-9f73-8e53c8c1b7a9`, and
  `4a814129-9467-4fb0-a9c2-d118674c635b`.
- The formalized equations themselves come from the later assistant-maintained
  sandbox `WHIRLIGIG_KERNEL_0.md` (2026-09-20; blob
  `2da529d90335bb3d557199f2853cffb039bb4a66`). They are an assistant
  reconstruction, not Nathan Direct equations and not a physical model.

This module checks only:
1. exact recovery of two orthogonal planar inputs from their four-coordinate
   composite;
2. the constant squared radius of the restricted double-circle carrier;
3. the invertible derivative-state scaling and residual relation for the
   restricted harmonic-oscillator coefficient transformation.

It does not prove an arbitrary equation-to-curve encoder, the historical
Whirligig UI's shortest-derivation search, a map from the 3D mechanical toy to
the 4D carrier, or any GR/QM/physical equivalence.
-/

namespace HsHVerification.WhirligigKernel0Projection

structure Vec2 where
  x : ℝ
  y : ℝ
deriving DecidableEq

structure Vec4 where
  x1 : ℝ
  x2 : ℝ
  x3 : ℝ
  x4 : ℝ
deriving DecidableEq

/-- Orthogonal product encoding of two planar states into four coordinates. -/
def compose (p q : Vec2) : Vec4 := ⟨p.x, p.y, q.x, q.y⟩

/-- Decode the first coordinate plane. -/
def project12 (v : Vec4) : Vec2 := ⟨v.x1, v.x2⟩

/-- Decode the second coordinate plane. -/
def project34 (v : Vec4) : Vec2 := ⟨v.x3, v.x4⟩

theorem project12_recovers_left (p q : Vec2) :
    project12 (compose p q) = p := by
  cases p
  rfl

theorem project34_recovers_right (p q : Vec2) :
    project34 (compose p q) = q := by
  cases q
  rfl

/-- Both inputs are recovered pointwise; the restricted product encoding is lossless. -/
theorem decode_composite (p q : Vec2) :
    (project12 (compose p q), project34 (compose p q)) = (p, q) := by
  simp [project12, project34, compose]

def circle (r θ : ℝ) : Vec2 :=
  ⟨r * Real.cos θ, r * Real.sin θ⟩

def phaseComposite (a b θ φ : ℝ) : Vec4 :=
  compose (circle a θ) (circle b φ)

def euclideanSq (v : Vec4) : ℝ :=
  v.x1 ^ 2 + v.x2 ^ 2 + v.x3 ^ 2 + v.x4 ^ 2

/-- The restricted two-plane carrier lies on one fixed S^3 when its radii are fixed. -/
theorem phase_composite_radius_sq (a b θ φ : ℝ) :
    euclideanSq (phaseComposite a b θ φ) = a ^ 2 + b ^ 2 := by
  change (a * Real.cos θ) ^ 2 + (a * Real.sin θ) ^ 2 +
    (b * Real.cos φ) ^ 2 + (b * Real.sin φ) ^ 2 = a ^ 2 + b ^ 2
  have hθ : Real.cos θ ^ 2 + Real.sin θ ^ 2 = 1 := by
    nlinarith [Real.sin_sq_add_cos_sq θ]
  have hφ : Real.cos φ ^ 2 + Real.sin φ ^ 2 = 1 := by
    nlinarith [Real.sin_sq_add_cos_sq φ]
  calc
    (a * Real.cos θ) ^ 2 + (a * Real.sin θ) ^ 2 +
      (b * Real.cos φ) ^ 2 + (b * Real.sin φ) ^ 2
      = a ^ 2 * (Real.cos θ ^ 2 + Real.sin θ ^ 2) +
        b ^ 2 * (Real.cos φ ^ 2 + Real.sin φ ^ 2) := by ring
    _ = a ^ 2 + b ^ 2 := by rw [hθ, hφ]

structure Jet2 where
  y0 : ℝ
  y1 : ℝ
  y2 : ℝ

/-- Algebraic second-derivative state for the oscillator equation y'' + ω²y = 0. -/
def oscillatorResidual (ω : ℝ) (j : Jet2) : ℝ :=
  j.y2 + ω ^ 2 * j.y0

/-- Constant coordinate scaling X = a x, Y₁ = y'/a, Y₂ = y''/a². -/
def scaleJet (a : ℝ) (j : Jet2) : Jet2 :=
  ⟨j.y0, j.y1 / a, j.y2 / a ^ 2⟩

/-- The derivative-state scaling has an explicit inverse whenever a ≠ 0. -/
theorem scaleJet_roundtrip (a : ℝ) (ha : a ≠ 0) (j : Jet2) :
    scaleJet (1 / a) (scaleJet a j) = j := by
  cases j with
  | mk y0 y1 y2 =>
      simp [scaleJet, ha]
      <;> field_simp [ha]
      <;> ring

/-- The W6a frequency scale matches the two oscillator coefficients for nonzero frequencies. -/
theorem oscillator_scale_coefficient
    (ω₁ ω₂ : ℝ) (h₁ : ω₁ ≠ 0) (h₂ : ω₂ ≠ 0) :
    ω₁ ^ 2 / (ω₁ / ω₂) ^ 2 = ω₂ ^ 2 := by
  field_simp [h₁, h₂]
  <;> ring

/-- Under the coefficient match, the transformed oscillator residual is the source residual
    multiplied by the nonzero scale factor 1/a². -/
theorem oscillator_residual_scale
    (ω₁ ω₂ a : ℝ) (hfreq : ω₁ ^ 2 / a ^ 2 = ω₂ ^ 2) (j : Jet2) :
    oscillatorResidual ω₂ (scaleJet a j) =
      oscillatorResidual ω₁ j / a ^ 2 := by
  change j.y2 / a ^ 2 + ω₂ ^ 2 * j.y0 =
    (j.y2 + ω₁ ^ 2 * j.y0) / a ^ 2
  calc
    j.y2 / a ^ 2 + ω₂ ^ 2 * j.y0 =
      j.y2 / a ^ 2 + (ω₁ ^ 2 / a ^ 2) * j.y0 := by rw [← hfreq]
    _ = (j.y2 + ω₁ ^ 2 * j.y0) / a ^ 2 := by ring

/-- The W6a transformation preserves the zero set of the derivative-state constraint. -/
theorem oscillator_zero_set_equivalence
    (ω₁ ω₂ a : ℝ) (ha : a ≠ 0)
    (hfreq : ω₁ ^ 2 / a ^ 2 = ω₂ ^ 2) (j : Jet2) :
    oscillatorResidual ω₂ (scaleJet a j) = 0 ↔
      oscillatorResidual ω₁ j = 0 := by
  rw [oscillator_residual_scale ω₁ ω₂ a hfreq j]
  have ha2 : a ^ 2 ≠ 0 := pow_ne_zero 2 ha
  constructor
  · intro h
    exact (div_eq_zero_iff ha2).mp h
  · intro h
    simp [h]

/-- Specialization to the frequency ratio a = ω₁/ω₂. -/
theorem oscillator_residual_scale_from_frequency_ratio
    (ω₁ ω₂ : ℝ) (h₁ : ω₁ ≠ 0) (h₂ : ω₂ ≠ 0) (j : Jet2) :
    oscillatorResidual ω₂ (scaleJet (ω₁ / ω₂) j) =
      oscillatorResidual ω₁ j / (ω₁ / ω₂) ^ 2 := by
  exact oscillator_residual_scale ω₁ ω₂ (ω₁ / ω₂)
    (oscillator_scale_coefficient ω₁ ω₂ h₁ h₂) j

end HsHVerification.WhirligigKernel0Projection
