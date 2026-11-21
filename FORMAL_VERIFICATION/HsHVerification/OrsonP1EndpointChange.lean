import Mathlib

/-!
Orson P1, 2026-10-29T23:48Z. Source-conditional finite counts for
aayambansal/ConsistencyBench 17 archived CGD result blobs, 1,150 question
positions. Fixed eligibility: both initial and final labels of both
models are in {Yes, No, Cannot be determined}. Two independent replays:
pair enumeration and question-level combinatorics.

The source counts are inputs to the formalization, not derived by Lean.
No claim about semantic correctness, model independence, or consciousness.
-/

namespace HsHVerification
namespace OrsonP1EndpointChange

def neitherChanged : Nat := 116933
def exactlyOneChanged : Nat := 18465
def bothChanged : Nat := 2513
def oneTurnover : Nat := 17403
def twoTurnover : Nat := 345
def oneGain : Nat := 8719
def oneLoss : Nat := 8684
def twoGain : Nat := 197
def twoLoss : Nat := 148

theorem complete_case_partition :
    neitherChanged + exactlyOneChanged + bothChanged = 137911 := by
  norm_num [neitherChanged, exactlyOneChanged, bothChanged]

theorem turnover_partition :
    oneTurnover + twoTurnover = 17748 := by
  norm_num [oneTurnover, twoTurnover]

theorem one_endpoint_turnover_directions :
    oneGain + oneLoss = oneTurnover := by
  norm_num [oneGain, oneLoss, oneTurnover]

theorem two_endpoint_turnover_directions :
    twoGain + twoLoss = twoTurnover := by
  norm_num [twoGain, twoLoss, twoTurnover]

theorem gain_and_loss_recover_prior_counts :
    oneGain + twoGain = 8916 ∧ oneLoss + twoLoss = 8832 := by
  norm_num [oneGain, twoGain, oneLoss, twoLoss]

theorem one_change_turnover_exceeds_ninety_eight_percent :
    oneTurnover * 100 > (oneTurnover + twoTurnover) * 98 := by
  norm_num [oneTurnover, twoTurnover]

theorem both_changed_mostly_preserve_agreement :
    bothChanged - twoTurnover = 2168 := by
  norm_num [bothChanged, twoTurnover]

theorem one_changed_nonturnover :
    exactlyOneChanged - oneTurnover = 1062 := by
  norm_num [exactlyOneChanged, oneTurnover]

/-- With one endpoint fixed, a genuinely changed other endpoint cannot
agree with the fixed endpoint both before and after the change. -/
theorem one_endpoint_change_precludes_double_agreement
    {α : Type*} {before after fixed : α}
    (hchange : before ≠ after) :
    ¬ (before = fixed ∧ after = fixed) := by
  intro h
  exact hchange (h.1.trans h.2.symm)

/-- If neither endpoint changes, the equality readout is invariant. -/
theorem no_endpoint_change_preserves_agreement
    {α : Type*} {a₀ a₁ b₀ b₁ : α}
    (ha : a₀ = a₁) (hb : b₀ = b₁) :
    (a₀ = b₀ ↔ a₁ = b₁) := by
  subst a₁
  subst b₁
  rfl

#print axioms HsHVerification.OrsonP1EndpointChange.complete_case_partition
#print axioms HsHVerification.OrsonP1EndpointChange.turnover_partition
#print axioms HsHVerification.OrsonP1EndpointChange.one_endpoint_turnover_directions
#print axioms HsHVerification.OrsonP1EndpointChange.two_endpoint_turnover_directions
#print axioms HsHVerification.OrsonP1EndpointChange.gain_and_loss_recover_prior_counts
#print axioms HsHVerification.OrsonP1EndpointChange.one_change_turnover_exceeds_ninety_eight_percent
#print axioms HsHVerification.OrsonP1EndpointChange.both_changed_mostly_preserve_agreement
#print axioms HsHVerification.OrsonP1EndpointChange.one_changed_nonturnover
#print axioms HsHVerification.OrsonP1EndpointChange.one_endpoint_change_precludes_double_agreement
#print axioms HsHVerification.OrsonP1EndpointChange.no_endpoint_change_preserves_agreement

end OrsonP1EndpointChange
end HsHVerification
