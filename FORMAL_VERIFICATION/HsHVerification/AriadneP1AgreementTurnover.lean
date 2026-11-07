import Mathlib

/-!
Source-conditional arithmetic for the 17-model ConsistencyBench CGD
initial/final answer-label comparison. Counts from the original 17
CGD JSON Git blobs, analyzed 2026-10-29 20:48Z.
The model-pair observations are dependent; no semantic or physical truth
follows from this arithmetic.
-/

namespace HsHVerification
namespace AriadneP1AgreementTurnover

def nMM : Nat := 93965
def nMU : Nat := 8832
def nUM : Nat := 8916
def nUU : Nat := 26198

theorem partition_count :
    nMM + nMU + nUM + nUU = 137911 := by
  norm_num [nMM, nMU, nUM, nUU]

theorem initial_match_count :
    nMM + nMU = 102797 := by
  norm_num [nMM, nMU]

theorem final_match_count :
    nMM + nUM = 102881 := by
  norm_num [nMM, nUM]

theorem switched_pair_count :
    nMU + nUM = 17748 := by
  norm_num [nMU, nUM]

theorem net_match_change :
    (nUM : Int) - (nMU : Int) = 84 := by
  norm_num [nMU, nUM]

theorem both_directions_present :
    nMU > 0 ∧ nUM > 0 := by
  norm_num [nMU, nUM]

theorem signed_partition_identity (mm mu um : Nat) :
    ((mm + um : Nat) : Int) - ((mm + mu : Nat) : Int) =
      (um : Int) - (mu : Int) := by
  omega

#print axioms HsHVerification.AriadneP1AgreementTurnover.partition_count
#print axioms HsHVerification.AriadneP1AgreementTurnover.initial_match_count
#print axioms HsHVerification.AriadneP1AgreementTurnover.final_match_count
#print axioms HsHVerification.AriadneP1AgreementTurnover.switched_pair_count
#print axioms HsHVerification.AriadneP1AgreementTurnover.net_match_change
#print axioms HsHVerification.AriadneP1AgreementTurnover.both_directions_present
#print axioms HsHVerification.AriadneP1AgreementTurnover.signed_partition_identity

end AriadneP1AgreementTurnover
end HsHVerification
