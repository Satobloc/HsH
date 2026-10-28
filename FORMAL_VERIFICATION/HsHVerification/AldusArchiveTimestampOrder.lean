import Mathlib

/-!
# Archived conversation ancestry and nonmonotone create_time

Source-grounded Review-MIND audit of eleven distinct raw ChatGPT conversation
exports from HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_17, 2026-10-27.
The lists below encode ACTUALLY PARSED message-parent edges, not simulated data.
Original file SHA ledger and reproducible edge-walk are in the paired audit.
Numbers are observations about archived metadata, not physical measurements.

One witnessed parent -> child edge, Mecha Quant MathProof Tasks, raw JSON
blob 1a3c13c8100145c36aef3718bcf98cabb4b04f68:
parent tool 69e15ad9-5b81-40ff-a80a-2c219fed330d
child assistant ae2dd6b4-8a05-4a32-8470-69b81dd84c09
parent create_time 1748584452.509568 seconds; child 1748584441.033688.
Times below are nearest integer milliseconds for robust comparison.

Formalized arithmetic does NOT authenticate export timestamps, explain their
origin, or establish a causal order independent of the parent pointers.
-/

namespace HsHVerification.AldusArchiveTimestampOrder

def edgeCounts : List Nat := [78, 15, 19, 94, 16, 42, 50, 6, 91, 19, 99]
def invertedEdgeCounts : List Nat := [0, 1, 1, 1, 1, 13, 13, 1, 24, 0, 0]
def activeBranchInvertedCounts : List Nat := [0, 1, 1, 1, 1, 13, 13, 1, 23, 0, 0]

theorem source_count_is_eleven : edgeCounts.length = 11 := by decide
theorem observed_edge_count : edgeCounts.sum = 529 := by decide
theorem observed_inversion_count : invertedEdgeCounts.sum = 55 := by decide
theorem active_branch_inversion_count :
    activeBranchInvertedCounts.sum = 54 := by decide

def mechaParentMs : Nat := 1748584452510
def mechaChildMs : Nat := 1748584441034

theorem mecha_child_timestamp_precedes_parent :
    mechaChildMs < mechaParentMs := by decide

theorem mecha_ancestry_not_strictly_time_monotone :
    ¬ (mechaParentMs < mechaChildMs) := by decide

#print axioms source_count_is_eleven
#print axioms observed_edge_count
#print axioms observed_inversion_count
#print axioms active_branch_inversion_count
#print axioms mecha_child_timestamp_precedes_parent
#print axioms mecha_ancestry_not_strictly_time_monotone

end HsHVerification.AldusArchiveTimestampOrder
