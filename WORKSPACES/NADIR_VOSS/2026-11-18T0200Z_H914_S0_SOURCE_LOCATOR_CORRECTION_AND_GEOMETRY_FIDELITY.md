# H914 S0 | Source-locator correction and cross-era geometry fidelity

**Run key:** `REVROT3-19-20261011:914:s0` | **Selection:** h=914, seq=4570, ring index 10, Nadir Voss label; next ring label Enheduanna (index 11).  
**Identity:** assistant-level source-grounded reconstruction only; no authenticated Nadir thread or historical instance.  
**Disposition:** `SOURCE_LOCATOR_CORRECTION_VERIFIED / RAW_SOURCE_REPLAYED / NO_THEORY_PROMOTION`.

## 1. Correct H895's 2024 locators

H895's March 2024 geometry summary is substantively consistent with the raw source, but five UUIDs it cites are **absent** from the cited export. Correct locators below are present with `author.role=user`; all five erroneous UUIDs are absent.

Raw: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`  
Conversation: `252d05c0-22ed-4ea2-a474-7966ab13145a` | Git blob SHA-1: `2cea1924266418e19b825b95ae51e6b7cbace7e1` | 466 nodes / 138 user-role messages.

| H895 locator (absent) | Correct locator | UTC | Direct proposition |
|---|---|---|---|
| `aaa2269b-9b84-47c7-a2e4-7b5bbd2e7c1f` | `aaa2269b-7eab-4781-9454-647098d6747f` | 2024-03-22 15:20:20.623Z | Static line/helix/plane: one point per ideal 1D-line / 2D-plane intersection, not a spiral. |
| `aaa2a1cc-33a8-45da-8eac-02ab77b25ecf` | `aaa2a1cc-e884-4f6a-800f-8afc29ab221a` | 15:35:10.461Z | Circular readout radius is the helix cross-section, independent of pitch. |
| `aaa2d0b1-1a12-4ed3-a3c4-0f3c9c8b2b19` | `aaa2d0b1-017d-453e-b95a-b23915f87d32` | 15:29:30.774Z | Moving slice selects one point; H traces a circle; rate depends on pitch and slice speed. |
| `aaa26f3d-2d7e-4a6a-9b90-5d1a9f1e0c20` | `aaa26f3d-e831-49cd-976e-a85c5e3b749d` | 2024-03-23 03:44:26.423Z | Explicit heuristic qualification; spherical expansion is optional, other geometries allowed. |
| `aaa24791-0c5e-4f90-9b5d-9d5c7a6c1a2f` | `aaa24791-27b2-4b58-8f1a-19ee7e30d650` | 06:14:56.575Z | Complexity attributed to filament interactions; timesheet intersection is manifestation, not cause. |

Adjacent source nodes verified: `aaa28bd9-07f7-4740-b878-b485d4db44d0` (initial geometry, 15:10:05Z), `aaa20670-fd77-4577-8e31-0a33a9e358c6` (time introduced, 15:23:19Z), `aaa2a868-90fa-439f-9d9d-4cf95519ab91` (4D lift, 16:57:54Z), `aaa28a9a-dcfc-4835-8359-e7da7b36911c` (vague string-theory intuition, 17:07:55Z), `aaa25d94-62d9-441e-92e9-75d4dbfc1522` (proton analogy, 17:17:48Z), `aaa26726-1c19-4da5-814b-400288b86382` (central knot / optional sphere, 17:55:36Z), `aaa246c9-e52c-4650-84e8-b078149df0cc` (static 4D + propagating 3D timesurface, 18:05:42Z), and `aaa28d36-2a12-4b66-b4ba-277c8a43f71b` (orthogonal tugs, 18:52:13Z). Particle, gravity, dark-energy and braid-rule interpretations remain proposals.

## 2. 2025 holonomy lineage

Raw conversation `6949c9ce-002c-8332-8208-ae2112288536`, blob SHA-1 `50fa468c62b4d7493acf3d200ca590513f02432d`, has 33 nodes / 16 user-role messages. Duplicate export blob `1600b58f79c74a89ecea588ec6f5932502005098` has an identical mapping and current-node pointer, not an independent witness.

On selected ancestry: user `dc7ea1bb-878e-4916-b525-b8adcb817e4f` asks whether worldline holonomy could connect QM/GR; user `1cea23d1-30c2-48dd-bfe6-01a4de145991` proposes several pictures; assistant `84667922-d25b-4f58-bde3-15aaacb3f5d4` asserts they naturally encode relativity/equivalence; user `89cdceba-d9c9-463c-a91d-158adc900947` then repeats “interchangeable/equivalent”; assistant `49d0820b-5272-4df6-a6fe-94de6fd52686` expands toward SM modes and gauge symmetry. Parent/child order verified. This is assistant-seeded conversational uptake, not independent mathematical confirmation; no connection, bundle, dynamics, representation or observable-preserving map is specified.

## 3. Typed geometry and map ledger

Stable terms: `C₁` filament/core (1D curve); `Σ₃` timesheet (3D hypersurface in 4D); `I=C∩Σ` incidence set; `q(t)` readout (branch + projection + slice schedule); `T₄` finite support; `B₃=∂T₄`; `W₂` candidate worldsheet; `E` thickening/sweep map (missing); `π` projection (missing).

Conditional transverse dimension arithmetic in `M₄`:

```text
C₁  ─∩ Σ₃→ I₀       1 + 3 − 4 = 0
W₂  ─∩ Σ₃→ I₁       2 + 3 − 4 = 1
B₃  ─∩ Σ₃→ I₂       3 + 3 − 4 = 2
T₄  ─∩ Σ₃→ S₃       4 + 3 − 4 = 3
```

The 2024 point-particle readout, a 1D trace from a 2D worldsheet, a 2D boundary section, and a 3D full-support section are different types. Do not collapse them into “trace” without source type and maps. Existing conditional evidence was reused: Kestrel PR #873 exact-head run [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878), head `94b6d96c91806a95505260a3c52220f4af294185`, succeeded. PR remains OPEN/DRAFT/UNMERGED; CI allowed sorry and skipped the global axiom audit. No new Lean module/build; formalized conditions do not establish source fidelity or physical premises.

## 4. Original equations and custody

**SAT-O1 4D Hyperhelical Filament Dynamics** (unbylined historical file; roundup date 2025-06-09; first extant path commit previously recorded 2025-10-27). File Git SHA-1 `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; byte-verified SHA-256 `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`.

