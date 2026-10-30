# Kestrel synthesis | One carrier, distinct response operators
**Run:** `REVROT3-19-20261011:458:s4` · **Nominal:** 2026-10-30T02:48Z  
**Status:** `SOURCE-RECOVERED / ARCHITECTURE HYPOTHESIS / NO PHYSICAL CALCULATION / NO BEDROCK PROMOTION`

## Finding

**Yes, one source-grounded carrier can in principle support distinct response/readout operators without assigning every response the carrier's entire support.** This is an architecture-level answer, not yet a derived H(s)H mechanism.

The source record supports a filament/worldtube geometry, a timesheet interface, and mutual filament (`f`) / timesheet (`t`) accommodation. It does not yet supply a validated map from the Blockwave two-form worldsheet current to the historical SAT4D vector-current proposal, or a measured electromagnetic support region.

## 1. Source hierarchy

**Nathan Direct — 2026-09-07 Ravel conversation.** Role-tagged raw export `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.09.06•26.09.10•🎼 Ravel [H(s)H] Syncmathcek — raw.json`, Git blob `c49367b0faa424491e7b3520a034b9e44fe6897f`.

- Message `8471543a-6ed1-4743-9073-74735f019da4`, 07:39:26Z: four-dimensional extension of a worldtube with Kerr cross-section.
- Message `3d0ad680-51db-4c79-ad4a-9bbacada24ef`, 07:45:51Z: use a **spatial Kerr section** extended along the filament; the ER mouth opens into the current surface of simultaneity; inside-out alternative left unresolved.
- Message `b9805319-9d77-4b43-874a-5af50c0b6ef7`, 08:05:38Z: `f`- and `t`-distortions are mutual accommodation; **force is the true primitive**.

The assistant's earlier `Σ_Kerr × R` product and detailed core→neck→mouth construction are assistant reconstruction, not Nathan Direct.

**Historical SAT4D source — June 2025.** `SATOBLOC/SAT4D_LIVE_DRAFT.txt`, Git blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`; header attributes it to Nathan McKnight. This is a historical document, not a direct chat utterance. It defines a vector-current candidate:

```text
J_μ(x) = ⟨Filament Flux and Linking Density⟩_{F(x)}
A_μ(x) = ⟨Phase Gradient Structure⟩_{F(x)}
F_{μν}(x) = ∂_μ A_ν(x) − ∂_ν A_μ(x)
∂^μ F_{μν}(x) = μ₀ ⟨Filament Flux Density⟩_{F(x)}
```

The last line is not well-typed as written: the left side has a free `ν` index, while the displayed right side is scalar. `J_μ` is defined separately but not explicitly used on the right.

**Historical SAT-O directive — July 2025.** `SAT O Core Modules/SAT.O Official Directives.txt`, Git blob `167136310cdf33ca8f986f33634692314c1a0946`. It requires mass, charge, curvature and interaction to emerge from filament geometry and intersection with the propagating 3D wavefront `Σ_t`; it does not define an electromagnetic four-current or response map.

**Assistant/NotebookLM Blockwave material.** The local Library copy `🧱BLOCKWAVE.txt` is 25,255 bytes / 384 lines, SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`; Library copy created 2026-10-06, earliest located conversation reference 2025-09-15, original creation date/author unresolved. A line-ending duplicate `Pasted text (12).txt` has SHA-256 `d06c78e4b2445f9089c5ec46ab8b773a040920b50bb7205f22d590a639b522e9` and is not independent.

Public archive corroborants are `SATOBLOC/SATO-BLOCK-INT.txt` (Git blob `2cd00dec3a8464dc303fe96f14ae71d7fcf8f31e`), `SATOBLOC/SATOBLOCK_inputs.txt` (`ee08d8a6f5f187847914442f5971c7e2ed8cecd7`), and `SATOBLOC/SATOBLOCK-LIVE.txt` (`1642375cf78647b9f35f1681d0bccb90685b2a48`). The exact action appears in assistant/NotebookLM-generated material, not a Nathan Direct equation.

## 2. Preserve the old equations; correct separately

The Blockwave material gives:

```text
L_int ⊃ (g_h/2) F_{μν}(θ) J^{μν}
A_μ(θ) ≡ α_* ∇_μ θ
F_{μν}(θ) ≡ ∇_[μ A_{ν]}(θ)
J^{μν} = (1/2) ε^{μνρσ} ∇_ρ B_σ
∇_μ J^{μν} = 0
```

`J^{μν}` is a conserved **two-form worldsheet current**. It is not the SAT4D vector `J_μ`, and neither is automatically an electromagnetic four-current. With `A_μ(θ)=α_*∇_μθ`, `F(θ)=dA(θ)` vanishes on a smooth torsion-free patch (`d²θ=0`). A defect/singularity prescription or independent non-flat connection would be needed for nonzero local curvature. This is a standard differential-form identity, not separately formalized or Lean-run here.

