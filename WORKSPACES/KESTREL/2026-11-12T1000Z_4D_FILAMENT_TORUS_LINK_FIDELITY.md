# 4D filament to 3D trace, torus cycles, and link-topology fidelity

**Status:** source-fidelity addendum and bounded Lean formalization. No physical calculation, measured-data fit, CODATA scoring, or theory-core promotion.

## Executive finding

The archive contains three geometric levels that historical text sometimes blends:

1. a 1D filament/centerline in 4D spacetime;
2. a possible 2D “second-order” support or worldsheet;
3. a finite-core 4D worldtube.

For a transverse 3D hypersurface slice in 4D, these have different intersection dimensions: \(1+3-4=0\), \(2+3-4=1\), and \(4+3-4=3\). Thus a 1D filament yields points, a 2D support yields curve traces, and a full 4D core yields a 3D section. The direct phrase “3D intersectional trace of a 2nd order 4D filament” is not yet dimensionally unambiguous: “3D” may mean a trace *in* a 3D slice or a genuinely 3-dimensional section, and “second order” is not defined as a dimension label.

The historical SAT-O1 document places Hopf/Borromean link stability on 1D filaments in 4D. Ordinary Hopf and Borromean linking is a 3D spatial-link construction. It is not automatically an invariant of bare 1D curves in 4D. A 3D slice/trace, a codimension-two support, or another explicit constraint is needed.

The July 2026 topology dialogue also contains a precise torus construction: each tube-circumference meridian meets a selected parallel at one point, and the union of those points over the meridian family is the whole selected parallel. This has now been formalized in the existing Kestrel Lean branch. The result distinguishes this intersecting torus-cycle pair from a Hopf link of two disjoint circles.

## Source custody

| Source | Status and use |
|---|---|
| “Particles & Inverse Black Holes,” *Nathan McKnight's Grab Bag*, 2026-07-18 | Primary spoken-source witness for the particle-worldtube/ER-mouth, CTC-to-Kerr-CSC, torus/Klein, Hopf-ring/figure-eight, and inverse-black-hole descriptions. Transcript is auto-generated and not diarized; audio verification remains open. |
| `HsH COSMOTOPOLOGY.txt`, blob `9f42b96adfa1cb9b310ad8d89843b93ae0379922` | 98,867-character flattened `NATHAN:` / `CHATGPT (MathtoolExp):` transcript. It contains 32 labels for each speaker, but no raw role graph, message UUIDs, or original timestamps. It is a historical assistant-math locator, not a raw message export. Duplicate archive copies are one witness, not independent corroboration. |
| Direct user-role archive message, *Meridian Free Build*, 2026-10-09 | Clarifies that the 3D image is a trace of a “2nd order 4D filament,” not the filament itself; questions self-closure in a 3D cobordism; and says the roughly 0.7 fm value is a first-order coil radius, not filament thickness. Raw source is not publicly linked here. |
| `Workshop Relay :24 | Geometry`, 2026-08-26; `Minkowski Ring Analysis`, 2026-10-21 | Direct user-role corrections: Klein Fabric is not simply the mathematical Klein bottle; a later message retires the earlier reciprocal filament/timesheet-deformation model and calls Klein Fabric the common structure. Neither source defines its atlas or gluing map. |
| `SAT4D_LIVE_DRAFT.txt`, blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7` | June 2025 header; bylined Nathan McKnight with AI assistance acknowledged. Historical source, not proof that every equation is independently authored or current. |
| `SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc` | Unbylined 75-line companion, first extant archive copy 2025-10-27. Do not attribute authorship by adjacency. |
| `🧱BLOCKWAVE.txt`, blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664` | Attachment record 2025-09-16; composition authorship unresolved. The 2025-10-19 assistant re-output is assistant-authored, not independent Nathan authorship. |

## Verbatim historical equation anchors

**SAT4D / SAT-O1 hyperhelix:**

