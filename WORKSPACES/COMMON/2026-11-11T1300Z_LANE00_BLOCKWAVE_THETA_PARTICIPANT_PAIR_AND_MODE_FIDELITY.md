# Lane 00 | Blockwave θ participant-pair and mode-transition fidelity

**Status:** ADDITIVE SOURCE-FIDELITY FINDING / ORIGINAL EQUATIONS PRESERVED / CANDIDATE MAP ONLY / NO PHYSICAL CALCULATION / NO CODATA / NO THEORY PROMOTION.

## 1. Scope and duplicate control

This is a narrow additive crosswalk, not a replacement for the existing SAT/Blockwave source audits. The prior Morrow reconciliation already distinguishes θ₄ from compact θ, J^μ from J^{μν}, and the direct worldline from the assistant's worldsheet current. Tern issue #1473 already preserves the θ₄ convention history and its unresolved plane-versus-normal conflict. PR #1133 already contains a conditional carrier/timesheet dimension gate.

The new delta here is more specific:

1. The October 22 assistant geometric translation assigns its θ to a different pair of geometric participants than the direct θ₄ description.
2. It expands an intersection-local angle into a field over the time surface/bulk without an extension map.
3. The historical source sequence moves from a static-block core mode to later reciprocal filament/timesheet interaction, but does not declare whether the later description is Mode 2, a revision, or a separate branch.
4. A normal-bundle interpretation could explain why a compact phase naturally accompanies a 2D worldsheet current, but it requires a worldline-to-worldsheet construction absent from the direct source.

No existing equation is overwritten and no correction is silently substituted.

## 2. Source custody

| Source | Date / identity | Custody and status |
|---|---|---|
| SAT₄D Canonical Summary / Live Draft | June 2025; Nathan McKnight byline; Git blob 2a79fe25018cce7e99a2c33786d88b0551db6ae7 | Bylined draft with AI/developer assistance context; document-level source, not a raw user message. |
| SAT.O Official Directives | July 2025; unbylined; Git blob 167136310cdf33ca8f986f33634692314c1a0946 | Historical directive file, not a recovered raw user message. |
| SAT_O 2.0 Module O1: 4D Hyperhelical Filament Dynamics | Undated / unbylined; Git blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc | Historical module, not Nathan Direct. |
| BLOCKWAVE CLEAN ACTION | Undated / unbylined attachment; Git blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d | Assistant-generated attachment in the October 19 conversation; raw conversation identifies the assistant turn. |
| Earlier Blockwave action conversation | Conversation 68f4d9b5-b908-832e-940e-6782db174a4a; raw Git blob 1f074cc67057ae9df1e92bab45e8ba34c96b0d77 | October 19, 2025. Assistant message 121d607d-53e7-4b5a-8a7a-75d7e09deb3d at 12:29:46.538Z. |
| Blockwave Lagrangian formula conversation | Conversation 68f51c5a-49d4-832c-beb0-105d204e2f58; raw Git blob 7e5dc51d2ec7f93e2277a37b491707b7acb3df83 | October 19–22, 2025. Assistant full-action message 76f4dd19-1e0e-4974-ab0f-12ab77fd23c9 at 2025-10-19 17:14:05.377Z. |
| User adoption of four-sector θ taxonomy | Same conversation; user message 4f5dac5d-0f94-4f27-940f-f6004147c0a7 | 2025-10-22 10:35:08.275Z. Direct adoption of the taxonomy as a working reference, not authorship or validation of the full action. |
| User-supplied FIE geometry / translation request | Same conversation; user message e4331fc2-bae8-4ce0-bebf-2a3512816a3f | 2025-10-22 10:47:32.443Z. User-role message carrying FIE text and requesting a geometric translation. |
| Assistant geometric translation | Same conversation; assistant message ac9ce1e5-c0cb-47a7-8b5f-87f8b37ad6d9 | 2025-10-22 10:47:33.773Z. Assistant reconstruction, not Nathan Direct. |
| Extended FIE raw source | Conversation 6902f3c2-ee54-832b-8c70-b5a6fd900798; raw Git blob 0a7a270482bdda92a61d1c54ccccaf356e47aa0b; user message f476afce-eba0-4312-8c2b-36b82dbe7f3f | 2025-10-30 05:12:46.507Z. Raw user-role source for the extended FIE text; not proof of the document's original composition date. |

