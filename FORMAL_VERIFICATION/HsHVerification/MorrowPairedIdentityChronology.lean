import Mathlib

/-!
# Morrow/A-container paired identity turns: observed timestamp ordering

PRIMARY HISTORICAL SOURCES (2026-09-08 UTC, original JSON message roles):
- HsH DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.07•26.09.09•
  MORROW [Reconstruct H(s)H Synthesis] — raw (3).json,
  Git blob 362075c5e32ec9e97579bd1de58fba7f612cb6bb.
- HsH DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.06•26.09.08•
  A-container (archive title: Aldus [AUTO H(s)H Gitter]) — raw (2).json,
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
  | aContainerPrompt
  | aContainerAnswer
  | morrowFollowupPrompt
  | morrowFollowupAnswer
  deriving DecidableEq, Repr

/-- UTC Unix milliseconds, rounded from original message.create_time. -/
def observedMs : Event → Nat
  | .morrowPrompt => 1788865233530
  | .morrowFirstAnswer => 1788865251446
  | .aContainerPrompt => 1788865317555
  | .aContainerAnswer => 1788865338688
  | .morrowFollowupPrompt => 1788865405421
  | .morrowFollowupAnswer => 1788865412173

/-- A necessary (not sufficient) timestamp condition for an earlier
record to influence a later record, assuming faithful comparable clocks. -/
def timeAdmissible (source target : Event) : Prop :=
  observedMs source ≤ observedMs target

theorem first_morrow_answer_precedes_later_a_container_prompt :
    observedMs .morrowFirstAnswer < observedMs .aContainerPrompt := by
  norm_num [observedMs]

theorem later_a_container_prompt_not_time_admissible_as_source_of_first_morrow_answer :
    ¬ timeAdmissible .aContainerPrompt .morrowFirstAnswer := by
  norm_num [timeAdmissible, observedMs]

theorem a_container_prompt_precedes_morrow_followup :
    observedMs .aContainerPrompt < observedMs .morrowFollowupAnswer := by
  norm_num [observedMs]

theorem distinct_exported_reply_roles :
    Event.morrowFirstAnswer ≠ Event.aContainerAnswer := by
  decide

#print axioms first_morrow_answer_precedes_later_a_container_prompt
#print axioms later_a_container_prompt_not_time_admissible_as_source_of_first_morrow_answer
#print axioms a_container_prompt_precedes_morrow_followup
#print axioms distinct_exported_reply_roles


/-!
## Source-conditional strict mirror-pair timestamp audit (2026-10-28)

The original Morrow 44-node and A-container 28-node branches were aligned by
LCS on EXACT serialized (author.role, message.content) records. This
strict equality criterion yields 16 aligned records: one user prompt
and 15 assistant/tool records. It is narrower than the historical
23-record normalized-content comparison, which includes thought records.
The following values are rounded signed milliseconds:
A-container create_time minus Morrow create_time, in strict-pair order,
excluding the user prompt. Source blobs are pinned above.

A positive difference means A-container's export timestamp is later;
negative means A-container's is earlier. Neither sign authenticates the
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

/-!
## Selected-ancestry projection audit, 2026-10-29

The *complete original JSON exports*, not a toy graph, were traversed
from current_node through mapping[node].parent until the root.
Original source blob SHAs:
Morrow 362075c5e32ec9e97579bd1de58fba7f612cb6bb;
A-container (archive title: Aldus [AUTO H(s)H Gitter])  2f5ea91a449446f64d298b50b0c2ef0d8533900a.

Observed total mapping nodes / distinct selected-ancestry nodes:
Morrow 465 / 465; A-container 1578 / 1578.
Both snapshots had zero mapping nodes with >1 child, zero missing-parent
references, and one empty-message root. Previously documented mirrored
nodes were verified as on-path in BOTH exports.

These theorems check transcribed counts and their consequences only.
Lean does NOT independently parse the JSON, validate the export
semantics, prove backend routing, or certify two independent LLM trials.
This bounded result does NOT negate off-path branches in OTHER archives.
-/
namespace HsHVerification.MorrowSelectedAncestryAudit

def morrowTotal : Nat := 465
def morrowSelected : Nat := 465
def aContainerTotal : Nat := 1578
def aContainerSelected : Nat := 1578
def morrowBranchPoints : Nat := 0
def aContainerBranchPoints : Nat := 0

theorem transcribed_morrow_all_mapping_nodes_on_path :
    morrowTotal = morrowSelected := by decide

theorem transcribed_a_container_all_mapping_nodes_on_path :
    aContainerTotal = aContainerSelected := by decide

theorem transcribed_zero_offpath_counts :
    morrowTotal - morrowSelected = 0 ∧
    aContainerTotal - aContainerSelected = 0 := by decide

