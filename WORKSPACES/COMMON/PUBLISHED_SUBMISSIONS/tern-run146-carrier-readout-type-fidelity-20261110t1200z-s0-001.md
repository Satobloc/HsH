# Run146 carrier/readout source-fidelity addendum

**Run:** `REVROT3-19-20261011:732:s0`  
**Lane:** 00, Nathan Direct geometry fidelity  
**Classification:** source-fidelity review and conditional geometry crosswalk; not theory promotion, physical validation, or a CODATA review.

## Executive finding

A historical assistant-generated sandbox dated 2026-09-27 gives a mathematically coherent conditional construction in which a moving timesheet samples a transversely oscillating carrier and produces a helical readout. Its own status is sandboxed/derivational, not a physical claim. The construction is useful, but the sentence that it “directly supports” the user's guitar-string model is stronger than the recovered primary source warrants.

The key unresolved issue is typing: the 2025 SAT4D source describes a single one-parameter curve in a fixed four-dimensional block, whereas the sandbox uses a carrier family with both a filament parameter and a sheet/time label. That may be a family of curves or a two-dimensional worldsheet. A source-defined map between these objects has not been recovered.

No private HSH_RESOURCES path, raw excerpt, code, or numerical demonstration parameter is reproduced here. The internal sandbox is identified only by title/date.

## Primary-source extraction

### 1. June 2025 SAT4D live draft

The Nathan McKnight byline document `SAT4D_LIVE_DRAFT.txt` (June 2025; blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`) describes a static four-dimensional block, a one-dimensional filament/worldline, and a moving time surface as the readout surface. Its displayed curve is one-parameter:

```text
γ^μ(λ) = (λ, A_x sin(k_x λ + φ_x), A_y sin(k_y λ + φ_y), A_z sin(k_z λ + φ_z)).
```

This is a 1D curve in the 4D carrier. The oscillatory coordinates depend on λ; there is no independent sheet-time parameter in this displayed curve.

### 2. June 2025 SAT-O1 project document

`SAT_O1.tex` carries the SATO.4D Coherence Project byline and June 2025 date (blob `9a07893cf596e190486df17503626327d6023caa`). The source equations include:

```text
γ^μ(λ) : ℝ → ℝ^{3,1}
v^μ = dγ^μ/dλ
cos θ_4(x) = [v^μ u_μ(x)] / [√(v^ν v_ν) √(u^ρ u_ρ)]
S_{μν} = ∇_μ u_ν + ∇_ν u_μ.
```

The document also says that no metric, field, or dynamical law is imposed a priori. That statement is not yet reconciled with the displayed Lorentzian target, index lowering, normalized contraction, and covariant derivative.

### 3. July 3, 2026 first-person synthesis

`SAT ALL TOGETHER SYNTHESIS.txt` (blob `86cf006ca5ebf58263552c7515a9c9d575caae37`; date 2026-07-03 in the document) describes worldline and timesheet as the two primitives and says the worldline curve should oscillate/helical. This is a first-person source document, not a raw role-authenticated conversation export. It supports the descriptive motif, not a unique parameterization or dynamical law.

### 4. October 2026 raw user-role messages

The `Meridian Free Build` raw export (conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`; blob `7af1561b321f4d9364da5eb111df689efc652827`) contains these relevant user-role messages on its current ancestry:

- `6f00a97a-aa84-45bf-9429-4ff70736014a`, 2026-10-09T01:13:43.652Z: one helical core is distinguished from a larger hollow coil; no second-order core is asserted.
- `3c657387-b80b-4982-a61a-8e6d8568b8d1`, 2026-10-09T01:50:55.112Z: at the classical limit, filaments are treated as stationary; particle motion is attributed to filament topology. The same turn allows internal degrees of freedom in the block-universe picture.
- `59c5c4c6-c914-48d4-af4c-5f53a1698f37`, 2026-10-10T03:15:17.286Z: worldlines are not to be pictured as physically wrapping around something; the core/worldtube and its outer shell are distinct tentative structures.
- `302b4f69-6101-4a82-9b57-d4cf36a3e583`, 2026-10-20T19:22:23.866Z: a thread rotating in four-space is described as oscillating, returning to the guitar-string model.

These statements need not be contradictory: “stationary at the classical limit” and “internal four-dimensional oscillation” may refer to different descriptive levels. The missing piece is the typed relation between them.

