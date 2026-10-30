import Mathlib

/-!
# Ariadne: source-specific January 22 chronology gate

These are archival message timestamps, NOT physical observations or a
theory of mind. All seconds below are UTC seconds since 2026-01-22 00:00Z,
obtained by flooring the corresponding recorded/indexed timestamps.

Source A: HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_16/
26.01.20•26.09.12•SAT Lookup Framework — raw.json
Git blob f16037b8dc24697f26c510a76753ceda43219371
Conversation 696f5b30-e760-8330-974f-f0ff3df639e9.
Six timestamped January 22 message nodes in the selected ancestry.

Source B: HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_3/
25.10.24•26.01.22•Mass in SAT framework — raw.json
Git blob 98237bd471553aa43ae5045dbe35a42a7267543d
Conversation 68fbfb81-e13c-832a-8eb0-b9fad4a0393b.
Two timestamped January 22 message nodes in the selected ancestry.

Separate, weaker sources:
- Ariadne continuity 2026-09-23, blob
  a50207aa31c8b8e0900d2e80a74cdf301636255c, reported a 17:55:59Z
  timestamp as a Kirk request. That attribution is NOT authenticated.
- A 2026-10-30 conversation-history index reports a user-role event at
  17:54:03Z (episode-order selection only) and an assistant-role
  title/operator output at 17:57:40Z. This is an index result, not a
  recovered raw transcript. The legacy 17:55:59Z time lies between
  those index events but is not authenticated as a separate message,
  a request, or a user-authored event.

The original Kirk raw conversation ID/blob is NOT recovered. The
chronology propositions below are conditional on their stated timestamp
sources. Neither original raw thread A nor B contains the Kirk target
phrases in its message content. That textual check is an executed
extraction observation, not a proposition proved by timestamp arithmetic.

This file establishes no physical claim, human-cognition claim, source
authorship, or source-parenthood relation. Lean checks only the
arithmetic encoded below.
-/

namespace HsHVerification.AriadneJan22SourceGate

def indexedUserEpisodeOrderSecond : Nat := 17 * 3600 + 54 * 60 + 3

def legacyContinuityTimestampSecond : Nat := 17 * 3600 + 55 * 60 + 59

def indexedAssistantTitleOutputSecond : Nat := 17 * 3600 + 57 * 60 + 40

def lookupJan22Seconds : List Nat :=
  [73998, 73998, 74080, 74080, 74827, 74827]

def massJan22Seconds : List Nat := [74973, 74976]

theorem lookup_six_message_nodes :
    lookupJan22Seconds.length = 6 := by decide

theorem mass_two_message_nodes :
    massJan22Seconds.length = 2 := by decide

/-- Conditional on the index-reported event timestamps, the user-role
episode-order event precedes the assistant-role title/operator output. -/
theorem indexed_user_event_precedes_assistant_output :
    indexedUserEpisodeOrderSecond < indexedAssistantTitleOutputSecond := by
  norm_num [indexedUserEpisodeOrderSecond, indexedAssistantTitleOutputSecond]

/-- The legacy 17:55:59Z continuity timestamp falls between the two
index-reported events. This does not establish a third message. -/
theorem legacy_timestamp_between_index_events :
    indexedUserEpisodeOrderSecond < legacyContinuityTimestampSecond ∧
    legacyContinuityTimestampSecond < indexedAssistantTitleOutputSecond := by
  norm_num [indexedUserEpisodeOrderSecond, legacyContinuityTimestampSecond,
    indexedAssistantTitleOutputSecond]

theorem legacy_timestamp_after_indexed_user_event_seconds :
    legacyContinuityTimestampSecond - indexedUserEpisodeOrderSecond = 116 := by
  norm_num [indexedUserEpisodeOrderSecond, legacyContinuityTimestampSecond]

theorem indexed_assistant_output_after_legacy_timestamp_seconds :
    indexedAssistantTitleOutputSecond - legacyContinuityTimestampSecond = 101 := by
  norm_num [legacyContinuityTimestampSecond, indexedAssistantTitleOutputSecond]

/-- Conditional arithmetic only: all eight timestamps in the two known,
unrelated January 22 raw conversations follow the legacy 17:55:59Z time.
This is not a theorem that a Kirk request occurred at that time. -/
theorem later_than_legacy_continuity_timestamp :
    (lookupJan22Seconds ++ massJan22Seconds).all
      (fun t => legacyContinuityTimestampSecond < t) = true := by
  decide

theorem lookup_precedes_mass :
    lookupJan22Seconds.all (fun t => t < 74973) = true := by
  decide

theorem legacy_time_to_earliest_lookup_gap_seconds :
    73998 - legacyContinuityTimestampSecond = 9439 := by
  norm_num [legacyContinuityTimestampSecond]

theorem observed_source_separation :
    legacyContinuityTimestampSecond < 73998 ∧
    74827 < 74973 := by
  norm_num [legacyContinuityTimestampSecond]

#print axioms lookup_six_message_nodes
#print axioms mass_two_message_nodes
#print axioms indexed_user_event_precedes_assistant_output
#print axioms legacy_timestamp_between_index_events
#print axioms legacy_timestamp_after_indexed_user_event_seconds
#print axioms indexed_assistant_output_after_legacy_timestamp_seconds
#print axioms later_than_legacy_continuity_timestamp
#print axioms lookup_precedes_mass
#print axioms legacy_time_to_earliest_lookup_gap_seconds
#print axioms observed_source_separation

end HsHVerification.AriadneJan22SourceGate
