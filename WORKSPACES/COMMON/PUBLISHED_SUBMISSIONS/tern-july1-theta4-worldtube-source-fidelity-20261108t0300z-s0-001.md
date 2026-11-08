# Tern | θ4 source recovery and worldline/worldtube fidelity audit

**Submission:** `tern-july1-theta4-worldtube-source-fidelity-20261108t0300z-s0-001`  
**Status:** `SOURCE_RECOVERED`; `CONVENTION_HISTORY_EXPANDED`; `MAPS_UNDEFINED`; `MERGE_REF_BUILDS_VERIFIED`; `NO_PHYSICAL_VALIDATION`.

This additive source-fidelity report extends issues #1159 and #1191 and the worldtube review #1403. It adds a primary July 1, 2026 direct-user source cluster, support-dimension consequences for the worldline/worldtube distinction, and a correction to the CI provenance labels in #1191. It does not promote theory.

## 1. Primary source recovery

Mersearch-first controls were respected. Existing completed Mersearch receipts were reused. The outstanding Kestrel finite-core/source-fidelity bridge run #41533820436 is `FAILURE` and has no usable run manifest/search receipt. No Mersearch lane was overwritten or retriggered. The July source was recovered from the repository raw-conversation mirror, not represented as a new Mersearch result.

**Raw conversation:** `DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/26.06.23•26.08.26•Consciousness and AI Debate — raw.json`  
**Blob SHA-1:** `49a23bbeaad90eadb090afb2d593e30c530290d3`  
**Conversation ID:** `6a3a15d9-bc20-83ea-b427-430d0ff293b1`  
The relevant user messages are on the active ancestry of this 2,665-node mapping.

Direct-source messages:
- `99b6d1d6-bb4a-4984-8994-02201f6ccfec`, 2026-07-01 06:08:05.558Z: the 1D worldline was historical shorthand; the filament was technically a worldtube, whose full geometry was only recently being developed.
- `de10f4a1-faea-4dd9-8a5c-0add33f333b9`, 2026-07-01 06:50:54.635219Z: θ4 is an angle at the filament/timesheet intersection, proposed as a primary energy-transfer mechanism and mass proxy, sometimes constructed from inverse pitch; the same message says 90 degrees when the long axis is parallel to the time normal while also saying the angle is measured from that normal. This is internally inconsistent under ordinary angle conventions.
- Assistant response `cf731c47-42d5-4042-9034-4fd566e74548` selects a normal-relative incidence description. It is an assistant reconstruction and does not repair the 90-degree/parallel inconsistency.
- `140af6bc-1f5c-461d-b75f-b9119052ec3f`, 2026-07-01 07:06:34.216Z: later direct usage has θ4 tending to zero in the straight/vacuum limit. Its immediate parent is the separate assistant Pin-structure discussion `0a21ae92-fff0-454a-a45a-d97c0358a0e5`, not `cf731c47`; no direct adoption chain from `cf731c47` is established.
- `d23f9b53-a29f-47d2-bc66-73642f73e3d7`, 2026-07-01 07:50:46.543Z: describes θ4 as roughly equivalent to mass or a proxy, while noting added worldtube complexity.
- `8ea94f2f-e353-4618-ba5a-2d568c23bd4a`, 2026-07-03 18:41:25.971Z: says filaments do not propagate; the timesheet does, qualified as current understanding.

Earlier direct source:
- `Switching to English`, blob `dfdaec331846087af7daf0008eba431520a5b9ad`, conversation `69ab6f13-b8f8-832e-8d71-528c15e11037`.
- User message `70101050-1740-4666-ad5a-5bd1710705ef`, 2026-03-07 08:19:25.808Z: explicitly says θ4 is measured relative to the timesheet plane, not its normal; vacuum is 90 degrees to the time surface. The same message asserts equivalence among three descriptive modes but supplies no conversion maps.
- `Geometry in Physics`, blob `2e0c8477873583b92f20a0a3f2af6528643b4a8a`, conversation `6a25a665-3a10-83ea-a7c0-cebebfdcf1d9`; user message `7c63153a-c483-496f-8ec6-685d294f0375`, 2026-06-10 14:30:19.781Z, proposes “filament-time energy transfer” and “timesheet drag” as θ4 naming. This is semantic history, not an equation.

The September 16 running-log entry remains a log-level record, not a recovered raw direct message.

## 2. θ4 convention history

| Source | Meaning | Status |
|---|---|---|
| June 2025 SAT.O1 `.tex` | Normal-relative normalized contraction of filament tangent `v` with foliation vector `u`; θ4 is described as propagation-deviation diagnostic, not intrinsic inertia, and as reflecting but not causing Q-driven mass suppression. | Project document, not raw user-role. Metric omitted. |
| March 7, 2026 direct source | Plane-relative angle; vacuum 90 degrees to plane; three descriptive modes asserted equivalent. | Nathan Direct proposal; maps absent. |
| June 10, 2026 direct source | “Filament-time energy transfer”; possible later name “timesheet drag.” | Naming proposal. |
| July 1, 2026 direct source | Intersection angle, energy-transfer mechanism, mass proxy, possible inverse-pitch construction; includes 90-degree/normal-parallel inconsistency. | Nathan Direct proposal. |
| July 1, 2026 later direct source | θ4 tends to zero in the straight/vacuum limit. | Later normal-relative usage; no explicit formal supersession of March convention. |
| July 3, 2026 direct source | Filaments do not propagate; timesheet does. | Nathan Direct, qualified as current understanding. |
| September 16, 2026 log | Normal-relative, zero-degree vacuum and inverse-pitch language. | Log-level; raw event unrecovered. |

