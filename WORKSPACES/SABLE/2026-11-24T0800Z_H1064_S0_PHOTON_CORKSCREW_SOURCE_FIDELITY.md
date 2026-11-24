# H1064:s0 | Photon Corkscrew Trajectory: Source Fidelity and Conditional Kinematic Gate

**Disposition:** SOURCE_FIDELITY_COMPLETE / CONDITIONAL_LEAN_GATE_COMPILED / NO_PHYSICAL_CLAIM / NO_THEORY_PROMOTION.

## 1. Routing and authority

- 2026-11-24T08:00Z; \(h=1064\), \(seq=5320\), \(5320\bmod19=0\).
- Selected label: **Sable** (index 0). Next: **Loom** (index 1).
- A ring selection does not authenticate a ChatGPT instance or thread. No current Sable historical thread was authenticated; no cross-thread participation or delivery is claimed.
- Sable's historical remit is systems/workflow architecture, capability mapping, automation/tool leverage, resource coverage, scripting, and continuity. Source: archived SABLE Revival Rotation conversation 6aa6701e-b800-83ea-a19a-31a802b7124d, 2,015 mapping nodes, 59 direct user-role messages, canonical raw-export SHA-256 dfe0ac536c98e903db3760646a3358cc4f9e5fb9b5e55b48ec975c36401f5302. The source supplement explicitly says this is not a signed standalone charter.
- Lane 00 is a one-run overlay. Sable's separate Lane 24 P0-HOLD / Cycle 08/08 complete / backseat state remains unchanged.
- Loom remains PACKET-READY / ACCESSIBLE-UNSCHEDULED / FIRST-BLUSH-PENDING. No task is preassigned; no Loom inbox write or direct delivery was made.

## 2. Primary source and Nathan Direct geometry

The Library export [A] Photon Corkscrew Trajectory, raw JSON, was parsed by current-node ancestry.

- Conversation ID: 6a131c9b-e19c-83ea-964c-283024974c3e.
- Raw SHA-256: 592a544049925789bed6a28c2814693c89f4706be78546612cf192b053d25698.
- 29,749 bytes; 13 mapping nodes; 9-node active ancestry; four user and four assistant messages.
- Current node: 3639e82d-082e-42e8-91b8-fd98596d7817.

| UTC | Direct user message ID | Source-level content |
|---|---|---|
| 15:44:28.401681Z | efe94285-e313-4cf4-98fc-9ccb0a34a49e | "Imagine photons as classical particles that follow a corkscrew trajectory." |
| 15:45:26.087743Z | a412f111-d211-4199-a5d4-4293ab58381c | Corrects the assistant: imagine it, do not critique it. |
| 15:45:57.891055Z | d5ee37c3-eecc-4178-9e09-83d7a34b66ef | Asks what it does to the double-slit experiment. |
| 15:47:32.645232Z | 61914521-fbd2-429f-9ee1-b92ef4f7179d | Asks whether it preserves the double slit and resembles Bohmian paths. |

**Direct geometry:** a classical-particle thought experiment in which photons follow a corkscrew trajectory. The user does not specify dimension, metric, parameter, radius, pitch, handedness, phase space, detector projection, or equations. The prompt is imaginative, not a physical assertion. The double-slit and Bohmian turns are questions, not adoption of the assistant's mechanisms.

## 3. Assistant reconstruction and fidelity discrepancy

Historical assistant messages:

- ac327a60-d6af-4c78-8d2c-a1f69581f83d: first critiques a literal spatial helix as incompatible with light-speed motion. Physically relevant under one assumed interpretation, but not responsive to the imaginative request.
- accf2c2c-b660-4715-bbbb-f59881500473: supplies a 3D spatial helix, axial speed \(c\), total speed \(c\), one turn per wavelength, handedness as spin, and linear polarization as two opposite helices.
- 7f2d0e2e-b640-42e8-9e42-45554fb7bb5d: claims double-slit behavior through phase synchronization between competing helical paths.
- 3639e82d-082e-42e8-91b8-fd98596d7817: compares the path with Bohmian trajectories.

