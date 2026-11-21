import Mathlib

namespace HsHVerification.QGITimingAccounting

/-!
# QGI timing-convention source audit

This module formalizes arithmetic consequences of source-reported nominal
durations in the quantum Galileo interferometer described by Dobkowski et al.

The published 2026 main text gives:
* holding duration T_h = 2272 microseconds;
* mechanical delay T_d = 71 microseconds;
* holding-pulse rise/fall time tau_h = 12 microseconds;
* kick duration T_kick = 80 microseconds;
* T_h = 2T - 2T_d;
* 2 T_eff = T_h + 2 tau_h + 2 T_d + T_kick = 2T + 80 microseconds.

The accessible v3 arXiv supplementary derivation uses T_d = 71 + 6
microseconds for the analytical phase plot, adding half the holding-pulse
rise time to the delay. The final published supplementary PDF was listed by
PMC but was not accessible in this run. Whether the final supplement retains
or revises that convention remains an external source question.

All constants below are nominal source values in microseconds. These theorems
prove only the arithmetic consequences of the stated conventions. They do
not establish which convention the final published analysis used, do not
reprocess raw experimental data, and do not validate a physical model.
-/

def holdingDurationUs : ℚ := 2272
def mechanicalDelayUs : ℚ := 71
def holdingRiseTimeUs : ℚ := 12
def kickDurationUs : ℚ := 80

/-- 2T inferred from the published main-text relation T_h = 2T - 2T_d. -/
def twoTFromPublishedMainTextUs : ℚ :=
  holdingDurationUs + 2 * mechanicalDelayUs

/-- The v3 preprint supplement's analytical-plot delay: T_d + tau_h/2. -/
def analyticDelayInPreprintV3Us : ℚ :=
  mechanicalDelayUs + holdingRiseTimeUs / 2

/-- 2T inferred from T_h = 2T - 2(T_d + tau_h/2) in that analytic convention. -/
def twoTFromPreprintAnalyticConventionUs : ℚ :=
  holdingDurationUs + 2 * analyticDelayInPreprintV3Us

/-- Effective ballistic duration as printed in the published Methods. -/
def effectiveBallisticDurationUs : ℚ :=
  holdingDurationUs + 2 * holdingRiseTimeUs +
    2 * mechanicalDelayUs + kickDurationUs

/-- 2T inferred from 2T_eff = 2T + T_kick. -/
def twoTInferredFromEffectiveDurationUs : ℚ :=
  effectiveBallisticDurationUs - kickDurationUs

theorem published_main_text_twoT_is_2414 :
    twoTFromPublishedMainTextUs = 2414 := by
  norm_num [twoTFromPublishedMainTextUs, holdingDurationUs, mechanicalDelayUs]

theorem preprint_analytic_twoT_is_2426 :
    twoTFromPreprintAnalyticConventionUs = 2426 := by
  norm_num [twoTFromPreprintAnalyticConventionUs,
    analyticDelayInPreprintV3Us, holdingDurationUs,
    mechanicalDelayUs, holdingRiseTimeUs]

theorem effective_duration_twoT_is_2438 :
    twoTInferredFromEffectiveDurationUs = 2438 := by
  norm_num [twoTInferredFromEffectiveDurationUs,
    effectiveBallisticDurationUs, holdingDurationUs,
    holdingRiseTimeUs, mechanicalDelayUs, kickDurationUs]

theorem main_to_preprint_coordinate_gap_is_one_rise_time :
    twoTFromPreprintAnalyticConventionUs -
      twoTFromPublishedMainTextUs = holdingRiseTimeUs := by
  norm_num [twoTFromPreprintAnalyticConventionUs,
    twoTFromPublishedMainTextUs, analyticDelayInPreprintV3Us,
    holdingDurationUs, mechanicalDelayUs, holdingRiseTimeUs]

