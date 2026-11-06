import HsHVerification.CalderWitnessAlignment

/-!
Graph/observation separation: being absent from a chosen active path is
not evidence that a historical message was never generated. The source
graph, rather than this Lean file, determines which nodes were on that path.
-/

namespace HsHVerification.CalderWitnessGraph

theorem distinct_if_different_path_status {Node : Type*}
    (onPath : Node → Prop) (a b : Node)
    (ha : ¬ onPath a) (hb : onPath b) : a ≠ b := by
  intro h
  apply ha
  rw [h]
  exact hb

/-!
The actual March 23 04:02 UTC user node has two distinct assistant
children: inactive 4089ad6a-7099-4946-8c36-77eb3e6303b7 and
selected 7dfddac2-6100-470c-a8cd-541343116379.
This theorem is conditional on the edge relation and node distinctness.
It proves that collapsing every parent to ONE child cannot preserve
both observed branches. It does NOT prove which historical hypothesis
is physically correct or independently authored.
-/
theorem sibling_branches_defeat_single_successor {Node : Type*}
    (child : Node → Node → Prop) (p a b : Node)
    (ha : child p a) (hb : child p b) (hne : a ≠ b) :
    ¬ ∃ f : Node → Node, ∀ x y, child x y → f x = y := by
  intro h
  rcases h with ⟨f, hf⟩
  have heq : a = b := (hf p a ha).symm.trans (hf p b hb)
  exact hne heq

theorem inactive_leaf_partition : 3 + 1 = 4 := by
  norm_num

theorem raw_minus_inactive : 135 - 4 = 131 := by
  norm_num

theorem active_user_alignment : 130 + 1 = 131 := by
  norm_num

#print axioms distinct_if_different_path_status
#print axioms sibling_branches_defeat_single_successor
#print axioms inactive_leaf_partition
#print axioms raw_minus_inactive
#print axioms active_user_alignment

end HsHVerification.CalderWitnessGraph
