import Mathlib

/-!
Source-linked algebraic formalization for the PNAS turbulent-blob second-moment
readout.

Primary source: Matsuzawa et al., PNAS (2026), DOI 10.1073/pnas.2526858123,
Supplementary Information §5B, especially Eqs. (the definitions of P, Q and
R_blob^2) and the statement that q(r,t) is averaged over angles and runs.

For each run i, P i and Q i stand for the same-measure numerator and
denominator integrals of that run's energy field. The source first averages
the fields over runs and then forms the ratio. Linearity of the integrals makes
the resulting ratio a Q-weighted mean of the per-run squared-radius ratios.

This theorem does NOT establish that runs are independent, that Q is constant,
that the weighted mean equals an arithmetic mean, or that the physical
measurement and continuum reduction are correctly implemented. Those are
source/empirical questions outside this finite-sum identity.
-/

namespace HsHVerification.CalderEnsembleMoment

open scoped BigOperators

def runRadiusSquared {ι : Type*} (P Q : ι → ℝ) (i : ι) : ℝ :=
  P i / Q i

def ensembleRadiusSquared {ι : Type*} (s : Finset ι) (P Q : ι → ℝ) : ℝ :=
  s.sum P / s.sum Q

/-- The second moment of the ensemble-averaged field is the Q-weighted mean
    of the per-run second moments, provided each run denominator is positive
    and the aggregate denominator is positive. -/
theorem ensembleRadiusSquared_eq_Q_weighted_mean
    {ι : Type*} (s : Finset ι) (P Q : ι → ℝ)
    (hQ : ∀ i ∈ s, 0 < Q i)
    (hDen : 0 < s.sum Q) :
    ensembleRadiusSquared s P Q =
      (s.sum (fun i => Q i * runRadiusSquared P Q i)) / s.sum Q := by
  have hsum : s.sum (fun i => Q i * (P i / Q i)) = s.sum P := by
    refine Finset.sum_congr rfl ?_
    intro i hi
    have hQi : Q i ≠ 0 := ne_of_gt (hQ i hi)
    field_simp [hQi]
  unfold ensembleRadiusSquared runRadiusSquared
  rw [← hsum]

#print axioms ensembleRadiusSquared_eq_Q_weighted_mean

end HsHVerification.CalderEnsembleMoment
