import Mathlib

/-!
# ArchiveEQ0039 — endpoint-factorization versus path-information gate

Historical source:
`DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt`,
blob `f1b7e7a1bbb041b2ad0142aebb75b2bfda29b3e4`,
dated internally 2026-09-26 and read through its complete 13-solver map.
The source is explicitly SANDBOXED reconstruction/integration state. It gives
the candidate relative-transform closure `H20 H12 H01 = e`, while warning that
canonical identification with Nathan's intended Hagalaz is not locked.

This module separates endpoint-derived relative transforms from independent
path transport. It proves group identities only. It does not establish that
Hagalaz edges factor through node states, that any physical path realizes these
types, or that empirical holonomy has been measured.
-/

namespace HsHVerification.ArchiveEQ0039

/-- Relative edge obtained only from endpoint states. -/
def endpointEdge {Vertex G : Type*} [Group G]
    (state : Vertex → G) (i j : Vertex) : G :=
  state j * (state i)⁻¹

/-- Two endpoint-derived edges telescope to the direct endpoint relation. -/
theorem two_step_telescopes
    {Vertex G : Type*} [Group G]
    (state : Vertex → G) (i j k : Vertex) :
    endpointEdge state j k * endpointEdge state i j =
      endpointEdge state i k := by
  simp [endpointEdge]

/-- Endpoint-derived transport cannot distinguish two routes with the same
start and finish. -/
theorem same_endpoints_force_same_transport
    {Vertex G : Type*} [Group G]
    (state : Vertex → G) (i a b j : Vertex) :
    endpointEdge state a j * endpointEdge state i a =
      endpointEdge state b j * endpointEdge state i b := by
  simp [endpointEdge]

/-- Every triangular loop of endpoint-derived edges closes trivially. -/
theorem endpoint_triangle_loop_is_trivial
    {Vertex G : Type*} [Group G]
    (state : Vertex → G) (i j k : Vertex) :
    endpointEdge state k i * endpointEdge state j k *
        endpointEdge state i j = 1 := by
  simp [endpointEdge]

/-- A nontrivial triangular loop is an exact obstruction to representing all
three measured edges as endpoint-state differences. -/
theorem nontrivial_loop_blocks_endpoint_factorization
    {Vertex G : Type*} [Group G]
    (edge : Vertex → Vertex → G) (i j k : Vertex)
    (hloop : edge k i * edge j k * edge i j ≠ 1) :
    ¬ ∃ state : Vertex → G,
        ∀ a b, edge a b = endpointEdge state a b := by
  rintro ⟨state, hfactor⟩
  apply hloop
  have hclosed := endpoint_triangle_loop_is_trivial state i j k
  rw [← hfactor k i, ← hfactor j k, ← hfactor i j] at hclosed
  exact hclosed

/-- Unequal transports along two routes with common endpoints likewise refute
endpoint-only factorization. -/
theorem route_disagreement_blocks_endpoint_factorization
    {Vertex G : Type*} [Group G]
    (edge : Vertex → Vertex → G) (i a b j : Vertex)
    (hroute : edge a j * edge i a ≠ edge b j * edge i b) :
    ¬ ∃ state : Vertex → G,
        ∀ x y, edge x y = endpointEdge state x y := by
  rintro ⟨state, hfactor⟩
  apply hroute
  have hagree := same_endpoints_force_same_transport state i a b j
  rw [← hfactor a j, ← hfactor i a, ← hfactor b j, ← hfactor i b] at hagree
  exact hagree

#print axioms two_step_telescopes
#print axioms same_endpoints_force_same_transport
#print axioms endpoint_triangle_loop_is_trivial
#print axioms nontrivial_loop_blocks_endpoint_factorization
#print axioms route_disagreement_blocks_endpoint_factorization

end HsHVerification.ArchiveEQ0039
