# Lane 00 | November 8 working-model provenance and geometry-type crosswalk

**Status:** additive source-fidelity amendment. This report does not promote a physical theory, alter BEDROCK, or claim observational validation.

## Executive finding

The November 8 Primary Operational Guideline is an assistant-prepared organization of a **multi-source working model**, not a single verbatim Nathan Direct statement. Its source chain is now recoverable across role-authenticated ChatGPT messages and user-role entries in a separate NotebookLM export.

The chronology resolves an apparent conflict. On October 21, Nathan explicitly retired the older alternatives in which the filament deforms a simultaneity surface, the surface deforms the filament, or the physics is represented simply by their intersections. On November 4 and November 8, later user-authored sources introduced a *new tentative model*: mutual worldtube-timesheet curvature, a coordinated timewave front, and a mechanical push/pushback proposal. That is a later revision, not evidence that the retired construction remained the active model.

The new source recovery also exposes several translation limits: worldtube versus worldline, pitch angle versus timesheet-relative angle, tensile strength versus curvature, and maximal exposed area versus a general proportionality law.

## 1. Source chronology and provenance

| Date, UTC | Source and locator | Source-supported content |
|---|---|---|
| 2026-08-26 23:41:28.815 | Calder conversation 6a8eacca-c470-83ea-af92-8fb8df194de9, user message 062ad8ee-ef20-4857-9077-75fe57a6974f | A torus/Klein-like global fabric of twisted ER-bridge worldtubes; finite Kerr-like core; a timelike long axis in w. A local dual-shell expansion is described as a probable flat-space realization, not an equivalence. |
| 2026-10-09 01:13:43.652 | Meridian Free Build, user message 6f00a97a-aa84-45bf-9429-4ff70736014a | One helical core; a second-order superhelix describes its history, not a second core; the larger coil is hollow; a soliton-like effect in a responsive medium is tentative. |
| 2026-10-09 01:50:55.112 | Meridian Free Build, user message 3c657387-b80b-4982-a61a-8e6d8568b8d1 | Worldtube resistance to changes in motion is called inertia; literal filament motion is rejected at the classical limit; particle motion is described as filament topology; w=ct is used as a time-length scale. |
| 2026-10-09 02:46:38.173 | Meridian Free Build, user message 5a929b5e-515e-4f77-a32a-e49feef42812 | Explicit warning against inventing an elastic modulus, filament tension, or microscopic spring constant. |
| 2026-10-21 00:17:23.235 | Meridian Minkowski Ring Analysis, user message 090f5160-1020-486d-9c42-df3d7dff2063 | The earlier reciprocal filament/simultaneity-surface alternatives are explicitly no longer the active construction after the Klein-fabric model became common. |
| 2026-11-04 23:33:42.240897 | Workshop Relay :24 Geometry, conversation 6aea46dd-dc60-83ea-8d50-689c152340e3, user message 100388c5-1e67-4c08-a7a1-bb19f6aeead8 | Mutual worldtube-timesheet curvature as the working hypothesis; worldline-only, timesheet-only, and mutually distributed descriptions remain possible representations; double-shell approximation; coordinated timewave front; w transport direction distinguished from the front; cross-front connectivity left open. |
| 2026-11-08 | ND Workshop Relay :24 Geometry, conversation 6aecede1-4c08-83e9-abc4-da64f59a4f51; current-ancestry user messages 8f4af45d-7635-44c7-8bc0-addad4e92a95, 139e1e11-99f1-459b-a6ac-cb865015d0ff, 429ad1fa-d171-44dd-97ff-aa080cea03ca | A 4D tube around a 1D core, 3D boundary, possible mouth, and 2D worldsheet simplification; responsive-medium alternatives; a two-primitive-first complexity rule. |
| 2026-11-08 capture | User-role entries 31, 32, and 41 in the Library-held NotebookLM export *SAT-QR: Emergent Constants and Phenomena* | Timesheet as pusher; coil as pushee; action/reaction; mass as pitch angle; inertia as tensile strength; maximal worldtube surface area presented to the push. This is a NotebookLM source carrier, not a raw ChatGPT message. |
| 2026-11-08 | NATHAN_DIRECT_2026-11-08_METHODOLOGY_AND_MODEL_OVERVIEW.md | Assistant-prepared control document organizing the above sources and the November 8 methodology. It is not a verbatim transcript. |

