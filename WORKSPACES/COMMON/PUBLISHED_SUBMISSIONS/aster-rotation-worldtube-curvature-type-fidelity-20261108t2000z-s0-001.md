# Aster source-span addendum: 3D rotation and 4D worldtube curvature

**Date:** 2026-11-08  
**Deterministic lane labels:** Aster → Ariadne (selection is not an authenticated ChatGPT instance/thread)  
**Status:** additive source-fidelity note; no physical calculation, proof of a physical premise, or theory promotion.

This note adds one narrow source-span detail to the existing curvature/Cruller audits in issues #1120 and #1407. It does not repeat their geometry transcription, and it does not reopen the frozen Paper A review.

## 1. Primary source and ancestry

Raw conversation: **“Meridian Minkowski Ring Analysis”**, conversation ID `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, raw-export blob SHA-1 `56a84cb85d5c386efa4ea11d322d11e95e2c7703`.

- Direct user message: `59cdedb4-be76-455a-87c8-a6089de951b3`, created `2026-10-21T23:53:03.096Z`, last updated `2026-10-21T23:58:45.635Z`.
- Its short direct assertion is: “3D rotation absolutely is 4D curvature. All 3D acceleration is.”
- The immediately preceding parent node is a **tool result**, `6c7cbaf9-ab3b-4ac2-a705-ffd8572b6b99`, created `23:52:56.685Z`. It contains a GEN/DERIVED sandbox script for a varying Householder-director metric ansatz `g = δ − 2 u ⊗ u`; its calculation concerns the ambient metric scalar curvature `R[g] = q''`. The script itself labels this as sandbox mathematics, not H(s)H dynamics or a physics claim.
- Immediate assistant reply: `e26ef2c0-c360-46ee-8444-72f9a34ec044`, created `23:53:26.065Z`: “I used ‘curvature’ too narrowly,” then proposes that the intended referent is bending of a physical history/worldtube in four dimensions, not necessarily Riemann curvature of the surrounding metric.
- No subsequent user message appears below that assistant reply in this conversation ancestry. The user message's final recorded update time is later than the assistant reply, so the reply cannot be treated as confirmation of the final saved message version.

## 2. Source-critical result

The direct statement is a raw user-role source message, but it does **not** type either “3D rotation” or “4D curvature.” It supplies no rotating object, frame, parameter, metric, connection, normal bundle, or curvature operator.

The parent tool result computes ambient scalar curvature for a separate metric ansatz. It is not a worldtube/trajectory-curvature calculation. Equating its `R[g]` with the direct user's “4D curvature” would be a category error.

The assistant's immediate repair is a more plausible reading of the intended object: physical-history/worldtube bending rather than ambient Riemann curvature. But it remains assistant-origin and unconfirmed. Preserve it as a candidate interpretation, not as Nathan Direct.

## 3. Adjacent direct-source cluster

These are related but distinct propositions; do not collapse them:

1. **2026-10-09, Meridian Free Build:** direct source associates worldtube curvature with inertia in a classical/Minkowski-limit discussion and uses `w = ct` as a length scale. This is a classical-limit proposition, not a definition of all 4D curvature.
2. **2026-10-20, Meridian Minkowski Ring Analysis:** direct source says the 4D curvature of the rotating donut/Cruller is acceleration, explicitly marking it as a working hypothesis without proof.
3. **2026-10-21, same conversation:** direct source asserts 3D rotation/acceleration as 4D curvature. The assistant's immediate repair suggests worldtube bending, but no user confirmation is present.
4. **2026-10-21, same conversation:** a separate direct correction retires the earlier reciprocal filament/timesheet-deformation description after the Klein Fabric model became common. This does not retire the two structures as distinct/complementary primitives.

The current Primary Operational Guideline (`WORKSPACES/COMMON/NATHAN_DIRECT_2026-11-08_METHODOLOGY_AND_MODEL_OVERVIEW.md`, blob `a8e333b1d5b5aa1d9772366945dd88769d24153c`) is the governing operational overlay: worldline/worldtube is the physical structural primitive, with worldtube preferred where finite spatial extent/internal structure matters; timesheet is complementary; a responsive medium is a provisional third primitive. Their exact types and relations must be specified, not inferred from their names. The guide is an assistant-organized control document, not a verbatim raw transcript.

## 4. Stable glossary for this source span

| Term | Status and meaning |
|---|---|
| `R[g]` | Ambient scalar curvature of the Householder metric ansatz in the parent tool result. Assistant sandbox object. |
| `Ω₃` | Editorial placeholder for a spatial rotation generator/frame. Not a source symbol. |
| `a₃` | Direct-source “3D acceleration”; parameter, observer and frame unspecified. |
| `κ_W` | Editorial placeholder for physical-history/worldtube bending. Candidate referent from the assistant repair, not a source symbol. |
| `W` | Current operational worldline/worldtube primitive; exact dimension and embedding remain open. |
| `Σ` | Current operational timesheet primitive; exact hypersurface/family/readout type remains open. |
| `K` | Klein Fabric/Crullerverse working-hypothesis label; not thereby a defined Klein bottle, torus, or manifold. |
| `Med` | Responsive/reactive medium; provisional third primitive, not an established independent ontology. |

## 5. Mapping diagram

```text
Parent tool calculation:
  g = δ − 2 u ⊗ u  ──Levi-Civita──>  R[g] = q''
  (ambient metric curvature)