The first and second assistant responses are not reconciled. The second adds dimension, metric, speed, wavelength, spin, and polarization without source definitions. The double-slit account supplies no amplitude, probability, boundary-condition, or detector-readout map. The Bohmian account supplies no guidance equation or photon-specific construction.

## 4. Conditional kinematics and Lean proof

A minimal Euclidean spatial-helix reconstruction is

\[
\mathbf r(t)=\left(R\cos(\omega t),R\sin(\omega t),v_{\parallel}t\right),
\qquad
v_{\mathrm{total}}^2=v_{\parallel}^2+R^2\omega^2.
\]

Thus, if \(v_{\parallel}=c\) and \(R^2\omega^2>0\), then \(v_{\mathrm{total}}^2>c^2\). If total speed is \(c\) and transverse speed is nonzero, then \(v_{\parallel}^2<c^2\). If axial and total speeds both equal \(c\), the transverse component must vanish.

This is a conditional correction to the assistant's reconstruction, not a Nathan Direct equation, photon law, or H(s)H equation.

A standard-reference Minkowski comparator, signature \((-+++)\), \(c=1\), uses

\[
g(v,v)=-1+x^2+y^2+z^2,\quad v=(1,x,y,z).
\]

If \(z=1\) and \(x^2+y^2>0\), then \(g(v,v)>0\), so the tangent is spacelike, not null. If it is null with nonzero transverse contribution, then \(z^2<1\). If \(z=1\) and it is null, \(x=y=0\). The user did not specify this metric; it is a conditional standard-physics comparator.

**Lean 4 / Mathlib:** existing FORMAL_VERIFICATION Lake project reused, no new project or dependency.

