import Mathlib

/-!
# Kestrel intersection-dimension gate

This module formalizes a conditional tangent-space dimension identity only.
It does not establish that a physical SAT/H(s)H object has any particular
dimension, that a proposed slice is a physical object, or that an observed
projection is an actual transverse intersection.

Source trail:
* Nathan Direct, HsH `DIMENSIONAL GRAVITY` raw conversation,
  conversation `2cea192a7d16b57a27c531ac7c860e42`, blob
  `2cea1924266418e19b825b95ae51e6b7cbace7e1`, created 2024-03-22.
  User nodes: `aaa2269b-7eab-4781-9454-647098d6747f` (line/plane
  intersection is one point), `aaa2d0b1-017d-453e-b95a-b23915f87d32`
  (moving slice makes the intersection point trace a circle), and
  `aaa2a1cc-e884-4f6a-800f-8afc29ab221a` (circle radius is set by
  helix cross-section, not pitch).
* Historical SAT4D draft, `SAT4D_LIVE_DRAFT.txt`, blob
  `2a79fe25018cce7e99a2c33786d88b0551db6ae7`, source header June 2025,
  lines 143-160. The file header names Nathan McKnight; line-level
  authorship of every embedded equation is not separately authenticated.
* Historical Blockwave one-action: assistant message
  `121d607d-53e7-4b5a-8a7a-75d7e09deb3d` in raw conversation blob
  `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`, 2025-10-19.
  Its `J^{\\mu\\nu}` is explicitly described as a two-form
  worldsheet current. The user's later re-paste of the action is not
  independent authorship of the notation.
* Nathan Direct, Meridian Free Build raw blob
  `7af1561b321f4d9364da5eb111df689efc652827`, 2026-10-09:
  one-core / finite-core worldtube and 3D intersectional-trace statements.
* Nathan Direct, Meridian Minkowski Ring Analysis raw blob
  `56a84cb85d5c386efa4ea11d322d11e95e2c7703`, 2026-10-20:
  the user distinguishes one instantaneous slice from the evolving
  four-dimensional structure. The 2026-10-21 Klein-Fabric supersession
  annotation is in a mixed-source user message; it does not define the
  adopted global topology.

The 2024 curve/plane case, the assistant-generated 2025 worldsheet current,
and the 2026 finite-core 4D region are distinct geometric types. The
corollaries below expose the consequences *if* the stated tangent dimensions
and transversality hold. They do not decide which type the physical object has.
-/

namespace HsHVerification.KestrelIntersectionDimensionGate

open Module

variable {K V : Type*}
variable [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- Every submodule of a finite-dimensional ambient vector space is
finite-dimensional. This local instance keeps the dimension statements
explicitly within that ambient-space assumption. -/
local instance submoduleFiniteDimensional (U : Submodule K V) :
    FiniteDimensional K U :=
  Submodule.finiteDimensional_of_le (le_top : U ≤ ⊤)

/-- For transverse subspaces U and W, dim(U ∩ W) + dim(V) = dim(U) + dim(W).
Here transversality is the explicit linear condition U ⊔ W = ⊤. -/
theorem transverse_intersection_finrank
    (U W : Submodule K V) (htrans : U ⊔ W = ⊤) :
    finrank K (U ⊓ W) + finrank K V = finrank K U + finrank K W := by
  have h := Submodule.finrank_sup_add_finrank_inf_eq U W
  rw [htrans, finrank_top] at h
  simpa [add_comm] using h

/-- A transverse one-dimensional curve and two-dimensional plane in a
three-dimensional ambient tangent space have a zero-dimensional
instantaneous intersection. This is not the trajectory of the intersection
point as the plane moves. -/
theorem transverse_curve_plane_finrank_zero
    (U W : Submodule K V)
    (hU : finrank K U = 1)
    (hW : finrank K W = 2)
    (hV : finrank K V = 3)
    (htrans : U ⊔ W = ⊤) :
    finrank K (U ⊓ W) = 0 := by
  have h := transverse_intersection_finrank U W htrans
  omega

/-- A transverse one-dimensional worldline and three-dimensional
hypersurface in a four-dimensional ambient tangent space meet in dimension
zero. -/
theorem transverse_worldline_hypersurface_finrank_zero
    (U W : Submodule K V)
    (hU : finrank K U = 1)
    (hW : finrank K W = 3)
    (hV : finrank K V = 4)
    (htrans : U ⊔ W = ⊤) :
    finrank K (U ⊓ W) = 0 := by
  have h := transverse_intersection_finrank U W htrans
  omega

/-- If a two-dimensional worldsheet intersects a three-dimensional
hypersurface transversely in a four-dimensional ambient space, the tangent
intersection is one-dimensional. This is the conditional type of the
assistant-generated Blockwave worldsheet current, not a claim about the
current H(s)H finite-core object. -/
theorem transverse_worldsheet_hypersurface_finrank_one
    (U W : Submodule K V)
    (hU : finrank K U = 2)
    (hW : finrank K W = 3)
    (hV : finrank K V = 4)
    (htrans : U ⊔ W = ⊤) :
    finrank K (U ⊓ W) = 1 := by
  have h := transverse_intersection_finrank U W htrans
  omega

/-- A full-dimensional finite-core region intersected transversely with a
three-dimensional hypersurface in four dimensions has a three-dimensional
tangent intersection. The theorem does not assert that a SAT/H(s)H
worldtube is full-dimensional; that remains a source-level type question. -/
theorem transverse_full_core_hypersurface_finrank_three
    (U W : Submodule K V)
    (hU : finrank K U = 4)
    (hW : finrank K W = 3)
    (hV : finrank K V = 4)
    (htrans : U ⊔ W = ⊤) :
    finrank K (U ⊓ W) = 3 := by
  have h := transverse_intersection_finrank U W htrans
  omega

#print axioms transverse_intersection_finrank
#print axioms transverse_curve_plane_finrank_zero
#print axioms transverse_worldline_hypersurface_finrank_zero
#print axioms transverse_worldsheet_hypersurface_finrank_one
#print axioms transverse_full_core_hypersurface_finrank_three

end HsHVerification.KestrelIntersectionDimensionGate
