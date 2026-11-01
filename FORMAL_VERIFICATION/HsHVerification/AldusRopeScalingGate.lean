import Mathlib
import HsHVerification.AldusRopeSourceGate

/-!
Aldus 2026-10-28: a restricted comparator, not a theory claim.
The simple universal law impact force = k * nominal diameter squared
is an explicitly stated TEST HYPOTHESIS. It is not attributed to Nathan,
Petzl, UIAA, or H(s)H. No assertion is made about actual torsional stiffness.
The printed manufacturer specifications are not independent raw experiments.
-/

namespace HsHVerification.AldusRopeScalingGate

open HsHVerification.AldusRopeSourceGate

theorem no_shared_positive_area_coefficient (k : ℚ) (hk : 0 < k)
    (hm : mamboImpactKN = k * mamboDiameterMM ^ 2)
    (hv : voltaImpactKN = k * voltaDiameterMM ^ 2) : False := by
  have hd : voltaDiameterMM ^ 2 < mamboDiameterMM ^ 2 := by
    norm_num [voltaDiameterMM, mamboDiameterMM]
  have hreverse : voltaImpactKN < mamboImpactKN := by
    calc
      voltaImpactKN = k * voltaDiameterMM ^ 2 := hv
      _ < k * mamboDiameterMM ^ 2 := mul_lt_mul_of_pos_left hd hk
      _ = mamboImpactKN := hm.symm
  exact (lt_irrefl _ (lt_trans source_impact_order hreverse))

theorem no_universal_positive_area_law :
    ¬ ∃ k : ℚ, 0 < k ∧
      mamboImpactKN = k * mamboDiameterMM ^ 2 ∧
      voltaImpactKN = k * voltaDiameterMM ^ 2 := by
  rintro ⟨k, hk, hm, hv⟩
  exact no_shared_positive_area_coefficient k hk hm hv

theorem any_positive_area_law_reverses_order (k : ℚ) (hk : 0 < k) :
    k * voltaDiameterMM ^ 2 < k * mamboDiameterMM ^ 2 := by
  have hd : voltaDiameterMM ^ 2 < mamboDiameterMM ^ 2 := by
    norm_num [voltaDiameterMM, mamboDiameterMM]
  exact mul_lt_mul_of_pos_left hd hk

#print axioms no_shared_positive_area_coefficient
#print axioms no_universal_positive_area_law
#print axioms any_positive_area_law_reverses_order

end HsHVerification.AldusRopeScalingGate
