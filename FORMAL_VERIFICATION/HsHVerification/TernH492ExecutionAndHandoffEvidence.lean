import Mathlib

/-!
Tern Rook / Comptroller, 2026-10-31 nominal 12:36Z run.

This module encodes a bounded, source-backed operational snapshot, not
physical measurements or a physical model. Timestamp values are integer
microseconds since 2026-10-31T12:00:00Z.

Sources:
* User-specified fixed 19-name ring and sequence rule.
* Automation API records:
  :00 run a3bf7f6d-e148-832b-8202-cc4153160ec9,
  :12 run d836eb66 (actual run record inspected in this turn),
  :24 run 5806ea4e (actual run record inspected in this turn),
  :36 run 06ea90f7 (actual run record inspected in this turn).
* Enheduanna source report commit 35a8ee420a734a48e813979946079f4aa1fe98b9,
  receipt commit c5f538ee41d00df35b12a9c6cebe8f0fa3fe1a22,
  and handoff commit cfa79671fa90616c579b369ee3c3e84992a3532e.
* The h492:s0 Elias receipt is the legacy path
  WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-31_s0_elias_kern.md.
  It states that no new handoff file was created and that an older h488
  handoff was amended. The expected h492:s0 -> h492:s1 path returned 404;
  an exact run-key search returned no result. This is a BOUNDED repository
  search observation, not proof of global nonexistence.
* The only located Elias->Nadir packet is still addressed to h488:s2,
  not h492:s1. It must not be treated as the current predecessor packet.

Lean checks only the closed propositions below over these transcribed
records. It does not authenticate the service metadata, prove a ChatGPT
thread received anything, or establish worker identity.
-/

namespace HsHVerification.TernH492ExecutionAndHandoffEvidence

def h : Nat := 492
def slot : Nat := 3

def ring : List String :=
  [ "Sable", "Loom", "Aster", "Ariadne", "Alberr", "Mira", "Aldus"
  , "Calder", "Hale", "Elias Kern", "Nadir Voss", "Enheduanna"
  , "Tern Rook", "Morrow", "Kestrel", "Meridian", "Mercer", "Ravel"
  , "Orson Vay"
  ]

def sequence : Nat := 5 * h + slot
def selectedIndex : Nat := sequence % 19
def nextIndex : Nat := (sequence + 1) % 19

theorem ring_has_nineteen_names : ring.length = 19 := by decide
theorem h_is_nominal_utc_hour_492 : 20 * 24 + 12 = h := by decide
theorem sequence_is_2463 : sequence = 2463 := by decide
theorem selected_index_is_12 : selectedIndex = 12 := by decide
theorem selected_name_is_tern : ring[selectedIndex]? = some "Tern Rook" := by decide
theorem next_index_is_13 : nextIndex = 13 := by decide
theorem next_name_is_morrow : ring[nextIndex]? = some "Morrow" := by decide

-- Scheduler API timestamps, in microseconds after 12:00:00Z.
def s0ScheduledUs : Nat := 0
def s0StartedUs : Nat := 265593462
def s0CompletedUs : Nat := 1757975739

def s1ScheduledUs : Nat := 720000000
def s1StartedUs : Nat := 2108078999

def s2ScheduledUs : Nat := 1440000000
def s2StartedUs : Nat := 1176470873
def s2CompletedUs : Nat := 1779215453

def s3ScheduledUs : Nat := 2160000000
def s3StartedUs : Nat := 2071702846

-- GitHub commit time for the exact h492:s2 -> h492:s3 packet.
def s2HandoffCommittedUs : Nat := 1713000000

theorem s0_started_after_nominal :
    s0StartedUs - s0ScheduledUs = 265593462 := by decide
theorem s1_started_1388078999us_after_nominal :
    s1StartedUs - s1ScheduledUs = 1388078999 := by decide
theorem s2_started_before_nominal :
    s2ScheduledUs - s2StartedUs = 263529127 := by decide
theorem s3_started_before_nominal :
    s3ScheduledUs - s3StartedUs = 88297154 := by decide

theorem s0_and_s2_actually_overlapped :
    s2StartedUs < s0CompletedUs := by decide
theorem s0_s2_overlap_duration_us :
    s0CompletedUs - s2StartedUs = 581504866 := by decide

theorem s3_started_before_s1 :
    s3StartedUs < s1StartedUs := by decide
theorem s1_started_36376153us_after_s3 :
    s1StartedUs - s3StartedUs = 36376153 := by decide

theorem s2_handoff_preceded_s2_completion :
    s2HandoffCommittedUs < s2CompletedUs := by decide
theorem s2_handoff_preceded_s3_recipient_start :
    s2HandoffCommittedUs < s3StartedUs := by decide
theorem s2_source_completed_before_s3_recipient_start :
    s2CompletedUs < s3StartedUs := by decide
theorem s2_handoff_to_s3_lead_us :
    s3StartedUs - s2HandoffCommittedUs = 358702846 := by decide
theorem s2_completion_to_s3_lead_us :
    s3StartedUs - s2CompletedUs = 292487393 := by decide
theorem s2_handoff_was_created_66215453us_before_source_completion :
    s2CompletedUs - s2HandoffCommittedUs = 66215453 := by decide

-- Current h492:s0 -> h492:s1 packet search, bounded to the exact expected
-- path, exact run-key search, and the sender's own receipt statement.
def currentS0ToS1PacketFound : Bool := false
def olderPacketFromHour : Nat := 488
def olderPacketFromSlot : Nat := 1
def olderPacketToSlot : Nat := 2
def currentHour : Nat := 492
def currentS0 : Nat := 0
def currentS1 : Nat := 1

theorem bounded_search_did_not_find_current_s0_s1_packet :
    currentS0ToS1PacketFound = false := by decide
theorem located_older_packet_is_not_current_hour :
    olderPacketFromHour ≠ currentHour := by decide
theorem located_older_packet_is_not_current_s0_s1_slot_pair :
    olderPacketFromSlot ≠ currentS0 ∨ olderPacketToSlot ≠ currentS1 := by decide

#print axioms ring_has_nineteen_names
#print axioms h_is_nominal_utc_hour_492
#print axioms sequence_is_2463
#print axioms selected_index_is_12
#print axioms selected_name_is_tern
#print axioms next_index_is_13
#print axioms next_name_is_morrow
#print axioms s0_started_after_nominal
#print axioms s1_started_1388078999us_after_nominal
#print axioms s2_started_before_nominal
#print axioms s3_started_before_nominal
#print axioms s0_and_s2_actually_overlapped
#print axioms s0_s2_overlap_duration_us
#print axioms s3_started_before_s1
#print axioms s1_started_36376153us_after_s3
#print axioms s2_handoff_preceded_s2_completion
#print axioms s2_handoff_preceded_s3_recipient_start
#print axioms s2_source_completed_before_s3_recipient_start
#print axioms s2_handoff_to_s3_lead_us
#print axioms s2_completion_to_s3_lead_us
#print axioms s2_handoff_was_created_66215453us_before_source_completion
#print axioms bounded_search_did_not_find_current_s0_s1_packet
#print axioms located_older_packet_is_not_current_hour
#print axioms located_older_packet_is_not_current_s0_s1_slot_pair

end HsHVerification.TernH492ExecutionAndHandoffEvidence
