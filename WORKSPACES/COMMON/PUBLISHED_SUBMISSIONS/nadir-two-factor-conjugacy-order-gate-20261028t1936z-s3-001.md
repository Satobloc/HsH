# Nadir Voss — two-factor holonomy order gate

Status: FORMALIZATION_COMPILED; empirical status UNTESTED; no physical prediction claimed.

## Provenance and source-critical boundary

- Historical source read in full: `SAT_THEORY_ARCHIVE_2023-25/Donut canon.txt`, blob `be985c292bfcae7352983d596c38e7f172f6029d`.
- Verbatim equations preserved from that source:
  - `A ∈ Ω^1(M, so(3))`
  - `F=dA+A∧A≠0`
  - `H_R = P exp(∫_R A)`
  - `H_Q = P exp(∫_Q A)`
  - `Ω = H_R^{-1} H_Q ∈ SO(3)`
- The source proposes feeding `ξ(Ω)=log Ω` into torus frequencies. That step is not established here.
- The theorem below is an assistant reconstruction in abstract group theory, not a verbatim theorem from the source and not an empirical validation.

## Architecture result

For any group elements `a,b`,

`b*a = a⁻¹*(a*b)*a`.

Therefore every conjugacy-invariant readout `r` satisfies

`r(b*a)=r(a*b)`.

This refutes a too-weak discriminator: two-factor order reversal cannot be detected by trace, eigenangle multiset, or any other conjugacy-class-only observable, even when `a*b ≠ b*a` as group elements.

The minimal escape hatches are explicit:

1. a based/framed readout with a physically fixed frame, plus its gauge-transformation rule; or
2. a loop word such as the commutator `a*b*a⁻¹*b⁻¹`, whose nontriviality certifies noncommutativity.

Neither escape hatch is yet an H(s)H prediction. A physical test still requires an identifiable measured system, an independently specified connection and paths, a frame/gauge protocol, units where applicable, uncertainty propagation, a standard comparator, calibration/holdout separation, and a preregistered rejection threshold.

## Lean 4 / Mathlib artifact

- Existing branch/PR carrier: `codex/eq0015-elias-20261024`, PR #388.
- Module: `FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0048.lean`.
- Module commit: `9b8a3baf1f71b904ea3bd715e3ad1512ad92d14f`.
- Aggregator commit: `486ae55462d3d81ecdc34c42178b015b61a753e2`.
- Workflow: Lean 4 verification run 325, job `123055955645`, SUCCESS.
- Exact relevant log: `Built HsHVerification.ArchiveEQ0048 (6.8s)` and `Build completed successfully (8966 jobs).`
- Environment: Lean `4.34.0`; Lake `5.0.0-src+293d5d0`.
- Each printed theorem reports dependency on Mathlib's accepted `propext` axiom. The separate workflow `axiom-audit` action was disabled/skipped; tests and lint actions were also skipped. This is a successful compile, not an independent proof audit.

Formal propositions encoded:

```lean
theorem reversed_product_is_conjugate {G : Type*} [Group G] (a b : G) :
    b * a = a⁻¹ * (a * b) * a := by
  group

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

theorem nontrivial_commutator_implies_noncommute
    {G : Type*} [Group G] (a b : G)
    (hnontrivial : groupCommutator a b ≠ 1) :
    a * b ≠ b * a := by
  intro hcommute
  exact hnontrivial (commute_implies_commutator_eq_one a b hcommute)
```

Lean proves only these encoded abstract-group implications. It does not prove source fidelity, the soundness of mapping historical notation to the formal variables, the existence of the proposed physical connection, or any empirical SAT/H(s)H claim.

## Independent-failure matrix

| Hypothesis under test | Shared/calibrated inputs | Holdout observable | Standard comparator | Falsification threshold |
|---|---|---|---|---|
| A conjugacy-class-only two-factor readout can identify order | Same measured paths and connection; same reconstruction and uncertainty model | `r(H_Q H_R)` versus `r(H_R H_Q)` on held-out loops | Abstract group identity above | Any claimed generic difference is mathematically false unless the readout or framing violates conjugacy invariance |
| A based/framed SAT/H(s)H transport law predicts order-sensitive data | Connection/path/frame protocol fixed from calibration subset | Predeclared component or frame-relative observable on held-out loops | Standard transport model fit with the same parameters/data | Reject only by preregistered uncertainty-aware residual threshold; none is set yet |
| A nontrivial commutator loop is physically observed | Loop construction and transport reconstruction fixed independently | Conjugacy class of `H_R H_Q H_R⁻¹ H_Q⁻¹` | Standard-model/geometry transport on the same loop | Requires real dataset and uncertainty budget; no such dataset is asserted here |

Outcome: the conjugacy-invariant two-factor order route is CLOSED as a discriminator. The based-frame and commutator-loop routes remain proposals awaiting real measured transport data and independent review.
