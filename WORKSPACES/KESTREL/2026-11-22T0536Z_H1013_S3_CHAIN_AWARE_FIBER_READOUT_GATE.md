# Kestrel h1013:s3 | Chain-aware fiber separation for geometric readouts

**Status:** new formal integration PR OPEN / DRAFT; exact-head Lean build pending. No physical system, dataset, fit, prediction, independent measurement, or theory promotion.

## Result

A detector/readout chain has three independent admissibility questions:

1. **Structural descent:** does the requested downstream observable factor through the declared projection? Equivalently, is it constant on every fiber of that projection?
2. **Metric/resolution stability:** is the decoder sufficiently stable at the instrument's actual resolution, with compatible metrics and units?
3. **Stagewise error control:** do all stages have explicit local error bounds and compatible Lipschitz bounds, so a finite end-to-end error budget can be propagated?

These questions cannot substitute for one another. An injective map can be too unstable; a stable map can discard a distinction needed by the target; and a formally bounded chain can still be attached to the wrong physical map.

## Chain-aware fiber obstruction

The existing finite-chain contract uses

\[
E_0=0,\qquad E_{k+1}=\epsilon_k+L_kE_k,
\]

with exact expansion

\[
E_n=\sum_{j=0}^{n-1}\epsilon_j
\prod_{k=j+1}^{n-1}L_k.
\]

Here each \(L_k\) must be a Lipschitz bound between the declared stage metrics, and each \(\epsilon_k\) must be expressed in the output metric of that stage. Unit conversions, domains, admissibility conditions, and calibration cannot be silently omitted.

Let \(p:X_0\to Y\) be an upstream projection, \(g:Y\to X_n\) a deterministic decoder, and \(F_n,\widetilde F_n:X_0\to X_n\) the exact and approximate chains. Assume:

\[
\widetilde F_n=g\circ p
\]

on the admissible inputs, and

\[
d(F_n(x),\widetilde F_n(x))\le E_n.
\]

If two admissible inputs share the same projection value, \(p(x)=p(y)\), then the decoder returns the same approximate output for both. The triangle inequality therefore forces

\[
d(F_n(x),F_n(y))\le 2E_n.
\]

Consequently,

\[
p(x)=p(y)\quad\land\quad
d(F_n(x),F_n(y))>2E_n
\]

is a **no-go witness**: no single deterministic decoder through \(p\) can meet the propagated error budget for both inputs.

This is an architecture/readout obstruction, not an empirical falsification of H(s)H. If the condition is not met, that does not prove the projection adequate; it only means this sufficient no-go test has not fired.

## Formal integration

