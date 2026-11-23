# H1047:s0 | Geometry fidelity across filament, timesheet, worldsheet, and Rotoexpando

**Scope:** bounded source-fidelity comparison. This is not a physical validation, not a fit, not a paper submission, and not a theory promotion.

## Source strata and attribution

**Nathan Direct, 22 March 2024.** The early geometry describes a one-dimensional filament in a four-dimensional arena and a moving three-dimensional time surface. Their transverse intersection is intended as a point-like readout. The earlier three-dimensional toy model uses a line, a helix, and a moving plane: the helix's readout radius is independent of pitch, while pitch and slice speed affect the rate of traversal. The later direct messages say the time surface is a manifestation of filament-interaction complexity, not its cause. Spherical expansion is presented as optional geometry, not an established ontology.

**Nathan Direct, 1 October 2026.** General relativity and string theory are described as orthogonal, with a generative intersection. GR is proposed as importable into a Minkowski geometric grammar; QM is proposed to emerge from GR-mirror timesheet and filament dynamics. These are direct propositions, but the source does not define an inner product, a common ambient category, a commutator, or the maps needed to derive the proposed emergence.

**Rotoexpando Geometry: Definitions and Characterization, 11 September 2026.** A coauthored geometry manuscript under the byline Nathan McKnight and collaborators explicitly presents itself as pure geometry, without asserting that a particular physical system is governed by it. It proposes a family of representations: ordered point pair, oriented affine segment, screw or helix, framed sphere, phase oscillator, and toroidal winding. Its own mathematical program still leaves the exact nested-helix-to-framed-sphere map and lossless conversion to be defined and verified.

**Historical assistant reconstruction, 1 October 2026.** An assistant-generated “Orthogonal Furnace” packet translates the GR/string-theory statements into a set intersection, inner-product orthogonality, a nonzero commutator, a thickened finite-radius worldtube, and a collapse/readout functional. Those are assistant additions, not Nathan Direct definitions.

## Stable glossary

- **Filament / centerline:** the direct-source one-dimensional curve in four dimensions.
- **Timesheet / time surface:** the direct-source three-dimensional hypersurface or wavefront in four dimensions.
- **Worldsheet:** a two-dimensional surface, as encoded by the Blockwave two-form current.
- **Worldtube:** a finite-radius tubular support around a centerline. In four dimensions, a one-dimensional centerline requires three-dimensional normal fibers for a four-dimensional tube.
- **Readout:** an explicit map from an intersection or support region to an observable point, loop, or region.
- **Framed sphere:** center, radius, and frame data. A bare sphere cannot retain a marked frame's relative orientation.
- **Hagalaz map:** the Rotoexpando manuscript's framed-sphere similarity map, of the form (x mapsto c_j + \sigma Q(x-c_i)), with positive scale and an orientation-preserving orthogonal frame map.
- **Rotoexpando:** a proposed Euclidean geometric representation family, not a physical theory.

## Dimension map

For transverse intersections in a four-dimensional ambient space:

| Objects | Generic intersection dimension |
|---|---:|
| 1D filament and 3D timesheet | 0D point |
| 2D worldsheet and 3D timesheet | 1D loop |
| 3D swept surface and 3D timesheet | 2D surface |
| 4D finite-core tube and 3D timesheet | 3D region |

These are different geometric objects. Moving between them requires an explicit thickening, projection, and readout map.

## Historical equation custody

### SAT-O1, original preserved

Source: [SAT O1 4D.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT%20O1%204D.txt).

The unbylined file gives
[
\gamma^\mu(\lambda)=\left(\lambda,
A_x\sin(k_x\lambda+\phi_x),
A_y\sin(k_y\lambda+\phi_y),
A_z\sin(k_z\lambda+\phi_z)\right),
]
[
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),
\qquad
L=\frac12 m v^\mu v_\mu-V_{\mathrm{tension}}(\gamma),
\qquad
v^\mu=\frac{d\gamma^\mu}{d\lambda}.
]

