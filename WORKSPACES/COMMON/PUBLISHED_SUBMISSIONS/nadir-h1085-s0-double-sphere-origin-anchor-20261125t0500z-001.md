# Lane 00: Early double-sphere connector and origin-anchor map

## Scope

This is an additive source-fidelity note on an early double-sphere coordinate construction. It does not repeat the later R/Q/GrAnn/torus audit in [issue #812](https://github.com/Satobloc/HsH/issues/812) or the broader Rotoexpando crosswalk in [issue #2430](https://github.com/Satobloc/HsH/issues/2430). It recovers an earlier source layer and adds a conditional parameterization of the connector's origin crossing.

## Original source versus later translation

A March 2026 user-role conversation export describes two superimposed inner/outer coordinate spheres, each carrying a curve. A connector/ray joins the curves, intersects both curves and the origin, and is carried around by a rotating vertical plane. The contact points change as the plane sweeps. The spheres are described as coordinate systems, not necessarily physical rolling bodies.

Later R/Q/GrAnn/torus source pages introduce a variable connector, W_obble as its midpoint, W_iggle as a perpendicular plane, a projecting vector, and a toroidal readout. They also propose a tangent transition associated with holonomy at a crossover. No explicit map from the early double-sphere coordinate construction to this later torus construction has been recovered.

A direct October 17 correction says the crossbar must follow along the curves rather than remain locked to fixed curve points. The raw turn is terse; more detailed sweep-bearing wording remains in assistant-maintained notes, not a verbatim recovered user message.

## Conditional radial bridge

Assume only for this specialization that the two coordinate spheres are co-centered and the connector endpoints are antipodal:

\[
 p=r_i n,\qquad q=-r_o n,\qquad \|n\|=1,\qquad r_i,r_o>0.
\]

With outer-to-inner scale \(\sigma=r_o/r_i\), the oriented segment

\[
 L(u)=(1-u)p+uq
\]

reaches the origin at

\[
 u_0=\frac{1}{1+\sigma}=\frac{r_i}{r_i+r_o}.
\]

Its midpoint is \(L(1/2)=\frac{r_i-r_o}{2}n\). Therefore, passing through the origin is not the same as having the midpoint at the origin; they coincide only in the equal-radius case.

This is a conditional bridge to the Hagalaz relative scale \(\sigma_{ij}=r_j/r_i\) documented in [PR #1189](https://github.com/Satobloc/HsH/pull/1189). It does not establish that the source curves are antipodal, that the sphere centers coincide, or that the full Whirligig/R/Q geometry is equivalent to the framed-sphere construction.

## Mapping diagram

```text
Early direct model:
  two coordinate spheres + two curves
             |
       shared rotating plane
             |
       moving contact pair
             |
       oriented connector
             |
  origin anchor u0 = 1/(1 + sigma)  [conditional radial case]
             |
       Hagalaz endpoint scale

Later R/Q model:
  connector -> W_obble midpoint -> W_iggle -> projecting vector -> torus readout

No source-defined map yet identifies the early origin anchor with later W_obble.
```

## Assistant reconstruction comparison

- The current Python solver applies separate pitch and roll gimbal rotations to the R and Q curves before constructing the connector. This is an engineering reconstruction, not a proof that both contacts lie in one source-defined rotating plane.
- The current browser reconstruction uses a common normalized phase for its loop parameters. A common phase is not by itself a solution of the shared-plane intersection equations.
- The assistant-maintained functional reconstruction proposes deriving the sweep plane from a transported cam frame and solving both contact roots with branch continuation. That is a proposal, not a recovered direct equation.
- The solver computes the connector midpoint and uses it as the ray origin. That represents the later W_obble object, but does not automatically preserve the earlier origin-crossing anchor when endpoint radii differ.

## Holonomy boundary

The direct source proposes a tangent change at a crossover and says a smooth transition requires tangent agreement. Tangent agreement is a C1-join condition once tangent spaces are identified. It does not by itself establish holonomy. A holonomy claim requires a specified connection/transport law and a path.

The existing frame-telescoping formalization in [PR #1189](https://github.com/Satobloc/HsH/pull/1189) proves that endpoint-relative frame comparisons derived from one global frame potential telescope and are path-independent. Endpoint frame ratios alone therefore cannot supply the proposed nontrivial holonomy. The sweep history is a candidate additional kinematic input, not yet a connection.

## Glossary

| Term | Stable meaning |
|---|---|
| Coordinate spheres | Early inner/outer reference surfaces; not assumed physical rolling bodies |
| Sweep plane | Shared rotating plane selecting moving contacts |
| Contact pair | The two points selected where the sweep meets the source curves |
| Connector | Oriented segment/ray between moving contacts |
| Origin anchor | Point where the connector crosses the common origin |
| \(u_0\) | Affine parameter of the origin along the connector |
| \(\sigma\) | Conditional outer/inner radius ratio; candidate Hagalaz relative scale |
| W_obble | Later connector midpoint; not automatically the origin anchor |
| W_iggle | Later plane perpendicular to the connector |
| Hagalaz map | Endpoint similarity between framed states; no path history by itself |

## Discrepancy ledger

| Direct proposition | Assistant translation | Fidelity status |
|---|---|---|
| Connector intersects both curves and origin | Point-pair/segment stores endpoints but not the origin parameter | Partial; conditional \(u_0\) theorem adds one radial special case |
| Sweep moves contacts along both curves | Separate gimbals or common-phase endpoint sampling | Not equivalent without a shared-plane intersection operator and branch selection |
| Early origin anchor and later W_obble midpoint both appear | Solver uses midpoint as ray origin | Unresolved identification; equal-radius case only |
| Crossover has tangent transition and proposed holonomy | Bishop-frame compensation is numerical | Not source-derived; connection and path missing |
| Spheres are coordinate systems; torus/rolling-ball is a 3D toy | Mechanical solver can be read as physical mechanism | Visualization/reconstruction only; no physical equivalence established |

## Formalization status

The existing PointPairSegment module in [PR #1189](https://github.com/Satobloc/HsH/pull/1189) already proves endpoint recovery and injectivity for the affine segment encoding. Two conditional lemmas were added to that existing draft PR:

- `origin_on_antipodal_scaled_segment`: for positive \(\sigma\), the segment from \(p\) to \(-\sigma p\) reaches the origin at \(u=1/(1+\sigma)\).
- `origin_anchor_fraction_eq_radius_ratio`: \(1/(1+r_o/r_i)=r_i/(r_i+r_o)\) for positive radii.

They formalize only the antipodal radial special case. They do not prove the source curves meet that condition, the shared sweep plane, the R/Q contact solver, or physical holonomy. The PR remains draft, open, and unmerged.

At submission, exact-head Lean run [#45552708648](https://github.com/Satobloc/HsH/actions/runs/45552708648) was still in progress on head `dc82b5d5e14a5e46adbb35b1415c44c31eabb6dc`; the new lemmas were therefore `SUBMITTED_NOT_VERIFIED`. Earlier successful run [#45453990100](https://github.com/Satobloc/HsH/actions/runs/45453990100) verified only the pre-existing formalization.

## Next deeper cursor

1. Recover the full raw October 17 source turn; the recovered raw message currently contains only the terse crossbar correction.
2. Define centers, radii, frames, and the sweep plane for the early two-sphere model, then map it to the later R/Q/GrAnn/torus version or keep the versions separate.
3. Solve the shared-plane intersections with branch continuation and explicit multiple-root handling.
4. Carry the origin anchor and W_obble separately; derive when they coincide.
5. Define a connection on the moving contact frame and test whether different sweep paths with the same endpoint frames produce different transport.

No measured physical system, physical calculation, CODATA scoring, paper-gate advancement, or theory promotion was undertaken.
