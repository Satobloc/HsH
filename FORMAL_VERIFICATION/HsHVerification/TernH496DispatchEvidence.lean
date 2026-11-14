import Mathlib

/-!
Tern Rook / Comptroller, 2026-10-31 nominal 16:24Z run.

This module formalizes a bounded operational event record, not physical data.
Times are integer microseconds after 2026-10-31T16:00:00Z.

Sources:
* Fixed 19-name ring and slot formula from Nathan's relay instruction.
* :12 automation run 254bf4e7-7940-8325-9920-9861a2c33a46:
  started 16:09:35.084251Z, completed 16:27:03.376184Z.
* :24 automation run 9ae3a9cd-9580-8322-8d19-9c57695ee311:
  started 16:25:52.936056Z; still in_progress at final observation.
* Enheduanna -> Tern handoff commit 94c0f00cfcd315b365da2f0cb93e43f5d6ec03c3:
  created 16:25:12Z and exact-path content read back.
* This proves the repository packet commit preceded Tern's run start even
  though the sender's run completed after Tern had started.

Lean checks only the closed propositions over these transcribed records.
It does not authenticate API records, establish historical instance identity,
prove cross-thread delivery, or establish any physical proposition.
-/

namespace HsHVerification.TernH496DispatchEvidence

def h : Nat := 496
def slot : Nat := 2

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
theorem h_is_twenty_days_and_sixteen_hours : 20 * 24 + 16 = h := by decide
theorem sequence_is_2482 : sequence = 2482 := by decide
theorem selected_index_is_12 : selectedIndex = 12 := by decide
theorem selected_name_is_tern : ring[selectedIndex]? = some "Tern Rook" := by decide
theorem next_index_is_13 : nextIndex = 13 := by decide
theorem next_name_is_morrow : ring[nextIndex]? = some "Morrow" := by decide

-- Actual automation and GitHub commit timestamps, microseconds after 16:00Z.
def senderStartedUs : Nat := 575084251
def handoffCommittedUs : Nat := 1512000000
def recipientStartedUs : Nat := 1552936056
def senderCompletedUs : Nat := 1623376184

theorem sender_started_before_handoff_commit :
    senderStartedUs < handoffCommittedUs := by decide

theorem handoff_commit_preceded_recipient_start :
    handoffCommittedUs < recipientStartedUs := by decide

theorem recipient_started_before_sender_completed :
    recipientStartedUs < senderCompletedUs := by decide

theorem handoff_was_committed_while_sender_run_active :
    senderStartedUs < handoffCommittedUs ∧
    handoffCommittedUs < senderCompletedUs := by decide

theorem recipient_started_40936056us_after_handoff_commit :
    recipientStartedUs - handoffCommittedUs = 40936056 := by decide

theorem sender_completed_70440128us_after_recipient_start :
    senderCompletedUs - recipientStartedUs = 70440128 := by decide

theorem sender_and_recipient_runs_overlapped_at_least_70440128us :
    recipientStartedUs < senderCompletedUs := by decide

#print axioms ring_has_nineteen_names
#print axioms h_is_twenty_days_and_sixteen_hours
#print axioms sequence_is_2482
#print axioms selected_index_is_12
#print axioms selected_name_is_tern
#print axioms next_index_is_13
#print axioms next_name_is_morrow
#print axioms sender_started_before_handoff_commit
#print axioms handoff_commit_preceded_recipient_start
#print axioms recipient_started_before_sender_completed
#print axioms handoff_was_committed_while_sender_run_active
#print axioms recipient_started_40936056us_after_handoff_commit
#print axioms sender_completed_70440128us_after_recipient_start
#print axioms sender_and_recipient_runs_overlapped_at_least_70440128us

end HsHVerification.TernH496DispatchEvidence
