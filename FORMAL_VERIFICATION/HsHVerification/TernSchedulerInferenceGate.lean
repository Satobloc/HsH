import HsHVerification.TernSchedulerEvidence

/-!
Comptroller inference gate. The observed absence of next_run_time in
five API responses does NOT imply the five tasks are disabled or that the
next hourly dispatch will fail. Conversely, past completed runs cannot
prove future dispatch. The latter is intentionally NOT encoded as a theorem.
This is a finite conditional check over real scheduler metadata, not
a proof of backend scheduling semantics.
-/

namespace HsHVerification.TernSchedulerInferenceGate

open HsHVerification.TernSchedulerEvidence

theorem enabled_and_next_unreported_coexist :
    observed.any (fun r => r.enabled && r.nextReported.isNone) = true := by
  decide

theorem completed_and_next_unreported_coexist :
    observed.any (fun r => r.lastCompleted && r.nextReported.isNone) = true := by
  decide

theorem long_runtime_does_not_prevent_recorded_completion :
    observed.any (fun r => decide (r.runtimeMicroseconds > 900000000) &&
      r.lastCompleted) = true := by
  decide

theorem early_dispatch_and_recorded_completion_coexist :
    observed.any (fun r => decide (r.startOffsetMicroseconds < 0) &&
      r.lastCompleted) = true := by
  decide

theorem all_five_completed_despite_missing_next :
    observed.all (fun r => r.lastCompleted && r.nextReported.isNone) = true := by
  decide

#print axioms enabled_and_next_unreported_coexist
#print axioms completed_and_next_unreported_coexist
#print axioms long_runtime_does_not_prevent_recorded_completion
#print axioms early_dispatch_and_recorded_completion_coexist
#print axioms all_five_completed_despite_missing_next

end HsHVerification.TernSchedulerInferenceGate
