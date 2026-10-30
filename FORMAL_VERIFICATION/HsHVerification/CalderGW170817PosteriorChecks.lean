import Mathlib
import HsHVerification.CalderGW170817TidalMap

/-!
Source-anchored interval and domain arithmetic for GW170817.

Primary source: LIGO Scientific Collaboration and Virgo Collaboration,
"Properties of the Binary Neutron Star Merger GW170817",
Phys. Rev. X 9, 011001 (2019), Table II and Table IV,
DOI 10.1103/PhysRevX.9.011001.

Table II, PhenomPNRT:
* low-spin (chi_i <= 0.05): q in (0.73,1.00), 90% HPD tilde-Lambda [70,720];
* high-spin (chi_i <= 0.89): q in (0.53,1.00), one-sided 90% tilde-Lambda [0,630].

Table IV reports low-spin HPD upper endpoints 830 (TaylorF2), 690 (SEOBNRT),
and 730 (PhenomDNRT), compared with 720 for PhenomPNRT.  High-spin upper
endpoints are 730, 630, and 640, compared with 630 for PhenomPNRT.

The Raithel-Ozel-Psaltis 2018 common-radius relation states a validity domain
q >= 0.6.  The low-spin q interval lies within that domain; the high-spin q
interval extends below it.  Thus the full high-spin posterior is not converted
to a radius here.

These are posterior summaries from one event, not independent experiments.
The interval intersection is set arithmetic, not a combined posterior.
-/

namespace HsHVerification.CalderGW170817PosteriorChecks

def lowSpinHPDLower : ℚ := 70
def lowSpinHPDUpper : ℚ := 720
def highSpinLower : ℚ := 0
def highSpinUpper : ℚ := 630

def reportedOverlapLower : ℚ := max lowSpinHPDLower highSpinLower
def reportedOverlapUpper : ℚ := min lowSpinHPDUpper highSpinUpper

def lowSpinQLower : ℚ := 73/100
def highSpinQLower : ℚ := 53/100
def raithelQLower : ℚ := 6/10

def lowSpinWaveformHPDUppers : List ℚ := [720, 830, 690, 730]
def highSpinWaveformUppers : List ℚ := [630, 730, 630, 640]

theorem low_spin_HPD_interval_excludes_zero :
    0 < lowSpinHPDLower := by
  norm_num [lowSpinHPDLower]

theorem high_spin_one_sided_limit_includes_zero :
    highSpinLower = 0 := by
  norm_num [highSpinLower]

theorem reported_intervals_overlap :
    lowSpinHPDLower < highSpinUpper ∧
    highSpinLower < lowSpinHPDUpper := by
  norm_num [lowSpinHPDLower, lowSpinHPDUpper, highSpinLower, highSpinUpper]

theorem reported_overlap_endpoints :
    reportedOverlapLower = 70 ∧ reportedOverlapUpper = 630 := by
  norm_num [reportedOverlapLower, reportedOverlapUpper,
    lowSpinHPDLower, lowSpinHPDUpper, highSpinLower, highSpinUpper]

theorem reported_overlap_width :
    reportedOverlapUpper - reportedOverlapLower = 560 := by
  norm_num [reportedOverlapLower, reportedOverlapUpper,
    lowSpinHPDLower, lowSpinHPDUpper, highSpinLower, highSpinUpper]

theorem high_spin_upper_limit_is_below_low_spin_HPD_upper :
    highSpinUpper < lowSpinHPDUpper := by
  norm_num [highSpinUpper, lowSpinHPDUpper]

theorem low_spin_q_interval_within_raithel_domain :
    raithelQLower < lowSpinQLower := by
  norm_num [raithelQLower, lowSpinQLower]

theorem high_spin_q_interval_extends_below_raithel_domain :
    highSpinQLower < raithelQLower := by
  norm_num [highSpinQLower, raithelQLower]

theorem low_spin_waveform_HPD_upper_spread :
    lowSpinWaveformHPDUppers.min? = some 690 ∧
    lowSpinWaveformHPDUppers.max? = some 830 := by
  norm_num [lowSpinWaveformHPDUppers]

theorem high_spin_waveform_upper_spread :
    highSpinWaveformUppers.min? = some 630 ∧
    highSpinWaveformUppers.max? = some 730 := by
  norm_num [highSpinWaveformUppers]

#print axioms low_spin_HPD_interval_excludes_zero
#print axioms high_spin_one_sided_limit_includes_zero
#print axioms reported_intervals_overlap
#print axioms reported_overlap_endpoints
#print axioms reported_overlap_width
#print axioms high_spin_upper_limit_is_below_low_spin_HPD_upper
#print axioms low_spin_q_interval_within_raithel_domain
#print axioms high_spin_q_interval_extends_below_raithel_domain
#print axioms low_spin_waveform_HPD_upper_spread
#print axioms high_spin_waveform_upper_spread

end HsHVerification.CalderGW170817PosteriorChecks