The `Minkowski Ring Analysis` raw export (conversation `6ad7e9c0-e8a0-83ea-b76f-6805ece3ee9f`; blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`) contains mixed-source message `090f5160-1020-486d-9c42-df3d7dff2063`; only its final direct correction is attributable to the user. That correction retires the earlier reciprocal filament/timesheet-deformation model as current after Klein Fabric became common. The raw export's `create_time` is 2026-10-21T00:17:23.235Z. A later comment on issue #1559 claims 14:23:11Z. This timestamp conflict is unresolved; preserve both records and cite the message UUID/ancestry rather than selecting one timestamp.

## Historical assistant reconstruction under review

The 2026-09-27 assistant-generated Run146 sandbox uses a two-parameter carrier family, schematically `Γ(s,τ)`, together with a family of timesheets `Σ_τ`. It selects a point from each fixed-τ carrier section by a sheet-intersection condition and obtains a helical readout. Its phase relation is conditional on the ansatz and its chosen sheet motion. The extra independent phase/frequency and the synchronization rule are assistant-added model structure; they are not equations recovered from the direct user messages above.

The sandbox itself makes useful distinctions later in its text: a one-parameter closed trace is not generally a complete two-parameter worldsheet, and a strong string-theory identity would require an actual worldsheet and additional constraints. Those caveats should be retained. The overstatement is treating the particular ansatz as direct support for the user's model rather than as one candidate reconstruction.

## Mapping diagram

```text
SAT4D / SAT-O1 source:
  γ¹ : Λ → M⁴
        │ intersection with Σ³_t
        ▼
  p⁰(t) = γ(λ*(t))

Run146 assistant reconstruction:
  Γ² : S × T → M⁴
        │ fixed-τ section Γ_τ¹(s) = Γ(s,τ)
        │ intersection with Σ³_τ
        ▼
  p⁰(τ) = Γ(s*(τ),τ)
        │ trace over τ
        ▼
  one-parameter readout curve
```

For transverse submanifolds in a four-dimensional ambient space, the conditional dimension counts are:

| Carrier | Timesheet | Generic transverse intersection |
|---|---|---:|
| 1D curve | 3D hypersurface | 0D point |
| 2D worldsheet | 3D hypersurface | 1D curve |
| 4D support region | 3D hypersurface | 3D section |

The Run146 point readout is coherent if it is understood as the intersection of a fixed-τ 1D section with the corresponding sheet, followed by a trace over τ. It is not the same operation as intersecting the full 2D carrier image with one fixed 3D hypersurface.

## Glossary

| Term | Stable working meaning | Missing condition or map |
|---|---|---|
| `γ¹(λ)` | Single 1D filament/worldline | Embedding, parameter convention, metric/signature |
| `Γ²(s,τ)` | Two-parameter carrier family or worldsheet-like map | Whether τ is a physical/internal coordinate or an external slice label |
| `Σ³_t` | Three-dimensional timesheet/hypersurface | Embedding, normal, foliation and regularity |
| `s*(τ)` | Selected intersection parameter | Existence, uniqueness and transversality of the root |
| `p(τ)` | Point readout traced over τ | Explicit synchronized section map |
| `W⁴_core` | Finite-core worldtube/support | Thickening map from a centerline or worldsheet |
| `q`, `w`, `λ`, `τ` | Distinct coordinate/parameter symbols | Units and projection/composition maps; do not identify by analogy |
| `θ_4`, `θ` | SAT-O1 alignment diagnostic and Blockwave compact phase | They are not interchangeable |

## Discrepancy ledger

1. **Carrier dimension:** SAT4D/SAT-O1 display a one-parameter curve; Run146 uses a two-parameter family. No source-defined map from `γ¹` to `Γ²` was recovered.
2. **Intersection type:** a full 2D carrier and a fixed 3D timesheet generically meet in a 1D curve. A point requires a fixed-τ section or an additional selection/readout map.
3. **Parameter semantics:** Run146 uses τ both to index the carrier family and the moving sheet. The direct source does not specify whether this is internal structure, physical evolution, or only a foliation label.
4. **Added frequency:** the Run146 wave frequency and synchronization law are assistant reconstruction, not direct equations from the recovered source.
5. **Static-block relation:** the June 2025 SAT4D draft says the block is static and the time surface moves. Run146 adds τ-dependence to the carrier. This may be a later extension, but the extension map is absent.
6. **Versioning:** the October 9 stationary-filament/topological-motion statement and October 20 guitar-string oscillation statement should be kept as distinct source surfaces, not flattened into one claim.
7. **Current-model status:** the October 21 direct correction retires the older reciprocal deformation model after Klein Fabric became common. Run146 predates that correction and remains historical assistant sandbox material, not current H(s)H authority.
8. **2024-to-2026 relation:** the 2024 moving-plane/helix construction places the helix on the carrier and the circle on the slice readout; Run146 places transverse oscillation on the carrier and a helix on the readout. They are related slicing patterns, not an established equivalence.
9. **SAT-O1 prerequisites:** index lowering and covariant differentiation require specified metric/duality and connection; the normalized contraction requires causal-type and observer/projection conventions.
10. **Blockwave provenance:** `BLOCKWAVE CLEAN ACTION` (assistant-origin, 2025-10-19T12:29:46.538Z; blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`) prints `A_μ(θ) := α_* ∇_μ θ`, `F_{μν}(θ) := ∇_[μ A_{ν]}(θ)`, and a conserved rank-two `J^{μν}`. `SAT-Blockwave Ideal Model` (unbylined/undated; first extant upload 2026-10-08T02:42:49Z; blob `dd0631bc0b25c951dc5e1d6738280e08487b46b2`) does not include that `J^{μν}`. Keep these artifacts separate.

