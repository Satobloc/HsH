import Mathlib

/-!
Hale :24, 2026-10-29 10:24 UTC. Source-conditional ledger.
Original 17 ConsistencyBench CGD JSON Git blobs, 5,100 recorded sets,
19,550 recorded answers; 6,702 records have contradiction_detected=true.
The evaluator saves a Boolean but not which earlier pair caused it.
Among 850 negation Q3 records, 488 have this Boolean true.
Among 238 repeated model-by-literal-Q3 groups, 46 gained label discordance,
12 lost it, 33 remained discordant, and 147 remained uniform.
All source counts were computed by parsing original Git blobs, not invented
fixtures. The formalized equalities do NOT authenticate those blobs,
establish causal effects, or validate physics.
-/

namespace HsHVerification.HaleCGDTriggerRecord

def totalAnswers : Nat := 19550
def flaggedAnswers : Nat := 6702
def q3Answers : Nat := 850
def flaggedQ3 : Nat := 488
def repeatedQ3Groups : Nat := 238
def gained : Nat := 46
def lost : Nat := 12
def both : Nat := 33
def initialDiscordant : Nat := 45
def finalDiscordant : Nat := 79
def gainedAllFlagged : Nat := 23
def gainedMixedFlagged : Nat := 23
def gainedSamePriorLabels : Nat := 36
def gainedAllFlaggedSamePriorLabels : Nat := 15
def gainedSameRawInputs : Nat := 3

theorem q3_flagged_bounded : flaggedQ3 ≤ q3Answers := by decide
theorem all_flagged_bounded : flaggedAnswers ≤ totalAnswers := by decide
theorem q3_gained_partition : gained = gainedAllFlagged + gainedMixedFlagged := by decide
theorem initial_discordance_partition : initialDiscordant = both + lost := by decide
theorem final_discordance_partition : finalDiscordant = both + gained := by decide
theorem discordance_net_change : finalDiscordant - initialDiscordant = gained - lost := by decide
theorem identical_prior_labels_not_sufficient :
    gainedSamePriorLabels > gainedAllFlaggedSamePriorLabels := by decide
theorem exact_raw_input_witnesses_positive : 0 < gainedSameRawInputs := by decide

#print axioms q3_flagged_bounded
#print axioms all_flagged_bounded
#print axioms q3_gained_partition
#print axioms initial_discordance_partition
#print axioms final_discordance_partition
#print axioms discordance_net_change
#print axioms identical_prior_labels_not_sufficient
#print axioms exact_raw_input_witnesses_positive

end HsHVerification.HaleCGDTriggerRecord
