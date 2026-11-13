import Mathlib

/-!
# ArchiveEQ0045 — two-obligation binding gate

Historical source:
`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT O1 4D.txt`,
blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`.

Verbatim source statements preserved for audit:
- `\phi_i - \phi_j = 2\pi k/n`
- "Phase-locking is necessary but not sufficient. For stable binding, the
  filaments must form topologically nontrivial interlocks in 4D spacetime."

This module is an assistant reconstruction of the source's logical gate.
`StableBinding` is deliberately defined as two separate predicates:
phase-locking and topological admissibility. Theorems prove implications of
that encoding and show exactly which witness is required to refute
sufficiency. They do not prove that the encoding is source-faithful, that a
physical interlock exists, or that Hopf/Borromean links represent particles.
-/

namespace HsHVerification.ArchiveEQ0045

structure BindingState (Phase Topology : Type*) where
  phase : Phase
  topology : Topology

def PhaseLockedState
    {Phase Topology : Type*} (PhaseLocked : Phase → Prop) :
    BindingState Phase Topology → Prop :=
  fun state => PhaseLocked state.phase

def TopologicallyAdmissibleState
    {Phase Topology : Type*} (TopologicallyAdmissible : Topology → Prop) :
    BindingState Phase Topology → Prop :=
  fun state => TopologicallyAdmissible state.topology

def StableBinding
    {Phase Topology : Type*}
    (PhaseLocked : Phase → Prop)
    (TopologicallyAdmissible : Topology → Prop) :
    BindingState Phase Topology → Prop :=
  fun state =>
    PhaseLockedState PhaseLocked state ∧
    TopologicallyAdmissibleState TopologicallyAdmissible state

def Necessary {α : Type*} (required conclusion : α → Prop) : Prop :=
  ∀ x, conclusion x → required x

def Sufficient {α : Type*} (premise conclusion : α → Prop) : Prop :=
  ∀ x, premise x → conclusion x

theorem phase_lock_is_necessary_for_encoded_stability
    {Phase Topology : Type*}
    (PhaseLocked : Phase → Prop)
    (TopologicallyAdmissible : Topology → Prop) :
    Necessary
      (PhaseLockedState PhaseLocked)
      (StableBinding PhaseLocked TopologicallyAdmissible) := by
  intro state hstable
  exact hstable.1

theorem topology_is_necessary_for_encoded_stability
    {Phase Topology : Type*}
    (PhaseLocked : Phase → Prop)
    (TopologicallyAdmissible : Topology → Prop) :
    Necessary
      (TopologicallyAdmissibleState TopologicallyAdmissible)
      (StableBinding PhaseLocked TopologicallyAdmissible) := by
  intro state hstable
  exact hstable.2

theorem phase_lock_not_sufficient_of_inadmissible_witness
    {Phase Topology : Type*}
    (PhaseLocked : Phase → Prop)
    (TopologicallyAdmissible : Topology → Prop)
    (witness : BindingState Phase Topology)
    (hphase : PhaseLockedState PhaseLocked witness)
    (htopology : ¬ TopologicallyAdmissibleState
      TopologicallyAdmissible witness) :
    ¬ Sufficient
      (PhaseLockedState PhaseLocked)
      (StableBinding PhaseLocked TopologicallyAdmissible) := by
  intro hsufficient
  exact htopology (hsufficient witness hphase).2

theorem phase_lock_alone_cannot_close_witness
    {Phase Topology : Type*}
    (PhaseLocked : Phase → Prop)
    (TopologicallyAdmissible : Topology → Prop)
    (witness : BindingState Phase Topology)
    (htopology : ¬ TopologicallyAdmissibleState
      TopologicallyAdmissible witness) :
    ¬ StableBinding PhaseLocked TopologicallyAdmissible witness := by
  intro hstable
  exact htopology hstable.2

def ArchivePhaseEquation
    (phi_i phi_j : ℝ) (k n : ℤ) : Prop :=
  n ≠ 0 ∧ phi_i - phi_j = 2 * Real.pi * (k : ℝ) / (n : ℝ)

theorem archive_phase_equation_requires_nonzero_denominator
    (phi_i phi_j : ℝ) (k n : ℤ)
    (hphase : ArchivePhaseEquation phi_i phi_j k n) :
    n ≠ 0 := by
  exact hphase.1

theorem archive_phase_equation_value
    (phi_i phi_j : ℝ) (k n : ℤ)
    (hphase : ArchivePhaseEquation phi_i phi_j k n) :
    phi_i - phi_j = 2 * Real.pi * (k : ℝ) / (n : ℝ) := by
  exact hphase.2

theorem archive_equation_does_not_close_topology_gate
    {Topology : Type*}
    (TopologicallyAdmissible : Topology → Prop)
    (phi_i phi_j : ℝ) (k n : ℤ) (topology : Topology)
    (htopology : ¬ TopologicallyAdmissible topology) :
    ¬ (ArchivePhaseEquation phi_i phi_j k n ∧
      StableBinding
        (fun phase : ℝ × ℝ × ℤ × ℤ =>
          ArchivePhaseEquation phase.1 phase.2.1 phase.2.2.1 phase.2.2.2)
        TopologicallyAdmissible
        ⟨(phi_i, phi_j, k, n), topology⟩) := by
  intro hgate
  exact htopology hgate.2.2

#print axioms phase_lock_is_necessary_for_encoded_stability
#print axioms topology_is_necessary_for_encoded_stability
#print axioms phase_lock_not_sufficient_of_inadmissible_witness
#print axioms phase_lock_alone_cannot_close_witness
#print axioms archive_phase_equation_requires_nonzero_denominator
#print axioms archive_phase_equation_value
#print axioms archive_equation_does_not_close_topology_gate

end HsHVerification.ArchiveEQ0045
