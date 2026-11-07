import Mathlib

/-!
Orson Vay | P1 cognition source-split component gate | 2026-10-28 17:24 UTC

Empirical input, NOT encoded or authenticated by Lean:
aayambansal/ConsistencyBench data/consistency_bench_sample.json
Git blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d;
data/consistency_bench.json
Git blob 3171d2899fd1eb4292794df5952514666b0e2f43.

Source-backed graph census (external executable JS/Python): 300 sample
sets, 229 exact-question-connected components; 493 full sets, 353
components. This module checks only conditional graph/projection facts.

A split that factors through connected-component ID cannot put two
sets linked by any chain of identical question strings into different
partitions. It does NOT show that a real benchmark split was used,
that exact text implies equal full model context, that the source
dataset is authentic, or that an LLM's errors are causally dependent.
-/

namespace HsHVerification.OrsonPromptComponentGate

/-- Two benchmark sets are adjacent if they share an exact question key. -/
def SharesQuestion {Node Prompt : Type*}
    (questions : Node → Set Prompt) (a b : Node) : Prop :=
  ∃ q, q ∈ questions a ∧ q ∈ questions b

/-- Shared-question adjacency is symmetric. -/
theorem shares_question_symm {Node Prompt : Type*}
    (questions : Node → Set Prompt) {a b : Node}
    (hab : SharesQuestion questions a b) :
    SharesQuestion questions b a := by
  rcases hab with ⟨q, ha, hb⟩
  exact ⟨q, hb, ha⟩

/-- Reflexive transitive paths through the observed shared-key graph. -/
inductive Walk {Node : Type*} (edge : Node → Node → Prop) :
    Node → Node → Prop where
  | refl (a : Node) : Walk edge a a
  | step {a b c : Node} (hab : edge a b)
      (hbc : Walk edge b c) : Walk edge a c

/-- A single shared-key edge is a walk. -/
theorem edge_is_walk {Node : Type*}
    (edge : Node → Node → Prop) {a b : Node}
    (hab : edge a b) : Walk edge a b := by
  exact Walk.step hab (Walk.refl b)

/-- If component labels agree across edges, they agree along any path. -/
theorem walk_preserves_component {Node Component : Type*}
    (edge : Node → Node → Prop) (component : Node → Component)
    (hedge : ∀ a b, edge a b → component a = component b)
    {a b : Node} (hwalk : Walk edge a b) :
    component a = component b := by
  induction hwalk with
  | refl a => rfl
  | step hab hbc ih =>
      exact (hedge _ _ hab).trans ih

/-- A split factoring through connected-component ID cannot split a path. -/
theorem component_split_preserves_walk {Node Component Partition : Type*}
    (edge : Node → Node → Prop) (component : Node → Component)
    (hedge : ∀ a b, edge a b → component a = component b)
    (split : Component → Partition) {a b : Node}
    (hwalk : Walk edge a b) :
    split (component a) = split (component b) := by
  exact congrArg split (walk_preserves_component edge component hedge hwalk)

/-- Cross-split labels rule out every shared-question walk between sets. -/
theorem crossing_refutes_walk {Node Component Partition : Type*}
    (edge : Node → Node → Prop) (component : Node → Component)
    (hedge : ∀ a b, edge a b → component a = component b)
    (split : Component → Partition) {a b : Node}
    (hcross : split (component a) ≠ split (component b)) :
    ¬ Walk edge a b := by
  intro hwalk
  exact hcross (component_split_preserves_walk edge component hedge split hwalk)

#print axioms shares_question_symm
#print axioms edge_is_walk
#print axioms walk_preserves_component
#print axioms component_split_preserves_walk
#print axioms crossing_refutes_walk

end HsHVerification.OrsonPromptComponentGate
