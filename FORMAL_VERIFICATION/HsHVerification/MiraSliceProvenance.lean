import Mathlib

/-!
# Source-conditional moving-section / moving-filament mapping

Bibliographic witnesses:
- Charles Howard Hinton, The Fourth Dimension, 1906 edition,
  original first edition 1904; moving spiral/film/filament discussion.
- W. Whately Smith, A Theory of the Mechanism of Survival (1920),
  thread/soap-film construction and explicit citation of Hinton.
- Nathan user-role original 2024-03-22 15:10:05 UTC DIMENSIONAL GRAVITY.

This formalizes a **rigid relative-translation equivalence** only.
The historical sources also allow changing/deforming filaments; that is
NOT covered by this equivalence. No physical dynamics, empirical
observation, historical influence, or SAT/H(s)H truth is proved.
-/

namespace HsHVerification.MiraSliceProvenance

/-- A geometric curve/filament represented as a three-coordinate predicate
has a section at a given third-coordinate height. -/
def sectionAt (C : ℝ → ℝ → ℝ → Prop) (h : ℝ) : Set (ℝ × ℝ) :=
  {p | C p.1 p.2 h}

/-- Move the filament by minus h in the third coordinate, keeping
the observational film at coordinate zero. -/
def translatedFilament (C : ℝ → ℝ → ℝ → Prop) (h : ℝ) :
    ℝ → ℝ → ℝ → Prop :=
  fun x y z => C x y (z + h)

/-- A rigidly moving filament against a fixed film and a fixed filament
against a moving film have exactly the same transverse section. -/
theorem moving_film_equals_rigid_filament (C : ℝ → ℝ → ℝ → Prop) (h : ℝ) :
    sectionAt C h = sectionAt (translatedFilament C h) 0 := by
  ext p
  simp [sectionAt, translatedFilament]

/-- An arbitrary evolving filament D has the same section as C at h
if and only if the cross-sectional predicates agree pointwise. The
historical descriptions alone do not guarantee this extra premise. -/
theorem arbitrary_filament_section_criterion
    (C D : ℝ → ℝ → ℝ → Prop) (h : ℝ) :
    sectionAt C h = sectionAt D 0 ↔
      ∀ x y, (C x y h ↔ D x y 0) := by
  constructor
  · intro heq x y
    have hp := Set.ext_iff.mp heq (x, y)
    simpa [sectionAt] using hp
  · intro hp
    ext p
    change C p.1 p.2 h ↔ D p.1 p.2 0
    exact hp p.1 p.2

#print axioms moving_film_equals_rigid_filament
#print axioms arbitrary_filament_section_criterion

end HsHVerification.MiraSliceProvenance
