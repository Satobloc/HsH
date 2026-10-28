import Mathlib

/-!
Elias Kern Track A / 2026-10-28 23:12Z.
Source-grounded finite publisher-status gate, not a theory proof.

Actual public records:
- Satobloc/HsH issue #949: owner-authored issue opened 23:03:31Z;
  GitHub Actions publish job #123154502018 concluded success but
  publisher comment #6482981074 says REJECTED: SHA-256 mismatch.
- Satobloc/HsH issue #950: opened 23:05:57Z; Actions job
  #123155512380 concluded success; publisher comment #6483025330
  says PUBLISHED with independent committed file readback.
- Both *current* issue JSON bodies have exactly the same 4,762-character
  decoded content and same 64-character SHA256. Submission IDs differ.
- Publisher tools/issue_publish.py blob 7067e8d9f27a273d90e443afb0493260d9a3ecbf
  reads GITHUB_EVENT_PATH and returns exit 0 on a validation rejection.
  Thus an edited current issue body is not the original opened-event body.

Lean checks only consequences of these explicitly encoded source observations.
It does not authenticate GitHub, certify the SHA digest, or execute the publisher.
No physical system or data-free physical calculation is involved.
-/

namespace HsHVerification.EliasPublisherStatus

inductive Attempt where
  | issue949
  | issue950
  deriving DecidableEq, Repr

inductive Content where
  | haleRepeatedPrompt
  deriving DecidableEq, Repr

inductive Outcome where
  | rejectedShaMismatch
  | publishedReadback
  deriving DecidableEq, Repr

def currentContent : Attempt → Content
  | .issue949 => .haleRepeatedPrompt
  | .issue950 => .haleRepeatedPrompt

def actionJobSuccess : Attempt → Bool
  | .issue949 => true
  | .issue950 => true

def publisherOutcome : Attempt → Outcome
  | .issue949 => .rejectedShaMismatch
  | .issue950 => .publishedReadback

theorem equal_current_content :
    currentContent .issue949 = currentContent .issue950 := by
  rfl

theorem equal_action_success :
    actionJobSuccess .issue949 = actionJobSuccess .issue950 := by
  rfl

theorem distinct_publisher_outcomes :
    publisherOutcome .issue949 ≠ publisherOutcome .issue950 := by
  decide

theorem successful_action_can_reject :
    ∃ a : Attempt,
      actionJobSuccess a = true ∧ publisherOutcome a = .rejectedShaMismatch := by
  exact ⟨.issue949, rfl, rfl⟩

theorem no_current_content_only_outcome :
    ¬ ∃ f : Content → Outcome, ∀ a, f (currentContent a) = publisherOutcome a := by
  intro h
  rcases h with ⟨f, hf⟩
  apply distinct_publisher_outcomes
  calc
    publisherOutcome .issue949 = f (currentContent .issue949) := (hf _).symm
    _ = f (currentContent .issue950) := congrArg f equal_current_content
    _ = publisherOutcome .issue950 := hf _

theorem no_action_success_only_outcome :
    ¬ ∃ f : Bool → Outcome, ∀ a, f (actionJobSuccess a) = publisherOutcome a := by
  intro h
  rcases h with ⟨f, hf⟩
  apply distinct_publisher_outcomes
  calc
    publisherOutcome .issue949 = f (actionJobSuccess .issue949) := (hf _).symm
    _ = f (actionJobSuccess .issue950) := congrArg f equal_action_success
    _ = publisherOutcome .issue950 := hf _

#print axioms equal_current_content
#print axioms equal_action_success
#print axioms distinct_publisher_outcomes
#print axioms successful_action_can_reject
#print axioms no_current_content_only_outcome
#print axioms no_action_success_only_outcome

end HsHVerification.EliasPublisherStatus
