import Mathlib

/-!
# ArchiveEQ0043 — explicit model-ladder projection gate

Historical source:
`Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT O1 4D.txt`,
blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`.

The source types a filament as a one-dimensional map and separately calls its
swept four-dimensional volume a worldtube. A later Nathan-direct source,
`H(s)H 2026 STARTUP DOCS.txt`, blob
`68200d849152dcb0c4fc1814f8b1789d499ebca8`, says thickness and bending were
already being modeled.

The nested records below are an assistant reconstruction of the requested
verification architecture. They are not source equations and do not establish
that any physical worldtube has the represented extra fields. Theorems prove
only consequences of explicitly adding and forgetting typed data.
-/

namespace HsHVerification.ArchiveEQ0043

structure Extension (Base Extra : Type*) where
  base : Base
  extra : Extra

def forget {Base Extra : Type*} : Extension Base Extra → Base :=
  fun model => model.base

def addExtra {Base Extra : Type*} (extra₀ : Extra) : Base → Extension Base Extra :=
  fun base => ⟨base, extra₀⟩

theorem forget_addExtra
    {Base Extra : Type*} (extra₀ : Extra) (base : Base) :
    forget (addExtra extra₀ base) = base := by
  rfl

theorem forget_not_injective_of_distinct_extras
    {Base Extra : Type*} (base : Base) {extra₁ extra₂ : Extra}
    (hdifferent : extra₁ ≠ extra₂) :
    ¬ Function.Injective (@forget Base Extra) := by
  intro hinjective
  have hmodels :
      (Extension.mk base extra₁ : Extension Base Extra) =
        Extension.mk base extra₂ := by
    apply hinjective
    rfl
  exact hdifferent (congrArg Extension.extra hmodels)

abbrev SweptVolumeModel (Centerline Volume : Type*) :=
  Extension Centerline Volume

abbrev FiniteTubeModel (Centerline Volume Radius : Type*) :=
  Extension (SweptVolumeModel Centerline Volume) Radius

abbrev FramedTubeModel
    (Centerline Volume Radius Frame : Type*) :=
  Extension (FiniteTubeModel Centerline Volume Radius) Frame

abbrev ContactTubeModel
    (Centerline Volume Radius Frame Contact : Type*) :=
  Extension (FramedTubeModel Centerline Volume Radius Frame) Contact

def sweptToCenterline
    {Centerline Volume : Type*} :
    SweptVolumeModel Centerline Volume → Centerline :=
  forget

def finiteToSwept
    {Centerline Volume Radius : Type*} :
    FiniteTubeModel Centerline Volume Radius →
      SweptVolumeModel Centerline Volume :=
  forget

def framedToFinite
    {Centerline Volume Radius Frame : Type*} :
    FramedTubeModel Centerline Volume Radius Frame →
      FiniteTubeModel Centerline Volume Radius :=
  forget

def contactToFramed
    {Centerline Volume Radius Frame Contact : Type*} :
    ContactTubeModel Centerline Volume Radius Frame Contact →
      FramedTubeModel Centerline Volume Radius Frame :=
  forget

def contactToCenterline
    {Centerline Volume Radius Frame Contact : Type*} :
    ContactTubeModel Centerline Volume Radius Frame Contact → Centerline :=
  fun model => model.base.base.base.base

theorem projection_chain_commutes
    {Centerline Volume Radius Frame Contact : Type*}
    (model : ContactTubeModel Centerline Volume Radius Frame Contact) :
    contactToCenterline model =
      sweptToCenterline
        (finiteToSwept
          (framedToFinite
            (contactToFramed model))) := by
  rfl

theorem swept_projection_not_injective
    {Centerline Volume : Type*}
    (centerline : Centerline) {volume₁ volume₂ : Volume}
    (hdifferent : volume₁ ≠ volume₂) :
    ¬ Function.Injective
      (@sweptToCenterline Centerline Volume) := by
  exact forget_not_injective_of_distinct_extras centerline hdifferent

theorem finite_projection_not_injective
    {Centerline Volume Radius : Type*}
    (swept : SweptVolumeModel Centerline Volume)
    {radius₁ radius₂ : Radius}
    (hdifferent : radius₁ ≠ radius₂) :
    ¬ Function.Injective
      (@finiteToSwept Centerline Volume Radius) := by
  exact forget_not_injective_of_distinct_extras swept hdifferent

theorem framed_projection_not_injective
    {Centerline Volume Radius Frame : Type*}
    (tube : FiniteTubeModel Centerline Volume Radius)
    {frame₁ frame₂ : Frame}
    (hdifferent : frame₁ ≠ frame₂) :
    ¬ Function.Injective
      (@framedToFinite Centerline Volume Radius Frame) := by
  exact forget_not_injective_of_distinct_extras tube hdifferent

theorem contact_projection_not_injective
    {Centerline Volume Radius Frame Contact : Type*}
    (tube : FramedTubeModel Centerline Volume Radius Frame)
    {contact₁ contact₂ : Contact}
    (hdifferent : contact₁ ≠ contact₂) :
    ¬ Function.Injective
      (@contactToFramed Centerline Volume Radius Frame Contact) := by
  exact forget_not_injective_of_distinct_extras tube hdifferent

#print axioms forget_addExtra
#print axioms forget_not_injective_of_distinct_extras
#print axioms projection_chain_commutes
#print axioms swept_projection_not_injective
#print axioms finite_projection_not_injective
#print axioms framed_projection_not_injective
#print axioms contact_projection_not_injective

end HsHVerification.ArchiveEQ0043