Custody: file-index last-write metadata 9 June 2025 18:44:50; file-index creation 26 October 2025 19:12:34; first extant Git path commit 27 October 2025 00:40:28Z. Git blob SHA-1: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`. UTF-8 SHA-256: `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`.

### Blockwave, original preserved

Source: [Blockwave attachment text](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/%F0%9F%A7%B1BLOCKWAVE.txt).

The assistant-voiced attachment, whose equation authorship remains unresolved, defines a conserved two-form “filament worldsheet” current (J^{\mu\nu}), with (\nabla_\mu J^{\mu\nu}=0), and uses
[
A_\mu=\alpha_*\nabla_\mu\theta,
\qquad
F_{\mu\nu}=\nabla_{[\mu}A_{\nu]},
\qquad
\oint_\gamma A_\mu dx^\mu\in2\pi\mathbb Z.
]
Its action includes the holonomy coupling (\tfrac{g_h}{2}F_{\mu\nu}J^{\mu\nu}), alongside GR, compact-phase, time-flow, and current-kernel terms.

Custody: attachment node timestamp 16 September 2025 16:31:26.687Z; a later file-search retrieval record is timestamped 16:31:34.670358Z. These are distinct events. Attachment file ID: `file-LwaFTKkMemPPrLU4qCLpYB`. Git blob SHA-1: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`. UTF-8 SHA-256: `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`.

Neither original file was edited or normalized. Corrections and missing conditions are recorded separately.

## Formalized equivalence

The Rotoexpando point-pair relation is
[
L_{P,Q}(u)=P+u(Q-P),\qquad u\in[0,1].
]
The endpoint map (E(L)=(L(0),L(1))) satisfies
[
E(L_{P,Q})=(P,Q).
]
Thus the ordered endpoint pair is recoverable from the parameterized oriented affine segment, and the point-pair-to-segment map is injective on its affine-segment image.

