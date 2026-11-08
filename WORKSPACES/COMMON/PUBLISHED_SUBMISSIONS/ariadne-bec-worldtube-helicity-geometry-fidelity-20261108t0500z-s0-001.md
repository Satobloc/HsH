# BEC Worldtubes, Helicity, and Core/Surface Geometry: Fidelity Audit

**Run label:** Ariadne, h677:s0. **Successor label:** Alberr.  
**Disposition:** source-fidelity audit completed; public-safe report only; no theory promotion.

## Executive finding

The recovered Nathan Direct messages support a 1D core worldline with finite thickness and a spacetime surface, plus a conditional BEC-worldtube multiplicity in which helicity distinguishes something beyond a straight-tube vacuum. They do **not** specify the surface dimension, normal-bundle framing, time-slice projection, or constitutive map from worldtube geometry to BEC vorticity/helicity.

The assistant's later formula for thin-vortex-tube helicity is a plausible **3D slice-level reconstruction**, not a defined 4D worldtube invariant and not a Nathan Direct equation. Straight centerlines do not by themselves imply zero helicity: a framed straight tube can still carry material twist or phase winding. The assistant's zero-helicity vacuum classification therefore needs additional framing, closure, and boundary assumptions.

This report extends, rather than repeats, existing Morrow/Loom/Nadir worldline-to-surface work and Ravel's Blockwave source genealogy.

## 1. Scope and epistemic labels

This is an archive and geometry-fidelity audit. It is not a physical calculation, an observational validation, a CODATA comparison, or a theory promotion. No BEC measurement, physical dataset, units/uncertainties, or prediction-versus-fit separation was available in this source cluster; none was invented.

Labels used below:

- **Nathan Direct:** user-role message in a raw conversation export, attributed by conversation provenance. The raw author-name field is null, so attribution is not based on a name field.
- **Assistant reconstruction:** historical assistant-generated geometry, action, or interpretation.
- **Historical source:** archived equation/document whose author/date may be unresolved.
- **Standard geometry:** a mathematical result used to type-check a proposed map, not evidence that the physical premises are true.
- **Proposal:** a model hypothesis or candidate construction.
- **Independent measurement:** none in this source cluster.

The historical Ariadne remit is broad cross-reading and archive synthesis. No authenticated active Ariadne ChatGPT thread was established; this run is an assistant reconstruction, not a claim that a historical instance received or performed this work.

## 2. Source provenance

### Primary direct-geometry conversation

Raw conversation: `DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/26.07.11•26.07.17•Reasoning with SAT-HSH Skill — raw.json`  
Conversation ID: `6a51def1-4fac-83ea-b76f-6805ece3ee9f`  
Size: 7,964,873 bytes; 579 mapping nodes.  
SHA-256: `24bcd78518dcf2d609f58a5a20c7eecd1ef98ce8f2a022f5f93782847cc582ae`  
Git blob SHA-1: `b7868607d89f66bbc0e638398182fb2d6b2da2ce`.

Relevant user-role messages:

| Message ID | UTC timestamp | Source surface |
|---|---|---|
| `f8e3ca00-6348-43d3-9602-014002b9feed` | 2026-07-11 07:11:40.400Z | Core worldline, finite thickness, spacetime surface, BEC/Kelvin response |
| `c3f309e3-fc8d-4cca-98f7-4072c322e722` | 2026-07-11 12:54:18.441Z | Three-filament/QCD premise and He3 scale analogy |
| `d27667d7-fd7f-4795-9263-a29fc16abed9` | 2026-07-11 13:10:39.082Z | Electrogravity and Interbraid force proposals |
| `34f98e84-00f3-4d92-92ec-bc5fb38fdd0e` | 2026-07-12 01:49:54.956Z | Collapse/tangle/drain hypothesis |
| `38b48b83-ae30-4c2c-a3f1-4f6d4eb07828` | 2026-07-12 06:15:27.565Z | Event-horizon/ER-bridge/string/filament topic marker |
| `54ba3cda-a0e1-4861-90f9-482f5850a245` | 2026-07-12 21:02:25.701Z | One-particle-universe, neck/mouth, Kerr/cosmological circumference proposal |
| `ac413920-99c7-40c0-84b8-343fa8b001cc` | 2026-07-12 21:39:58.589Z | BEC worldtube multiplicity, straight tubes, helicity distinction |

