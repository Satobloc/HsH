import Mathlib

/-!
# Morrow: source-fidelity gate for the current spherical Analemma carrier

Historical geometry: SAT_THEORY_ARCHIVE_2023-25
`_AUTO_EXTRACTED_TEXT/FINDING THE DONUT (nolat).txt`,
blob a788b5cc415f90de2d0382d3596ef07d68604687, pp. 26-27:
the source requires a self-intersection at i_r and a separate
self-tangent at the antipodal point t_ipode.

Current browser source: HsH
`PUBLIC_SITE/instruments/whirligig/index.html`,
blob c6c2edb52b09c94e9bfacf13458381c8fb423cf3,
`analemma(t,a) = unit([-1,a*sin(t),a*(sin(2*t)+.27*sin(t))])`.
The current descriptive contract is
`PUBLIC_SITE/instruments/whirligig/ANALEMMA_CORRECTION_2026-10-21.md`,
blob ac8b47e753911b3ed11df6d37a0d62a1cbec414e.

The formal propositions below apply to every normalized vector of the
form (-1,y,z). The actual sine-based Analemma is an instance because
its first unnormalized coordinate is always -1. Theorems do not
prove the source attribution, rolling contact, physical meaning,
or that the later user's correction retained the historical antipode
constraint. This is a conditional *representation* incompatibility.
-/

namespace HsHVerification.MorrowAnalemmaAntipode

noncomputable def normalizedX (y z : ℝ) : ℝ :=
  (-1 : ℝ) / Real.sqrt (1 + y ^ 2 + z ^ 2)

theorem denominator_pos (y z : ℝ) :
    0 < Real.sqrt (1 + y ^ 2 + z ^ 2) := by
  apply Real.sqrt_pos.2
  positivity

theorem normalizedX_neg (y z : ℝ) :
    normalizedX y z < 0 := by
  unfold normalizedX
  exact div_neg_of_neg_of_pos (by norm_num) (denominator_pos y z)

theorem no_antipodal_pair (y z y' z' : ℝ) :
    normalizedX y z ≠ -normalizedX y' z' := by
  have h1 := normalizedX_neg y z
  have h2 := normalizedX_neg y' z'
  intro heq
  linarith

end HsHVerification.MorrowAnalemmaAntipode
