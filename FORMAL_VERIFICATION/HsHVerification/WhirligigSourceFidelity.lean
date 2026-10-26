import Mathlib

/-!
# Source-fidelity gate: equation -> oscillator -> composite -> equation

Primary Nathan-authored conversational source:
HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_10/REDEFINING SUCCESS.txt
Git blob fa7d8d419eb1e7c1b356816d73eec5453915ae10, inspected lines 1-820;
original message timestamp not established.

Historical assistant translation:
SAT_THEORY_ARCHIVE_2023-25/Donut canon.txt
Git blob be985c292bfcae7352983d596c38e7f172f6029d.

The source user requires one *valid derivation path*, not a unique inverse.
The assistant proposes common product-space realization as a sufficient-looking
formal object. These theorems establish that common product realization is
automatic for ANY two trajectories and therefore does not, by itself, certify
a nontrivial derivation, physical coupling, or semantic equation equivalence.

No physics, observational or numerical claims. The Bool counterexample is a
logical countermodel only, not an invented physical system.
-/

namespace HsHVerification.WhirligigSourceFidelity

/-- Every pair of traces has a joint product trace whose coordinate
projections reproduce the inputs, without any coupling premise. -/
theorem arbitrary_pair_has_joint_projection
    {Time X Y : Type*} (f : Time → X) (g : Time → Y) :
    ∃ joint : Time → X × Y,
      (∀ t, (joint t).1 = f t) ∧
      (∀ t, (joint t).2 = g t) := by
  refine ⟨(fun t => (f t, g t)), ?_, ?_⟩
  · intro t
    rfl
  · intro t
    rfl

/-- A joint trace can preserve two unequal inputs. Thus the two
projection identities do not entail equality or a shared law. -/
theorem joint_projection_does_not_force_trace_equality :
    ∃ (f g : Unit → Bool) (joint : Unit → Bool × Bool),
      (∀ t, (joint t).1 = f t) ∧
      (∀ t, (joint t).2 = g t) ∧
      f () ≠ g () := by
  refine ⟨(fun _ => true), (fun _ => false),
    (fun _ => (true, false)), ?_, ?_, ?_⟩
  · intro t
    rfl
  · intro t
    rfl
  · decide

/-- One successful path/witness does not imply a mapping is surjective.
This refutes an assistant's extra inference, not Nathan's existence goal. -/
theorem one_witness_does_not_imply_surjectivity :
    (∃ x : Bool, (fun _ : Bool => false) x = false) ∧
    ¬ Function.Surjective (fun _ : Bool => false) := by
  constructor
  · exact ⟨false, rfl⟩
  · intro h
    obtain ⟨x, hx⟩ := h true
    cases hx

#print axioms arbitrary_pair_has_joint_projection
#print axioms joint_projection_does_not_force_trace_equality
#print axioms one_witness_does_not_imply_surjectivity

end HsHVerification.WhirligigSourceFidelity
