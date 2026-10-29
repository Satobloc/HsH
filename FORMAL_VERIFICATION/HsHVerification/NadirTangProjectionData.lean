import Mathlib

/-!
Nadir Voss | Tang 2023 helium-4 two-tracer vortex-ring observation gate.
Physical source: Tang et al., Nature Communications 14, 2941 (2023),
DOI 10.1038/s41467-023-38787-w; Methods, "Velocity and projection angle
for 2P ring". Real observed reported rounded inputs:
in-plane centroid displacement 1.12 mm, elapsed time 0.89 s,
and optically inferred transverse displacement maximum about 0.2 mm.
The paper reports 1.65 K bath and 1 mK temperature control accuracy.
Exact rational encoding is of printed decimal numerals, NOT of physically
exact observations. Full centroid/brightness covariance unavailable.
This module is conditional source arithmetic, not a worldtube law.
-/

namespace HsHVerification.NadirTangProjectionData

def projectedDistanceMm : ℚ := 112 / 100
def elapsedSeconds : ℚ := 89 / 100
def opticalTransverseLimitMm : ℚ := 1 / 5
def projectedMeanSpeedMmS : ℚ := projectedDistanceMm / elapsedSeconds
def transverseSlopeLimit : ℚ := opticalTransverseLimitMm / projectedDistanceMm

theorem printed_projected_speed : projectedMeanSpeedMmS = 112 / 89 := by
  norm_num [projectedMeanSpeedMmS, projectedDistanceMm, elapsedSeconds]

theorem printed_transverse_slope : transverseSlopeLimit = 5 / 28 := by
  norm_num [transverseSlopeLimit, opticalTransverseLimitMm, projectedDistanceMm]

theorem printed_square_ratio : 1 + transverseSlopeLimit ^ 2 = (809 : ℚ) / 784 := by
  norm_num [transverseSlopeLimit, opticalTransverseLimitMm, projectedDistanceMm]

theorem projected_mean_speed_positive : 0 < projectedMeanSpeedMmS := by
  norm_num [projectedMeanSpeedMmS, projectedDistanceMm, elapsedSeconds]

#print axioms printed_projected_speed
#print axioms printed_transverse_slope
#print axioms printed_square_ratio
#print axioms projected_mean_speed_positive

end HsHVerification.NadirTangProjectionData
