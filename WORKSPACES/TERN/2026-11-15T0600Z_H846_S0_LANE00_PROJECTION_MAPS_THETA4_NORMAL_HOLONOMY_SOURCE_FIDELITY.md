# Tern h846:s0 | Lane 00 geometry-fidelity addendum
## Explicit projection maps, θ₄ versus normal holonomy, and source-support typing

**Status:** SOURCE-FIDELITY ADDENDUM COMPLETE  
**Parent reports:** [Aster h844, issue #1772](https://github.com/Satobloc/HsH/issues/1772); [Calder h845, issue #1773](https://github.com/Satobloc/HsH/issues/1773); [Ravel normal-connection audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/RAVEL/2026-11-11T0800Z_NORMAL_CONNECTION_PLANE_REDUCTION_AND_SOURCE_FIDELITY.md); [Mercer SAT-O1/Blockwave custody audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERCER/2026-11-14T0800Z_H824_S0_SAT_O1_BLOCKWAVE_WWRD_SOURCE_FIDELITY.md).

This is a distinct addendum, not a replacement for the parent reports. It adds direct November 8 source messages that were not enumerated in the h844 report, and makes an explicit cross-era type distinction between Nathan Direct θ₄ and the assistant-built normal-plane connection/holonomy apparatus.

No physical calculation, CODATA scoring, theory promotion, or new mathematical primitive is claimed.

## 1. Source corpus and provenance

All raw exports below were inspected from the user's Library. Counts refer to the active conversation ancestry, not every off-branch node.

| Source | Conversation ID | Raw export SHA-256 | Bytes | Mapping nodes | User messages on active ancestry |
|---|---|---|---:|---:|---:|
| Ravel, *Syncmathcek* | `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f` | `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba` | 12,408,770 | 2,394 | 145 |
| November 4 Geometry | `6aea46dd-dc60-83ea-8d50-689c152340e3` | `032de5256c9ea78459f9ec9adda0e131b3f045f10348827c46f571cdc4147273` | 6,792,927 | 1,341 | 21 |
| November 8 Geometry | `6aecede1-4c08-83e9-abc4-da64f59a4f51` | `875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d` | 8,331,175 | 1,150 | 29 |

The Ravel, November 4, and November 8 export hashes are byte-level hashes of the inspected raw files. The message UUIDs below identify user-role messages on the active ancestry and are retained as primary-source locators, not as proof that assistant translations are faithful.

### Selected primary-source message anchors

| UTC timestamp | User message UUID | Nathan Direct proposition |
|---|---|---|
| 2026-09-06 08:09:54.609Z | `09c6d26f-934f-4be6-b2ae-21a6fc281147` | SAT described through helices, superhelices and braids; no additional field primitives asserted |
| 2026-09-06 08:21:54.475Z | `af313567-c917-4188-86b0-caea0f3398e2` | Force discussed through oscillation, deflection and nested oscillation |
| 2026-09-06 08:38:01.908Z | `381b1288-1fb8-4a18-ae4b-7126cecc2749` | Worldtube/spring language; diameter and oscillation rate treated as intrinsic |
| 2026-09-07 07:39:00.690Z | `8471543a-6ed1-4743-9073-74735f019da4` | Four-dimensional worldtube extension with Kerr cross-section |
| 2026-09-07 07:46:38.573Z | `3d0ad680-51db-4c79-ad4a-9bbacada24ef` | Clarifies that the cross-section is a spatial Kerr section, not full 4D Kerr spacetime |
| 2026-09-07 10:06:12.842Z | `496a15ea-0263-459d-b815-908f52155b90` | Distinguishes 3D Minkowski diagram, full 4D bulk, and a 4D view with 3D slice |
| 2026-11-04 23:33:42.240Z | `100388c5-89d6-4ffd-a895-598990636057` | Mutual worldtube/timesheet curvature as tentative working hypothesis |
| 2026-11-04 23:45:08.641Z | `72649a88-dc26-498f-9b5c-acd15e01e3c5` | Symmetric structural attribution absent a preferential carrier |
| 2026-11-08 03:18:04.646Z | `8f4af45d-7635-44c7-8bc0-addad4e92a95` | Explicit request for projection maps between worldtube, centerline and measured observables; ask what is preserved or discarded |
| 2026-11-08 07:07:41.152Z | `139e1e11-99f1-459b-a6ac-cb865015d0ff` | Distinguishes complete history from a finite present slice; slice completeness is not knowably established |
| 2026-11-08 18:05:28.410Z | `bcbe9ee8-b621-4a40-9edb-b34c17783be5` | Four-dimensional tube around a one-dimensional core, three-dimensional boundary, possible mouth onto timesheet and possible worldsheet simplification |
| 2026-11-08 18:36:17.730Z | `f9356192-0ec6-4a9c-ab53-ab76bf75c42e` | Pair-of-pants is one specific split; Horned Sphere is a candidate split/merge topology |
| 2026-11-08 18:58:38.020Z | `6db8c5e8-a2db-4621-922e-adab214e025e` | θ₄ as canonical vacuum/matter distinction; mass emergent; conservation accounting unresolved |
| 2026-11-08 20:18:10.172Z | `c0520975-02a0-408f-a250-364b88ab7b30` | Mouth onto timesheet, intersection, or older bosonic-time wavefront remain alternatives; Klein Fabric remains speculative |

The h844 report correctly identified the November 8 conversation and the tube/θ₄ messages, but it did not enumerate the earlier explicit projection-map request or the separate history/slice epistemic message. This addendum repairs that coverage without invalidating the h844 conclusions.

## 2. Stable geometry glossary

| Symbol / term | Type and dimension | Attribution and status |
|---|---|---|
| \(\gamma^1\) | One-dimensional filament core/centerline | Nathan Direct descriptive object; exact embedding and parametrization depend on model |
| \(K^3\) | Three-dimensional spatial Kerr section | Nathan Direct proposal; topology, metric, boundary and embedding remain unspecified |
| \(W^4\) | Four-dimensional finite-core worldtube/support | Nathan Direct proposal; whether a region, manifold-with-boundary, or fibered total space must be specified |
| \(\partial W^4\) | Three-dimensional boundary of a four-dimensional region | Conditional standard topology; direct source proposes a 3D boundary |
| \(\Sigma_t^3\) | Three-dimensional timesheet / resolving hypersurface | Nathan Direct object; embedding, normal and curvature conventions need typing |
| \(S_{\rm obs}^3\) | Observer's finite present slice | Distinct from \(\Sigma_t^3\) unless an explicit identification map is supplied |
| \(M^2\) | Candidate two-dimensional mouth or boundary section | Assistant reconstruction if \(M^2=\partial W^4\cap\Sigma_t^3\); not a direct-source identity |
| \(\theta_4(x)\) | Scalar angular misalignment between filament and local time-surface | Nathan Direct / BEDROCK scalar; not a vector, normal-plane holonomy, or compact phase |
| \(\omega_s\) | Connection one-form on a selected oriented transverse 2-plane | Assistant-built SO(2) reduction in Ravel's apparatus |
| \(\phi_g\) | Loop holonomy \(\oint\omega_s\) modulo \(2\pi\) | Assistant-built readout; no direct-source map to \(\theta_4\) |
| \(J^{\mu\nu}\) | Antisymmetric rank-two current | Historical Blockwave attachment; embedded authorship unresolved |
| \(\theta_{\rm BW}\) | Compact phase appearing in Blockwave action | Historical model variable; no map to \(\theta_4\) |
| \(F\) / mutual accommodation | Relational response between filament and timesheet distortions | Nathan Direct proposal; no constitutive law or independent field definition |
| \(m\) | Emergent mass / mass proxy | Nathan Direct proposal; no source-defined mass functional or measured calibration |

## 3. Explicit map diagram and conditions

```text
                         T: thickening / fiber map
γ¹ (core)  ---------------------------------------------->  W⁴
  |                                                        |  \
  | N(γ¹/M⁴), rank 3                                       |   \ boundary
  v                                                        |    v
Nγ  -> selected 2-plane -> ωs -> φg                        |   ∂W³
                                                           |
                                                           | intersect with Σt³
                                                           v
                                                    S³ = W⁴ ∩ Σt³
                                                           |
                                                           | boundary, if regular
                                                           v
                                                    M² = ∂W⁴ ∩ Σt³
                                                           |
                                                           | R_M, undefined
                                                           v
                                                     observable O

γ¹ -- incidence with Σt³ --> θ₄(x)

S_obs³ -- unknown identification/projection --> Σt³

No source-defined arrow identifies θ₄ with ωs or φg.
No source-defined arrow identifies M² with the whole timesheet.
No source-defined map yet carries W⁴ or M² to the measured observable.
```

### Conditional dimension bookkeeping

For smooth transverse intersections in a four-dimensional ambient manifold:

| Supports | Conditional intersection dimension |
|---|---|
| \(\gamma^1\cap\Sigma_t^3\) | 0 |
| A two-dimensional worldsheet \(S^2\cap\Sigma_t^3\) | 1 |
| A four-dimensional region \(W^4\cap\Sigma_t^3\) | 3 |
| A three-dimensional boundary \(\partial W^4\cap\Sigma_t^3\) | 2 |

For a one-dimensional embedded centerline in \(M^4\), its normal bundle has rank three. For a full-dimensional four-dimensional support embedded in \(M^4\), the ordinary normal complement has rank zero. The transverse three-dimensional Kerr section is therefore not automatically the normal bundle of the total four-dimensional worldtube. A connection on the centerline's rank-three normal bundle, an internal fiber connection, and the normal connection of a lower-dimensional boundary are different objects.

These are conditional geometric dimension results, not physical calculations. The conditions are smoothness, the stated embedding dimensions, transversality, and, for the boundary statements, a well-defined manifold-with-boundary structure.

### Projection and composition gates

A source-faithful construction needs at least:

1. A thickening map \(T:I^1\times K^3\to M^4\), or another explicit construction of \(W^4\), with a stated fiber, embedding, boundary and regularity.
2. A centerline projection \(\pi:W^4\to\gamma^1\), if the tube is intended to reduce to the core.
3. An embedding \(i_\Sigma:\Sigma_t^3\hookrightarrow M^4\), with metric and normal conventions.
4. A specified intersection/restriction map \(W^4\to W^4\cap\Sigma_t^3\).
5. A separate boundary/mouth map if \(M^2\) is intended to be a mouth.
6. A reduction or quotient \(Q:W^4\to S^2\) if the 4D support is to be represented by a 2D worldsheet.
7. An observer-slice map \(S_{\rm obs}^3\to\Sigma_t^3\), if those slices are intended to coincide.
8. A readout \(R:W^4\) or \(R:M^2\to O\), plus a commuting condition if different representation paths are intended to give the same observable.

For a downstream readout \(R:W\to O\) to factor through a projection \(\pi:W\to B\), \(R\) must be constant on each fiber of \(\pi\). This is the relevant generic factorization criterion. It is not yet instantiated by the source-defined SAT maps.

## 4. θ₄ is not normal-plane holonomy

The direct θ₄ description is a scalar incidence angle between a filament and the local time-surface. Ravel's earlier assistant-built apparatus introduces a different construction:

\[
\omega_s=\langle N_1,D_sN_2\rangle,\qquad
\phi_g=\oint\omega_s\,ds\pmod{2\pi}.
\]

Here \(N_1,N_2\) are a chosen oriented transverse frame and \(\omega_s\) is an SO(2) connection on the selected plane. The holonomy \(\phi_g\) depends on transport around a loop.

These quantities differ by domain, type, and construction:

- \(\theta_4\) is a scalar incidence angle between the filament and timesheet.
- \(\omega_s\) is a connection one-form on a selected transverse 2-plane.
- \(\phi_g\) is a loop integral of that connection.
- \(K^3\) is a proposed spatial Kerr section, not an angle.
- \(\theta_{\rm BW}\) is a phase variable in a historical field action, not \(\theta_4\).

No source-defined map \(\theta_4=f(\omega_s)\), \(\theta_4=f(\phi_g)\), or \(\theta_4=f(K^3)\) has been recovered. The apparent similarity of angular language is not an equivalence.

The normal-plane apparatus is a useful assistant reconstruction for a chosen centerline frame. It must not be promoted into the direct-source definition of θ₄ or the normal connection of the full four-dimensional worldtube.

## 5. Original propositions versus translated mathematics

| Nathan Direct proposition | Historical/assistant translation | Fidelity assessment |
|---|---|---|
| A spatial Kerr section is extended along a filament | \(I^1\times K^3\) as a fibered total space | Plausible reconstruction, but no direct-source product/fibration map |
| A 4D tube surrounds a 1D core and has a 3D boundary | A finite-core worldtube with a normal-bundle connection | The tube/boundary dimensions are direct proposals; the connection requires a separately typed bundle |
| The tube may be modeled as a 2D worldsheet | Nambu-Goto/worldsheet substitution | A possible reduction or convention, not identity |
| A mouth may open onto the timesheet, be an intersection, or relate to an older bosonic-time wavefront | A 2D mouth identified with \(\partial W^4\cap\Sigma_t^3\) | One conditional assistant candidate among several direct alternatives |
| θ₄ distinguishes vacuum/matter morphology; mass is emergent | Normal-plane holonomy or compact phase used as an angular surrogate | Type error unless a map is defined |
| A present slice may not reconstruct complete history | Information conservation or holographic completeness | Not warranted; current epistemic methodology forbids universal retention/conservation claims |
| Filament and timesheet distortions mutually accommodate | A third independent force field or medium | Not established; force may be relational, medium remains provisional |
| Pair-of-pants describes one particular split; Horned Sphere is a candidate alternative | Pair-of-pants treated as generic tube topology | Overgeneralization |

### Discrepancy ledger

| ID | Discrepancy | Severity | Required resolution |
|---|---|---|---|
| G1 | \(\theta_4\) versus \(\omega_s,\phi_g,\theta_{\rm BW}\) | High | Define domains and a source-backed map, or preserve as separate quantities |
| G2 | Spatial Kerr section versus normal bundle | High | Specify whether \(K^3\) is an internal fiber, a normal disk, or another embedded spatial section |
| G3 | 1D core versus 4D worldtube | High | Supply the thickening map, fiber topology, boundary and regularity |
| G4 | 3D timesheet slice versus 2D mouth/worldsheet | High | Distinguish \(W^4\cap\Sigma_t^3\) from \(\partial W^4\cap\Sigma_t^3\); define any reduction |
| G5 | Observer slice versus timesheet | High | Supply an identification/projection; do not assume coincidence |
| G6 | Information in history versus information in a slice | High | Keep the claim epistemic; no universal conservation or holography law |
| G7 | Mutual accommodation/force versus minimal primitive pair | Medium | Define the relational response or constitutive law without silently adding a primitive |
| G8 | SAT-O1 curve versus Blockwave current versus 4D support | High | Supply typed maps; preserve the different support dimensions and provenance |

## 6. SAT-O1 and Blockwave original equation custody

No fresh Mersearch run was possible: the callable Mersearch action was not exposed and all four shared request lanes remained `requested`. The exact originals below were reused from the existing Mercer h824 custody audit and checked against the current repository copies. No original file was edited.

### SAT-O1

- Path: `SATOBLOC/SAT O1 4D.txt` in `SAT_THEORY_ARCHIVE_2023-25`.
- Git blob SHA-1: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`.
- SHA-256: `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`.
- File-index timestamp: 2025-06-09 18:44:50, timezone unspecified.
- Unbylined historical artifact; no internal authoring date. First extant Git commit: 2025-10-27 00:40:28Z.

Verbatim core equations:

\[
\gamma^\mu(\lambda)=
(\lambda,\,
A_x\sin(k_x\lambda+\phi_x),\,
A_y\sin(k_y\lambda+\phi_y),\,
A_z\sin(k_z\lambda+\phi_z)).
\]

\[
v^\mu=\frac{d\gamma^\mu}{d\lambda},\qquad
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),\qquad
L=\frac12m\,v^\mu v_\mu-V_{\rm tension}(\gamma).
\]

The prose calls the worldtube a four-dimensional volume swept by a vibrating filament, but the displayed construction defines a one-dimensional curve. No sweep/thickening map is supplied. The tension potential and mass-equivalent parameter are historical-source terms, not current measured physical parameters.

### Blockwave attachment

- Archived path: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`.
- Git blob SHA-1: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`.
- SHA-256 of the HsH archived copy: `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`. The raw upload bytes were not separately materialized; do not misstate this as a fresh hash of the original upload stream.
- Attachment event: 2025-09-16 16:31:26.687Z.
- Raw conversation/tool message timestamp: 2025-09-16 16:31:34.670358Z, message `0f3707aa-c0ae-4bb1-bc59-6333c025cf1c`, asset pointer `file-LwaFTKkMemPPrLU4qCLpYB`. This tool event is present in the raw mapping, not necessarily on the active conversation ancestry. The raw `[A] 🧶🧱SAT` export is 11,487,843 bytes, SHA-256 `17f4bf318096f465a200f8df89c8e6f23b0282832c71e7d8e8f9d80bd6fefee3`, conversation ID `68c990dd-df28-832e-b766-c267190aaffa`.
- User-supplied attachment; embedded authorship unresolved. First extant HsH archive commit: 2025-10-08 02:42:49Z.

Verbatim current and conservation statement as archived:

\[
J^{\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,
\qquad
\nabla_\mu J^{\mu\nu}=0.
\]

The attachment's wider action introduces metric, vector, phase and antisymmetric-current fields. It is a rank-two current/field representation, not by itself a 4D finite-core worldtube or a 2D worldsheet embedding. No source-defined map connects \(J^{\mu\nu}\) to \(\gamma^1\), \(K^3\), or \(W^4\).

### Separate assistant reconstructions, not replacements

Under a Lorentzian \((-+++)\) convention and standard exterior-derivative definitions, the following are candidate corrected forms:

\[
P^\mu{}_\nu=\delta^\mu{}_\nu+u^\mu u_\nu,
\qquad
F_{\mu\nu}=2\nabla_{[\mu}A_{\nu]},
\qquad
A_\mu=\alpha_*\nabla_\mu\theta.
\]

If \(J=*dB\) with the standard two-form normalization, then

\[
J^{\mu\nu}=\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma.
\]

The source's \(1/2\) may instead be a normalization convention; it cannot be declared an error without the source's normalization and antisymmetrization conventions. The archived action also contains malformed projector/index placements. The h824 Mercer report preserves the fuller line-by-line original/corrected comparison.

For SAT-O1, a possible assistant thickening is

\[
T:I^1\times K^3\longrightarrow M^4,\qquad
T(\lambda,0)=\gamma(\lambda),
\]

with local rank-four embedding and an explicitly defined fiber/boundary. This is a missing-map proposal, not a correction to the original curve equation and not a Nathan Direct equation.

## 7. Existing formalization and actual Lean evidence

No new module or PR was justified. The required source-specific maps are still undefined. Local `lean`, `lake`, and `elan` are absent; actual existing GitHub Actions logs were inspected.

| Existing work | Actual run | Result | Limitation |
|---|---|---|---|
| Ravel PR #1133, head `17dd47829bad180d1fa3f6fb885ff447a5e76f88` | Run `43636677645`, job `132628836752`, Lean 4.34.0/Lake 5.0.0 | `RavelNormalConnectionReduction` and `RavelCarrierSheetDimensionGate` compiled; full PR build failed later in `MovingPlaneTraceGeometry` | Checkout was `refs/remotes/pull/1133/merge`; not an exact-head build. The normal-connection theorem reports `propext`, `Classical.choice`, `Quot.sound`; dimension theorems include no-axiom results |
| Kestrel PR #873, head `7dbcb5f18690232d921db74f25dfdf222ee51b8c` | Run `43202552666`, job `131129411360`, Lean 4.34.0/Lake 5.0.0 | 8,957 targets succeeded | Checkout was merge ref; global axiom audit, tests, lint and nanoda were disabled. The factorization theorem is conditional and does not instantiate the SAT projection |
| Enheduanna PR #1594, head `136071f6b0665d28a4a77611712a53aeca74fe8c` | Run `43006069897`, job `130473738603`, Lean 4.34.0/Lake 5.0.0 | 8,945 targets succeeded, including the sweep-boundary contract | Merge-ref build; no global axiom audit. It proves conditional boundary algebra, not the physical worldtube construction |

The reusable formal criterion is: an observable factors through a projection exactly when it is constant on the projection's fibers. Kestrel's existing `hallway_factorization_iff_fiber_compatibility` is the relevant generic theorem. Ravel's existing carrier/slice modules provide conditional dimension and normal-complement bookkeeping. Enheduanna's sweep-boundary module supplies a conditional boundary result.

Lean verifies only those formalized statements. It does not establish that a historical assistant translation matches Nathan Direct, that a proposed map is physically realized, or that any physical premise is true.

## 8. Mersearch, governance and limits

- The four shared Mersearch request files were read and remain `requested`. No request was overwritten, released, or retriggered.
- Existing Ravel source-genealogy work and Mercer h824 equation-custody work were reused. Raw Library exports were independently inspected. No fresh three-repository Mersearch execution is claimed.
- HsH and SAT archive were used for public source custody and formalization. HSH_RESOURCES root/navigation material was read only; its research payload was not opened.
- The November 9 gyroscope source remains a separate recovery problem; the November 4/8 geometry exports do not authenticate it.
- No physical system, dataset, units, uncertainties or independent measurement were selected. No physical calculation, fit, prediction or CODATA scoring was performed.
- No BEDROCK theory promotion, paper-gate advancement, task-graph mutation, site edit, route probe, new task, or scheduler change.

## 9. Next deeper cursor

1. Recover the raw November 9 gyroscope conversation and role-authenticated message ancestry.
2. Define \(T:I^1\times K^3\to M^4\), or another source-faithful core-to-tube construction, including fiber topology, metric, boundary and transport.
3. Define the timesheet embedding and distinguish \(W^4\cap\Sigma_t^3\) from \(\partial W^4\cap\Sigma_t^3\).
4. Decide whether the mouth is a boundary intersection, a separate 3D attachment, a worldsheet reduction, or another construction. Preserve all direct-source alternatives until mapped.
5. Define the observer-slice projection and observable readout; test the fiber-constancy condition before claiming a lower-dimensional representation preserves the readout.
6. Keep \(\theta_4\), \(\omega_s\), \(\phi_g\), Kerr-section orientation, and Blockwave \(\theta\) distinct unless a source-defined map is supplied.
7. Formalize the instantiated maps only after their domains, codomains, regularity and composition conditions are fixed.

**Final epistemic classification:** DIRECT GEOMETRIC PROPOSALS / HISTORICAL UNBYLINED SAT-O1 / USER-SUPPLIED BLOCKWAVE ATTACHMENT WITH UNRESOLVED EMBEDDED AUTHORSHIP / ASSISTANT-GENERATED NORMAL-CONNECTION AND THICKENING RECONSTRUCTIONS / STANDARD CONDITIONAL DIFFERENTIAL-GEOMETRY RESULTS / NO INDEPENDENT PHYSICAL MEASUREMENT.
