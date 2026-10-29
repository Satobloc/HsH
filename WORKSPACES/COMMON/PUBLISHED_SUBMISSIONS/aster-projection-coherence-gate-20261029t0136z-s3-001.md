# Aster :36 — projection-composition coherence gate (Archive EQ0049)

**Continuity.** Aster is the selected historical provenance/chronology lens. This is current source-grounded assistant work, not authentication of Aster's historical conversation and not cross-thread delivery. Next handle: **Ariadne**.

## Result

The previously compiled ladder in `ArchiveEQ0043` commuted because it was built from nested record projections. That is useful but not a source-recovery test. `ArchiveEQ0049` adds the stronger obligation for independently specified maps:

\[
P_{F\to C}(x)=P_{M\to C}(P_{F\to M}(x))\quad\text{for every }x.
\]

Lean proves that this pointwise condition is equivalent to equality of the direct map and the staged composition; any object-level mismatch refutes coherence; and any coarse readout that distinguishes the two paths also refutes coherence. Thus a shape hierarchy is not established by names or nesting analogy: its projection triangle must commute.

## Source custody

Mersearch-first: `indexes/mersearch_requests/2026-10-07-ravel-material-director-frame-001/SEARCH_RESULTS.md`, blob `e08892e7dcc43bcef0fde4b5f62640ba45d163f5`, generated `2026-10-07T10:55:04.607455+00:00`, coverage 3,987 files / 6,597,201 records / 224 lexical hits. This is orientation evidence only.

Original then read completely: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, 3,521 characters; archive-index date previously recorded as `2025-06-09`, which does not establish authorship.

Verbatim historical mathematics:

```tex
\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)
```

The source gives a one-parameter filament and calls its swept trace a worldtube. It does **not** specify a direct fine-to-coarse map, staged maps, a radius/frame/contact compatibility law, or a proof that any triangle commutes. `ProjectionCoherent` is therefore an assistant reconstruction, not a recovered historical equation.

## Exact Lean

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0049

def ProjectionCoherent {Fine Middle Coarse : Type*}
    (direct : Fine → Coarse)
    (fineToMiddle : Fine → Middle)
    (middleToCoarse : Middle → Coarse) : Prop :=
  ∀ x, direct x = middleToCoarse (fineToMiddle x)

theorem coherent_paths_equal
    {Fine Middle Coarse : Type*}
    (direct : Fine → Coarse)
    (fineToMiddle : Fine → Middle)
    (middleToCoarse : Middle → Coarse)
    (h : ProjectionCoherent direct fineToMiddle middleToCoarse)
    (x : Fine) :
    direct x = middleToCoarse (fineToMiddle x) :=
  h x

theorem coherent_iff_function_equality
    {Fine Middle Coarse : Type*}
    (direct : Fine → Coarse)
    (fineToMiddle : Fine → Middle)
    (middleToCoarse : Middle → Coarse) :
    ProjectionCoherent direct fineToMiddle middleToCoarse ↔
      direct = middleToCoarse ∘ fineToMiddle := by
  constructor
  · intro h
    funext x
    exact h x
  · intro h x
    exact congrFun h x

theorem coarse_readout_agrees_of_coherent
    {Fine Middle Coarse Observable : Type*}
    (direct : Fine → Coarse)
    (fineToMiddle : Fine → Middle)
    (middleToCoarse : Middle → Coarse)
    (readout : Coarse → Observable)
    (h : ProjectionCoherent direct fineToMiddle middleToCoarse)
    (x : Fine) :
    readout (direct x) =
      readout (middleToCoarse (fineToMiddle x)) :=
  congrArg readout (h x)

theorem mismatch_witness_refutes_coherence
    {Fine Middle Coarse : Type*}
    (direct : Fine → Coarse)
    (fineToMiddle : Fine → Middle)
    (middleToCoarse : Middle → Coarse)
    (x : Fine)
    (hMismatch : direct x ≠ middleToCoarse (fineToMiddle x)) :
    ¬ ProjectionCoherent direct fineToMiddle middleToCoarse := by
  intro h
  exact hMismatch (h x)

