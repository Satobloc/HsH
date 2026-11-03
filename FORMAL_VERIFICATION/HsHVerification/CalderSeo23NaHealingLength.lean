import Mathlib

namespace HsHVerification


/-!
Conditional numerical check of the healing length for the 23Na experiment in
Seo et al. (2017), Scientific Reports 7, 4587.

The paper reports μ ≈ h × 510 Hz and defines ξ = ℏ / sqrt(2 m μ).
The mass and constants below are central/rounded CODATA/NIST values. The
theorems verify only the arithmetic interval implied by those inputs. They
do not validate the experimental μ, the physical formula, or any H(s)H map.
All quantities are SI numerical magnitudes; xiUm is expressed in micrometres.
-/

def na23MassKg : ℝ :=
  (22.9897692820 : ℝ) * (1.66053906892e-27 : ℝ)

def planckJSeconds : ℝ := 6.62607015e-34

def chemicalPotentialJ : ℝ :=
  planckJSeconds * 510

def hbarMicroJSeconds : ℝ :=
  (1.054571817e-34 : ℝ) * 1e6

def healingDenominator : ℝ :=
  2 * na23MassKg * chemicalPotentialJ

noncomputable def xiUm : ℝ :=
  hbarMicroJSeconds / Real.sqrt healingDenominator

theorem healingDenominator_pos : 0 < healingDenominator := by
  norm_num [healingDenominator, na23MassKg, chemicalPotentialJ, planckJSeconds]

theorem hbarMicroJSeconds_pos : 0 < hbarMicroJSeconds := by
  norm_num [hbarMicroJSeconds]

theorem xi_um_lower_bound : (6565 / 10000 : ℝ) < xiUm := by
  have hD := healingDenominator_pos
  have hs : 0 < Real.sqrt healingDenominator := Real.sqrt_pos.2 hD
  have hsq :
      ((6565 / 10000 : ℝ) * Real.sqrt healingDenominator)^2
        < hbarMicroJSeconds^2 := by
    rw [mul_pow, Real.sq_sqrt (le_of_lt hD)]
    norm_num [healingDenominator, na23MassKg, chemicalPotentialJ,
      planckJSeconds, hbarMicroJSeconds]
  have hprod :
      (6565 / 10000 : ℝ) * Real.sqrt healingDenominator
        < hbarMicroJSeconds := by
    nlinarith [hsq, hbarMicroJSeconds_pos,
      mul_pos (by norm_num : 0 < (6565 / 10000 : ℝ)) hs]
  exact (lt_div_iff₀ hs).2 hprod

theorem xi_um_upper_bound : xiUm < (6566 / 10000 : ℝ) := by
  have hD := healingDenominator_pos
  have hs : 0 < Real.sqrt healingDenominator := Real.sqrt_pos.2 hD
  have hsq :
      hbarMicroJSeconds^2
        < ((6566 / 10000 : ℝ) * Real.sqrt healingDenominator)^2 := by
    rw [mul_pow, Real.sq_sqrt (le_of_lt hD)]
    norm_num [healingDenominator, na23MassKg, chemicalPotentialJ,
      planckJSeconds, hbarMicroJSeconds]
  have hprod :
      hbarMicroJSeconds
        < (6566 / 10000 : ℝ) * Real.sqrt healingDenominator := by
    nlinarith [hsq, hbarMicroJSeconds_pos,
      mul_pos (by norm_num : 0 < (6566 / 10000 : ℝ)) hs]
  exact (div_lt_iff₀ hs).2 hprod

#print axioms xi_um_lower_bound
#print axioms xi_um_upper_bound

end HsHVerification
