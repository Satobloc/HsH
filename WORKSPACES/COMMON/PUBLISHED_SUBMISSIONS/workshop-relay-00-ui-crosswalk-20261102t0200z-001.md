# March 7 Universal Indicatrix: source-to-implementation fidelity crosswalk
Date: 2026-11-02T02:00Z nominal slot (h=530, s=0)
Run label: Elias Kern; next ring label: Nadir Voss.
Status: source-grounded reconstruction; no authenticated Elias ChatGPT thread or current-slot thread delivery is claimed.

## Scope and provenance

This is an additive crosswalk to the existing 2026-11-02 :00 off-path particle-mode report. It does not repeat the mode taxonomy or re-prove the existing UI gauge results. It links the March 7 primary conversation geometry to the later assistant-text bundle and the extant 4D UI code.

The raw conversation export is `Satobloc/HsH` blob `dfdaec331846087af7daf0008eba431520a5b9ad`, title **Switching to English**, conversation `69ab6f13-b8f8-832e-8d71-528c15e11037`, current node `b6393924-8bf5-4bfc-b55a-c577252613d9`. The relevant direct user messages below are ancestors of that current node, not detached sibling branches.

### Nathan Direct source anchors

- `9dc80f6c-9f05-4c60-9713-1333427a72ad` — 2026-03-07 01:54:17.952Z.
- `53a90640-9dd4-45f9-8647-328533e801a9` — 2026-03-07 03:12:50.588Z. The user clarifies that the preceding overview is metaphorical, that equations have not yet been developed in that exchange, and that the helices are in phase space or spin space rather than literal spatial coils in spacetime. This is separately cross-referenced in issue #1178.
- `a02dd3cb-d6a3-47cb-827b-ec5ad996f6f9` — 2026-03-07 04:14:35.715Z.
- `0af476ca-9aac-43a5-b9c9-e0fdf038f2b6` — 2026-03-07 05:01:20.951Z. The user says they are not sure a complete Universal Indicatrix Lagrangian exists and characterizes the UI as a mapping/translator tool; the 4DHH and 4D-hypersphere Lagrangians are distinct.
- `8e699f85-2109-4d57-81de-5bb5430f4353` — 2026-03-07 08:50:32.122Z. The general helical-order Lagrangian is still to be shaped for use with the UI.
- `53452980-7afe-48ef-ab4f-04ef376b04ca` — 2026-03-07 08:54:12.475Z.
- `a27ac504-8a09-4a2e-9de8-fc4c5cf05680` — 2026-03-07 09:08:47.520Z. The user describes a fixed and a movable coincident hypersphere/grid in four dimensions; the movable copy can rotate about the origin and expand/contract. A marked point on the 3D surface traces a path; the simplest proposed case starts at zero size and expands to a unit sphere. The user asks whether this is a Lagrangian, Hilbert space, or something else, and asks to start with a 3D toy version. The message asserts an equation/curve correspondence and integration over the full 4D hypersphere volume, but supplies no explicit encoder, decoder, measure, or composition law.
- `635a4945-a0a1-491d-b7ea-0a643d5c6135` — 2026-03-07 10:39:07.179Z. The user asks to compare curves and find a shortest derivation.
- `8270405c-912d-4c88-a00f-32ad909cd83e` — 2026-03-07 11:05:13.866Z. The user describes mapping between points, curves on or inside the sphere, a perpendicular curve in the other hemisphere, and solids of rotation. These are stated capabilities/intentions, not a supplied proof or complete implementation.
- `932e7f79-cb43-41db-af14-db66ffefb4c5` — 2026-03-07 16:33:28.161Z. The user refers to a prior relativity/gauge-to-metric example but does not provide its derivation in this source cluster.

### Embedded LLM text: not Nathan Direct

Message `f11275ae-5ca5-4834-a4d7-d861b85cec43` is an outer `user`-role message (2026-03-07 11:11:23.762Z; 67,106 characters), but its body is a pasted assistant-style document titled **SAT PARTICLE ZOO LAGRANGIAN**. It repeatedly speaks in an assistant's voice (“I’ll write it explicitly”, “Your description suggests”) and its metadata records `resolved_model_slug: gpt-5-3` for the containing turn, which does not authenticate the origin of the pasted text. The body is written in an assistant's voice; treat it as embedded assistant-style historical material with unknown original generator/thread, not Nathan Direct.

