import HsHVerification.HaleCGDTriggerRecord
import Mathlib

/-!
Hale :24 conditional information-loss gate.
The archived evaluate_cgd function saves contradiction_detected (Boolean)
and a revision_response, but omits the selected contradicting_pair index
and the checker response for each tested prior raw-response pair.
If two distinct trigger choices produce the same recorded Boolean,
no decoder of that Boolean alone can reconstruct the trigger.
This is an information statement conditional on actual distinct triggers;
the historical source does not record their identity.
-/

namespace HsHVerification.HaleCGDTriggerGate

open HaleCGDTriggerRecord

theorem flag_projection_noninjective
    {Trigger : Type*} (flag : Trigger → Bool)
    (a b : Trigger) (hab : a ≠ b)
    (ha : flag a = true) (hb : flag b = true) :
    ¬ Function.Injective flag := by
  intro hi
  apply hab
  apply hi
  exact ha.trans hb.symm

theorem no_boolean_trigger_decoder
    {Trigger : Type*} (flag : Trigger → Bool)
    (a b : Trigger) (hab : a ≠ b)
    (ha : flag a = true) (hb : flag b = true) :
    ¬ ∃ decode : Bool → Trigger, ∀ t : Trigger, decode (flag t) = t := by
  rintro ⟨decode, h⟩
  apply hab
  calc
    a = decode (flag a) := (h a).symm
    _ = decode (flag b) := congrArg decode (ha.trans hb.symm)
    _ = b := h b

theorem gained_groups_with_distinct_prior_label_contexts :
    gained - gainedSamePriorLabels = 10 := by decide

theorem allflag_groups_with_distinct_prior_label_contexts :
    gainedAllFlagged - gainedAllFlaggedSamePriorLabels = 8 := by decide

theorem exact_raw_input_witnesses_within_allflag :
    gainedSameRawInputs ≤ gainedAllFlagged := by decide

#print axioms flag_projection_noninjective
#print axioms no_boolean_trigger_decoder
#print axioms gained_groups_with_distinct_prior_label_contexts
#print axioms allflag_groups_with_distinct_prior_label_contexts
#print axioms exact_raw_input_witnesses_within_allflag

end HsHVerification.HaleCGDTriggerGate
