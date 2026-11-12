import Mathlib

/-!
Calder Review-MIND, 2026-10-29T17:48Z. Source-conditional
provider-deletion influence check for the archived ConsistencyBench CGD
answer-label comparison. Not a new model trial or independent dataset.

Input: Meridian's 136-row identity-preserving comparison matrix
WORKSPACES/MERIDIAN/2026-10-29_1148Z_P1_IDENTITY_PRESERVING_PAIR_MATRIX.csv
Git blob fa51dcaacfb618db2b4eb18d009291255f777af1,
derived from 17 original aayambansal/ConsistencyBench results/*_cgd.json
blobs (IDs and source routes in the matrix).
Eligibility is fixed within each pair at initial/final stages.

Provider means REQUESTED source model_id family, not verified deployment.
Lean verifies transcribed integer identities only, not source integrity,
statistical independence, semantics, or model cognition.
-/

namespace HsHVerification.CalderProviderDeletion

def totalDelta : Int := 84
def withinDelta : Int := 230
def crossDelta : Int := -146

def openAIWithin : Int := 229
def otherWithin : Int := 1

def googleIncident : Int := -611
def metaIncident : Int := -1140
def openAIIncident : Int := 831
def qwenIncident : Int := 720

def crossWithoutGoogle : Int := 411
def crossWithoutMeta : Int := 990
def crossWithoutOpenAI : Int := -748
def withinWithoutOpenAI : Int := 1

theorem aggregate_partition :
    withinDelta + crossDelta = totalDelta := by
  norm_num [withinDelta, crossDelta, totalDelta]

theorem openai_accounts_for_within_change :
    openAIWithin + otherWithin = withinDelta := by
  norm_num [openAIWithin, otherWithin, withinDelta]

theorem deletion_identity (total incident : Int) :
    (total - incident) + incident = total := by
  omega

theorem google_cross_sign_reversal :
    crossDelta < 0 ∧ 0 < crossWithoutGoogle := by
  norm_num [crossDelta, crossWithoutGoogle]

theorem meta_cross_sign_reversal :
    crossDelta < 0 ∧ 0 < crossWithoutMeta := by
  norm_num [crossDelta, crossWithoutMeta]

theorem google_total_after_deletion :
    totalDelta - googleIncident = 695 := by
  norm_num [totalDelta, googleIncident]

theorem meta_total_after_deletion :
    totalDelta - metaIncident = 1224 := by
  norm_num [totalDelta, metaIncident]

theorem openai_total_after_deletion :
    totalDelta - openAIIncident = -747 := by
  norm_num [totalDelta, openAIIncident]

theorem qwen_total_sign_reversal :
    0 < totalDelta ∧ totalDelta - qwenIncident < 0 := by
  norm_num [totalDelta, qwenIncident]

theorem openai_cross_after_deletion :
    crossWithoutOpenAI = -748 ∧ withinWithoutOpenAI = 1 := by
  norm_num [crossWithoutOpenAI, withinWithoutOpenAI]

#print axioms aggregate_partition
#print axioms openai_accounts_for_within_change
#print axioms deletion_identity
#print axioms google_cross_sign_reversal
#print axioms meta_cross_sign_reversal
#print axioms google_total_after_deletion
#print axioms meta_total_after_deletion
#print axioms openai_total_after_deletion
#print axioms qwen_total_sign_reversal
#print axioms openai_cross_after_deletion

end HsHVerification.CalderProviderDeletion