\[
\gamma^\mu(\lambda)=
\left(\lambda,\,
A_x\sin(k_x\lambda+\phi_x),\,
A_y\sin(k_y\lambda+\phi_y),\,
A_z\sin(k_z\lambda+\phi_z)\right),
\qquad
v^\mu=\frac{d\gamma^\mu}{d\lambda}.
\]

\[
S[\gamma]=\int d\lambda\,L(\gamma,v),\qquad
L=\frac12m\,v^\mu v_\mu-V_{\rm tension}(\gamma),\qquad
\phi_i-\phi_j=\frac{2\pi k}{n}.
\]

The SAT-O1 file calls \(\lambda\) affine and \(v^\mu\) a 4-velocity, but does not establish that \(\lambda\) is proper time. Its displayed \(\gamma:\mathbb R\to\mathbb R^{3,1}\) has a 1D image. Its separate definition of a 4D worldtube therefore needs a family of curves or additional parameters. This is a missing parameterization/type map, not a blanket contradiction: a historical centerline may approximate an extended manifold.

SAT-O1 further claims stable two-filament Hopf links and three-filament Borromean links in 4D, with no stable interlocks for four or more filaments. These are historical claims, not established theorems or Nathan Direct propositions.

**Blockwave assistant re-output:**

\[
A_\mu(\theta)=\alpha_*\,\nabla_\mu\theta,\qquad
F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta),
\]

