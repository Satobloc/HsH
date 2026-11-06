import Mathlib
import HsHVerification.TernH515SchedulerOverlapEvidence

/-!
Tern Rook / Comptroller — 2026-11-06 nominal :36 scheduler observation.

Source snapshot:
* The :36 occurrence has scheduled_for 2026-11-06T01:36:00Z.
* The same scheduler run identifier was observed with two distinct
  started_at values: 01:41:29.155339Z, then 02:43:16.067924Z.
* The first snapshot showed a failed terminal record with a completion
  timestamp at 01:41:29.894252Z. A later snapshot showed the same run
  identifier again, with a later start and completion at 03:08:19.684449Z,
  still recorded failed. The API exposes no attempt identifier or cause for
  this change; these are two observations, not a proven retry mechanism.
* The immediate successor's Morrow h625:s4 receipt exists. Its scheduler
  terminal state was not independently retrieved in this snapshot.
* The first snapshot's latest_result belonged to an older Orson h611 result;
  the later snapshot's latest_result was the current generic failure result.
  Both observations had chat_ref=null.

Times below are integer microseconds since 2026-10-11T00:00:00Z.
This module proves only arithmetic and finite ring-selection propositions
over the transcribed timestamps and the user-supplied fixed ring. It does not
prove scheduler backend semantics, run identity semantics, why the record
changed, worker/thread identity, handoff consumption, future dispatch, or
any physical H(s)H proposition.
-/

namespace HsHVerification.TernH625SchedulerObservationEvidence

open HsHVerification.TernH515SchedulerOverlapEvidence

def microsPerHour : Nat := 3_600_000_000

def scheduledForUs : Nat := 2_252_160_000_000
def firstStartedUs : Nat := 2_252_489_155_339
def firstCompletedUs : Nat := 2_252_489_894_252
def successorScheduledUs : Nat := 2_252_880_000_000
def secondStartedUs : Nat := 2_256_196_067_924
def secondCompletedUs : Nat := 2_257_699_684_449

def nominalHour : Nat := scheduledForUs / microsPerHour
def firstStartHour : Nat := firstStartedUs / microsPerHour
def secondStartHour : Nat := secondStartedUs / microsPerHour

def nominalSlot : Nat := 3
def nominalSequence : Nat := 5 * nominalHour + nominalSlot
def nominalSelectedIndex : Nat := nominalSequence % 19
def nominalNextIndex : Nat := (nominalSequence + 1) % 19

def secondStartSequence : Nat := 5 * secondStartHour + nominalSlot
def secondStartSelectedIndex : Nat := secondStartSequence % 19

theorem nominal_hour_is_625 : nominalHour = 625 := by decide
theorem first_observed_start_hour_is_625 : firstStartHour = 625 := by decide
theorem second_observed_start_hour_is_626 : secondStartHour = 626 := by decide

theorem nominal_sequence_is_3128 : nominalSequence = 3128 := by decide
theorem nominal_selected_index_is_12 : nominalSelectedIndex = 12 := by decide
theorem nominal_selected_name_is_tern :
    ring[nominalSelectedIndex]? = some "Tern Rook" := by decide
theorem nominal_next_index_is_13 : nominalNextIndex = 13 := by decide
theorem nominal_next_name_is_morrow :
    ring[nominalNextIndex]? = some "Morrow" := by decide

theorem second_start_sequence_is_3133 : secondStartSequence = 3133 := by decide
theorem second_start_selected_index_is_17 :
    secondStartSelectedIndex = 17 := by decide
theorem second_start_based_name_is_ravel :
    ring[secondStartSelectedIndex]? = some "Ravel" := by decide
theorem substituting_second_start_hour_changes_worker :
    nominalSelectedIndex ≠ secondStartSelectedIndex := by decide

theorem first_start_precedes_successor_nominal_time :
    firstStartedUs < successorScheduledUs := by decide
theorem first_completion_precedes_successor_nominal_time :
    firstCompletedUs < successorScheduledUs := by decide
theorem second_start_follows_successor_nominal_time :
    secondStartedUs > successorScheduledUs := by decide
theorem second_completion_follows_second_start :
    secondCompletedUs > secondStartedUs := by decide

theorem first_and_second_start_observations_differ :
    firstStartedUs ≠ secondStartedUs := by decide
theorem second_start_crosses_nominal_hour_boundary :
    secondStartHour = nominalHour + 1 := by decide

theorem first_start_lag_is_329155339us :
    firstStartedUs - scheduledForUs = 329_155_339 := by decide
theorem second_start_lag_is_4036067924us :
    secondStartedUs - scheduledForUs = 4_036_067_924 := by decide
theorem observed_start_shift_is_3706912585us :
    secondStartedUs - firstStartedUs = 3_706_912_585 := by decide
theorem second_start_is_3316067924us_after_successor_nominal :
    secondStartedUs - successorScheduledUs = 3_316_067_924 := by decide

#print axioms nominal_hour_is_625
#print axioms first_observed_start_hour_is_625
#print axioms second_observed_start_hour_is_626
#print axioms nominal_sequence_is_3128
#print axioms nominal_selected_index_is_12
#print axioms nominal_selected_name_is_tern
#print axioms nominal_next_index_is_13
#print axioms nominal_next_name_is_morrow
#print axioms second_start_sequence_is_3133
#print axioms second_start_selected_index_is_17
#print axioms second_start_based_name_is_ravel
#print axioms substituting_second_start_hour_changes_worker
#print axioms first_start_precedes_successor_nominal_time
#print axioms first_completion_precedes_successor_nominal_time
#print axioms second_start_follows_successor_nominal_time
#print axioms second_completion_follows_second_start
#print axioms first_and_second_start_observations_differ
#print axioms second_start_crosses_nominal_hour_boundary
#print axioms first_start_lag_is_329155339us
#print axioms second_start_lag_is_4036067924us
#print axioms observed_start_shift_is_3706912585us
#print axioms second_start_is_3316067924us_after_successor_nominal

end HsHVerification.TernH625SchedulerObservationEvidence