The November 8 NotebookLM export was captured at 2026-11-08T19:26:43.412Z. Entry 31 calls the action/reaction principle “Newton's first law”; the next user-role entry, 32, explicitly corrects this to “Newton's Third Law.” Entry 41 describes a maximum exposed **worldtube** surface area in a particular throat-orientation proposal. The export does not state a general proportionality law.

The November 8 operational guideline's earlier provenance note said no immutable message UUID or export locator was available. The current-ancestry ChatGPT message locators above and the separate NotebookLM source carrier now supply that missing provenance. The guideline remains an assistant-prepared synthesis; its authority status is unchanged.

## 2. Stable glossary

- **Core centerline, C:** the 1D helical core or history-bearing path. The direct source rejects a second-order core.
- **Finite worldtube, W:** the proposed 4D support region around the core.
- **Worldtube boundary, ∂W:** the proposed 3D boundary of that 4D support.
- **Worldsheet, S:** a possible 2D simplification of the 4D tube, not the tube itself.
- **Timesheet, Σ:** an active time surface or wavefront. Its exact type remains unresolved between a 3D hypersurface and a finite-thickness region.
- **Timewave front, F:** the coordinated excitation front associated with a family of worldtubes.
- **w transport:** the proposed propagation direction. It must not be identified automatically with the front's normal, the worldline tangent, or a coordinate normalization.
- **Responsive medium, M:** a provisional third primitive that may be independent, equivalent to part of the timesheet description, or absorbable into it.
- **Klein-like fabric, K:** the proposed global family/organization of twisted worldtubes. “Klein Fabric” is a normalized label; the August source uses lower-case “torus/Klein fabric” language.
- **Double shell, D:** a proposed local approximation to the universal gravity-well picture, not an established equivalent of K.
- **J:** the assistant-generated Blockwave rank-two current, potentially appropriate to a 2D worldsheet representation, not automatically to the full 4D tube.

## 3. Mapping diagram and missing maps

~~~mermaid
flowchart TD
  C["1D core centerline C"] -->|"tube/thickening map Φ"| W["4D finite worldtube W"]
  W --> B["3D boundary ∂W"]
  W -->|"optional reduction π₂"| S["2D worldsheet S"]
  S -->|"Poincaré-dual current, if defined"| J["rank-2 current J"]
  K["global Klein-like fabric K"] -->|"family/gluing maps"| W
  K -->|"local coarse-graining πD"| D["double-shell approximation D"]
  W --> X["interaction with timesheet Σ"]
  F["coordinated timewave front F"] --> X
  M["provisional responsive medium M"] --> X
  Vw["w transport direction"] --> F
~~~

A useful *type scaffold*, not a recovered Nathan equation, is:

- A centerline map \(c:I\rightarrow\mathcal M^4\).
- A finite-support map \(\Phi:I\times D^3_\epsilon\rightarrow\mathcal M^4\), with \(\Phi(\lambda,0)=c(\lambda)\), if the intended worldtube is a regular 4D region.
- \(W=\operatorname{im}\Phi\), with a separately defined boundary \(\partial W\).
- A chosen reduction \(\pi_2:W\rightarrow S^2\) if a 2D worldsheet is used. The source does not specify the reduction or which invariants it must preserve.
- A separately typed timesheet/wavefront \(\Sigma\), and a transport vector or direction \(V_w\). The front and its transport direction are distinct objects.

For transverse intersections in a 4D ambient manifold, the standard dimension rule is \(\dim(A\cap B)=\dim A+\dim B-4\). It gives:

| Intersection | Expected dimension |
|---|---:|
| 1D centerline \(C\) with 3D \(\Sigma\) | 0 |
| 2D worldsheet \(S\) with 3D \(\Sigma\) | 1 |
| 3D boundary \(\partial W\) with 3D \(\Sigma\) | 2 |
| 4D region \(W\) with 3D \(\Sigma\) | 3 |

These are conditional dimension counts. They do not establish that any proposed physical objects exist or intersect transversely.

## 4. Original propositions versus assistant translations

