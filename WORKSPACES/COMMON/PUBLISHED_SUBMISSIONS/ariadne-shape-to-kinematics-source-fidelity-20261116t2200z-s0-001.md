# Ariadne h886:s0 | Shape-to-kinematics grammar: source-fidelity addendum

**Run key:** REVROT3-19-20261011:886:s0  
**Scope:** Lane 00, Nathan Direct geometry fidelity.  
**Disposition:** SOURCE_FIDELITY_ADDENDUM / CONDITIONAL_KINEMATIC_MAP / EXISTING_LEAN_REUSE / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_THEORY_PROMOTION.

This is a narrow addendum to [issue #1267](https://github.com/Satobloc/HsH/issues/1267), [issue #1496](https://github.com/Satobloc/HsH/issues/1496), and [issue #874](https://github.com/Satobloc/HsH/issues/874). It does not repeat the helix-radius result or the two-parabola contact analysis. It isolates the earlier general line-shape/moving-plane vocabulary and tests whether the historical assistant preserved the interaction and dimensional structure.

## 1. Primary-source custody

Primary source:

- Repository: Satobloc/HsH
- Path: DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json
- Git blob SHA-1: 2cea1924266418e19b825b95ae51e6b7cbace7e1
- Conversation ID: 252d05c0-22ed-4ea2-a474-7966ab13145a
- Conversation title: DIMENSIONAL GRAVITY

Relevant user-role messages recovered from the raw export:

| Message | Source time / date | Direct contribution |
|---|---|---|
| aaa276dc-6f4b-47cb-9bc3-3af62e81797a | 2024-03-22 16:54:51Z | Requests a general vocabulary for motion of points in a moving plane, described through the shapes of lines intersecting that plane. |
| aaa2a868-90fa-439f-9d9d-4cf95519ab91 | 2024-03-22 16:57:54Z | Proposes lifting the vocabulary one dimension: lines/strings extend in four dimensions, a three-dimensional time surface intersects them, and intersection points are treated as particles. |
| aaa2371d-5442-4fa3-a791-606c747f96d5 | 2024-03-22 | Qualifies the move away from precise mathematics as an approximate descriptive framework. |
| aaa28a9a-dcfc-4835-8359-e7da7b36911c | 2024-03-22 17:07:55Z | Calls the string idea a vague early intuition and describes time as a three-dimensional surface intersecting strings. |
| aaa26f3d-e831-49cd-976e-a85c5e3b749d | 2024-03-23 | Explicitly identifies the construction as an abstraction/heuristic, not a declaration of the universe's true nature. |
| aaa246c9-e52c-4650-84e8-b078149df0cc | 2024-03-22/23 | Describes an idealized four-dimensional block with a propagating three-dimensional time surface and three-dimensional apparent dynamics as changing intersections. |
| aaa24791-27b2-4b58-8f1a-19ee7e30d650 | 2024-03-23 | Clarifies that complexity arises from interactions among four-dimensional structures; the time-surface intersection is their three-dimensional manifestation, not the source of that complexity. |

The raw export identifies these as user-role messages but has no separate human author-name field. They are treated as Nathan Direct within the conversation's provenance, not as independently identity-authenticated statements. The source is recovered, but archive coverage is bounded: no Mersearch query was available in this runtime and all four shared Mersearch request lanes were already occupied. No lane was overwritten or retriggered.

## 2. Nathan Direct geometry, with its claims bracketed

The direct three-dimensional toy has two interacting ingredients:

1. A one-dimensional curve C embedded in three-dimensional space.
2. A moving two-dimensional plane family Π(t) in that same ambient space.

The observed point or points are the intersections, not properties of the curve in isolation:

\[
I(t)=C\cap \Pi(t).
\]

When the intersection is unique and transverse, a selected branch can be represented by a point p(t). The direct vocabulary associates different curve shapes with different readout patterns:

- A straight line perpendicular to the moving plane's direction gives a stationary in-plane point.
- An oblique straight line gives uniform in-plane motion under a constant plane sweep.
- A curved line can give an accelerating readout.
- Wavy or zigzag curves can give oscillatory readouts.
- A helix can give an orbital readout under the stated orientation conditions.
- A squiggly curve is associated heuristically with random-looking motion.
- A curve with multiple intersections can produce several readout points that may appear to merge or duplicate.

The source frames this as a general descriptive vocabulary, not a closed mathematical theory. It later calls the construction vague, approximate and heuristic. The list therefore records an intended visual/kinematic grammar; it does not establish a universal law that curve shape alone determines motion.

The four-dimensional intuition is a proposed one-dimension-up analogue: one-dimensional strings/filaments in a four-dimensional ambient structure intersect a three-dimensional time surface. The intersection is treated as a point-like particle/readout. This is a type-level proposal, not a completed embedding or a physical identification with the later H(s)H finite-core worldtube.

## 3. Minimum kinematic map required

A source-faithful mathematical reconstruction must retain both the curve and the moving plane. Let a smooth curve be γ(s), and let the moving plane family be defined by a level-set equation

\[
F(x,t)=0.
\]

A local intersection branch is described by a parameter s(t) satisfying

\[
F(\gamma(s(t)),t)=0.
\]

If the intersection is transverse, so that the derivative with respect to s is nonzero at the selected solution, the implicit-function theorem can locally determine s(t). The observed point is then

\[
p(t)=\gamma(s(t)),
\]

and the ordinary chain rule gives

\[
\dot p(t)=\gamma'(s(t))\dot s(t),
\]

\[
\ddot p(t)=\gamma''(s(t))\dot s(t)^2+\gamma'(s(t))\ddot s(t).
\]

This conditional identity is the key source-fidelity discriminator:

- The curve geometry contributes through γ′ and γ″.
- The plane's motion and orientation contribute through s′ and s″.
- A straight line has γ″=0, but its readout can still accelerate if the plane sweep makes s″ nonzero.
- A curved curve can contribute normal acceleration when the readout moves along it, but curvature alone does not specify the acceleration without a parameterization and sweep.
- Uniform motion requires conditions on both the curve and the plane family; it does not follow from the word “straight” alone.

For an arclength parameter, the normal component is proportional to curvature times speed squared, while the tangential component is controlled by the change in readout speed. This is a standard conditional kinematic reconstruction, not a new physical law and not a Lean-verified theorem in this report.

The other shape labels also require additional structure:

- “Wavy/zigzag → oscillatory” requires a specified sweep and a definition of the observed coordinate.
- “Squiggly → random” requires a stochastic process or probability measure. A deterministic irregular curve is not, by itself, random.
- “Multiple intersections → merge/duplicate” is a set-valued readout. Branch tracking and an observer/projection map are required before apparent mergers can be distinguished from actual object creation or annihilation.

## 4. The one-dimension-up map

The direct type pattern is:

\[
C^1\subset \mathbb{R}^3,\qquad \Pi_t^2\subset \mathbb{R}^3,
\]

with a point-like intersection under transversality, and the proposed lift is

\[
\Gamma^1\subset M^4,\qquad \Sigma_\tau^3\subset M^4,
\]

again with a point-like intersection under transversality.

The dimension signatures match:

\[
1+2-3=0,\qquad 1+3-4=0.
\]

That is a conditional dimension match, not a demonstrated physical lift. A genuine lift would require at least:

- an embedding or family of maps Λ from the three-dimensional toy into the four-dimensional ambient structure;
- a time-parameter map τ(t);
- a condition mapping each moving plane Π(t) into the corresponding time surface Σ(τ(t));
- preservation of the selected curve/plane intersections;
- an observer/readout map from the three-dimensional time surface to the displayed three-dimensional observation.

No such maps are supplied in the direct source. The 2024 one-dimensional string Γ¹ must also not be silently identified with the later four-dimensional finite-core worldtube W⁴. They have different support dimensions. A core-selection, thickening, or retraction map would be needed to connect them.

The 2026 worldtube/timesheet geometry remains a separate later construction. No map from the 2024 heuristic to the current one-core, finite-core, spatial-Kerr-section worldtube has been established.

## 5. Original propositions versus historical assistant translations

| Source | Proposition | Fidelity assessment |
|---|---|---|
| Nathan Direct, aaa276dc | Motion is described by the shapes of lines intersecting a moving plane. | The moving plane and the curve jointly define the readout. |
| Assistant, 9a170df7 | Repeats the straight/angled/curved/wavy/helix/squiggle/multiple-intersection vocabulary. | Mostly faithful as a list, but gives no parameterization, sweep conditions, or branch map. |
| Nathan Direct, aaa2a868 | Lift the description one dimension: four-dimensional strings and a three-dimensional time surface. | Explicitly preserves the 4D carrier / 3D surface distinction. |
| Assistant, 1f43fe4c | Describes strings and intersections as a three-dimensional-space construction. | Dimensional collapse: the direct four-dimensional string is paraphrased as a three-dimensional line/string. The time-surface map is not supplied. |
| Assistant, 5b31037f | Calls the idea potentially groundbreaking and a unified description. | Rhetorical overpromotion relative to the user's later explicit “vague intuition / heuristic” qualification. |
| Nathan Direct, aaa24791 | Complexity comes from interactions among four-dimensional structures; the time surface supplies their 3D manifestation. | Later clarification that should govern interpretation of the earlier “static block / propagating surface” language. |

The central assistant mismatch is not merely missing detail. The direct source makes the readout an interaction between a curve and a moving plane. The later assistant paraphrase shifts attention to the shape of strings in three-dimensional space and does not preserve the explicit 4D-carrier / 3D-time-surface type distinction. The correct translation must keep the plane/time surface as a co-participant and keep the observer/readout map explicit.

There is also a direct-source evolution to preserve rather than flatten: an early description calls the four-dimensional universe static except for the propagating three-dimensional time surface; a later clarification locates complexity in interactions among four-dimensional structures and treats the time-surface intersection as their manifestation. These can be distinguished as underlying interaction dynamics versus apparent three-dimensional readout, but the source does not yet supply the composition map connecting them.

## 6. Existing Lean evidence and limits

No new Lean file or PR was created. The relevant existing formalizations were inspected rather than duplicated.

- [PR #873](https://github.com/Satobloc/HsH/pull/873), head 7dbcb5f18690232d921db74f25dfdf222ee51b8c, exact-head Actions run [#43202552666](https://github.com/Satobloc/HsH/actions/runs/43202552666): SUCCESS. The run compiled the existing Kestrel moving-slice, intersection-dimension, and worldtube-curvature-lift modules.
- KestrelMovingSlice formalizes selected affine-line and helix slice readouts, including the slope factor and the conditional ellipse result. It does not formalize the general curve/moving-plane grammar.
- KestrelIntersectionDimensionGate formalizes the conditional dimension signatures for a one-dimensional curve intersecting a two-dimensional plane in three dimensions and a one-dimensional worldline intersecting a three-dimensional hypersurface in four dimensions. It does not prove a physical worldtube or a dynamic observer map.
- WorldtubeCurveCurvatureLift formalizes an affine Euclidean lift X(w)=(x(w),w) and a Gram-curvature identity. This is an assistant-derived conditional model. It does not establish that the 2024 source specifies a Euclidean metric, that its parameter w is physical time, or that the identity is an H(s)H curvature/inertia law.
- [PR #1133](https://github.com/Satobloc/HsH/pull/1133), current head 48c3d3489dfd705c814663a273385a2184654599, exact-head run [#43849175548](https://github.com/Satobloc/HsH/actions/runs/43849175548): FAILURE. The shared MovingPlaneTraceGeometry module has noncomputable-division errors. Some target declarations are printed in the log, but the full workflow is not green and must not be called a completed proof.

No local Lean/Elan/Lake executable is installed in this runtime. The successful PR #873 run is existing exact-head CI evidence, not a new run performed here. The general shape-to-kinematics grammar remains FORMALIZATION_BLOCKED_DEFINITION until the curve parameterization, plane level-set, sweep function, 4D lift, and observer map are specified. Lean can verify the formalized conditional statements; it cannot certify that the translation is faithful or that the physical premises are true.

## 7. SAT-O1 and Blockwave source custody

These remain separate historical equation families; neither is silently substituted for the 2024 heuristic.

### SAT-O1

Historical SAT4D draft:

- SAT4D_LIVE_DRAFT.txt, June 2025 header, byline Nathan McKnight.
- Git blob SHA-1: 2a79fe25018cce7e99a2c33786d88b0551db6ae7.
- The byline does not independently authenticate every embedded equation.

Companion SAT O1 4D.txt:

- Unbylined; file-index date 2025-06-09.
- Git blob SHA-1: 7577aa1ee5a6c3850ce3b226c75377de6367aedc.
- SHA-256: 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937.

Verbatim historical equations:

\[
\gamma^\mu(\lambda)=
(\lambda,\,
A_x\sin(k_x\lambda+\phi_x),\,
A_y\sin(k_y\lambda+\phi_y),\,
A_z\sin(k_z\lambda+\phi_z))
\]

\[
v^\mu(\lambda)=\frac{d\gamma^\mu}{d\lambda},\qquad
S[\gamma]=\int d\lambda\,\mathcal{L}(\gamma^\mu,v^\mu),
\]

\[
\mathcal{L}=\frac12 m v^\mu v_\mu - V_{\mathrm{tension}}(\gamma).
\]

The displayed γ is a one-parameter curve in four-dimensional coordinates. The surrounding worldtube language does not make this equation, by itself, a finite-core four-dimensional support.

### Blockwave

The 2025-09-16 user-supplied attachment event is established, but the embedded content's author and original composition date are unresolved:

- HsH raw conversation: 68c990dd-df28-832e-b766-c267190aaffa.
- Attachment file ID: file-LwaFTKkMemPPrLU4qCLpYB.
- HsH path: DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt.
- Git blob SHA-1: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d.
- SHA-256: 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664.
- Classification: USER_SUPPLIED_ATTACHMENT / EMBEDDED_CONTENT_AUTHORSHIP_UNRESOLVED / NOT_NATHAN_DIRECT.

Verbatim attachment equations:

\[
J^{\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,
\qquad
\nabla_\mu J^{\mu\nu}=0.
\]

Separate conditional normalization observation, not a correction to the original: if \(F_{\rho\sigma}=2\nabla_{[\rho}B_{\sigma]}\), then \(J^{\mu\nu}=\frac12(*F)^{\mu\nu}\) under the chosen metric/orientation convention. This identity does not change the archived equation or establish the attachment's authorship.

## 8. Stable glossary

| Term | Meaning in this source-fidelity pass |
|---|---|
| C | One-dimensional curve in the three-dimensional toy. |
| Π(t) | Moving two-dimensional plane family. |
| I(t) | Set of intersections C∩Π(t); may have multiple branches. |
| p(t) | A selected intersection branch/readout point. |
| s(t) | Curve parameter selected by the moving plane; not source-defined. |
| F(x,t) | Level-set function for the plane family; not source-defined. |
| Γ¹ | Proposed one-dimensional four-dimensional string/filament. |
| Σ³(τ) | Proposed three-dimensional time surface. |
| Λ | Missing 3D-to-4D lift map. |
| ρ | Missing observer/readout projection. |
| W⁴ | Later finite-core worldtube; not identical to Γ¹ without an explicit map. |

## 9. Discrepancy ledger and next cursor

| ID | Discrepancy | Status / requirement |
|---|---|---|
| D1 | Curve shape treated as the sole motion driver. | Preserve the moving plane/surface as a co-participant. |
| D2 | Four-dimensional strings paraphrased as three-dimensional strings. | Restore the 4D carrier / 3D surface type distinction. |
| D3 | Straight/curved shape labels treated as unconditional kinematic laws. | Define plane sweep and parameterization; use the chain-rule map. |
| D4 | “Squiggly → random.” | Requires an explicit stochastic model; otherwise retain as metaphor. |
| D5 | Multiple intersections described as merge/duplicate. | Requires branch tracking and observer projection; does not imply physical genesis. |
| D6 | Static-block and propagating-time-surface descriptions. | Preserve the later clarification that 4D structure interactions generate complexity while the surface provides a 3D readout. |
| D7 | 2024 string identified with 2026 finite-core worldtube. | No source-grounded thickening, section, projection, or composition map recovered. |
| D8 | Euclidean curvature lift treated as source-native. | Existing Lean module is conditional and assistant-derived; no source metric/parameter map is established. |

Next deeper cursor:

1. When Mersearch has a free lane, recover the complete direct-source and assistant-message neighborhood for the general shape-to-kinematics passage; do not submit another request while all four lanes are occupied.
2. Specify the curve γ, plane family F, time parameterization, and selected branch before attempting a Lean proof of the implicit intersection map.
3. State and test the 4D lift Λ and observer projection ρ as separate maps; prove their intersection-preservation/composition conditions rather than inferring them from vocabulary.
4. Keep the 2024 1D string, the SAT-O1 1D curve, the Blockwave rank-two current, and the 2026 finite-core 4D worldtube as distinct objects until an explicit map connects them.
5. No physical calculation, fit, prediction, measurement, CODATA scoring, Factory Floor admission, paper-gate advancement, or BEDROCK promotion is performed by this report.

**Final epistemic status:** the direct 2024 shape-to-kinematics grammar is recoverable as an exploratory geometric heuristic. Its key mathematical content is a moving-intersection readout, not a shape-only law. The historical assistant's later paraphrase loses the four-dimensional carrier type and weakens the role of the moving plane. Existing Lean work verifies selected conditional special cases, but the general map and its 4D lift remain unformalized and physically unvalidated.