The October 22 user-role message supplies the FIE as translation material; the October 30 raw user-role message supplies the extended FIE source again. The original document-creation timestamp is not established. The assistant-generated action and translation remain separate from those direct source messages.

## 3. Nathan Direct geometry, independently extracted

The FIE source describes:

- A physical filament as a one-dimensional worldline in a four-dimensional structure.
- A three-dimensional time surface/wavefront intersecting that filament.
- The particle manifestation as the point of intersection.
- Mutual interaction and energy transfer between filament and timesheet.
- A reaction on the timesheet, including a proposed change in its curvature.
- Filament tension and finite tensile strength/flexibility as physical constraints.
- A proposed gross/absolute intersection angle θ₄, associated with energy transfer and mass.
- Helical/braided traces as histories of intersection, with spin/flavor correspondences still proposals.
- Futureward/pastward “backbleed” as tentative, explicitly limited by finite tensile strength and flexibility.

These are direct conceptual propositions, not demonstrated physical laws. The FIE does not provide a complete metric, a typed foliation, a formula for θ₄, or a constitutive equation for tensile failure.

### θ₄ convention remains historically unsettled

The FIE phrase “gross or absolute angle of intersection” does not by itself settle the reference direction. Tern issue #1473 documents the direct-source history:

- A March 7, 2026 direct message describes θ₄ relative to the timesheet plane and gives a 90° vacuum convention.
- A July 1, 2026 direct message gives a normal-relative description but also says 90° when the filament axis is parallel to the time normal, which is internally inconsistent under ordinary angle conventions.
- Later direct usage tends toward θ₄ → 0 in the straight/vacuum limit.
- Current BEDROCK BR-005 adopts a normal-relative working baseline, but that does not erase the earlier direct-source conflict.

The current working baseline may be used provisionally; the convention history must remain visible.

## 4. Historical assistant reconstruction

The Blockwave action introduces a different set of objects:

- g_{μν}: an emergent metric.
- u^μ: a unit timelike time-flow vector, with u^μu_μ = −1.
- θ: a compact phase, θ ~ θ + 2π.
- P^μ{}_ν = δ^μ{}_ν + u^μu_ν: a Lorentzian spatial projector.
- J^{μν}: a conserved rank-2 “filament worldsheet” current.
- A_μ(θ) = α_*∇_μθ and F_{μν} = ∇_[μA_{ν]}.
- M^{μν}{}_{ρσ}(θ,u): an optional local medium-response kernel.

The action is integrated over the four-dimensional bulk. It is not the direct one-dimensional line action. The existing Morrow/Nadir source audits already document the worldline/worldsheet support distinction; this report does not repeat that derivation.

The user later adopted the four-sector taxonomy (compact phase, holonomy coupling, medium response/mixing, time-flow) as a working reference. That does not retroactively make the assistant-generated action Nathan-authored.

## 5. New discrepancy: the geometric translation changes the angle's participants

The direct θ₄ proposal concerns filament/time-surface incidence at the intersection event. Under the current normal-relative working convention, its geometric pair is schematically:

\[
\theta_4 \sim \operatorname{angle}(T_\gamma,n_\Sigma)
\quad\text{on}\quad I=\gamma\cap\Sigma .
\]

This is only a typed description; the historical direct source has not fixed the full metric, orientation, or convention.

The assistant's October 22 geometric translation instead describes θ as the “tiny angular offset between the pure normal of the time surface and the direction it actually advances.” That is a different pair:

\[
\theta_{\rm geo}\sim \operatorname{angle}(n_\Sigma,u).
\]

Here T_γ has been replaced by the time-flow/advance vector u. This is a participant-pair change, not a mere change of notation.

There is also a domain change:

- Direct θ₄ is described at filament/timesheet intersection events.
- Blockwave θ is a compact scalar phase over the field domain.
- The assistant translation describes a local time-surface orientation/shear field.

No source-defined map extends the intersection-local θ₄ to a bulk S¹-valued field. No source-defined relation identifies u^μ with the timesheet normal or with the motion of the timesheet.

If u is defined to be the unit normal of the timesheet, the assistant's normal/advance misalignment is zero by construction. If u is not the normal, both u and n_Σ must be independently defined. The action contains u, but does not explicitly supply an embedded Σ_t, its normal field, or the foliation map.

The assistant's translation therefore proposes a new angle, not a recovered definition of θ₄.

