import Mathlib

/-!
Mercer Review-MIND 2026-10-29 15:48 UTC.
Source-conditioned mathematical audit of 17 archived ConsistencyBench CGD
model outputs and the identity-preserving 136-row source-blob matrix.
Matrix: HsH Git blob fa51dcaacfb618db2b4eb18d009291255f777af1
17 original aayambansal/ConsistencyBench Git blobs independently replayed.
Eligibility: both initial and final labels non-"Unclear" at both endpoints.
No model invocations, backend independence, semantic correctness, or physical
claims are proved by this module. Source counts are asserted as premises/data.
-/

namespace HsHVerification.MercerP1LeaveOneOut

def incidentLedger : List (String × Int) := [
  ("qwen-2.5-72b", 720),
  ("gpt-4.1", 712),
  ("claude-sonnet-4.6", 392),
  ("gpt-5.2", 243),
  ("gpt-5", 220),
  ("claude-opus-4.6", 211),
  ("o3", 81),
  ("gemini-2.0-flash", 31),
  ("gpt-4o", 14),
  ("deepseek-v3.2", -122),
  ("claude-sonnet-4.5", -128),
  ("claude-3.5-sonnet", -156),
  ("gpt-5-mini", -210),
  ("gemini-2.5-pro", -347),
  ("gemini-2.5-flash", -349),
  ("llama-3.3-70b", -461),
  ("llama-3.1-70b", -683)
]

def observedTotalDelta : Int := 102881 - 102797

def leaveOneOutDelta (incident : Int) : Int := observedTotalDelta - incident

theorem source_total_delta : observedTotalDelta = 84 := by decide

theorem source_ledger_size : incidentLedger.length = 17 := by decide

theorem source_incidence_double_count :
    (incidentLedger.map Prod.snd).sum = 2 * observedTotalDelta := by decide

theorem source_six_sign_reversals :
    (incidentLedger.filter (fun x => x.2 > observedTotalDelta)).length = 6 := by decide

theorem source_extremes :
    leaveOneOutDelta 720 = -636 ∧
    leaveOneOutDelta (-683) = 767 ∧
    leaveOneOutDelta 81 = 3 := by decide

theorem leave_one_out_partition (total incident : Int) :
    (total - incident) + incident = total := by omega

theorem positive_incident_reverses (incident : Int)
    (h : incident > observedTotalDelta) :
    leaveOneOutDelta incident < 0 := by
  unfold leaveOneOutDelta
  omega

#print axioms source_total_delta
#print axioms source_ledger_size
#print axioms source_incidence_double_count
#print axioms source_six_sign_reversals
#print axioms source_extremes
#print axioms leave_one_out_partition
#print axioms positive_incident_reverses

end HsHVerification.MercerP1LeaveOneOut