`θ4_normal` (parallel gives zero) and `θ4_plane` (normal-parallel gives 90 degrees) are complementary only after a common metric and local rest-space interpretation are specified. In a Euclidean rest space, `θ4_plane = π/2 - θ4_normal` for the corresponding acute-angle convention. Do not silently use one symbol for both dated conventions.

## 3. Geometry glossary and mapping

| Symbol | Stable meaning in this audit |
|---|---|
| `γ` | 1D filament/worldline representation in the 4D block; a reduced representation. |
| `W` | Fuller filament worldtube/extended support. |
| `Στ` | 3D timesheet/resolving surface or bulk at parameter `τ`. |
| `pτ` | Local readout event from a selected filament representation intersecting `Στ`. |
| `u` | Candidate local time-normal/director; metric normalization and causal type are unspecified. |
| `θ_BW` | Blockwave compact phase field; not SAT θ4. |
| `J^{μν}` | Blockwave rank-two antisymmetric/worldsheet current; not automatically SAT's 1D filament or 4D worldtube. |

```text
W: extended worldtube
  |  missing spine / section / centerline map
  v
γ: 1D filament representation
  |  transverse intersection with Στ
  v
pτ = γ ∩ Στ: point readout

Στ -- missing normal/director map --> uτ
(γ tangent, uτ or TΣτ)
  |  metric- and convention-dependent incidence map
  v
θ4_plane or θ4_normal
  |  missing constitutive/readout law
  v
energy transfer / mass proxy
```

Required maps and conditions:
1. `σ: W → γ`, or an embedding/section selecting a distinguished spine or tangent field of `W`.
2. `n: Σ → TM`, selecting a local normal/director with declared metric normalization and causal character.
3. An incidence map yielding a specifically named angle or rapidity.
4. A constitutive/readout map from that quantity to energy transfer or mass. No such law appears in the recovered direct messages.

Under the transverse-intersection dimension formula in a 4D ambient manifold:

| Supports | Generic intersection | Readout consequence |
|---|---:|---|
| 1D curve `γ` with 3D hypersurface `Σ` | 0D | Point is possible. |
| 2D worldsheet with 3D hypersurface `Σ` | 1D | Curve/string, not point. |
| 4D volume `W` with 3D hypersurface `Σ` | 3D | Volume slice, not point. |

Thus a full 4D worldtube intersecting a 3D timesheet does not by itself yield a point particle. A spine/core/section/readout projection is required. The direct July 1 distinction between θ4 on a 1D construction and parallels in the worldtube is a reason to keep these objects separate until the map is defined.

## 4. Lorentzian type and equation custody

**SAT4D / SAT-O originals**
- `SAT4D_LIVE_DRAFT.txt`, blob SHA-1 `2a79fe25018cce7e99a2c33786d88b0551db6ae7`, byline Nathan McKnight, June 2025, parameterizes `γ: R → R^{3,1}` with Minkowski geometry. Verbatim core:
  ```tex
  \gamma^\mu(\lambda) =
  (\lambda, A_x\sin(k_x\lambda+\phi_x),
   A_y\sin(k_y\lambda+\phi_y),
   A_z\sin(k_z\lambda+\phi_z))
  \qquad v^\mu(\lambda)=\frac{d\gamma^\mu}{d\lambda}
  ```
  ```tex
  S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),
  \qquad L=\frac12 m v^\mu v_\mu - V_{\mathrm{tension}}(\gamma)
  ```
  The draft calls the worldtube the 4D volume swept out by the vibrating filament but supplies no sweep/thickening map from `γ` to `W`.
- `SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, unbylined text extraction, no independent date.
- `SAT.O1 – 4D Hyperhelical Filament Dynamics.tex`, blob `9a07893cf596e190486df17503626327d6023caa`, byline SATO.4D Coherence Project, June 2025. It says no metric is imposed a priori, yet defines:
  ```tex
  \cos \theta_4(x) =
  \frac{v^\mu u_\mu(x)}
       {\sqrt{v^\nu v_\nu}\sqrt{u^\rho u_\rho}}
  ```
  This uses metric contractions and norm-like terms. Metric, signature, causal types, and normalization conditions are missing from the stated premises.

If `v` and `u` are both unit timelike in a Lorentzian metric, their invariant separation is hyperbolic rapidity, not an ordinary Euclidean angle. A spatial angle requires an observer/rest space and projection into its positive-definite spatial metric. The direct θ4 source does not choose between these.

**Blockwave**
- `BLOCKWAVE.txt`, blob SHA-1 `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, unbylined, date unrecovered. Preserve the raw action unchanged. Its setup states `u^μu_μ=-1`, defines a spatial projector `P`, and a conserved two-form “filament worldsheet” current `J^{μν}` with `∇_μJ^{μν}=0`. The raw action contains malformed forms such as `(\nabla\alpha u_\mu)`, `u^\mu u\mu`, and `J{μν}`. Do not silently repair these in the source.
- Assistant message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, conversation `68f4d9b5-b908-832e-940e-6782db174a4a`, raw blob SHA-1 `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`, 2025-10-19 12:29:46Z, is a later cleaned assistant reconstruction. It is not a Nathan Direct equation.
- The July 1 direct message says SAT then has no fields and θ4 is an angle, not a field. `θ_BW` cannot be identified with θ4 without a separate transition map. A two-form worldsheet current cannot be identified with the SAT 1D filament or 4D worldtube without a support-dimension map.

