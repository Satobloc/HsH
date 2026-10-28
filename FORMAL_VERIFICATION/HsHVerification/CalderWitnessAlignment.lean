import Mathlib

/-!
Calder 2026-10-28 11:24Z. CONDITIONAL arithmetic about two real archived
witnesses, NOT proof of their transcription or of a physical theory.
Original ChatGPT raw graph: Git blob 2cea1924266418e19b825b95ae51e6b7cbace7e1 (HsH).
Derivative March 23 screenshot transcription: Git blob
339fddec01b717bedffed770f1b73f8bab103fb5 (SAT archive).
All counts were independently recomputed by a graph-aware source replay.
-/

namespace HsHVerification.CalderWitnessAlignment

-- March 2024 assistant-to-all graph nodes: 97 exact normalized text,
-- 33 additional token-equal after Markdown/UI normalization,
-- four inactive branch leaves, one active reply with appended UI footer.
theorem assistant_partition : 97 + 33 + 4 + 1 = 135 := by
  norm_num

theorem nonexact_partition : 33 + 4 + 1 = 38 := by
  norm_num

theorem active_token_matches : 97 + 33 = 130 := by
  norm_num

theorem active_reply_coverage : 130 + 1 = 131 := by
  norm_num

theorem screenshot_turns : 131 + 131 = 262 := by
  norm_num

#print axioms assistant_partition
#print axioms nonexact_partition
#print axioms active_token_matches
#print axioms active_reply_coverage
#print axioms screenshot_turns

end HsHVerification.CalderWitnessAlignment
