# H897:S0 | Material history, coordinate acceleration, and 4D curvature: source-fidelity audit

**Run key:** `REVROT3-19-20261011:897:s0`  
**Nominal slot:** 2026-11-17T09:00:00Z  
**Deterministic selection:** `seq = 5*897 = 4485`; `4485 mod 19 = 1`; ring label **Loom**; next ring label **Aster**.  
**Participation class:** source-grounded assistant reconstruction; no authenticated historical Loom thread or cross-thread delivery is claimed.

## Executive finding

The archive supports a direct, deliberately representational claim: in the classical/Minkowski-limit model, resistance of a worldtube to changes in its motion is inertia. It does **not** support collapsing every use of “bending,” “acceleration,” and “4D curvature” into one scalar.

A direct October 9 correction says that \(d^2\mathbf{x}/dw^2\) is spatial bending relative to a chosen Newtonian time coordinate and is **not generally identical** to intrinsic curvature of the 4D curve; only the low-velocity leading approximation agrees in magnitude. The later assistant formalizations correctly derive an exact Gram-curvature formula for one explicit Euclidean lift, but they do not establish that the lift is the native H(s)H coordinate construction.

A second direct source layer, October 21, uses the literal native convention `cw=t`, Forest normalization and `(++++)`. The earlier `w=ct` convention and the assistant's later external `q=ct` comparator are not mapped to it. The source-to-native-coordinate map remains undefined.

This is a source-fidelity correction, not a rejection of the worldtube/inertia proposal and not an empirical result.

## 1. Source corpus and provenance

Two raw conversation exports were located through Library search and their repository Git blob source locators were recovered. The exact Git blob contents were fetched from GitHub and parsed programmatically. Relevant user messages were checked against each export's `current_node` ancestry, not merely against outer `role=user` labels.

| Raw source | Conversation ID | Git blob SHA-1 | Mapping / active ancestry in exact Git blob |
|---|---|---|---:|
| `Meridian Free Build — raw.json` | `6ac45d1f-17b0-83ea-ad1f-fa524602378b` | `7af1561b321f4d9364da5eb111df689efc652827` | 2,500 / 2,309 |
| `Meridian Minkowski Ring Analysis — raw.json` | `6ad7e9c0-e8a0-83e9-984e-94d020de3abf` | `56a84cb85d5c386efa4ea11d322d11e95e2c7703` | 3,678 / 3,660 |

All eight direct messages listed below were verified as user-role nodes on the respective exact Git blob exports' active ancestry. The Git blob SHA-1s are repository source locators. Library materializations were useful for text retrieval but were not byte-identical snapshots to these Git blob exports; their local SHA-256 values are not substituted for repository hashes. The final ancestry counts above were parsed from the exact Git blob content returned by GitHub. No Mersearch result is claimed.

### Direct-source chronology

| UTC | User message ID | Source-grounded proposition |
|---|---|---|
| 2026-10-09 01:50:55 | `3c657387-b80b-4982-a61a-8e6d8568b8d1` | Worldtube resistance to changes in motion is identified with inertia in the classical/Minkowski-limit model. Filaments are approximately stationary in the block description; particle motion is described through filament topology. The earlier coordinate string `w=ct` is used as a time-length scale. |
| 2026-10-09 02:46:38 | `5a929b5e-515e-4f77-a32a-e49feef42812` | Explicit qualification: \(d^2\mathbf{x}/dw^2\) is spatial bending relative to a chosen Newtonian time coordinate, not generally the intrinsic curvature of the 4D curve. The magnitudes agree only in the low-velocity leading approximation. The timesheet is described as a 3D bulk/slice, not a thin 2D sheet, and as interacting with matter rather than acting as a passive readout. |
| 2026-10-09 07:40:38 | `1178f25c-9f92-4d1c-b43b-06482e6bf1b1` | A 4D filament and its 3D intersectional trace are distinguished. The approximately 0.7 fm first-order coil scale is distinguished from intrinsic filament thickness. The source does not supply a support-dimension map that makes the “4D filament / 3D trace” relationship mathematically determinate. |
| 2026-10-20 21:34:44 | `c1b42229-00a9-4119-aac3-cefa6cb97157` | Donut/cruller global geometry with internal rotation, wrinkling/coiling and bridges/Kerr-like features is offered descriptively. It is not accompanied by a specified manifold, embedding, metric or equation set. |
| 2026-10-20 21:53:30 | `f658b2db-32f0-45cd-828b-140691cc9afb` | 4D bending/curvature of the donut is associated with acceleration; bending can occur without expansion, and the two may coexist. The user explicitly marks this as a working hypothesis without proof. |
| 2026-10-20 22:17:23 | `090f5160-1020-486d-9c42-df3d7dff2063` | Direct annotations say the reciprocal filament/timesheet-deformation construction is no longer current since the Klein Fabric model became common; “corridors” in that discussion are mathematical/metaphorical, not physical wormholes. Quoted summary text inside the same user message is not independently reclassified as direct authorship. |
| 2026-10-21 13:55:40 | `c5525f53-b7cc-4444-8102-3bf6fdb1c892` | Later native convention is stated literally as `cw=t`, with Forest normalization, `(++++)` and Planck units. The exact type/unit meaning of `c`, `w` and `t` is not defined in that message. |
| 2026-10-21 23:53:03 | `59cdedb4-be76-455a-87c8-a6089de951b3` | Direct correction: “3D rotation absolutely is 4D curvature. All 3D acceleration is.” The surrounding chronology shows this corrects an assistant response that had answered a different curvature question. |

