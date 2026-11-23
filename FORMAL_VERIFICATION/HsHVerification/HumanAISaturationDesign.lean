import Mathlib

namespace HsHVerification.HumanAISaturationDesign

/-!
Design-method formalization for the proposed three-person mixed-saturation
AI-guided-reflection (AIR) experiment described in Hale's h1004:s4 report.

Design premise: each group has three participants; the group saturation level
s is randomized over {0,1,2,3} with positive probability, and conditional on
s, a subset of exactly s participants is selected uniformly for AIR. Thus all
eight Boolean assignment vectors have positive probability.

The first theorem checks support: every focal participant can be untreated or
treated while having 0, 1, or 2 treated peers.

The second theorem is a finite counterexample to treating only the number of
treated peers as a generally sufficient exposure map. Two assignments can
give a focal participant the same own treatment and the same number of AIR
peers, yet produce different outcomes when peer identity matters. A count-only
potential outcome Y_i(a,k) therefore requires an additional anonymity /
exchangeability assumption, or a richer exposure map that retains peer
identity, content lineage, and relevant visibility/uptake relations.

References motivating the design, not premises of the theorems:
- Hudgens & Halloran (2008), JASA 103(482), 832-842,
  https://doi.org/10.1198/016214508000000292
- Lu, Shi & Ding (2026), arXiv:2603.19573, randomized saturation designs
  with within- and between-cluster interference.
- Hale h1004:s4, issue #2305, proposed 0/1/2/3 AIR-prepared members.

This module is a finite design-support theorem and a mathematical
counterexample only. It contains no participant records, model outputs,
human-subject results, effect estimates, or causal validation. It does not
establish partial interference, treatment consistency, or the sufficiency of
any empirical exposure mapping.
-/

/-- A complete AIR assignment for a three-person group. -/
abbrev Assignment := Fin 3 → Bool

/-- Number of AIR-treated peers of a focal participant. -/
def peerCount (z : Assignment) (i : Fin 3) : Nat :=
  ((Finset.univ.erase i).filter (fun j => z j = true)).card

/--
Under full support on all eight assignment vectors, every own-treatment /
treated-peer-count cell is reachable for a three-person group.
This is a support statement, not a causal-effect theorem.
-/
theorem every_own_treatment_peer_count_cell_is_supported
    (i : Fin 3) (ownTreated : Bool) (treatedPeers : Fin 3) :
    ∃ z : Assignment,
      z i = ownTreated ∧ peerCount z i = treatedPeers.val := by
  fin_cases i <;> fin_cases ownTreated <;> fin_cases treatedPeers <;> decide

/-- Assignment with participant 1 treated and participants 0 and 2 untreated. -/
def assignmentTreatingPeerOne : Assignment :=
  fun j => if j = (1 : Fin 3) then true else false

/-- Assignment with participant 2 treated and participants 0 and 1 untreated. -/
def assignmentTreatingPeerTwo : Assignment :=
  fun j => if j = (2 : Fin 3) then true else false

/--
A deliberately peer-identity-sensitive outcome: it records whether participant
1 was treated. This is a countermodel, not an empirical outcome definition.
-/
def peerOneSensitiveOutcome (z : Assignment) : Nat :=
  if z (1 : Fin 3) then 1 else 0

/--
The focal participant 0 is untreated and has exactly one treated peer in both
assignments, but the identity of that peer changes the outcome. Therefore the
pair (own treatment, treated-peer count) does not determine outcomes in
general.
-/
theorem peer_count_does_not_determine_outcome_in_general :
    assignmentTreatingPeerOne 0 = assignmentTreatingPeerTwo 0 ∧
    peerCount assignmentTreatingPeerOne 0 =
      peerCount assignmentTreatingPeerTwo 0 ∧
    peerOneSensitiveOutcome assignmentTreatingPeerOne ≠
      peerOneSensitiveOutcome assignmentTreatingPeerTwo := by
  decide

#eval peerCount assignmentTreatingPeerOne 0
#eval peerCount assignmentTreatingPeerTwo 0
#eval peerOneSensitiveOutcome assignmentTreatingPeerOne
#eval peerOneSensitiveOutcome assignmentTreatingPeerTwo

#print axioms every_own_treatment_peer_count_cell_is_supported
#print axioms peer_count_does_not_determine_outcome_in_general

end HsHVerification.HumanAISaturationDesign
