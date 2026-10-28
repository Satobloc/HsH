import Mathlib

/-!
# Conditional spinor-sign projection, source-anchored to Danner et al. (2020)

Actual physical system: neutron interferometry at ILL S18, DOI
10.1038/s41534-020-0254-8. This real two-coordinate slice is NOT
a complete complex spinor model, nor a new H(s)H prediction.
-/
namespace HsHVerification.AlberrSpinorSignProjection
def spinZ (a b : ℝ) : ℝ := a * a - b * b
def spinX (a b : ℝ) : ℝ := 2 * a * b
theorem spinZ_sign_invisible (a b : ℝ) :
    spinZ (-a) (-b) = spinZ a b := by
  unfold spinZ
  ring
theorem spinX_sign_invisible (a b : ℝ) :
    spinX (-a) (-b) = spinX a b := by
  unfold spinX
  ring
theorem spin_pair_sign_invisible (a b : ℝ) :
    (spinZ (-a) (-b), spinX (-a) (-b)) =
    (spinZ a b, spinX a b) := by
  simp [spinZ_sign_invisible, spinX_sign_invisible]
#print axioms spinZ_sign_invisible
#print axioms spinX_sign_invisible
#print axioms spin_pair_sign_invisible
end HsHVerification.AlberrSpinorSignProjection
