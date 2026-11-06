import Mathlib

/-!
Calder Review-MIND 2026-10-28T03:48Z.
Source-conditional classification of actual archived ChatGPT extraction windows.

Source evidence, NOT formal axioms of physical reality:
RAVEL raw Git blob c49367b0faa424491e7b3520a034b9e44fe6897f;
retained output blob 1f85fb29d7fda26bcaddb40c363b0c883fdd2a9e.
RUSSIA raw Git blob 8cef441a6d22a38a468cba55edc7c218a87832e3;
retained output blob 1872020a4036a1b4059723eb41386c1a6ac76f71.

Counts transcribed from an executed source graph traversal; Lean does not
verify the transcript, the exporter, or the JS extraction computation.
A same-branch skipped intermediary is not a cross-branch splice.
-/

namespace HsHVerification.CalderArchiveContext

def SameBranch {Node : Type*} (ancestor : Node → Node → Prop)
    (a b : Node) : Prop := ancestor a b ∨ ancestor b a

def CrossBranch {Node : Type*} (ancestor : Node → Node → Prop)
    (a b : Node) : Prop := ¬ ancestor a b ∧ ¬ ancestor b a

theorem sameBranch_excludes_crossBranch {Node : Type*}
    (ancestor : Node → Node → Prop) (a b : Node)
    (h : SameBranch ancestor a b) :
    ¬ CrossBranch ancestor a b := by
  intro hc
  rcases h with hab | hba
  · exact hc.1 hab
  · exact hc.2 hba

-- Actual archived retained-output adjacent pairs, source-conditional counts.
theorem ravel_retained_adjacency_partition : 25 + 29 + 0 = 54 := by
  norm_num

theorem russia_retained_adjacency_partition : 22 + 1 + 3 = 26 := by
  norm_num

-- Per-target context-window occurrences are NOT independent unique edges.
theorem ravel_target_window_partition : 25 + 23 = 48 := by
  norm_num

theorem russia_target_window_partition : 42 + 1 + 5 = 48 := by
  norm_num

theorem russia_duplicate_occurrence_count : 48 - 26 = 22 := by
  norm_num

#print axioms sameBranch_excludes_crossBranch
#print axioms ravel_retained_adjacency_partition
#print axioms russia_retained_adjacency_partition
#print axioms ravel_target_window_partition
#print axioms russia_target_window_partition
#print axioms russia_duplicate_occurrence_count

end HsHVerification.CalderArchiveContext
