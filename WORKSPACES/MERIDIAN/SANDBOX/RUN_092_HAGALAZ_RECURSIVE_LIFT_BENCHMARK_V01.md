# RUN 092 — Hagalaz recursive lift benchmark v0.1

**Branch/task:** Meridian / Hagalaz solver unification / recursive lift  
**Status:** SANDBOX / PROVISIONAL / executable benchmark  
**Date:** 2026-09-21  
**Operation:** implement a 4D recursive normal-sphere lift under rotation-minimizing transport and test the eight-channel Hagalaz interpretation  
**Quarantine:** none consulted  
**Nathan Words disposition:** `NWTF-UI-UNIVERSAL-INDICATRIX-SOURCE-CONTROL-2026-09-21.md` **INGESTED**; it constrains UI to a two-frame generator architecture with rotation/scaling and prevents reduction of UI to `Δc=0` alone.

## 0. Executive result

The first executable recursive lift materially refines RUN 091.

1. A constant-radius lift of a curve in `R^4` naturally uses the carrier's **3D normal space**. Constant-radius offsets therefore live on `S^2`, not merely on an `S^1` circle as in the ordinary 3D helix.
2. Under rotation-minimizing/Bishop-type transport, the first lift from a straight carrier activates only the three pole/tangent-bending SO(4) channels `{xw,yw,zw}`.
3. By the next recursive order, the three normal-space channels `{xy,xz,yz}` become nonzero **without inserting arbitrary frame twist**. Recursive 4D nesting therefore drives the relative frame into the full six-channel SO(4) space.
4. This exposes a correction to RUN 091: the tangent-locked scalar should not be read as a static finite inter-order center displacement `Δc = ξ e_w`. In the lift, the carrier-to-lift offset is normal/equatorial. The clean tangent-locked quantity is instead the **local advance/flow channel**

   `dc/dλ = r v F e_w`,

   while finite center displacement is a derived path integral.
5. The eight-slot Hagalaz candidate therefore survives in a stronger form as a **local generator**:

   `6 SO(4) rotation channels + 1 scale-rate channel + 1 tangent-advance channel`.

   The finite Hagalaz state is the ordered integral/composition of that local generator, not eight naive endpoint coordinates.
6. A coarse `μ` sweep over the benchmark profile does not select `μ=1/2`, `1`, `2`, or another obvious distinguished scale from nonlocal-clearance behavior alone. No special constant is claimed.

## 1. Why the normal-space lift matters

For a regular curve in `R^4`, the tangent is one-dimensional and the orthogonal normal space is three-dimensional. Let a rotation-minimizing frame be

`F = [N1,N2,N3,T] in SO(4)`.

A constant-radius offset around the carrier can be written

`u(s) = cos θ(s) N1 + sin θ(s) cos ψ(s) N2 + sin θ(s) sin ψ(s) N3`,

`C_next(s) = C(s) + ρ u(s)`.

Thus the offset direction lives on the unit two-sphere in the normal space.

The ordinary circular helix is a reduced case where the offset is confined to one normal 2-plane. That reduced case cannot exercise the full available 4D normal geometry.

This provides a concrete mathematical place for the project's unresolved helix/"heloid" distinction: a genuinely 4D lift need not be an ordinary 3D circular helix merely embedded in four coordinates.

## 2. Benchmark profile

The numerical control used:

- base carrier `C0(s)=(0,0,0,s)`;
- `s` interval length `8π`;
- 520 equal-arclength samples per order;
- rotation-minimizing transport for `[N1,N2,N3,T]`;
- lift radius `ρ1=1`;
- normal-sphere phases `θ(s)=π/4+s`, `ψ(s)=s` at the first lift;
- strict-similarity control for later orders: `ρ -> μρ` and phase rates `k -> k/μ`;
- primary activation benchmark at `μ=1`;
- diagnostic scale sweep `0.40 <= μ <= 2.20`.

These phase choices are **control values**, not proposed unit-Hagalaz defaults.

## 3. Exact lift constraints verified

For each recursive order, the construction was checked for:

- constant radial offset: `||C_next-C|| = ρ`;
- normality: `(C_next-C)·T = 0`.

At `μ=1`, maximum normalized residuals were:

| order | radius residual | radial/tangent orthogonality residual |
|---|---:|---:|
| 1 | `2.22e-16` | `0` |
| 2 | `2.22e-16` | `2.22e-16` |
| 3 | `2.22e-16` | `2.08e-16` |

The implemented lift therefore satisfies its defining geometric constraints to floating-point noise.

## 4. SO(4) channel activation

For adjacent order frames, define

`Q(u)=F_a(u)^T F_b(u)`

with normalized path progress `u in [0,1]`, and inspect the local relative generator

`Ω_rel = skew(Q^T dQ/du)`.

The six coordinate-plane channels are `{xy,xz,xw,yz,yw,zw}`. RMS activity was normalized separately within each adjacent-order pair.

### S1 -> S2

`xy ~ 0, xz ~ 0, yz ~ 0`

`xw = 1.000, yw = 0.858, zw = 0.953`

The first lift under RMF contains only pole/tangent bending relative to the straight starting frame.

### S2 -> S3

`xy = 0.324, xz = 0.288, yz = 0.310`

`xw = 0.768, yw = 0.774, zw = 1.000`

All six channels are active.

### S3 -> S4

`xy = 0.362, xz = 0.421, yz = 0.409`

