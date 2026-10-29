import Mathlib

/-!
# Ariadne: source-specific January 22 chronology gate

These are archival message timestamps, NOT physical observations or a
theory of mind. All seconds below are UTC seconds since 2026-01-22 00:00Z,
obtained by flooring genuine message.create_time values.

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

Separate, weaker source: Ariadne continuity 2026-09-23
blob a50207aa31c8b8e0900d2e80a74cdf301636255c reports a
Jan 22 17:55:59Z Kirk request from conversation-history retrieval.
The original Kirk raw conversation ID/blob is NOT recovered.
The chronology theorem is therefore conditional on that reported time.

Neither original raw thread A nor B contains the Kirk target phrases in
its message content. This last textual check is an executed extraction
observation, not a proposition proved by the timestamp arithmetic.

This file establishes no physical claim or source-parenthood relation.
-/

namespace HsHVerification.AriadneJan22SourceGate

def reportedKirkRequestSecond : Nat := 17 * 3600 + 55 * 60 + 59

def lookupJan22Seconds : List Nat :=
  [73998, 73998, 74080, 74080, 74827, 74827]

def massJan22Seconds : List Nat := [74973, 74976]

theorem lookup_six_message_nodes :
    lookupJan22Seconds.length = 6 := by decide

theorem mass_two_message_nodes :
    massJan22Seconds.length = 2 := by decide

theorem later_than_reported_kirk :
    (lookupJan22Seconds ++ massJan22Seconds).all
      (fun t => reportedKirkRequestSecond < t) = true := by
  decide

theorem lookup_precedes_mass :
    lookupJan22Seconds.all (fun t => t < 74973) = true := by
  decide

theorem earliest_lookup_gap_seconds :
    73998 - reportedKirkRequestSecond = 9439 := by
  norm_num [reportedKirkRequestSecond]

theorem observed_source_separation :
    reportedKirkRequestSecond < 73998 ∧
    74827 < 74973 := by
  norm_num [reportedKirkRequestSecond]

#print axioms lookup_six_message_nodes
#print axioms mass_two_message_nodes
#print axioms later_than_reported_kirk
#print axioms lookup_precedes_mass
#print axioms earliest_lookup_gap_seconds
#print axioms observed_source_separation

end HsHVerification.AriadneJan22SourceGate
