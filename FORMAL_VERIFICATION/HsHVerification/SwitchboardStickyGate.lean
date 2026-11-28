import Mathlib

/-!
Track A workflow-switchboard formal source review, 2026-10-26.
Original source: workflow_switchboard_demo.py, Git blob
49988a769389b2baf264a27d596ba7c3ff822b36.
The original sticky(actor, kind, text) validates kind and deduplicates
kind/text but accepts no transfer-test evidence or verification flag.
This module abstracts ONLY that state transition. It does not verify
Python source, source provenance, or actual human/LLM transfer tests.
The proposed guarded transition is a candidate contract, not deployed code.
-/

namespace HsHVerification.SwitchboardStickyGate

structure ExperienceState where
  transferTestPassed : Bool
  stored : Bool

def currentSticky (s : ExperienceState) : ExperienceState :=
  { s with stored := true }

def proposedGuardedSticky (s : ExperienceState) : ExperienceState :=
  if s.transferTestPassed then { s with stored := true } else s

/-- The source-derived current transition can store a lesson for which
    no transfer-test receipt is present. This is a counterexample to
    "only transfer-tested lessons become sticky" under this abstraction. -/
theorem current_allows_unverified_store :
    ∃ s : ExperienceState,
      s.transferTestPassed = false ∧
      s.stored = false ∧
      (currentSticky s).stored = true := by
  exact ⟨⟨false, false⟩, rfl, rfl, rfl⟩

/-- A proposed receipt-gated transition leaves stored state unchanged
    whenever the transfer-test flag is false. -/
theorem guarded_does_not_promote_without_test
    (s : ExperienceState) (h : s.transferTestPassed = false) :
    (proposedGuardedSticky s).stored = s.stored := by
  simp [proposedGuardedSticky, h]

end HsHVerification.SwitchboardStickyGate
