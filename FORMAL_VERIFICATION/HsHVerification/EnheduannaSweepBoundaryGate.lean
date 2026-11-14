import Mathlib

/-!
# Enheduanna sweep-boundary contract

This module formalizes the algebraic boundary consequence of a specified
one-parameter product/sweep law. It does NOT construct a smooth flow,
immersion, embedded worldsheet, distributional current, Poincare-dual
representative, metric, or physical H(s)H identification.

The product-boundary law is an explicit premise that any proposed geometric
sweep must establish. The theorems below show what conservation then requires.
No physical fixture or numerical data are introduced.
-/

namespace HsHVerification.EnheduannaSweepBoundaryGate

/--
A typed contract for sweeping a source curve into a worldsheet.

* curveBoundary maps a source curve to its source-boundary chain.
* sweep maps the source curve to a candidate swept worldsheet.
* worldsheetBoundary returns the boundary chain of that worldsheet.
* startSlice and endSlice are its endpoint slices.
* sideBoundaryMap transports the source-boundary chain into the lateral
  boundary chain.
* productBoundary is the required chain-level product/Stokes identity:
  end minus start minus swept side boundary.

The record is a verification interface, not a construction of the geometry.
-/
structure SweepBoundaryContract
    (Curve SourceBoundary SweptWorldsheet Boundary : Type*)
    [AddCommGroup SourceBoundary] [AddCommGroup Boundary] where
  curveBoundary : Curve → SourceBoundary
  sweep : Curve → SweptWorldsheet
  worldsheetBoundary : SweptWorldsheet → Boundary
  startSlice : Curve → Boundary
  endSlice : Curve → Boundary
  sideBoundaryMap : SourceBoundary →+ Boundary
  productBoundary : ∀ c,
    worldsheetBoundary (sweep c) =
      endSlice c - startSlice c - sideBoundaryMap (curveBoundary c)

/-- A closed source curve contributes no lateral boundary under the declared
additive side-boundary map. -/
theorem side_boundary_vanishes_for_closed_curve
    {Curve SourceBoundary SweptWorldsheet Boundary : Type*}
    [AddCommGroup SourceBoundary] [AddCommGroup Boundary]
    (S : SweepBoundaryContract Curve SourceBoundary SweptWorldsheet Boundary)
    (c : Curve) (hclosed : S.curveBoundary c = 0) :
    S.sideBoundaryMap (S.curveBoundary c) = 0 := by
  simp [hclosed]

/-- For a closed source curve, the swept-worldsheet boundary is exactly the
end-slice minus start-slice chain. -/
theorem swept_boundary_for_closed_curve
    {Curve SourceBoundary SweptWorldsheet Boundary : Type*}
    [AddCommGroup SourceBoundary] [AddCommGroup Boundary]
    (S : SweepBoundaryContract Curve SourceBoundary SweptWorldsheet Boundary)
    (c : Curve) (hclosed : S.curveBoundary c = 0) :
    S.worldsheetBoundary (S.sweep c) =
      S.endSlice c - S.startSlice c := by
  rw [S.productBoundary c, hclosed]
  simp

/-- With no lateral boundary, worldsheet conservation is equivalent to
endpoint identification/periodic closure. -/
theorem conservation_iff_endpoint_balance
    {Curve SourceBoundary SweptWorldsheet Boundary : Type*}
    [AddCommGroup SourceBoundary] [AddCommGroup Boundary]
    (S : SweepBoundaryContract Curve SourceBoundary SweptWorldsheet Boundary)
    (c : Curve) (hclosed : S.curveBoundary c = 0) :
    S.worldsheetBoundary (S.sweep c) = 0 ↔
      S.endSlice c = S.startSlice c := by
  rw [swept_boundary_for_closed_curve S c hclosed]
  exact sub_eq_zero

/-- A finite sweep of a closed source curve with unequal endpoint slices
cannot have zero worldsheet boundary. -/
theorem nonperiodic_closed_sweep_has_boundary
    {Curve SourceBoundary SweptWorldsheet Boundary : Type*}
    [AddCommGroup SourceBoundary] [AddCommGroup Boundary]
    (S : SweepBoundaryContract Curve SourceBoundary SweptWorldsheet Boundary)
    (c : Curve) (hclosed : S.curveBoundary c = 0)
    (hend : S.endSlice c ≠ S.startSlice c) :
    S.worldsheetBoundary (S.sweep c) ≠ 0 := by
  intro hzero
  exact hend ((conservation_iff_endpoint_balance S c hclosed).mp hzero)

/-- In the general/open-curve case, a conserved swept worldsheet requires the
endpoint mismatch to be exactly compensated by the transported side boundary. -/
theorem conservation_requires_endpoint_side_balance
    {Curve SourceBoundary SweptWorldsheet Boundary : Type*}
    [AddCommGroup SourceBoundary] [AddCommGroup Boundary]
    (S : SweepBoundaryContract Curve SourceBoundary SweptWorldsheet Boundary)
    (c : Curve)
    (hconserved : S.worldsheetBoundary (S.sweep c) = 0) :
    S.endSlice c - S.startSlice c =
      S.sideBoundaryMap (S.curveBoundary c) := by
  rw [S.productBoundary c] at hconserved
  exact sub_eq_zero.mp hconserved

/-- A closed source curve whose endpoint slices are identified gives a
conserved swept worldsheet under the declared product-boundary law. -/
theorem periodic_closed_sweep_is_conserved
    {Curve SourceBoundary SweptWorldsheet Boundary : Type*}
    [AddCommGroup SourceBoundary] [AddCommGroup Boundary]
    (S : SweepBoundaryContract Curve SourceBoundary SweptWorldsheet Boundary)
    (c : Curve) (hclosed : S.curveBoundary c = 0)
    (hend : S.endSlice c = S.startSlice c) :
    S.worldsheetBoundary (S.sweep c) = 0 :=
  (conservation_iff_endpoint_balance S c hclosed).mpr hend

#print axioms side_boundary_vanishes_for_closed_curve
#print axioms swept_boundary_for_closed_curve
#print axioms conservation_iff_endpoint_balance
#print axioms nonperiodic_closed_sweep_has_boundary
#print axioms conservation_requires_endpoint_side_balance
#print axioms periodic_closed_sweep_is_conserved

end HsHVerification.EnheduannaSweepBoundaryGate