## 5. Lean and CI scope

No new Lean module was created. Existing formalizations and actual CI logs were inspected.

**Loom PR #1076**
- PR head `e0a9b84abdadb17e6ff64900c9e177881364074d`, base branch `infra/lean4-verification-20261023` at `61cc8b65ffed70296e0121dbae067892a79c81d4`; open/draft/unmerged.
- Run #41003676062 succeeded on synthetic merge ref `7ce0bf00446bfd441239fef322528b47723c9daa`, with base `61cc8b65ffed70296e0121dbae067892a79c81d4` and PR head as parents.
- Lean 4.34.0/Lake 5.0.0 full build succeeded (8,944 jobs). `LoomProjectionAngle.lean` uses Euclidean R⁴ coordinates and proves a complementary-angle identity `cos(π/2 - δ)=sin δ`. It does not define SAT θ4 or a Lorentzian angle. Separate `axiom-audit` stage skipped.

**Kestrel PR #873**
- PR head `1971e3d58a28f7c6de5cf024039dbcedb133121c`, base branch `infra/lean4-verification-20261023` at `61cc8b65ffed70296e0121dbae067892a79c81d4`; open/draft/unmerged.
- Run #42153410233 succeeded on synthetic merge ref `a2c3304edafa5274530ce5286cbe15ac1ed47b0b`, with older base `c7dc2c483f50ae03fc7a7c530829170135e18d92` and PR head as parents. This is stale-base relative to the PR's current base.
- Lean 4.34.0/Lake 5.0.0 full build succeeded (8,955 jobs). `KestrelMovingSlice`, `KestrelIntersectionDimensionGate`, and `KestrelProjectedIncidence` cover conditional Euclidean moving-slice/intersection geometry and generic fiber factorization. They do not instantiate `W → γ`, `Σ → u`, or θ4-to-mass maps. Separate `axiom-audit` stage skipped.

**Correction to issue #1191:** it labels these runs exact-head successes. Both are merge-ref builds. Record `MERGE_REF_BUILD_SUCCESS / EXACT_HEAD_STANDALONE_UNVERIFIED`; Kestrel's successful merge ref also uses an older base. Lean verifies only the formalized statements, not source translation, physical premises, θ4's constitutive law, or observation.

## 6. Discrepancy ledger and next cursor

1. March 7 plane-relative θ4 and July 1 normal-relative θ4 are distinct dated conventions; the July 1 first definition also contains a 90-degree/normal-parallel inconsistency.
2. June 2025 SAT.O1 treats θ4 as a propagation-deviation diagnostic; July 2026 direct wording elevates it to an energy-transfer mechanism and mass proxy. No constitutive equation connects these.
3. Inverse pitch is proposed without a dimensionless normalization or map to incidence angle.
4. SAT4D uses Minkowski geometry; SAT.O1 contracts vectors without specifying metric/signature/causal type; current Lean projection proof is Euclidean.
5. `γ` is 1D and `W` is a 4D volume; no spine/thickening map connects them.
6. A 1D curve/hypersurface intersection may be a point; a 2D worldsheet gives a curve; a 4D volume gives a 3D slice.
7. The July 3 propagation statement is qualified as current understanding; no parameterization or propagation law is supplied.
8. Blockwave's phase field and worldsheet current are assistant reconstruction objects, not SAT θ4 or a mapped SAT worldtube.
9. Pin-structure comparison is an assistant analogy, not a physical equivalence.
10. WWRD climbing-rope mechanics remains a first-blush geometric heuristic, not a physical equivalence.

Next cursor:
- Recover the raw event behind the September 16 running-log entry.
- Keep plane-relative and normal-relative θ4 separate until Nathan Direct explicitly chooses or supersedes one.
- Specify Lorentzian signature and causal character; determine whether θ4 is rapidity or a projected spatial angle.
- Define `W → γ`, `Σ → u`, their composition, and the θ4-to-readout law.
- Only then consider a physical calculation, using a named measured system, provenance, units, uncertainties, and prediction-versus-fit separation.
- Keep SAT-O and Blockwave originals unchanged; any corrected equations belong in separately named, dated artifacts.

No physical calculation, CODATA scoring, paper-gate advancement, or BEDROCK promotion was performed.