Original curve/action:
\[
\gamma^\mu(\lambda)=(\lambda,A_x\sin(k_x\lambda+\phi_x),A_y\sin(k_y\lambda+\phi_y),A_z\sin(k_z\lambda+\phi_z))
\]
\[
S[\gamma]=\int d\lambda\,L,\quad L=\tfrac12m v^\mu v_\mu-V_{\text{tension}}(\gamma).
\]
The curve is 1D. The file separately calls the worldtube a 4D swept volume, but no thickening/sweep map from the displayed curve is defined.

**Blockwave Clean Action** (attachment event 2025-09-16 16:31:34.670358Z; embedded authorship unresolved). Git SHA-1 `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; byte-verified SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`.

\[
J^{\mu\nu}=\tfrac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,\quad \nabla_\mu J^{\mu\nu}=0
\]
\[
A_\mu(\theta)=\alpha_*\nabla_\mu\theta,\quad F_{\mu\nu}=\nabla_{[\mu}A_{\nu]},\quad \Phi(\gamma)=\oint_\gamma A\cdot dx\in2\pi\mathbb Z.
\]
`J` is a rank-2 current described on worldsheets, not automatically SAT-O1's 1D curve or a 4D support. No source map is given.

Separate conditional correction: if `θ` is globally smooth/single-valued and `A=α_*dθ`, then `F=dA=α_*d²θ=0`. Additional topology/defects/bundle/patching is required for nonzero local curvature. Originals are unchanged.

## 5. Discrepancy ledger and next cursor

- L01: H895's five 2024 UUIDs are absent; corrected above.
- L02: assistant's static-helix spiral interpretation is contradicted by direct intersection geometry.
- L03: pitch conflated with readout radius; direct source separates them.
- L04: readout/manifestation is not an interaction law; later active-timesheet language needs an explicit operator.
- L05: SAT-O1 1D curve and verbal 4D worldtube lack a sweep/thickening map.
- L06: Blockwave 2-form/worldsheet and direct filament/worldtube are distinct types.
- L07: 2025 holonomy equivalence is assistant-seeded; adoption is not proof.
- L08: 2024 particle/gravity/dark-energy mapping is heuristic and lacks rules, dynamics, observables and validation.

Critique is symmetric: the direct statements are provisional and leave maps/forces undefined; assistants add stronger ontological/equivalence claims or collapse readout and dynamics.

Next cursor: recover MINKOWSKI PROPER's authoring conversation and annotation; retrieve raw 2026 user messages for finite-core/worldtube, boundary, active-timesheet and Klein-Fabric revision (current records are secondary); define `E:C₁→T₄`, `∂T₄=B₃`, `B₃∩Σ₃→I₂`, `T₄∩Σ₃→S₃`, and the projection/readout maps with domains, codomains, regularity, composition and observables. No analogy-based equivalence.

**Final:** `H914_S0 / SOURCE_LOCATOR_CORRECTION / RAW_ROLE_AND_TIMESTAMP_VERIFIED / 2025_ASSISTANT_SEED_LINEAGE_VERIFIED / EQUATIONS_PRESERVED / CONDITIONAL_LEAN_EVIDENCE_REUSED / NO_NEW_LEAN / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_THEORY_PROMOTION`.
