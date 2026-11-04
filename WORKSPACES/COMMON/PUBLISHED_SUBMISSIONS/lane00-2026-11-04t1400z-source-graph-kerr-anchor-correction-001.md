# Geometry-fidelity addendum: 2026-09-07 source graph and Kerr-anchor correction

Status: public-safe source audit. Historical reconstruction only. No theory promotion.
Scope: this addendum extends the source record around issues #1340 and #1341. It does not repeat the already-published SAT-O / Blockwave J2-J3 transcription or promote any equation into BEDROCK.

## Executive findings

1. The 2026-09-07 user turn `496a15ea-0263-459d-b815-908f52155b90` describes three representations: a reduced Minkowski/worldworm view, the full 4D bulk with dynamics, and an actual 4D view with a 3D slice. It also describes an open 4D slinky, a ring-like cross-section, and a tentative induction-current connection within timesheet thickness.
2. Assistant turn `9e36cf0e-6d48-4eca-93df-e6e99600b516` is a non-immediate descendant on the same parent chain. The chain is `496a -> 0e96 -> 28b861 -> 9661 -> 9e36`. Node `9661a842-1406-4cba-93c5-660996496830` is a structural `reasoning_recap` node, not a missing parent.
3. The later user question `b14ff47e-3eea-42b5-9e8d-750821a0dc21` and assistant answer `99d3ba83-9f3c-4363-996f-f941380b5c47` are present in the SAT archive copy but absent from the HsH snapshot's child edge and node set. The assistant answer labels its output 'anchored measurements', fixes a core radius from an electron Kerr parameter, and derives further quantities from that choice.
4. That anchor conflicts with a direct user instruction from 2026-09-06: Compton/ZB arguments are not the method for assigning filament size. The assistant's `a0 = hbar/(2*m_e*c)` is therefore an assistant model choice, not a Nathan Direct radius and not an independent measurement of a filament.
5. The assistant's `P(tau) = W intersect Sigma_tau` and `P(tau) = W intersect DeltaSigma_tau` are not direct equations. The response treats an exact slice and a finite-thickness object as the same instantaneous particle without defining the support type of `W`, the type of `DeltaSigma`, or a projection/readout map.
6. A 2026-10-21 user-role message says the earlier reciprocal filament/timesheet-deformation model is no longer current and has been superseded by Klein Fabric. The September 2026 construction is historical/pre-Klein, not a current architecture specification.
7. The signed BR-006 concept is present in BEDROCK. The scalar `B(t)` formulas are in the assistant-authored 2026-10-17 research checkpoint, which explicitly says it is not Nathan's signed BR-006. The raw 2026-10-17 user turn cited by that checkpoint was not recovered. Keep the signed concept and assistant scalar proposal separate.

## Source custody and conversation graph

Two archived copies of the same conversation were compared:

