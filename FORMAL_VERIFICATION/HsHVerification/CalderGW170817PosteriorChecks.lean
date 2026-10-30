import Mathlib
import HsHVerification.CalderGW170817TidalMap

/-!
Source-anchored interval arithmetic for GW170817.

Source: LIGO Scientific Collaboration and Virgo Collaboration,
"Properties of the Binary Neutron Star Merger GW170817",
Phys. Rev. X 9, 011001 (2019), Table II and Sec. III.D,
DOI 10.1103/PhysRevX.9.011001.

For the PhenomPNRT analysis, the low-spin-prior 90% HPD interval is
\tilde{Λ} = 300^{+420}_{-230} = [70,720].  The high-spin-prior result is
a one-sided 90% upper limit [0,630], so it does not exclude zero.

These are two prior-conditioned posterior summaries from the same event and
waveform family, not independent measurements.  Their set intersection below
is interval arithmetic, not a combined posterior or a probability of agreement.

A separate common-EOS radius inference exists (De et al., PRL 121, 091102,
2018, arXiv:1804.08583), but its erratum retracts the original claim that the
GW data strongly favor the common-EOS model.  The common-EOS relation is
therefore treated here as a conditional model assumption, not an empirically
selected H(s)H or GR theorem.
-/

namespace HsHVerification.CalderGW170817PosteriorChecks

def lowSpinHPDLower : ℚ := 70
def lowSpinHPDUpper : ℚ := 720
def highSpinLower : ℚ := 0
def highSpinUpper : ℚ := 630

def reportedOverlapLower : ℚ := max lowSpinHPDLower highSpinLower
def reportedOverlapUpper : ℚ := min lowSpinHPDUpper highSpinUpper

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

#print axioms low_spin_HPD_interval_excludes_zero
#print axioms high_spin_one_sided_limit_includes_zero
#print axioms reported_intervals_overlap
#print axioms reported_overlap_endpoints
#print axioms reported_overlap_width
#print axioms high_spin_upper_limit_is_below_low_spin_HPD_upper

end HsHVerification.CalderGW170817PosteriorChecks