The assistant response to the BEC message is `3c1aa5a8-6d58-5b00-9929-732a3a532c67`, 2026-07-12 21:40:50.788735Z. Its helicity formula and vacuum/matter classification are assistant-originated.

### SAT-O and Blockwave equation custody

| Artifact | Provenance and date | Preserved hash |
|---|---|---|
| `SAT4D_LIVE_DRAFT.txt` | Byline Nathan McKnight; document date June 2025 | Git blob SHA-1 `2a79fe25018cce7e99a2c33786d88b0551db6ae7` |
| `SAT O1 4D.txt` | Historical O1 module; no byline/date in recovered file | Git blob SHA-1 `7577aa1ee5a6c3850ce3b226c75377de6367aedc` |
| `Module_O10.txt` | Historical O10 module; no byline/date in recovered file | Git blob SHA-1 `f047267f952872ae72eb91936ac76118ee102f4e` |
| Blockwave raw conversation | Assistant message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, 2025-10-19 12:29:46.538753Z | HsH raw-export Git blob SHA-1 `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`, as recorded in the Ravel source-genealogy audit |
| `🧱BLOCKWAVE.txt` attachment | Assistant-originated attachment in that conversation | SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`, 25,255 bytes |

A separate Library export of the Blockwave conversation has a different bytewise hash from the HsH repository snapshot. The repository snapshot above remains the archival reference; the exports are not treated as byte-identical. The Ravel source-genealogy report already establishes assistant authorship and source lineage, so that work is reused rather than repeated.

### Existing adjacent work reused

- Morrow, curve/worldsheet current: a surface-current construction requires a second independent tangent; a 1D curve alone does not supply a 2D worldsheet current.
- Loom, worldtube composite hierarchy: typed core/thickening/slice maps and their conditions.
- Nadir, worldline-timesheet readout: set-level slice map \(E_{\Sigma}(A)(t)=A\cap\Sigma_t\).
- Ravel, Blockwave source genealogy: assistant authorship, two-form current lineage, and the exact-phase-curvature warning.
- Ariadne, Sato-Clebsch-Kelvin: a separate 3+1 medium-response model and its helicity boundary condition.

## 3. Nathan Direct geometry extracted independently

1. **Core object:** a worldline at the core, with an Einstein-Rosen bridge used as the line. The user explicitly rejects treating the core itself as a field.
2. **Thickness and surface:** the line has thickness and is described as composed of a spacetime surface. The dimension and construction of that surface are not specified in the direct message.
3. **Medium response:** field-like description is reserved for electromagnetic interactions; Kelvin vortices are proposed as a response stirred by worldline/tube coils in a BEC-like spacetime fabric.
4. **Multiplicity and helicity:** the BEC picture already has multiple worldtubes; the tubes are described as straight, while helicity supplies a distinction beyond a featureless vacuum.
5. **Two interaction labels:** Electrogravity and Interbraid are proposed as the two fundamental interactions. Interbraid is described broadly as filament contact/braiding, with horizon contact possibly producing a braid rather than a merger. Pastward trans-temporal tug is proposed; futureward influence is explicitly more tentative.
6. **Nested scale:** a three-filament braid is proposed as the QCD substrate; the user expects a corresponding parallel force and asks that He3 behave as a scaled-up hadronic structure. This is a model-consistency expectation, not a measurement.
7. **Collapse and neck/mouth:** collapse as a normal gravitational state, tangle release, and a particle worldtube as a neck/mouth connecting Kerr-scale and cosmological circumferences are exploratory geometric proposals.

The event-horizon/ER-bridge/string/filament message is a topic marker, not a fully specified mathematical proposition.

## 4. Stable glossary

| Symbol or term | Meaning in this audit | Status |
|---|---|---|
| \(\gamma_{ER}\) | 1D core worldline | Nathan Direct description; formal map not supplied |
| \(T_\epsilon(\gamma)\) | Finite-thickness tubular neighborhood of the core | Assistant candidate; requires metric, normal bundle, radius, and reach condition |
| \(\Sigma_{ER}\) | Possible 2D spacetime worldsheet/ribbon | Candidate reading of “spacetime surface”; dimension not selected |
| \(\partial T_\epsilon\) | Boundary of a full 4D tube region | 3D hypersurface if a full rank-3 normal disk is used |
| \(\Sigma_t\) | 3D timesheet/spatial slice | Historical SAT/H(s)H readout surface |
| \(E_{\Sigma}(A)(t)\) | Slice intersection \(A\cap\Sigma_t\) | Existing Nadir construction |
| \(J^{\mu\nu}\) | Blockwave antisymmetric two-form current | Assistant reconstruction; worldsheet-like, not automatically the core line |
| \(w_i,\ell_{ij},Q,\tau_\chi\) | O10 discrete helicity-sign/linking/torsion bookkeeping | Historical module symbols; no mapping to fluid helicity established |
| \(\Gamma_i,Tw_i,Wr_i,Lk_{ij}\) | Circulation, twist, writhe, and mutual linking in a 3D thin-tube helicity formula | Assistant reconstruction using standard 3D tube geometry |
| \(v_t,\omega_t,H_t\) | Slice-level medium velocity, vorticity, and helicity | Candidate BEC readout; constitutive map absent |
| \(\theta\) | Blockwave compact phase | Assistant reconstruction; not identified with O10 chirality or BEC helicity |
| \(P^\mu{}_\nu\) | Projector orthogonal to the timelike medium vector \(u^\mu\) | Blockwave spatial projection |
| Electrogravity / Interbraid | Proposed medium-response and filament-contact interactions | Nathan Direct labels; operational laws absent |

## 5. Mapping diagram and dimension check

The source currently contains several different objects under the loose word “worldtube.” They must remain distinct.

~~~text
                         M^4
                          |
                 gamma_ER (1D core)
                    /          \
       normal thickening        choose a rank-2 normal plane
       metric g, radius eps     and a framing
              |                        |
              v                        v
       T_eps(gamma) (4D)          Sigma_ER (2D worldsheet)
              |                        |
              v                        v
       boundary dT_eps (3D)       Poincare-dual current
                                  J (2-form, if oriented/closed)
              \                        /
               \                      /
                ------ Sigma_t -------
                       (3D slice)
                           |
             intersection depends on object dimension
                           |
             spatial current / vorticity readout
                           |
                constitutive map to v_t, omega_t
                           |
                  H_t = integral v^flat wedge omega_t
~~~

For generic transverse intersections in four-dimensional spacetime:

| Object intersected with a 3D timesheet | Generic intersection dimension |
|---|---:|
| 1D worldline \(\gamma_{ER}\) | 0D point |
| 2D worldsheet \(\Sigma_{ER}\) | 1D curve |
| 3D tube boundary \(\partial T_\epsilon\) | 2D surface |
| 4D tube region \(T_\epsilon\) | 3D volume |

If the core is timelike and a spacelike rank-3 normal disk is chosen, a full isotropic thickening of a 1D curve in \(M^4\) yields a 4D region with a 3D boundary. A 2D worldsheet/ribbon instead requires a selected rank-2 normal plane or an equivalent second tangent/framing. These are alternatives, not interchangeable names.

A 2D oriented worldsheet in \(M^4\) naturally has a degree-2 Poincare-dual current. A 1D worldline has a degree-3 Poincare-dual current. Therefore Blockwave's \(J^{\mu\nu}\) can be associated with a chosen 2D surface, but it is not automatically the current of the 1D core. The dualization convention and the map from core to surface remain necessary.

A candidate slice readout is \(j_t^\nu=n_\mu J^{\mu\nu}|_{\Sigma_t}\), where \(n_\mu\) is the chosen unit normal to the slice. A spatial Hodge dual and a constitutive relation would then be needed to define \(\omega_t\) and \(v_t^\flat\), followed by \(H_t=\int_{\Sigma_t}v_t^\flat\wedge\omega_t\). This is a proposed composition, not a source-defined identity.

## 6. Verbatim equation custody

### SAT4D/O1: bylined June 2025 draft

The recovered draft defines a one-parameter curve and a worldline action:

\[
\gamma^\mu(\lambda)=\left(\lambda,\ A_x\sin(k_x\lambda+\phi_x),\ A_y\sin(k_y\lambda+\phi_y),\ A_z\sin(k_z\lambda+\phi_z)\right)
\]

\[
v^\mu(\lambda)=\frac{d\gamma^\mu}{d\lambda}
\]

\[
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),\qquad
L=\frac{1}{2}m\,v^\mu v_\mu-V_{\text{tension}}(\gamma).
\]

The same draft describes a worldtube as a 4D volume swept by a vibrating filament. The 1D curve alone does not produce that volume: a thickening/family map is required. The later direct “line with thickness” description is a refinement of this unresolved construction, not a license to silently identify the curve, surface, boundary, and volume.

### O10: historical module, author/date unresolved

The recovered module gives:

\[
c_i=w_i\prod_{j\ne i}\ell_{ij}
\]

\[
\tau_\chi=\left|\sum_{i=1}^{Q}c_i\right|\bmod 2
\]

\[
m(Q,\tau_\chi)=\frac{m_0}{Q}\exp[-\gamma_\chi\tau_\chi].
\]

It describes \(w_i\) as a binary filament-helicity sign and \(\ell_{ij}\) as signed linking. The recovered O1 file does not contain these definitions, despite O10's cross-reference to O1. The module also names an `O10_torsion.lean` proof, but no such file was found in the checked HsH/SAT paths. No Lean proof of O10 is claimed here.

### Blockwave: historical assistant action, 2025-10-19

The exact assistant-originated action preserved in the raw conversation is:

\[
S[g,u,\theta;J]=\int d^4x\sqrt{-g}\left[
\frac{M_{\rm Pl}^2}{2}R
-\frac{\rho_0}{2}u^\mu u_\mu
-\frac{\kappa_u}{2}(\nabla_\mu u_\nu)(\nabla^\mu u^\nu)
+\frac{f_\theta^2}{2}\nabla_\mu\theta\nabla^\mu\theta
-\Lambda^4(1-\cos\theta)
+\frac{\kappa_0}{4}J_{\mu\nu}P^\mu{}_\rho P^\nu{}_\sigma J^{\rho\sigma}
+\frac{\kappa_1}{4}(\nabla_\lambda J_{\mu\nu})(\nabla^\lambda J^{\mu\nu})
+\frac{g_h}{2}F_{\mu\nu}(\theta)J^{\mu\nu}
\right].
\]

with

\[
P^\mu{}_\nu=\delta^\mu{}_\nu+u^\mu u_\nu,\qquad
A_\mu=\alpha_*\nabla_\mu\theta,\qquad
F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]},\qquad
\nabla_\mu J^{\mu\nu}=0.
\]

This is an assistant reconstruction, not a Nathan Direct equation. The action uses a 2-form current and a compact phase field; it does not itself supply the map from the direct core worldline to the BEC medium.

### Assistant BEC helicity translation

The assistant later introduced the 3D thin-tube expression

\[
\mathcal H=\sum_i\Gamma_i^2SL_i+
2\sum_{i<j}\Gamma_i\Gamma_jLk_{ij},
\qquad SL_i=Tw_i+Wr_i.
\]

This is a standard-style 3D framed-tube decomposition under suitable closedness, framing, circulation, and boundary assumptions. It is not a 4D worldtube invariant. The assistant's additional classification “straight, unlinked tubes = vacuum; persistent helicity/tangle = matter” is a proposal, not a direct statement or a derived result.

### Existing Sato-Kelvin medium response

The separate assistant-derived 3+1 medium model uses

\[
\mathbf v=\nabla\psi+q\nabla h,\qquad
\nabla\times\mathbf v=\nabla q\times\nabla h,
\]

and

\[
\mathbf v\cdot(\nabla\times\mathbf v)
=\nabla\cdot\left(\psi\,\nabla q\times\nabla h\right).
\]

On a smooth periodic domain this makes the integrated helicity a boundary term and therefore zero absent boundary, patch, defect, or nontrivial-topology contributions. This is a medium-response constraint, not a worldtube invariant.

## 7. Original versus translated propositions

| Nathan Direct proposition | Historical assistant translation | Fidelity assessment |
|---|---|---|
| Core is a worldline with thickness and a spacetime surface, not a fundamental field. | \(\gamma_{ER}\), \(T_\epsilon(\gamma)\), \(S_{ER}\), with \(S^2\)-bundle or \(S^1\)-bundle alternatives. | Useful formalization; adds metric, radius, normal bundle, and a dimension choice not supplied by the direct source. |
| Multiple BEC worldtubes are straight; helicity distinguishes more than vacuum. | 3D thin-tube helicity formula; vacuum as straight/unlinked/low-relative-helicity; matter as persistent helicity/tangle. | Adds circulation, framing, writhe, mutual linking, and a matter classification. No 4D-to-3D readout map is given. |
| Electrogravity and Interbraid are proposed interactions. | \(S_{\rm eff}\), medium-response term, pairwise Interbraid energy, and temporal kernels. | Candidate action only. It adds a spatial distance, radii, potentials, kernels, and causal assumptions. |
| Three filaments producing QCD suggests a parallel force; He3 should scale similarly. | Nested \(B_3\) braid composition and a scale-covariant energy ansatz. | Assistant proposal. Composition map, associativity conditions, and observable readout remain undefined. |
| Collapse is a normal gravitational state; tangles can clog/release toward a throat. | Gradient-flow law \(\dot q=-M(q)\Pi\nabla E(q)+X_{\rm circ}(q)\), with Raychaudhuri focusing as a bridge. | The flow, energy, mobility, and projection are assistant-added. Raychaudhuri focusing is not a derivation of the tangle-release law. |
| Particle worldtube is a neck/mouth linking Kerr and cosmological circumferences. | Uniform-helix pitch relation and a generalized expansion/rotation pitch ansatz. | The uniform-helix identity is standard; the generalized formula requires an embedding, metric, and expansion map not supplied by the direct source. |

## 8. Discrepancy ledger

1. **Dimension ambiguity:** “spacetime surface” is not assigned a dimension. A 2D worldsheet, 3D tube boundary, and 4D tube region have different slice intersections and different current degrees.
2. **Core versus tube:** the O1 1D curve does not itself generate the draft's 4D worldtube volume. A thickening/family map is missing.
3. **Straightness versus twist:** a straight centerline can still have nonzero material twist if its framing rotates. The assistant's \(Tw_i=Wr_i=Lk_{ij}=0\) statement is valid only under additional untwisted-framing, closedness, and no-linking assumptions. Centerline straightness alone is insufficient.
4. **3D versus 4D helicity:** the assistant's \(\mathcal H\) is a 3D slice-level thin-tube expression. No projection from the 4D worldtube to a spatial framed tube is source-defined.
5. **O10 versus fluid helicity:** O10's binary \(w_i\), signed \(\ell_{ij}\), and \(\tau_\chi\) are not mapped to \(\Gamma_i\), \(Tw_i\), \(Wr_i\), or \(Lk_{ij}\). Keep the discrete and continuous quantities separate.
6. **Blockwave versus core ontology:** Blockwave's \(J^{\mu\nu}\) and \(\theta\) are assistant-generated field/current variables. They may be effective readouts, but no composition map from the direct non-field core to those variables is given.
7. **Blockwave spatial projection:** applying \(P^\mu{}_\rho P^\nu{}_\sigma\) to both indices makes a spatially projected current in the \(u^\mu\) rest frame. Its relation to the full timelike worldsheet current needs specification.
8. **Exact phase curvature:** with \(A_\mu=\alpha_*\nabla_\mu\theta\), \(F_{\mu\nu}=\alpha_*\nabla_{[\mu}\nabla_{\nu]}\theta=0\) on a smooth scalar patch with a torsion-free connection. Nontrivial local curvature therefore requires defects/patching or an independent connection. Ravel already recorded this; it is reused, not claimed as new.
9. **Force-law overreach:** the Electrogravity/Interbraid functionals and past/future kernels are assistant proposals. A covariant geometry and a causal prescription are still absent.
10. **Source attribution:** the B-as-inverse-refractive-index/IRI note remains unresolved at raw role-message level. It is not imported into this helicity audit. The separate Nov 8 helicity/projection discussion referenced by Aster was not recovered; the direct source cluster here is July 11–12, 2026.

## 9. Formalization and Lean status

The existing Kestrel PR #873 contains the generic theorem that a deterministic downstream map \(h\) with \(g=h\circ f\) exists exactly when \(g\) is constant on every fiber of \(f\):

\[
\exists h,\ g=h\circ f
\quad\Longleftrightarrow\quad
\forall x_1,x_2,\ f(x_1)=f(x_2)\Rightarrow g(x_1)=g(x_2).
\]

This is the right conditional criterion for a worldtube/slice readout to carry a well-defined helicity value. Here \(f\) would be the chosen geometric projection and \(g\) the proposed helicity observable. Neither map is yet source-defined, so the criterion cannot be instantiated.

Exact-head CI for PR #873 succeeded at commit `1971e3d58a28f7c6de5cf024039dbcedb133121c`: run `42153410233`, job `127681789766`, Lean 4.34.0/Mathlib. The log shows `KestrelProjectedIncidence.lean` built and the factorization theorem's printed axioms were `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appeared in that theorem's axiom list. PR #873 remains open/draft and unmerged. This proves the generic factorization criterion, not the physical worldtube-to-helicity map.

