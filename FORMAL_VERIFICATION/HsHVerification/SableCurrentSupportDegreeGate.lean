import Mathlib

/-!
# Sable current-support / form-degree gate

This module formalizes only dimension and degree bookkeeping in a four-dimensional
oriented ambient setting.

It keeps distinct:
* a tangent k-vector current supported on a k-dimensional stratum;
* the distributional Poincare-dual (4-k)-form of that same stratum;
* the Hodge-degree map p ↦ 4-p;
* the dimension shift of a one-parameter sweep, conditional on an actually
  independent second tangent direction;
* the local dimension formula for a transverse intersection with a
  three-dimensional hypersurface.

It does NOT construct a smooth flow, prove immersion/transversality, construct
distributional currents, establish a push-forward/suspension operator, prove
current conservation, choose a metric/orientation/signature, or establish any
SAT/H(s)H physical identification. In particular, the "sweep" function below
encodes the conditional dimension change; it is not a geometric existence proof.
-/

namespace HsHVerification.SableCurrentSupportDegreeGate

inductive CurrentEncoding where
  | tangentMultivector
  | poincareDualForm
  deriving DecidableEq, Repr

structure SupportCurrentType where
  supportDimension : Nat
  componentRank : Nat
  encoding : CurrentEncoding
  deriving DecidableEq, Repr

def tangentCurrentType (k : Nat) : SupportCurrentType :=
  { supportDimension := k
    componentRank := k
    encoding := .tangentMultivector }

def poincareDualCurrentType (k : Nat) : SupportCurrentType :=
  { supportDimension := k
    componentRank := 4 - k
    encoding := .poincareDualForm }

def poincareDualFormDegree (supportDimension : Nat) : Nat :=
  4 - supportDimension

def hodgeDegree (formDegree : Nat) : Nat :=
  4 - formDegree

/-- Conditional bookkeeping: an independent one-parameter sweep raises support
dimension by one. The existence/regularity of the sweep is not proved here. -/
def sweptSupportDimension (supportDimension : Nat) : Nat :=
  supportDimension + 1

/-- Expected local dimension for a transverse intersection with a 3D
hypersurface in a 4D ambient manifold. Transversality is an external premise. -/
def transverseHypersurfaceSliceDimension (supportDimension : Nat) : Nat :=
  supportDimension + 3 - 4

/-- Conditional boundary bookkeeping: the boundary of a k-dimensional support
has dimension k-1 when it is a regular nonempty boundary. Existence/regularity
of the boundary is an external geometric premise. -/
def boundarySupportDimension (supportDimension : Nat) : Nat :=
  supportDimension - 1

theorem poincare_dual_degree_plus_support
    (k : Nat) (hk : k ≤ 4) :
    poincareDualFormDegree k + k = 4 := by
  simp [poincareDualFormDegree]
  omega

theorem line_poincare_dual_is_three_form :
    poincareDualFormDegree 1 = 3 := by
  norm_num [poincareDualFormDegree]

theorem worldsheet_poincare_dual_is_two_form :
    poincareDualFormDegree 2 = 2 := by
  norm_num [poincareDualFormDegree]

theorem shell_poincare_dual_is_one_form :
    poincareDualFormDegree 3 = 1 := by
  norm_num [poincareDualFormDegree]

theorem bulk_poincare_dual_is_zero_form :
    poincareDualFormDegree 4 = 0 := by
  norm_num [poincareDualFormDegree]

theorem hodge_dual_of_three_form_has_degree_one :
    hodgeDegree 3 = 1 := by
  norm_num [hodgeDegree]

theorem hodge_dual_of_three_form_is_not_two_form :
    hodgeDegree 3 ≠ 2 := by
  norm_num [hodgeDegree]

theorem hodge_dual_of_two_form_has_degree_two :
    hodgeDegree 2 = 2 := by
  norm_num [hodgeDegree]

/-- Equal tensor/component rank does not determine the geometric support:
a tangent 3-current on a 3D stratum and the PD 3-form of a 1D curve both have
three indices, but their supports have different dimensions. -/
theorem same_rank_different_support :
    (tangentCurrentType 3).componentRank =
      (poincareDualCurrentType 1).componentRank ∧
    (tangentCurrentType 3).supportDimension ≠
      (poincareDualCurrentType 1).supportDimension := by
  constructor <;> norm_num [tangentCurrentType, poincareDualCurrentType]

theorem independent_sweep_raises_support_by_one (k : Nat) :
    sweptSupportDimension k = k + 1 := by
  rfl

