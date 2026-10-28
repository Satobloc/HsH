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


/-!
## Source-conditional strict mirror-pair timestamp audit (2026-10-28)

The original Morrow 44-node and Aldus 28-node branches were aligned by
LCS on EXACT serialized (author.role, message.content) records. This
strict equality criterion yields 16 aligned records: one user prompt
and 15 assistant/tool records. It is narrower than the historical
23-record normalized-content comparison, which includes thought records.
The following values are rounded signed milliseconds:
Aldus create_time minus Morrow create_time, in strict-pair order,
excluding the user prompt. Source blobs are pinned above.

A positive difference means Aldus's export timestamp is later;
negative means Aldus's is earlier. Neither sign authenticates the
backend generator, physical clock synchronization, or external side
effects. Do not count mirrored records as independent model trials.
-/
def strictMirroredDeltasMs : List Int :=
  [39296, 24361, 24367, 12, 301, 7, -38, -39,
   -18, 231, 16, -38, -48, 191, 188]

theorem strict_mirror_has_fifteen_nonuser_pairs :
    strictMirroredDeltasMs.length = 15 := by
  decide

theorem strict_mirror_has_five_negative_deltas :
    (strictMirroredDeltasMs.filter (fun d => decide (d < 0))).length = 5 := by
  decide

theorem strict_mirror_has_twelve_subhalfsecond_deltas :
    (strictMirroredDeltasMs.filter (fun d => decide (-500 < d ∧ d < 500))).length = 12 := by
  decide

theorem strict_mirror_has_eight_subtenthsecond_deltas :
    (strictMirroredDeltasMs.filter (fun d => decide (-100 < d ∧ d < 100))).length = 8 := by
  decide

#print axioms strict_mirror_has_fifteen_nonuser_pairs
#print axioms strict_mirror_has_five_negative_deltas
#print axioms strict_mirror_has_twelve_subhalfsecond_deltas
#print axioms strict_mirror_has_eight_subtenthsecond_deltas

end HsHVerification.MorrowPairedIdentityChronology