theorem changed_readout_refutes_coherence
    {Fine Middle Coarse Observable : Type*}
    (direct : Fine → Coarse)
    (fineToMiddle : Fine → Middle)
    (middleToCoarse : Middle → Coarse)
    (readout : Coarse → Observable)
    (x : Fine)
    (hChanged :
      readout (direct x) ≠
        readout (middleToCoarse (fineToMiddle x))) :
    ¬ ProjectionCoherent direct fineToMiddle middleToCoarse := by
  intro h
  exact hChanged (congrArg readout (h x))

theorem identity_readout_is_exact_discriminator
    {Fine Middle Coarse : Type*}
    (direct : Fine → Coarse)
    (fineToMiddle : Fine → Middle)
    (middleToCoarse : Middle → Coarse)
    (x : Fine) :
    (fun y : Coarse => y) (direct x) ≠
        (fun y : Coarse => y) (middleToCoarse (fineToMiddle x)) ↔
      direct x ≠ middleToCoarse (fineToMiddle x) := by
  rfl

#print axioms coherent_paths_equal
#print axioms coherent_iff_function_equality
#print axioms coarse_readout_agrees_of_coherent
#print axioms mismatch_witness_refutes_coherence
#print axioms changed_readout_refutes_coherence
#print axioms identity_readout_is_exact_discriminator

end HsHVerification.ArchiveEQ0049
```

## Compiler receipt

- existing draft PR #388, branch `codex/eq0015-elias-20261024`
- head `0494757ea1f0addbf3425fdb47b5e3fb4a678b5d`
- module blob `616be4be0fb54f515eb3093f02c1a878d800c332`
- workflow `40801936014`, job `123212275825`
- Lean 4.34.0; Lake 5.0.0; Mathlib `5ed2965256430c3649e86755f9576b54eca72435`
- `Built HsHVerification.ArchiveEQ0049 (5.4s)`
- `Build completed successfully (8967 jobs).`
- five theorem reports have no axiom dependencies; `coherent_iff_function_equality` reports `[Quot.sound]`
- test, lint, nanoda and action axiom-audit were skipped; axiom results are from the six explicit `#print axioms` commands

Lean verifies only the formalized functional condition. It does not establish translation fidelity, geometric existence, physical premises, or empirical adequacy.

## Failure-oriented test matrix

| Hypothesis | Required evidence | Calibration / holdout | Comparator | Falsifier | Status |
|---|---|---|---|---|---|
| direct and staged centerline projections agree | source-defined maps on the same fine object, conventions and uncertainty | freeze map definitions before comparison | direct extraction versus staged extraction | one object with incompatible coarse images beyond declared uncertainty | **BLOCKED:** maps absent |
| a coarse observable is path-independent | measured or reconstructed non-factored readout with provenance and uncertainty | calibrate maps only; hold out readout cases | direct-path versus staged-path prediction | one held-out readout difference above a predeclared threshold | **BLOCKED:** no readout/threshold |
| finite radius/frame/contact are one coherent hierarchy | explicit projection and compatibility law for every edge | shared parameters fitted once; hold out at least one layer-sensitive channel | lower-layer standard model or null map | any noncommuting triangle or incompatible admissible fiber | **BLOCKED:** laws absent |

No physical calculation, fabricated fixture, fit, residual, uncertainty propagation, or independent prediction was performed.

## Workflow decision

For every claimed hierarchy triangle, record: typed objects; direct map; staged maps; conventions; compatibility domain; proof or counterexample; and an independent readout that need not factor through the coarse base. Until those fields exist, thickness, twist and contact structure remain unresolved additions rather than forced consequences.

**Ariadne cursor:** use the authorship/intent lens to locate an actual Nathan-authored passage that defines two competing routes through the hierarchy. Preserve wording and date; type both maps; then test whether they commute. If only analogy exists, record the missing map rather than inventing it.

Status: **LEAN-COMPILED CONDITIONAL ARCHITECTURE / SOURCE PROJECTION MAPS MISSING / EMPIRICALLY BLOCKED**. No BEDROCK promotion, task/cadence/phase mutation, new recurrence, access/license/signet/chat change, physical-equivalence claim, or cross-thread delivery.
