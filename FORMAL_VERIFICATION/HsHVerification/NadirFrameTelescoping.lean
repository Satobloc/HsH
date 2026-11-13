import Mathlib

/-!
# Nadir: discrete full-frame transport telescopes

Source context:
* Historical SAT: Satobloc/SAT_THEORY_ARCHIVE_2023-25/Donut canon.txt,
  Git blob be985c292bfcae7352983d596c38e7f172f6029d.
* Nadir sandbox: WORKSPACES/NADIR_VOSS/PLAYGROUND_001_STACKED_HOLONOMY_REPAIR.md,
  Git blob a9e8798df8873e98574ce9271ec05c91892210f5.
* Nadir Oct 26 correction receipt: full ambient moving-frame connection is
  pure gauge, while *projected* tangent/normal connections can have curvature.

This is a formal contract for DISCRETE EXACT FULL-FRAME COMPARISONS in a
single global group, not a proof about a physical connection, measured
transport, worldtube dynamics, or projected-bundle holonomy.
-/

namespace HsHVerification.NadirFrameTelescoping

variable {G : Type*} [Group G]

/-- Exact relative transport between two frames in one globally fixed group. -/
def edge (a b : G) : G := a⁻¹ * b

/-- Ordered composition of successive full-frame comparisons. -/
def chain (start : G) : List G → G
  | [] => 1
  | b :: bs => edge start b * chain b bs

/-- All intermediate frames cancel. Only the endpoints remain. -/
theorem chain_to_terminal (start terminal : G) (intermediate : List G) :
    chain start (intermediate ++ [terminal]) = edge start terminal := by
  induction intermediate generalizing start with
  | nil =>
      simp [chain, edge]
  | cons b bs ih =>
      change edge start b * chain b (bs ++ [terminal]) = edge start terminal
      rw [ih b]
      simp only [edge]
      group

/-- A closed chain of exact full-frame comparisons has trivial product. -/
theorem closed_chain_trivial (start : G) (intermediate : List G) :
    chain start (intermediate ++ [start]) = 1 := by
  rw [chain_to_terminal]
  simp [edge]

/-- A common left-frame change leaves each relative comparison invariant. -/
theorem edge_left_gauge (k a b : G) :
    edge (k * a) (k * b) = edge a b := by
  simp only [edge]
  group

/-- The entire chain is invariant under a common left-frame change. -/
theorem chain_left_gauge (k start : G) (steps : List G) :
    chain (k * start) (steps.map (fun f => k * f)) = chain start steps := by
  induction steps generalizing start with
  | nil =>
      simp [chain]
  | cons b bs ih =>
      simp only [List.map_cons, chain]
      rw [ih b]
      rw [edge_left_gauge]

end HsHVerification.NadirFrameTelescoping