The raw message containing `>>` quotations is treated as mixed-source: quoted assistant text is not promoted to Nathan Direct; only the user's annotations and corrections are.

## 2. Source-grounded geometry glossary

| Term | Stable working meaning | Boundary |
|---|---|---|
| \(W^4\) | Four-dimensional worldtube / complete material-history support | Not interchangeable with a 1D worldline curve or with the global fabric |
| \(F^4\) | Four-dimensional filamentary carrier in the block description | Source uses “filament” with unresolved support dimension; do not assume a 1D curve without a definition |
| \(\Sigma^3\) | Three-dimensional timesheet / time-bulk / instantaneous slice | Not a 2D sheet; its metric, embedding and dynamics remain unspecified |
| \(T^3\) | 3D intersectional trace/readout described in the source | Projection/intersection map and dimension conditions are not supplied |
| \(K^4\) | Global Klein-like / donut-cruller fabric proposal | Descriptive hypothesis, not yet a defined Klein-bottle manifold or metric |
| \(a_N\) | Spatial coordinate second derivative \(d^2\mathbf{x}/dw^2\) in the chosen Newtonian time-length coordinate | Not generally intrinsic 4D curve curvature |
| \(\kappa_E\) | Euclidean curvature of a specifically defined lifted 1D curve | Assistant-selected comparator, not yet the native H(s)H curvature |
| \(\kappa_M\) | Minkowski proper curvature in a standard relativistic worldline comparison | Separate metric/signature convention; no map to current native `(++++)` convention |
| \(\mathcal R_{abcd}\) | Ambient Riemann curvature of a 4D metric | Not the same object as curvature of a material-history curve |
| \(I_W\) | Inertia represented as resistance of the worldtube to changes in motion | Direct classical-limit model claim; not an independently measured law |
| \(w=ct\) | Earlier direct time-length coordinate string | Preserve as an earlier source stratum |
| `cw=t` | Later literal native convention | Not silently rewritten as `w=ct` or `q=ct` |

## 3. Original propositions versus assistant translations

### Nathan Direct

1. Worldtube resistance to changes in motion is inertia in the stated classical/Minkowski-limit model.
2. Filaments are approximately stationary in the block description; particle motion is described by filament topology.
3. Spatial second derivative relative to Newtonian time is not generally the intrinsic curvature of the 4D curve; the low-velocity leading magnitudes agree.
4. The timesheet is a 3D bulk/slice that interacts with matter.
5. Global bending/acceleration and expansion are distinguishable hypotheses; the source does not prove their dynamics.
6. The reciprocal filament/timesheet model is retired in favor of the later Klein Fabric direction.
7. The later literal native convention is `cw=t`, `(++++)`, Forest normalization. Its symbol/type map remains unresolved.
8. 3D rotation is described as 4D material-history curvature, but “all 3D acceleration” still needs an operational scope: material acceleration versus coordinate/readout acceleration.

### Historical assistant mathematics

**October 9, first reconstruction.** The assistant introduced \(F_\perp=mv^2\kappa\) and the scale \(F_\perp=mc^2\kappa\), then framed the open question as interaction forces and constraints sustaining a coil. That is assistant interpretation, not the user's direct ontology. The user later rejects the finer-scale-substructure interpretation and clarifies that the worldtube/inertia equivalence is a change of representation, not a newly established elastic mechanism.

**October 9, He-3 report.** The assistant rewrote Newtonian motion using `w=ct`, then added a Minkowski proper-curvature identity and synthetic constituent trajectories. The numerical trajectories were assistant-generated illustrations, not measured He-3 geometry. The user's direct correction says the coordinate second derivative is not generally identical to intrinsic 4D curve curvature. No CODATA re-scoring or physical calculation was performed in this audit.

