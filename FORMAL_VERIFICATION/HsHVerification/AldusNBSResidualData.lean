import Mathlib

/-!
Aldus source-critical metrology gate, 2026-10-29 21:24 UTC.
REAL SYSTEM: saturated solid D2 measurements compiled in NBS Technical Note 641
(1973), printed p.14, Table 2-8. Formula is the historical Ludtke/Roder
EMPIRICAL EVALUATION, not a directly measured density or CODATA constant.
Source: https://nvlpubs.nist.gov/nistpubs/Legacy/TN/nbstechnicalnote641.pdf
Table mixes "various", para, normal and normal=ortho samples.
All exact rational statements are conditional on source transcription.
No statistical uncertainty, H(s)H readout or physical validation is proved.
-/

namespace HsHVerification.AldusNBSResidualData

def rhoFit (t : ℚ) : ℚ :=
  (20459 : ℚ) / 100000 - ((26337 : ℚ) / 1000000000) * t ^ 2

theorem nbs_fit_at_165 :
    rhoFit ((33 : ℚ) / 20) =
      (2045182975175 : ℚ) / 10000000000000 := by
  norm_num [rhoFit]

theorem nbs_1175_below_fit :
    (2040 : ℚ) / 10000 < rhoFit ((1175 : ℚ) / 1000) := by
  norm_num [rhoFit]

theorem nbs_1450_below_fit :
    (2036 : ℚ) / 10000 < rhoFit ((1450 : ℚ) / 1000) := by
  norm_num [rhoFit]

theorem nbs_4200_above_fit :
    rhoFit ((4200 : ℚ) / 1000) < (2059 : ℚ) / 10000 := by
  norm_num [rhoFit]

theorem nbs_13000_above_fit :
    rhoFit (13 : ℚ) < (2004 : ℚ) / 10000 := by
  norm_num [rhoFit]

theorem nbs_17000_below_fit :
    (1951 : ℚ) / 10000 < rhoFit (17 : ℚ) := by
  norm_num [rhoFit]

theorem nbs_18723_above_fit :
    rhoFit ((18723 : ℚ) / 1000) < (1967 : ℚ) / 10000 := by
  norm_num [rhoFit]

#print axioms nbs_fit_at_165
#print axioms nbs_1175_below_fit
#print axioms nbs_1450_below_fit
#print axioms nbs_4200_above_fit
#print axioms nbs_13000_above_fit
#print axioms nbs_17000_below_fit
#print axioms nbs_18723_above_fit

end HsHVerification.AldusNBSResidualData
