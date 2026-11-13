import Mathlib

/-!
# Affine sensor readout and the oscillator's zero reference

Primary source: Hu et al. (2023), "Impact behavior of nylon kernmantle
ropes for high-altitude fall protection", Journal of Engineered Fibers
and Fabrics 18, DOI 10.1177/15589250231167401, PDF pp. 4-6.
The paper describes a laser displacement sensor that measures the
drop-load fall height, then defines x as rope elongation with the
falling-impact balance position as coordinate origin. The source's
free-fall stage and its sensor-mounting prose/figure leave the exact
raw-sensor-to-x calibration and zero reference insufficiently specified.

This module proves only an algebraic jet identity. It assumes a constant
affine readout y = a*x + b, with the first and second jet components
scaled by a. It does NOT prove that the paper's sensor has this transfer
function, that the rope is taut/vertical, that the balance zero was
calibrated, or that the damped oscillator describes the measured rope.
It is not an H(s)H map or an empirical result.

The result is useful because a nonzero additive offset contributes
p^2*b to the corrected oscillator residual. If p^2 != 0, a raw readout
cannot satisfy the same homogeneous equation unless its offset is zero.
-/ 

namespace HsHVerification.HaleRopeReadoutOffset

/-- A second-order jet. Derivative semantics are supplied by the caller;
this structure itself is only algebraic data. -/
structure SecondOrderJet where
  value : ℝ
  first : ℝ
  second : ℝ

/-- Residual of the corrected damped-oscillator equation
    x'' + 2*n*x' + p2*x = 0. -/
def oscillatorResidual (n p2 : ℝ) (j : SecondOrderJet) : ℝ :=
  j.second + 2 * n * j.first + p2 * j.value

/-- Constant affine sensor/readout transform on a second-order jet.
    The scale multiplies both derivatives; the offset affects only value. -/
def affineReadout (a b : ℝ) (j : SecondOrderJet) : SecondOrderJet where
  value := a * j.value + b
  first := a * j.first
  second := a * j.second

/-- Exact residual transformation under a constant affine readout. -/
theorem affineReadout_residual (n p2 a b : ℝ) (j : SecondOrderJet) :
    oscillatorResidual n p2 (affineReadout a b j) =
      a * oscillatorResidual n p2 j + p2 * b := by
  simp [oscillatorResidual, affineReadout]
  ring

/-- If both the source jet and the affine readout are asserted to satisfy
    the same homogeneous oscillator equation, a nonzero p2 forces the
    additive readout offset to vanish. -/
theorem homogeneousReadout_forces_zero_offset
    (n p2 a b : ℝ) (j : SecondOrderJet)
    (hSource : oscillatorResidual n p2 j = 0)
    (hReadout : oscillatorResidual n p2 (affineReadout a b j) = 0)
    (hp2 : p2 ≠ 0) : b = 0 := by
  have hpb : p2 * b = 0 := by
    calc
      p2 * b = a * oscillatorResidual n p2 j + p2 * b := by
        simp [hSource]
      _ = oscillatorResidual n p2 (affineReadout a b j) :=
        (affineReadout_residual n p2 a b j).symm
      _ = 0 := hReadout
  exact (mul_eq_zero.mp hpb).resolve_left hp2

#print axioms affineReadout_residual
#print axioms homogeneousReadout_forces_zero_offset

end HsHVerification.HaleRopeReadoutOffset