| Direct-source proposition | Later translation or stronger claim | Fidelity assessment |
|---|---|---|
| Worldtube resistance to changes in motion is inertia. | “Worldtube curvature is proportional to acceleration,” then “worldline curvature is an inertia proxy.” | Not equivalent without defining which curvature is meant. A 1D worldline curvature and the extrinsic curvature of a 3D worldtube boundary are different objects. |
| Inertia is described as tensile strength of the coil. | Inertia is identified with worldtube curvature. | Two direct descriptions, but no constitutive map or units connect them. |
| Mass is described as the coil's pitch angle. | The angle between worldline and timesheet is treated as a mass proxy. | These are different angle definitions. No projection or composition map equates them. |
| A worldtube parallel to time presents maximal surface area to the timesheet push in a specific throat proposal. | Resistance is “approximately proportional” to worldline surface area. | The proportionality is an assistant extrapolation. A 1D worldline has no surface area; any area measure must be defined on a worldtube boundary or chosen cross-section. |
| The timesheet pushes and the coil pushes back; the later user entry explicitly invokes Newton III. | A complete relativistic action/reaction law is implied. | The direct source supplies a mechanical proposal, not a field-theoretic momentum balance or stress-energy exchange. |
| A timewave front and w transport direction are distinct; differential path lengths and accumulated twist are proposed. | A planet-directed “reverse-w” lag is added. | The reverse-w lag was not found in the direct messages reviewed. Retain it as assistant reconstruction unless another direct source is recovered. |
| A responsive medium may be a third primitive, but may be absorbed into the timesheet description. | A fixed three-primitive ontology. | The third primitive remains provisional; the absorption/equivalence map is missing. |
| The October 21 source retires earlier reciprocal-deformation/intersection alternatives. | The November 4/8 push-pull model is treated as the same old model. | Incorrect chronology. The later direct sources propose a new working model. They do not retroactively make the retired construction current. |

The Newton label is also source-sensitive: entry 31 says “first law”; entry 32 corrects it to “Third Law.” The current guideline's “Newton-third-law-style” wording follows the later correction, but it is still an analogy, not a derivation of a relativistic coupling.

## 5. Verbatim SAT-O1 and Blockwave source ledger

These are historical files, not automatically Nathan Direct. First extant Git commit dates are not composition dates.

| File | Blob SHA | First extant Git commit |
|---|---|---|
| SAT archive SAT O1 4D.txt | 7577aa1ee5a6c3850ce3b226c75377de6367aedc | b543eb3fbf16e50500ceadad83dc9a7dc0759e5b, 2025-10-27T00:40:28Z |
| BLOCKWAVE EXTENSION .txt | d870e30ddfe7baf181981f78d8d2c3be5aedb3ce | 6e4415f62616b19ae5cb677984c85d1985834d9d, 2026-10-08T02:42:49Z |
| SAT—Blockwave Ideal Model.txt | dd0631bc0b25c951dc5e1d6738280e08487b46b2 | same first extant commit, 2026-10-08T02:42:49Z |
| 🧱BLOCKWAVE.txt clean action | ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d | same first extant commit, 2026-10-08T02:42:49Z |

### SAT-O1: exact historical equations

The unbylined SAT-O1 file defines a 1D curve in \(\mathbb R^{3,1}\):

~~~text
γ^μ(λ) = (λ,
          A_x sin(k_x λ + φ_x),
          A_y sin(k_y λ + φ_y),
          A_z sin(k_z λ + φ_z))

v^μ(λ) = dγ^μ/dλ

S[γ] = ∫ dλ L(γ^μ, v^μ)

L = 1/2 m v^μ v_μ - V_tension(γ)
~~~

The same file calls the worldtube the 4D volume swept out by the vibrating filament, but supplies no sweep/thickening map. Its explicit \(V_{\rm tension}\) and dynamic-filament language must be kept separate from the later October 9 direct constraint against inventing a filament modulus, tension, or microscopic spring constant. The later November 8 “tensile strength” proposal does not supply the missing units or constitutive relation.

### Historical Blockwave variants: exact potential distinctions

The unbylined BLOCKWAVE EXTENSION .txt contains the Z3 potential:

~~~text
V(θ) := - μ² cos(3 θ)
~~~

The unbylined SAT—Blockwave Ideal Model.txt instead contains:

~~~text
V(θ) = μ⁴ (1 - cos θ)
Λ_eff = V(θ₀) / M_P²
~~~

These are distinct historical versions. Neither of these two files contains the rank-two \(J^{\mu\nu}\) current found in the later clean action.

