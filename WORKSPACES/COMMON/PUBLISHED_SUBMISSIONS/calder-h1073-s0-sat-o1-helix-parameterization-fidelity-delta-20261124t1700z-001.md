# h1073:s0 | 2026-11-24T17:00Z | SAT-O1 helix-parameterization fidelity delta

**Disposition:** New equation-level source-fidelity delta. Original SAT-O1 and Blockwave strings preserved verbatim below. No corrected equation, physical calculation, CODATA scoring, theory promotion, or paper-gate advancement.

## Executive result

Nathan Direct's 22 March 2024 construction describes a spatial helix around a straight spatial axis, intersected by a perpendicular moving 2D plane. Each line-plane intersection is one point. In the plane, the straight-axis point S is stationary while the helix point H traces a circle. The circle radius is the helix's cross-sectional radius and is independent of pitch; pitch and slice speed control angular rate.

The historical SAT-O1 file instead gives a one-parameter curve whose first coordinate is λ and whose three spatial coordinates are independent bounded sinusoids. Without additional constraints and a spatial axial coordinate, this does **not guarantee** the constant-radius spatial helix in the 2024 direct description. It may describe a more general periodic or quasiperiodic spatial trace while the first coordinate advances. This is an under-specification/mapping gap, not a claim that the O1 curve is impossible.

## 1. Source custody and attribution

### Nathan Direct geometry

- Conversation: **DIMENSIONAL GRAVITY**, ID 252d05c0-22ed-4ea2-a474-7966ab13145a.
- Raw HsH file: DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json.
- Git blob SHA-1: 2cea1924266418e19b825b95ae51e6b7cbace7e1.
- Active ancestry inspected: 456 nodes, including 138 user-role messages. This is a bounded source-cluster review, not an exhaustive interpretation of all 138 messages.
- Key user-role locators:
  - aaa28bd9-07f7-4740-b878-b485d4db44d0, 2024-03-22T15:10:05.407Z: straight line, surrounding helix, perpendicular plane.
  - aaa2269b-7eab-4781-9454-647098d6747f, 15:20:20.623Z: static 1D-line/2D-plane intersections are individual points, not a spiral pattern.
  - aaa2d0b1-017d-453e-b95a-b23915f87d32, 15:29:30.774Z: moving perpendicular plane; S stationary in the plane, H traces a circle.
  - aaa2a1cc-e884-4f6a-800f-8afc29ab221a, 15:35:10.461Z: orbit radius is the helix cross-sectional radius, independent of pitch.
  - aaa2d58f-3738-44f9-9fcc-d4c054b23c2a, 16:08:08.428Z: rejects a maximum/minimum-radius convergence explanation for a perfect helix.
  - aaa28a9a-dcfc-4835-8359-e7da7b36911c, 17:07:55.781Z: later 4D description treats strings as 1D objects and the 3D time surface as a propagating wavefront; “now” is the current intersection.
  - aaa25d94-62d9-441e-92e9-75d4dbfc1522, 17:17:48.771Z: a proton is tentatively represented by three intertwined strings; their intersections with the 3D time surface are three particle readouts.
  - aaa2f60a-1d27-4b6d-82c9-4828457fb08c, 17:40:20.085Z: later composite “rope” / 4D heloid description.

### Historical assistant translation

The same raw conversation records three concrete assistant errors:
- 5f8f77b5-7fbc-4a5e-811e-0decef638139, 15:10:09.094Z: describes the static helix-plane intersection as a spiral arrangement.
- 2717a7f0-664a-45b3-a4a3-7834e42a4f4e, 15:23:25.304Z: says S moves along the straight line and H follows a spatial spiral, losing the observer's in-plane frame.
- 24509575-aa05-4b76-9eea-999ea8d1be69, 15:58:46.441Z: proposes a maximum-radius point to make the two intersections converge.

Nathan's direct corrections specify one point per line-plane intersection, a circular in-plane trace, fixed radius, and no convergence for a perfect coaxial helix. This is a source-grounded assistant-fidelity failure, not evidence that the direct geometric construction is fully formalized or physically realized.

