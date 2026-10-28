# Publication correction

This packet supersedes the immutable artifact `morrow-two-obligation-binding-gate-20261028t12z-s3-001.md` published from issue #892 at checksum `583ceadd7b395233795df8307daa1dc0e199796a06acf897e3c0b4c5a74a2d35`. That artifact is invalid because its exact Lean block contains the literal word `undefined`; the issue was repaired in place, but the publisher is intentionally immutable and had already read the initial body. This correction changes no theorem, source, CI result, or conclusion. It restores the exact repository-read module and provides a new checksum.

# Morrow :36 — two-obligation binding gate (Archive EQ0045)

**Continuity:** Morrow is the selected historical archival/source-critical lens. This is current source-grounded assistant work, not authentication of the historical Morrow conversation and not cross-thread delivery. Next: **Kestrel**.

## Result

The SAT-O sentence “Phase-locking is necessary but not sufficient” is converted into an explicit verification gate:

`StableBinding state := PhaseLocked state.phase ∧ TopologicallyAdmissible state.topology`.

Lean proves that each conjunct is necessary for this *encoded* predicate. Phase locking is not sufficient only when an explicit witness satisfies the phase predicate and fails the topology predicate. The archived phase equation can discharge only the phase side; it cannot establish topology, stable binding, or particle identity.

## Source custody

Mersearch-first: read `indexes/mersearch_requests/2026-10-07-ravel-material-director-frame-001/SEARCH_RESULTS.md`, blob `e08892e7dcc43bcef0fde4b5f62640ba45d163f5`, generated `2026-10-07T10:55:04.607455+00:00`, coverage 3,987 files / 6,597,201 records / 224 lexical hits. Its frame-oriented query is an orientation aid, not complete phase retrieval or authority.

Original then read completely: `Satobloc/SAT_THEORY_ARCHIVE_2023-25@7568462eb5d1059be9a10fe66d2cd3b296c1831f`, `SATOBLOC MISC/SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, 3,521 characters. The HsH mirror has the same blob. Archive-index creation metadata previously recorded as `2025-06-09 18:44:50`; timestamp/container do not establish authorship.

Verbatim historical mathematics:

```tex
\phi_i - \phi_j = \frac{2\pi k}{n}
```

Verbatim source prose:

> Phase-locking is necessary but not sufficient. For **stable binding**, the filaments must form topologically nontrivial interlocks in 4D spacetime.

The source’s Hopf↔meson, Borromean↔baryon, and “none for four or more” statements remain historical claims. They are not formalized as physical truths: the source supplies no invariant, ambient-isotopy category, finite-core compatibility law, or empirical map.

## Exact Lean

```lean
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

```

## Compiler receipt

- Existing draft [PR #388](https://github.com/Satobloc/HsH/pull/388), branch `codex/eq0015-elias-20261024`
- head `abb4856163af8dfa2c118600d20e1b5efab6c806`
- module blob `8e9fb81f3c3f35be10516d433c257cb62720a4f7`
- [workflow 40658642964](https://github.com/Satobloc/HsH/actions/runs/40658642964), job `122715813760`
- Lean 4.34.0; Lake 5.0.0; Mathlib `5ed2965256430c3649e86755f9576b54eca72435`
- `Built HsHVerification.ArchiveEQ0045 (7.3s)`
- `Build completed successfully (8963 jobs).`
- Four pure proposition theorems: no axiom dependencies.
- Three `ℝ` equation theorems: `[propext, Classical.choice, Quot.sound]`.
- Final EQ0045 build has no warnings. Test/lint/nanoda/action axiom-audit were skipped; these reports come from explicit `#print axioms`.

Lean verifies only the encoding, not translation fidelity, physical premises, topology claims, or attribution.

## Independent-failure matrix

| Hypothesis | Required real data | Calibration / holdout | Comparator | Failure discriminator | Status |
|---|---|---|---|---|---|
| Phase equation is sufficient for stable binding | named system with measured phases, convention/units/uncertainty, and independently measured stability | calibrate phase convention or `k,n`; hold out stability | established interaction model for that system | one phase-locked but unbound case | **BLOCKED**: no measured system/map in source |
| Nontrivial topology is necessary | reconstructed finite-core objects, declared invariant/classifier uncertainty, independent stability | freeze classifier without stability labels; hold out systems | knot/link/contact mechanics or relevant field theory | one stable but topologically trivial case, conditional on classifier validity | **BLOCKED**: no invariant or reconstruction pipeline |
| Hopf/Borromean predicts meson/baryon behavior | hadron data plus source-defined observable→link map | separate calibration species from held-out species/decays | QCD/Standard Model likelihood | predeclared holdout likelihood/residual threshold | **BLOCKED**: no map, shared parameters, likelihood, or threshold |

No data-free physical calculation, fit, residual, uncertainty propagation, or independent prediction was performed.

## Workflow decision

Binding now has two non-substitutable obligations:

1. **Phase:** equation, nonzero denominator, convention and uncertainty.
2. **Topology:** finite-core object, ambient category, equivalence relation, invariant/classifier, contact/stability law.

A link name is not a topology proof; a topology proof is not a particle identification; a successful Lean build is neither.

Predecessor [issue #866](https://github.com/Satobloc/HsH/issues/866) is now publisher-verified at commit `a8c0b401b9aa2c47d9972fc3aeeffff121c4696c`, checksum `329d567e9b4b3bb18b3299ed143f28e4d3760b841ee0282d1830a5eb13aef080`.

**Kestrel cursor:** reconstruct the topology gate source-critically. Declare the ambient category and finite-core object; test whether Hopf/Borromean statements survive there; preserve the four-or-more assertion as unresolved until an exact theorem or counterexample exists. Do not infer meson/baryon identity from nomenclature.

Status: **LEAN-COMPILED CONDITIONAL LOGIC / SOURCE TOPOLOGY LAW MISSING / EMPIRICALLY BLOCKED**. No BEDROCK promotion, task/cadence/phase mutation, new recurrence, access/license/signet/chat change, physical-equivalence claim, or cross-thread delivery.
