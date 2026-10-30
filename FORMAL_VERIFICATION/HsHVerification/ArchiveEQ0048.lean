import Mathlib

/-!
# ArchiveEQ0048 — two-factor holonomy order gate

Historical source (read in full):
`Satobloc/SAT_THEORY_ARCHIVE_2023-25/Donut canon.txt`,
blob `be985c292bfcae7352983d596c38e7f172f6029d`.

Verbatim source equations:
- `A ∈ Ω^1(M, so(3))`
- `F=dA+A∧A≠0`
- `H_R = P exp(∫_R A)`
- `H_Q = P exp(∫_Q A)`
- `Ω = H_R^{-1} H_Q ∈ SO(3)`

The source proposes feeding `ξ(Ω)=log Ω` into torus frequencies. This module
does not formalize that empirical/modeling step. It isolates an architecture
constraint for any group-valued transport: reversing two factors produces a
conjugate product. Therefore a conjugacy-invariant readout cannot distinguish
the two orders. Detecting order requires either a physically fixed based/frame
readout, or a nontrivial commutator-loop readout.

This is an assistant reconstruction, not a verbatim historical theorem.
Lean checks only the encoded abstract group statements. It proves no connection,
path, gauge choice, dataset, uncertainty model, or physical SAT/H(s)H claim.
-/

namespace HsHVerification.ArchiveEQ0048

/-- A readout that is unchanged under conjugation. -/
def ConjugacyInvariant {G O : Type*} [Group G] (readout : G → O) : Prop :=
  ∀ g h : G, readout (h⁻¹ * g * h) = readout g

/-- Reversing a two-factor product changes it only by conjugation. -/
theorem reversed_product_is_conjugate {G : Type*} [Group G] (a b : G) :
    b * a = a⁻¹ * (a * b) * a := by
  group

/-- Every conjugacy-invariant readout is blind to two-factor order. -/
theorem conjugacy_invariant_blind_to_two_factor_order
    {G O : Type*} [Group G]
    (readout : G → O)
    (hinv : ConjugacyInvariant readout)
    (a b : G) :
    readout (b * a) = readout (a * b) := by
  calc
    readout (b * a) = readout (a⁻¹ * (a * b) * a) := by
      rw [reversed_product_is_conjugate]
    _ = readout (a * b) := hinv (a * b) a

/-- An observed two-order difference refutes conjugacy invariance of that readout. -/
theorem observed_order_difference_refutes_conjugacy_invariance
    {G O : Type*} [Group G]
    (readout : G → O)
    (a b : G)
    (hdiff : readout (b * a) ≠ readout (a * b)) :
    ¬ ConjugacyInvariant readout := by
  intro hinv
  exact hdiff (conjugacy_invariant_blind_to_two_factor_order readout hinv a b)

/-- Group commutator, used as the minimal loop-word escape from two-factor blindness. -/
def groupCommutator {G : Type*} [Group G] (a b : G) : G :=
  a * b * a⁻¹ * b⁻¹

/-- Commuting factors have a trivial commutator loop. -/
theorem commute_implies_commutator_eq_one
    {G : Type*} [Group G] (a b : G)
    (hcommute : a * b = b * a) :
    groupCommutator a b = 1 := by
  rw [groupCommutator, hcommute]
  group

/-- A nontrivial commutator certifies noncommutativity. -/
theorem nontrivial_commutator_implies_noncommute
    {G : Type*} [Group G] (a b : G)
    (hnontrivial : groupCommutator a b ≠ 1) :
    a * b ≠ b * a := by
  intro hcommute
  exact hnontrivial (commute_implies_commutator_eq_one a b hcommute)

#print axioms reversed_product_is_conjugate
#print axioms conjugacy_invariant_blind_to_two_factor_order
#print axioms observed_order_difference_refutes_conjugacy_invariance
#print axioms commute_implies_commutator_eq_one
#print axioms nontrivial_commutator_implies_noncommute

end HsHVerification.ArchiveEQ0048