theorem sweep_lowers_poincare_dual_degree_by_one
    (k : Nat) (hk : k < 4) :
    poincareDualFormDegree (sweptSupportDimension k) + 1 =
      poincareDualFormDegree k := by
  simp [poincareDualFormDegree, sweptSupportDimension]
  omega

theorem swept_worldline_has_two_form_poincare_dual :
    poincareDualFormDegree (sweptSupportDimension 1) = 2 := by
  norm_num [poincareDualFormDegree, sweptSupportDimension]

/-- Under the standard current/Poincare-dual convention and Stokes, the PD of
an oriented boundary has form degree one higher than the PD of its support.
The domain is 1 ≤ k ≤ 4 in the 4D ambient space; the upper bound is essential
because Nat subtraction saturates for support dimensions above four.
This theorem checks only the degree arithmetic, not Stokes or current existence. -/
theorem boundary_raises_poincare_dual_degree_by_one
    (k : Nat) (hk : 1 ≤ k) (hk4 : k ≤ 4) :
    poincareDualFormDegree (boundarySupportDimension k) =
      poincareDualFormDegree k + 1 := by
  simp [poincareDualFormDegree, boundarySupportDimension]
  omega

theorem worldsheet_boundary_poincare_dual_is_three_form :
    poincareDualFormDegree (boundarySupportDimension 2) = 3 := by
  norm_num [poincareDualFormDegree, boundarySupportDimension]

/-- The 3-form-to-2-form change cannot be attributed to Hodge duality alone:
Hodge duality sends degree 3 to degree 1, while a one-parameter sweep of a
1D support has a degree-2 Poincare dual. -/
theorem hodge_and_sweep_are_distinct :
    hodgeDegree 3 = 1 ∧
    poincareDualFormDegree (sweptSupportDimension 1) = 2 := by
  constructor <;> norm_num [hodgeDegree, poincareDualFormDegree,
    sweptSupportDimension]

theorem transverse_hypersurface_slice_dimension
    (k : Nat) (hk : 1 ≤ k) (_hk4 : k ≤ 4) :
    transverseHypersurfaceSliceDimension k + 1 = k := by
  simp [transverseHypersurfaceSliceDimension]
  omega

theorem worldline_meets_transverse_hypersurface_in_zero_dimension :
    transverseHypersurfaceSliceDimension 1 = 0 := by
  norm_num [transverseHypersurfaceSliceDimension]

theorem worldsheet_meets_transverse_hypersurface_in_one_dimension :
    transverseHypersurfaceSliceDimension 2 = 1 := by
  norm_num [transverseHypersurfaceSliceDimension]

theorem shell_meets_transverse_hypersurface_in_two_dimensions :
    transverseHypersurfaceSliceDimension 3 = 2 := by
  norm_num [transverseHypersurfaceSliceDimension]

#print axioms poincare_dual_degree_plus_support
#print axioms line_poincare_dual_is_three_form
#print axioms worldsheet_poincare_dual_is_two_form
#print axioms shell_poincare_dual_is_one_form
#print axioms bulk_poincare_dual_is_zero_form
#print axioms hodge_dual_of_three_form_has_degree_one
#print axioms hodge_dual_of_three_form_is_not_two_form
#print axioms hodge_dual_of_two_form_has_degree_two
#print axioms same_rank_different_support
#print axioms independent_sweep_raises_support_by_one
#print axioms sweep_lowers_poincare_dual_degree_by_one
#print axioms swept_worldline_has_two_form_poincare_dual
#print axioms boundary_raises_poincare_dual_degree_by_one
#print axioms worldsheet_boundary_poincare_dual_is_three_form
#print axioms hodge_and_sweep_are_distinct
#print axioms transverse_hypersurface_slice_dimension
#print axioms worldline_meets_transverse_hypersurface_in_zero_dimension
#print axioms worldsheet_meets_transverse_hypersurface_in_one_dimension
#print axioms shell_meets_transverse_hypersurface_in_two_dimensions

end HsHVerification.SableCurrentSupportDegreeGate

namespace HsHVerification.SableCurrentSupportDegreeGate

/-- Conditional degree bookkeeping for the inclusion of a transverse 3D
hypersurface into the 4D ambient manifold. If a k-dimensional support meets
the hypersurface transversely, its slice has dimension k-1, so its Poincare-dual
degree inside the hypersurface is the same codimension as the ambient
Poincare-dual degree. This does not construct the inclusion or prove
transversality/current pullback. -/
def hypersurfaceSlicePoincareDualDegree (supportDimension : Nat) : Nat :=
  3 - transverseHypersurfaceSliceDimension supportDimension