\[
J^{\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,\qquad
\nabla_\mu J^{\mu\nu}=0.
\]

This rank-two current must not be silently identified with the rank-one \(J_\mu\) in SAT4D, the torus meridian family, or a finite-core worldtube. If its support is a 2D worldsheet in 4D, it has codimension two and could yield a 1D trace on a 3D slice; the attachment does not define that support map. For constant \(\alpha_*\), \(F=dA=\alpha_*d^2\theta=0\) locally for a smooth local phase. A compact circle-valued phase may still have nonzero periods on noncontractible loops: global winding/holonomy is not local curvature.

## Corrected dimensional and topological maps

For a transverse 3D hypersurface \(\Sigma^3\subset M^4\):

\[
\dim(\gamma^1\pitchfork\Sigma^3)=1+3-4=0,
\quad
\dim(W^2\pitchfork\Sigma^3)=2+3-4=1,
\quad
\dim(K^4\pitchfork\Sigma^3)=4+3-4=3.
\]

The existing `KestrelIntersectionDimensionGate` formalizes these cases as `transverse_worldline_hypersurface_finrank_zero`, `transverse_worldsheet_hypersurface_finrank_one`, and `transverse_full_core_hypersurface_finrank_three`. If “3D trace” means a 1D curve in a 3D slice, a 2D source support is dimensionally compatible. If it means a 3D section, a full 4D core is the matching transverse source. A separate singular-locus map is still needed if a 1D Kerr CSC ring is to be extracted from a 3D section.

For the torus-cycle description:

\[
T^2=S^1_{\rm fiber}\times S^1_{\rm parallel},
\qquad
M_u=\{(u,v):v\in S^1\},
\qquad
P_v=\{(u,v):u\in S^1\},
\]

\[
M_u\cap P_v=\{(u,v)\},
\qquad
\bigcup_{u\in S^1}(M_u\cap P_v)=P_v.
\]

Here \(M_u\) is a tube circumference/meridian and \(P_v\) a selected parallel. “Inner” is an embedding choice; the proof does not identify \(P_v\) with the Kerr CSC.

```text
T² = S¹fiber × S¹parallel
M_u (tube circumference) ∩ P_v (chosen parallel) = {(u,v)}
⋃u (M_u ∩ P_v) = P_v

P_v  -- ? --> Kerr CSC ring
       [physical identification not supplied]

1D filament in M⁴ ∩ Σ³  --> points
2D support in M⁴ ∩ Σ³    --> curves
4D core in M⁴ ∩ Σ³      --> 3D section
                         -- ? --> 1D CSC singular locus

Hopf alternative: S¹ ⊔ S¹ embedded disjointly in S³.
Figure-eight alternative: immersed loop, four-valent graph S¹ ∨ S¹,
or figure-eight knot. These are different objects and need a chosen
embedding and/or smoothing/reconnection map.
```

A Hopf link is two disjoint embedded circles; standard torus meridian and parallel intersect, so they are not the same pair under the same embedding. A figure-eight projection, the graph \(S^1\vee S^1\), and the figure-eight knot are distinct. A crossing resolution is a surgery/reconnection choice, not an ambient isotopy. The assistant's annulus, pair-of-pants, punctured-torus, and punctured-Klein-surface constructions are conditional regular-neighborhood models; the source does not select a ribbon structure or embedding.

## Causality and inverse-map gates

The standard facts \(\pi_1(T^2)\cong\mathbb Z^2\) and \(\pi_1(K)=\langle a,b\mid aba^{-1}=b^{-1}\rangle\) are correct for the standard surfaces. They classify loop classes, not timelike character. The assistant's CTC family \(\Gamma_C\), common ring caustic, and worldtube-as-union-of-mouth-intersections are proposed constructions. A CTC still requires a Lorentzian metric, time orientation, a closed curve, and a timelike tangent. A global time function strictly increasing on every future-directed timelike curve forbids a closed return.

The direct “inverse geodesic array with perpendicular disk CSC” is not the same as ordinary Euclidean point inversion. Meridian PR #895 formalizes that ordinary inversion maps the stated circle to another circle in the same plane, not to a 2D sphere. A ring-to-sphere or particle-to-black-hole correspondence therefore needs a separately defined duality map with explicit domain, codomain, and composition rules.

The later direct Klein Fabric correction prevents identifying the global H(s)H structure with the ordinary 2D Klein bottle. The standard Klein-bottle group and punctured Klein surface remain comparisons only.

## Original versus translated propositions

| Direct/source proposition | Historical translation | Judgment |
|---|---|---|
| Conditional torus/Klein global structure and CTCs meeting a Kerr CSC | Fundamental-group classes index a CTC family and common caustic | Correct group facts; causal/incidence maps are added assumptions. |
| Inner circumference intersected by tube circumferences | Selected parallel is the common transversal locus of meridians | Faithful conditional translation; product identity is Lean-checked. |
| Hopf-like rings or a figure-eight crossing | Hopf link/annulus versus \(S^1\vee S^1\) graph and thickenings | Useful alternatives, but not equivalent types. |
| Inverse geodesic array with perpendicular disk | Ordinary point inversion and ring-to-sphere image | Not source-equivalent; define a different duality map. |
| “2nd order 4D filament” with “3D intersectional trace” | 1D hyperhelix, 4D worldtube, and 3D link language | Type/projection map missing; resolve the meaning of “3D” and “second order.” |
| Klein Fabric is not simply the mathematical Klein bottle | Standard Klein group and punctured Klein surface | Comparison only, not identity. |

## Glossary

| Term | Stable use here |
|---|---|
| \(T^2\) | Standard product torus \(S^1\times S^1\). |
| Meridian / tube circle \(M_u\) | Circle with first product coordinate fixed. |
| Parallel \(P_v\) | Circle with second product coordinate fixed; “inner” requires an embedding choice. |
| Worldline / 1D filament | One-dimensional curve in 4D; transverse 3D-slice intersection is 0D. |
| Worldsheet / 2D support | Two-dimensional support in 4D; transverse 3D-slice intersection is 1D. |
| Finite-core worldtube | Extended 4D object; transverse 3D section is 3D. |
| Kerr CSC | Model-specific ring/disk locus; exact set and dimension unresolved. |
| CTC | Closed curve with timelike tangent under a specified Lorentzian metric and time orientation. |
| Hopf link | Two disjoint embedded circles with nonzero linking number in a 3D ambient space. |
| Figure-eight graph | Singular four-valent graph \(S^1\vee S^1\), distinct from a smooth figure-eight knot. |
| Klein Fabric | Later H(s)H term for a global 4D structure, not identified with the ordinary 2D Klein bottle. |
| Inverse map | Unspecified particle/black-hole duality until an explicit map is supplied. |

## Discrepancy ledger

| ID | Mismatch | Repair required |
|---|---|---|
| D0 | 1D curve, 4D worldtube, and 3D link language are not connected by a typed map. | Specify the family/finite-core parameterization and the dimension of the source support. |
| D1 | “3D trace” and “second order” are ambiguous. | State whether the trace is a curve in a 3D slice or a 3D section, and define “second order.” |
| T1 | \(\pi_1\) classes are treated as CTC structure. | Supply metric, time orientation, explicit timelike curves, and CSC incidence/convergence. |
| T2 | Inner parallel is associated with the Kerr CSC. | Define the embedding and the map \(P_v\to C_{\rm CSC}\). |
| T3 | Hopf rings are compared with intersecting torus cycles. | Supply a separate disjoint embedding \(S^1\sqcup S^1\hookrightarrow S^3\). |
| T4 | Figure-eight graph, immersed loop, and knot are conflated. | Specify crossing, ribbon order, smoothing, and surgery. |
| T5 | “Inverse” is interpreted as point inversion. | Define the intended particle/black-hole duality map. |
| T6 | Klein Fabric is identified with the standard Klein bottle. | Specify its 4D atlas, quotient, orientation data, and gluing map. |

## Lean 4 / Mathlib verification

A new `KestrelTorusCycleGate.lean` module was added to the existing Kestrel PR #873 branch. It proves:

- `tubeCircle_inter_parallelCircle_singleton`
- `parallelCircle_eq_iUnion_tubeIntersections`

The corrected PR merge-reference run #43202552666, job #131129411360, checked out merge ref `7ca33453a6fc74f8e165821abac942414ef9546b` (PR head `7dbcb5f18690232d921db74f25dfdf222ee51b8c` into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`) and completed successfully: 8,957 build jobs, Lean 4.34.0 / Lake 5.0.0. The two new theorems' `#print axioms` lists are `[propext, Quot.sound]`; no `sorryAx` or `admit` appears in the captured module output. The workflow nevertheless sets `nanoda-allow-sorry: true`; tests, lint, leanchecker, and the separate axiom-audit stage are disabled. This is not a repository-wide no-sorry certification. The first build attempt failed on an unsolved product-equality goal; commit `7dbcb5f` repaired it explicitly with `Prod.ext`, and the corrected build succeeded.

The existing Kestrel `KestrelIntersectionDimensionGate` formalizes the transverse 1D/2D/4D-support slice dimensions. Kestrel's `KestrelSAT4DTimelikeGate` proves a pointwise Minkowski tangent-norm condition under its stated assumptions, not a closed timelike curve.

Meridian PR #895 remains separate. Its successful merge-reference run #41141185069, job #124358367833, compiled 8,946 jobs. It formalizes the global-time-function no-closed-return gate, the Euclidean circle-inversion result, and the mapping-torus endpoint convention. The captured axiom outputs use standard Lean axioms; `nanoda-allow-sorry` is enabled and lint/tests/axiom-audit are skipped. Neither PR is merged. Lean verifies only the formalized statements, not source fidelity or physical premises.

## Next deeper cursor

1. Verify the July 18 episode audio around CTC, Kerr CSC, Hopf rings, figure-eight, and the perpendicular disk.
2. Recover the raw role graph and original timestamps for `HsH COSMOTOPOLOGY.txt`; until then, its speaker labels remain flattened-transcript evidence.
3. Resolve whether “3D intersectional trace” means a curve in a 3D slice or a 3D section, and define “second order” as a geometric type.
4. Define the global Lorentzian metric and time orientation, then specify or refute a timelike \(\gamma_{m,n}\) family and its incidence map to \(C_{\rm CSC}\).
5. Specify either a disjoint Hopf embedding or a figure-eight smoothing/reconnection map. Keep the alternatives separate.
6. Define the particle-to-black-hole duality map, including how a particle-side ring maps to the black-hole-side perpendicular disk.

No claim is made that the spoken model has passed these gates. The result is a sharper separation of dimensional slice geometry, torus-cycle intersections, link/surgery alternatives, and Lorentzian causality.