## 6. Candidate normal-bundle reading of compact θ

A possible geometric interpretation is available, but it is conditional:

- If a two-dimensional worldsheet W² ⊂ M⁴ is explicitly introduced, its normal bundle has rank two.
- With a metric and orientation, rotations of an oriented two-dimensional normal frame have structure group SO(2) ≅ U(1). A compact phase can therefore be natural as a normal-frame angle or normal-bundle phase.
- A connection on that normal bundle can have nonzero curvature and U(1) holonomy. This is geometrically different from the incidence angle θ₄.

However, the direct FIE's primitive filament is one-dimensional. Its normal bundle in four dimensions has rank three; it has no canonical single U(1) normal-frame phase without selecting a two-plane or reducing the structure group. A map such as

\[
S:\gamma^1\times I\longrightarrow W^2
\]

would be needed to sweep the direct filament into a worldsheet. No such source-defined sweep is present.

This candidate could make the assistant's J^{μν} and compact θ geometrically compatible on W², while leaving θ₄ as a separate incidence diagnostic. It is not an established SAT equivalence and is not a corrected equation.

The action's exact-gradient ansatz A = α_*dθ also remains insufficient by itself for nonzero local curvature for a smooth, single-valued θ. A normal-bundle connection would require local connection forms and transition data, not simply a globally exact derivative. Prior audits have already flagged this issue; no new resolution is claimed here.

## 7. Mode evolution: static block to reciprocal interaction

| Source layer | Geometry/dynamics | Epistemic status |
|---|---|---|
| June 2025 SAT₄D Live Draft | Mode 1 treats the 4D block and filaments as fixed; only Σ_t moves. Mode 2 permits localized constrained adjustments; Mode 3 describes a solidification front. | Nathan-bylined draft; Mode 1 is the default. |
| July 2025 SAT.O Official Directives | 4D manifold populated by 1D filaments; derived behavior must emerge from filament geometry and intersection with a propagating 3D wavefront; no unstated assumptions or extrinsic fields. | Unbylined historical directive; all extensions remain tentative. |
| October 2025 FIE | Reciprocal filament/timesheet interaction, energy transfer, timesheet back-reaction and curvature response; future/past backbleed is tentative. | User-role source. |
| October 2025 Blockwave action | Dynamical u^μ, compact θ, J^{μν}, and optional M(θ,u) response kernel. | Assistant-generated reconstruction. |
| November 8, 2026 operational model | Worldtube and timesheet are the minimal working primitives; responsive medium remains a provisional third primitive. | Assistant-prepared transcription of a direct user position, not a verbatim raw message. |

The FIE's reciprocal interaction may be a Mode 2 extension or a revision of the earlier Mode 1 restriction. The direct source does not explicitly assign it to a mode. No contradiction or supersession is asserted without that declaration.

The Blockwave u-elasticity and M terms are possible response mechanisms, but no explicit map to the embedded timesheet, its normal, reciprocal stress/energy exchange, or the FIE tensile-strength limit is supplied. The attachment itself says M may be set to zero for the strict minimal core. It should therefore remain optional, consistent with the current provisional-medium status.

## 8. Verbatim equation custody

### SAT₄D Live Draft — bylined June 2025

The draft's hyperhelix and line action are preserved as historical document equations:

\[
\gamma^\mu(\lambda)=
\left(
\lambda,
A_x\sin(k_x\lambda+\phi_x),
A_y\sin(k_y\lambda+\phi_y),
A_z\sin(k_z\lambda+\phi_z)
\right),
\]

\[
v^\mu(\lambda)=\frac{d\gamma^\mu}{d\lambda},
\qquad
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),
\]

\[
L=\frac12 m v^\mu v_\mu-V_{\rm tension}(\gamma).
\]

These are document-level equations, not recovered raw Nathan Direct equations.

### SAT_O 2.0 Module O1 — undated/unbylined

The module repeats the same hyperhelical curve and line-action form. Its file hash is 7577aa1ee5a6c3850ce3b226c75377de6367aedc. It must not be promoted to Nathan Direct by proximity to the bylined draft.

### BLOCKWAVE CLEAN ACTION — undated/unbylined assistant-generated attachment

The stored definitions are:

\[
A_\mu(\theta)\equiv\alpha_*\nabla_\mu\theta,
\qquad
F_{\mu\nu}(\theta)\equiv\nabla_{[\mu}A_{\nu]}(\theta),
\]

