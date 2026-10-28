import Mathlib

/-!
Calder 2026-10-28 15:12Z correction to the March 2024 source-witness
alignment formalization, based on two actual archived witnesses.

Original ChatGPT raw graph: HsH blob 2cea1924266418e19b825b95ae51e6b7cbace7e1.
Derivative screenshot text: SAT archive blob
339fddec01b717bedffed770f1b73f8bab103fb5.

The first Calder source replay counted 130 alphabetic-token matches.
A stricter replay preserving digits establishes 129 alphanumeric-token matches:
97 whitespace/UI-normalized exact, 8 additionally token-identical after
punctuation/Markdown normalization, and 24 after removing numbered-list
enumerators. One derivative reply inserts 748 after 'intertwining'; one
has appended screenshot UI footer. Four raw assistant-to-all nodes lie
off the selected ancestry. These categories describe *observed source
processing*, not a proof of archival authenticity or physical theory.
The older 130 count is retained below explicitly as ALPHABETIC ONLY.
-/

namespace HsHVerification.CalderWitnessAlignment

-- Raw March 2024 assistant-to-all nodes, counting mutually exclusive
-- selected-path fidelity categories and inactive graph leaves.
theorem assistant_partition_strict : 97 + 8 + 24 + 1 + 1 + 4 = 135 := by
  norm_num

theorem selected_path_partition_strict : 97 + 8 + 24 + 1 + 1 = 131 := by
  norm_num

theorem strict_alphanumeric_matches : 97 + 8 + 24 = 129 := by
  norm_num

-- Alphabetic-only comparison hides the numeric insertion.
theorem alphabetic_only_matches : 129 + 1 = 130 := by
  norm_num

theorem all_assistant_positions_accounted : 129 + 1 + 1 = 131 := by
  norm_num

theorem raw_to_selected_path : 135 - 4 = 131 := by
  norm_num

theorem screenshot_turns : 131 + 131 = 262 := by
  norm_num

#print axioms assistant_partition_strict
#print axioms selected_path_partition_strict
#print axioms strict_alphanumeric_matches
#print axioms alphabetic_only_matches
#print axioms all_assistant_positions_accounted
#print axioms raw_to_selected_path
#print axioms screenshot_turns

end HsHVerification.CalderWitnessAlignment