theorem transverse_slice_preserves_poincare_dual_degree
    (k : Nat) (hk : 1 ≤ k) (hk4 : k ≤ 4) :
    hypersurfaceSlicePoincareDualDegree k = poincareDualFormDegree k := by
  simp [hypersurfaceSlicePoincareDualDegree,
    transverseHypersurfaceSliceDimension, poincareDualFormDegree]
  omega

theorem bulk_meets_transverse_hypersurface_in_three_dimensions :
    transverseHypersurfaceSliceDimension 4 = 3 := by
  norm_num [transverseHypersurfaceSliceDimension]

#print axioms transverse_slice_preserves_poincare_dual_degree
#print axioms bulk_meets_transverse_hypersurface_in_three_dimensions

end HsHVerification.SableCurrentSupportDegreeGate


/-!
## Source-aware representation identity gate

The degree/support arithmetic above does not by itself identify which historical
or mathematical object a symbol denotes. This section records independent axes:
representation kind, component rank, differential-form degree, support dimension,
outer source role, claim kind, and whether a source-defined map was recovered.

The concrete records below are classifications of the cited source material.
Lean verifies the internal distinctions once those classifications are supplied;
it does not authenticate the source attribution or establish a physical map.
-/

namespace HsHVerification.SableCurrentIdentityGate

inductive ObjectKind where
  | tangentMultivectorCurrent
  | antisymmetricRankTwoCurrent
  | differentialForm
  | hodgeDualForm
  | poincareDualForm
  | editorialInstruction
  deriving DecidableEq, Repr

inductive SourceRole where
  | userRoleMessage
  | assistantRoleMessage
  | documentByline
  | standardMathematics
  | unattributedEmbeddedDocument
  deriving DecidableEq, Repr

inductive ClaimKind where
  | editorialDirection
  | equation
  | geometricSupportClaim
  | standardIdentity
  deriving DecidableEq, Repr

inductive SourceMapStatus where
  | notApplicable
  | sourceDefined
  | notRecoveredInInspectedSources
  | assistantProposed
  | unknown
  deriving DecidableEq, Repr

/-- A source-aware descriptor. Component rank, form degree, and support
dimension are deliberately independent optional fields. -/
structure RepresentationRecord where
  objectKind : ObjectKind
  componentRank : Option Nat
  formDegree : Option Nat
  supportDimension : Option Nat
  sourceRole : SourceRole
  claimKind : ClaimKind
  sourceMapStatus : SourceMapStatus
  sourceLocator : String
  deriving DecidableEq, Repr

def degreeProjection (r : RepresentationRecord) : Option Nat :=
  r.formDegree

/-- Standard mathematical object: the Poincare-dual 2-form of an oriented
2-dimensional support in an oriented 4-dimensional ambient manifold.
This is conditional standard mathematics, not an H(s)H source equation. -/
def worldsheetPoincareDual : RepresentationRecord :=
  { objectKind := .poincareDualForm
    componentRank := some 2
    formDegree := some 2
    supportDimension := some 2
    sourceRole := .standardMathematics
    claimKind := .standardIdentity
    sourceMapStatus := .notApplicable
    sourceLocator := "standard oriented 4D Poincare-dual degree rule; conditional on 2D support" }

/-- Standard mathematical object: Hodge dual of a 2-form in four dimensions.
Its form degree is 2; no geometric support dimension is implied by that
degree statement alone. -/
def hodgeDualOfTwoForm : RepresentationRecord :=
  { objectKind := .hodgeDualForm
    componentRank := some 2
    formDegree := some 2
    supportDimension := none
    sourceRole := .standardMathematics
    claimKind := .standardIdentity
    sourceMapStatus := .notApplicable
    sourceLocator := "standard 4D Hodge degree rule; 2-form input" }

/-- The October 2025 Blockwave action's assistant-authored antisymmetric
rank-two current. The inspected message supplies rank-two components and a
conservation expression, but does not supply a metric-lowering map or a
source-defined support/sweep map identifying it with a distributional
Poincare-dual 2-form. -/
def blockwaveRankTwoCurrent : RepresentationRecord :=
  { objectKind := .antisymmetricRankTwoCurrent
    componentRank := some 2
    formDegree := none
    supportDimension := none
    sourceRole := .assistantRoleMessage
    claimKind := .equation
    sourceMapStatus := .notRecoveredInInspectedSources
    sourceLocator := "conversation 68f4d9b5-b908-832e-940e-6782db174a4a; assistant message 3039b226-02d4-41a3-a2d3-c338e25204a9" }

