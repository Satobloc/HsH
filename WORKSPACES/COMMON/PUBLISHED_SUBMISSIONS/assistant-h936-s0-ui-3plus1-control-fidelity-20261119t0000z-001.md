# UI 3+1 control-count addendum: marked-point orbit and full-frame lift

**Status:** ADDITIVE SOURCE-FIDELITY ANALYSIS. This supplements the existing Universal Indicatrix source-to-implementation audit in [issue #1905](https://github.com/Satobloc/HsH/issues/1905). It is not a duplicate of that audit and does not promote a physical theory.

## 1. New source surface and provenance boundary

The raw role-tagged Switching to English conversation (conversation ID 69ab6f13-b8f8-832e-8d71-528c15e11037, raw Git blob dfdaec331846087af7daf0008eba431520a5b9ad) contains direct user-role geometry:

- Message a27ac504-8a09-4a2e-9de8-fc4c5cf05680, 2026-03-07 09:08:47.520Z: a four-dimensional orthogonal grid, a unit hypersphere fixed to it, and a second identical grid/hypersphere superimposed and free to rotate and expand or contract. A marked point on the two setups is used to trace a path on the hypersphere surface.
- Message 8270405c-912d-4c88-a00f-32ad909cd83e: a second construction involving curves on the surface and in the interior, inward/outward projection, hemisphere constraints, intersection/bisection, and a common origin.
- Message 1d6e1ab3-7c21-4765-a5b2-17276da1a749, 2026-03-07 10:42:41.963Z: solids of rotation of a ray, with axes and diameters varied.
- Message 932e7f79-cb43-41db-af14-db66ffefb4c5, 2026-03-07 11:05:14.817Z: a proposed shortest-route/derivation method for transformations between equations, with neutral assessment before derivation and empirical matching.

A separate two-page document titled **Universal Indicatrix in my words CHARACTERIZATION (Nolat).pdf** adds the explicit control count: **three rotation axes and one scaling axis**. Its extracted text also says the four axes are spacelike, scaling is linear time expansion, rotations are restricted to small harmonics, and ray rotations generate candidate geometric shapes. It compares the construction to the optical indicatrix and Moiré patterns, explicitly as analogies.

The source PDF SHA-256 recorded in the corpus-intake record is ad920fa43badd060d10cc05ee7de2c47d933d0fab094fbac14f49d91eacae21a. Its extracted-text artifact is Git blob a1707dffe3502d507bc405d4087a3476fc1d6cce at [the SAT archive extraction](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/Universal%20Indicatrix%20in%20my%20words%20CHARACTERIZATION%20(Nolat).txt). The PDF describes itself as a transcription of text from supplied images; the original notebook/page images are not embedded in the recovered PDF, so the transcription has not been visually checked against those images. The PDF's exact creation date and the authorship of every transcribed line are not independently established. The raw chat independently confirms the core two-grid/marked-point construction, but not every extra control detail in the PDF.

This addendum therefore treats the PDF as a user-supplied characterization artifact, not as a raw role-tagged message.

## 2. Source geometry, kept distinct

The strongest source-grounded description is:

1. Four orthogonal spacelike axes define a four-dimensional Euclidean-looking coordinate scaffold and a unit hypersphere.
2. A second coincident grid/hypersphere is allowed to rotate about the origin and to scale.
3. A marked point is associated with each setup. Relative rotation moves the marked point on the hypersphere surface; scaling is used to represent time or expansion.
4. The characterization document summarizes the controls as three rotation axes plus one scaling axis, with small-harmonic rotation and linear scale expansion.
5. A separate surface/interior curve construction introduces hemisphere constraints and a common origin. Its projection, bisection, and attachment-point maps are not specified.
6. A ray is proposed as the generator for solids of rotation. The sweep operator and output dimension are not defined.
7. Optical indicatrix and Moiré patterns are analogies, not asserted identities.

The phrase “any path” is stronger than the specified control restrictions warrant. With a bounded or otherwise restricted harmonic family and a fixed linear scale law, universal path representation requires a defined admissible path class and an approximation or exactness theorem. Neither is supplied.

## 3. Typed reconciliation: three point controls versus six frame controls

Let \(S^3\) be the unit 3-sphere in Euclidean \(\mathbb R^4\), and let \(x_0\in S^3\) be one marked point.

The full orientation group \(SO(4)\) has dimension
\[
\dim SO(4)=\frac{4(4-1)}{2}=6.
\]

Its action on a single unit vector is transitive. The stabilizer of \(x_0\), consisting of rotations that leave that point fixed, is isomorphic to \(SO(3)\), with dimension 3. Therefore the point-orbit space is
\[
SO(4)/SO(3)\cong S^3.
\]

This gives a precise conditional reading of the source's control count:

- Three independent local rotational coordinates are sufficient to specify the direction of one marked point on \(S^3\).
- Six rotational degrees of freedom specify a complete four-dimensional frame.
- The additional three frame degrees are invisible to that one-point readout because they lie in its \(SO(3)\) stabilizer.
- A radial scale adds one further coordinate.

A useful assistant reconstruction is
\[
u(t)=R(t)x_0,\qquad y(t)=r(t)u(t),
\]
with \(R(t)\in SO(4)\), \(u(t)\in S^3\), and \(r(t)\geq 0\). This is a candidate point-trajectory map, not a verbatim Nathan Direct equation.

It does **not** by itself encode the full two-setup construction. The direct description also refers to a fixed and a moving marked point, a common ray through the origin, and their relative separation. A second map is needed to represent that pair or its crossbar. The single-point formula omits it.

At \(r=0\), direction and frame orientation become unobservable: every \(R\) maps the marked point to the origin. Any inverse reconstruction must treat this as a singular or non-identifiable case.

The source's three-rotation-plus-scale description is therefore consistent with a marked-point orbit, while a six-plane \(SO(4)\) representation is consistent with a full-frame lift. The exact map from the source's three named controls to a particular quotient chart is still undefined. Three local controls do not automatically provide a single global smooth coordinate chart.

## 4. Existing implementation crosswalk

The existing HsH code already separates these two representational levels:

- [ui_mapper_basic.py](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/SOLVER_HARNESS/UI_MAPPER/ui_mapper_basic.py) chooses a deterministic minimal-plane rotation for a marked-point direction and explicitly leaves the \(SO(3)\) stabilizer freedom unobservable. It also separates a Minkowski-input calibration layer from Euclidean \(\mathbb R^4\) normalization. That normalization is a chosen representation map, not a Lorentz-isometry claim.
- [ui4d.py](https://github.com/Satobloc/HsH/blob/main/tools/whirligig_rq/ui4d.py) supplies six-plane \(SO(4)\) generators and a full-frame lift. Its equatorial \(S^2\)-to-\(S^3\) embedding is a reduced input construction, not the complete double-hypersphere/ray model.

The code does not currently encode the PDF's small-harmonic restriction or enforce the linear scale-time law. Nor does it supply the fixed/moving point-pair map or the general ray-sweep operator. No code change was made.

## 5. Proof evidence and limits

The existing [PR #262](https://github.com/Satobloc/HsH/pull/262) contains UIRadialAngularIdentity.lean. At exact PR head 368f9af8d95d061b4581688759ed3eda309e9886, its verify job in [Actions run #43948452979](https://github.com/Satobloc/HsH/actions/runs/43948452979), job 133584241306, successfully checked out the exact head and compiled the formal library. The overall merge-group run is marked failure, so the bounded claim is that the target verification job and module built, not that the entire merge-group workflow succeeded.

The theorem proves the conditional four-coordinate identity
\[
\sum_i(\dot q\,u_i+q\,\dot u_i)^2
=\dot q^{\,2}+q^2\sum_i\dot u_i^{\,2},
\]
given \(\sum_i u_i^2=1\) and \(\sum_i u_i\dot u_i=0\). It does not prove that the source's scale is physical time, that the direct three controls define this chart, or that any observed system follows the model.

[PR #752](https://github.com/Satobloc/HsH/pull/752) separately contains an abstract stabilizer/non-identifiability result. Its exact-head verification run [#40521496151](https://github.com/Satobloc/HsH/actions/runs/40521496151) succeeded. That result supports the distinction between a full-frame lift and a one-point readout; it is not a formal proof of the specific \(SO(4)/SO(3)\cong S^3\) source translation.

Lean, Lake, and Elan are not installed in the present execution environment. No new Lean theorem or local run was performed. Existing CI evidence is reused with its scope stated.

## 6. Separate mathematical corrections to assistant reconstructions

These are corrections to historical assistant-produced mathematics, not edits to the direct source or to SAT-O1/Blockwave originals.

**Group identity.** The unqualified statement \(SO(4)\cong SU(2)_L\times SU(2)_R\) in the unbylined SAT MATH - BACKBONE synthesis is incorrect. The standard relationship is
\[
Spin(4)\cong SU(2)\times SU(2),\qquad
SO(4)\cong (SU(2)\times SU(2))/\mathbb Z_2.
\]
The direct UI characterization does not itself make an \(SU(2)\) or weak-interaction identification.

**Polar metric.** For the conditional Euclidean point map \(y=r\,u\), \(u\in S^3\), the induced radial/angular line element is
\[
ds^2=dr^2+r^2\,ds^2_{S^3}.
\]
This is consistent with the radial/angular speed identity already compiled in PR #262. It is not the same as an unweighted \((\Delta r)^2+\|\Delta\Omega\|^2\) cost. Neither expression defines a “shortest derivation” metric until the space of representations, admissible transformations, units, and weights are specified.

**Rotation integral.** The following are different spaces and measures: the surface \(S^3\), its enclosed 4-ball \(B^4\), and the six-dimensional group \(SO(4)\). An integral over one is not automatically an integral over another, and none is automatically a path integral over histories. A measure and, for a weighted path integral, an action must be defined.

## 7. SAT-O1 and Blockwave source custody, kept separate

**SAT-O1 text module:** [SATOBLOC/SAT O1 4D.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT%20O1%204D.txt), Git blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc, previously source-custodied SHA-256 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937. The text is unbylined; archive index dates are June 7/9, 2025. Its curve/action are:
\[
\gamma^\mu(\lambda)=
(\lambda,A_x\sin(k_x\lambda+\phi_x),
A_y\sin(k_y\lambda+\phi_y),
A_z\sin(k_z\lambda+\phi_z)),
\]
\[
S[\gamma]=\int d\lambda\,L,\qquad
L=\frac12 mv^\mu v_\mu-V_{\rm tension}(\gamma).
\]
This source uses \(R^{3,1}\), with the first coordinate serving as time. It is not the same typed geometry as four spacelike UI axes plus scale-time. A separate June 2025 .tex variant, bylined “SATO.4D Coherence Project,” is a distinct artifact and must not be merged into this text module.

**Blockwave:** the 2025-09-13 raw “Blockwave Theory overview” export lists attachments named BLOCKWAVE THEORY.txt and FUNDAMENTAL INTUITIONS.txt, but their equation bytes were not recovered from that raw export. The later HsH artifact [SAT—Blockwave Ideal Model.txt](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT%E2%80%94Blockwave%20Ideal%20Model.txt) has Git blob dd0631bc0b25c951dc5e1d6738280e08487b46b2, no in-file byline/date, and first extant HsH commit 2026-10-08. Its byte identity to either original attachment is unverified. Its available text contains a Lorentzian \(g_{\mu\nu}\), a unit timelike vector \(u^\mu u_\mu=-1\), and the proposed action
\[
\begin{aligned}
\mathcal L_{\min}={}&\frac{M_P^2}{2}R+\lambda(u^\mu u_\mu+1)
+\frac{\rho}{2}(\nabla_\mu u_\nu)(\nabla^\mu u^\nu)
+\frac{f^2}{2}\partial_\mu\theta\partial^\mu\theta-\mu^4(1-\cos\theta)\\
&+\frac{\alpha_1}{M_*^2}[(\nabla u)^2][(\partial\theta)^2]
+\frac{\alpha_2}{M_*^2}(\nabla_\mu u_\nu)\partial^\mu\theta\partial^\nu\theta
+\frac{\beta}{M_*^2}[(\partial\theta)^2]^2.
\end{aligned}
\]
It is preserved as a separate archival artifact, not authenticated Nathan Direct mathematics.

The separate assistant-generated [🧱BLOCKWAVE.txt clean-action artifact](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/%F0%9F%A7%B1BLOCKWAVE.txt) comes from the 2025-10-19 “Full action definitions” conversation, assistant message prefix 121d607d, 12:29:46.538Z. Its Git blob is ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d, previously source-custodied SHA-256 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664. Its rank-two current includes \(J^{\mu\nu}\) and \(\nabla_\mu J^{\mu\nu}=0\). It is not a direct source equation.

No SAT-O1 or Blockwave original was edited or corrected in this pass. The UI's Euclidean four-spacelike-axis construction, SAT-O1's \(R^{3,1}\) curve, and Blockwave's Lorentzian field model remain separate typed objects. No conversion or equivalence map has been established.

## 8. Symmetric fidelity assessment

**Direct-source strengths:** the two-setup/marked-point construction, four spacelike axes, three-plus-one control summary, linear scale proposal, small-harmonic restriction, and separation of neutral assessment, derivation, and empirical matching provide a useful representational scaffold.

**Direct-source gaps:** “any path” and “all shapes” are not established under the stated restrictions. The double-sphere point-pair, ray coincidence, sweep, harmonic family, scale-time map, integration measure, and metric signature remain underdefined. The optical and Moiré comparisons remain analogies.

**Assistant strengths:** the \(y=rRx_0\) point-map skeleton and the split between a minimal point representative and a full \(SO(4)\) frame are useful conditional reconstructions. Existing code and Lean work already preserve part of that distinction.

**Assistant mismatches:** historical drafts promote a point-path representation into a spacetime worldline or physical dynamics without a typed map; omit the fixed/moving point-pair; substitute six frame controls for the source's three point controls without explaining the stabilizer; and add \(SU(2)\), holonomy, and physical interpretations beyond the direct geometry. The “shortest derivation” cost is not source-defined.

## 9. Next deeper cursor

Recover the original page images or the underlying source notes. Then define, separately:

1. the three rotational control coordinates and their chart/quotient relation to \(SO(4)\);
2. the fixed/moving marked-point and ray-coincidence map;
3. the linear scale-time law and its units;
4. the allowed harmonic family and a precise universality/approximation claim;
5. the ray-sweep operator and output dimension;
6. the measure for any rotation integral;
7. the representation-space metric for shortest derivations.

Formalize the source-defined quotient and map conditions only after those objects are specified. No physical calculation is warranted without a measured system, provenance, units, uncertainties, and a prediction/fitting separation.

**Final disposition:** ADDITIVE_SOURCE_FIDELITY / PDF_CONTROL_COUNT_RECOVERED / 3_POINT_CONTROLS_VS_6_FRAME_DOF_TYPED / EXISTING_LEAN_EVIDENCE_REUSED / SOURCE_MAP_PARTIAL / NO_PHYSICAL / NO_CODATA / NO_THEORY_PROMOTION.