This was added to the existing [Nadir Rotoexpando formalization PR #1189](https://github.com/Satobloc/HsH/pull/1189), rather than creating a new PR or tool. The current draft-branch head is `56a367b05ef92e5d740641740d432820b63be669`. Lean 4.34.0 / Lake 5.0.0 compiled the formal library successfully in 8,961 jobs in [run #45208539912](https://github.com/Satobloc/HsH/actions/runs/45208539912). The source-checkout identity step passed.

The two new theorem-specific axiom reports list `propext`, `Classical.choice`, and `Quot.sound`. The module contains no explicit `sorry` or `admit`. Tests, lint, nanoda, and the global axiom audit were skipped. PR #1189 remains draft, open, unmerged, based on a research branch rather than main, and without independent review. This proof establishes only the formalized affine encoding, not the physical interpretation or the remaining representation chain.

The existing PR module also formalizes the framed-sphere similarity composition and shows that an augmented atlas view can be injective while a bare UI projection loses varying metadata. That is a conditional data-contract result, not proof of the complete nested-helix-to-framed-sphere conversion.

## Discrepancy ledger

1. “Orthogonal” in Nathan Direct is not defined as an inner product. The assistant's (\langle G,S\rangle=0) and nonzero commutator add untyped mathematical structure.
2. A literal set intersection (\mathcal T_{GR}\cap\mathcal F_{ST}) requires a common ambient space and embeddings that are not supplied.
3. The assistant's finite-radius map (F^A(\lambda,\rho,\phi)) has three parameters. It describes at most a three-dimensional swept object, not a four-dimensional tube around a one-dimensional centerline in four dimensions.
4. The assistant's sweep changes the generic readout dimension: a three-dimensional swept surface intersecting a three-dimensional timesheet gives a two-dimensional intersection; a four-dimensional tube gives a three-dimensional region. Neither is the direct-source point readout without an additional projection.
5. SAT-O1 defines a one-dimensional curve and a one-parameter action, then calls the filament's physical presence a four-dimensional worldtube. The thickening or normal-bundle map is absent. Its three independent sinusoidal spatial coordinates are not automatically a constant-radius, constant-pitch helix.
6. Blockwave's (J^{\mu\nu}) is a two-form current encoding worldsheets. It is not the same typed object as the direct-source one-dimensional filament. Its intersection with a three-dimensional timesheet is generically a loop, consistent with the holonomy construction, but a map from the one-dimensional centerline to the two-dimensional worldsheet is missing.
7. Rotoexpando's point-pair-to-oriented-segment arrow is now formalized. The full chain through screw/helix, framed sphere, phase oscillator, and toroidal winding is not. The manuscript itself leaves the nested-helix-to-framed-sphere map to be defined.
8. The torus parameterization needs (R>a>0) for an embedded ring torus. Rational winding closure requires a constant rotation number, not merely a rational instantaneous derivative.
9. The recursive closure statement for (\mu=1) and (\alpha=2\pi p/q) omits the nontrivial-root condition. For (q=1), the one-step sum is (1), so (z_1=z_0+D_0), not (z_0), when (D_0\ne0). The corrected condition is (r^q=1) and (r\ne1), equivalently a reduced rational phase with (q>1).
10. The local tube-radius bound (a<1/\kappa_{\max}) does not alone guarantee global embedding. A precise nonlocal reach/separation condition is also required; the manuscript's excluded-neighborhood notation is not yet formal.
11. Rotoexpando uses Euclidean (\mathbb R^d) and (SO(d)); SAT-O1 uses (\mathbb R^{3,1}); the direct 2026 statement invokes a Minkowski geometric grammar. No Euclidean-to-Lorentzian map or causal-structure preservation is defined.
12. The Blockwave local identity (A=\alpha_*d\theta) gives (F=dA=0) for a smooth, globally real-valued phase. A compact circle-valued phase can retain nontrivial global winding/holonomy while remaining locally flat; nonzero local curvature requires additional connection, patch, defect, or singularity data. The source does not specify that structure or the normalization of (\alpha_*).
13. The SAT-O1 Hopf/Borromean stability and “no stable four-or-more-filament interlocks in 4D” claims require a precise embedding category and linking invariant. They do not follow from the labels alone. Rotoexpando's spherical braid configuration is not automatically the same object.
14. The schematic nested-order arrows and Whirligig compression remain proposals until their domains, codomains, projection maps, composition laws, and loss conditions are explicit.
15. The direct source locates complexity in filament interactions and treats the timesheet as manifestation/readout. The assistant reconstruction shifts explanatory weight toward slice-intersection and collapse/readout functionals without deriving that shift.

## Corrections kept separate from originals

- The point-pair segment map is formalized exactly as (P+u(Q-P)), with (u\in[0,1]); no source equation was overwritten.
- The recursive closure condition is restricted to a nontrivial root of unity, (r^q=1) and (r\ne1).
- A four-dimensional tube around a one-dimensional centerline requires three normal coordinates. This is a dimensional requirement, not a proposed physical law.
- For smooth real (\theta), (d(\alpha_*d\theta)=0). Any intended nonzero curvature or defect holonomy needs additional structure.
- No corrected SAT-O1 or Blockwave action is promoted. The original files remain verbatim.

## Next deeper cursor

1. Define the normal bundle and reach conditions for a finite tube around a one-dimensional centerline, then decide whether the ambient geometry is Euclidean or Lorentzian.
2. Define whether and how a one-dimensional filament generates a two-dimensional worldsheet current.
3. Define the timesheet-intersection readout map and the conditions under which it reduces a support region to a point.
4. Type the GR and string-theory structures in a common ambient category before formalizing orthogonality or generative intersection.
5. Define the nested-order and Whirligig projections with explicit composition and loss conditions.
6. Formalize the nontrivial-root closure theorem with its (q>1) condition.

**Epistemic status:** source-fidelity comparison and one conditional affine-geometry theorem completed. No physical calculation, fit, prediction, independent measurement, CODATA scoring, paper-gate advancement, or BEDROCK theory promotion.
