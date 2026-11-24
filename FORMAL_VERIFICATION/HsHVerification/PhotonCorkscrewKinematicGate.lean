import Mathlib

/-!
Conditional source-fidelity check for the 2026-05-24 "Photon Corkscrew Trajectory" exchange.

Nathan Direct asks for an imaginative construction. This file does not treat that
prompt as a physical assertion. The historical assistant reconstruction gives a
unit time component, a unit axial spatial component (c = 1), and nonzero transverse
circular motion. Under the standard Minkowski signature (-+++), that tangent is
spacelike, not null.

This formalization checks only those explicit conditional assumptions. It does not
establish photon ontology, polarization or helicity, double-slit probabilities,
Bohmian equivalence, or any H(s)H mapping.
-/

namespace HsHVerification.PhotonCorkscrewKinematicGate

/-- A local four-vector used only for this conditional kinematic check. -/
structure Tangent4 where
  t : ℝ
  x : ℝ
  y : ℝ
  z : ℝ

/-- Minkowski norm with signature (-+++). -/
def minkowskiNorm4 (v : Tangent4) : ℝ :=
  -v.t ^ 2 + v.x ^ 2 + v.y ^ 2 + v.z ^ 2

/-- A unit-time tangent with unit axial component and nonzero transverse
components is spacelike in the standard (-+++) Minkowski metric. -/
theorem unit_axis_with_transverse_is_spacelike
    (x y : ℝ) (htrans : 0 < x ^ 2 + y ^ 2) :
    minkowskiNorm4 { t := 1, x := x, y := y, z := 1 } > 0 := by
  simpa [minkowskiNorm4] using htrans

/-- For a null tangent with unit time component, a nonzero transverse
contribution forces the axial component to be strictly subunit. -/
theorem null_unit_time_nonzero_transverse_forces_axial_subunit
    (x y z : ℝ)
    (htrans : 0 < x ^ 2 + y ^ 2)
    (hnull : minkowskiNorm4 { t := 1, x := x, y := y, z := z } = 0) :
    z ^ 2 < 1 := by
  have hnorm : -1 + x ^ 2 + y ^ 2 + z ^ 2 = 0 := by
    simpa [minkowskiNorm4] using hnull
  linarith

/-- If the axial component equals the unit time component and the tangent
is null, both transverse components must vanish. -/
theorem null_unit_time_unit_axis_forces_transverse_zero
    (x y : ℝ)
    (hnull : minkowskiNorm4 { t := 1, x := x, y := y, z := 1 } = 0) :
    x = 0 ∧ y = 0 := by
  have hsum : x ^ 2 + y ^ 2 = 0 := by
    simpa [minkowskiNorm4] using hnull
  constructor <;> nlinarith

/-- In an orthogonal Euclidean decomposition, positive transverse speed
squared makes total speed squared strictly exceed axial speed squared. -/
theorem euclidean_total_speed_sq_gt_axial_sq
    (vAxial vTransverse : ℝ)
    (htrans : 0 < vTransverse ^ 2) :
    vAxial ^ 2 < vAxial ^ 2 + vTransverse ^ 2 := by
  linarith

#print axioms unit_axis_with_transverse_is_spacelike
#print axioms null_unit_time_nonzero_transverse_forces_axial_subunit
#print axioms null_unit_time_unit_axis_forces_transverse_zero
#print axioms euclidean_total_speed_sq_gt_axial_sq

end HsHVerification.PhotonCorkscrewKinematicGate
