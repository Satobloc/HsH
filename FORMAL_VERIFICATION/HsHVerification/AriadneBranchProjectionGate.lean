import Mathlib

/-!
Ariadne branch-provenance gate, 2026-10-28.
A real original conversation JSON has distinct user-message siblings with one
shared parent but different active-chain membership and in one case opposite
caption-edit direction ("from" versus "to"). The private original source is
identified by SHA-256 in the source audit; no private text or message IDs
are embedded here. These theorems are conditional, generic mathematics:
they do NOT verify the JSON parser, identify a historical speaker, or prove
any H(s)H physical or cognitive claim.
-/

namespace HsHVerification.AriadneBranch

theorem parent_projection_not_injective
    {Node Parent : Type*} (parent : Node → Parent)
    (draft selected : Node) (different : draft ≠ selected)
    (siblings : parent draft = parent selected) :
    ¬ Function.Injective parent := by
  intro hInjective
  exact different (hInjective siblings)

theorem no_two_sibling_decoder
    {Node Parent : Type*} (parent : Node → Parent)
    (draft selected : Node) (different : draft ≠ selected)
    (siblings : parent draft = parent selected) :
    ¬ ∃ decode : Parent → Node,
      decode (parent draft) = draft ∧
      decode (parent selected) = selected := by
  rintro ⟨decode, hDraft, hSelected⟩
  apply different
  calc
    draft = decode (parent draft) := hDraft.symm
    _ = decode (parent selected) := congrArg decode siblings
    _ = selected := hSelected

theorem active_membership_not_parent_only
    {Node Parent : Type*} (parent : Node → Parent)
    (active : Node → Bool) (draft selected : Node)
    (siblings : parent draft = parent selected)
    (different_status : active draft ≠ active selected) :
    ¬ ∃ classify : Parent → Bool,
      ∀ node : Node, active node = classify (parent node) := by
  rintro ⟨classify, hClassify⟩
  apply different_status
  calc
    active draft = classify (parent draft) := hClassify draft
    _ = classify (parent selected) := congrArg classify siblings
    _ = active selected := (hClassify selected).symm

theorem changed_direction_implies_distinct_nodes
    {Node : Type*} (direction : Node → Bool)
    (draft selected : Node)
    (different_direction : direction draft ≠ direction selected) :
    draft ≠ selected := by
  intro hSame
  exact different_direction (congrArg direction hSame)

/-!
2026-10-29 source-conditional Mersearch stable 1.0 triage.
The pinned source iter_conversation iterates every nonempty mapping message
without consulting current_node or parent ancestry. In a genuine archived
conversation, a nonempty abandoned node was observed. These propositions
formalize the resulting projection limits, NOT parser execution, source
authorship, or whether any particular search query was actually run.
-/
theorem stable_index_not_active_only
    {Node : Type*} (indexed selected : Node → Prop)
    (abandoned : Node) (hIndexed : indexed abandoned)
    (hAbandoned : ¬ selected abandoned) :
    ¬ (∀ n : Node, indexed n → selected n) := by
  intro hAll
  exact hAbandoned (hAll abandoned hIndexed)

theorem role_projection_not_active_classifier
    {Node Role : Type*} (role : Node → Role)
    (selected : Node → Bool) (abandoned current : Node)
    (sameRole : role abandoned = role current)
    (differentStatus : selected abandoned ≠ selected current) :
    ¬ ∃ classify : Role → Bool,
      ∀ n : Node, selected n = classify (role n) := by
  rintro ⟨classify, hClassify⟩
  apply differentStatus
  calc
    selected abandoned = classify (role abandoned) := hClassify abandoned
    _ = classify (role current) := congrArg classify sameRole
    _ = selected current := (hClassify current).symm

#print axioms stable_index_not_active_only
#print axioms role_projection_not_active_classifier

#print axioms parent_projection_not_injective
#print axioms no_two_sibling_decoder
#print axioms active_membership_not_parent_only
#print axioms changed_direction_implies_distinct_nodes

end HsHVerification.AriadneBranch
