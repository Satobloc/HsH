# Kestrel source-spine packet: do not conflate two Blockwave actions

**Status:** source-critical continuity packet; **SANDBOXED**; no BEDROCK change; no physical validation; no dataset calculation.

## Identity and scope

Selected specialist lens: **Kestrel** (whole-picture synthesis, preservation, legibility, and forward consequence mapping). This is a source-grounded reconstruction in the current run, not evidence that Kestrel's original ChatGPT thread was accessed or revived. Next handoff: **Meridian**.

## Mersearch-first receipt

All four current bridge lanes were occupied by other requests and were not overwritten. I therefore inspected the completed request-specific three-root receipt and manifest for `2026-10-21-orson-nlm-big-haul-math-001`:

- engine: `Mercer_Searcher_1.0` / pinned `mersearch-stable-1.0`;
- implementation commit: `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`;
- searched snapshots: SAT archive `8394f761d94fb2869266cb5b377a320ab4cfb235`, HsH `0dbd2349abd28cd0941f4a3f898e60b14d8afc5a`, resources `63a28e8ae5467641220a692cb8476694c9664c7d`;
- manifest blob: `0f017d6f557d24c721e417d1fe3c49abf0653991`;
- receipt SHA-256: `ba9b947c4a237b0e4b6da76feedaaacf29e62fb7ed8cf11a4cf6f4cdccae4fe4`;
- 13,897 files / 23,825,506 records scanned, with stated extension, size, policy, PRIOR_ART, and QUARANTINE exclusions.

This broad query is a navigation precedent, not a dedicated Blockwave genealogy search. The primary files below were then read directly. Retrieval date: **2026-10-26 UTC**. Historical document dates and original message authorship remain unresolved unless explicitly stated.

## Source spine A: 3+1 nonrelativistic responsive-medium action

Primary: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/LEAN CHECK_drafts/SATO-BLOCKWAVE_leancheck.txt`, blob `b128efd3004fe34e48dc7da2c39bdd14f9926ddc`, lines 1-90 read. It is Lean-looking text with `sorry` placeholders, not a compiled proof.

Verbatim source math:

```
def L_density (rho v Phi) : ℝ :=
  (1/2) * rho * (v.norm_sq)
  - rho * (W Phi)
  - (kappa/2) * (grad Phi).norm_sq
  + lambda * rho * Phi * (div v)
```

```
(v = grad chi + (lambda / rho) * (grad (rho * Phi)))
```

```
(dt chi + v • (grad chi) = (1/2) * (v.norm_sq) - W Phi + lambda * Phi * (div v))
```

Existing exact audit, not newly rederived here: Ariadne packet blob `96f84b9ab5c1bc1f8693f121f16729471350bc38` confirms the four displayed Euler-Lagrange stationarity equations under smooth fields/boundary assumptions, but rejects the later printed momentum balance. The action-derived replacement is

```
rho Dv = lambda grad(rho D Phi) - kappa (lap Phi) grad Phi
```

and the archive's pressure term is not licensed by the displayed action. The source's own dimensions also leave the interaction term inconsistent when `lambda` is dimensionless and `Phi=L²/T²`; no unique physical repair is established.

**Gate:** historical variational family retained; stationarity equations internally checked; momentum claim corrected; physical medium identification, dimensional typing, persistence, and data correspondence unresolved.

## Source spine B: covariant minimal `u-theta` action

Primary: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE EXTENSION .txt`, blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`, lines 1-130 read.

Verbatim source math:

```
L_core =
  + (1/2) ∇_μ θ ∇^μ θ
  - μ^2 cos(3 θ)
  + λ Φ^2
  + α ( P^{μρ} P^{νσ} ∇_μ u_ν ∇_ρ u_σ )
  + β f(θ) (∇_μ u^μ)
  + ξ(x) ( u^μ u_μ + 1 ).
```

with source definitions `Φ := u^μ ∇_μ θ`, `P^μ_ν := g^μ_ν + u^μ u_ν`, and `f(θ):=sin²θ`.

The same file then prints the 1+1 reduction

```
+ α [ - (∂_t ψ)^2 + (∂_x ψ)^2 ]
```

for `u=(cosh ψ,sinh ψ)`.

Existing exact audit, not newly rederived here: Sable packet blob `7063ca1dfd8fd6de2a6724ca8b26673a139d7145` shows that the unchanged projector term instead reduces to

```
α (sinhψ ψ_t + coshψ ψ_x)^2
```

so at `ψ=0` it is `α ψ_x²` and has no `ψ_t` principal kinetic term. That packet also rejects the printed theta-EOM signs, dispersion, and positivity argument. No unique corrected physical action was authorized.

**Gate:** archived covariant proposal retained as a separate historical family; its advertised 1+1 propagating `u` mode and hyperbolicity proof fail algebraically; physical repair unresolved.

## Non-equivalence finding

These are not notation variants of one action:

| Feature | Spine A | Spine B |
|---|---|---|
| Fundamental variables | `rho,v,Phi,chi` | `u,theta,xi` plus metric |
| Regime printed by source | 3+1 nonrelativistic | covariant 4D, then 1+1 |
| Constraint role | `chi` enforces continuity | `xi` enforces `u²=-1` |
| Main verified content | four stationarity equations | only source definition survives; reduction claims fail |
| Current epistemic use | historical responsive-medium candidate | historical alternative / negative audit |

Therefore “SAT.O/Blockwave” is a genealogy label spanning materially different constructions. Neither may silently stand in for the other, and neither is thereby the current H(s)H worldtube dynamics.

## Three-paper routing

- **Nov 30 major paper:** include this as a provenance split before selecting any historical equation. Spine A may appear only as a historical responsive-medium candidate after a real measured system/dataset is named and the dimensional branch is fixed. Spine B belongs in a correction/negative-results subsection unless a new, independently reviewed action is explicitly proposed.
- **Dec 14 full-theory paper:** use the split to prevent a historical `u-theta` action or Clebsch medium from being smuggled into the Minkowski worldtube reconstruction. Both remain subordinate historical branches.
- **Nov 9 LLM-cognition paper:** no direct scientific dependency; the archival conflation problem is at most a methodology example and should not displace Orson's cognition remit.

## Deliberate lateral reading

Read `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT Mark V/TheTANGLE.txt`, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 1-220 of 2,261 (full-file metadata: 118,030 characters). The flash-fiction dialogue repeatedly distinguishes artifact text, editorial interpolation, later commentary, and authorial correction. Honest methodological takeaway: archive synthesis should preserve those layers rather than turn the most elaborate later interpretation into source fact. That is directly relevant here: “Blockwave” is the wrapper label; the equations and their source layers remain distinct.

## Exact next discriminator / Meridian handoff

1. Build a one-page typed genealogy with separate nodes for the 3+1 `rho-v-Phi-chi` action, the covariant `u-theta` action, and the later `g,u,theta,J` “one-action” file (`🧱BLOCKWAVE.txt`, blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`).
2. For each edge, require an explicit source statement or a derivation; shared naming is not an edge.
3. Do not calculate a physical observable until a real measured system/dataset, units, uncertainties, fit variables, and held-out prediction are declared.
4. Preserve historical failures rather than labeling them superseded.

**Outcome:** one concrete Kestrel source/strategy quantum completed. No physical calculation was attempted, so the real-data permission gate was not bypassed. No BEDROCK promotion and no protected signet.
