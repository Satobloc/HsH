# Hale relay packet — ArchiveEQ0052 parameterization-descent gate

**Status:** assistant reconstruction; Lean-checked conditional mathematics only. This is not recovered historical mathematics, an empirical result, or a promotion of SAT/H(s)H.

## Question and result

Before a parameterized curve or worldsheet can be said to encode a geometric object, the encoding must be well-defined on the declared geometric identity relation. If `q : Param → Shape` forgets allowed reparameterizations (and, depending on the convention, orientation), then `encode : Param → Target` must factor through `q`.

The new gate proves five conditional facts:

1. descent forces equal encodings for representatives in the same `q`-fibre;
2. one same-shape/different-encoding witness refutes descent;
3. downstream readouts preserve descent, so a changed readout on same-shape representatives also refutes the original descent claim;
4. an injective representative-level encoding that descends forces `q` itself to be injective;
5. therefore a genuinely non-injective geometric quotient and an injective representative-level encoding cannot coexist with descent.

This does **not** choose the correct quotient. A SAT/H(s)H construction must still state whether orientation reversal is gauge, physical sign reversal, or excluded, and which regularity/monotonicity class of reparameterizations is allowed.

## Historical-source boundary

Mersearch-first locator read: `indexes/mersearch_requests/2026-10-07-ravel-material-director-frame-001/SEARCH_RESULTS.md`, blob `e08892e7dcc43bcef0fde4b5f62640ba45d163f5`, was inspected as the archive routing record.

SAT-O source blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc` contains the parameterized curve and action:

```text
γ : ℝ → ℝ^{3,1}
γ^μ(λ) = (λ, A_x sin(k_x λ+φ_x), A_y sin(k_y λ+φ_y), A_z sin(k_z λ+φ_z))
v^μ = dγ^μ/dλ
S[γ] = ∫ dλ L(γ^μ, v^μ)
```

The archive index dates this source to 2025-06-09; authorship remains unresolved in the available source record.

Blockwave source `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`, blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, states a distributional two-form worldsheet current `J^{μν}` with `∇_μ J^{μν}=0` and says that `J` encodes actual filament worldsheets. It does not supply a curve/worldsheet-to-current map, an inverse, or a reparameterization/orientation quotient. The formal gate below is therefore a source-critical reconstruction, not a transcription of a historical theorem.

## Exact Lean 4 / Mathlib module

Path: `FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0052.lean`

```lean
import Mathlib

/-!
# Archive Equation 0052: parameterization-descent gate

Source-critical reconstruction, not a recovered historical theorem.

A construction on parameterized representatives can encode a geometric object only
if it is constant on the fibres of the projection to geometric identity.  In a
curve/worldsheet setting, the projection must state the allowed reparameterizations
and orientation convention explicitly.
-/

namespace HsHVerification.ArchiveEQ0052

/-- `encode` descends along `q` when it factors through the proposed
geometric-identity projection. -/
def DescendsAlong {Param Shape Target : Type*}
    (q : Param → Shape) (encode : Param → Target) : Prop :=
  ∃ descended : Shape → Target, ∀ p, encode p = descended (q p)