Nathan Direct:
  Ω₃ / a₃  ── ? map ? ──>  “4D curvature”
                               |
                               ?  (assistant repair, unconfirmed)
                               v
                              κ_W
                    (worldtube/history bending)

Current operational primitives:
  W (worldline/worldtube)  ── ? relation / composition ? ──  Σ (timesheet)
                                     |
                                     ? 
                                     v
                         Med (provisional responsive medium)

  K (Klein Fabric / Crullerverse) ── ? ──> W, Σ, Med
```

No arrow above is a source-defined projection or composition map. In particular, `R[g]` and `κ_W` must remain distinct until a metric/embedding/connection and an explicit map are supplied.

## 6. Original versus translated propositions

| Source proposition | Historical assistant treatment | Fidelity assessment |
|---|---|---|
| Direct: 3D rotation and 3D acceleration are 4D curvature. | Parent tool result computes `R[g]` for a Householder metric. | Wrong object type if used as the translation. |
| Same direct statement. | Immediate assistant reply retypes curvature as physical-history/worldtube bending. | More plausible, but unconfirmed and not source-authored. |
| Direct: Cruller 4D curvature is acceleration, working hypothesis/no proof. | Assistant-generated S³/twist-coordinate constructions elsewhere in the conversation. | Candidate mathematics only; no source-defined map from Cruller geometry to S³ or to `κ_W`. |
| Direct: worldtube curvature is inertia in the classical limit. | Assistant centerline/coordinate-acceleration formulas. | May be a useful projected calculation, but not an invariant definition of worldtube curvature. |

## 7. Discrepancy ledger

- **D1, high:** ambient metric curvature `R[g]` is not automatically curvature of an embedded worldtube or trajectory.
- **D2, high:** the direct `Ω₃/a₃ → κ_W` relation has no typed map, parameter, frame, metric, or connection.
- **D3, high:** the assistant repair is unconfirmed; its timestamp precedes the direct message's final recorded update.
- **D4, high:** “all 3D acceleration” is universal in wording but has no stated domain or conditions.
- **D5, medium:** the Cruller acceleration hypothesis, the classical worldtube/inertia statement, and the broad 3D-rotation claim are adjacent but not proven to be the same proposition.
- **D6, medium:** the retired reciprocal-deformation model must not be conflated with the current complementary worldtube/timesheet primitive pair.
- **D7, medium:** the current `W`, `Σ`, and provisional `Med` have no source-defined projection/composition maps.

## 8. Typed repair target, kept separate from source equations

A future formalization would need, at minimum, a specified ambient manifold `(𝓜⁴,g,∇)`, an embedding or history map for `W`, a parameter `s`, a chosen spatial frame and rotation generator `Ω₃(s)`, an acceleration object `a₃(s)`, and a declared curvature object (curve curvature, extrinsic curvature of a boundary/worldtube, or ambient Riemann curvature). Only then can a candidate map `F : (Ω₃,a₃) → κ_W` be stated.

For the separate SAT-O1 dimensional mismatch, one possible *generic* completion of a 1D centerline to a finite 4D tube would be:

```text
γ : I → 𝓜⁴
Φ(λ, ξ) = exp_{γ(λ)}(E_λ ξ),    ξ ∈ D³_r ⊂ N_γ
W = im(Φ)
```

Here `N_γ` is the rank-three normal bundle and `E_λ : ℝ³ → N_{γ(λ)}` is a chosen normal-frame injection. This requires a metric/connection, a regular centerline, a normal framing, a radius below the relevant injectivity scale, and conditions preventing unwanted self-overlap. It is a standard tubular-neighborhood proposal, **not** a source-authored SAT-O1 correction. A worldsheet or a lower-dimensional core would require a different domain and different intersection dimensions.

This is a **proposal for typing the claim**, not a corrected Nathan equation. No corrected source equation is authorized by the current evidence.

## 9. Equation custody cross-check

The SAT-O and Blockwave originals remain unchanged and are kept separate from assistant translations. The equations below are copied as source equations, not corrected or endorsed:

- Bylined document-level historical witness `SAT_O REWRITE/SAT 4D/SAT4D_LIVE_DRAFT.txt`, blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`: Nathan McKnight byline, document date June 2025; archive metadata records creation `2025-06-08`, modification `2025-06-09`, and import `2025-10-27` (archive-local timestamps). This is a bylined document, not a raw user-role message. Its verbatim mathematical content, rendered in plain-text notation, is:

