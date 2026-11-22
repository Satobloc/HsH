import Mathlib

/-!
# Elias Kern: source discovery is not directive authority

Source context:
- HSH_RESOURCES/info/WORKFLOW_SWITCHBOARD_POC.md, section CENTRAL / registered source routes.
- HSH_RESOURCES/tools/workflow_switchboard_demo.py, BASE_STATE, Switchboard.wake,
  and Switchboard.source_routes; immutable source blob
  49988a769389b2baf264a27d596ba7c3ff822b36.

The Python POC uses a Boolean fresh/incorporated pair and routes fresh material
to directive intake. Its self-test checks that routing label, but the POC does
not implement a source-read, authority-review, approval, or incorporation
transition. The hard-coded War Room item is a test fixture, not proof that the
file is currently governing.

This module is an ASSISTANT-PROPOSED typed contract, not a translation of the
Python implementation and not Nathan Direct wording. It separates source
state from authority state and makes incorporation an explicit transition.
The theorems prove only this encoded finite state machine.
-/

namespace HsHVerification.EliasDirectiveFreshness

inductive SourceState
  | absent
  | observed
  | read
  deriving DecidableEq, Repr

inductive AuthorityState
  | unknown
  | candidate
  | governing
  deriving DecidableEq, Repr

structure DirectiveState where
  source : SourceState
  authority : AuthorityState
  incorporated : Bool
  deriving DecidableEq, Repr

inductive NextOperation
  | wait
  | inspectSource
  | reviewAuthority
  | incorporate
  | resume
  deriving DecidableEq, Repr

def nextOperation (s : DirectiveState) : NextOperation :=
  if s.incorporated then .resume else
    match s.source, s.authority with
    | .absent, _ => .wait
    | .observed, _ => .inspectSource
    | .read, .unknown => .wait
    | .read, .candidate => .reviewAuthority
    | .read, .governing => .incorporate

def incorporate (s : DirectiveState) : DirectiveState :=
  if s.source = .read ∧ s.authority = .governing then
    { s with incorporated := true }
  else s

theorem observed_file_enters_intake :
    nextOperation
      { source := .observed, authority := .unknown, incorporated := false }
      = .inspectSource := by
  rfl

theorem read_candidate_requires_authority_review :
    nextOperation
      { source := .read, authority := .candidate, incorporated := false }
      = .reviewAuthority := by
  rfl

theorem governing_read_source_enters_incorporation :
    nextOperation
      { source := .read, authority := .governing, incorporated := false }
      = .incorporate := by
  rfl

theorem incorporation_only_after_source_read_and_governing_authority
    (s : DirectiveState)
    (h : nextOperation s = .incorporate) :
    s.source = .read ∧ s.authority = .governing ∧ s.incorporated = false := by
  cases s with
  | mk source authority incorporated =>
      cases source <;> cases authority <;> cases incorporated <;>
        simp [nextOperation] at h ⊢

theorem candidate_cannot_be_incorporated
    (s : DirectiveState)
    (hs : s.source = .read)
    (ha : s.authority = .candidate) :
    incorporate s = s := by
  simp [incorporate, hs, ha]

theorem governing_read_can_be_incorporated
    (s : DirectiveState)
    (hs : s.source = .read)
    (ha : s.authority = .governing) :
    (incorporate s).incorporated = true := by
  simp [incorporate, hs, ha]

theorem incorporation_releases_wake
    (s : DirectiveState)
    (hs : s.source = .read)
    (ha : s.authority = .governing) :
    nextOperation (incorporate s) = .resume := by
  simp [incorporate, hs, ha, nextOperation]

theorem incorporation_is_idempotent (s : DirectiveState) :
    incorporate (incorporate s) = incorporate s := by
  by_cases h : s.source = .read ∧ s.authority = .governing <;>
    simp [incorporate, h]

theorem already_incorporated_resumes
    (s : DirectiveState)
    (h : s.incorporated = true) :
    nextOperation s = .resume := by
  simp [nextOperation, h]

#eval nextOperation
  { source := .observed, authority := .unknown, incorporated := false }
#eval nextOperation
  { source := .read, authority := .candidate, incorporated := false }
#eval nextOperation (incorporate
  { source := .read, authority := .governing, incorporated := false })

#print axioms observed_file_enters_intake
#print axioms read_candidate_requires_authority_review
#print axioms governing_read_source_enters_incorporation
#print axioms incorporation_only_after_source_read_and_governing_authority
#print axioms candidate_cannot_be_incorporated
#print axioms governing_read_can_be_incorporated
#print axioms incorporation_releases_wake
#print axioms incorporation_is_idempotent
#print axioms already_incorporated_resumes

end HsHVerification.EliasDirectiveFreshness
