import Mathlib

/-!
# Alberr sail/worldline source-fidelity map (2026-10-27)

Primary Nathan-authored messages, 2025-05-11:
- 09:03:39 UTC fbbf13ad-70f5-40b5-b694-dee31bcca8dc
- 09:27:36 UTC 7edbc632-5e42-4fb3-8aab-c31e1bf6b9c6
- 09:53:48 UTC 82dd95c8-d444-4d4a-9da2-1e1e6f3693c4
- 10:19:02 UTC e4700493-b35b-48da-bef1-b0beacbab1ef
Original HsH export Git blob c98f63fa861b0df478a5fa98dff54d731348c81f.

These theorems formalize conditional set-theoretic intersection, coverage
and coordinate-map statements. They do NOT formalize time, topology,
dimension, the original drawings, or physical existence. In particular
"visible at a sheet" and "exists in the ambient carrier" are different
predicates unless additional assumptions are supplied.
-/

namespace HsHVerification.AlberrSailTraceFidelity

variable {X Y T : Type*}

/-- The abstract trace of an ambient support on a resolving sheet. -/
def trace (support sheet : Set X) : Set X := support ∩ sheet

theorem trace_subset_support (support sheet : Set X) :
    trace support sheet ⊆ support := by
  intro x hx
  exact hx.1

/-- Full sheet coverage suffices to reconstruct the underlying set support
    from the union of its traces. This does not recover material frames,
    multiplicity, winding, dynamics or observational uncertainties. -/
theorem trace_union_recovers_support_of_cover
    (support : Set X) (sheets : T → Set X)
    (hcover : ∀ x : X, ∃ t : T, x ∈ sheets t) :
    support = ⋃ t : T, trace support (sheets t) := by
  ext x
  constructor
  · intro hx
    obtain ⟨t, ht⟩ := hcover x
    exact Set.mem_iUnion.mpr ⟨t, ⟨hx, ht⟩⟩
  · intro hx
    rcases Set.mem_iUnion.mp hx with ⟨t, ht⟩
    exact ht.1

/-- A support point never covered by any sheet is not recovered by
    unioning the traces. No physical counterexample is invented here. -/
theorem unseen_support_not_recovered
    (support : Set X) (sheets : T → Set X) (x : X)
    (hx : x ∈ support) (hmiss : ∀ t : T, x ∉ sheets t) :
    support ≠ ⋃ t : T, trace support (sheets t) := by
  intro h
  have hseen : x ∈ ⋃ t : T, trace support (sheets t) := h ▸ hx
  rcases Set.mem_iUnion.mp hseen with ⟨t, ht⟩
  exact hmiss t ht.2

/-- Every image of a trace lies in the intersection of the two images.
    Equality requires additional conditions on the map. -/
theorem mapped_trace_subset
    (f : X → Y) (support sheet : Set X) :
    f '' trace support sheet ⊆ trace (f '' support) (f '' sheet) := by
  intro y hy
  rcases hy with ⟨x, hx, rfl⟩
  exact ⟨⟨x, hx.1, rfl⟩, ⟨x, hx.2, rfl⟩⟩

/-- An injective ambient map commutes with the set-intersection trace.
    No such result is asserted for an arbitrary lossy projection. -/
theorem mapped_trace_eq_of_injective
    (f : X → Y) (hf : Function.Injective f)
    (support sheet : Set X) :
    f '' trace support sheet = trace (f '' support) (f '' sheet) := by
  apply Set.Subset.antisymm
  · exact mapped_trace_subset f support sheet
  · intro y hy
    rcases hy.1 with ⟨x, hx, hxy⟩
    rcases hy.2 with ⟨z, hz, hzy⟩
    have hxz : x = z := hf (hxy.trans hzy.symm)
    subst z
    exact ⟨x, ⟨hx, hz⟩, hxy⟩

#print axioms trace_subset_support
#print axioms trace_union_recovers_support_of_cover
#print axioms unseen_support_not_recovered
#print axioms mapped_trace_subset
#print axioms mapped_trace_eq_of_injective

end HsHVerification.AlberrSailTraceFidelity
