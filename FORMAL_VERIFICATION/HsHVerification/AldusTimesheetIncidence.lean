import Mathlib
import HsHVerification.KestrelIntersectionDimensionGate

/-!
# Aldus: timesheet-contained-core incidence

This module formalizes a conditional *local tangent-space* consequence of a
longitudinal incidence choice.

Let L be the one-dimensional core tangent, U the three-dimensional
timesheet tangent, and W a three-dimensional normal complement to L in a
four-dimensional ambient tangent space. If L ≤ U, then U ∩ W is
two-dimensional.

The theorem does not assert that the physical core lies in a timesheet,
construct a smooth global subbundle, identify the time-normal with this
plane, construct a tubular embedding, or establish a physical response law.
Those are separate source and geometry obligations.

Source anchors:
* Nathan Direct, 2026-10-07, message
  1d284b55-d7be-45f7-92a6-15e4734347c8: qualitative time-normal
  angular rotation/torsion under matter interaction; no operational
  connection, metric, units, or response map.
* Nathan Direct, 2026-11-08 geometry cluster, as source-audited in
  Aldus h1118:s2: tentative 4D tube / 1D core / 3D boundary and
  possible timesheet mouth; no unique incidence map.
* Nathan Direct, 2024-03-22 DIMENSIONAL GRAVITY messages
  aaa2269b-7eab-4781-9454-647098d6747f,
  aaa2d0b1-017d-453e-b95a-b23915f87d32, and
  aaa2a1cc-e884-4f6a-800f-8afc29ab221a: instantaneous fixed-slice
  intersection distinguished from the trace made by a moving slice.

The 2024 moving-slice case and the 2026 finite-core/timesheet proposal are
not identified by this formalization.
-/

namespace HsHVerification.AldusTimesheetIncidence

open Module

variable {K V : Type*}
variable [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

local instance submoduleFiniteDimensional (U : Submodule K V) :
    FiniteDimensional K U :=
  Submodule.finiteDimensional_of_le (le_top : U ≤ ⊤)

/-- A one-dimensional core tangent and its three-dimensional normal
complement have zero-dimensional intersection when they span the ambient
four-dimensional tangent space. -/
theorem core_normal_complement_has_zero_intersection
    (L W : Submodule K V)
    (hL : finrank K L = 1)
    (hW : finrank K W = 3)
    (hV : finrank K V = 4)
    (hCorePlusNormal : L ⊔ W = ⊤) :
    finrank K (L ⊓ W : Submodule K V) = 0 := by
  have hdim :=
    HsHVerification.KestrelIntersectionDimensionGate.transverse_intersection_finrank
      L W hCorePlusNormal
  omega

/-- If the core tangent lies in the timesheet tangent, a complement of the
core together with the timesheet still spans the ambient tangent space. -/
theorem contained_core_and_normal_span
    (L U W : Submodule K V)
    (hCoreInTimesheet : L ≤ U)
    (hCorePlusNormal : L ⊔ W = ⊤) :
    U ⊔ W = ⊤ := by
  apply top_unique
  rw [← hCorePlusNormal]
  exact sup_le (le_trans hCoreInTimesheet le_sup_left) le_sup_right

/-- Longitudinal incidence selects a two-dimensional plane in the normal
space: if a three-dimensional timesheet contains the core tangent and W is
a three-dimensional complement to that core in a four-dimensional ambient
space, then U ∩ W has dimension two.

This is a pointwise tangent-space theorem. A smooth rank-two bundle along
the whole core additionally requires smooth source bundles and constant
rank; the theorem does not establish that global construction. -/
theorem contained_core_selects_two_dimensional_normal_plane
    (L U W : Submodule K V)
    (hL : finrank K L = 1)
    (hU : finrank K U = 3)
    (hW : finrank K W = 3)
    (hV : finrank K V = 4)
    (hCoreInTimesheet : L ≤ U)
    (hCorePlusNormal : L ⊔ W = ⊤) :
    finrank K (L ⊓ W : Submodule K V) = 0 ∧
    finrank K (U ⊓ W : Submodule K V) = 2 := by
  constructor
  · exact core_normal_complement_has_zero_intersection
      L W hL hW hV hCorePlusNormal
  · have hspan :=
      contained_core_and_normal_span L U W hCoreInTimesheet hCorePlusNormal
    have hdim :=
      HsHVerification.KestrelIntersectionDimensionGate.transverse_intersection_finrank
        U W hspan
    omega

#print axioms core_normal_complement_has_zero_intersection
#print axioms contained_core_and_normal_span
#print axioms contained_core_selects_two_dimensional_normal_plane

end HsHVerification.AldusTimesheetIncidence
