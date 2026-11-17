import Mathlib

/-!
# Hale: source-indexed GW170814 published Bayes-factor calibration

Real observed system: GW170814, LIGO Hanford, LIGO Livingston and Virgo,
2017-08-14 10:30:43 UTC. The dimensionless input numbers below are
PUBLISHED ANALYSIS OUTPUTS, not independent observations of the likelihood,
and not SAT/H(s)H predictions.

Hiroki Takeda, Soichiro Morisaki, Atsushi Nishizawa, Phys Rev D 103,
064037 (2021), DOI 10.1103/PhysRevD.103.064037:
  - Their abstract and section VI.A: reported log B_TV = 2.775, log B_TS = 3.636.
  - Their introduction, citing earlier LIGO-Virgo analyses:
    reported log B_TV = 1.48, log B_TS = 2.34.
    This earlier attribution must be audited: the original LIGO-Virgo
    GW170814 2017 paper reports B_TV > 200, B_TS > 1000,
    not those two rounded natural-log numbers.

CAUTION: Section VI.A typesets 'ln B' while Figures 7-8 plot ordinary\nBayes factors near 10^2.775 and 10^3.636, apparently using base-10.\nNeither exponential conversion is established without resolving this\nsource-internal notation/plot discrepancy. Earlier report issue #1020\nincorrectly treated the values as natural logs; correction issued.\n\nThis module encodes the four printed DECIMAL VALUES AS RATIONALS and
proves only exact arithmetic and nonuniqueness of a source-free number.
It does NOT claim any one value is the true physical Bayes factor, nor
infer that SAT predicts GW polarization. Published ln B values are
rounded and may reflect distinct waveform assumptions, likelihoods,
priors, calibration or data versions.

Nathan Direct original geometry checked first: 2026-09-07 raw-user-role
message 496a15ea-0263-459d-b815-908f52155b90,
HsH verified batch 2026-09-13-RAVEL-SPRING-WORLDTUBE-05.md,
blob 0d948062a064ee3db0d5bc39ce0ad46829e222d4.
Nathan distinguished full 4D carrier from its 3D timesheet readout.
He did NOT specify a GW polarization likelihood or BF in that message.
-/

namespace HsHVerification.HaleGW170814EvidenceCalibration

/-- Earlier LVC ln B_TV as reported in Takeda et al. introduction. -/
def earlierReportedTV : ℚ := 148 / 100

/-- Earlier LVC ln B_TS as reported in Takeda et al. introduction. -/
def earlierReportedTS : ℚ := 234 / 100

/-- Takeda et al. 2021 printed log B_TV, direct result in section VI.A. -/
def takedaTV : ℚ := 2775 / 1000

/-- Takeda et al. 2021 printed log B_TS, direct result in section VI.A. -/
def takedaTS : ℚ := 3636 / 1000

theorem published_vector_logs_distinct : earlierReportedTV ≠ takedaTV := by
  norm_num [earlierReportedTV, takedaTV]

theorem published_scalar_logs_distinct : earlierReportedTS ≠ takedaTS := by
  norm_num [earlierReportedTS, takedaTS]

theorem published_vector_order : earlierReportedTV < takedaTV := by
  norm_num [earlierReportedTV, takedaTV]

theorem published_scalar_order : earlierReportedTS < takedaTS := by
  norm_num [earlierReportedTS, takedaTS]

theorem published_vector_log_difference :
    takedaTV - earlierReportedTV = 259 / 200 := by
  norm_num [takedaTV, earlierReportedTV]

theorem published_scalar_log_difference :
    takedaTS - earlierReportedTS = 162 / 125 := by
  norm_num [takedaTS, earlierReportedTS]

/-- One event name alone cannot identify both distinct printed numbers. -/
theorem no_unique_source_free_vector_log :
    ¬ ∃ b : ℚ, b = earlierReportedTV ∧ b = takedaTV := by
  rintro ⟨b, h₁, h₂⟩
  exact published_vector_logs_distinct (h₁.symm.trans h₂)

theorem no_unique_source_free_scalar_log :
    ¬ ∃ b : ℚ, b = earlierReportedTS ∧ b = takedaTS := by
  rintro ⟨b, h₁, h₂⟩
  exact published_scalar_logs_distinct (h₁.symm.trans h₂)

#print axioms published_vector_logs_distinct
#print axioms published_scalar_logs_distinct
#print axioms published_vector_log_difference
#print axioms published_scalar_log_difference
#print axioms no_unique_source_free_vector_log
#print axioms no_unique_source_free_scalar_log

end HsHVerification.HaleGW170814EvidenceCalibration