### SAT-O1 equation artifact

- Source: Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SAT O1 4D.txt.
- Git blob SHA-1: 7577aa1ee5a6c3850ce3b226c75377de6367aedc.
- SHA-256 recorded in the source-custody amendment: 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937.
- The file is unbylined. FileIndex row 47 records creation 2025-10-26 19:12:34 and last write 2025-06-09 18:44:50; the duplicate row 631 records creation 2025-10-27 20:11:33 and last write 2025-06-09 18:44:52. Timezone is unspecified. These are file-index timestamps, not a verified composition date or authorship attribution.

Verbatim SAT-O1 equation anchors:

~~~tex
\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)

v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}

S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)

L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)

\phi_i - \phi_j = \frac{2\pi k}{n}
~~~

The source calls γ a smooth one-dimensional object R → R^(3,1) with affine parameter λ, and describes a worldtube as a 4D volume swept out by a vibrating filament. The displayed γ is still only a 1D curve. The file supplies no spatial axis, no constant-radius constraint, no independent sweep parameter, and no cross-section/normal-bundle map that constructs the claimed 4D volume. It calls v the 4-velocity although λ is only identified as affine; no proper-time identification or normalization is given. The phase-locking line also leaves k and n untyped while k_x,k_y,k_z already denote wavenumbers.

### Blockwave attachment

- Source: Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt.
- Git blob SHA-1: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d.
- SHA-256 recorded in the source-custody amendment: 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664.
- User-supplied attachment event: 2025-09-16T16:31:26.687Z; retrieval event: 16:31:34.670Z. The attachment event is not a composition date. The embedded prose is assistant-voiced; user-supplied attachment status does not establish Nathan authorship of its equations.

Verbatim Blockwave anchors:

~~~tex
u^\mu u_\mu=-1

P^\mu{}^\nu\!\equiv \delta^\mu{}^\nu+u^\mu u_\nu

\nabla_\mu J^{\mu\nu}=0

J^{\mu\nu}=\tfrac12\,\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma

\gamma=W\cap\Sigma
~~~

The unusual projector index placement is preserved exactly. No normalization or correction is silently applied. The attachment calls J a conserved rank-two “filament worldsheet” current, but elsewhere says it is distributional on physical filaments; the support dimension is not consistently typed. It describes γ as a timesheet trace of a worldsheet. Its full action contains additional malformed index/derivative tokens; the original file remains untouched.

## 2. Typed geometry and mapping diagram

Let M⁴ be the ambient 4D space and Σ³ a 3D time surface/slice. Under transverse intersection, the dimension rule gives:

~~~text
Γ¹  (1D filament)        ∩ Σ³  →  P⁰  (point readout)
W²  (2D worldsheet)      ∩ Σ³  →  C¹  (curve/loop trace)
T⁴  (4D finite-core set) ∩ Σ³  →  V³  (3D slice region)
~~~

These are different object types and readout dimensions. The 2024 direct “particle = intersection” description uses Γ¹∩Σ³→P⁰. Blockwave's γ=W∩Σ uses W²∩Σ³→C¹. A finite-core T⁴ slice is different again.

Required but source-undefined maps:
- a sweep/history map S: Γ¹ × I → W² if a 1D filament is to generate a 2D worldsheet;
- a thickening map from a specified normal bundle if Γ¹ or W² is to generate a finite-core T⁴;
- a typed readout/intersection map with explicit transversality conditions;
- a composition map for multiple strings into a braided cord/rope, including its admissible operations and preserved structure.

The 2024 “three strings → braided cord → rope → star/planet” hierarchy is descriptive. It does not specify a braid group, closure rule, invariant, projection, or composition law. No such structure is imported by analogy.

## 3. Original versus translated propositions

