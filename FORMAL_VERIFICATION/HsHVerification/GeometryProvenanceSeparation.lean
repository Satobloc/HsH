import Mathlib

/-!
Kestrel role-specific shape/provenance separation, 2026-10-26.
Primary source: Nathan's 2026-10-26 distinction between the geometric
object and its incomplete historical ancestry, plus Kestrel's
WORKSPACES/KESTREL/OPERATING_ASSUMPTIONS.md (blob
d9eda73236c74023ec8a060999667de99da39409).

This is an information-architecture contract, not a theorem about the
universe, an empirical physics calculation, or a historical attribution.
Geometry and its measured projection are typed separately from source
annotations. A source identifier is not an input to the projection.
-/

namespace HsHVerification.GeometryProvenanceSeparation

structure Reconstruction (Source Geometry : Type*) where
  source : Option Source
  geometry : Geometry

def readout {Source Geometry Observable : Type*}
    (project : Geometry → Observable)
    (r : Reconstruction Source Geometry) : Observable :=
  project r.geometry

/-- Changing the historical source annotation does not change the
    geometric readout *under the explicitly source-blind readout contract*. -/
theorem source_annotation_invariant
    {Source Geometry Observable : Type*}
    (project : Geometry → Observable)
    (r : Reconstruction Source Geometry)
    (newSource : Option Source) :
    readout project { r with source := newSource } = readout project r := by
  rfl

/-- An unannotated geometric object still has a well-typed readout.
    This does not prove the object is physically correct. -/
theorem unknown_source_still_projects
    {Source Geometry Observable : Type*}
    (project : Geometry → Observable) (g : Geometry) :
    readout project (⟨none, g⟩ : Reconstruction Source Geometry) = project g := by
  rfl

/-- Negative control: source equality alone does not entail geometry
    equality. The two records have equally unknown source annotations. -/
theorem same_source_not_enough_to_identify_geometry :
    ∃ a b : Reconstruction Bool Bool,
      a.source = b.source ∧ a.geometry ≠ b.geometry := by
  exact ⟨⟨none, false⟩, ⟨none, true⟩, rfl, by decide⟩

/-- Negative control: a non-injective projection can conceal different
    geometries. Therefore readout agreement is not full model identity. -/
theorem readout_agreement_not_geometry_identity :
    ∃ (project : Bool → Unit) (a b : Bool),
      a ≠ b ∧ project a = project b := by
  exact ⟨fun _ => (), false, true, by decide, rfl⟩

end HsHVerification.GeometryProvenanceSeparation