/-- Descent forces equal encodings for representatives of the same shape. -/
theorem eq_of_same_shape
    {Param Shape Target : Type*}
    {q : Param → Shape} {encode : Param → Target}
    (hdesc : DescendsAlong q encode)
    {p p' : Param} (hshape : q p = q p') :
    encode p = encode p' := by
  rcases hdesc with ⟨descended, hfactor⟩
  rw [hfactor p, hfactor p', hshape]

/-- One same-shape/different-encoding witness refutes descent. -/
theorem witness_blocks_descent
    {Param Shape Target : Type*}
    {q : Param → Shape} {encode : Param → Target}
    {p p' : Param}
    (hshape : q p = q p')
    (hencoding : encode p ≠ encode p') :
    ¬ DescendsAlong q encode := by
  intro hdesc
  exact hencoding (eq_of_same_shape hdesc hshape)

/-- Any downstream readout preserves a valid descent factorization. -/
theorem readout_preserves_descent
    {Param Shape Target Observable : Type*}
    {q : Param → Shape} {encode : Param → Target}
    (hdesc : DescendsAlong q encode)
    (readout : Target → Observable) :
    DescendsAlong q (fun p => readout (encode p)) := by
  rcases hdesc with ⟨descended, hfactor⟩
  refine ⟨fun s => readout (descended s), ?_⟩
  intro p
  exact congrArg readout (hfactor p)

/-- A changed downstream observable on same-shape representatives also refutes
descent of the original encoding. -/
theorem changed_readout_blocks_descent
    {Param Shape Target Observable : Type*}
    {q : Param → Shape} {encode : Param → Target}
    (readout : Target → Observable)
    {p p' : Param}
    (hshape : q p = q p')
    (hchanged : readout (encode p) ≠ readout (encode p')) :
    ¬ DescendsAlong q encode := by
  intro hdesc
  have hreadout :
      readout (encode p) = readout (encode p') :=
    eq_of_same_shape (readout_preserves_descent hdesc readout) hshape
  exact hchanged hreadout

/-- If an injective encoding descends, then the proposed geometric projection
must itself be injective.  Thus an injective representation of representatives
cannot also forget a nontrivial gauge redundancy. -/
theorem quotient_injective_of_encoding_injective
    {Param Shape Target : Type*}
    {q : Param → Shape} {encode : Param → Target}
    (hdesc : DescendsAlong q encode)
    (hencode : Function.Injective encode) :
    Function.Injective q := by
  intro p p' hshape
  exact hencode (eq_of_same_shape hdesc hshape)

/-- Contrapositive architecture gate: a genuinely non-injective quotient and
an injective representative-level encoding cannot satisfy descent together. -/
theorem noninjective_quotient_blocks_injective_encoding_descent
    {Param Shape Target : Type*}
    {q : Param → Shape} {encode : Param → Target}
    (hq : ¬ Function.Injective q)
    (hencode : Function.Injective encode) :
    ¬ DescendsAlong q encode := by
  intro hdesc
  exact hq (quotient_injective_of_encoding_injective hdesc hencode)

#print axioms eq_of_same_shape
#print axioms witness_blocks_descent
#print axioms readout_preserves_descent
#print axioms changed_readout_blocks_descent
#print axioms quotient_injective_of_encoding_injective
#print axioms noninjective_quotient_blocks_injective_encoding_descent

end HsHVerification.ArchiveEQ0052
```

## Verification and discriminator

- Branch: `codex/eq0015-elias-20261024`
- Module commit: `175eb270a3c2e0d065016355ab6ef1c6a956222d`
- Aggregate-import commit: `53e2afb9f463a9e17ac04aa2b5bca38eea558ab2`
- Proof-repair head: `cc783927fe47ca8ff1a4e099ec9e9d7f7c8492e8`
- PR: #388
- Retained failed GitHub Actions run: #40830392926 (Lean run 421). Exact failure: `ArchiveEQ0052.lean:53:6: Tactic rewrite failed: Did not find an occurrence of the pattern encode p`; Lean marked the failed readout theorem and its dependent theorem with `sorryAx`. The repair replaces the tactic with `congrArg readout (hfactor p)`.
- Repair GitHub Actions run: #40831014372, Lean 4 verification run 422 — **SUCCESS**.
- Environment: Lean 4.34.0, Lake 5.0.0; PR merge-test commit `e561500e3673f929b7af80e95fba012308680b33`.
- Exact terminal result: `Build completed successfully (8970 jobs).`
- Axiom audit: each of the six ArchiveEQ0052 theorems “does not depend on any axioms.”

The independent failure test is now concrete: choose two admissible parameterizations (or orientation representatives) with the same declared `Shape`; calculate the proposed target current and at least one declared observable. Any unequal target or observable refutes descent for that quotient. Passing this gate establishes only representation invariance under the encoded hypotheses, not physical validity, completeness, or empirical agreement.

No physical calculation was performed because no measured system/dataset was selected for this pure architecture theorem.
