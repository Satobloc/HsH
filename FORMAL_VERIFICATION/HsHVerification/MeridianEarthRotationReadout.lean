import Mathlib

/-!
Source-conditional curvature readout for a marked rotating terrestrial material history.
Real physical anchor: Earth, NGA WGS84 reference R=6378137 m and nominal
angular rate omega=7.292115e-5 rad/s; ring-laser Earth rotation studies.
Historical genealogy: SAT archive RMS SAT.txt blob 4eb4146f74b089aa7d587bbf9cbcbc6c56c49513;
SRENA SAT.txt blob c946047b01165ca41b3ba7cdb454e7c1ccb7535d;
Meridian correction blob 199b560b52443eaf6228630299663b28e1b907bf.
The symbols beta=v/c and r>0 are dimensionless speed and physical radius.
No proof here establishes a physical SAT/H(s)H law, an independent prediction,
or the observational validity of an effective metric.
-/

namespace HsHVerification.MeridianEarthRotationReadout

noncomputable def kEuclid (r beta : ℝ) : ℝ := beta^2 / (r * (1 + beta^2))
noncomputable def kLorentz (r beta : ℝ) : ℝ := beta^2 / (r * (1 - beta^2))

/-- Scalar Euclidean curve curvature cannot distinguish clockwise from anticlockwise. -/
theorem euclid_chirality_blind (r beta : ℝ) :
    kEuclid r (-beta) = kEuclid r beta := by
  simp [kEuclid]

/-- Scalar Lorentzian proper curvature also forgets chirality. -/
theorem lorentz_chirality_blind (r beta : ℝ) :
    kLorentz r (-beta) = kLorentz r beta := by
  simp [kLorentz]

/-- Two different metric/parameterization readouts agree only after
accounting for their distinct beta-dependent denominator. -/
theorem euclid_lorentz_cross_relation
    (r beta : ℝ) (hr : r ≠ 0) (hm : 1 - beta^2 ≠ 0) :
    kLorentz r beta * (1 - beta^2) =
      kEuclid r beta * (1 + beta^2) := by
  have hp : 1 + beta^2 ≠ 0 := by positivity
  unfold kLorentz kEuclid
  field_simp
  <;> ring

/-- The exact difference of curvature conventions is fourth order in beta.
This is an algebraic statement; no measured 4D curvature is assumed. -/
theorem euclid_lorentz_gap
    (r beta : ℝ) (hr : r ≠ 0) (hm : 1 - beta^2 ≠ 0) :
    kLorentz r beta - kEuclid r beta =
      (2 * beta^4) / (r * (1 - beta^2) * (1 + beta^2)) := by
  have hp : 1 + beta^2 ≠ 0 := by positivity
  unfold kLorentz kEuclid
  field_simp
  <;> ring

/-- A scalar curvature readout has a scale degeneracy: scaling the
reference radius rescales the curvature reciprocally at fixed beta. -/
theorem euclid_scale
    (r beta s : ℝ) (hr : r ≠ 0) (hs : s ≠ 0) :
    kEuclid (s*r) beta = kEuclid r beta / s := by
  have hp : 1 + beta^2 ≠ 0 := by positivity
  unfold kEuclid
  field_simp
  <;> ring

#print axioms euclid_chirality_blind
#print axioms lorentz_chirality_blind
#print axioms euclid_lorentz_cross_relation
#print axioms euclid_lorentz_gap
#print axioms euclid_scale

end HsHVerification.MeridianEarthRotationReadout
