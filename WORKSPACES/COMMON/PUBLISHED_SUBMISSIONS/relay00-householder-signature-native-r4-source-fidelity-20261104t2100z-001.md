# Householder signature versus the native R4 construction

**Status:** additive source-fidelity clarification to the existing geometry record, not a new physical result or theory promotion.

## Finding

The archive contains at least two distinct four-dimensional metric layers:

- Nathan Direct's 2026 native convention is `cw=t` with an all-plus `++++` construction metric.
- The assistant-authored Householder proposal uses `g = δ - 2u⊗u` for unit `u` and explicitly records signature `(-,+,+,+)`. It is a Lorentz-signature effective metric/readout proposal, not the native all-plus metric.

These can coexist only as distinct objects with an explicit map between them. No source-defined map has been recovered. Do not silently identify the Householder metric with the native Cruller metric.

## Primary-source boundary

In the raw “Meridian Minkowski Ring Analysis” export (conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`):

- `c5525f53-b7cc-4444-8102-3bf6fdb1c892` (2026-10-21T13:55:40.205Z) states `cw=t` and `++++`; its accompanying expansion-rate expression is tentative.
- `c8ce3474-de6e-4c00-b307-00c7de0724e6` (14:06:39.059Z) says simultaneity is approximate and varies with altitude above mass.
- `59cdedb4-be76-455a-87c8-a6089de951b3` (23:53:03.096Z) directly states: “3D rotation absolutely is 4D curvature. All 3D acceleration is.”

The `59cd...` message follows earlier same-branch worldtube-tension/maximum-bending recollections, so a material-history interpretation is plausible. Its immediate context is an assistant Householder-metric calculation. The only text-bearing assistant descendant is commentary `e26ef2c0-c360-46ee-8444-72f9a34ec044`, which interprets the claim as material-history/worldtube bending rather than necessarily ambient Riemann curvature. No final assistant answer or direct user confirmation follows in that raw branch. That interpretation remains assistant reconstruction, not a source-defined equivalence.

## Historical translations

1. `WORKSPACES/MERIDIAN/SANDBOX_2026-10-05_HOUSEHOLDER_FLOW_CURVATURE.md` computes curvature of the proposed effective metric. It is not curvature of a marked material worldline.
2. `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt` explicitly describes `g = δ - 2u⊗u` as a sandboxed metric-induction translation with signature `(-,+,+,+)`.
3. `WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_ROTATION_AS_WORLDTUBE_CURVATURE_CORRECTION.md` uses a conditional Euclidean lift `X(w)=(R cos(ωw), R sin(ωw), 0, w)` under a fixed affine slicing. This is a valid conditional curve model, but the fixed slicing is an added control assumption, not the source-defined approximate, altitude-dependent simultaneity structure.
4. The 2026-10-22 radial/S3 sandbox uses `s=ln(r/r₀)` as a dimensionless radial label, not physical time, and does not supply global Cruller closure.

## Typed map still missing

```text
Native M⁴, G₊ (++++)
   ├─ material flow / labels (undefined)
   │    └─ worldtube W and marked histories Xₐ(λ)
   │          └─ material-history curvature κW
   └─ approximate, altitude-dependent Σt
        └─ W ∩ Σt
             └─ projection/readout Pt (undefined)
                  └─ observed x(t), aobs

Separate proposed layer:
unit u on M⁴ → geff = G₊ − 2u⊗u, signature (-,+,+,+)
               [native-to-effective map undefined]
```

Keep distinct: material-history curvature `κW`, ambient Riemann curvature `R[G₊]`, effective-metric curvature `R[geff]`, slice extrinsic curvature `K`, moving-frame connection curvature `F`, and readout acceleration `aobs`. Standard Gauss-Codazzi relations can connect slice, ambient, and extrinsic curvature only after the embedding, normal, metric, and sign convention are fixed.

The flattened `KEY CONCEPT - IRI` text contains the phrase “worldtube bending is acceleration,” but its raw role graph has not been recovered. Do not treat that exact sentence as role-authenticated Nathan Direct.

## Formalization and limits

Existing PR #1245 formalizes a conditional Euclidean lifted-curve/helix identity; it does not prove the native Cruller embedding or the Householder-to-native map. No new Lean theorem or CI run was made: the direct proposition is not yet typed, the map is missing, local Lean/Lake/Elan are absent, and the BEDROCK data-free-proof gate remains controlling. No physical calculation, fit, prediction, independent measurement, or CODATA scoring was performed.

**Next cursor:** recover the raw role-authenticated IRI source; define the native material-flow object and altitude-dependent slice family; specify embedding, intersection, projection, and readout maps; only then decide whether a source-faithful Lean target exists.