```text
γ^μ(λ) = (λ, A_x sin(k_x λ + φ_x), A_y sin(k_y λ + φ_y), A_z sin(k_z λ + φ_z))
v^μ(λ) = dγ^μ/dλ
S[γ] = ∫ dλ L(γ^μ, v^μ)
L = 1/2 m v^μ v_μ − V_tension(γ)
```

The same document calls the filament one-dimensional and the worldtube a 4D volume, but supplies no thickening/sweep map connecting them.
- Unbylined `SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`: archive metadata records creation `2025-06-07`, modification `2025-06-09`, import `2025-10-27`.
- Separate SAT.O1 LaTeX, blob `9a07893cf596e190486df17503626327d6023caa`: prints June 2025 and the author field “SATO.4D Coherence Project”; it introduces `Σ_t` and `θ₄` but no finite-core thickening map.
- `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE EXTENSION .txt`, blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`, and `SAT—Blockwave Ideal Model.txt`, blob `dd0631bc0b25c951dc5e1d6738280e08487b46b2`: separate, unbylined historical documents first visible in HsH commit `6e4415f62616b19ae5cb677984c85d1985834d9d` (`2026-10-08T02:42:49Z`). The extension's Phase-0 core uses `{u^μ, θ}` on a Lorentzian `(-+++)` manifold. Its verbatim core action is:

```text
Φ := u^μ ∇_μ θ
f(θ) := sin²θ
P^μ_ν := g^μ_ν + u^μ u_ν
S_core = ∫ d⁴x √(-g) L_core

L_core =
  + (1/2) ∇_μ θ ∇^μ θ
  - μ² cos(3θ)
  + λ Φ²
  + α (P^{μρ} P^{νσ} ∇_μ u_ν ∇_ρ u_σ)
  + β f(θ) (∇_μ u^μ)
  + ξ(x) (u^μ u_μ + 1)
```

The ideal-model Phase-0 fields are `{g_{μν}, u^μ, θ}`. Neither Phase-0 core contains the explicit `J^{μν}` current.
- `🧱BLOCKWAVE.txt`, blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, is a user-supplied clean-action attachment with unresolved embedded authorship and does contain a `J^{μν}` construction, including `J^{μν} = ½ ε^{μνρσ} ∇_ρ B_σ` and `∇_μ J^{μν} = 0`. The later unified `J` action is an assistant-voice message at `2025-10-19T12:29:46.538Z`, not a Nathan Direct equation.
- The four-sector θ breakdown in `Blockwave Lagrangian formula - user.md`, blob `c4c91886840bb3741b3c37e85fc5016c941f4487`, is a user-pasted/adopted assistant summary, not an independent original equation source.

The full verbatim equation ledger and prior source-fidelity maps remain in `WORKSPACES/ASTER/2026-11-07T1724Z_SAT_O1_BLOCKWAVE_SOURCE_LINEAGE_DELTA.md` (blob `76b1f583ca1b6f686ec08fde966bbc54be983748`) and issue #1445. No original equation was edited, corrected, or promoted here.

## 10. Formalization and limits

- Existing PR #1444 formalizes conditional scalar coordinate-map/midpoint algebra; its Lean 4.34.0/Mathlib merge-reference build #42435344972 succeeded. Exact-head verification remains unverified.
- Existing PR #1133 contains generic set-level pullback/intersection work. Neither PR formalizes the direct rotation-to-worldtube-curvature claim.
- No local Lean/Lake/Elan executable was present. No new Lean module, branch, PR, or CI run was created.
- A Lean proof would check only a typed formal statement. It would not establish that the proposed typing faithfully translates the direct source or that any physical premise is true.
- No counterexample search, observational validation, measured-system calculation, fit, prediction, CODATA scoring, or independent measurement was performed.

## 11. Next deeper cursor

Recover any later direct user definition or confirmation of the assistant's worldtube-bending repair. Then specify the object being rotated, the parameter/frame, the worldtube embedding, the metric/connection, and which curvature operator is intended. Only after those types and maps are source-grounded should a Lean formalization be attempted.

This addendum is additive to issues #1120 and #1407 and to the existing Aster equation-custody report. It is not a Paper A review, paper submission, or theory promotion.