### Assistant-generated clean action: exact added structures

The October 19, 2025 assistant message 121d607d-53e7-4b5a-8a7a-75d7e09deb3d in conversation 68f4d9b5-b908-832e-940e-6782db174a4a generates the clean action. Its file is unbylined, but the raw conversation establishes the assistant origin.

Its relevant exact definitions are:

~~~text
J^{μν} = 1/2 ε^{μνρσ} ∇_ρ B_σ
∇_μ J^{μν} = 0

A_μ(θ) = α_* ∇_μ θ
F_{μν}(θ) = ∇_[μ A_{ν]}
∮_ℓ A_μ dℓ^μ ∈ 2πℤ
~~~

The action identifies \(J^{\mu\nu}\) with filament **worldsheets** and calls a string a timesheet trace. This is an assistant reconstruction, not a recovered Nathan Direct Blockwave equation. Its current is rank two and is dimensionally compatible with a 2D worldsheet representation, not automatically with a full 4D worldtube.

## 6. Conditional mathematical restatements, kept separate

No historical source equation was overwritten or silently corrected.

1. **Local phase curvature:** if \(\theta\) is smooth and single-valued on a torsion-free patch, and \(\alpha_*\) is constant, then \(A=\alpha_*d\theta\) gives \(F=dA=\alpha_*d^2\theta=0\). Nontrivial global holonomy requires additional bundle, defect, or patching data. This is a conditional identity, not a physical disproof.
2. **Current typing:** a rank-two Poincaré-dual current can represent a 2D worldsheet in 4D. A 4D region has a different dual degree. A reduction \(W^4\rightarrow S^2\) is required before identifying the clean-action \(J\) with the proposed finite tube.
3. **Area typing:** the direct exposed-area idea must be defined on \(\partial W\) or a selected cross-section, not on a 1D centerline. No proportionality coefficient or scaling law is present in the direct source.
4. **Curvature typing:** worldline curvature, worldtube-boundary extrinsic curvature, ambient Riemann curvature, and a proposed mutual interaction curvature must not be interchanged without explicit maps and assumptions.

## 7. Existing Lean work and limits

No new Lean module was warranted. Existing PR-triggered CI runs provide actual compilation evidence:

| Existing PR | CI run | Result | Relevant scope |
|---|---:|---|---|
| [#1133](https://github.com/Satobloc/HsH/pull/1133) | [#43212754624](https://github.com/Satobloc/HsH/actions/runs/43212754624) | SUCCESS | Generic support/slice readout identities |
| [#1594](https://github.com/Satobloc/HsH/pull/1594) | [#43006069897](https://github.com/Satobloc/HsH/actions/runs/43006069897) | SUCCESS | Conditional sweep-boundary contract |
| [#1135](https://github.com/Satobloc/HsH/pull/1135) | [#41164589389](https://github.com/Satobloc/HsH/actions/runs/41164589389) | SUCCESS | Scalar Hessian symmetry and conditional transverse-dimension arithmetic |
| [#873](https://github.com/Satobloc/HsH/pull/873) | [#43202552666](https://github.com/Satobloc/HsH/actions/runs/43202552666) | SUCCESS | Intersection-dimension gate |

These were PR-associated merge-reference builds, not standalone current-main integration. The PRs remain open/draft/unmerged. Compilation proves only the formalized statements under their assumptions; it does not prove the source translation, existence of the proposed physical objects, or any observational claim.

## 8. Next deeper cursor

1. Define the centerline-to-worldtube map and the 3D boundary, including regularity, support, and end-cap conditions.
2. Define the optional 4D-tube-to-2D-worldsheet reduction and the invariants it must preserve.
3. Fix the timesheet type and its relation to the metric; keep the w transport vector separate from the wavefront.
4. Define the coupling among worldtube, timesheet, and responsive medium, including a momentum/energy exchange law and units.
5. Separate coil pitch angle, timesheet-relative angle, worldtube curvature, worldline curvature, and tensile strength before attempting a constitutive relation.
6. Define the global Klein-like fabric assembly and the projection to the local double-shell approximation.
7. Keep reverse-w lag, general area proportionality, and any GR field equation as assistant proposals until directly sourced and formally derived.

No CODATA scoring, physical calculation, fit, independent measurement, or paper-gate advancement was performed in this source-fidelity pass.