- HsH path: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/26.09.06•26.09.07•Succinctness And Math Check — raw.json`
  - Git blob: `a933101e831ea11b13266b24f827323aaba5a7ec`
- SAT archive path: `Succinctness And Math Check — raw (1).json`
  - Git blob: `99b6e1d7ef8f3b9356d67b5bd50dd0de59529061`

Both identify conversation `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`, titled `Succinctness And Math Check`.

The HsH copy has 657 mapping nodes; the SAT archive copy has 667. All 657 HsH node IDs occur in the archive copy. Of those common nodes, 656 are object-identical. The sole common-object difference is the child list of assistant node `9e36...`: it is empty in the HsH copy and includes user node `b14...` in the archive copy. The archive copy has 10 additional nodes, including `b14...` and the subsequent assistant/tool chain. These are two snapshots of one conversation, not independent witnesses.

Relevant turns:

| Message | Outer role | UTC timestamp | Source status |
|---|---|---|---|
| `09c6d26f-934f-4be6-b2ae-21a6fc281147` | user | 2026-09-06 08:09:54.609 | Direct ontology constraint: no invented primitives/fields; helices, superhelices, braids, perturbations and winding; medium/Kelvin vortices remain optional. |
| `44c42bc8-540d-4e52-881b-2b6328410e15` | user | 2026-09-06 09:15:12.511 | Direct size-setting constraint: do not assign filament size from Compton/ZB arguments; investigate the ER-bridge geometry. |
| `a63b981d-d614-4da8-9cd3-7a018ed221e3` | user | 2026-09-06 20:10:29.947 | Direct clarification: a filament is the totality of a 4D particle trajectory, not a separate object with its own trajectory; block treatment is a temporary construction device. |
| `2a34f106-0dd0-488f-a0e6-97748320c955` | user | 2026-09-07 05:58:50.090 | Direct construction order: Kerr core, then ergosphere or other layer, then coiling. |
| `3d0ad680-51db-4c79-ad4a-9bbacada24ef` | user | 2026-09-07 07:46:38.573 | Direct geometry constraint: choose a spatial Kerr section and extend it along the filament; do not use a 4D Kerr spacetime as the cross-section of another 4D object. |
| `b9805319-9d77-4b43-874a-5af50c0b6ef7` | user | 2026-09-07 08:06:58.114 | Direct conceptual statement: filament and timesheet distortions are mutual accommodation; force is the true primitive. |
| `c0d7fc1c-dc72-4cc7-b2a0-1e2cb686be4e` | user | 2026-09-07 08:28:03.333 | Tentative direct proposal: Kerr core as ultimate Pauli exclusion, shell approximately a closed string, shell deformation approximately string-theory vibration modes. |
| `496a15ea-0263-459d-b815-908f52155b90` | user | 2026-09-07 10:06:12.842 | Direct three-representation description; open 4D slinky; 3D Borromean depiction is not literal; tentative induction-current connection in timesheet thickness. |
| `9e36cf0e-6d48-4eca-93df-e6e99600b516` | assistant | 2026-09-07 10:06:45.368 | Same-ancestry assistant reconstruction; introduces the 2+1 reduction, three interwoven 4D histories, `W`, `Sigma_tau`, and `P(tau)`. |
| `b14ff47e-3eea-42b5-9e8d-750821a0dc21` | user | 2026-09-07 21:01:03.658 | Direct question asking whether measurements can be assigned to components. |
| `99d3ba83-9f3c-4363-996f-f941380b5c47` | assistant | 2026-09-07 21:02:27.217 | Assistant response introducing `a0 = hbar/(2*m_e*c)`, derived dimensions/frequencies and a Kerr-Newman magnetic-moment claim. |

The assistant response `9e36...` is a same-branch descendant, not an immediate child of `496a...`. The archive copy preserves the later user follow-up and assistant answer that the HsH copy's child edge omits.

## Nathan Direct geometry versus assistant translation

### Direct geometry

The direct cluster supports these distinct statements, with their original uncertainty preserved:

- The filament is a 4D particle history/trajectory. It should not be re-described as an ordinary object that separately travels along a trajectory.
- A block-universe diagram is a temporary analysis representation, not a claim that the underlying system is frozen.
- A reduced Minkowski diagram is a 3D display with one dimension used for time. The user explicitly doubts that the 3D Borromean-ring picture is the literal 4D object.
- The proposed 4D object is more like an open slinky with a ring-like cross-section than a closed 4D ring.
- The full 4D bulk remains present; the 3D view is a slice/readout.
- A current-like connection in the finite thickness of the timesheet is a tentative candidate for the intersection/drag mechanism, not a defined tensor or action.
- The Kerr construction should use a spatial Kerr section extended along the filament. The order Kerr core -> ergosphere/layer -> coiling is stated directly, while the Pauli/string-theory identifications are explicitly tentative.
- The user directly rejects assigning filament size from Compton/ZB arguments. The earlier mention of the electron as a candidate system does not authorize setting the filament radius equal to an electron Compton-scale Kerr parameter.

### Assistant additions

Assistant message `9e36...` makes a partly useful representational clarification: the reduced Minkowski picture can be read as a 2+1 schematic of a 3+1 system, with the Borromean description treated as a projection descriptor. But it also adds claims not supplied as equations by the user: three mutually interwoven 4D filament histories, a particular `W^4` carrier, a distinguished `Sigma_tau^3`, and a particle readout `P(tau)`.

Assistant message `99d3...` then promotes a chosen electron Kerr parameter to a "standard filament core":

```text
a0 = hbar/(2*m_e*c)
omega_1 = c/a0 = 2*m_e*c^2/hbar
```

It derives a circumference, mouth area, Zitterbewegung-scale frequency, Compton return period and magnetic-moment association. Those are consequences of the assistant's chosen anchor and propagation assumption. They are not independent measurements of an SAT filament core. The response also calls the Kerr-Newman magnetic-moment relation a second observable measurement, but that relation is not a measurement of the SAT core. No measured filament radius, uncertainty, calibration, physical dataset or independent core observation is supplied. The direct 2026-09-06 size-setting instruction is contrary to using the Compton/ZB scale as the filament-size assignment.

The assistant also writes:

```text
P(tau) = W intersect Sigma_tau
P(tau) = W intersect DeltaSigma_tau
```

and calls both the instantaneous particle. The source does not define whether `W` is the 1D trajectory, a 2D swept worldsheet, or a 4D finite-core carrier. It does not define whether `DeltaSigma` is a 4D slab, a 3D band with internal thickness, or another support. The two expressions cannot be treated as interchangeable without an explicit projection/readout map and its conditions.

## Historical SAT-O / Blockwave source inventory

This is a provenance index, not a new transcription. The complete SAT-O / Blockwave J2/J3 source comparison is already recorded in issue #1341 and the Sable source audit.

| Source | Exact Git blob | First visible repository date | Source classification |
|---|---|---|---|
| `SAT 4D Theory Work/SAT4D_4.txt` | `efc88f4523b2fd616e64898737c2aa45e5f39b9a` | 2026-09-04 21:52:23Z | Internal document date July 2025; byline `SATO.4D Coherence Project`; document-level historical source. |
| `SAT 4D Theory Work/SAT4D_6.txt` | `167136310cdf33ca8f986f33634692314c1a0946` | 2026-09-04 21:52:23Z | Internal document date July 2025; official-directives text; no verified raw author role. |
| `SATOBLOC/SAT O1 4D.txt` | `7577aa1ee5a6c3850ce3b226c75377de6367aedc` | 2025-10-27 00:40:28Z | Unbylined module; first visible commit says it re-folds a high-water-mark SAT-O build, not that it was composed that day. |
| `SATOBLOC/SAT O3 4D.txt` | `589219f60a8102cf7b07791b94fcdcd119e9bb8c` | 2025-10-27 00:40:28Z | Unbylined topology module; its 4D Hopf/Borromean stability claims do not specify a 4D link invariant or embedding class. |
| `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/` `BLOCKWAVE.txt` | `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d` | 2026-10-08 02:42:49Z | User-supplied attachment from raw conversation `68c990dd-df28-832e-b766-c267190aaffa`, attachment record 2025-09-16 16:31:26.687Z; content author not identified. |
| `SATOBLOC/SATO-BLOCK-INT.txt` | `2cd00dec3a8464dc303fe96f14ae71d7fcf8f31e` | 2025-10-28 00:04:17Z | Mixed transcript without raw message-role graph; contains assistant-generated variants, including a rank-three current expression. |

The Blockwave attachment's rank-two current and the later assistant-generated rank-two clean action are not Nathan Direct equations. The September 18 direct editorial preference for a three-form treatment is documented in the Sable source audit; it is a direct editorial preference, not a proof that a particular physical current has that rank. The J2/J3 distinction remains a support/sweep/boundary question, not a Hodge-duality equivalence.

## Verbatim historical equation signatures (unchanged)

The following are source transcriptions, not corrected equations and not claims that the source mathematics is valid:

- SAT4D_4:
  ```text
  gamma: R -> M
  Sigma_t subset M
  ell_f = (2*A/T)^(1/3)
  m_eff = T*ell_f/(c^2*Q)
  ```
  The document describes `M` as 4D, `gamma` as the filament history and `Sigma_t` as a 3D wavefront/timesheet. These are document-level definitions, not authenticated raw Nathan turns.
- SAT O1 4D:
  ```text
  gamma(lambda) = (lambda,
                  A_x*sin(k_x*lambda + phi_x),
                  A_y*sin(k_y*lambda + phi_y),
                  A_z*sin(k_z*lambda + phi_z))
  v^mu = dx^mu/dlambda
  S[gamma] = integral d(lambda) L(gamma, v)
  ```
  The prose calls the worldtube the 4D volume swept out by the vibrating filament, but does not define the map from the 1D curve to that volume.
- Blockwave attachment:
  ```text
  J^(mu nu) = (1/2)*epsilon^(mu nu rho sigma)*nabla_rho B_sigma
  nabla_mu J^(mu nu) = 0
  F_(mu nu)(theta) = nabla_[mu A_nu](theta)
  A_mu = alpha_* * nabla_mu theta
  gamma = W intersect Sigma
  integral_gamma A_mu d(ell^mu) in 2*pi*Z
  ```
  This is the attachment's rank-two current/worldsheet formulation. The file does not identify its content author.
- SATO-BLOCK-INT transcript:
  ```text
  2*g_h*F(theta)*J^(mu nu rho)*J_(mu nu rho)
  ```
  This is an assistant-generated rank-three variant in a mixed transcript without a raw role graph. It is not a Nathan Direct equation.
- A raw 2025-09-18 user message `e92efb17-2499-482e-b930-9ad11221bd7c` at 15:19:27Z requests a three-form representation for the chapters under discussion. This is a direct editorial preference, not proof of a particular physical support/current.

The complete J2/J3 source chronology and the Blockwave clean-action transcription remain in issue #1341 and the Sable source audit. No historical equation is silently replaced in this addendum.

## Conditional typed forms (separate from the historical equations)

The existing Lean support-degree gate provides the conditional type relation:

```text
support dimension p in a 4D ambient manifold
Poincare-dual current degree = 4 - p
```

Accordingly, a 1D worldline and a 2D worldsheet require different current degrees. This does not decide which support SAT uses. The direct source and the later Klein Fabric parent still need explicit maps before a particular current can be selected.

For a readout, keep the objects separate:

```text
K  --f_centerline--> gamma^1 in M^4
K  --f_carrier-----> W^4 subset M^4       (if a finite-core carrier is intended)
K  --f_slice-------> Sigma_t^3 subset M^4
(W^4, Sigma_t^3) --intersection--> T_t^3  (conditional on the support typing)
W intersect DeltaSigma_t --pi_t--> O_t    (candidate only; pi_t and DeltaSigma_t are undefined)
```

The maps `f_centerline`, `f_carrier`, `f_slice`, and `pi_t` are not supplied by the source. They are names for missing definitions, not established functions. In particular, `W intersect DeltaSigma_t` is not itself a 3D readout unless the finite-thickness object and projection are defined. No dimension is assigned here to the undefined `DeltaSigma_t`.

## Typed geometry and existing proof status

The conditional support-degree and exact-slice arithmetic are already formalized in existing draft Lean work:

- PR #1098, `SableCurrentSupportDegreeGate.lean`, head `d2839a9454f16a2ad7661544d9d0c12b664e55c5`, Lean verification run #41328086467 succeeded. It formalizes conditional Poincare-dual degree and transverse intersection dimensions.
- PR #1133, `RavelCarrierSheetDimensionGate.lean` and `RavelCarrierSliceReconstruction.lean`, head `ca0a57e55caef5df3cd291957c158384fd15d0c1`, Lean verification run #41836778560 succeeded. It formalizes conditional slice/pullback/readout maps.
- PR #873 contains the Kestrel projected-incidence/fiber-compatibility scaffold. Its projected-incidence module builds, but the overall run #41758925555 failed in `KestrelMovingSlice.lean`; do not describe the full PR as passing.

These are conditional mathematical proofs about their formalized set/support maps. They do not establish that the SAT source has those support types, that the proposed translations are faithful, or that any physical premise is true. No new Lean theorem or build was run in this addendum.

The existing conditional map distinction is:

- A 1D worldline support has a 3-form Poincare-dual current.
- A 2D worldsheet support has a 2-form Poincare-dual current.
- A 4D finite-core carrier is a different support object and must not be silently substituted for either centerline or worldsheet.
- An exact 3D timesheet slice can be used only after the carrier and slice are typed. A finite-thickness `DeltaSigma` requires its own definition and a projection/readout map. No dimension is assigned here to the undefined `DeltaSigma`.

## Current-architecture boundary

The 2026-10-21 direct user-role message `090f5160-1020-486d-9c42-df3d7dff2063` says the earlier reciprocal filament/timesheet-deformation model is no longer current and that Klein Fabric has become the common parent model. The September 2026 reciprocal-deformation and open-slinky descriptions are therefore historical source material. Do not promote them as the present architecture or reconstruct the current parent from analogy.

The signed BR-006 concept remains in BEDROCK. The scalar relation below appears in assistant-authored `WORKSPACES/COMMON/RESEARCH_CHECKPOINT_2026-10-17_INTERBRAID_TO_ANNIHILATION.md` (blob `3ef69f2cf28bc7609251b4028cd404035e175c59`), which explicitly says it is not Nathan's signed BR-006:

```text
B(t)-B(t0) = (Phi(t)-Phi(t0))/(2*pi)
dB/dt = Omega_relative/(2*pi)
```

The checkpoint itself warns that this unwrapped count is not yet a fully defined homotopy invariant of noncompact 4D tubes; finite core, framing, boundaries and admissible deformations are still required. The raw 2026-10-17 user turn cited by the checkpoint was not recovered in the bounded search of the Aster, Meridian Free Build, Mercer Free Build, Ravel Free Build and Tern raw exports, plus repository code searches for the `B(t)` / `Phi(t)` / relative-angular-velocity expressions. Do not attribute the scalar formulas to Nathan Direct or promote them as a braid invariant.

## Discrepancy ledger

1. Direct: open 4D slinky with ring-like cross-section. Assistant: three mutually interwoven 4D histories and a more specific carrier construction. The assistant adds topology and support typing.
2. Direct: choose a spatial Kerr section and extend it along the filament. Assistant: uses a Kerr length parameter as a core radius without specifying the spatial-section transport/embedding map.
3. Direct: do not assign filament size from Compton/ZB arguments. Assistant: chooses the electron Kerr parameter, then derives ZB and Compton-period matches. This is an attribution and epistemic-status error.
4. Direct: actual 4D view plus 3D slice; current-like connection in timesheet thickness is tentative. Assistant: equates exact-slice and finite-thickness intersections as the same particle without a projection/readout map.
5. Direct: force is the primitive in the earlier two-primitive description. Historical Blockwave action: one-medium field/current construction. These are different ontology proposals; neither is silently current after the Klein Fabric supersession.
6. Raw-source copies: HsH child metadata for `9e36...` is incomplete; the SAT archive copy preserves the `b14...` follow-up. This is a snapshot discrepancy, not evidence of a cross-branch assistant splice.
7. BR-006: the signed concept is distinct from the assistant-authored checkpoint scalar `B(t)` count. The raw 2026-10-17 user turn cited by the checkpoint remains unrecovered; do not attribute the scalar equations to Nathan Direct or treat `B` as a complete braid invariant.

## Next deeper cursor

1. Recover the raw 2026-10-17 direct source cited by the BR-006 checkpoint, if present in an accessible raw export. Do not use a held Mersearch lane or detached manifest as a substitute. Until then, keep the signed BR-006 concept separate from the checkpoint's assistant-authored `B(t)` scalar proposal.
2. Define the current Klein Fabric parent `K` and explicit maps from `K` to the filament centerline/history, finite-core carrier, timesheet/slice and observer record. State domains, codomains, composition conditions and fibers.
3. Decide whether the filament is a 1D worldline centerline, a 4D finite-core carrier, or both as separately typed objects. Define the spatial Kerr-section transport map before using a Kerr cross-section.
4. Define `DeltaSigma` and its projection/readout map before using `P(tau)`.
5. Keep the electron Kerr parameter as an assistant model anchor only. Do not treat it as a measured filament radius.
6. Preserve the separate paper gates and do not promote this historical reconstruction into BEDROCK or Factory Floor.
