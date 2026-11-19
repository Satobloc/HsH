import Mathlib

/-!
# Selective message gating: a conditional break-even theorem

Primary source: Yaxin Gong et al., "When Upstream Messages Override Correct
Answers: A Controlled Study of Multi-Agent LLM Collaboration", arXiv:2609.36855v1
(submitted 2026-09-29), §§2.1 and 3.6, Appendix A.8.

The paper reports that removing an upstream message can help on items where
the upstream answer is wrong, but harm on items where it is correct. It gives
approximate break-even detector-precision values for BIRD and L2W.

The theorem below is an assistant reconstruction of the two-outcome decision
rule, not a theorem claimed by the paper's authors. Let p be the precision of
a detector among messages it flags; gain be the benefit of removing a wrong
message; and cost be the loss from removing a correct message. Expected net
change per flagged message is p*gain - (1-p)*cost. For positive gain+cost,
nonnegative expected change is equivalent to p >= cost/(gain+cost).

This abstracts away item heterogeneity, detector recall, intervention costs,
uncertainty in estimated effects, and differences among benchmarks. The
empirical examples below are summary-statistic reconstructions from rounded
published table entries, not raw-data reanalysis or independent experiments.
-/

namespace HsHVerification.SelectiveMessageGate

/-- Expected accuracy change per flagged message, in percentage points. -/
def expectedNet (precision gain cost : ℚ) : ℚ :=
  precision * gain - (1 - precision) * cost

/--
For positive total gain-plus-cost, the detector-precision threshold is
cost / (gain + cost).
-/
theorem expectedNet_nonnegative_iff
    (precision gain cost : ℚ)
    (hden : 0 < gain + cost) :
    expectedNet precision gain cost ≥ 0 ↔
      cost / (gain + cost) ≤ precision := by
  unfold expectedNet
  rw [div_le_iff₀ hden]
  constructor <;> intro h <;> nlinarith

/-
Published summary inputs from arXiv:2609.36855v1:
BIRD: 92 upstream-wrong items among 150; removal gain +10.9 pp on that
conditional subset; unconditional removal effect -1.3 pp.
L2W: 16 upstream-wrong items among 120; conditional gain +1.7 pp;
unconditional removal effect -21.8 pp.

The implied cost on upstream-correct items is recovered by the two-group
mixture identity. Because the reported effects are rounded to 0.1 pp, the
reconstructed costs and thresholds are approximate.
-/

def birdWrongShare : ℚ := 92 / 150
def birdWrongRemovalGain : ℚ := 109 / 10
def birdAllItemsRemovalNet : ℚ := -(13 / 10)
def birdCorrectRemovalCost : ℚ :=
  -((birdAllItemsRemovalNet -
      birdWrongShare * birdWrongRemovalGain) /
      (1 - birdWrongShare))
def birdBreakEvenPrecision : ℚ :=
  birdCorrectRemovalCost /
    (birdWrongRemovalGain + birdCorrectRemovalCost)

def l2wWrongShare : ℚ := 16 / 120
def l2wWrongRemovalGain : ℚ := 17 / 10
def l2wAllItemsRemovalNet : ℚ := -(218 / 10)
def l2wCorrectRemovalCost : ℚ :=
  -((l2wAllItemsRemovalNet -
      l2wWrongShare * l2wWrongRemovalGain) /
      (1 - l2wWrongShare))
def l2wBreakEvenPrecision : ℚ :=
  l2wCorrectRemovalCost /
    (l2wWrongRemovalGain + l2wCorrectRemovalCost)

theorem bird_threshold_from_rounded_summary :
    birdBreakEvenPrecision = 5989 / 9150 := by
  norm_num [birdBreakEvenPrecision, birdCorrectRemovalCost,
    birdAllItemsRemovalNet, birdWrongShare, birdWrongRemovalGain]

theorem l2w_threshold_from_rounded_summary :
    l2wBreakEvenPrecision = 3304 / 3525 := by
  norm_num [l2wBreakEvenPrecision, l2wCorrectRemovalCost,
    l2wAllItemsRemovalNet, l2wWrongShare, l2wWrongRemovalGain]

/-- Executable outputs: exact rational reconstructions from rounded inputs. -/
#eval (birdBreakEvenPrecision, l2wBreakEvenPrecision)
#eval (100 * birdBreakEvenPrecision, 100 * l2wBreakEvenPrecision)
#eval (expectedNet birdBreakEvenPrecision birdWrongRemovalGain
        birdCorrectRemovalCost,
       expectedNet l2wBreakEvenPrecision l2wWrongRemovalGain
        l2wCorrectRemovalCost)

#print axioms expectedNet_nonnegative_iff
#print axioms bird_threshold_from_rounded_summary
#print axioms l2w_threshold_from_rounded_summary

end HsHVerification.SelectiveMessageGate
