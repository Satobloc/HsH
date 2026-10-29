import Mathlib

/-!
Calder :24 | 2026-10-29 06:24 UTC | P1 source-key sensitivity.
SOURCE-RECORDED INPUTS, not generated examples: 17 archived CGD JSON
files in aayambansal/ConsistencyBench/results, identified by the SHA-1
manifest in HsH WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py.
For each file, the four negation questions in each of 50 sets are
scored against (1) the original benchmark keys and (2) the provisional
Q3 rekey to Q1. Numbers below are within-file final-minus-initial
correct-label counts, NOT experimental estimates of cognitive ability.
Original evaluator: src/evaluate.py Git blob
0453540cb7c19227601e59fb342fa93e736da849.
This Lean module checks only arithmetic of explicitly transcribed counts.
-/ 

namespace HsHVerification.CalderNegationLedger

-- Order: GPT-4o, GPT-4.1, Gemini2.5Pro, ClaudeOpus4.6,
-- Claude3.5Sonnet, ClaudeSonnet4.5, ClaudeSonnet4.6, DeepSeekV3.2,
-- Gemini2Flash, Gemini2.5Flash, GPT5mini, GPT5.2, GPT5,
-- Llama3.1, Llama3.3, o3, Qwen2.5.
def sourceNets : List Int :=
  [22, 8, -8, -9, -10, -7, -1, -13, 24, -24, 3, 8, 1, 2, -5, -3, 2]

def correctedNets : List Int :=
  [-12, -10, -22, 11, -10, -7, 15, -8, -7, -15, 0, -14, -3, -26, 3, -13, 9]

theorem seventeen_models : correctedNets.length = 17 := by decide
theorem source_total : sourceNets.foldl (· + ·) 0 = -10 := by decide
theorem corrected_total : correctedNets.foldl (· + ·) 0 = -109 := by decide
theorem negative_models :
    (correctedNets.filter (fun x => decide (x < 0))).length = 12 := by decide
theorem positive_models :
    (correctedNets.filter (fun x => decide (x > 0))).length = 4 := by decide
theorem zero_models :
    (correctedNets.filter (fun x => decide (x = 0))).length = 1 := by decide

#print axioms seventeen_models
#print axioms source_total
#print axioms corrected_total
#print axioms negative_models
#print axioms positive_models
#print axioms zero_models

end HsHVerification.CalderNegationLedger
