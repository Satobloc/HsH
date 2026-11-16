# Archive h871:s0 | 4D Bishop-frame baseline and H-metric typing

**Status:** additive Lane 00 source-fidelity supplement. This is not a replacement for the existing one-core, carrier/scaffold, Whirligig, or H-baseline audits. It adds a standard moving-frame choice and a stricter type distinction for the proposed ᚼ metric.

**Run key:** `REVROT3-19-20261011:871:s0`  
**Ring label:** Alberr, index 4. **Next ring label:** Mira, index 5. Ring selection is not an authenticated instance identity.

## 1. Scope and non-duplication

The following existing work already covers the direct H statement, six-coordinate assistant candidate, and the distinctions among the H metric, normal-bundle lift, framed-sphere tuple, and Whirligig commutator:

- [H baseline source-fidelity report #1460](https://github.com/Satobloc/HsH/issues/1460)
- [Meridian h839 Whirligig / H metric addendum #1761](https://github.com/Satobloc/HsH/issues/1761)

The carrier-as-coordinate-scaffold and one-core distinctions are already covered by [Aster h768 #1617](https://github.com/Satobloc/HsH/issues/1617) and [Hale h773 #1625](https://github.com/Satobloc/HsH/issues/1625). The current report does not repeat those audits.

The new delta is narrow: **which standard moving frame is appropriate if a one-dimensional curve is used as a coordinate representative of a 4D filament, and what mathematical object ᚼ would have to be in order to be a metric rather than a six-entry state vector.**

## 2. Direct source and epistemic boundary

The primary user-role source is *Meridian Free Build*, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, raw Git blob `7af1561b321f4d9364da5eb111df689efc652827`.

Message `ae5b9fd6-bb6f-4f08-97db-699c3bce0365`, timestamp `2026-10-08T05:00:14.019Z`, says:

- `Δθ × displacement × scale = ᚼ`;
- treat ᚼ as a **metric**, not an object of study;
- use it as a metric of the helix;
- consider an index sphere for each helical order while straightening and reversing the process;
- the target is the geometry of a regular second-order superhelix.

This is a direct descriptive instruction, not a complete mathematical definition. It does not specify the domain of the metric, the type of `×`, the six component meanings, units, weights, positivity, invariance, or the map from an index sphere to ᚼ.

The six-coordinate candidate already recorded in #1460,

\[
p=(\Delta\theta_1,\Delta d_1,\Delta\ln s_1,
   \Delta\theta_2,\Delta d_2,\Delta\ln s_2),
\]

is an **assistant reconstruction**, not a verbatim Nathan Direct definition. It is a plausible chart for two helical orders with angle, displacement, and scale deviations, but the source has not confirmed that chart.

## 3. Standard moving-frame choice in four Euclidean dimensions

For a **regular one-dimensional curve** \(\gamma:I\rightarrow E^4\), the natural baseline is a four-dimensional Bishop / parallel-transport frame

\[
\{T,N_1,N_2,N_3\},
\]

with three normal directions. The normal bundle of a regular 1D curve in \(E^4\) has rank three.

Two useful references are:

1. F. Gökçelik, Z. Bozkurt, İ. Gök, F. N. Ekmekci and Y. Yayli, “Parallel Transport Frame in 4-dimensional Euclidean Space,” *Caspian Journal of Mathematical Sciences* 3(1) (2014), 91–103. [arXiv:1207.2999](https://arxiv.org/abs/1207.2999).
2. S. Nomoto and H. Nozawa, “Generalized Bishop frames of regular curves in \(E^4\),” *Hokkaido Mathematical Journal* 53 (2024), 71–89. [DOI: 10.14492/hokmj/2022-611](https://doi.org/10.14492/hokmj/2022-611); [preprint: arXiv:2201.03022](https://arxiv.org/abs/2201.03022).

Nomoto and Nozawa distinguish four generalized frame types. Their Bishop type exists for every regular curve in \(E^4\); the Frenet-related type requires additional nondegeneracy. For a first mathematical baseline, the generalized Bishop / rotation-minimizing frame is therefore preferable to assuming a nondegenerate Frenet frame.

This is a **coordinate-frame recommendation**, not a physical carrier hypothesis and not a claim that the literature influenced SAT/H(s)H.

### Crucial object-type condition

The Bishop frame applies to a 1D curve in \(E^4\), not automatically to a full-dimensional 4D support \(W^4\subset M^4\). A full-dimensional support has codimension zero and no normal bundle in the ambient 4-manifold.

Therefore one must first establish one of the following:

- the direct “filament” is itself a regular 1D curve in \(E^4\); or
- a 1D coordinate representative \(\gamma\) is obtained from a 4D support by an explicit map \(q:W^4\rightarrow\gamma\), with its intended quotient, section, or gauge status stated.

The existing carrier audit allows a curve as a nonphysical gridline/coordinate scaffold. That permission does not supply \(q\).

The historical two-normal construction can be treated as a selected 2-plane inside the rank-three normal bundle. It must either include the third normal direction or state the geometric constraint that makes the selected 2-plane sufficient. The 3D `geometry_engine.py` has two normal directions because it is a 3D renderer; that is not a complete 4D frame.

If the intended ambient metric is Lorentzian rather than Euclidean, the frame choice must be revisited after the signature and tangent causal type are specified. No Lorentzian frame is selected here.

## 4. What ᚼ would have to mean as a metric

The source says “metric,” while the assistant candidate supplies a six-entry state descriptor. Those are different mathematical types.

A source-compatible **candidate completion**, not a direct equation, is:

- Let \(P\) be the six-parameter shape space associated with two helical orders.
- Let \(p\in P\) be a state descriptor, possibly using the six coordinates above after dimensional normalization.
- Define a positive-definite metric tensor \(G_{AB}(p)\) on \(P\).
- Define the comparison distance from a reference regular-superhelix state \(p_0\) by the metric length or, locally,

\[
d_H(p,p_0)^2
  = (p-p_0)^A\,G_{AB}(p_0)\,(p-p_0)^B.
\]

The zero-reference six-tuple would then describe \(p_0\), not be the metric itself. This construction still needs units, normalization, weights, the exact parameter domain, and invariance conditions.

At minimum, the metric should be invariant under reparameterization of the representative curve and under the residual normal-frame gauge freedom. If a helical 2-plane is selected inside the rank-three normal bundle, the remaining plane-rotation gauge must also be specified.

Two tempting readings should not be silently adopted:

- If ᚼ is intended to be a **generic symmetric metric tensor on the ambient 4D space**, six components are insufficient: a symmetric \(4\times4\) tensor has ten independent components.
- A six-dimensional bivector / \(\mathfrak{so}(4)\) representation is mathematically available, but no direct source maps ᚼ to \(\Lambda^2(E^4)\). It is not adopted as the default interpretation.

The “index sphere” is also not automatically the ᚼ metric. It may be a normalized state space, a frame orbit, or another object. Its map to \(P\) and \(G\) remains undefined.

## 5. Mapping diagram

```text
W⁴: proposed 4D filament/support
          |
          | q: support-to-curve map? (not supplied)
          v
γ : I → E⁴, regular 1D representative
          |
          | generalized Bishop / parallel-transport frame
          v
     (T, N₁, N₂, N₃)
          |
          | select helical 2-plane(s) Π₁, Π₂
          | and define order-specific parameters
          v
p = (θ₁, d₁, ln s₁, θ₂, d₂, ln s₂) ∈ P ≅ R⁶
          |
          | define positive metric G_AB and reference p₀
          v
       d_H(p,p₀)

Index sphere: separate until an explicit map into the frame or
parameter space is supplied.
Timesheet interaction: separate coupling map; not supplied by the
moving frame or by the shape-space metric.
```

## 6. Stable glossary

- **\(W^4\):** the proposed 4D support, if the source intends a full-dimensional worldtube.
- **\(\gamma\):** a regular 1D representative curve in \(E^4\); it is not automatically the physical support.
- **Bishop / parallel-transport frame:** an orthonormal moving frame \(\{T,N_1,N_2,N_3\}\) along a regular curve in \(E^4\).
- **\(\Pi_k\):** a selected 2-plane in the rank-three normal bundle for helical order \(k\), if the model uses one.
- **\(P\):** the proposed six-parameter shape space for two helical orders.
- **\(G_{AB}\):** a candidate metric tensor on \(P\); not yet defined by Nathan Direct.
- **ᚼ / H metric:** Nathan Direct's name for a helix metric; its domain, components, and axioms remain unspecified.
- **Index sphere:** a separate direct-source construct whose map to the frame or shape space is missing.
- **Timesheet:** the interacting 3D hypersurface; its coupling to the filament is not supplied by the moving frame or shape metric.

## 7. Original versus translated propositions

| Proposition | Source status | Translation status |
|---|---|---|
| ᚼ is a metric of the helix, not an object of study. | Nathan Direct, 2026-10-08. | Preserved as intent; mathematical domain and metric tensor remain undefined. |
| There is an index sphere for each helical order during straightening/reversal. | Nathan Direct, 2026-10-08. | No map to the H metric, frame bundle, or six-coordinate chart is established. |
| Six scalar deviations can describe two helical orders. | Not stated verbatim by Nathan. | Assistant candidate from #1460; useful chart, not a metric. |
| A regular 1D curve in \(E^4\) can be equipped with a three-normal Bishop/parallel-transport frame. | Standard differential geometry. | Suitable coordinate scaffold if the source object is a curve or a map to one is defined. |
| The full 4D support has that same rank-three normal frame. | Not established. | Type error if \(W^4\) is full-dimensional in \(M^4\). |

## 8. Discrepancy ledger

1. **Support versus representative curve:** a 4D support and a 1D curve in \(E^4\) are different objects. The support-to-curve map is missing.
2. **Two normals versus three:** the historical two-normal expression selects a 2-plane; a complete \(E^4\) curve frame has three normal directions.
3. **Metric versus state vector:** the six-coordinate candidate is a state descriptor, not a metric tensor or distance.
4. **Metric versus index sphere:** no map identifies the index sphere with the H metric.
5. **Euclidean versus Lorentzian:** the Euclidean Bishop baseline is provisional until the ambient signature and tangent type are fixed.
6. **Gauge and reparameterization:** no invariance contract is supplied for the candidate metric.
7. **Frame versus physical interaction:** a moving frame does not encode the direct claim that the timesheet interacts with the filament/worldtube.

## 9. Formalization status

Existing formal work was reused, not duplicated:

- [Kestrel PR #873](https://github.com/Satobloc/HsH/pull/873) contains `KestrelIntersectionDimensionGate`, `WorldtubeCurveCurvatureLift`, and `WorldtubeInertiaCoordinate`. The relevant successful Actions run #41468951678 was a **merge-reference** build, not an exact-current-head verification. The current PR head remains open/draft/unmerged.
- `KestrelIntersectionDimensionGate` formalizes conditional tangent-space intersection-dimension statements. It does not prove the physical identity of the source objects or supply the missing \(q\), \(\Pi_k\), or \(G_{AB}\).
- The coordinate-inertia theorem is conditional algebra under its stated assumptions; it does not establish a physical inertia/curvature law.
- [Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133) remains open/draft/unmerged; its latest recorded build #43636677645 failed. Its carrier/slice modules are not treated as verified proofs.
- The Lean infrastructure PR #262 remains open/unmerged.

No new Lean module or CI run was appropriate: the domain, support-to-curve map, helical plane selection, metric tensor, and ambient signature are not yet defined. No local Lean/Lake/Elan toolchain is installed in this runtime. The next formalization should begin only after those types and maps are source-grounded. Lean would prove the formalized statements, not the fidelity of their translation or the truth of physical premises.

## 10. Existing-tool and literature check

- Mersearch was not callable in this runtime. All four existing request lanes remain requested; no new request, retry, or overwrite was made. Existing issue #1704 already records the prior runner-cancellation and publication failure, so the unchanged failure was not retriggered.
- Math Hopper issue #578 remains open. PRs #991 and #854 remain open/draft; the extractor is not a proof engine and full three-repository coverage is not verified.
- Existing Whirligig is a 3D Navier–Stokes spectral solver, not a 4D superhelix model.
- The current `geometry_engine.py` is a 3D rendering scaffold, not a physical model.
- SciSpace was available and used for a bounded literature check. No new tool, dependency, fork, paid service, subscription, or CI job was created.
- The 4D frame references above are standard mathematical baselines only. No influence or genealogy claim is made.

## 11. Original SAT-O1 and Blockwave custody

The originals remain unchanged. The full source-custody comparison is preserved in [Mercer h843 source-custody report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERCER/2026-11-15T0300Z_H843_S0_HE3_Q_THETA4_SOURCE_CUSTODY_AND_DUPLICATE_LINEAGE.md).

| Original | Source date | Git blob | SHA-256 |
|---|---|---|---|
| SAT-O1 | 2025-06-09 file-index date | `7577aa1ee5a6c3850ce3b226c75377de6367aedc` | `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937` |
| Blockwave | 2025-09-16 16:31:26.687Z attachment | `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d` | `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664` |

Verbatim SAT-O1 source equations:

```text
γ^μ(λ)=(λ,A_x sin(k_x λ+φ_x),A_y sin(k_y λ+φ_y),A_z sin(k_z λ+φ_z))
v^μ=dγ^μ/dλ
S[γ]=∫dλ L
L=1/2 m v^μ v_μ - V_tension(γ)
```

Verbatim Blockwave source equations:

```text
J^{μν}=1/2 ε^{μνρσ}∇_ρ B_σ
∇_μ J^{μν}=0
```

The separately recorded assistant/curation corrections are not edits to either original:

```text
(dB)_{ρσ}=2∇_[ρ B_{σ]}
J^{μν}=1/2 ε^{μνρσ}(dB)_{ρσ}
     =ε^{μνρσ}∇_ρ B_σ

P^μ{}_ν=δ^μ{}_ν+u^μ u_ν
λ(u^μ u_μ+1)

F_{μν}=2∇_[μ A_{ν]},   A_μ=α_*∇_μθ
```

The corrected \(F\) is locally zero for a smooth scalar potential unless defects or patching are introduced. These are conventional normalization/index repairs and assistant reconstructions, not Nathan Direct equations or physical validation. The older \(V_{\rm tension}\) and Blockwave \(\kappa_2\) stiffness terms are not accepted independent material parameters under the later direct constraint against invented tension/modulus/spring constants. No correction was applied to either original.

## 12. Next deeper cursor

1. Recover the raw source for BEDROCK item `ND-2026-10-18-07` and confirm the \(\ell_f\)/\(\epsilon\) semantics at message level.
2. Decide whether the direct filament is a 1D curve in \(E^4\) or a full 4D support \(W^4\); if the latter, define \(q:W^4\rightarrow\gamma\).
3. Specify the ambient signature and tangent causal type.
4. Define the generalized Bishop frame and any selected helical 2-plane(s), including the third normal direction.
5. Confirm or reject the six-parameter chart; define \(G_{AB}\), its units, positivity, reference state, and gauge/reparameterization invariance.
6. Define the index-sphere map separately from the H metric.
7. Only then formalize the frame, map, and metric axioms in Lean and run exact-head CI.

**No physical calculation, measured-system fit, prediction, independent measurement, CODATA scoring, paper-gate advancement, or BEDROCK theory promotion occurred.**

**Final classification:** `ARCHIVE_H871_S0 / 4D_BISHOP_STANDARD_SELECTED_CONDITIONALLY / H_METRIC_TYPE_UNRESOLVED / SUPPORT_TO_CURVE_MAP_MISSING / EXISTING_LEAN_EVIDENCE_REUSED_WITH_LIMITS / NO_NEW_LEAN_RUN / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_THEORY_PROMOTION`.