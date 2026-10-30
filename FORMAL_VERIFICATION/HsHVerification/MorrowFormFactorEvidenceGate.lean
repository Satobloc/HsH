import Mathlib

/-!
# Morrow source-to-quantity evidence gate

This is a workflow formalization, not a physical model.

Source genealogy checked for the associated LEP example:
- Bourilkov, hep-ph/0002172, Eqs. (10)-(12): the reported
  electron-size limit belongs to a phenomenological fermion-vertex
  form-factor parameterization, with Q^2 the Mandelstam variable s or t.
- The paper calls r^2 the mean-square radius of the fermions and cites
  Köpp et al., hep-ph/9409457, Eq. (2), for the standard radius ansatz.
- Neither source by itself supplies a map from that fitted vertex parameter
  to a static positive charge-density RMS moment, or from that moment to
  H(s)H worldtube geometric support.

The structures below force those two identification maps to be explicit.
Their existence as Lean data does NOT certify their physical validity.
No measured data, physical fixture, numerical calculation, or H(s)H
prediction is introduced here.
-/

namespace HsHVerification.MorrowFormFactorEvidenceGate

inductive QuantityStage
  | phenomenologicalFitParameter
  | staticChargeRMSRadius
  | geometricSupportRadius
  deriving DecidableEq, Repr

/-- A numerical value retains its semantic/evidentiary stage. -/
structure TaggedQuantity where
  stage : QuantityStage
  value : ℝ
  source : String

/-- Equal numbers do not erase distinct source/quantity stages. -/
theorem same_numeric_value_different_stage_not_identity
    (value : ℝ) (source : String)
    (fitStage momentStage : QuantityStage)
    (hStage : fitStage ≠ momentStage) :
    ({ stage := fitStage, value := value, source := source } : TaggedQuantity) ≠
      ({ stage := momentStage, value := value, source := source } : TaggedQuantity) := by
  intro h
  exact hStage (congrArg TaggedQuantity.stage h)

/-- Bourilkov's fitted phenomenological radius parameter. -/
structure PhenomenologicalFitParameter where
  value : ℝ
  source : String
  ansatz : String

/-- An RMS radius of an explicitly specified static positive charge profile. -/
structure StaticChargeRMSRadius where
  value : ℝ
  source : String
  profile : String

/-- A radius bounding the support of a specified geometric carrier. -/
structure GeometricSupportRadius where
  value : ℝ
  source : String
  carrier : String

/-- Explicit identification from a phenomenological fit parameter to a
static charge-density moment. The map and its assumptions must be supplied;
this record is not itself proof that the assumptions are physically sound. -/
structure FitToStaticMomentBridge where
  map : PhenomenologicalFitParameter → StaticChargeRMSRadius
  source : String
  assumptions : List String

/-- Explicit identification from a static charge-density moment to geometric
carrier support. The map and its assumptions must be supplied. -/
structure StaticMomentToGeometryBridge where
  map : StaticChargeRMSRadius → GeometricSupportRadius
  source : String
  assumptions : List String

/-- A geometric support inference is admissible in this workflow only when
both identification maps are explicit and the reported support is their
composition on the original fit parameter. -/
structure GeometryBoundDerivation (fit : PhenomenologicalFitParameter) where
  fitToStaticMoment : FitToStaticMomentBridge
  staticMomentToGeometry : StaticMomentToGeometryBridge
  support : GeometricSupportRadius
  support_is_composed :
    support = staticMomentToGeometry.map (fitToStaticMoment.map fit)

theorem geometry_bound_requires_fit_to_static_moment_bridge
    {fit : PhenomenologicalFitParameter}
    (derivation : GeometryBoundDerivation fit) :
    Nonempty FitToStaticMomentBridge :=
  ⟨derivation.fitToStaticMoment⟩

theorem geometry_bound_requires_static_moment_to_geometry_bridge
    {fit : PhenomenologicalFitParameter}
    (derivation : GeometryBoundDerivation fit) :
    Nonempty StaticMomentToGeometryBridge :=
  ⟨derivation.staticMomentToGeometry⟩

theorem geometry_bound_is_composed_through_both_bridges
    {fit : PhenomenologicalFitParameter}
    (derivation : GeometryBoundDerivation fit) :
    derivation.support =
      derivation.staticMomentToGeometry.map
        (derivation.fitToStaticMoment.map fit) :=
  derivation.support_is_composed

theorem no_geometry_bound_from_fit_without_first_bridge
    (fit : PhenomenologicalFitParameter)
    (hNoBridge : ¬ Nonempty FitToStaticMomentBridge) :
    ¬ Nonempty (GeometryBoundDerivation fit) := by
  rintro ⟨derivation⟩
  exact hNoBridge ⟨derivation.fitToStaticMoment⟩

theorem no_geometry_bound_from_fit_without_second_bridge
    (fit : PhenomenologicalFitParameter)
    (hNoBridge : ¬ Nonempty StaticMomentToGeometryBridge) :
    ¬ Nonempty (GeometryBoundDerivation fit) := by
  rintro ⟨derivation⟩
  exact hNoBridge ⟨derivation.staticMomentToGeometry⟩

#print axioms same_numeric_value_different_stage_not_identity
#print axioms geometry_bound_requires_fit_to_static_moment_bridge
#print axioms geometry_bound_requires_static_moment_to_geometry_bridge
#print axioms geometry_bound_is_composed_through_both_bridges
#print axioms no_geometry_bound_from_fit_without_first_bridge
#print axioms no_geometry_bound_from_fit_without_second_bridge

end HsHVerification.MorrowFormFactorEvidenceGate