## Separate mathematical corrections (not edits to originals)

- In a Lorentzian setting, a normalized contraction of two timelike vectors is not automatically an ordinary Euclidean cosine. Specify causal types and an observer/spatial projection, or use the appropriate hyperbolic angle.
- For smooth single-valued θ and a torsion-free connection, the locally exact one-form `A = α_* dθ` has zero local exterior derivative. Nonzero local curvature needs additional structure such as defects, patching, or a different connection. This is a conditional mathematical correction, not a replacement source equation.
- The rank-two Blockwave current is not automatically a current for a one-dimensional filament. Its support and representation map must be specified.
- The Blockwave phase θ is not SAT-O1 θ₄.

## Existing Lean evidence and limits

- Existing `NadirHelixSliceGeometry.lean` was built in PR #1455's merge-reference run #42390677035, job #128457402086; the log reports the module built in the successful 8,945-target Lake build. It formalizes conditional affine line/hyperplane intersection and circular-helix slice properties, including radial separation independent of pitch. The module is on the verification branch, not current main; this is not exact-head/current-main verification.
- Existing `KestrelMovingSlice.lean` was built in PR #873 run #40661145868, job #122724186928, in a successful 8,944-target build. It formalizes a particular tilted-slice ellipse and slope reconstruction. It is a conditional assistant reconstruction, not a source-authored equation; exact-head status is not asserted.
- Local `lean`, `lake`, and `elan` are absent in this runtime. No new Lean module or PR was created. The existing CI runs are actual compilations of their checked-out revisions, not proof of source-translation fidelity or physical truth.

Lean verifies only the formalized propositions under their formal assumptions. It does not establish that the formalization faithfully translates Nathan Direct, that the geometric objects exist physically, or that the physical premises are true.

## Related existing records; no duplicate reconstruction

- HsH #1496: 2024 moving-slice/helix source-fidelity work.
- HsH #1536: worldsheet/kernel source-fidelity work.
- HsH #1554: GR/string-theory orthogonality and worldtube/timesheet bridge.
- HsH #1559: SAT-O1/Blockwave source-locator addendum; its timestamp correction is the conflicting record noted above.
- HsH #191 and #192: later guitar-string/Nambu-Goto assistant explorations.

This addendum is narrower: it compares the September 27 Run146 assistant sandbox to the June 2025 one-parameter source and October 2026 direct user-role messages. It does not repeat the earlier moving-slice derivation, endorse Nambu-Goto, or promote a string-theory equivalence.

## Mersearch and tooling disposition

The pinned three-repository Mersearch bridge was checked first. All four active request inputs remain occupied/requested; no request-scoped manifest/receipt was available for this geometry query. Lane 1's active legacy input is `MERSEARCH_REQUEST.json` (`calder-angle-geometry-source-fidelity-20261102-1337`); the separate `MERSEARCH_REQUEST_LANE_1.json` is not the live bridge input. No lane was overwritten and no Mersearch run is claimed. Bounded direct raw-source retrieval was used as a disclosed fallback.

Existing Math Hopper, Lean PRs, and Whirligig work were checked before considering tooling. SciSpace is already available; no new service, fork, dependency, or paid tool was added. The current connector exposes no fork-list action, so a fresh fork inventory was not completed.

## Next deeper cursor

1. Recover the current Klein Fabric primary source and determine whether the relevant carrier is a 1D core, 2D worldsheet, or 4D support region.
2. Define the map from a 1D worldline to any two-parameter carrier family, or explicitly declare the worldsheet as primary.
3. Define the synchronized section `σ(τ) = (s*(τ),τ)` and conditions for existence, uniqueness, transversality, and smooth dependence of `s*(τ)`.
4. Define the thickening map from centerline to finite-core worldtube and the timesheet readout/projection map.
5. Reconcile q/w/λ/τ roles, units, metric signature, and time-flow/normal conventions.
6. Only after those source-defined maps exist, extend the existing Lean formalization. Do not formalize an invented map.

**Disposition:** source-fidelity addendum only; no CODATA scoring, no physical calculation, no data-free numerical run, no new Lean code, no independent measurement, no paper-gate advancement, no theory promotion, and no BEDROCK edit.