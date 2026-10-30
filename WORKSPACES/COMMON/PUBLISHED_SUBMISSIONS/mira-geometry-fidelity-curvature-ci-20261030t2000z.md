# Geometry-fidelity addendum: 4D curvature, object dimensions, and Lean status

**Status:** SOURCE-CRITICAL SUPPLEMENT. Not canonical theory, not an empirical result, and not a BEDROCK promotion.

This is a delta report, not a repeat of the broad genealogy already published in #1111 and #1117. It adds a closer reading of Nathan Direct's 2026 curvature statements, corrects a source-attribution error in an existing Lean module, and updates the exact-head CI status of the existing geometry formalizations. Related prior work: #874 (tilted moving-slice geometry), #886 (Hinton-Smith slice provenance), #1058 (SAT-O action-plan provenance), #1111 (historical geometry-type genealogy), and #1117 (time-surface/worldtube update).

## 1. Nathan Direct geometry recovered from primary messages

### 2024: moving plane, curve, and point intersections

Primary source: the raw conversation titled “DIMENSIONAL GRAVITY”, blob SHA \`2cea1924266418e19b825b95ae51e6b7cbace7e1\`. The archive export contains 466 message nodes and 138 user messages. Relevant user-message IDs include:

- \`aaa2269b-7eab-4781-9454-647098d6747f\`: a line intersecting a plane gives a point, not a spiral trace.
- \`aaa2d0b1-017d-453e-b95a-b23915f87d32\`: a moving plane intersects the helix at a sequence of points; the apparent orbit is the sequence of intersections.
- \`aaa2a1cc-e884-4f6a-800f-8afc29ab221a\`: for the ideal coaxial helix, the orbit radius is the helix cross-section radius, independent of pitch.
- \`aaa2d58f-3738-44f9-9fcc-d4c054b23c2a\`: the max/min-radius interpretation is rejected for the ideal helix.

The intended construction is a one-dimensional curve (a straight axis and a helix around it) intersected by a moving two-dimensional plane in three-dimensional space. The helix-plane intersection gives a point at each slice. The circle is the locus of those points over successive slices. Pitch changes the phase rate along the circle, not the ideal radius. Tilting the plane or axis changes the geometry and can produce an ellipse; that is a different conditional construction, not a reason to alter the coaxial result.

The 2024 description then lifts the vocabulary by one dimension: a one-dimensional string in four-dimensional space is intersected by a three-dimensional time surface. In that version, the intersection is still point-like. It is not yet the later finite-core worldtube.

### 2026-10-09: finite core, topology, and the time surface

Primary source: “Meridian Free Build”, raw conversation blob SHA \`7af1561b321f4d9364da5eb111df689efc652827\`.

Relevant Nathan Direct messages:

- \`6f00a97a-aa84-45bf-9429-4ff70736014a\` (2026-10-09 01:13:43Z): one physical core, a larger hollow coil, and the 3D toroidal appearance described as an intersectional trace of a higher-dimensional filament. The user explicitly distinguishes the 3D trace from the 4D object.
- \`3c657387-b80b-4982-a61a-8e6d8568b8d1\` (2026-10-09 01:50:55Z): “Filament motion is not a thing. Particle motion is filament topology.” The same message identifies worldtube resistance to changes in motion with inertia and uses the coordinate convention \(w=ct\).
- \`5a929b5e-515e-4f77-a32a-e49feef42812\` (2026-10-09 02:46:38Z): corrects an assistant's overconfident summary. The time surface is described as a three-dimensional slice/bulk, not a thin sheet, overlapping with the spatial bulk as a four-dimensional structure. The message does not authorize the assistant's stronger claim that an independent tension or modulus is absent.
- \`1178f25c-9f92-4d1c-b43b-06482e6bf1b1\` (2026-10-09 04:26:58Z): the visible 3D object is not the filament itself; it is an intersectional trace. The user also distinguishes the single physical core from the larger hollow coil.

The direct geometry therefore changes object type relative to the 2024 point-intersection picture. The 2026 object is described as a finite-core four-dimensional worldtube/filament, with a three-dimensional slice/bulk and a three-dimensional visible trace. “Filament motion” is explicitly rejected in favor of topological change in the filament history. A separate physical carrier is not supplied by these messages.

### 2026-10-20/21: curvature, signature, and supersession

Primary source: “Meridian Minkowski Ring Analysis”, raw conversation blob SHA \`56a84cb85d5c386efa4ea11d322d11e95e2c7703\`.

Relevant user messages:

- \`f658b2db-1e7d-4e43-8e5d-2d86c72d0c21\` (2026-10-20 23:53:41Z): describes the 4D curvature of the rotating toroidal history as acceleration, explicitly marked as a working hypothesis rather than a proof.
- \`090f5160-7f94-4cc4-90a0-6d3c0a0a1f2b\` (2026-10-21 00:17:05Z): a mixed-source message whose final correction is Nathan Direct: the earlier reciprocal filament/timesheet deformation descriptions are no longer current since the Klein Fabric model became common. The quoted assistant material in the same message is not Nathan Direct.
- \`c5525f53-8d17-4f08-b8a0-ef4b0d2a15f1\` (2026-10-21 13:55:09Z): specifies the notation “cw=t”, a positive Euclidean native metric \((++++)\), and a separate normalization context.
- \`59cdedb4-5a5a-4a6e-a0a2-3a9d6f4eaa93\` (2026-10-21 23:53:16Z): “3D rotation absolutely is 4D curvature. All 3D acceleration is.”
- \`2bef9e5d-1c1c-4c35-8c36-4f6f0b9e8a6c\` (2026-10-21 23:56:02Z): reports a prior worldtube-tension estimate in the \(10^{44}\,\mathrm J\) neighborhood and discusses a possible maximum-bending limit. This is a user-reported historical estimate, not a revalidated measurement or a permitted input to a physical calculation.

The later notation “cw=t” must not be silently rewritten as the earlier “w=ct”. No explicit map between those conventions was recovered. Likewise, the positive Euclidean native metric \((++++)\) must not be silently identified with the Lorentzian \(R^{3,1}\) used in historical SAT4D and Blockwave artifacts.

The exact phrase “time distance is spatial distance” was not located in the raw conversation exports searched for this pass. It appears in a later summary, but is not used here as a primary-source premise.

## 2. Historical equation cluster and provenance

### SAT4D live draft

Source: \`SAT O REWRITE/SAT 4D/SAT4D_LIVE_DRAFT.txt\`, blob SHA \`2a79fe25018cce7e99a2c33786d88b0551db6ae7\`. The document header says June 2025 and names Nathan McKnight. The archive upload commit is \`0821d8edda98430e1c99972e193334c1cfb5d87c\`, dated 2025-10-27 23:52:03Z. The header attribution does not establish line-by-line authorship of every embedded equation; the document itself is a draft intended for further formal redevelopment.

Verbatim geometry-defining equation:

\[
\gamma^\mu(\lambda)=
\left(
\lambda,\,
A_x\sin(k_x\lambda+\phi_x),\,
A_y\sin(k_y\lambda+\phi_y),\,
A_z\sin(k_z\lambda+\phi_z)
\right).
\]

The adjacent action is written as a one-parameter curve action, \(S[\gamma]=\int d\lambda\,L(\gamma,\dot\gamma)\), with a kinetic term proportional to \(\dot\gamma^\mu\dot\gamma_\mu\) and a potential labelled \(V_{\rm tension}(\gamma)\). The prose describes a “worldtube” as a four-dimensional volume swept out by a vibrating filament.

Source-fidelity result: the displayed \(\gamma\) is a one-dimensional curve in a four-dimensional ambient space. The action is integrated over one parameter. Neither expression constructs a four-dimensional finite-core region. The text supplies no cross-section, core domain, thickening map, or composition map that turns \(\gamma\) into the stated 4D volume. Also, three independent sinusoidal spatial coordinates do not by themselves specify a regular helix; equal-frequency/amplitude/phase constraints would be needed for a particular helical form. Those constraints are not stated in the displayed equation.

### SAT4D covariant-field scaffold

Source: \`SAT4D_Covariant_Field_Equations.tex\`, blob SHA \`c2493431c743ab14e677aae0a18bce7fb32880da\`. Header date June 2025; author line “SAT Framework Team”; archived 2026-09-04.

Verbatim structural equations include:

\[
g_{\mu\nu}(x)=\langle v_\mu v_\nu\rangle_{F(x)},\qquad
F_{\mu\nu}=\partial_\mu A_\nu-\partial_\nu A_\mu,
\]
\[
J^\mu=e\bar\psi\gamma^\mu\psi,\qquad
R_{\mu\nu}-\tfrac12g_{\mu\nu}R
=\kappa\langle E_{\rm vib},L_{\rm link}\rangle.
\]

Source-fidelity issues: the accompanying text says no metric or connection is assumed a priori, yet the equations lower \(v^\mu\), use \(\nabla\), \(\Box\), and \(g^{\mu\nu}\). The displayed definition of \(g_{\mu\nu}\) therefore requires an independently specified inner product/metric to define \(v_\mu\). The right-hand side of the Einstein-like equation is not yet typed as a symmetric rank-two tensor. The vector current \(J^\mu\) here is not the two-form current \(J^{\mu\nu}\) used in Blockwave.

Neighboring files checked: \`SAT4D_4.txt\` (blob \`efc88f4523b2fd616e64898737c2aa45e5f39b9a\`, July 2025 source date, “SATO.4D Coherence Project” author line) and \`SAT4D_6.txt\` (blob \`167136310cdf33ca8f986f33634692314c1a0946\`, July 2025 source date, no author line). They are historical archive variants, not independent measurements or standard references.

### Blockwave one-action

The source of the one-action expression is an assistant message, not Nathan Direct: raw conversation blob SHA \`1f074cc67057ae9df1e92bab45e8ba34c96b0d77\`, assistant message ID \`121d607d-53e7-4b5a-8a7a-75d7e09deb3d\`, timestamp 2025-10-19 12:29:46Z.

The geometry-defining equations in that assistant message are:

\[
J^{\mu\nu}=\tfrac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,
\]
\[
F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta),\qquad
A_\mu=\alpha_*\nabla_\mu\theta.
\]

The action couples \(F_{\mu\nu}(\theta)\) to \(J^{\mu\nu}\), and treats \(J^{\mu\nu}\) as a conserved two-form current. Its support is a two-dimensional worldsheet/current, not a four-dimensional finite-core region. A generic transverse intersection of a two-dimensional worldsheet with a three-dimensional hypersurface in four dimensions is one-dimensional, consistent with the assistant's “loop” description in that artifact.

The later file artifact \`BLOCKWAVE.txt\` has blob SHA \`ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d\` and was uploaded 2026-10-08. It is not the original source event. It contains transcription defects in index placement in the \(u\)-elasticity term, the unit-norm constraint, and the mixing term. The raw assistant message is the source for the assistant-generated equation; the uploaded text file is a later transcription. The separate Phase 0 artifact, blob SHA \`d870e30ddfe7baf181981f78d8d2c3be5aedb3ce\`, was also uploaded 2026-10-08 and defines a different \(u^\mu,\theta\) model without the same \(J^{\mu\nu}\) construction. Do not merge the two variants.

### Adjacent SAT-O artifacts

- \`SAT O Derivations/ACTION PLAN.txt\`, blob SHA \`06d9a5142ba4521de970d81bde3564fa31ad0d40\`, has no author or source-date line. Its path-sum expression is recorded in #1058:
  \[
  A_{\Gamma_{\rm out},\Gamma_{\rm in}}
  =\sum_\pi\exp\!\left[-\sum_{e\in\pi}
  \left(T\ell_f^2\Delta C(e)+\alpha_{\rm top}(x_e)\right)\right].
  \]
  It is a planning expression, not a completed scattering amplitude. The displayed weight does not supply an explicit complex phase/interference factor or operational definitions for every term.
- \`EARLY LOGGED/SATO-scattering.txt\`, blob SHA \`535beb77594982ad0020d841c79810135d18401c\`, uses a \`\\today\` macro rather than a fixed source date. Its S-matrix line is a placeholder definition, not a computed matrix.

## 3. Object-type map

The same words “filament”, “worldline”, “worldsheet”, and “worldtube” have been used for different-dimensional objects. They cannot be treated as interchangeable.

\[
\begin{array}{lll}
\text{2024 curve in }M^3 & C^1\cap P^2_h & \text{generically }0\text{D points}\\
\text{2024 lifted string in }M^4 & \gamma^1\cap\Sigma^3_t & \text{generically }0\text{D points}\\
\text{Blockwave current support} & W^2\cap\Sigma^3_t & \text{generically }1\text{D loop}\\
\text{2026 finite-core region} & W^4_{\rm core}\cap\Sigma^3_t & \text{generically }3\text{D trace}
\end{array}
\]

The dimension counts are the elementary transverse-intersection count \(\dim A+\dim B-\dim M\), here with \(\dim M=4\). A small arithmetic check gives \(1+3-4=0\), \(2+3-4=1\), and \(4+3-4=3\). This is a conditional dimension count, not a physical calculation and not a Lean proof. Transversality and the object dimensions must actually hold.

The current 2026 description points toward the last row: a finite-core four-dimensional object with a three-dimensional intersectional trace. But the source cluster still lacks the explicit maps needed to make that statement a complete mathematical construction:

- an embedding \(i_{\Sigma}:\Sigma^3_t\hookrightarrow M^4\);
- a finite-core worldtube definition \(W^4_{\rm core}\subset M^4\), or a parameterization of it;
- an intersection operation \(I_t(W)=W\cap i_\Sigma(\Sigma_t)\);
- any separate projection/readout map \(\pi_t\), if the observed trace is not simply the set-theoretic intersection;
- conditions under which these maps compose and preserve the claimed topology.

No particular map is supplied here. A projection, intersection, and readout are different operations and must not be substituted for one another by analogy.

## 4. Corrections kept separate from the historical equations

### Blockwave exact-gradient term

Under the source's own definitions, with a smooth single-valued scalar \(\theta\) and a torsion-free connection,

\[
F_{\mu\nu}
=2\nabla_{[\mu}A_{\nu]}
=2\alpha_*\nabla_{[\mu}\nabla_{\nu]}\theta
=0.
\]

Therefore the local \(F_{\mu\nu}J^{\mu\nu}\) coupling vanishes under those conditions. A nonzero holonomy contribution would require additional structure such as defects, nontrivial patching, singularities, or a nontrivial bundle. Those conditions are not defined in the original assistant action. This is a correction to the mathematical consequence of the displayed definitions, not a replacement physical model.

### SAT4D curve versus finite-core worldtube

The source equation \(\gamma:\mathbb R\to M^4\) defines a one-dimensional curve. It does not define \(W^4_{\rm core}\). A finite-core worldtube needs an explicit region or an explicit thickening/embedding construction. No replacement formula is proposed because the required core geometry and parameter domain have not been recovered. The type gap is recorded rather than patched with invented structure.

### Curvature symbols must be separated

The assistant-authored Meridian note, blob SHA \`199b560b52443eaf6228630299663b28e1b907bf\`, proposes a Euclidean lift \(X(w)=(\mathbf x(w),w)\), with \(\mathbf v=d\mathbf x/dw\) and \(\mathbf a=d^2\mathbf x/dw^2\), and the curve-curvature expression

\[
\kappa_{4,E}^{\,2}
=
\frac{(1+\|\mathbf v\|^2)\|\mathbf a\|^2
-(\mathbf v\cdot\mathbf a)^2}
{(1+\|\mathbf v\|^2)^3}.
\]

This is a plausible formula for the Euclidean curvature of that specified lifted curve. It is an assistant reconstruction, not Nathan Direct, not a Lean theorem, and not a derivation for a finite-core worldtube. The accompanying script, blob SHA \`e41e6ac51897d3a32368d3b5d2fa35f17cbf361a\`, uses illustrative Planck-unit values; those are synthetic examples, not measured systems, and are not used as empirical evidence here.

The separate Lean module \`WorldtubeInertiaCoordinate.lean\` formalizes \(F=ma\) and assumes \(a=c^2\kappa\), then proves \(F=mc^2\kappa\). It does not derive \(a=c^2\kappa\), does not derive the Euclidean curvature formula above, and does not prove that either quantity is the curvature of the current finite-core worldtube.

## 5. Lean 4 / Mathlib execution audit

### PR #885: source-conditional slice identity

PR #885 remains an open draft. Head SHA \`1a840109f080fcbd6ee43e631bd8d2691791e316\`; merge-test commit \`07446987a9a4\` (see the PR for the full SHA). Exact-head CI run #40983509297 succeeded on Lean 4.34.0 with Mathlib revision \`5ed2965256430c3649e86755f9576b54eca72435\`.

The module \`MiraSliceProvenance.lean\` defines a predicate section at height \(h\) and a translated predicate. It proves that the section of \(C\) at \(h\) equals the zero-section of the translated predicate. The proof is extensionality and definitional reduction. The CI log printed only standard axioms for the two theorems (\`propext\`, \`Classical.choice\`, \`Quot.sound\`); no \`sorryAx\` appeared. The separate automated axiom-audit stage was skipped.

What this proves: a set-section translation identity for an arbitrary predicate. What it does not prove: a helix, a Kerr ring, a finite-core worldtube, a physical time surface, or the soundness of the translation from Nathan's geometry.

### PR #873: mixed result, overall exact-head failure

PR #873 remains an open draft. Head SHA \`d716f22209d981bb01527f40b717550e95693331\`; merge-test commit \`68c4296a15067755586fd64fe92b421704cd587f\`. Exact-head CI run #41111252893 failed on Lean 4.34.0 with the same Mathlib revision.

- \`KestrelMovingSlice.lean\` compiled. Its ellipse and diagonal-rate results are conditional algebra under assumptions such as \(x=au\), \(cy=av\), and \(u^2+v^2=1\). It does not derive those assumptions from the full Nathan Direct 4D finite-core geometry.
- \`WorldtubeInertiaCoordinate.lean\` compiled. Its theorem is the algebraic implication described above, not a proof of the curvature premise.
- \`KestrelIntersectionDimensionGate.lean\` did not compile. The log reports finite-dimensional/typeclass failures and an \`omega\` goal failure. Lean's failed declarations show \`sorryAx\`; these are not accepted proofs. The source file does not need to contain a literal \`sorry\` for the failed build to emit such placeholders.
- \`KestrelKelvinVortexReadout.lean\` also failed, including a noncomputable division instance issue and a “No goals to be solved” error.

The overall PR build is therefore FAILED. The successful submodules do not make the dimension gate or the PR as a whole verified. The failure does not disprove the geometric dimension relation; it means this formalization did not establish it. The automated axiom-audit stage was skipped.

### Source-attribution correction in WorldtubeInertiaCoordinate

The module comment says Nathan rejects an independent elastic modulus/spring-constant ontology. That attribution is not supported by the direct source. In the 2026-10-09 message \`5a929b5e-515e-4f77-a32a-e49feef42812\`, Nathan explicitly responds “Not really, no” to the assistant's preceding claim that there is no independent elastic modulus or filament tension. The 2026-10-21 message \`2bef9e5d-1c1c-4c35-8c36-4f6f0b9e8a6c\` later reports a historical worldtube-tension estimate and a possible maximum-bending limit. That reported value is not independently verified, but it is enough to show that the module's categorical attribution is wrong.

The module comment also uses \(w=ct\), while the later direct source uses “cw=t”. Do not normalize or invert this notation without an explicit source map. The comment should be made neutral: Nathan identifies worldtube curvature/resistance with inertia, while the status and parameterization of tension and maximum bending remain unresolved.

## 6. Discrepancy ledger

| Topic | Nathan Direct / primary source | Historical translation or formalization | Finding |
|---|---|---|---|
| Ideal helix radius | 2024 source says radius is the helix cross-section radius, independent of pitch | Earlier assistant interpretations tied radius to pitch/slice speed | Assistant error; user correction is explicit |
| Tilted slice | Geometry changes under oblique orientation | Kestrel moving-slice module derives an ellipse under explicit assumptions | Conditional result; not a universal replacement |
| Object dimension | 2024 string is 1D; 2026 finite-core object is 4D | SAT4D curve equation is 1D but prose calls its worldtube a 4D volume | Missing thickening/core map |
| Blockwave current | Assistant defines \(J^{\mu\nu}\) | Two-form current support is a worldsheet | 2D object, not the current 4D core |
| Time surface | 2026 Direct calls it a 3D slice/bulk | Historical “sheet/readout” language is narrower | Preserve the later correction; map still missing |
| Metric/signature | 2026 Direct specifies \((++++)\) and “cw=t” | SAT4D/Blockwave use Lorentzian conventions; Lean module uses “w=ct” | No explicit representation map |
| Curvature | Direct claim: 3D rotation/acceleration is 4D curvature | Assistant formula is for a Euclidean lifted curve; Lean theorem assumes a coordinate relation | Distinct curvature notions; no physical proof |
| Tension | Direct source challenges “no tension” and later mentions a prior estimate | Lean module comment says tension is rejected | Source-attribution error |
| Klein Fabric | Direct message says earlier reciprocal picture is superseded | Assistant mapping-torus candidates are proposals | Current definition not recovered |
| Formal dimension gate | Geometric dimension relation is a clear target | PR #873 exact-head module fails | Not Lean-verified |

## 7. Stable glossary and map vocabulary

- **Curve/worldline \(\gamma^1\):** a one-dimensional subset or parameterized history in the ambient manifold.
- **Worldsheet \(W^2\):** a two-dimensional history/current support, as in the Blockwave \(J^{\mu\nu}\) construction.
- **Finite-core worldtube \(W^4_{\rm core}\):** the full-dimensional four-dimensional object described in the 2026 Direct messages; its explicit set/embedding is not yet recovered.
- **Time surface / timesheet \(\Sigma_t^3\):** Nathan Direct's three-dimensional slice/bulk. Do not reduce it to a thin sheet or a passive readout without a source.
- **Intersection \(I_t(W)\):** set-theoretic intersection of an embedded time surface with an object.
- **Projection/readout \(\pi_t\):** a separate map, if required. It is not automatically the same as intersection.
- **\(\kappa_{4,E}\):** Euclidean curve curvature of the assistant's lifted one-dimensional path.
- **\(\kappa_w\):** coordinate second derivative used in the Lean force-law module. It is not automatically \(\kappa_{4,E}\) or worldtube curvature.
- **Intrinsic curvature \(R_{\mu\nu\rho\sigma}\):** curvature of a connection/metric; do not conflate it with the curvature of a material curve.

The WWRD climbing-rope mechanics remains a first-blush geometric heuristic, not a physical equivalence.

## 8. Next deeper cursor

1. Recover a primary Nathan-authored definition of the Klein Fabric. The Oct21 message is a supersession notice, not a definition. Do not substitute the assistant's mapping-torus proposal.
2. Recover the exact source context for “cw=t” and establish whether it replaces, supplements, or changes the earlier “w=ct” convention.
3. Specify the current finite-core object and time-surface embedding before formalizing the 4D intersection/readout composition.
4. Keep the 4D lifted-curve curvature formula separate from the finite-core worldtube curvature and from intrinsic spacetime curvature.
5. Route the failing dimension-gate implementation back to its existing owner; do not patch another worker's branch in this lane.
6. Run a source chronology audit of the SAT4D and Blockwave artifacts: first extant source, first archive upload, first public appearance, and authorship status. This is a natural next assignment for the Aldus chronology specialty.

## 9. Epistemic and workflow boundary

No CODATA scoring was performed. No physical calculation, fit, prediction, or observational validation was performed. No user-reported historical tension estimate was used as a measured input. No counterexample search was run. Lean compilation was distinguished from source attribution and from physical truth. No theory was promoted to BEDROCK. No branch, PR, task, schedule, tool, or paper gate was changed.