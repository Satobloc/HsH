import Mathlib

/-!
Loom, 2026-10-29 12:48 UTC. SOURCE-CONDITIONAL arithmetic on recorded
ConsistencyBench CGD model outputs, not a physical SAT/H(s)H claim.

Original public evaluator: aayambansal/ConsistencyBench src/evaluate.py,
Git blob 0453540cb7c19227601e59fb342fa93e736da849.
It sends at most the first 500 Python characters of each raw answer to
the shared NLI checker. Original 17 model JSON blobs are source-locked
in HsH WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py,
Git blob 2e10ed2510b8ce14e716780a887c0fe23c3067b9.

Observed counts:
  19,550 initial responses; 1,216 longer than 500 code points;
  14,450 positions have at least one earlier response;
  1,744 such positions have a long current OR earlier response;
  6,702 flagged positions; 1,060 flagged positions have possible
  truncation exposure; 28,050 ordered prior/current comparison slots;
  3,123 slots have a long endpoint; 849 flagged modus-tollens fourth
  positions, of which 188 have at least one long prior response.

The actual NLI triggering prior index and NLI output are not archived.
Thus 'possible exposure' is NOT a count of actual clipped NLI calls.
Lean checks encoded arithmetic only, not source parsing, NLI truth,
model cognition, causal effects, or source-key validity.
-/

namespace HsHVerification.LoomNLIVisibility

def recordedAnswers : Nat := 19550
def longAnswers : Nat := 1216
def eligibleLaterPositions : Nat := 14450
def possiblyExposedPositions : Nat := 1744
def flaggedLaterPositions : Nat := 6702
def possiblyExposedFlags : Nat := 1060
def candidatePriorPairs : Nat := 28050
def possiblyExposedPairs : Nat := 3123
def flaggedModusTollensFourth : Nat := 849
def fourthPossiblyExposed : Nat := 188

theorem raw_length_partition :
    longAnswers + 18334 = recordedAnswers := by decide

theorem eligible_position_partition :
    possiblyExposedPositions + 12706 = eligibleLaterPositions := by decide

theorem flagged_position_partition :
    possiblyExposedFlags + 5642 = flaggedLaterPositions := by decide

theorem candidate_pair_partition :
    possiblyExposedPairs + 24927 = candidatePriorPairs := by decide

theorem fourth_position_partition :
    fourthPossiblyExposed + 661 = flaggedModusTollensFourth := by decide

theorem exposure_subset_bounds :
    possiblyExposedFlags ≤ possiblyExposedPositions ∧
    possiblyExposedFlags ≤ flaggedLaterPositions ∧
    fourthPossiblyExposed ≤ flaggedModusTollensFourth := by decide

theorem possible_exposure_is_not_every_flag :
    possiblyExposedFlags < flaggedLaterPositions := by decide

#print axioms raw_length_partition
#print axioms eligible_position_partition
#print axioms flagged_position_partition
#print axioms candidate_pair_partition
#print axioms fourth_position_partition
#print axioms exposure_subset_bounds
#print axioms possible_exposure_is_not_every_flag

end HsHVerification.LoomNLIVisibility