That pasted material contains the explicit `y(λ)=r(λ)R(λ)x₀` representation, an `SO(4)` rotation, an `Ω=ṘR⁻¹` definition, a proposed `L_UI`, a functional integral over `r` and `R`, and a proposed shortest-derivation cost. It also contains a nested superhelix ansatz. None of these becomes Nathan Direct merely because the containing message has role `user`.

Related archive documents are also provenance-limited:
- `2026/SAT CORE — UI CONFIG.txt`, blob `6817caf68943593f31d72d51798e0ba4589624a4`.
- `2026/SAT CORE — BYO LAGRANGIAN.txt`, blob `47ee684888525d9d71a6dd701041685681f3dc49`.
Their document-level author role is not established here. The BYO text is consistent with the direct statement that the UI is a generator/mapping tool and that a separate Lagrangian supplies a measure; the UI-CONFIG text carries an `L_UI` proposal and must not be promoted to direct source.

The related `SAT PARTICLE ZOO LAGRANGIAN (nolattice).pdf` extraction records source SHA-256 `863b4f784872ccd184925064d077d27e72e3ff9ba3d299efd24f145ed42ecb76` and labels the document tentative. The NotebookLM export is a secondary synthesis, not an independent user-authored derivation.

## Glossary

| Term | Controlled meaning in this audit |
|---|---|
| Fixed reference sphere/grid | Nathan Direct's stationary four-dimensional reference copy. |
| Movable sphere/grid | Coincident copy whose axes/orientation and scale vary. |
| Marked-point readout | The point/path obtained from comparing the fixed and movable constructions; the exact ray/projection map remains underspecified. |
| S³ surface | Three-dimensional boundary of a four-dimensional ball. |
| B⁴ volume | Enclosed four-dimensional region; not interchangeable with its S³ boundary or with a path space. |
| Phase/spin-space helix | The March 7 direct qualification; not automatically a literal spacetime coil. |
| `R(λ) ∈ SO(4)` | A reasonable assistant reconstruction of a rotating four-dimensional frame, not an equation supplied in the direct messages listed above. |
| `r(λ)` | Assistant-reconstructed scale coordinate; the direct description permits a zero-size starting state. |
| UI generator | The user's direct characterization of the Indicatrix as a mapping/translator apparatus; not a demonstrated universal equation solver. |
| Stabilizer/gauge fiber | Rotations that change the full frame while leaving one marked-point readout unchanged. |

## Original propositions versus translations

| Layer | Proposition | Status |
|---|---|---|
| Nathan Direct | Fixed and movable coincident 4D sphere/grid; rotation and expansion/contraction generate marked-point paths. | Descriptive geometry; exact map not supplied in the cited message. |
| Nathan Direct | UI is a mapping tool; a complete UI Lagrangian is uncertain and may not be needed. | Explicit qualification; do not overwrite with an assistant's completed-action claim. |
| Nathan Direct | Equations and curves are intended to be mutually translatable; shortest derivations are a goal. | Programmatic claim/request; no general encoder/decoder or distance functional supplied here. |
| Embedded LLM text | `y(λ)=r(λ)R(λ)x₀`, `R∈SO(4)`, plus `L_UI`, path integral, and shortest-path cost. | Historical LLM reconstruction; not direct source. |
| Existing code | Per-sample six-plane `so(4)` coefficients are exponentiated to rotations and applied to a marked point. | Executable sampled generator; not a complete theory or continuous dynamics law. |
| Existing code | A supplied 4D curve is converted to radius/direction and a chosen minimal rotation. | One selected inverse/gauge representative; not a unique inverse. |

## Mapping diagram

