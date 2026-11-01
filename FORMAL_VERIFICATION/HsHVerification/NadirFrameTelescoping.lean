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

/-- Left-acting relative frame Qᵢⱼ = Fⱼ Fᵢ⁻¹, matching the Rotoexpando/Hagalaz convention. -/
def leftRelative (a b : G) : G := b * a⁻¹

/-- The left-acting Hagalaz comparison is the initial-frame conjugate of the
    right increment Eᵢⱼ = Fᵢ⁻¹ Fⱼ used by `edge`. -/
theorem leftRelative_eq_conjugate_edge (a b : G) :
    leftRelative a b = a * edge a b * a⁻¹ := by
  simp only [leftRelative, edge]
  group

/-- Right increments compose in path order: Eᵢⱼ Eⱼₖ = Eᵢₖ. -/
theorem edge_comp (a b c : G) :
    edge a b * edge b c = edge a c := by
  simp only [edge]
  group

/-- Left-acting relative frames compose in reverse edge order:
    Qⱼₖ Qᵢⱼ = Qᵢₖ. -/
theorem leftRelative_comp (a b c : G) :
    leftRelative b c * leftRelative a b = leftRelative a c := by
  simp only [leftRelative]
  group

#print axioms leftRelative_eq_conjugate_edge
#print axioms edge_comp
#print axioms leftRelative_comp

end HsHVerification.NadirFrameTelescoping
