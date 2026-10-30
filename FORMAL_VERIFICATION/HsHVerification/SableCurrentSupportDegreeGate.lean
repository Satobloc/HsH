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
This theorem checks only the degree arithmetic, not Stokes or current existence. -/
theorem boundary_raises_poincare_dual_degree_by_one
    (k : Nat) (hk : 1 ≤ k) :
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
    (k : Nat) (hk : 1 ≤ k) :
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
