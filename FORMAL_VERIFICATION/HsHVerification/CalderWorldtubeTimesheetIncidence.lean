import Mathlib

/-!
A minimal set-theoretic incidence layer for the source-language pair
"four-dimensional filament/worldtube" and "three-dimensional timesheet".

This module deliberately does not assume a metric, dimension, foliation,
smoothness, finite-core model, or responsive-medium law.  It formalizes only
the incidence/readout operation F ∩ Σ.  The non-injectivity theorem is
conditional: it applies when an admissible off-sheet extension H disjoint
from Σ is allowed.  It is not by itself a physical claim that every such H
is an admissible H(s)H worldtube.
-/

namespace HsH.Calder.WorldtubeTimesheet

variable {X Y : Type*}

/-- The timesheet readout of a filament/worldtube subset. -/
def slice (F Sigma : Set X) : Set X := F ∩ Sigma

theorem slice_subset_filament (F Sigma : Set X) :
    slice F Sigma ⊆ F := by
  intro x hx
  exact hx.1

theorem slice_subset_timesheet (F Sigma : Set X) :
    slice F Sigma ⊆ Sigma := by
  intro x hx
  exact hx.2

/-- Slicing distributes over a union of filament sets. -/
theorem slice_union (F G Sigma : Set X) :
    slice (F ∪ G) Sigma = slice F Sigma ∪ slice G Sigma := by
  ext x
  simp [slice, and_or_left_comm, and_or_right_comm, and_assoc]

/-- Incidence readout is covariant under a bijective coordinate relabelling. -/
theorem image_slice_equiv (e : X ≃ Y) (F Sigma : Set X) :
    e '' slice F Sigma = slice (e '' F) (e '' Sigma) := by
  ext y
  constructor
  · rintro ⟨x, hx, hxy⟩
    change x ∈ F ∩ Sigma at hx
    change y ∈ (e '' F) ∩ (e '' Sigma)
    constructor
    · exact ⟨x, hx.1, hxy⟩
    · exact ⟨x, hx.2, hxy⟩
  · rintro ⟨⟨x, hxF, hxy⟩, ⟨x', hxSigma, hxy'⟩⟩
    have hxx' : x = x' := e.injective (hxy.trans hxy'.symm)
    subst x'
    exact ⟨x, ⟨hxF, hxSigma⟩, hxy⟩

/-- Adding a set disjoint from the timesheet leaves the readout unchanged. -/
theorem slice_union_disjoint_extension (F H Sigma : Set X)
    (hDisjoint : Disjoint H Sigma) :
    slice (F ∪ H) Sigma = slice F Sigma := by
  have hdis : ∀ ⦃x : X⦄, x ∈ H → x ∈ Sigma → False :=
    Set.disjoint_left.mp hDisjoint
  ext x
  constructor
  · rintro ⟨hFH, hSigma⟩
    rcases hFH with hF | hH
    · exact ⟨hF, hSigma⟩
    · exact False.elim (hdis hH hSigma)
  · rintro ⟨hF, hSigma⟩
    exact ⟨Or.inl hF, hSigma⟩

/--
Conditional inverse non-uniqueness: if a nonempty off-sheet extension H is
disjoint from Sigma and is not already contained in F, then F and F ∪ H are
different source sets with exactly the same timesheet readout.
-/
theorem slice_noninjective_of_disjoint_extension
    (F H Sigma : Set X)
    (hDisjoint : Disjoint H Sigma)
    (hNotSub : ¬ H ⊆ F) :
    slice (F ∪ H) Sigma = slice F Sigma ∧ F ∪ H ≠ F := by
  constructor
  · exact slice_union_disjoint_extension F H Sigma hDisjoint
  · intro hEq
    apply hNotSub
    intro x hx
    have hx' : x ∈ F ∪ H := Or.inr hx
    rw [hEq] at hx'
    exact hx'

#print axioms slice_union
#print axioms image_slice_equiv
#print axioms slice_union_disjoint_extension
#print axioms slice_noninjective_of_disjoint_extension

end HsH.Calder.WorldtubeTimesheet
