import Mathlib

/-!
# Resolution neighborhoods are not exact quotient fibers

This module formalizes a general metric distinction used by the H(s)H
measurement architecture.

An exact observation fiber is defined by equality of readouts and can support
a quotient when the relevant relation is an equivalence. A finite-resolution
neighborhood instead relates readouts whose metric distance is below a
tolerance. Such a relation is reflexive (for nonnegative tolerance) and
symmetric, but it is not generally transitive.

The module proves:
* reflexivity and symmetry of a declared tolerance neighborhood;
* additive propagation of two successive resolution errors; and
* a conditional non-transitivity result whenever a chain has endpoints
  farther apart than the original tolerance.

No physical metric, covariance, detector, dataset, or H(s)H observation map
is selected here. This is an abstract mathematical result, not a physical
calculation or empirical claim.

Architecture context:
* Ravel PR #1133: exact readout descent through fibers of a declared map.
* Mercer, Kelvin-vortex observation-chain/fiber gate, issue #1867:
  structural channel identifiability versus missing measurement maps.
* Mercer h888 two-axis identifiability crosswalk:
  within-model identifiability and between-model discrimination are separate.
* Nadir h959:s3 uncertainty amendment: uncertainty statements must be scoped
  to observable, channel, acquisition, estimator, units, calibration and
  covariance.

The present result does not replace those contracts. It prevents a tolerance
neighborhood from being silently treated as an exact quotient relation.
-/

namespace HsHVerification.NadirResolutionTolerance

/-- Two readouts are within a declared resolution tolerance. -/
def WithinResolution {Y : Type*} [PseudoMetricSpace Y]
    (epsilon : ℝ) (x y : Y) : Prop :=
  dist x y ≤ epsilon

/-- A nonnegative tolerance makes the neighborhood relation reflexive. -/
theorem withinResolution_refl
    {Y : Type*} [PseudoMetricSpace Y]
    (epsilon : ℝ) (hepsilon : 0 ≤ epsilon) (x : Y) :
    WithinResolution epsilon x x := by
  change dist x x ≤ epsilon
  simpa using hepsilon

/-- Metric symmetry makes the neighborhood relation symmetric. -/
theorem withinResolution_symm
    {Y : Type*} [PseudoMetricSpace Y]
    (epsilon : ℝ) (x y : Y) :
    WithinResolution epsilon x y ↔ WithinResolution epsilon y x := by
  change dist x y ≤ epsilon ↔ dist y x ≤ epsilon
  rw [dist_comm]

/-- Resolution errors accumulate additively along two successive maps. -/
theorem withinResolution_chain_bound
    {Y : Type*} [PseudoMetricSpace Y]
    (epsilon₁ epsilon₂ : ℝ) (x y z : Y)
    (hxy : WithinResolution epsilon₁ x y)
    (hyz : WithinResolution epsilon₂ y z) :
    dist x z ≤ epsilon₁ + epsilon₂ := by
  change dist x y ≤ epsilon₁ at hxy
  change dist y z ≤ epsilon₂ at hyz
  calc
    dist x z ≤ dist x y + dist y z := dist_triangle x y z
    _ ≤ epsilon₁ + epsilon₂ := add_le_add hxy hyz

/-- If two successive pairs are within epsilon but their endpoints are not,
    the epsilon-neighborhood relation is not transitive on that domain. -/
theorem not_transitive_of_resolution_witness
    {Y : Type*} [PseudoMetricSpace Y]
    (epsilon : ℝ) (x y z : Y)
    (hxy : WithinResolution epsilon x y)
    (hyz : WithinResolution epsilon y z)
    (hfar : epsilon < dist x z) :
    ¬ (∀ a b c : Y,
      WithinResolution epsilon a b →
      WithinResolution epsilon b c →
      WithinResolution epsilon a c) := by
  intro htrans
  exact (not_le_of_gt hfar) (htrans x y z hxy hyz)

end HsHVerification.NadirResolutionTolerance


/-! Theorem-specific dependency reports for the exact-head CI log. -/
#print axioms HsHVerification.NadirResolutionTolerance.withinResolution_refl
#print axioms HsHVerification.NadirResolutionTolerance.withinResolution_symm
#print axioms HsHVerification.NadirResolutionTolerance.withinResolution_chain_bound
#print axioms HsHVerification.NadirResolutionTolerance.not_transitive_of_resolution_witness
