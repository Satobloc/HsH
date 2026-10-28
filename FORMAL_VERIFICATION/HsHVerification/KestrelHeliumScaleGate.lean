import Mathlib

/-!
Source-conditioned scale labels for Tang et al., Nature Communications 14:2941 (2023),
doi:10.1038/s41467-023-38787-w. The numbers below are the paper's ROUNDED
reported quantities, encoded as exact rationals only to verify arithmetic.
This does NOT assert that experimental radii or the model core estimate are
exact or independently measured with zero uncertainty.
1 Angstrom approximate bare core (model), 1.1 micrometre mean tracer
(settling-inferred), 312 to 150 micrometre observed nine-tracer ring,
140.8 micrometre fitted two-tracer ring.
-/
namespace HsHVerification.KestrelHeliumScaleGate

/-- Nominal ratio: 1.1 micrometre / approximately 1 Angstrom. -/
theorem nominal_tracer_to_core :
    ((11000 : ℚ) / 1) = 11000 := by
  norm_num

/-- Nominal two-tracer fitted ring radius divided by cross-event mean tracer radius. -/
theorem nominal_two_ring_to_tracer :
    ((1408 : ℚ) / 10) / ((11 : ℚ) / 10) = 128 := by
  norm_num

/-- Nominal nine-tracer observed initial ring radius divided by mean tracer radius. -/
theorem nominal_nine_ring_to_tracer :
    (312 : ℚ) / ((11 : ℚ) / 10) = 3120 / 11 := by
  norm_num

/-- Reported nine-tracer ring endpoint ratio, not a fitted dynamical law. -/
theorem nominal_nine_ring_shrink_fraction :
    1 - (150 : ℚ) / 312 = 27 / 52 := by
  norm_num

#print axioms nominal_tracer_to_core
#print axioms nominal_two_ring_to_tracer
#print axioms nominal_nine_ring_to_tracer
#print axioms nominal_nine_ring_shrink_fraction

end HsHVerification.KestrelHeliumScaleGate
