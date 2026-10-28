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

theorem inactive_leaf_partition : 3 + 1 = 4 := by
  norm_num

theorem raw_minus_inactive : 135 - 4 = 131 := by
  norm_num

theorem active_user_alignment : 130 + 1 = 131 := by
  norm_num

#print axioms distinct_if_different_path_status
#print axioms inactive_leaf_partition
#print axioms raw_minus_inactive
#print axioms active_user_alignment

end HsHVerification.CalderWitnessGraph
