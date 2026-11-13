import Mathlib

/-!
Source-derived combinatorial audit of Nixon et al.,
"The Social Cost of an AI Teammate: How an Artificial Teammate Reshapes
Human-Human Communication in Small-Team Decision-Making",
arXiv:2607.27179v2 (2026-10-30), §§3.1-3.2.

The paper reports 16 treatment teams with two human students and one AI,
and 17 control teams with three human students. It describes each team
as a three-member, complete interaction network.

This module formalizes only the number of *potential undirected dyads*
implied by those reported seat compositions. It shows that both conditions
have three total potential dyads per team, but the treatment has one
human-human and two human-AI dyads, while the control has three
human-human dyads. This is a design-structure result, not an observed
message-edge count.

It does NOT establish that every potential dyad was realized, that the
reported design premises are true, that dyad opportunity caused any
outcome, or that the AI has any internal cognitive state. It does not
identify a causal effect beyond the source's stated treatment contrast.
-/

namespace HsHVerification.HumanAITeammateDyads

/-- Potential undirected pairs among n members. -/
def potentialPairs (n : Nat) : Nat := n * (n - 1) / 2

/-- Potential human-human pairs in a team. -/
def humanHumanPairs (humans : Nat) : Nat := potentialPairs humans

/-- Potential human-AI pairs for the reported one-AI configuration. -/
def humanAIPairs (humans ais : Nat) : Nat := humans * ais

/-- Potential pairs among all human and AI members. -/
def totalPairs (humans ais : Nat) : Nat := potentialPairs (humans + ais)

def treatmentTeams : Nat := 16
def controlTeams : Nat := 17

theorem treatment_human_human_pairs_per_team :
    humanHumanPairs 2 = 1 := by
  norm_num [humanHumanPairs, potentialPairs]

theorem treatment_human_ai_pairs_per_team :
    humanAIPairs 2 1 = 2 := by
  norm_num [humanAIPairs]

theorem control_human_human_pairs_per_team :
    humanHumanPairs 3 = 3 := by
  norm_num [humanHumanPairs, potentialPairs]

theorem control_human_ai_pairs_per_team :
    humanAIPairs 3 0 = 0 := by
  norm_num [humanAIPairs]

theorem treatment_total_pairs_per_team :
    totalPairs 2 1 = 3 := by
  norm_num [totalPairs, potentialPairs]

theorem control_total_pairs_per_team :
    totalPairs 3 0 = 3 := by
  norm_num [totalPairs, potentialPairs]

theorem human_human_pair_opportunity_is_tripled_in_control :
    humanHumanPairs 3 = 3 * humanHumanPairs 2 := by
  norm_num [humanHumanPairs, potentialPairs]

theorem treatment_human_human_share :
    (humanHumanPairs 2 : ℚ) / totalPairs 2 1 = 1 / 3 := by
  norm_num [humanHumanPairs, totalPairs, potentialPairs]

theorem control_human_human_share :
    (humanHumanPairs 3 : ℚ) / totalPairs 3 0 = 1 := by
  norm_num [humanHumanPairs, totalPairs, potentialPairs]

theorem treatment_group_total_potential_human_human_pairs :
    treatmentTeams * humanHumanPairs 2 = 16 := by
  norm_num [treatmentTeams, humanHumanPairs, potentialPairs]

theorem control_group_total_potential_human_human_pairs :
    controlTeams * humanHumanPairs 3 = 51 := by
  norm_num [controlTeams, humanHumanPairs, potentialPairs]

#print axioms treatment_human_human_pairs_per_team
#print axioms treatment_human_ai_pairs_per_team
#print axioms control_human_human_pairs_per_team
#print axioms control_human_ai_pairs_per_team
#print axioms treatment_total_pairs_per_team
#print axioms control_total_pairs_per_team
#print axioms human_human_pair_opportunity_is_tripled_in_control
#print axioms treatment_human_human_share
#print axioms control_human_human_share
#print axioms treatment_group_total_potential_human_human_pairs
#print axioms control_group_total_potential_human_human_pairs

end HsHVerification.HumanAITeammateDyads
