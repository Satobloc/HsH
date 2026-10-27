import Mathlib

/-!
# Cosmological UI source-fidelity: formal reference surfaces vs physical fronts

Source layer A: Nathan Direct in DEVELOPMENT_FULL_CONVOS/COSMO.txt,
Git blob c134a02db2a07723e0dc0d62efd7ae9083788f22:
"The spheres are purely formal reference surfaces."
Source layer B: Nathan's later correction in 🔑/🔑.md,
Git blob c05b39f8a84bcc95bcc59c9e09f8a3ac98064cab:
"No dual shell nor multiple-speed expansion need be posited at all."

The assistant-authored COSMO two-front model is a REPRESENTATION, not
evidence of two independent physical expanding shells.

Theorems below prove only properties of abstract reference pairs and
diagonal rescaling. They do NOT prove a GR metric, a physical Hubble
gradient, cosmological observations, or any physical H(s)H premise.
-/

namespace HsHVerification

structure CosmoFrontPair where
  inner : ℝ
  outer : ℝ

def cosmoGap (p : CosmoFrontPair) : ℝ := p.outer - p.inner

def cosmoCommonShift (d : ℝ) (p : CosmoFrontPair) : CosmoFrontPair :=
  ⟨p.inner + d, p.outer + d⟩

theorem cosmoGap_commonShift_invariant (p : CosmoFrontPair) (d : ℝ) :
    cosmoGap (cosmoCommonShift d p) = cosmoGap p := by
  dsimp [cosmoGap, cosmoCommonShift]
  ring

theorem cosmoCommonShift_distinct (p : CosmoFrontPair) (d : ℝ)
    (hd : d ≠ 0) : cosmoCommonShift d p ≠ p := by
  intro heq
  have hi : p.inner + d = p.inner := by
    exact congrArg CosmoFrontPair.inner heq
  have hd0 : d = 0 := by linarith
  exact hd hd0

theorem cosmoGap_not_injective : ¬ Function.Injective cosmoGap := by
  intro hinj
  let p : CosmoFrontPair := ⟨0, 0⟩
  have hsame : cosmoGap (cosmoCommonShift 1 p) = cosmoGap p :=
    cosmoGap_commonShift_invariant p 1
  have heq : cosmoCommonShift 1 p = p := hinj hsame
  exact cosmoCommonShift_distinct p 1 (by norm_num) heq

def cosmoDiagonalScale (rates v : Fin 4 → ℝ) : Fin 4 → ℝ :=
  fun i => rates i * v i

def cosmoFirstAxis (t : ℝ) : Fin 4 → ℝ :=
  fun i => if i = 0 then t else 0

theorem cosmoDiagonalScale_axis_preserved (rates : Fin 4 → ℝ) (t : ℝ) :
    cosmoDiagonalScale rates (cosmoFirstAxis t) =
      cosmoFirstAxis (rates 0 * t) := by
  funext i
  by_cases hi : i = 0
  · subst i
    simp [cosmoDiagonalScale, cosmoFirstAxis]
  · simp [cosmoDiagonalScale, cosmoFirstAxis, hi]

theorem cosmoHubbleRadius_definitional (H c : ℝ) (hH : H ≠ 0) :
    H * (c / H) = c := by
  field_simp
  ring

#print axioms HsHVerification.cosmoGap_commonShift_invariant
#print axioms HsHVerification.cosmoCommonShift_distinct
#print axioms HsHVerification.cosmoGap_not_injective
#print axioms HsHVerification.cosmoDiagonalScale_axis_preserved
#print axioms HsHVerification.cosmoHubbleRadius_definitional

end HsHVerification
