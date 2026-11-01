import Mathlib

/-!
# Orson P1: NLI alignment and connected-component closure

Source geometry: the `align_free` path in the public `mainlobelabs/pauper-consensus`
repository, commit `c328dab5ca1f1101b5ec56e2e92e3592898ceadf`,
`firstpass/wct/cluster.py` (blob `45ad33fff02bb065cfdd2f1a1d2cd70f073da1f3`).
That code thresholds a bidirectional NLI link score, merges the resulting
undirected edges with union-find, and counts transitivity violations when
two vertices share a component but lack a direct above-threshold link.

This module formalizes the generic graph-theoretic operation: equivalence
closure of a symmetric direct-link relation, followed by projection to
components. The three-node path proves that same-component membership does
not imply a direct pairwise link.

This is NOT a proof that the Python implementation is correct, that this
exploratory `align_free` path was used in the registered primary analysis,
that any NLI score is correct, or that aligned propositions are true.
The source paper's anchored/canonical-proposition path is a separate map.
-/

namespace HsHVerification.OrsonNLIClusterClosure

inductive ClusterClosure {α : Type} (R : α → α → Prop) : α → α → Prop
  | refl (a : α) : ClusterClosure R a a
  | edge {a b : α} : R a b → ClusterClosure R a b
  | symm {a b : α} : ClusterClosure R a b → ClusterClosure R b a
  | trans {a b c : α} :
      ClusterClosure R a b → ClusterClosure R b c → ClusterClosure R a c

theorem clusterClosure_equivalence {α : Type} (R : α → α → Prop) :
    Equivalence (ClusterClosure R) := by
  constructor
  · intro a
    exact ClusterClosure.refl a
  · intro a b hab
    exact ClusterClosure.symm hab
  · intro a b c hab hbc
    exact ClusterClosure.trans hab hbc

def clusterSetoid {α : Type} (R : α → α → Prop) : Setoid α where
  r := ClusterClosure R
  iseqv := clusterClosure_equivalence R

/-- The quotient projection from individual claim nodes to connected components. -/
def clusterProjection {α : Type} (R : α → α → Prop) (a : α) :
    Quotient (clusterSetoid R) :=
  Quotient.mk (clusterSetoid R) a

theorem clusterProjection_eq_iff {α : Type} (R : α → α → Prop) (a b : α) :
    clusterProjection R a = clusterProjection R b ↔ ClusterClosure R a b := by
  constructor
  · intro h
    exact Quotient.exact h
  · intro h
    exact Quotient.sound h

def threeNodeLink (a b : Nat) : Prop :=
  (a = 0 ∧ b = 1) ∨
  (a = 1 ∧ b = 0) ∨
  (a = 1 ∧ b = 2) ∨
  (a = 2 ∧ b = 1)

theorem threeNodeLink_symmetric : Symmetric threeNodeLink := by
  intro a b h
  rcases h with h | h | h | h
  · exact Or.inr (Or.inl ⟨h.2, h.1⟩)
  · exact Or.inl ⟨h.2, h.1⟩
  · exact Or.inr (Or.inr (Or.inr ⟨h.2, h.1⟩))
  · exact Or.inr (Or.inr (Or.inl ⟨h.2, h.1⟩))

theorem threeNode_link_01 : threeNodeLink 0 1 := by
  simp [threeNodeLink]

theorem threeNode_link_12 : threeNodeLink 1 2 := by
  simp [threeNodeLink]

theorem threeNode_no_direct_link_02 : ¬ threeNodeLink 0 2 := by
  simp [threeNodeLink]

theorem threeNode_same_cluster_02 :
    ClusterClosure threeNodeLink 0 2 := by
  exact ClusterClosure.trans
    (ClusterClosure.edge threeNode_link_01)
    (ClusterClosure.edge threeNode_link_12)

/-- A component projection can merge endpoints with no direct NLI edge. -/
theorem projection_merges_nonlinked_pair :
    clusterProjection threeNodeLink 0 = clusterProjection threeNodeLink 2 ∧
      ¬ threeNodeLink 0 2 := by
  constructor
  · exact Quotient.sound threeNode_same_cluster_02
  · exact threeNode_no_direct_link_02

#print axioms clusterClosure_equivalence
#print axioms clusterProjection_eq_iff
#print axioms projection_merges_nonlinked_pair

end HsHVerification.OrsonNLIClusterClosure