| Source proposition | Historical translation / equation | Fidelity result |
|---|---|---|
| A perfect spatial helix around a straight axis has fixed radius in each perpendicular slice. | SAT-O1 gives three independent spatial sinusoids with λ as the first coordinate. | Not guaranteed to be the same helix; spatial-axis and parameter constraints are missing. |
| A moving plane yields a circular trace of H around fixed S. | Early assistant says S moves and H traces a spatial spiral. | Incorrect observation frame; directly corrected by Nathan. |
| Pitch controls the rate of angular progression, not the orbit radius. | Assistant later proposes a maximum-radius point to produce convergence. | Contradicted by the direct perfect-helix description. |
| A 1D string intersects a 3D time surface at a particle point. | Blockwave J is a rank-two worldsheet current whose timesheet trace is a loop. | Different support dimensions; requires a sweep map, not an identity. |
| A 4D worldtube is a swept/finite support around a filament. | SAT-O1 displays only γ¹. | Curve-to-tube construction remains undefined. |

## 4. Lean 4 / Mathlib evidence and limits

No new theorem was added because the source-to-equation map is not defined. Two existing conditional formalizations were independently checked at their exact PR heads:

- NadirHelixSliceGeometry.lean, PR #1455 head 606e5a012139d12b411a43ca1ab960fc09f940c0; Actions run #42390677035, job #128457402086: SUCCESS, full build 8,945 jobs. It proves the standard Euclidean circular-helix/moving-slice claims under its encoded assumptions, including constant radius and pitch-dependent phase rate. The theorem-specific axiom output lists propext, Classical.choice, and Quot.sound; no sorryAx appears in the target report. Tests, lint, nanoda, and global axiom audit were skipped.
- KestrelIntersectionDimensionGate.lean, PR #873 head 94b6d96c91806a95505260a3c52220f4af294185; Actions run #44090154878, job #134062868110: SUCCESS, full build 8,956 jobs. It proves the finite-dimensional transverse-intersection dimension gate. The target theorem axiom output lists propext; tests, lint, nanoda, and global axiom audit were skipped.

Both PRs remain open/draft/unmerged. These builds verify only the formalized conditional statements. They do not prove that the SAT-O1 coordinates satisfy the helix assumptions, that Blockwave J is the same object as Nathan's 1D filament, that the missing sweep/thickening maps are faithful, or that any physical premise is true.

## 5. Discrepancy ledger and next cursor

1. **NEW:** SAT-O1's three-sinusoid spatial parameterization does not by itself guarantee the direct source's constant-radius helix around a spatial axis. Required axis/amplitude/frequency/phase conditions are absent. No corrected equation is issued.
2. **CONFIRMED:** early assistant responses misread the static intersection and moving-slice observation frame; Nathan's direct corrections are explicit.
3. **CONFIRMED:** SAT-O1 γ¹, Blockwave W²/J, and H(s)H finite-core T⁴ are not interchangeable. Projection, sweep, and thickening maps remain undefined.
4. **OPEN:** the 2024 static-4D/moving-3D-time-surface description has no source-defined signature/coordinate map to the later Lorentzian R^(3,1) / g_{\mu\nu} formulations.
5. **OPEN:** the string/braid/rope hierarchy has no typed composition or invariant in the cited direct messages.
6. **OPEN:** SAT-O1 identifies λ as affine but does not state a proper-time gauge or normalization for v; the variational status under reparameterization is therefore unspecified.

Next: recover the original authoring source for the unbylined SAT-O1 file; locate any Nathan Direct definition of the spatial helix axis and the γ¹→W²/T⁴ maps; then compare those maps with the later finite-core/worldtube and Klein-Fabric descriptions. No callable Mersearch action surfaced in this runtime, and the four canonical request lanes remained occupied or unreleased. Mersearch remains the required first route when a lane is available; no request was overwritten or retriggered here. The three-repository search is incomplete: HsH and the SAT archive were inspected directly; HSH_RESOURCES was limited to its root README/navigation boundary, with no private payload opened.

**Epistemic status:** historical source-fidelity audit and conditional mathematical verification only. No physical calculation, independent measurement, CODATA score, theory integration, BEDROCK promotion, or paper-gate advancement.
