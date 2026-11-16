import Mathlib

/-!
# PIV count stages and aggregation scope

The Jackson–Thomas article explicitly reports 3,600 captured images and a
3,600-step time dimension for each frequency-filtered velocity field. It
also reports ten runs per condition. The article's rounded array-entry
magnitude is close to a ten-run aggregate, but its sentence does not make
that aggregation scope explicit.

The 2025 thesis separately describes successive-image-pair PIV. The theorem
below formalizes that conditional N frames -> N - 1 adjacent pairs rule; it
does not impose that convention on the 2026 article's stated 3,600 time
indices.

All arithmetic here uses counts reported for the named measured experiment.
It is bookkeeping, not a physical-model calculation or H(s)H prediction.
-/

namespace HsHVerification.EnheduannaPIVCountStage

/-- A count belongs to a processing stage, not merely to a number. -/
inductive CountStage
  | rawImage
  | adjacentImagePair
  | pivVectorField
  | filteredVelocityField
  | spatialPointPair
  | correlationBySeparation
  | dispersionPoint
  deriving DecidableEq, Repr

/-- The same stage can be counted per frame, per run, or across runs. -/
inductive AggregationScope
  | perFrame
  | perRun
  | perCondition
  | acrossRuns
  deriving DecidableEq, Repr

/-- A typed count keeps processing stage and aggregation scope distinct. -/
structure CountWitness where
  stage : CountStage
  scope : AggregationScope
  count : Nat

/-- Complete consecutive pairs formed from a sequence of frames. -/
def adjacentPairs {α : Type*} : List α → List (α × α)
  | [] => []
  | [_] => []
  | x :: y :: rest => (x, y) :: adjacentPairs (y :: rest)

/-- A complete adjacent-pair pass over n frames yields exactly n - 1 pairs. -/
theorem adjacentPairs_length {α : Type*} (frames : List α) :
    (adjacentPairs frames).length = frames.length - 1 := by
  induction frames with
  | nil => simp [adjacentPairs]
  | cons x frames ih =>
      cases frames with
      | nil => simp [adjacentPairs]
      | cons y rest => simp [adjacentPairs, ih]

/-- Article-reported 149 by 239 spatial grid over 3,600 time indices, per run. -/
def perRunArrayEntries : Nat := 149 * 239 * 3600

/-- Conditional ten-run aggregate of the per-run array count. -/
def tenRunAggregateEntries : Nat := 10 * perRunArrayEntries

theorem perRunArrayEntries_exact :
    perRunArrayEntries = 128199600 := by
  norm_num [perRunArrayEntries]

theorem tenRunAggregateEntries_exact :
    tenRunAggregateEntries = 1281996000 := by
  norm_num [tenRunAggregateEntries, perRunArrayEntries]

/-- Difference from the article's rounded 12.8 × 10^8 magnitude if ten
    per-run arrays are aggregated. This is arithmetic, not proof that the
    article intended that aggregation scope. -/
theorem tenRunAggregate_difference_from_rounded_report :
    tenRunAggregateEntries - 1280000000 = 1996000 := by
  norm_num [tenRunAggregateEntries, perRunArrayEntries]

#print axioms adjacentPairs_length
#print axioms perRunArrayEntries_exact
#print axioms tenRunAggregateEntries_exact
#print axioms tenRunAggregate_difference_from_rounded_report

end HsHVerification.EnheduannaPIVCountStage