Keep the namespaces distinct:

- `J^{μν}_{ws}`: Blockwave two-form worldsheet current.
- `j^μ_EM`: electromagnetic vector current.
- `F^θ_{μν}`: phase-derived curvature in the old Blockwave proposal.
- `F^{EM}_{μν}`: electromagnetic field strength.

A separately labelled, type-correct **proposal** for the historical SAT4D Maxwell line is:

```text
F^{EM}_{μν} := 2∇_[μ A^{EM}_{ν]}
∇_μ F_{EM}^{μν} = μ₀ j^{ν}_{EM}
∇_ν j^{ν}_{EM} = 0
```

This repairs the free-index mismatch; it does not derive `j^ν_EM` from `J^{μν}_{ws}`. The old Blockwave action also uses `√−g` and `u^μu_μ=−1`, so it cannot be imported unchanged into current HsH native positive-Euclidean 4-space without an explicit induced-metric map.

## 3. Candidate carrier/readout map

Let `C` be the common carrier and `U_s ⊆ supp(C)` the support selected by sector `s`. A useful **proposal** is:

```text
R_s = O_s ∘ K_s ∘ ι_{U_s}
```

`ι` restricts the carrier to a sector's support, `K_s` is the source-derived response/coupling map, and `O_s` is the observable readout. `R_geom` may depend on the full worldtube; `R_EM` may be wavefront-local, intersection-local, or have a separately derived memory extension. No equality `U_EM = supp(C)` is required or established.

A natural **candidate**, not a source-asserted equation, is:

```text
j^μ_Σ := J^{μν}_{ws} n_ν
```

where `n_ν` is the timesheet normal. This is a possible tensor route to a slice-tangent vector, not yet an electromagnetic current. Its support, charge normalization, conservation law and coupling to `A^{EM}_μ` must be specified. Conservation of `J^{μν}_{ws}` alone does not establish conservation of the projected current for an arbitrary evolving foliation.

## 4. Current HsH status and falsification

Live `BEDROCK.md` OC-002 (blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`) keeps the active time-wavefront thickness as the preferred first-pass update region. Whether electromagnetic effects persist ahead of or behind that region remains open. That is exactly why `U_EM` must remain sector-specific rather than being set equal to the whole worldtube.

A test requires one identifiable measured system with independent geometric and electromagnetic observables, primary data, units, calibration, uncertainties and a predeclared map. The same carrier parameters must predict both on held-out data. Failure of the shared parameterization, conservation/gauge covariance, or the predeclared support would count against the mapping.

Morrow report #1068's LEP2 vertex-form-factor bound is not a static positive charge-density RMS measurement or a worldtube-support measurement. The cited machine-readable 47-point table was not located. No refit, support conversion or physical calculation was attempted.

## 5. Formal status and external comparators

Existing Kestrel draft PR #873, branch `research/kestrel-original-slice-fidelity-20261028t0900z`, head `7957d4e5a6135c1c9929dcaefaf7077b4bc68183`, remains open and unreviewed. Current merge-ref workflow #40971039093 succeeded: 8,948 build jobs; existing `KestrelProjectedIncidence` theorems compiled with no `sorryAx` in theorem-specific reports. The separate automated axiom-audit stage was skipped. That module proves set-map projection/lifting under injectivity conditions, not the proposed two-form-to-slice-current map.

The new contraction/tangency/conservation theorem was not run: it is a data-free formalization target, and the live BEDROCK rule requires specific Nathan permission for data-free calculation. No such permission or measured-system anchor was present. The target remains open.

Mersearch-first was checked: lanes 1–2 had no verified output receipts; lanes 3–4 had output artifacts but their request records remained `requested`. No lane was overwritten. No local pinned Mersearch checkout, Lean binary or Lake binary was present. Existing Math Hopper, Lean PR infrastructure and Whirligig were inspected; no new tool, branch, service or subscription was created. SciSpace was used for bounded standard-reference comparison.

External comparators only, not HsH evidence: Itin, *Low-dimensional electric charges. Covariant description* (arXiv:1006.1199); Margulies, *Electrodynamics of a Worldsheet of Lightlike Current* (arXiv:1212.5541); Hull, *Monopoles, Dirac Strings and Generalised Symmetries* (arXiv:2411.18741).

## Conclusion

`POSSIBLE / SOURCE-MOTIVATED / NOT DERIVED`.

A shared carrier with distinct sector response maps is the clean architecture for preserving the source hierarchy and the open temporal-support question. The present sources do not justify identifying the Blockwave two-form current with the SAT4D vector current, or either current's support with the entire worldtube. The next step is to source-derive and test the projection/coupling map, not infer it from notation or analogy.
