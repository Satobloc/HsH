import Mathlib

/-!
# Branch-scoped map composition gate

Primary source motivation:
* Nathan Direct, Meridian Free Build, raw export blob
  7af1561b321f4d9364da5eb111df689efc652827, messages
  845c7190-202f-4fed-8056-b9b81c994fb9 and
  300da217-ffff-416e-8637-9b3327c0a9de (2026-10-09).
* Nathan Direct, Meridian Minkowski Ring Analysis, raw export blob
  56a84cb85d5c386efa4ea11d322d11e95e2c7703, messages
  090f5160-1020-486d-9c42-df3d7dff2063,
  47cf2603-bf28-439c-82b3-1f0e0c2a7dc8, and
  c5525f53-b7cc-4444-8102-3bf6fdb1c892 (2026-10-21).
* Source-fidelity audit: HsH issue #1495.

The October 9 local-radiality / mass-retarded-time-sheet discussion and the
later Klein-Fabric / Forest-normalization branch must not be silently fused.
The recovered sources do not provide a transition map between them.

This module is an abstract type-level workflow contract. It does NOT assert
that any particular transition map exists, that two branches are equivalent,
or that a physical prediction transfers. It proves only that:
* each map names its source and target branch through dependent type indices;
* staged maps compose only when their intermediate branch indices match;
* composition additionally requires an explicit intermediate-domain
  compatibility condition; and
* a claim can be transported across branches only through an explicit map.

No physical system, numerical fixture, fitted value, or empirical datum is
introduced here.
-/

namespace HsHVerification.EnheduannaBranchScopedMapComposition

universe u v

/-- A partial, source-grounded map between two explicitly identified model branches. -/
structure BranchMap {Branch : Type u} (Carrier : Branch → Type v)
    (Source Target : Branch) where
  apply : Carrier Source → Carrier Target
  admissible : Carrier Source → Prop
  targetAdmissible : Carrier Target → Prop
  preserves : ∀ x, admissible x → targetAdmissible (apply x)

/-- Compose maps only when the first target branch is the second source branch.
    The compatibility witness ensures every admissible first-stage output
    lies in the second map's declared domain. -/
def compose {Branch : Type u} {Carrier : Branch → Type v}
    {A B C : Branch}
    (first : BranchMap Carrier A B)
    (second : BranchMap Carrier B C)
    (compatible : ∀ x, first.admissible x → second.admissible (first.apply x)) :
    BranchMap Carrier A C where
  apply := fun x => second.apply (first.apply x)
  admissible := first.admissible
  targetAdmissible := second.targetAdmissible
  preserves := by
    intro x hx
    exact second.preserves (first.apply x) (compatible x hx)

/-- The composed map reaches the final target's admissible region. -/
theorem compose_preserves_target
    {Branch : Type u} {Carrier : Branch → Type v}
    {A B C : Branch}
    (first : BranchMap Carrier A B)
    (second : BranchMap Carrier B C)
    (compatible : ∀ x, first.admissible x → second.admissible (first.apply x))
    (x : Carrier A)
    (hx : first.admissible x) :
    (compose first second compatible).targetAdmissible
      ((compose first second compatible).apply x) := by
  exact (compose first second compatible).preserves x hx

/-- Transporting a target-branch claim requires an explicit map witness. -/
def transportClaim
    {Branch : Type u} {Carrier : Branch → Type v}
    {A B : Branch}
    (map : BranchMap Carrier A B)
    (claim : Carrier B → Prop)
    (x : Carrier A) : Prop :=
  map.admissible x → claim (map.apply x)

/-- Claim transport along a composed path agrees with staged transport
    when the intermediate-domain compatibility witness is supplied. -/
theorem transport_compose
    {Branch : Type u} {Carrier : Branch → Type v}
    {A B C : Branch}
    (first : BranchMap Carrier A B)
    (second : BranchMap Carrier B C)
    (compatible : ∀ x, first.admissible x → second.admissible (first.apply x))
    (claim : Carrier C → Prop)
    (x : Carrier A) :
    transportClaim (compose first second compatible) claim x ↔
      (first.admissible x → transportClaim second claim (first.apply x)) := by
  constructor
  · intro h hx _
    exact h hx
  · intro h hx
    exact h hx (compatible x hx)

/-- An identity map is branch-local: it starts and ends in the same branch. -/
def identity
    {Branch : Type u} {Carrier : Branch → Type v}
    (A : Branch) : BranchMap Carrier A A where
  apply := id
  admissible := fun _ => True
  targetAdmissible := fun _ => True
  preserves := by
    intro _ _
    trivial

/-- Identity transport does not change a claim within one branch. -/
theorem transport_identity
    {Branch : Type u} {Carrier : Branch → Type v}
    (A : Branch)
    (claim : Carrier A → Prop)
    (x : Carrier A) :
    transportClaim (identity A) claim x ↔ claim x := by
  simp [transportClaim, identity]

#print axioms compose_preserves_target
#print axioms transport_compose
#print axioms transport_identity

end HsHVerification.EnheduannaBranchScopedMapComposition