/-- The September 18 user-role instruction requests a three-form editorial
track for Chapters 1-5. It does not itself state the later detailed J3
equation or attest its coefficient. -/
def userThreeFormEditorialDirection : RepresentationRecord :=
  { objectKind := .editorialInstruction
    componentRank := none
    formDegree := none
    supportDimension := none
    sourceRole := .userRoleMessage
    claimKind := .editorialDirection
    sourceMapStatus := .notApplicable
    sourceLocator := "conversation 68cad3d4-0ccc-8325-be36-94c5b5527997; user message e92efb17-2499-482e-b930-9ad11221bd7c" }

/-- The detailed three-form expression in the same conversation is
assistant-authored. It must not inherit the user-role provenance of the
separate editorial instruction. -/
def assistantThreeFormEquation : RepresentationRecord :=
  { objectKind := .differentialForm
    componentRank := some 3
    formDegree := some 3
    supportDimension := none
    sourceRole := .assistantRoleMessage
    claimKind := .equation
    sourceMapStatus := .notRecoveredInInspectedSources
    sourceLocator := "conversation 68cad3d4-0ccc-8325-be36-94c5b5527997; assistant message ff0ef513-0f75-4e87-a719-378447788b32" }

/-- Equal form degree does not identify the operation or support:
the Hodge dual of a 2-form and the Poincare dual of a 2D support both have
degree 2, but they are different typed objects and only the latter record
carries the 2D support premise. -/
theorem two_form_degree_does_not_identify_operation :
    degreeProjection worldsheetPoincareDual =
      degreeProjection hodgeDualOfTwoForm ∧
    worldsheetPoincareDual.objectKind ≠ hodgeDualOfTwoForm.objectKind ∧
    worldsheetPoincareDual.supportDimension ≠
      hodgeDualOfTwoForm.supportDimension := by
  decide

/-- Rank-two components alone do not establish a differential 2-form,
a geometric support dimension, or a source-defined map. -/
theorem blockwave_rank_two_does_not_supply_form_or_support :
    blockwaveRankTwoCurrent.componentRank = some 2 ∧
    blockwaveRankTwoCurrent.formDegree = none ∧
    blockwaveRankTwoCurrent.supportDimension = none ∧
    blockwaveRankTwoCurrent.sourceMapStatus =
      .notRecoveredInInspectedSources := by
  decide

/-- A direct user-role editorial instruction and an assistant-role equation
are separate source events; the former does not authenticate the latter. -/
theorem editorial_direction_does_not_attest_equation :
    userThreeFormEditorialDirection.sourceRole = .userRoleMessage ∧
    userThreeFormEditorialDirection.claimKind = .editorialDirection ∧
    assistantThreeFormEquation.sourceRole = .assistantRoleMessage ∧
    assistantThreeFormEquation.claimKind = .equation ∧
    userThreeFormEditorialDirection ≠ assistantThreeFormEquation := by
  decide

/-- The projection that forgets everything except form degree is not
injective on the source-aware records. -/
theorem degree_projection_not_injective :
    ∃ a b : RepresentationRecord,
      degreeProjection a = degreeProjection b ∧ a ≠ b := by
  exact ⟨worldsheetPoincareDual, hodgeDualOfTwoForm, by decide⟩

#eval (degreeProjection worldsheetPoincareDual,
  degreeProjection hodgeDualOfTwoForm)
#eval (worldsheetPoincareDual.objectKind,
  hodgeDualOfTwoForm.objectKind)
#eval (blockwaveRankTwoCurrent.formDegree,
  blockwaveRankTwoCurrent.supportDimension)

#print axioms two_form_degree_does_not_identify_operation
#print axioms blockwave_rank_two_does_not_supply_form_or_support
#print axioms editorial_direction_does_not_attest_equation
#print axioms degree_projection_not_injective

end HsHVerification.SableCurrentIdentityGate


/-!
## Conditional Kerr-surface / spatial-section dimension crosswalk

The tags below preserve two different parameter roles and two different
cross-section types:

