import Mathlib

/-!
Source-visibility model for the 2026-10-28 Ariadne archival audit.
This formalizes an observation/projection boundary, NOT a claim about
authorship, ChatGPT process continuity, cognition, or physical theory.

Empirical input: the Science Made Stupid original JSON export contains
an Ariadne-name occurrence in a content_type=thoughts message, while
the audited public-message text projection has no such occurrence.
That classification is independently established by a Python source replay,
not by the Lean theorems below.
-/

namespace HsHVerification.AriadneSourceVisibility

inductive Channel where
  | public
  | internal
  deriving DecidableEq

structure SourceMessage where
  content : String
  channel : Channel
  deriving DecidableEq

def visibleText (m : SourceMessage) : String :=
  match m.channel with
  | .public => m.content
  | .internal => ""

theorem internal_text_erased (s : String) :
    visibleText ⟨s, .internal⟩ = "" := rfl

theorem public_text_preserved (s : String) :
    visibleText ⟨s, .public⟩ = s := rfl

theorem hidden_and_empty_public_have_same_projection (s : String) :
    visibleText ⟨s, .internal⟩ = visibleText ⟨"", .public⟩ := rfl

theorem observed_name_not_visible :
    visibleText ⟨"Ariadne", .internal⟩ = "" := rfl

#print axioms internal_text_erased
#print axioms public_text_preserved
#print axioms hidden_and_empty_public_have_same_projection
#print axioms observed_name_not_visible

end HsHVerification.AriadneSourceVisibility