\[
\nabla_\mu J^{\mu\nu}=0,
\qquad
u^\mu u_\mu=-1,
\qquad
\theta\sim\theta+2\pi .
\]

The stored bulk-action block is preserved here as transcribed from the attachment, including its original token spellings; no silent repair is applied:

\[
\begin{aligned}
S \;=\; \int d^4x\,\sqrt{-g}\;\Big[
&\frac{M_{\rm P}^2}{2}R
+\frac{f_\theta}{2}\nabla_\mu\theta\nabla^\mu\theta
-\Lambda_\theta^4(1-\cos\theta)\\
&+\tfrac{c_1}{2}P^{\alpha\beta}P^{\mu\nu}(\nabla\alpha u_\mu)(\nabla_\beta u_\nu)
+\tfrac{c_2}{2}(\nabla_\mu u^\mu)^2
+\lambda(u^\mu u\mu+1)\\
&+\tfrac{\kappa_0}{4}J_{\mu\nu}P^\mu{}_\rho P^\nu{}_\sigma J^{\rho\sigma}
+\tfrac{\kappa_2\ell^2}{4}(\nabla_\alpha J_{\mu\nu})P^{\alpha\beta}P^\mu{}_\rho P^\nu{}_\sigma(\nabla_\beta J^{\rho\sigma})\\
&+\frac{g_h}{2}F_{\mu\nu}(\theta)J^{\mu\nu}
+\frac12 J{\mu\nu}\mathcal M^{\mu\nu}{}{\rho\sigma}(\theta,u)J^{\rho\sigma}
\Big].
\end{aligned}
\]

The attachment contains the literal token forms \(\nabla\alpha u_\mu\), \(u\mu\), and \(J{\mu\nu}\) in the corresponding terms. The later assistant full-action message is a separate raw source witness, not a Nathan correction. No corrected equation is issued here.

Attachment Git blob: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d. The later full-action assistant message is in raw conversation blob 7e5dc51d2ec7f93e2277a37b491707b7acb3df83, dated October 19, 2025.

## 9. Original versus translated propositions

| Direct/source proposition | Assistant translation | Fidelity assessment |
|---|---|---|
| Particle is the filament/time-wavefront intersection. | θ is a local time-surface normal/advance misalignment. | Different geometric participants; no map. |
| θ₄ is an incidence/mass-transfer diagnostic at the intersection. | θ is a compact S¹ phase over the field domain. | Different type and domain; no extension or frame map. |
| Filament and timesheet mutually interact. | u-elasticity and M(θ,u) are possible response sectors. | Plausible proposal; no derivation of reciprocal source equations or constitutive bounds. |
| Filament is a 1D worldline. | J^{μν} is a 2D worldsheet current. | Requires a sweep/thickening map; existing support-dimension audits cover the dimensional distinction. |
| Future/past backbleed is tentative and self-limited. | Local bulk action with no explicit two-sided temporal kernel. | No advanced/retarded or boundary-value map is supplied. |
| Finite tensile strength and flexibility limit reconfiguration. | Quadratic stiffness terms and optional M. | No finite failure bound or constitutive law is derived. |
| SM/GR/QM are importable unless consistency requires otherwise. | Assistant suggests one action can derive essentially all physics. | Unsupported overstatement; no complete representation/matching derivation is present. |

## 10. Stable glossary

| Term | Typed meaning |
|---|---|
| γ¹ | Direct 1D filament/worldline. |
| Σ³ | Direct 3D time surface/wavefront. |
| I⁰ | Particle/intersection event, under transverse intersection. |
| T_γ | Tangent to the filament. |
| n_Σ | Normal to the timesheet; requires a declared metric and orientation. |
| θ₄ | Direct intersection-angle diagnostic; convention history remains unresolved. |
| θ_geo | Assistant's normal/advance misalignment angle. |
| θ_B | Blockwave compact phase field. |
| u^μ | Assistant-introduced time-flow vector; unit timelike under the action's Lorentzian metric. |
| W² | Candidate swept worldsheet; not yet a direct primitive in the FIE source. |
| J^{μν} | Assistant-introduced conserved rank-2 worldsheet current. |
| A,F | Assistant connection-like one-form and curvature two-form. |
| M | Optional medium-response kernel; not a derived constitutive law. |
| φ_i | Hyperhelix phase shifts; distinct from θ and θ₄. |

