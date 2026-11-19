import Mathlib

/-!
A pure combinatorial limitation for multi-turn task-history summaries.

A category histogram is permutation-invariant, while adjacent task-switch
count is order-sensitive. This theorem shows that no permutation-invariant
score can recover switch count for every history.

The result is a mathematical measurement-design constraint only. It does not
assert that any actual LLM performance measure depends on task order, and it
is not empirical or physical evidence.
-/

namespace HsHVerification.TaskHistoryOrderProjection

variable {α : Type*} [DecidableEq α]

/-- Count adjacent category changes in an ordered task-history label sequence. -/
def switchCount : List α → Nat
  | [] => 0
  | [_] => 0
  | x :: y :: xs => (if x = y then 0 else 1) + switchCount (y :: xs)

/-- A score that ignores task order must be invariant under list permutation. -/
def permutationInvariant (score : List α → Nat) : Prop :=
  ∀ ⦃xs ys : List α⦄, xs.Perm ys → score xs = score ys

/-- No permutation-invariant score can recover adjacent task-family changes
for every history. In particular, a histogram or any function of category
counts cannot encode an order-sensitive transition statistic. -/
theorem no_permutation_invariant_score_recovers_switchCount
    (a b : α) (hab : a ≠ b) :
    ¬ ∃ score : List α → Nat,
        permutationInvariant score ∧
        ∀ xs : List α, score xs = switchCount xs := by
  rintro ⟨score, hperm, hrecovers⟩
  have hseq : ([a, a, b, b] : List α).Perm [a, b, a, b] := by
    exact List.Perm.cons (List.Perm.swap a b [b])
  have hscore : score ([a, a, b, b] : List α) = score [a, b, a, b] :=
    hperm hseq
  have hleft : switchCount ([a, a, b, b] : List α) = 1 := by
    simp [switchCount, hab]
  have hright : switchCount ([a, b, a, b] : List α) = 3 := by
    simp [switchCount, hab]
  have hrecLeft := hrecovers ([a, a, b, b] : List α)
  have hrecRight := hrecovers ([a, b, a, b] : List α)
  rw [hrecLeft, hrecRight, hleft, hright] at hscore
  omega

#print axioms no_permutation_invariant_score_recovers_switchCount

end HsHVerification.TaskHistoryOrderProjection