theorem transcribed_no_branch_points :
    morrowBranchPoints = 0 ∧ aContainerBranchPoints = 0 := by decide

theorem conditional_filter_cannot_remove_any_node
    (total selected : Nat) (h : total = selected) :
    total - selected = 0 := by omega

#print axioms transcribed_morrow_all_mapping_nodes_on_path
#print axioms transcribed_a_container_all_mapping_nodes_on_path
#print axioms transcribed_zero_offpath_counts
#print axioms transcribed_no_branch_points
#print axioms conditional_filter_cannot_remove_any_node

end HsHVerification.MorrowSelectedAncestryAudit

/-!
## Conversation-context citation pub_date versus message create_time (2026-10-30)

Primary JSON sources:
- Morrow raw export blob 362075c5e32ec9e97579bd1de58fba7f612cb6bb.
- Earliest Morrow citation snapshot e32873cd17c1d96003dced0310ebf4d3cd954d07.
- A-container raw export blob 2f5ea91a449446f64d298b50b0c2ef0d8533900a.

In this observed citation, citation.pub_date exactly equals the A-container
conversation's top-level create_time. The citation snippet is matched by
exact text search to an individual A-container user-role message whose own
message.create_time is later. The citation object carries conversation
identity/title/snippet/pub_date, not that message UUID or message time.

All constants below are transcribed from the original JSON decimal
timestamps and represented as integer microseconds. These theorems
prove only the declared arithmetic facts. Lean does not parse the JSON,
validate the snippet-to-message match, or establish generation-time
exposure or causal influence.
-/
namespace HsHVerification.MorrowCitationDateAudit

def aContainerConversationCreatedUs : Nat := 1788734012522178
def citationPubDateUs : Nat := 1788734012522178
def earlierA-containerSnippetMessageCreatedUs : Nat := 1788862185906000
def laterA-containerPromptCreatedUs : Nat := 1788865317555000
def morrowFirstAnswerCreatedUs : Nat := 1788865251446219
def morrowFollowupPromptCreatedUs : Nat := 1788865405421000
def morrowFollowupAnswerCreatedUs : Nat := 1788865412172734

theorem citation_pub_date_equals_target_conversation_create_time :
    citationPubDateUs = aContainerConversationCreatedUs := by decide

theorem citation_pub_date_is_not_earlier_snippet_message_time :
    citationPubDateUs ≠ earlierA-containerSnippetMessageCreatedUs := by decide

theorem citation_pub_date_is_not_later_snippet_message_time :
    citationPubDateUs ≠ laterA-containerPromptCreatedUs := by decide

theorem citation_pub_date_precedes_earlier_snippet_message :
    citationPubDateUs < earlierA-containerSnippetMessageCreatedUs := by decide

theorem citation_pub_date_precedes_later_snippet_message :
    citationPubDateUs < laterA-containerPromptCreatedUs := by decide

theorem exact_container_to_earlier_message_gap_us :
    earlierA-containerSnippetMessageCreatedUs - citationPubDateUs = 128173383822 := by decide

theorem exact_container_to_later_prompt_gap_us :
    laterA-containerPromptCreatedUs - citationPubDateUs = 131305032822 := by decide

theorem later_a_container_prompt_precedes_morrow_followup_prompt :
    laterA-containerPromptCreatedUs < morrowFollowupPromptCreatedUs := by decide

theorem exact_later_prompt_to_morrow_followup_prompt_gap_us :
    morrowFollowupPromptCreatedUs - laterA-containerPromptCreatedUs = 87866000 := by decide

theorem exact_later_prompt_to_morrow_followup_answer_gap_us :
    morrowFollowupAnswerCreatedUs - laterA-containerPromptCreatedUs = 94617734 := by decide

theorem exact_morrow_followup_prompt_to_answer_gap_us :
    morrowFollowupAnswerCreatedUs - morrowFollowupPromptCreatedUs = 6751734 := by decide

#print axioms citation_pub_date_equals_target_conversation_create_time
#print axioms citation_pub_date_is_not_earlier_snippet_message_time
#print axioms citation_pub_date_is_not_later_snippet_message_time
#print axioms citation_pub_date_precedes_earlier_snippet_message
#print axioms citation_pub_date_precedes_later_snippet_message
#print axioms exact_container_to_earlier_message_gap_us
#print axioms exact_container_to_later_prompt_gap_us
#print axioms later_a_container_prompt_precedes_morrow_followup_prompt
#print axioms exact_later_prompt_to_morrow_followup_prompt_gap_us
#print axioms exact_later_prompt_to_morrow_followup_answer_gap_us
#print axioms exact_morrow_followup_prompt_to_answer_gap_us

end HsHVerification.MorrowCitationDateAudit
