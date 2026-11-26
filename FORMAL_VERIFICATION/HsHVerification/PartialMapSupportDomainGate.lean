import HsHVerification.PartialMapDomainGate

/-!
Support-relative comparison for partial geometry-to-observable maps.

A partial route should be compared on an independently declared source
support S, not on the whole ambient type and not merely on the intersection
of the routes' own domains.  The effective domain is S ∩ dom(f).  Equality
of the restricted routes is equivalent to equality of those effective
domains plus equality of values wherever defined on that support.

This is a generic formal contract.  It does not define a physical source
support, a worldtube, a detector map, or an H(s)H observable.
-/

namespace HsHVerification.PartialMapSupportDomainGate

open HsHVerification.PartialMapDomainGate

/-- The part of a partial map's definedness domain admitted by source
    support S. -/
def supportedDomain {α β : Type*} (S : Set α) (f : α → Option β) : Set α :=
  S ∩ partialDomain f

/-- Restrict a partial map to an independently declared source support.
    Decidable membership makes the restriction executable. -/
def restrictToSupport {α β : Type*} (S : Set α)
    [DecidablePred (fun x => x ∈ S)] (f : α → Option β) : α → Option β :=
  fun x => if x ∈ S then f x else none

/-- Equality of effective domains is exactly equality of definedness on
    the declared source support. -/
theorem supportedDomain_eq_iff_definedness
    {α β : Type*} (S : Set α) (f g : α → Option β) :
    supportedDomain S f = supportedDomain S g ↔
      ∀ x, x ∈ S → (x ∈ partialDomain f ↔ x ∈ partialDomain g) := by
  constructor
  · intro h x hxS
    have hx : x ∈ supportedDomain S f ↔ x ∈ supportedDomain S g := by
      rw [h]
    simpa [supportedDomain, hxS] using hx
  · intro h
    ext x
    constructor
    · rintro ⟨hxS, hxF⟩
      exact ⟨hxS, (h x hxS).mp hxF⟩
    · rintro ⟨hxS, hxG⟩
      exact ⟨hxS, (h x hxS).mpr hxG⟩

/-- Restricted partial maps are equal iff their effective domains agree
    and their values agree on that effective domain. -/
theorem restrictToSupport_ext_iff_domain_and_values
    {α β : Type*} (S : Set α)
    [DecidablePred (fun x => x ∈ S)] (f g : α → Option β) :
    restrictToSupport S f = restrictToSupport S g ↔
      supportedDomain S f = supportedDomain S g ∧
      ∀ x, x ∈ supportedDomain S f → f x = g x := by
  constructor
  · intro h
    constructor
    · ext x
      constructor
      · rintro ⟨hxS, hxF⟩
        have hfg : f x = g x := by
          have hxy := congrFun h x
          simpa [restrictToSupport, hxS] using hxy
        exact ⟨hxS, by simpa [partialDomain, hfg] using hxF⟩
      · rintro ⟨hxS, hxG⟩
        have hfg : f x = g x := by
          have hxy := congrFun h x
          simpa [restrictToSupport, hxS] using hxy
        exact ⟨hxS, by simpa [partialDomain, hfg] using hxG⟩
    · intro x hx
      rcases hx with ⟨hxS, _⟩
      have hxy := congrFun h x
      simpa [restrictToSupport, hxS] using hxy
  · rintro ⟨hdom, hval⟩
    funext x
    by_cases hxS : x ∈ S
    · simp [restrictToSupport, hxS]
      by_cases hxF : x ∈ partialDomain f
      · exact hval x ⟨hxS, hxF⟩
      · have hxG : x ∉ partialDomain g := by
          intro hxG
          have hxG' : x ∈ supportedDomain S g := ⟨hxS, hxG⟩
          have hxF' : x ∈ supportedDomain S f := by
            rw [hdom]
            exact hxG'
          exact hxF hxF'.2
        have hf : f x = none := by
          cases hfx : f x with
          | none => rfl
          | some y => exact (hxF (by simp [partialDomain, hfx])).elim
        have hg : g x = none := by
          cases hgx : g x with
          | none => rfl
          | some y => exact (hxG (by simp [partialDomain, hgx])).elim
        rw [hf, hg]
    · simp [restrictToSupport, hxS]

/-- A route difference entirely outside the declared support is irrelevant
    to the restricted comparison.  This Bool/Unit example is logical only. -/
def allDefined : Bool → Option Unit := fun _ => some ()
def trueOnly : Bool → Option Unit := fun b => if b then some () else none
def trueSupport : Set Bool := {true}

theorem routes_equal_on_true_support :
    restrictToSupport trueSupport allDefined =
      restrictToSupport trueSupport trueOnly := by
  funext b
  cases b <;> simp [restrictToSupport, trueSupport, allDefined, trueOnly]

theorem routes_not_equal_globally : allDefined ≠ trueOnly := by
  intro h
  have hfalse := congrFun h false
  simp [allDefined, trueOnly] at hfalse

/-- If the excluded state belongs to the source support, restriction does
    not hide the route's missing value. -/
theorem supported_exclusion_remains_visible :
    restrictToSupport (Set.univ : Set Bool) allDefined ≠
      restrictToSupport Set.univ trueOnly := by
  intro h
  have hfalse := congrFun h false
  simp [restrictToSupport, allDefined, trueOnly] at hfalse

#eval
  ( restrictToSupport trueSupport allDefined false
  , restrictToSupport trueSupport trueOnly false
  , restrictToSupport trueSupport allDefined true
  , restrictToSupport trueSupport trueOnly true )

#print axioms HsHVerification.PartialMapSupportDomainGate.supportedDomain_eq_iff_definedness
#print axioms HsHVerification.PartialMapSupportDomainGate.restrictToSupport_ext_iff_domain_and_values
#print axioms HsHVerification.PartialMapSupportDomainGate.routes_equal_on_true_support
#print axioms HsHVerification.PartialMapSupportDomainGate.supported_exclusion_remains_visible

end HsHVerification.PartialMapSupportDomainGate