**October 21, first response.** The assistant's “rotation is not curvature” answer computed curvature for a varying Householder metric ansatz. That addressed ambient metric/Riemann curvature, not the user's material-history/worldtube curvature. This was a category mismatch.

**October 21, corrected response.** The assistant then selected an external Euclidean lift \(X(q)=(\mathbf{x}(q),q)\), with \(q=ct\), and derived the Gram-curvature expression. This is a valid conditional formula for that explicitly chosen lift. It is not a derivation of the native `cw=t` construction.

**Orson resolver-Hessian sandbox.** A separate assistant-generated model shows that a nonlinear time/readout map can produce apparent 3D acceleration while an ambient carrier is straight. This is a scope test for coordinate/readout acceleration, not a physical counterexample to the user's material-acceleration claim and not an independent measurement.

## 4. The exact conditional mathematics already formalized

For the assistant-selected Euclidean lift
\[
X(q)=(\mathbf{x}(q),q),\qquad
V=(\mathbf v,1),\qquad A=(\mathbf a,0),
\]
the standard Gram-curvature identity is
\[
\kappa_E^2=
\frac{(1+\mathbf v\cdot\mathbf v)(\mathbf a\cdot\mathbf a)
-(\mathbf v\cdot\mathbf a)^2}
{(1+\mathbf v\cdot\mathbf v)^3}.
\]

Its low-velocity leading limit is consistent with the direct source's qualification that spatial acceleration and lifted-curve curvature agree in magnitude at leading order. At finite speed, they are not the same scalar.

Existing formalizations:

