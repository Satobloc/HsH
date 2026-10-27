import Mathlib

/-!
# Morrow/Aldus paired identity turns: observed timestamp ordering

PRIMARY HISTORICAL SOURCES (2026-09-08 UTC, original JSON message roles):
- HsH DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.07•26.09.09•
  MORROW [Reconstruct H(s)H Synthesis] — raw (3).json,
  Git blob 362075c5e32ec9e97579bd1de58fba7f612cb6bb.
- HsH DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.06•26.09.08•
  Aldus [AUTO H(s)H Gitter] — raw (2).json,
  Git blob 2f5ea91a449446f64d298b50b0c2ef0d8533900a.
- Earliest surviving Morrow citation snapshot:
  Git blob e32873cd17c1d96003dced0310ebf4d3cd954d07.

Six actual exported create_time values are rounded to the nearest
millisecond (the original submillisecond fields remain in the report).
These are observed archival record timestamps, NOT physical data,
invented fixtures, or independent server-side clock measurements.

The conditional "timeAdmissible" relation is a *necessary temporal
order in a timestamp-faithful forward-causality interpretation*, not a
claim to reconstruct backend routing or actual hidden model inputs.
The theorem proves only the declared, transcribed timestamp facts.
-/

namespace HsHVerification.MorrowPairedIdentityChronology

inductive Event where
  | morrowPrompt
  | morrowFirstAnswer
  | aldusPrompt
  | aldusAnswer
  | morrowFollowupPrompt
  | morrowFollowupAnswer
  deriving DecidableEq, Repr

/-- UTC Unix milliseconds, rounded from original message.create_time. -/
def observedMs : Event → Nat
  | .morrowPrompt => 1788865233530
  | .morrowFirstAnswer => 1788865251446
  | .aldusPrompt => 1788865317555
  | .aldusAnswer => 1788865338688
  | .morrowFollowupPrompt => 1788865405421
  | .morrowFollowupAnswer => 1788865412173

/-- A necessary (not sufficient) timestamp condition for an earlier
record to influence a later record, assuming faithful comparable clocks. -/
def timeAdmissible (source target : Event) : Prop :=
  observedMs source ≤ observedMs target

theorem first_morrow_answer_precedes_later_aldus_prompt :
    observedMs .morrowFirstAnswer < observedMs .aldusPrompt := by
  norm_num [observedMs]

theorem later_aldus_prompt_not_time_admissible_as_source_of_first_morrow_answer :
    ¬ timeAdmissible .aldusPrompt .morrowFirstAnswer := by
  norm_num [timeAdmissible, observedMs]

theorem aldus_prompt_precedes_morrow_followup :
    observedMs .aldusPrompt < observedMs .morrowFollowupAnswer := by
  norm_num [observedMs]

theorem distinct_exported_reply_roles :
    Event.morrowFirstAnswer ≠ Event.aldusAnswer := by
  decide

#print axioms first_morrow_answer_precedes_later_aldus_prompt
#print axioms later_aldus_prompt_not_time_admissible_as_source_of_first_morrow_answer
#print axioms aldus_prompt_precedes_morrow_followup
#print axioms distinct_exported_reply_roles

end HsHVerification.MorrowPairedIdentityChronology