## 11. Mapping diagram

    DIRECT FIE
      γ¹ (filament)  ---- intersects ----  Σ³ (time wavefront)
           |                                  |
          Tγ                                 nΣ
            \                                /
             \---- I⁰ = particle event -----/
                        |
                 θ₄ at the intersection
           (historically ambiguous convention)

    ASSISTANT BLOCKWAVE
      M⁴, g, uᵘ, θ_B : M⁴ → S¹, J²
              |            |
              |            +-- A = α dθ_B → F = dA
              +-- assistant retelling:
                  θ_geo ≈ angle(nΣ, u)

    CANDIDATE BRIDGE, NOT SOURCE-DEFINED
      γ¹ × I --sweep--> W² ⊂ M⁴
                           |
                           +-- rank-2 normal bundle
                           |       |
                           |       +-- SO(2) ≅ U(1) phase candidate
                           |
                           +-- W² ∩ Σ³ → 1D trace

    MISSING MAPS
      θ₄ on I⁰ → θ_B on M⁴ or W²
      γ¹ → W² → J²
      uᵘ ↔ nΣ / foliation Σ_t
      M(θ,u) ↔ finite tensile strength and reciprocal response

## 12. Formalization and actual execution

Existing PR #1133 was reused, not modified:

- Exact head: ce59ec57a2aff34b6fa84f1510e192ee292829f5.
- GitHub Actions run: #42986393293.
- Result: SUCCESS; Lean 4.34.0 / Lake 5.0.0 root build.
- The existing formalization covers conditional carrier/timesheet intersection-dimension arithmetic and a normal-connection reduction.

This run added no Lean module or theorem. The source-defined W², its normal bundle, the θ₄-to-θ map, and the u-to-foliation relation are not defined, so a theorem about them would currently formalize an assistant-chosen construction rather than a source-established proposition. Local Lean/Lake/Elan executables are absent.

The successful existing CI proves only the statements actually formalized. It does not prove the source translation or physical premises. Tests, lint, nanoda, and a separate global axiom audit were not run in the cited job.

A live PR reference warning: an earlier Aster note calls PR #759 a Blockwave phase-algebra proof, but live PR #759 is currently the unrelated Loom embedded-NotebookLM change. It is not used as Blockwave proof evidence.

## 13. Mersearch, reuse, and boundaries

Mersearch was not callable in this runtime. Existing completed Mersearch receipts for the worldtube/source-strata and J³/J² source crosswalk were reused as locators; no occupied request lane was overwritten or retriggered. The original raw exports were then read directly from HsH and the SAT archive. The HSH_RESOURCES index search surfaced secondary summaries rather than a new primary source; no private reference links or content are reproduced here.

Existing Math Hopper #578, PR #1133, Whirligig Kernel 0, and the connected SciSpace route were checked. No new tooling, dependency, branch, or paid service was created.

No physical calculation, synthetic fixture, CODATA scoring, observational validation, or prediction-versus-fit comparison was performed.

## 14. Next deeper cursor

1. Recover the raw September 16 θ₄ clarification and reconcile the March plane-relative, July inconsistent, and later normal-relative conventions.
2. Define the timesheet foliation/embedding Σ_t, its normal n_Σ, and the exact relation (if any) to u^μ.
3. Decide whether Blockwave θ is a distinct normal-bundle phase on an explicitly defined W², or a different bulk field. If W² is intended, specify the sweep map from γ¹.
4. Define the metric map between the native ++++ ambient geometry and the action's Lorentzian g_{μν}.
5. Supply a constitutive law for finite tensile strength/flexibility and a declared temporal boundary-value model if future/past backbleed remains.
6. Declare whether the reciprocal FIE belongs to SAT₄D Mode 2, a revision of Mode 1, or a separate branch.
7. Only after these definitions, formalize the typed maps and run exact-head Lean CI.

**Disposition:** SOURCE-FIDELITY DELTA / PARTICIPANT-PAIR MISMATCH IDENTIFIED / NORMAL-BUNDLE PHASE IS A CONDITIONAL CANDIDATE ONLY / ORIGINAL EQUATIONS PRESERVED / NO NEW LEAN CLAIM / NO PHYSICAL CALCULATION / NO CODATA / NO THEORY PROMOTION.
