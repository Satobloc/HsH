import Mathlib

/-!
Loom source-attribution gate, 2026-10-27.
Primary raw conversation: "Mass in SAT framework", 2025-10-24,
message UUID 79bf888c-de7c-4c1c-8617-5e1b49250af2.
Git blob 98237bd471553aa43ae5045dbe35a42a7267543d
(HsH DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_3/25.10.24...raw.json).

The outer author.role is user, but content.parts[0] is a pasted
NotebookLM exchange. Offsets below are UTF-16 string indices measured
from the actual 15,022-unit source text, NOT independently authenticated
authorship. Current framing and two earlier Nathan questions are
separated from two pasted NotebookLM replies.

This proves only finite typed attribution bookkeeping conditional on
the manually audited offsets and origin tags. It is NOT a physics proof
or authentication of the original NotebookLM exchange.
-/

namespace HsHVerification.LoomEmbeddedNotebookLMSpans

inductive Origin where
  | currentNathan
  | quotedNathan
  | importedNotebookLM
  deriving DecidableEq, Repr

structure TaggedSpan where
  start : Nat
  stop : Nat
  origin : Origin
  deriving DecidableEq, Repr

def observedSpans : List TaggedSpan :=
  [ ⟨0, 138, .currentNathan⟩
  , ⟨138, 928, .quotedNathan⟩
  , ⟨928, 7438, .importedNotebookLM⟩
  , ⟨7438, 8212, .quotedNathan⟩
  , ⟨8212, 15022, .importedNotebookLM⟩
  ]

/-- The raw envelope says user for every span because all are in one user message. -/
def outerRole (_ : TaggedSpan) : String := "user"

/-- The source-derived five segments cover the stated offset intervals. -/
theorem observed_boundaries :
    observedSpans.map (fun s => (s.start, s.stop)) =
      [(0, 138), (138, 928), (928, 7438), (7438, 8212), (8212, 15022)] := by
  rfl

/-- The imported NotebookLM text is present in this outer user message. -/
theorem imported_ai_present :
    (observedSpans.any fun s => s.origin == Origin.importedNotebookLM) = true := by
  decide

/-- The outer user message is not uniformly current Nathan-authored text. -/
theorem not_all_current_nathan :
    (observedSpans.all fun s => s.origin == Origin.currentNathan) = false := by
  decide

/-- Equal raw role does not imply equal embedded speaker provenance. -/
theorem outer_role_does_not_determine_origin :
    ∃ a b : TaggedSpan,
      a ∈ observedSpans ∧ b ∈ observedSpans ∧
      outerRole a = outerRole b ∧ a.origin ≠ b.origin := by
  refine ⟨⟨0, 138, .currentNathan⟩,
    ⟨928, 7438, .importedNotebookLM⟩, ?_, ?_, rfl, ?_⟩
  · decide
  · decide
  · decide

/-- Three observed raw export paths share one message UUID, not three IDs. -/
def observedUUIDs : List String :=
  [ "79bf888c-de7c-4c1c-8617-5e1b49250af2"
  , "79bf888c-de7c-4c1c-8617-5e1b49250af2"
  , "79bf888c-de7c-4c1c-8617-5e1b49250af2"
  ]

theorem three_paths_not_three_distinct_message_ids :
    ¬ observedUUIDs.Nodup := by
  decide

#print axioms observed_boundaries
#print axioms imported_ai_present
#print axioms not_all_current_nathan
#print axioms outer_role_does_not_determine_origin
#print axioms three_paths_not_three_distinct_message_ids

end HsHVerification.LoomEmbeddedNotebookLMSpans
