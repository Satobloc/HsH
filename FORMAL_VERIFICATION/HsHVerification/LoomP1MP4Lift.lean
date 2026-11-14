import HsHVerification.LoomP1MP4Source
import Mathlib
/-!
The observed source-key flag association changes when excluding the known
modus-tollens fourth-position source-key-ceiling stratum.
These are conditional arithmetic theorems over transcribed real LLM records.
Neither exclusion nor Lean compilation validates NLI semantics or H(s)H physics.
-/
namespace HsHVerification.LoomP1MP4Lift
open HsHVerification.SableP1ModelFlagSource
open HsHVerification.LoomP1MP4Source

theorem original_three_negative :
    (observed.filter flagLessKeyWrong).length = 3 := model_sign_partition.2
theorem after_exclusion_one_negative :
    (observedWithoutMP4.filter flagLessKeyWrong).length = 1 :=
  remaining_sign_partition.2
theorem pooled_after_exclusion_positive :
    (3093 : Nat) * 7747 > 2871 * 5853 := by norm_num
theorem claude46_sign_flips :
    flagLessKeyWrong ⟨198,193,254,205⟩ = true ∧
    flagMoreKeyWrong ⟨198,143,254,205⟩ = true := by decide
theorem llama33_sign_flips :
    flagLessKeyWrong ⟨185,180,258,227⟩ = true ∧
    flagMoreKeyWrong ⟨185,130,258,227⟩ = true := by decide
theorem qwen_remains_negative :
    flagLessKeyWrong ⟨87,266,189,308⟩ = true ∧
    flagLessKeyWrong ⟨87,216,189,308⟩ = true := by decide
theorem partition_changes_but_not_universal :
    (observed.filter flagLessKeyWrong).length = 3 ∧
    (observedWithoutMP4.filter flagLessKeyWrong).length = 1 ∧
    ¬ ∀ c ∈ observedWithoutMP4, flagMoreKeyWrong c = true := by
  exact ⟨original_three_negative, after_exclusion_one_negative, by decide⟩

#print axioms original_three_negative
#print axioms after_exclusion_one_negative
#print axioms pooled_after_exclusion_positive
#print axioms claude46_sign_flips
#print axioms llama33_sign_flips
#print axioms qwen_remains_negative
#print axioms partition_changes_but_not_universal
end HsHVerification.LoomP1MP4Lift