* \`kerrTime\` with \`fixedRSurface\`: the standard Kerr-shell note's
  constant-\`r\` 2D surface swept along a time parameter.
* \`filamentParameter\` with \`spatialKerrSection\`: the source-faithful
  reconstruction's 3D spatial-section fiber extended along a filament
  parameter.

Both base dimensions are stipulated as one. The cross-section dimensions
(2 and 3) are input typings, not derived from an embedding. No map identifies
Kerr time with the filament parameter, and no map identifies the fixed-r
surface with the 3D spatial section or its boundary.

The arithmetic below is conditional on a local product/trivialization. The
slice formulas are conditional on transversality; the boundary formula is
conditional on a regular boundary. None of those geometric conditions is
proved here. No embedding, bundle, filling, boundary identification, or
physical readout is constructed.
-/

namespace HsHVerification.SableKerrSectionCrosswalk

inductive SweepBase where
  | kerrTime
  | filamentParameter
  deriving DecidableEq, Repr

inductive CrossSection where
  | fixedRSurface
  | spatialKerrSection
  deriving DecidableEq, Repr

def baseDimension : SweepBase → Nat
  | .kerrTime => 1
  | .filamentParameter => 1

def crossSectionDimension : CrossSection → Nat
  | .fixedRSurface => 2
  | .spatialKerrSection => 3

/-- Conditional total dimension under a local product/trivialization. -/
def localProductSupportDimension
    (base : SweepBase) (crossSection : CrossSection) : Nat :=
  baseDimension base + crossSectionDimension crossSection

theorem conditional_local_product_dimension_of_kerr_time_swept_fixed_r_surface :
    localProductSupportDimension .kerrTime .fixedRSurface = 3 := by
  decide

theorem conditional_local_product_dimension_of_filament_over_fixed_r_surface :
    localProductSupportDimension .filamentParameter .fixedRSurface = 3 := by
  decide

theorem conditional_local_product_dimension_of_filament_over_spatial_kerr_section :
    localProductSupportDimension .filamentParameter .spatialKerrSection = 4 := by
  decide

theorem conditional_local_product_support_dimensions_differ :
    localProductSupportDimension .kerrTime .fixedRSurface ≠
      localProductSupportDimension .filamentParameter .spatialKerrSection := by
  decide

theorem fixed_r_surface_and_spatial_section_have_different_fiber_dimensions :
    crossSectionDimension .fixedRSurface ≠
      crossSectionDimension .spatialKerrSection := by
  decide

/-- Arithmetic value of the existing boundary-dimension convention.
The regularity and existence of a geometric boundary are not formalized. -/
theorem conditional_boundary_dimension_value_for_three_dimensional_section :
    HsHVerification.SableCurrentSupportDegreeGate.boundarySupportDimension 3 = 2 := by
  norm_num [HsHVerification.SableCurrentSupportDegreeGate.boundarySupportDimension]

/-- Value of the existing transverse-slice dimension formula for the
Kerr-time sweep. Transversality itself is not proved by this theorem. -/
theorem conditional_transverse_slice_dimension_value_for_kerr_time_swept_surface :
    HsHVerification.SableCurrentSupportDegreeGate.transverseHypersurfaceSliceDimension
      (localProductSupportDimension .kerrTime .fixedRSurface) = 2 := by
  norm_num [localProductSupportDimension, baseDimension, crossSectionDimension,
    HsHVerification.SableCurrentSupportDegreeGate.transverseHypersurfaceSliceDimension]

/-- Value of the same formula for the 4D filament-fibered support.
This is not a particle/readout map. -/
theorem conditional_transverse_slice_dimension_value_for_fibered_worldtube :
    HsHVerification.SableCurrentSupportDegreeGate.transverseHypersurfaceSliceDimension
      (localProductSupportDimension .filamentParameter .spatialKerrSection) = 3 := by
  norm_num [localProductSupportDimension, baseDimension, crossSectionDimension,
    HsHVerification.SableCurrentSupportDegreeGate.transverseHypersurfaceSliceDimension]

#eval (localProductSupportDimension .kerrTime .fixedRSurface,
  localProductSupportDimension .filamentParameter .spatialKerrSection)

#eval
  (HsHVerification.SableCurrentSupportDegreeGate.transverseHypersurfaceSliceDimension
    (localProductSupportDimension .kerrTime .fixedRSurface),
   HsHVerification.SableCurrentSupportDegreeGate.transverseHypersurfaceSliceDimension
    (localProductSupportDimension .filamentParameter .spatialKerrSection))

#print axioms conditional_local_product_dimension_of_kerr_time_swept_fixed_r_surface
#print axioms conditional_local_product_dimension_of_filament_over_fixed_r_surface
#print axioms conditional_local_product_dimension_of_filament_over_spatial_kerr_section
#print axioms conditional_local_product_support_dimensions_differ
#print axioms fixed_r_surface_and_spatial_section_have_different_fiber_dimensions
#print axioms conditional_boundary_dimension_value_for_three_dimensional_section
#print axioms conditional_transverse_slice_dimension_value_for_kerr_time_swept_surface
#print axioms conditional_transverse_slice_dimension_value_for_fibered_worldtube

end HsHVerification.SableKerrSectionCrosswalk
