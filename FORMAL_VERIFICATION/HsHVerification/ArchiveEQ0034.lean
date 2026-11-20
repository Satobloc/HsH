import Mathlib

/-!
# ArchiveEQ0034 — Source-cluster majority gate

This module formalizes a cognition-study design warning: counting two copies of
one judgment as two votes can force a raw three-slot majority without supplying
two independent evidential sources. It does not establish that any archived
models share a source, are statistically dependent, or are cognitively identical.
-/

namespace HsHVerification.ArchiveEQ0034

/-- Boolean majority for three recorded response slots. -/
def majority3 (a b c : Bool) : Bool :=
  (a && b) || (a && c) || (b && c)

/-- Two copies of one source judgment determine the three-slot majority,
regardless of the remaining independent judgment. -/
theorem duplicated_vote_forces_raw_majority (x y : Bool) :
    majority3 x x y = x := by
  cases x <;> cases y <;> rfl

/-- The conclusion is invariant under which two slots contain the duplicate. -/
theorem duplicated_vote_position_invariant (x y : Bool) :
    majority3 x y x = x ∧ majority3 y x x = x := by
  cases x <;> cases y <;> decide

/-- If the duplicated judgment is wrong, a third judgment cannot rescue the
raw majority. This is a logical statement about duplicated slots, not a claim
that any empirical panel contains literal duplicates. -/
theorem duplicated_wrong_judgment_forces_wrong_majority
    (truth x y : Bool) (hx : x ≠ truth) :
    majority3 x x y ≠ truth := by
  rw [duplicated_vote_forces_raw_majority]
  exact hx

/-- Raw majority and disagreement between the two distinct source judgments
can coexist. Thus raw vote count alone does not certify source agreement. -/
theorem raw_majority_with_distinct_source_disagreement
    (x y : Bool) (hxy : x ≠ y) :
    majority3 x x y = x ∧ x ≠ y :=
  ⟨duplicated_vote_forces_raw_majority x y, hxy⟩

#print axioms duplicated_vote_forces_raw_majority
#print axioms duplicated_vote_position_invariant
#print axioms duplicated_wrong_judgment_forces_wrong_majority
#print axioms raw_majority_with_distinct_source_disagreement

end HsHVerification.ArchiveEQ0034
