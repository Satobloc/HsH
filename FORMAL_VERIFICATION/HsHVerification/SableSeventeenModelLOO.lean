import Mathlib

/-!
Sable Review-MIND, 2026-10-29 08:48 UTC.
Conditional arithmetic for 17 original ConsistencyBench CGD model-output files.
Source-locked SHA manifest and replay: WORKSPACES/SABLE/CODE/2026_10_29_17_model_loocv.js.
These statements do not certify source attribution, model independence, raw-label
extraction, statistical significance, causality, human cognition, or physics.
-/
namespace HsHVerification.SableSeventeenModelLOO

def fixedOmissions : List Int :=
  [70, -628, 431, -127, 240, 212, -308, 206, 53,
   433, 294, -159, -136, 767, 545, 3, -636]

def inclusiveOmissions : List Int :=
  [-1045, -1786, -639, -1263, -882, -667, -1457, -967, -1581,
   -665, -80, -1279, -826, -375, -631, -908, -1779]

theorem pair_opportunities : (1150 * (17 * 16 / 2) : Nat) = 156400 := by norm_num

theorem fixed_case_total_delta :
    (102881 : Int) - 102797 = 84 := by norm_num

theorem inclusive_total_delta :
    (104673 : Int) - 105795 = -1122 := by norm_num

theorem exactly_six_fixed_omissions_reverse_sign :
    (fixedOmissions.filter (fun x => x < 0)).length = 6 := by decide

theorem all_inclusive_omissions_stay_negative :
    inclusiveOmissions.all (fun x => x < 0) = true := by decide

theorem paired_contribution_double_count :
    ([14, 712, -347, 211, -156, -128, 392, -122, 31,
      -349, -210, 243, 220, -683, -461, 81, 720] : List Int).sum = 168 := by decide

theorem omission_sign_criterion (contribution : Int) :
    84 - contribution < 0 ↔ 84 < contribution := by omega

theorem qwen_omission : (84 : Int) - 720 = -636 := by norm_num
theorem gpt41_omission : (84 : Int) - 712 = -628 := by norm_num

#print axioms pair_opportunities
#print axioms fixed_case_total_delta
#print axioms inclusive_total_delta
#print axioms exactly_six_fixed_omissions_reverse_sign
#print axioms all_inclusive_omissions_stay_negative
#print axioms paired_contribution_double_count
#print axioms omission_sign_criterion
#print axioms qwen_omission
#print axioms gpt41_omission

end HsHVerification.SableSeventeenModelLOO