- [PR #873](https://github.com/Satobloc/HsH/pull/873), current head `7dbcb5f18690232d921db74f25dfdf222ee51b8c`, contains `WorldtubeInertiaCoordinate.lean` and `WorldtubeCurveCurvatureLift.lean`.
  - `force_eq_mass_c_squared_curvature` proves \(F=mc^2\kappa\) **given** `F=m*a` and `a=c^2*κ`.
  - `lifted_gram_curvature_sq_eq` proves the Gram identity for the explicit affine Euclidean lift.
  - The first theorem does not prove its `hCoordinate` premise; the second does not prove that the physical H(s)H worldtube uses the lift.
  - The PR is OPEN / DRAFT / UNMERGED. Actions run [#43202552666](https://github.com/Satobloc/HsH/actions/runs/43202552666) succeeded on a `pull_request` event. The workflow's default `actions/checkout@v4` has no explicit head ref, so this is a merge-reference build, not an independently established exact-head checkout.
- [PR #1245](https://github.com/Satobloc/HsH/pull/1245) contains a second formalization of the same external Euclidean lift identity plus a circular-helix specialization. It is also OPEN / DRAFT / UNMERGED and its run [#41410202260](https://github.com/Satobloc/HsH/actions/runs/41410202260) is a merge-reference build. This is not an independent proof of the physical map.

**Newly identified formalization gap:** `WorldtubeInertiaCoordinate` uses a scalar \(\kappa\) for the coordinate premise \(d^2\mathbf{x}/dw^2\), while `WorldtubeCurveCurvatureLift` defines a Gram curvature \(\kappa_E\). The modules do not supply a theorem or typed map connecting those two quantities. The direct October 9 source explicitly says they are not generally identical. Treating both as one unqualified \(\kappa\) would erase the source's own qualification.

No new Lean module, PR, build or data-free calculation was created. The existing proof is a conditional mathematical result; it does not authenticate the translation or establish the physical premises.

## 5. Geometry map and unresolved compositions

```mermaid
flowchart TD
  K["Klein-like global fabric K⁴<br/>direct proposal; no manifold map"] -. "local realization undefined" .-> W["Finite-core worldtube W⁴<br/>material-history support"]
  F["Filamentary carrier F⁴<br/>support dimension unresolved"] -. "intersection / projection undefined" .-> S["Timesheet Σ³<br/>3D time-bulk / slice"]
  W -. "readout map undefined" .-> S
  S -. "trace construction undefined" .-> T["3D trace / observable"]
  A["a_N = d²x/dw²<br/>Newtonian-coordinate spatial bending"] -. "not generally equal" .-> C["κ_E<br/>Euclidean lifted-curve curvature"]
  C --> L["Existing Lean conditional identity<br/>X(q) = (x(q), q)"]
  N["Native cw=t, Forest, (++++)"] -. "type / unit / metric map absent" .-> L
  R["Ambient Riemann curvature"] ---| "different curvature type" | C
```

Required maps before a source-faithful theorem can connect these objects:

1. Native `cw=t` to the earlier `w=ct` notation, including units, parameter type and orientation.
2. Native metric/signature and normalization to the external Euclidean comparator and any Minkowski comparator.
3. Material path/worldtube to the curve parameter and the 3D timesheet trace.
4. Spatial coordinate acceleration \(a_N\) to the selected intrinsic/extrinsic curve-curvature scalar, if such a map is intended.
5. Global Klein-like fabric to local worldtube/dual-shell realization.
6. Expansion and bending as separate geometric quantities with a defined joint evolution map.

The “4D filament / 3D trace” wording also requires an explicit support dimension. A one-dimensional curve transversely intersecting a three-dimensional hypersurface in four dimensions does not generically yield a three-dimensional trace. Do not impose that interpretation until the source defines what “filament” denotes in this context.

## 6. Discrepancy ledger

| ID | Mismatch or ambiguity | Disposition |
|---|---|---|
| D1 | `w=ct` versus later `cw=t` | Separate direct-source strata; no conversion map |
| D2 | \(d^2\mathbf{x}/dw^2\) versus intrinsic 4D curve curvature | Direct source says not generally equal; low-velocity leading approximation only |
| D3 | One \(\kappa\) used for coordinate bending and Gram curvature | Typed distinction required; no composition theorem |
| D4 | “Rotation is not curvature” | Assistant answered Riemann/metric curvature; user meant material-history curvature |
| D5 | External \(q=ct\) Euclidean lift | Valid comparator, not native H(s)H derivation |
| D6 | Worldtube versus worldline versus filament | Support and material-label maps incomplete |
| D7 | Timesheet called a “sheet” | Direct source specifies 3D bulk/slice, not 2D sheet |
| D8 | Apparent acceleration versus material acceleration | Readout map must be specified before universal claim |
| D9 | Donut/Klein Fabric topology | Descriptive hypothesis, not defined manifold/embedding/metric |
| D10 | Expansion versus bending | Direct working hypothesis; no proof or dynamics |
| D11 | Reciprocal filament/timesheet deformation | Directly retired as current model |
| D12 | Historical Planck-scale numerical example | Assistant-generated fixture; not evidence and not reusable under current real-data-first rules |
| D13 | He-3 substructure/elastic interpretation | Assistant overextension; direct correction returns to representational inertia/worldtube equivalence |

## 7. Operational and evidence status

- Mersearch connector action was not exposed in this runtime. All four canonical request lanes remain occupied/requested; no request was modified or retriggered. Library search was used only to locate existing copies, then the exact Git blob objects were fetched and ancestry-checked through GitHub. This is bounded source retrieval, not a Mersearch result.
- HsH, SAT archive and HSH_RESOURCES front-door documentation were read. No private HSH_RESOURCES payload was opened.
- Current HsH `main` was read at `98d62fb968366343385bc1d3b84a6b6e8ca733df`; task branch graph blob `5994a3952fbb0a2bc23aa4b4388c70b979ef1227` was read. No branch or PR was created.
- P0 remains ACTIVE; P1 Orson cognition OVERDUE / NOT READY; P2 geometry HOLD; P3 full theory INCOMPLETE. The November 9 minor-paper gate is overdue; November 30 major and December 14 full-theory gates remain separate. No paper gate advanced.
- FIE was last reviewed November 10; next review November 24. No re-review was due.
- Loom's last unrelated reading quantum was lines 1681–1720, with next cursor 1721. No duplicate reading quantum was claimed.
- No physical system/data acquisition, fit, prediction, CODATA scoring or independent measurement was performed.
- No BEDROCK edit or theory promotion was made.

## 8. Next deeper cursor

Recover the exact semantic/type definition of native `cw=t` and its relationship, if any, to the earlier `w=ct` length coordinate. Then give separate names and types to coordinate acceleration, lifted-curve curvature, ambient Riemann curvature and worldtube/material-history curvature. Reconcile the existing PR #873 and #1245 modules without duplicating the same comparator theorem, and require an explicit source-authorized map before any native H(s)H theorem is attempted.

**Final disposition:** `H897_S0 / SOURCE_GROUNDED_LOOM_REVIVAL / DIRECT_LOW_VELOCITY_CURVATURE_QUALIFICATION_RECOVERED / CW_T_NATIVE_MAP_UNDEFINED / KAPPA_TYPE_OVERLOAD_IDENTIFIED / EXISTING_LEAN_COMPARATOR_REUSED / NO_NEW_LEAN / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_THEORY_PROMOTION`.