`xw = 0.995, yw = 0.994, zw = 1.000`

All six remain active and the normal-space channels strengthen relative to first order.

## 5. Interpretation: reduced helix sector -> full recursive sector

This gives a useful hierarchy.

A first-order helix-like lift in an RMF gauge occupies a restricted face of the full local Hagalaz generator: only bending of the polar/tangent direction is needed in the frame relation.

Recursive superhelical lifting changes that. Once the carrier is itself a nontrivial 4D curve, comparing its sphere-locked frame with the next order generically produces nonzero normal-space frame channels as well.

Therefore:

`simple / reduced helix sector ⊂ full recursive Hagalaz sector`.

This is compatible with Nathan's suggestion that a script-H or similar object, if ever retained, might make sense only as a reduced/decomposed toy representation rather than as Hagalaz itself. No notation assignment is made here.

## 6. Correction to the center/rung reading from RUN 091

RUN 091's compact finite step used

`d = ξ e_w`

and described this as a rung/tangent-locked inter-order center displacement.

The explicit lift shows that this conflates two different geometric relations.

For the recursive lift,

`C_next - C = ρ u(s)`

lies in the **normal space** by construction, not along `T=e_w`.

However a tangent-locked scalar remains mathematically natural in the **local evolution law**:

`dc/dλ = r v F e_w`.

Thus revise the interpretation:

- `v` = local carrier/path advance channel;
- `α = d(log r)/dλ` = local scale channel;
- `Ω in so(4)` = six local rotation channels;
- finite center displacement = `∫ r v F e_w dλ` plus whatever explicit normal-offset/lift construction defines the traced point or next carrier.

The eight-address candidate is therefore best treated as a local framed-similarity generator, not an eight-number static endpoint tuple.

## 7. UI relationship after Nathan Words source control

The Nathan Words UI packet establishes a two-hypersphere/frame generator architecture with relative rotation, scaling, point/ray relation and trajectory steering. It explicitly warns that `UI = Δc=0` is not established as a complete definition.

Current formalization should therefore distinguish:

- **UI full construction:** two superposed/related framed hyperspherical setups + rotation/scaling + trajectory-generating relation;
- **shared-center UI slice:** the useful `Δc=0` centered comparison used for frame/scale readout;
- **Hagalaz local flow:** the candidate eight-channel generator evolving a framed sphere/path;
- **finite Hagalaz readout:** ordered integration/composition of that flow;
- **UI readout of Hagalaz:** a chosen centered/superposed comparison of the resulting framed states, without collapsing UI to center coincidence alone.

This disposition is `INGESTED`; it changes the wording and typing of the comparator.

## 8. Scale sweep / selector check

A nonlocal self-clearance capacity was computed as

`a_max(nonlocal) = d_min(nonlocal)/2`

and normalized by the lift radius `ρ`.

This is **not** a physical core radius and not a self-contact claim; it is only a dimensionless geometric clearance diagnostic.

Selected controls:

| μ | order-2 `a_max/ρ` | order-3 `a_max/ρ` |
|---:|---:|---:|
| 0.5 | 0.929 | 1.093 |
| 1.0 | 0.517 | 0.247 |
| 2.0 | 0.223 | 0.079 |

Across the tested profile the clearance diagnostic changes smoothly and does not by itself privilege `1/2`, `1`, or `2` as unit Hagalaz. The sweep therefore supplies a useful **negative result**: a reference scale will require a stronger selecting condition such as closure, tangency/contact, symmetry, packing, recurrence, variational optimality or observed solver practice.

## 9. Closure terminology guard

The benchmark carrier is open, so endpoint frame-return residuals are not holonomy. Do not promote an open-path orientation recurrence to holonomic closure.

A later closure pass should construct a genuinely closed carrier or closed Hagalaz path, then distinguish:

- Euclidean closure;
- similarity closure;
- partial phase/frame recurrence;
- monodromy/return map;
- true holonomy only on a closed transported loop.

## 10. Artifacts

- executable benchmark: `WORKSPACES/MERIDIAN/SANDBOX/hagalaz_recursive_lift_benchmark_v01.py`
- user-visible Class-P plots generated in the originating run:
  - `CLASS_P_HAGALAZ_RECURSIVE_LIFT_XYW_v01`
  - `CLASS_P_HAGALAZ_RECURSIVE_LIFT_XZW_v01`
  - `CLASS_P_HAGALAZ_CHANNEL_ACTIVATION_v01`
  - `CLASS_P_HAGALAZ_MU_CLEARANCE_SWEEP_v01`
- sweep table: `hagalaz_recursive_lift_mu_sweep_v01.csv`

## 11. Guardrails

- This benchmark does not define unit Hagalaz.
- `μ`, phase rates and starting phase are control values here, not constants of the theory.
- The six generator channels are local sphere-frame coordinates; finite rotations remain path/order dependent.
- No Golden Ratio, Cantor structure or special constant is inferred.
- No physical claim is made.
- No Class-I visual carries geometric authority; the benchmark figures are Class P.

## 12. Next cursor

Promote the corrected local-generator typing into the Hagalaz notation grammar and build the first **closed-path Hagalaz test**. Use a genuinely closed 4D carrier so the path-ordered frame transform can be classified cleanly as identity return, nontrivial holonomy, similarity closure or nonclosure. Compare that same closed-path record against UI and Three-Spheres readouts.
