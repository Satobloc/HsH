# Aster | 4D spin/flavor geometry source-fidelity audit

**Run key:** `REVROT3-19-20261011:521:s0`  
**Nominal slot:** 2026-11-01 17:00 UTC  
**Ring selection:** (h=521), (seq=5h=2605), (2605\bmod19=2). Selected label: **Aster** (index 2). Next label: **Ariadne** (index 3).  
**Disposition:** `DIRECT_SOURCE_CLUSTER_RECOVERED / ASSISTANT_TRANSLATIONS_SEPARATED / SAT-O-BLOCKWAVE_GENEALOGY_PARTIAL / CONDITIONAL_LEAN_GATE_SUBMITTED / NO_PHYSICAL_OR_THEORY_PROMOTION`

## 1. Executive finding

The September 1, 2026 raw conversation contains a substantial but explicitly exploratory geometry discussion. Nathan Direct describes a four-dimensional filament/worldtube, a three-dimensional time surface, an observed section, an internal ring or cross-section orientation, and several competing interpretations of spin, flavor, and rotational motion. A later message asks whether the picture can be reduced to Newtonian mechanics plus one new assumption and time.

The historical assistant then supplies **four different candidate primitives**:

1. A Euclidean helix with a pitch angle and a 4D Frenet frame.
2. A unit tangent driven by a constant skew generator (T'=\Omega T), with an (SO(4)) split and a proposed effective Lorentzian metric.
3. A concentric (S^3) foliation with radial normal (u=X/R), expansion, and tangential rotation.
4. Newtonian motion embedded as (X(t)=(ct,x(t))), with persistence of the worldline as the single added ontological assumption.

These are not demonstrated to be equivalent. The assistant repeatedly moves from one primitive to another without supplying the projection, embedding, or composition maps that would make the changes of representation legitimate. The direct source does not select or adopt any one of the four.

A second source layer makes the same problem visible in the symbols themselves. Across SAT-Y 4D, SAT.O13, Blockwave-derived drafts, the September 1 conversation, and the current BEDROCK control, (\theta_4), (\psi), and (\tau) do not retain one stable meaning. The older A4 flavor sector, the Blockwave (Z_3) twist field, the assistant's Frenet (\kappa_3), and the current relative-tilt description must remain distinct until an explicit map is supplied.

The most defensible present geometry is therefore modest:

- A filament/worldline or finite-core worldtube exists in a four-dimensional carrier.
- A three-dimensional time surface supplies a section/readout.
- An internal ring or normal-plane orientation is described relative to a local tangent and a local time direction.
- Spin and flavor/precession remain distinct physical questions, with the current BEDROCK control identifying shelf-cocking and precession as the same relative tilt.
- No unique metric, angle convention, connection, or particle-statistics map is recovered from the September 1 conversation.

No physical calculation, CODATA scoring, fit, or theory promotion was performed.

## 2. Role, controls, and provenance

### 2.1 Aster's historical specialist charter

The historical Aster raw conversation is the role source, not the current automation label. The recovered user-authored instructions establish a source-fidelity and prior-art review specialty:

- Ask whether a passage reads like Nathan, whether Nathan said it elsewhere, and whether it contradicts earlier statements.
- Keep Nathan-genuine material distinct from assistant reconstruction.
- Paper A was assigned to Aster as a separate review lane, with a request to read the complete pile and provide granular reactions.
- A later direct instruction identifies Aster as part of the prior-art review team.

This run performs the source-fidelity task only. It does not reopen the frozen Paper A review.

Historical role export: `WORKSPACES/ASTER/...` raw conversation blob `1bf6e65c4ac1650297acb67d7e39f700454a03c8`. No authenticated live Aster ChatGPT thread was recovered. The historical export is not proof of current-thread identity.

### 2.2 Operational controls read

| Control | Git blob |
|---|---|
| Live `BEDROCK.md` | `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c` |
| Steering Charter 2026-10-26 | `5f4263381afcb065e9062d5b5885593d0baa58db` |
| Three Paper Campaign 2026-10-26 | `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0` |
| New-instance onboarding | `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0` |
| Revival Rotation V3 | `90863a4c... ` |
| Revival Rotation V4 | `6761337dfcd0847226ee7baad84db0a9c496760a` |
| Thread-first rule | `e79707587914edb76afca1c32f9f4dad4d0324b7` |
| Navigation preflight | `ce8d8be6e07340eff1f0e06d66b762e8ae8da358` |
| Worker autonomy/handoff protocol | `7a21c87311d2c812209fa08fe50a4246c8b53761` |
| Current task branch graph | `3c341c616aa893bf56ad5ad5919e09a17e0c2b46` |

HsH `main) at last pre-publication readback: `e3308c00ed97db9461a035b55d592954fc7588e7`. The existing HAGALAZ solver-unification branch remains active with a path-dependent transport next cursor. No branch graph, BEDROCK, symbol registry, or paper-gate edit was made.

### 2.3 Mersearch status

All four Mersearch request lanes remain occupied or unreleased. Aster's earlier lane-3 June-2025 disclosure search has a completed manifest and receipts for run `#41278156840); Tern's amendment corrected an earlier worker/request misattribution. The shared lane-3 request file still carries stale staged metadata, so the manifest and receipts, not that stale field, control the completion claim.

That search concerns the June-2025 disclosure graph, not this spin/flavor source cluster. No new Mersearch request was opened, overwritten, or retried. The September 1 raw export and existing SAT archive files were used directly.

## 3. Nathan Direct geometry, extracted before evaluating the assistant mathematics

### 3.1 Primary raw source

Conversation: **NEWTO-SAT ChatGPT Voice Glitch**  
Conversation ID: `6a958d9c-3f8a-4d2b-8df4-2dbd79f5a19e`  
Raw export Git blob: `001084962c2cdfd08d88154f14069e7fc8bf45e0`

Relevant role-tagged user messages:

| Message | UTC time | Length | Direct content |
|---|---:|---:|---|
| `bda16543-7c6e-4dd0-bc0e-3f6a2bfe0e8f` | 2026-09-01 21:42:34.707 | 25,338 chars | Four-dimensional filament/worldtube, time-surface intersection, ring/cross-section orientation, spin/flavor alternatives, particle morphology, and uncertainty about the right primitive |
| `489508ce-ec29-4b17-b005-c7c9e300aace` | 2026-09-01 22:16:36.358 | 4,077 chars | Alternative four-axis rotational/expanding picture, hypersphere and two-shell possibilities, rotational momentum, and a request to compare minimality and symmetry |
| `dc3064a9-fea3-426a-97be-a7026509816a` | 2026-09-01 22:26:23.625 | 99 chars | Asks whether the picture can be reduced to Newton plus one new assumption plus time |

The direct source is exploratory. It explicitly entertains competing arrangements rather than declaring one finished model.

### 3.2 Stable direct geometric content

The strongest source-level statements are:

1. **Carrier and section:** a four-dimensional filament or worldtube intersects a three-dimensional time surface. The observed particle/readout is associated with that intersection.
2. **Internal orientation:** a ring or cross-section has an orientation relative to the local filament tangent. The orientation changes along the trajectory.
3. **External orientation:** the time surface or local time direction supplies another reference orientation. The direct discussion distinguishes the observed section from the ring's internal orientation.
4. **Spin/flavor alternatives:** the conversation considers spin as a helical or rotational closure and flavor as a precession or plane-tilt effect, but it also considers a nested spin/flavor helix. The message does not settle between them.
5. **Particle morphology:** the electron and neutrino are explored as different coil/extension configurations. The neutrino-as-boson possibility is posed as a question, not established as a particle classification.
6. **Four-dimensional dynamics:** the second direct message considers four orthogonal axes, one expanding direction, rotational momentum, a hypersphere, and two shells. These are alternatives, not a single specified metric or equation.
7. **Minimality question:** the third direct message asks whether Newton plus one new assumption and time might suffice. It does not state what that assumption is.

The direct messages do **not** specify a metric signature, a global time function, a connection, a bundle, a normal-bundle framing, an exact (\theta_4) definition, or a map from internal orientation to a Standard Model observable.

## 4. Historical assistant mathematics, separated from the direct geometry

### 4.1 Assistant response A: Euclidean helix and Frenet frame

Assistant message `1ac711a2-8a62-4b0f-8e17-1a7d0d18d4a3`, 2026-09-01 21:47:31.978 UTC.

The response uses a 3D circular helix embedded in a 4D Euclidean carrier:

[
X(\phi)=p\phi u+R\cos\phi\,e_1+R\sin\phi\,e_2,
qquad
\tan\theta_4=\frac{p}{R}.
]

It then introduces Frenet curvatures and proposes that a third curvature (\kappa_3) could encode flavor or shelf-cocking. It also introduces a framed tube around the centerline and a normal-plane phase.

**Fidelity assessment:** the helix is a useful conditional model, but it is not the full direct geometry. The direct source distinguishes the filament, its finite worldtube, the time-surface section, and the internal ring orientation. A Frenet curvature of the centerline is not automatically the orientation/precession of an internal ring plane. The response supplies no map from (\kappa_3) to the direct relative-tilt concept.

The response also uses a Euclidean angle. The current BEDROCK control explicitly forbids silently treating that as a Lorentz-invariant angle.

### 4.2 Assistant response B: tangent plus (SO(4)) generator

Assistant message `0a5ce2a0-c4c1-4e2f-ba4d-3382860f1af9`, 2026-09-01 22:18:10.917 UTC.

It proposes:

[
T'=\Omega T,qquad \Omega^T=-\Omega,
]

then decomposes the six components of (\mathfrak{so}(4)) relative to a distinguished direction into a 3+3 split. It further proposes an effective metric of the form:

[
g=\delta-2u\otimes u.
]

An anisotropic expansion tensor is also introduced using separate spatial and fourth-axis expansion rates.

**Fidelity assessment:** this is an assistant reconstruction of the direct rotational-momentum and four-axis discussion. The direct source does not specify a constant generator, a Euclidean inner product, or a signature-flip rule. The 3+3 algebraic split is not by itself a physical 3+3-dimensional ontology, nor does it supply a group homomorphism from (SO(4)) to the Lorentz group. The proposed (g) has no source-defined map to the Minkowski baseline.

### 4.3 Assistant response C: (S^3) foliation and radial normal

Assistant message `faba3f44-... ` and the subsequent response `0a5ce2a0-...` introduce a four-dimensional radial construction:

[
X=Rn,qquad n\in S^3,qquad u=n=\frac{X}{R},
]

with

[
\frac{dX}{d\lambda}=\dot R\,u+R\dot n.
]

A later response states the conditional identity:

[
\Omega^2=-\omega^2 I
quad\Longrightarrowquad
\ddot X=-\omega^2X
]

when (\dot X=\Omega X) and (\Omega) is constant.

**Fidelity assessment:** the (S^3) foliation is one possible Euclidean construction. It selects the radial normal as the local time direction. The current BEDROCK control keeps the timesheet-normal, bulk, and average temporon-propagation interpretations open. No source map identifies them. The rotation-to-harmonic identity is a valid conditional algebraic consequence, but the equal-frequency condition (\Omega^2=-\omega^2I) is an added restriction, not a direct Nathan equation.

### 4.4 Assistant response D: Newton plus persistent history

Assistant message `07c1d7bc-8658-4fd5-9727-182b892c4799`, 2026-09-01 22:26:35.993 UTC.

It proposes the single extra assumption of a persistent material trajectory and embeds Newtonian motion as:

[
X(t)=(ct,x(t)).
]

**Fidelity assessment:** this is a candidate answer to Nathan's minimality question, not a direct Nathan assumption or an accepted reduction. The coordinate (ct) is a unit conversion/embedding. It does not by itself specify a Minkowski metric, proper time, causal cones, spin, finite-core structure, or the time-surface readout. The assistant does not derive the earlier (SO(4)), (S^3), or Frenet constructions from this representation.

### 4.5 Main assistant-side fidelity failure

The assistant successively changes the primitive from a helix/Frenet frame, to a constant (SO(4)) generator, to a radial (S^3) normal, to a persistent Newtonian trajectory. These may be related under additional assumptions, but the response does not provide the maps.

The missing maps are not cosmetic:

- embedding of the worldline/filament into a finite-core worldtube;
- projection of the worldtube onto a time-surface section;
- identification of the local time direction with a coordinate axis or radial normal;
- map from the internal ring plane to a Frenet frame or (SO(4)) generator;
- map from that geometric state to (\psi), (\tau), flavor, or a quantum observable;
- map from the Newtonian (ct) embedding to the Minkowski metric and causal structure.

Without these, the four assistant constructions are alternatives, not equivalent formulations.

## 5. SAT-O and Blockwave equation genealogy

These are historical source layers, not Nathan Direct equations from the September 1 raw conversation. Exact file identities are retained below. The standalone original SAT.O13 module and standalone Blockwave Module 4 source were not recovered in this pass.

### 5.1 SAT.O13, June 20, 2025

Version record: `MASS SPECTRUM CALCULATION.txt`, Git blob `467a0c6a24a6f4f071fc20af438420f69b6abe61`, records SAT.O13 as “Intrinsic Flavor Topology” dated 2025-06-20.

Available equation witness: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/sat_bigpaper_pdfcopy.txt`, Git blob `d50427f21539ca983bc0a1344dc13aa24936c6b5`. This is a PDF text copy, not the standalone original module.

The text includes:

[
m^2[\vec\phi]
=
k_1\sum_{i=1}^{3}\sin^2(n_i\phi_i)
+
k_2S[\vec\phi],
]

[
(U_{\mathrm{PMNS}})_{ij}
=
\langle\psi_i^{\mathrm{mass}}\mid\psi_j^{\mathrm{flavor}}\rangle,
qquad
\Delta C\in\Gamma.
]

The updated A4 section states:

[
\Gamma=A_4,\qquad |A_4|=12,
]

[
U_T=\operatorname{diag}(1,\omega,\omega^2),
qquad
\omega=e^{2\pi i/3},
]

[
M_\ell=m_0U_T^k,qquad
M_\nu=m_\nu U_S,
qquad
k\in\{0,1,2\},
]

with

[
U_S=\frac13
\begin{pmatrix}
-1&2&2\\
2&-1&2\\
2&2&-1
\end{pmatrix}.
]

The proof sketch also lists ( |1+\omega^k| ) magnitudes ( (\sqrt3,1,\sqrt3) ) for (k=(2,1,0)).

**Source/math boundary:**

- An earlier O13 section says (\Gamma\simeq Z_3\) or (A_4) and uses (|\Gamma|=3) to identify three flavors. The updated section selects (A_4), which has order 12, and a 3-dimensional irrep. The map from the 12-element group/orbit structure to exactly three flavor classes is not supplied.
- The displayed (M_\ell=m_0U_T^k) is scalar times a unitary matrix. By itself it cannot split vector norms by direction. The text mentions an additional loop-dressing factor, but does not give a complete dressed mass-matrix equation showing how it composes with (M_\ell).
- The listed magnitudes ( (\sqrt3,1,\sqrt3) ) do not distinguish the first and third assignments. The stated hierarchy therefore is not derived by those listed factors alone.
- No corrected SAT.O13 equation is issued here. The original equations are preserved as written; the missing dressing and flavor projection remain open.

### 5.2 Blockwave-derived draft equations

The accessible draft is `MISC/SECTION 1.txt`, Git blob `85a8bc0d0f4bfa7f8d60ca92601d2b5fb4e01148`. It is a manuscript/PRD-style draft with `\date{\today}`; no fixed creation date or standalone Module 4 source was recovered. Its byline does not establish the provenance of each equation.

The draft writes:

[
\mathcal L_{\mathrm{BGT}}
=
\mathcal L_T+
\mathcal L_{\theta\psi}+
\mathcal L_{\mathrm{rig}}+
\mathcal L_{\mathrm{coup}}-
V(\theta_4,\psi),
]

[
\mathcal L_{\theta\psi}
=
\frac{f_\theta^2}{2}(\partial_\mu\theta_4)(\partial^\mu\theta_4)
+
\frac{f_\psi^2}{2}(\partial_\mu\psi)(\partial^\mu\psi),
]

[
\mathcal L_{\mathrm{Matter}}
\supset
\bar\Psi(i\gamma^\mu\partial_\mu-m(\theta_4))\Psi,
qquad
m^2(\theta_4)=m_0^2+\alpha\theta_4^2,
]

and a discrete twist functional:

[
S_\tau
=
\sum_{\mathrm{faces}}\tau_f(\delta\beta)_f
+
m^2\sum_{\mathrm{faces}}\tau_f^2.
]

The accompanying prose describes spin-1/2 as a (\pi)-holonomy of a (\psi) field and uses (\tau_f\in Z_3).

These are derivative draft equations, not recovered verbatim original Blockwave Module 4 equations. They do not establish a map from (\psi) or (Z_3) twist to the literal rotating ring plane in the September 1 direct geometry.

### 5.3 Additional historical symbol drift

| Source | (\theta_4) | (\psi) | (\tau) |
|---|---|---|---|
| Undated SAT-Y 4D transcript, blob `9806853dd09ca6b36bcfc530d8333bed53d956c5` | Assistant-assigned geometric/mass angle | Assistant-assigned spin/phase-precession variable | Assistant-assigned topological identity |
| Blockwave PRD-style draft, blob `85a8bc0d0f4bfa7f8d60ca92601d2b5fb4e01148` | Scalar field entering a mass function | Compact phase field | Discrete (Z_3) face twist |
| SATO-BLOCK-INT composite, blob `2cd00dec3a8464dc303fe96f14ae71d7fcf8f31e` | Coordinate-component angle in one equation; metric angle to (u\) in another | Multiple phase/rotation uses | Twist/torsion notation |
| September 1 assistant response | Euclidean tangent-to-plane pitch angle | Internal helix/normal-frame phase | Frenet torsion notation also appears |
| Current BEDROCK control | No global Euclidean angle accepted without a metric and local reference | No established map to the physical ring rotation | No established map to the direct relative-tilt description |

The SATO-BLOCK-INT composite gives (\theta_4=\arccos((dX_4/d\lambda)/|dX/d\lambda|)) at line 902, then (\cos\theta_4=(v^\mu u_\mu)/(\|v\|\|u\|)) at line 1111. At line 1212 it describes a worldline parallel to the time-flow vector as a (90^\circ) case. These conventions are not shown to be equivalent. If (e_4) is identified with (u), the first and last statements conflict; if they are different axes, the missing axis map must be supplied.

The 2026 `SAT MATH — BACKBONE.txt`, blob `1854995be3311f565739f2be64269cbb0385a82f`, contains a declarative “Neutrinos True Boson” classification and a single-coil/(\theta_4=0^\circ) assignment. That is a historical summary, not a direct source or an observational result. It conflicts with the current established-physics control that observed neutrinos are fermions. The September 1 direct message raises a bosonic possibility as a question; it does not authorize reclassification.

The undated SAT-Y 4D transcript also contains a user-labelled correction that the proton and neutron should each be a tight bundle of three side-by-side filaments, with the electron loosely coiled around them. Because the transcript has no raw conversation metadata or timestamp, it is supporting provenance only, not a raw authenticated witness.

## 6. Glossary with stable object types

| Term | Stable type | Attribution/status |
|---|---|---|
| (M^4) | Four-dimensional carrier | Direct descriptive geometry; metric/signature not specified in the September 1 messages |
| (\Sigma_t^3) | Three-dimensional time surface/slice | Direct descriptive geometry |
| (\gamma:I\to M^4) | One-dimensional filament/worldline | Direct geometry; exact parameterization absent |
| (W\subset M^4) | Finite-core worldtube around a centerline | Current HsH typed control; distinct from (\gamma) |
| (W_t=W\cap\Sigma_t^3) | Three-dimensional section of a 4D finite core by a 3D time surface, when regular | Existing HsH dimensional control; not the same as an internal ring |
| (v(s)) | Filament/worldline tangent | Current BEDROCK control |
| (u(x)) | Local time direction, potentially sheet normal or average propagation direction | Current BEDROCK control; competing interpretations remain open |
| (P(s)) | Candidate oriented internal 2-plane/ring plane in the normal space of the centerline | Proposed typed reconstruction; not yet source-defined as a field |
| (\theta_4) | Unresolved angle/parameter whose reference axis and metric must be specified | Multiple historical meanings; no single stable definition |
| Spin | Literal physical rotation | Current BEDROCK control |
| Flavor/precession/shelf-cocking | Same underlying relative tilt in the current control | Not an independent third Frenet curvature |
| (\Omega) | Constant skew generator in an assistant-proposed kinematic model | Assistant reconstruction |
| (S^3) foliation | Euclidean radial decomposition (X=Rn) | Assistant reconstruction, not selected direct model |
| (A_4) | Historical discrete flavor group | SAT.O13 module, not mapped to the direct tilt |
| (Z_3) twist | Historical discrete Blockwave field | Derivative draft, not mapped to (A_4) or the ring plane |
| (\psi) | Historical phase variable with inconsistent roles across documents | No single stable map |
| (\tau) | Historical topological/twist/torsion symbol with inconsistent roles | No single stable map |

## 7. Diagram of mappings and missing seams

### 7.1 Direct geometry

```text
                 four-dimensional carrier M^4
       ┌──────────────────────────────────────────┐
       │                                          │
       │  filament/worldline γ                    │
       │       │                                  │
       │       ├── finite-core thickening ──> W   │
       │       │                                  │
       │       └── internal plane/ring P(s)       │
       │                    │                     │
       │                    │ relative to v(s),u  │
       │                    v                     │
       │             spin / relative tilt         │
       │                                          │
       │  three-dimensional time surface Σ_t     │
       │       │                                  │
       │       └── section W ∩ Σ_t ──> readout     │
       └──────────────────────────────────────────┘
```

The direct source supplies the objects and intended relationships at a descriptive level. It does not supply a unique (P(s)), a metric (g), a local (u(x)) field, or the projection that maps the internal orientation to an observable.

### 7.2 Historical assistant branches

```text
Direct 4D filament + time surface + internal ring orientation
        |
        +--> LLM A: Euclidean helix -> θ4=pitch angle -> Frenet κ1,κ2,κ3
        |
        +--> LLM B: unit tangent T -> Ω in so(4) -> proposed g
        |
        +--> LLM C: X=R n -> S3 foliation -> u=n -> expansion
        |
        +--> LLM D: Newton x(t) -> X(t)=(ct,x(t)) -> persistent history

No projection/composition maps currently identify these branches.
```

### 7.3 Historical SAT-O/Blockwave branches

```text
SAT.O13: A4 representation / PMNS / discrete phase sector
       ? 
       ? no source-defined projection to three geometric tilts
       ?
Blockwave draft: ψ phase field / Z3 twist / π-holonomy
       ?
       ? no source-defined map to internal ring-plane rotation
       ?
Current direct control: literal spin + one relative tilt
```

A possible group-theoretic relation between (A_4) and (Z_3) exists in standard group theory, but no source says that the Blockwave twist is the intended quotient of the SAT.O13 action. It is therefore a candidate map only, not an adopted equivalence.

## 8. Original propositions versus translations

| ID | Proposition | Source class | Assessment |
|---|---|---|---|
| ND-1 | A filament/worldtube intersects a 3D time surface and yields an observed section | September 1 raw user messages | Direct descriptive geometry |
| ND-2 | An internal ring/cross-section orientation changes relative to the local tangent/time reference | September 1 raw user message | Direct geometric intent; exact field and metric absent |
| ND-3 | Spin and flavor may be represented by nested helices or by rotation plus precession | September 1 raw user messages | Competing direct hypotheses, not resolved |
| ND-4 | Four orthogonal axes, one expanding direction, rotational momentum, and two shells may offer a more symmetric construction | September 1 raw user message | Direct exploration, not a fixed metric |
| ND-5 | Newton plus one new assumption plus time may be enough | September 1 raw user question | Question only; no assumption adopted |
| LLM-1 | (\tan\theta_4=p/R), with flavor represented by (\kappa_3) | September 1 assistant | Conditional Euclidean helix reconstruction; no map to direct relative tilt |
| LLM-2 | (T'=\Omega T), (\Omega^T=-\Omega), with a 3+3 split | September 1 assistant | Added kinematic model |
| LLM-3 | (g=\delta-2u\otimes u) | September 1 assistant | Added metric proposal; no Minkowski map |
| LLM-4 | (X=Rn), (u=n), (n\in S^3) | September 1 assistant | Added radial foliation; selects one unresolved time-direction interpretation |
| LLM-5 | (X(t)=(ct,x(t))), with persistent trajectory as the one new assumption | September 1 assistant | Candidate minimal ontology; not accepted by a later direct message in this export |
| HIST-1 | (M_\ell=m_0U_T^k), (M_\nu=m_\nu U_S) | SAT.O13 historical module text, dated 2025-06-20 | Discrete flavor construction; not mapped to geometric precession |
| HIST-2 | (\mathcal L_{\theta\psi}), (m^2(\theta_4)), (S_\tau) | Undated Blockwave-derived manuscript draft | Derivative equations; standalone Module 4 source missing |
| CTRL-1 | Spin is literal rotation; flavor/shelf-cocking is the same relative tilt; (u(x)) is local and its interpretation remains open | Current BEDROCK summary of later direct control | Operationally controlling; raw message locator not recovered |

## 9. Discrepancy ledger

| ID | Discrepancy | Required correction or boundary |
|---|---|---|
| D1 | Direct source offers several alternatives; assistant successively chooses four different primitives | Preserve alternatives until Nathan Direct selects or supplies a map |
| D2 | (\theta_4) is used as a pitch angle, a mass field, a coordinate angle, and a metric angle | Do not equate these without a reference-axis, metric, and conversion map |
| D3 | Assistant identifies flavor with Frenet (\kappa_3) | Current control defines flavor/shelf-cocking as the same relative tilt; a map from internal-plane tilt to (\kappa_3) is absent |
| D4 | Internal ring orientation is conflated with centerline curvature | Keep the normal-plane orientation field and centerline Frenet frame as different object types |
| D5 | A 1D ring, 1D filament, 4D worldtube, and 3D time-surface section are sometimes treated interchangeably | Use the typed (\gamma), (W), (\Sigma_t), and (W\cap\Sigma_t) objects |
| D6 | Euclidean (\theta_4) is used as though it were a physical invariant | Minkowski baseline controls; no Lorentz-invariant angle/rapidity is defined yet |
| D7 | (S^3) radial normal is selected as the local time direction | Time-sheet, bulk, and temporon-propagation alternatives remain open |
| D8 | (SO(4)) 3+3 decomposition is treated as a physical 3+3 universe or Lorentzian rotation/boost split | Supply the metric and Lie-algebra/group map before making that identification |
| D9 | Newtonian (ct) embedding is treated as a complete 4D spacetime model | It is a coordinate embedding until metric, causal structure, and parameterization are supplied |
| D10 | SAT.O13 (A_4) flavor and Blockwave (Z_3) twist are treated as if they were one sector | Supply the intended quotient/representation map; none is recovered |
| D11 | SAT.O13 uses (|\Gamma|=3) in one section and later selects (A_4) of order 12 | Define the orbit/representation projection to three flavor classes |
| D12 | SAT.O13's scalar-unitary ansatz is expected to generate a mass hierarchy | The displayed ansatz alone has equal norm scaling; a complete loop-dressed matrix is missing |
| D13 | The listed (|1+\omega^k|) values are symmetric for the first and third assignments | The source's stated hierarchy is not derived by those factors alone |
| D14 | Blockwave draft assigns (\psi), (\tau), and (\theta_4) new field meanings without a map to the direct geometry | Keep as historical derivative equations, not current direct definitions |
| D15 | A historical summary classifies neutrinos as true bosons | Do not promote; standard observed neutrinos remain fermions |
| D16 | The later BEDROCK direct correction is available only as a summary, not a raw message locator | Recover the October 22 raw source before treating the summary as a new primary quotation |

## 10. Lean 4 / Mathlib proof-first gate

### 10.1 Existing geometry formalizations inspected

- Nadir PR #262 already formalizes an affine line/hyperplane slice and a pitch-independent helix slice in a conditional Euclidean model.
- Ravel PR #1133 formalizes a transverse carrier/timesheet section and related dimension bookkeeping.
- These are relevant to the direct intersection/readout geometry, but neither supplies the missing spin/flavor map.
- Aster PR #905 remains an unrelated provenance formalization and was not modified.

### 10.2 New conditional algebraic gate

A draft proof-only PR was opened against the existing Lean infrastructure branch, not against HsH main:

- PR: #1220
- Branch: `research/aster-o13-unitary-mass-gate-20261101t1700z`
- Base: `infra/lean4-verification-20261023`
- Head at submission: `6a66217979b9caacff06fa407cd9ccd1cdd7999e`
- New module: `FORMAL_VERIFICATION/HsHVerification/AsterO13UnitaryMassGate.lean`
- Module blob: `29115ccc65df0ae671f37b06ca80a83e29998e1b`
- Root import blob: `17eca2f0b31689f118422b49fac1ff88a07456b6`

The module proves, conditionally, that a scalar multiple of a norm-preserving map scales every vector norm by the same factor, and therefore cannot by itself split two directions by norm. This is the precise algebraic boundary of the displayed SAT.O13 (M_\ell=m_0U_T^k) ansatz.

The proof does **not**:
- prove the SAT.O13 A4 representation is correctly constructed or unitary;
- formalize the separate loop-dressing term;
- prove a physical mass spectrum;
- establish any relation to the September 1 ring-plane geometry;
- validate particle identity, neutrino statistics, or physical premises.

The CI run was still in progress at the last check: run `#41330715937`, job `#124920032346`, on merge reference `c7b0e836ca07d7708e83d179b0601fcb7cc8e1e7`. The actual Lean compile result must be read back before claiming success. No local Lean or Lake executable is installed in the runtime; the existing HsH Lean 4.34.0 / Mathlib 4.34.0 CI is the verification route.

### 10.3 Proof status

`SUBMITTED_NOT_VERIFIED` at report assembly. No theorem is promoted to BEDROCK. If the CI succeeds, a source-linked Factory Floor intake packet is required; it remains a workshop intake, not acceptance of the physics.

## 11. Cross-domain lens check

| Lens | What is actually present | What is not established |
|---|---|---|
| Local geometry / global carrier | Filament, finite-core worldtube, time surface, internal orientation | A global foliation or unique local (u(x)) |
| Inside / outside | Internal ring-plane orientation versus external time-surface reference | A map from internal rotation to external readout |
| GR | A 4D carrier and time direction are discussed | Metric signature, causal structure, invariant (\theta_4), or a map to Minkowski |
| String theory | A closed-string analogy is mentioned | Worldsheet action, string state, or equivalence to the filament |
| SM/QM | Flavor, PMNS, spin, neutrino statistics are discussed in historical layers | A representation map from geometry to the Standard Model or quantum observables |
| Information | Topological locking and information conservation are questioned | A defined invariant, channel, or conservation theorem |

The current baseline remains established Minkowski/GR and Standard Model physics. The September 1 exploratory geometry is not a replacement.

## 12. Tooling and cost preflight

- Existing Math Hopper was checked. It is an archive/equation extraction aid, not a Lean theorem prover.
- Existing Lean 4/Mathlib infrastructure and open PRs were reused. No new dependencies were added.
- Existing Whirligig material was checked; it is a separate geometric candidate-finding/derivation tool and does not supply the missing spin/flavor source maps.
- SciSpace or another paid research service was not needed for this archive-grounded source-fidelity task.
- No new tool, plugin, paid service, or physical simulation was created.

## 13. Operational disposition

- Existing :00 task ID `6aa1fe0de5e48191b886496095b1343f` remains enabled with its original hourly America/New_York `:00` schedule and phase unchanged.
- No sixth task, task edit, ID change, cadence change, or phase change.
- The next ring label is Ariadne. The :12 automation remains disabled; no task was re-enabled.
- No authenticated Aster or Ariadne current ChatGPT thread was established. Repository records are not thread delivery or acknowledgment.
- No physical calculation, numerical fixture, fit, CODATA scoring, or empirical claim.
- No BEDROCK or symbol-registry change, no branch promotion, no PR merge, and no theory promotion.
- Paper gates remain separate: November 9, November 30, and December 14 were not advanced.
- Orson's protected cognition remit was untouched.
- FIE rereview is not due; last full review was 2026-10-27.
- The unrelated-reading cursor remains Babbage, lines 761-800, next line 801. No redundant repeat was made.

## 14. Next deeper cursor

1. Recover the raw October 22 Nathan Direct source underlying the current BEDROCK spin/flavor/time-direction correction.
2. Recover the standalone original SAT.O13 module and the original Blockwave Module 4 source, including their exact author/context/date and verbatim equations. The current PDF copy and derivative drafts are not substitutes.
3. Define (M^4), its metric, the time-surface (\Sigma_t), local (u(x)), filament tangent (v(s)), finite core (W), and internal plane (P(s)) as typed objects.
4. Define the worldline-to-worldtube thickening map and the time-surface section map, including regularity/transversality conditions.
5. Define the projection from internal plane orientation to the current single relative-tilt description. Do not substitute Frenet (\kappa_3) without a map.
6. If SAT.O13 (A_4) and Blockwave (Z_3) are intended to be related, specify the actual quotient/representation map and what information it preserves.
7. Define how (\psi) phase and (\tau) twist map, if at all, to literal physical ring rotation and precession.
8. Keep the (\Omega), (S^3), and Newton-plus-history models as assistant proposals until they are derived from the existing source geometry and checked against the Minkowski baseline.
9. Revisit the SAT.O13 loop-dressing step only after its complete matrix/operator composition is recovered. The current Lean gate checks only the scalar-unitary component.
10. Do not score CODATA, calculate a physical mass, or promote a new mechanism in this source-fidelity lane.

**Final classification:** substantial Nathan Direct geometry recovered; four historical assistant primitives separated; SAT.O13 and Blockwave equations traced to dated/undated derivative sources; one conditional Lean algebra gate submitted; no physical or theory claim promoted.