Created [Kestrel PR #2323](https://github.com/Satobloc/HsH/pull/2323), a draft child of [Ravel PR #2309](https://github.com/Satobloc/HsH/pull/2309). It does not modify Ravel's branch or Nadir's existing fiber-factorization work.

New module: `FORMAL_VERIFICATION/HsHVerification/KestrelChainAwareFiberBound.lean`

New declarations:

- `noProjectionDecoderWithinChainBudget`
- `noProjectionDecoderWithinStagewiseBudget`

The first combines the existing finite-chain bound with the projection-fiber condition. The second states the same obstruction using the explicit stagewise finite sum.

**Verification boundary:** PR #2323 is OPEN / DRAFT / UNMERGED at corrected head `9786113f868d8291d4567948cfced96d2bc50ea3`.

The first Lean 4.34.0 / Mathlib run, [#44991144591](https://github.com/Satobloc/HsH/actions/runs/44991144591), checked out the initial head `3d8556d9100193154bc0440d92f876da32082219`. It built the imported Ravel module and 8,952 other targets, then failed at `KestrelChainAwareFiberBound.lean:108`: the reverse rewrite was applied to the goal rather than to the stagewise-budget hypothesis. The source correction was committed at `9786113f868d8291d4567948cfced96d2bc50ea3` and recorded in [PR comment #7075047689](https://github.com/Satobloc/HsH/pull/2323#issuecomment-7075047689).

The subsequent push triggered only the unrelated conversation-JSON workflow; no new Lean run was exposed. Although the Lean workflow declares `workflow_dispatch`, no manual dispatch action is available through the current connected toolset. The corrected head therefore remains **NOT COMPILED / EXACT-HEAD VERIFICATION PENDING**. No theorem-specific axiom report or successful module artifact is claimed. This runtime also has no local Lean, Lake, or Elan.

Relevant component evidence:

- Kestrel PR #873: exact-head Lean run #44090154878, supporting the existing transverse-intersection dimension gate.
- Nadir PR #1189: exact-head Lean run #44106198466, supporting the existing fiber-constancy/factorization criterion.
- Ravel PR #2309: run #44960570508 succeeded on a merge reference, not a demonstrated exact-head checkout. Its current head is `71f600206d9ce8c784922d675ea8ce8a92d6ef86`.

No review, rebase, merge, or BEDROCK promotion is claimed. Even a successful Lean build would verify only the formalized conditional statement, not the source-to-map translation or physical premises.

## Source-typed geometry boundary

The source objects remain distinct:

| Object | Source meaning | Required map not yet established |
|---|---|---|
| \(\gamma^1\) | SAT-O1 one-parameter filament centerline | Time-evolution/sweep to a two-dimensional worldsheet |
| \(S^2\) / \(J^{\mu\nu}\) | Blockwave filament/worldsheet current | Source-defined map to a finite-core support |
| \(U^4\) | Finite-core worldtube | Normal-fiber profile, embedding, boundary and thickness map |
| \(\Sigma^3\) | Three-dimensional interacting timesheet | Separate instrument projection and acquisition map |
| \(D\) | Detector-level observable space | Calibrated response and feature/readout map |

For transverse intersections in four-dimensional spacetime, the existing dimension gate gives a one-dimensional trace for a two-dimensional worldsheet intersecting a three-dimensional timesheet, but a three-dimensional slice for a four-dimensional worldtube. Those are not interchangeable readouts. A string-like trace from a finite-core worldtube requires an additional declared projection or boundary/centerline map; it does not follow from taking the full four-dimensional support's direct intersection with the timesheet.

The current chain therefore remains incomplete:

\[
\gamma^1\longrightarrow S^2
\longrightarrow U^4
\longrightarrow \Sigma^3\text{-section}
\longrightarrow \Pi
\longrightarrow R_{\rm instrument}
\longrightarrow D.
\]

The first three arrows are not yet source-complete; the instrument projection and response are not calibrated. The \(L_k\), \(\epsilon_k\), metrics, units, and covariance at these stages are **UNKNOWN**, not zero. No numerical \(E_n\) can be reported.

## Original equations and source custody

The original equations were read from their source files and are reproduced here only to preserve source identity. They were not changed by this work.

### SAT-O1 4D

Source: `SATOBLOC/SAT O1 4D.txt` in `Satobloc/SAT_THEORY_ARCHIVE_2023-25`.

- Git blob SHA-1: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`
- SHA-256: `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`
- FileIndex creation: 2025-06-07 08:38:16; last write: 2025-06-09 18:44:50
- First extant Git commit: 2025-10-27T00:40:28Z
- Unbylined historical module; an earlier receipt's conflicting creation date remains unresolved.

Verbatim core equations:

```text
γ^μ(λ) = (λ,
          A_x sin(k_x λ + φ_x),
          A_y sin(k_y λ + φ_y),
          A_z sin(k_z λ + φ_z))

v^μ(λ) = dγ^μ/dλ
S[γ] = ∫ dλ L(γ^μ, v^μ)
L = 1/2 m v^μ v_μ - V_tension(γ)
φ_i - φ_j = 2πk/n
```

The file defines the filament as one-dimensional and calls the worldtube the four-dimensional volume swept by its vibration. The displayed \(\gamma^\mu(\lambda)\) is still only a one-parameter centerline; no finite-core thickening map is supplied by these equations.

### September 16 Blockwave attachment

Source: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt` in `Satobloc/HsH`.

- Git blob SHA-1: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`
- SHA-256: `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`
- Exact UTF-8 length: 25,255 bytes
- Attachment event: 2025-09-16T16:31:26.687Z
- First extant repository commit: 2026-10-08
- The text is assistant-voiced and embedded authorship is unresolved; it is not a Nathan Direct equation.

Verbatim equations:

```text
u^μ u_μ = -1
P^μ{}_ν = δ^μ{}_ν + u^μ u_ν
J^{μν} = 1/2 ε^{μνρσ} ∇_ρ B_σ
∇_μ J^{μν} = 0
A_μ(θ) = α_* ∇_μ θ
F_{μν}(θ) = ∇_[μ A_{ν]}(θ)
```

The attachment describes \(J^{\mu\nu}\) as a conserved two-form filament/worldsheet current, distributional on physical filaments, with a lattice integer-current alternative. The \(\theta\) in \(A_\mu(\theta)\) is the compact phase in this attachment, not the geometric angle \(\theta_4\).

No replacement equation or corrected SAT-O1/Blockwave equation is proposed here. The chain-aware bound above is a separate derived mathematical result.

## Independent test architecture

A future H(s)H comparison must use one common detector-level observable and the same acquisition/calibration model for H(s)H and its standard comparator.

| Required field | Current status |
|---|---|
| Identifiable measured system and raw dataset | Not selected |
| Source-grounded geometry-to-instrument maps | Incomplete |
| Shared nuisance parameters and units | Not instantiated |
| Stagewise metrics, \(L_k\), \(\epsilon_k\), covariance | Unknown |
| Calibration set and frozen parameters | Not available |
| Untouched holdout | Not available |
| Detector-level H(s)H prediction region | Not available |
| Standard-comparator prediction region | Not available |
| Predeclared falsification threshold | Not available |

The operational rule is: do not compute a chain error budget until every stage has a typed map, compatible metric/units, and source-backed bounds; do not claim a distinguishable prediction until both models are frozen on the same detector-level space before holdout access.

P2 remains HOLD. No physical calculation, fit, prediction, falsification threshold, independent measurement, or paper-gate advancement was performed.
