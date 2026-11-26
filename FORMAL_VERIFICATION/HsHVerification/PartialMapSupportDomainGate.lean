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

/-- The part of a partial map's definedness domain admitted by a
    computable Boolean source-support mask S. -/
def supportedDomain {α β : Type*} (S : α → Bool) (f : α → Option β) : Set α :=
  {x | S x = true ∧ x ∈ partialDomain f}

/-- Restrict a partial map to an independently declared Boolean source
    support. The mask is executable and makes the restriction computable. -/
def restrictToSupport {α β : Type*} (S : α → Bool) (f : α → Option β) :
    α → Option β :=
  fun x => if S x then f x else none

/-- Equality of effective domains is exactly equality of definedness on
    the declared source support. -/
theorem supportedDomain_eq_iff_definedness
    {α β : Type*} (S : α → Bool) (f g : α → Option β) :
    supportedDomain S f = supportedDomain S g ↔
      ∀ x, S x = true → (x ∈ partialDomain f ↔ x ∈ partialDomain g) := by
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
    {α β : Type*} (S : α → Bool) (f g : α → Option β) :
    restrictToSupport S f = restrictToSupport S g ↔
      supportedDomain S f = supportedDomain S g ∧
      ∀ x, x ∈ supportedDomain S f → f x = g x := by
  constructor
  · intro h
    constructor
    · ext x
      by_cases hxS : S x = true
      · have hfg : f x = g x := by
          have hxy := congrFun h x
          simp [restrictToSupport, hxS] at hxy
          exact hxy
        constructor
        · rintro ⟨_, hxF⟩
          exact ⟨hxS, by simpa [partialDomain, hfg] using hxF⟩
        · rintro ⟨_, hxG⟩
          exact ⟨hxS, by simpa [partialDomain, hfg] using hxG⟩
      · simp [supportedDomain, hxS]
    · intro x hx
      rcases hx with ⟨hxS, _⟩
      have hxy := congrFun h x
      simp [restrictToSupport, hxS] at hxy
      exact hxy
  · rintro ⟨hdom, hval⟩
    funext x
    by_cases hxS : S x = true
    · cases hfx : f x with
      | none =>
        have hgx : g x = none := by
          cases hg : g x with
          | none => rfl
          | some y =>
            have hxG : x ∈ supportedDomain S g := by
              exact ⟨hxS, by simp [partialDomain, hg]⟩
            have hxF : x ∈ supportedDomain S f := by
              rw [hdom]
              exact hxG
            exact (by simpa [partialDomain, hfx] using hxF.2).elim
        simp [restrictToSupport, hxS, hfx, hgx]
      | some y =>
        have hfg : f x = g x :=
          hval x ⟨hxS, by simp [partialDomain, hfx]⟩
        simp [restrictToSupport, hxS]
        exact hfg
    · simp [restrictToSupport, hxS]

/-- A route difference entirely outside the declared support is irrelevant
    to the restricted comparison.  This Bool/Unit example is logical only. -/
def allDefined : Bool → Option Unit := fun _ => some ()
def trueOnly : Bool → Option Unit := fun b => if b then some () else none
def trueSupport : Bool → Bool := fun b => b
def allSupport : Bool → Bool := fun _ => true

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
    restrictToSupport allSupport allDefined ≠
      restrictToSupport allSupport trueOnly := by
  intro h
  have hfalse := congrFun h false
  simp [restrictToSupport, allSupport, allDefined, trueOnly] at hfalse

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