```text
Nathan Direct:
  fixed grid + fixed hypersphere
             \
              -> marked-point / ray / projection readout -> path or shape
             /
  movable grid + rotating and scaling hypersphere

Assistant reconstruction (not direct):
  x₀ ∈ S³, r(λ) ≥ 0, R(λ) ∈ SO(4)
                  y(λ) = r(λ) R(λ) x₀
                  |
                  +--> proposed L_UI / path integral / shortest-cost functional

Existing sampled implementation:
  forward: (rᵢ, aᵢ ∈ so(4)) -> Rᵢ = exp(K(aᵢ)) -> yᵢ
  reverse: Xᵢ -> rᵢ, uᵢ -> selected minimal Rᵢ -> reconstructed X̂ᵢ
                  |
                  +--> SO(3) stabilizer: distinct full frames can share one point readout
```

The first diagram's ray/projection/readout arrow is a target specification, not a recovered implementation. The second diagram is a restricted marked-point model. The two diagrams must not be silently identified.

## Existing implementation audit

1. `tools/whirligig_rq/ui4d.py`, blob `6dc51596150467261086705f95b16ba92812c0c6`: `so4_generator` builds a skew 4×4 matrix from six plane coefficients; `six_plane_rotation` returns its matrix exponential; `indicatrix` applies per-sample rotations to a marked point with supplied radii. These six values are per-sample Lie-algebra coefficients passed through an exponential chart. The code does not integrate an angular-velocity history via `Ṙ=ΩR` or a path-ordered exponential. If the values are intended as rates, the required integration is absent; if they are chart coordinates, the API/documentation should say so.
2. The same file's `lift_sphere_curve` embeds a 3D curve into an equatorial S² subset of S³ before rotating it. This is a restricted S²→S³ lift, not arbitrary curves throughout S³ or the B⁴ interior. The core `indicatrix` accepts zero radii, but this helper rejects zero-norm input points, so the direct zero-size start is not supported uniformly across the API.
3. `WORKSPACES/MERIDIAN/SOLVER_HARNESS/UI_MAPPER/ui_mapper_basic.py`, blob `373d8632429e010532e6ca2589465bb90a9a3c1d`: takes an existing 4D curve, derives radius and direction, chooses a minimal SO(4) rotation for each valid sample, and reconstructs the curve. It is a curve→chosen-controls/readout path. The finite-difference angular velocity is derived from that selected frame history; it is not an independently supplied physical rate.
4. These two files are complementary sampled tools, not a proven bijection. The reverse mapper chooses one representative from a non-unique fiber. Existing issues #427 and #432 already discuss the UI address gate and the six-plane lift; this note adds the direct March 7 source anchor and the per-sample-coordinate versus integrated-rate distinction.
5. The Whirligig README, blob `c969cb221058656b6b835b50b22beed1af3e9621`, distinguishes the browser's 3D rolling-torus/contact model from the older R/Q solver and the 4D companion. These are not interchangeable implementations of the Universal Indicatrix.

## Discrepancy ledger

- **S³ versus B⁴:** Nathan Direct refers to the 3D surface and the full 4D volume. A boundary/surface map and a volume measure are different objects; no measure-preserving projection from B⁴ to the proposed path space is supplied.
- **Two-sphere construction versus one-point formula:** `y=rRx₀` captures a marked-point trajectory under a chosen Euclidean SO(4) action. It omits the explicit fixed reference sphere, the second marked point/ray relation, and the full movable grid.
- **Phase/spin space versus spacetime:** the direct March 7 qualification keeps the helices in phase or spin space. No projection/embedding from that space to the UI's Euclidean S³ or to spacetime was recovered. See #1178.
- **Euclidean UI versus Lorentzian spacetime:** the UI code uses Euclidean R⁴/SO(4)/S³ normalization; `ui_mapper_basic.py` computes a separate Minkowski causal classification. No Lorentz-equivariant map between these structures is supplied.
- **Lagrangian status:** the direct user says a complete UI Lagrangian is uncertain and describes the UI as a mapping tool. The pasted LLM text's `L_UI` is a proposal, not an established Nathan equation. The point-kinetic/Frobenius-norm issue is already treated in #458; it is not re-proved here.
- **Rotation semantics:** `ui4d.py` exponentiates six per-sample Lie-algebra coefficients. It does not integrate a time-varying angular velocity. The intended interpretation must be fixed before a dynamics claim.
- **Restricted lift:** the code's S²→equatorial-S²-in-S³ helper does not implement arbitrary S³ surface paths, B⁴ interior paths, the full ray construction, or solids of rotation.
- **Equation translation:** a parametric curve adapter is not a general equation→curve→equation translator. No encoder, decoder, composition law, solution-branch rule, observable map, or metric for “shortest derivation” is specified.
- **Formalization boundary:** Lean proves only the imported formal statements. It does not validate the Nathan-to-code translation or physical truth.