- [Draft PR #2483](https://github.com/Satobloc/HsH/pull/2483), branch research/sable-h1064-photon-corkscrew-kinematic-gate-final-20261124t0800z.
- Base: infra/lean4-verification-20261023, not main.
- Exact PR head: 6109d55d8c8c3588d3fe4321d94a49d650d4f5ab.
- Module: FORMAL_VERIFICATION/HsHVerification/PhotonCorkscrewKinematicGate.lean.
- [Exact-head run #45359035777](https://github.com/Satobloc/HsH/actions/runs/45359035777): **SUCCESS**, 8,948 build jobs. Exact PR-head checkout assertion passed. Lean 4.34.0, Lake 5.0.0, Mathlib v4.34.0.

Compiled theorems:
1. unit_axis_with_transverse_is_spacelike
2. null_unit_time_nonzero_transverse_forces_axial_subunit
3. null_unit_time_unit_axis_forces_transverse_zero
4. euclidean_total_speed_sq_gt_axial_sq

Theorem axiom printouts list propext, Classical.choice, and Quot.sound; no sorryAx. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped. This is a successful compile of the encoded conditional propositions, not a full project test or a physical validation.

The first attempt, run #45357989369, failed on two proof-script simplification mismatches. The proof terms were corrected. Two retry runs were cancelled before checkout. Earlier PR attempts #2481 and #2482 are closed without merge; #2483 is the sole active proof PR and remains draft/unmerged.

Existing adjacent formalizations were reused as context, not duplicated:
- [PR #262](https://github.com/Satobloc/HsH/pull/262), run [#43948452979](https://github.com/Satobloc/HsH/actions/runs/43948452979): NadirHelixSliceGeometry and MovingPlaneTraceGeometry.
- [PR #873](https://github.com/Satobloc/HsH/pull/873), run [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878): Kestrel SAT4D timelike gate and moving-slice/projected-incidence modules.

Lean verifies only the formalized statements. It does not establish translation fidelity, physical premises, photon ontology, polarization/helicity, double-slit dynamics, or Bohmian equivalence.

## 5. Adjacent archive cluster: distinct objects, no inferred equivalence

### SAT-Y: Compton-scale helix

File: SAT XYZ/SAT-Y Theta+Helix Particle Properties.txt. Git blob SHA-1: 5d4fd35cd758f22d776367b87267092439ea016e. FileIndex records 2025-05-31 01:33:16 and archive import 2025-10-27 20:26:10; these are file-index events, not composition dates. It is a mixed user/assistant transcript, not a raw conversation export.

Assistant-generated formula set:

\[
\lambda_C=\frac{\hbar}{mc},\quad
\theta_{4,\mathrm{SY}}=\arcsin\sqrt{\frac{m}{m_{\max}}},
\quad
r=\lambda_C\sin\theta_{4,\mathrm{SY}},
\]

\[
P=2\pi\lambda_C\cos\theta_{4,\mathrm{SY}},\quad
x=r\cos\phi,\quad y=r\sin\phi,\quad z=\frac{P\phi}{2\pi}.
\]

The user asks for a spreadsheet using accepted measured particle values; the formula and proton mass as an example for \(m_{\max}\) are assistant content. At \(m=0\), \(\lambda_C\) is undefined and its massless limit diverges. No finite photon prescription is supplied. The source-local label \(\theta_{4,\mathrm{SY}}\) avoids conflating it with current H(s)H \(\theta_4\). No symbol registry change was made.

### Photoneutrino Sector

Photoneutrino Sector (nolat).pdf was uploaded 2026-05-30. XW-003 identifies a 2026-01-15 public transcript as the earliest secure public anchor; the exact private source conversation remains unrecovered.

The document first describes photons and neutrinos as the same 4D string/worldline viewed in different orientations, then later describes them as non-continuous worldlines but single-coil excitations hopping along filaments. These descriptions are not reconciled. No state-space, projection, or transport map connects this document to the May 24 spatial corkscrew. This is document-level content, not a recovered Nathan Direct equation.

### SAT-O1 4D

Original path: SAT O REWRITE/SAT 4D/SAT O1 4D.txt. HsH mirror: SATOBLOC MISC/SAT O1 4D.txt.

- Git blob SHA-1: 7577aa1ee5a6c3850ce3b226c75377de6367aedc
- SHA-256: 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937
- FileIndex source row: 2025-06-07 08:38:16; last write 2025-06-09 18:44:50; archive import 2025-10-27 23:18:35. These are file metadata events, not a verified composition date. The file is unbylined.

Verbatim equation set:

~~~text
γ^μ(λ) = (λ, A_x sin(k_x λ + φ_x), A_y sin(k_y λ + φ_y), A_z sin(k_z λ + φ_z))
v^μ(λ) = dγ^μ/dλ
S[γ] = ∫ dλ L(γ^μ, v^μ)
L = 1/2 m v^μ v_μ - V_tension(γ)
φ_i - φ_j = 2πk/n
~~~

This is a parameterized 4D curve and action. Its first coordinate is \(\lambda\), not an established \(ct\); these equations supply neither a photon-specific null constraint nor a projection to the May 24 3D path.

### Blockwave

File: DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt.

- Git blob SHA-1: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d
- SHA-256: 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664
- Attachment event: 2025-09-16T16:31:34.670358Z. Composition date not established. Assistant-voiced attachment supplied by the user; supply does not establish authorship.

Verbatim source equation set:

~~~text
u^μ u_μ = -1
P^μ{}_\nu ≡ δ^μ{}_\nu + u^μ u_ν
∇_μ J^{μν} = 0
J^{μν} = 1/2 ε^{μνρσ} ∇_ρ B_σ
F_{μν}(θ) ≡ ∇_[μ A_{ν]}(θ)
A_μ(θ) ≡ α_* ∇_μ θ
~~~

**Separate transcription correction:** Morrow h1059 earlier printed the projector indices as \(P^\mu{}^\nu\) and \(\delta^\mu{}^\nu\). Kestrel h1063's later raw attachment reread confirms \(P^\mu{}_\nu\) and \(\delta^\mu{}_\nu\). This corrects the transcription, not the source equation. The attachment event timestamp is likewise corrected from Morrow's 16:31:26.687Z to 16:31:34.670358Z. No changed SAT-O1 or Blockwave equation was issued.

Blockwave's central object is a conserved two-form current, not a one-dimensional particle trajectory. No projection to the May 24 corkscrew is supplied.

### Current H(s)H boundary

A recorded Nathan clarification in TRAINING_STANDDOWN_2026-09-12.md says worldline/history does not move through a background; the timesheet moves through history; and \(c\) is the \(w\)-component of intersection propagation, not the total tangent speed of a material worldline. The raw message locator is not recovered here. The blanket training standdown was later superseded as a hard gate by AUTOMATION_WORKFLOW_CONTROL.md; minimum prerequisites for actual H(s)H theory work remain.

The old Euclidean velocity-budget construction is not transferable to current H(s)H. HSH-P002 and FIXED_SPEED_HELIX_COMPATIBILITY_001 remain quarantined. The new Lean lemma is not an H(s)H result and does not reopen either item.

## 6. Mapping diagram

~~~mermaid
flowchart TD
    U["Nathan Direct: imagine photons following a corkscrew"]
    A["Assistant reconstruction: 3D spatial helix"]
    K["Conditional Euclidean and Minkowski kinematic gates"]
    D["Double slit: assistant phase-synchronization story"]
    B["Bohmian: assistant path analogy"]
    SY["SAT-Y: Compton-scale helix formula"]
    SO["SAT-O1: parameterized 4D curve and action"]
    BW["Blockwave: conserved 2-form current"]
    PN["Photoneutrino: 4D string/worldline or hopping coil"]
    HH["H(s)H: worldtube/history and moving timesheet"]
    U --> A
    A --> K
    A --> D
    A --> B
    SY -. "no parameter or scale map" .-> A
    SO -. "no curve-to-spatial-path projection" .-> A
    BW -. "no 2-form-to-path map" .-> A
    PN -. "no state-space or transport map" .-> A
    HH -. "different time-surface semantics" .-> A
~~~

## 7. Glossary and discrepancy ledger

| Term | Controlled meaning |
|---|---|
| Spatial corkscrew | 3D Euclidean path; assistant reconstruction, not a dimension/metric specified by Nathan Direct. |
| Spacetime worldline | 1D curve in spacetime. SAT-O1 supplies a parameterized curve, but no map to the spatial corkscrew. |
| Compton-scale helix | SAT-Y assistant formula using \(\lambda_C\) and source-local \(\theta_{4,\mathrm{SY}}\). |
| Blockwave current | Rank-2 antisymmetric current \(J^{\mu\nu}\), not a particle path. |
| Single-coil excitation | Photoneutrino document language; relation to its worldline wording unresolved. |
| Timesheet | Current H(s)H time-surface concept, not the assistant's 3D spatial helix. |
| Helicity / spin | No source-defined map from path handedness to spin projection recovered. |
| Phase synchronization | Assistant's double-slit proposal; no amplitude or probability law supplied. |
| Conditional Lean theorem | Proof of the encoded proposition, not evidence that source translation or physical premises are true. |

Main discrepancies:
1. Imaginative request was initially answered with critique.
2. Direct source leaves dimension and metric open; assistant silently chooses 3D space.
3. Axial \(c\), nonzero transverse speed, and total \(c\) are inconsistent under the assistant's Euclidean decomposition.
4. "One turn per wavelength" has no definition or map to SAT-Y's Compton pitch.
5. Handedness, helicity, and linear polarization have no transformation or state-composition map.
6. Double-slit phase synchronization has no amplitude, probability, or detector map.
7. Bohmian resemblance has no guidance law.
8. SAT-Y has no finite \(m=0\) prescription or established link to May 24.
9. Photoneutrino worldline and hopping-coil descriptions are unreconciled.
10. SAT-O1's 1D curve/action and Blockwave's 2-form current have no projection to the spatial corkscrew.
11. H(s)H time-surface semantics do not license transfer of the Euclidean speed budget.
12. Blockwave projector transcription and attachment timestamp in the earlier Morrow receipt were corrected by Kestrel's later source reread; the source equation itself was not changed.

## 8. Operational controls and next cursor

- Read live BEDROCK, Steering Charter, Three Paper Campaign, Common onboarding, current workflow orientation, Revival Rotation V3/V4, thread-first rule, navigation preflight, Mersearch worker guide/releases, Reference Desk, Code Grurple roster, task graph, Sable current work/BOOT, Sable historical remit supplement, and Loom rotation-state packet.
- BEDROCK read extent: 753 lines / 119,414 characters. Main head at pre-publication inspection: c0479926406332d7a679c7dacbc42f44ee46a1f5.
- Mersearch preflight completed. Four canonical request lanes contain active requests; none overwritten. No new Mersearch request submitted. The May 24 raw conversation was recovered from Library; SAT-Y from the public SAT archive; SAT-O1/Blockwave custody reused from Kestrel h1063 and Morrow h1059. GitHub/Library retrieval is not represented as Mersearch.
- HSH_RESOURCES public navigation boundary read; no private payload accessed.
- Existing tooling checked: HsH FORMAL_VERIFICATION project, Math Hopper issue #578 and PR #991, Whirligig Kernel0 sandbox, installed SciSpace availability. No new tool, project, dependency, service, or subscription.
- Latest PWH deep review: Tern h1062:s3, issue [#2476](https://github.com/Satobloc/HsH/issues/2476). No duplicate review or queue mutation.
- FIE last full review November 20; next due December 4. Unrelated-source reading break last completed November 21. Neither due again.
- Task graph remains 18 records / 16 declared branches, 17 reachable and one blocked/unreachable. No graph mutation.
- Campaign gates remain separate: P1 November 9 is not represented as completed by this work; P2 November 30 HOLD; P3 December 14 INCOMPLETE. P0 Code Grurple remains an active publication interlock. No paper, review, PDF, or reader gate advanced.
- No physical calculation, measured system, dataset, unit/uncertainty analysis, prediction, fit, independent measurement, or CODATA scoring.
- No BEDROCK theory promotion, task/ID/cadence change, sixth task, signet, chat rename, or cross-thread delivery claim.

**Next deeper cursor:** recover raw source behind the SAT-Y mixed transcript and January 15 Photoneutrino public transcript. Then decide whether the May 24 corkscrew means (a) a 3D spatial trajectory, (b) a 4D spacetime worldline, or (c) an internal/field-space phase trajectory. Only then define source-faithful metric, parameter, state space, and projection/composition maps. The double slit needs a phase-to-amplitude and detector-readout map; Bohmian comparison needs a guidance-law correspondence; any SAT/H(s)H relation needs an explicit map to the relevant curve, worldtube, timesheet, or current. Until then, similarities remain test hypotheses.

## Tocktick

- **Focus:** source fidelity first; the direct prompt is much thinner than the assistant's expanded model.
- **Immediate result:** simultaneous axial-\(c\), transverse-nonzero, total-\(c\) claims fail the conditional kinematic gate.
- **Boundary:** Lean verifies only the stated standard-metric algebra, not translation fidelity or a physical photon model.
- **Return:** Sable Lane 24 P0-HOLD remains unchanged; this Lane 00 artifact is a separate sandboxed source-fidelity result.
- **Next:** source-recover adjacent photon/neutrino material and define explicit maps before proposing cross-model equivalence.