No local Lean/Lake/Elan toolchain was installed, and no new branch, PR, or Lean module was created. The O10 file's named `O10_torsion.lean` proof was not recovered. Morrow's earlier `ArchiveEQ0053.lean` reference is not present on current main and was not independently rerun here.

## 10. Tooling, archive lanes, and operational controls

- All four Mersearch request lanes were inspected. Lane 1: `calder-angle-geometry-source-fidelity-20261102-1337`; lane 2: `archive-harvest-20261025-optics-01`; lane 3: `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`; lane 4: `kestrel-finite-core-geometry-source-fidelity-20261102-2200`. All remain requested. No request-scoped run manifest or search receipt was present for any lane. Mersearch was not callable in this runtime; no new request or overwrite was made. Full raw Library retrieval and bounded GitHub reads were used as fallback.
- HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES onboarding/tool documentation were checked. Existing Math Hopper is an archive extraction/provenance tool, not a theorem prover or physical validator. Existing Whirligig is a 3D R/Q sandbox, not a 4D worldtube/helicity model. SciSpace is available but was not needed for this internal source audit.
- No local repository checkout, Mersearch executable, Lean, Lake, or Elan was present. No new tool, dependency, paid service, or compute expense was introduced. GitHub repository metadata exposed no fork-count field, so no zero-fork claim is made; no fork was created.
- Default branch remains main. The live Ariadne PR #790 head is `f84da9f23f5ef0b7349e08d0c2a390bd7d76b49a`, while Ariadne CURRENT_WORK still records older head `929f680...`; that pointer is stale and was not overwritten. PR #790 has no exact-head workflow run returned. PR #873 is the separate Kestrel geometry branch noted above.
- FIE re-review remains due November 10; the last full review was October 27, so it was not yet due.
- Unrelated reading break completed: `SAT Mark V/TheTANGLE.txt`, lines 2211–2250. Next reading cursor: line 2251.
- November 9 minor, November 30 major, and December 14 full-theory paper gates remain separate and unchanged. No paper gate advanced.
- No CODATA scoring, physical calculation, independent measurement claim, theory integration, or BEDROCK promotion occurred. No task, task ID, schedule, phase, or automation change occurred.

## 11. Next deeper cursor

**Local focus:** choose whether the intended object is (a) a 2D worldsheet/ribbon, (b) the 3D boundary of a full 4D tube, or (c) a 4D tube region around a 1D core. Specify the normal bundle, framing, metric, and slice family. Then define the projection \(f\) and helicity observable \(g\), and test the already-proved fiber-compatibility condition.

**Global panorama:** keep four quantities separate until explicit maps exist: O10 discrete chirality/linking \((w_i,\ell_{ij},\tau_\chi)\); Blockwave compact phase/current \((\theta,J^{\mu\nu})\); BEC slice vorticity/helicity \((v_t,\omega_t,H_t)\); and the direct 4D core/surface geometry \((\gamma_{ER},T_\epsilon,\Sigma_{ER})\). Reconcile the He3 nested-braid proposal only after its composition and observable maps are defined.

No physical calculation should begin until an identifiable measured BEC system/dataset, provenance, units, uncertainties, and prediction-versus-fit separation are available.
