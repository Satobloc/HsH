import Mathlib

/-!
# Sable P1 dyadic-overlap gate

Source-conditioned graph arithmetic for the archived 17-model ConsistencyBench
CGD panel. The original 17 result blobs are pinned in the Sable P1 source report.
For a question with n eligible model outputs, pairwise comparisons form the
edges of K_n. Distinct edges sharing a model-output endpoint are overlapping
observations, not disjoint raw records.

The empirical sample has 1,150 aligned question positions, 300 set clusters,
977 exact question strings, 18,331 eligible model-question records and 137,911
complete-case pair-question edges. The observed variable-n aggregate has
1,950,762 unordered within-question edge-pairs sharing an endpoint out of
8,405,667 total within-question edge-pairs. Those empirical totals are source-
derived inputs, NOT proved by this file.

This file proves only the complete K_17 combinatorial counts. It does not prove
statistical dependence, an effective sample size, a confidence interval, model
independence, evaluator validity, semantic truth, or a causal effect. Inference
must retain question/set clustering and the fixed-model-panel limitation.
-/

namespace HsHVerification.SableP1DyadicOverlapGate

/-- Number of unordered pairs chosen from n vertices. -/
def chooseTwo (n : Nat) : Nat := n * (n - 1) / 2

/-- Edge count of the complete simple graph K_n. -/
def completeGraphEdges (n : Nat) : Nat := chooseTwo n

/-- Unordered pairs of distinct edges in K_n. -/
def allEdgePairs (n : Nat) : Nat := chooseTwo (completeGraphEdges n)

/-- Unordered pairs of edges sharing exactly one endpoint in K_n.
    Each shared endpoint identifies one pair of incident edges. -/
def sharedEndpointEdgePairs (n : Nat) : Nat := n * chooseTwo (n - 1)

/-- Remaining unordered pairs of disjoint edges in K_n. -/
def disjointEdgePairs (n : Nat) : Nat :=
  allEdgePairs n - sharedEndpointEdgePairs n

/-- Number of other edges adjacent to a fixed edge in K_n. -/
def adjacentEdgesPerEdge (n : Nat) : Nat := 2 * (n - 2)

theorem k17_edge_count :
    completeGraphEdges 17 = 136 := by
  norm_num [completeGraphEdges, chooseTwo]

theorem k17_adjacent_edges_per_edge :
    adjacentEdgesPerEdge 17 = 30 := by
  norm_num [adjacentEdgesPerEdge]

theorem k17_shared_endpoint_edge_pairs :
    sharedEndpointEdgePairs 17 = 2040 := by
  norm_num [sharedEndpointEdgePairs, chooseTwo]

theorem k17_all_edge_pairs :
    allEdgePairs 17 = 9180 := by
  norm_num [allEdgePairs, completeGraphEdges, chooseTwo]

theorem k17_disjoint_edge_pairs :
    disjointEdgePairs 17 = 7140 := by
  norm_num [disjointEdgePairs, allEdgePairs, sharedEndpointEdgePairs,
    completeGraphEdges, chooseTwo]

theorem k17_shared_endpoint_fraction :
    (sharedEndpointEdgePairs 17 : ℚ) / allEdgePairs 17 = 2 / 9 := by
  norm_num [sharedEndpointEdgePairs, allEdgePairs, completeGraphEdges,
    chooseTwo]

#print axioms k17_edge_count
#print axioms k17_adjacent_edges_per_edge
#print axioms k17_shared_endpoint_edge_pairs
#print axioms k17_all_edge_pairs
#print axioms k17_disjoint_edge_pairs
#print axioms k17_shared_endpoint_fraction

end HsHVerification.SableP1DyadicOverlapGate