theorem preprint_to_effective_coordinate_gap_is_one_rise_time :
    twoTInferredFromEffectiveDurationUs -
      twoTFromPreprintAnalyticConventionUs = holdingRiseTimeUs := by
  norm_num [twoTInferredFromEffectiveDurationUs,
    effectiveBallisticDurationUs, twoTFromPreprintAnalyticConventionUs,
    analyticDelayInPreprintV3Us, holdingDurationUs,
    holdingRiseTimeUs, mechanicalDelayUs, kickDurationUs]

theorem main_to_effective_coordinate_gap_is_two_rise_times :
    twoTInferredFromEffectiveDurationUs -
      twoTFromPublishedMainTextUs = 2 * holdingRiseTimeUs := by
  norm_num [twoTInferredFromEffectiveDurationUs,
    effectiveBallisticDurationUs, twoTFromPublishedMainTextUs,
    holdingDurationUs, holdingRiseTimeUs, mechanicalDelayUs,
    kickDurationUs]

/-- The dimensionless finite-pulse phase kernel from published Eq. (5),
    with T, T_kick, and T_d all expressed in the same time unit. The result
    has units of time cubed; the common physical prefactor cancels in ratios. -/
def finitePulsePhaseKernel (T Tkick Td : ℚ) : ℚ :=
  T ^ 3 + T ^ 2 * Tkick +
    T * (Tkick ^ 2 + Tkick * Td) -
    Td * (Tkick + Td) ^ 2

def mainTextPhaseKernelUsCubed : ℚ :=
  finitePulsePhaseKernel
    (twoTFromPublishedMainTextUs / 2)
    kickDurationUs
    mechanicalDelayUs

def preprintAnalyticPhaseKernelUsCubed : ℚ :=
  finitePulsePhaseKernel
    (twoTFromPreprintAnalyticConventionUs / 2)
    kickDurationUs
    analyticDelayInPreprintV3Us

/-- Exact source-variant ratio for the Eq. (5) kernel under the two
    documented nominal parameterizations. This is sensitivity arithmetic,
    not a measured phase ratio or an uncertainty interval. -/
theorem preprint_to_main_phase_kernel_ratio_exact :
    preprintAnalyticPhaseKernelUsCubed /
      mainTextPhaseKernelUsCubed = (562153 : ℚ) / 553969 := by
  norm_num [preprintAnalyticPhaseKernelUsCubed,
    mainTextPhaseKernelUsCubed, finitePulsePhaseKernel,
    twoTFromPreprintAnalyticConventionUs,
    twoTFromPublishedMainTextUs, analyticDelayInPreprintV3Us,
    holdingDurationUs, holdingRiseTimeUs, mechanicalDelayUs,
    kickDurationUs, twoTFromPublishedMainTextUs]

theorem preprint_to_main_phase_kernel_ratio_between_1_014_and_1_016 :
    (1014 : ℚ) / 1000 <
      preprintAnalyticPhaseKernelUsCubed /
        mainTextPhaseKernelUsCubed ∧
    preprintAnalyticPhaseKernelUsCubed /
      mainTextPhaseKernelUsCubed < (1016 : ℚ) / 1000 := by
  norm_num [preprint_to_main_phase_kernel_ratio_exact]

#print axioms published_main_text_twoT_is_2414
#print axioms preprint_analytic_twoT_is_2426
#print axioms effective_duration_twoT_is_2438
#print axioms main_to_preprint_coordinate_gap_is_one_rise_time
#print axioms preprint_to_effective_coordinate_gap_is_one_rise_time
#print axioms main_to_effective_coordinate_gap_is_two_rise_times
#print axioms preprint_to_main_phase_kernel_ratio_exact
#print axioms preprint_to_main_phase_kernel_ratio_between_1_014_and_1_016

end HsHVerification.QGITimingAccounting

open HsHVerification.QGITimingAccounting

/-- Executed values are retained in the CI log as a separate check from
    theorem compilation. -/
#eval twoTFromPublishedMainTextUs
#eval twoTFromPreprintAnalyticConventionUs
#eval twoTInferredFromEffectiveDurationUs
#eval preprintAnalyticPhaseKernelUsCubed / mainTextPhaseKernelUsCubed