## Lean and prior-work verification

- PR #750, head `b2eb585e492532feb6e2593f001461260a9d05e6`, run #40996878087 / job #123871939614: SUCCESS on the PR merge-ref build, Lean 4.34.0 / Lake 5.0.0, 8,946 build jobs. `MeridianUIOrigin` was built; its conditional results include zero-scale direction loss. PR remains draft/open/unmerged.
- PR #752, head `e4c8ead3fc9238d03c0efd4ee06f82a3ab87f9a9`, run #40521496151 / job #122249729771: SUCCESS on the PR merge-ref build, Lean 4.34.0 / Lake 5.0.0, 8,948 build jobs. `MercerS2GaugeLift` and `MercerS2GaugeRate` were built; the abstract stabilizer result shows distinct full lifts can share one marked-point readout. PR remains draft/open/unmerged.
- `ArchiveEQ0022.lean` at commit `8408c20fd0ab34f15ffa688a5136139b69a606cc` exists, but the aggregator at that commit does not import it. Run #40177767298 succeeded on the aggregator and its log does not contain `ArchiveEQ0022`; therefore that run does **not** verify the standalone module. Its formalized residual rotation is a specific SO(2) family, not the full general four-marker SO(4) uniqueness theorem.
- No new Lean module or PR was created. Existing compiled modules cover the relevant conditional zero-scale and stabilizer statements; the full source-to-implementation map remains underspecified. The unimported `ArchiveEQ0022` module remains unverified.

Existing overlapping records are retained rather than duplicated: #1178 (phase/spin-space source qualification), #458 (UI marked-point/four-marker and point-kinetic audit), #786 (UI source/map fidelity), #427 and #432 (UI address and six-plane lift), and PR #752 (stabilizer non-identifiability).

## Next deeper cursor

1. Recover the original PDF behind **Universal Indicatrix in my words CHARACTERIZATION**; the available extraction records source SHA-256 `ad920fa...`, but the original PDF bytes were not retrieved in this run.
2. Recover the actual direct derivation for the claimed relativity↔SU(2)/gauge-to-metric example. The March 7 message asserts a prior example but supplies no derivation here.
3. Specify the fixed-grid/movable-grid projection, marked-point/ray readout, Euclidean-to-Lorentzian map (if intended), and composition maps with domains, codomains, regularity, and gauge conditions.
4. Decide whether six parameters are per-sample log coordinates or angular-velocity controls. If rates, specify and formalize the time-ordered evolution; if coordinates, document the chart and continuity limitations.
5. Define an equation encoder, curve generator, curve decoder, composition operator, and metric for shortest derivation before claiming universal equation translation.
6. Keep phase/spin-space helices, UI S³ geometry, B⁴ volume, spacetime worldlines, and Whirligig rolling mechanics distinct until explicit maps are supplied.

## Operational and epistemic status

No CODATA scoring, physical calculation, invented physical fixture, theory promotion, production-code change, new tool, new branch, or new PR was performed. Shared Mersearch request lanes were occupied, so no lane was overwritten or new Mersearch request issued; direct raw-export recovery and bounded repository/code inspection were used instead. The result is a source-to-implementation audit, not an empirical validation or a new physical mechanism.

The :00 task identity/schedule was not changed. Ring labels do not authenticate ChatGPT threads. The 01:48Z Hale packet in Elias's inbox explicitly labels itself optional context for Elias's next appearance (h=533, s=4), not delivery to this h=530 run. No cross-thread delivery or acknowledgement is claimed.
