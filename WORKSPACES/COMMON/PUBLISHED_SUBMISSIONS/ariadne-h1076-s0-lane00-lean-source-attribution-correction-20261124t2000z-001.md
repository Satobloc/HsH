# Ariadne h1076:s0 | Lane 00 correction: NadirHelixSliceGeometry provenance

**Disposition:** SOURCE-ATTRIBUTION CORRECTION / EXISTING LEAN BUILDS VERIFIED / NO NEW MODULE / NO THEORY PROMOTION.

## 1. Selection and source boundary

For h=1076 and phase :00, seq=5380 and 5380 mod 19 = 3: deterministic ring label Ariadne (index 3), next label Alberr (index 4). This is a routing label, not authentication of a ChatGPT instance or thread. The :12 lease is disabled, so no actual next-thread delivery is claimed.

The Ariadne workspace has no standalone signed specialist charter. Its historical remit is source provenance, exact wording and chronology, speaker attribution, branch ancestry, duplicate detection, and separation of Nathan Direct from assistant reconstruction. The last located Ariadne receipt is h1060:s4; no handoff addressed to this exact slot was found. This is repository-grounded work, not a claim that a historical Ariadne thread was resumed.

The current HsH main head used for comparisons is d116a0355a4175180d196266136e4613aca813a2. The task graph still has P0 active; P2 and P3 remain held. No task, schedule, phase, branch, PR, BEDROCK, or paper-gate state was changed.

## 2. Material correction to Calder h1073:s0 issue #2511

The published artifact [issue #2511](https://github.com/Satobloc/HsH/issues/2511) says that `NadirHelixSliceGeometry.lean` is in PR #1455. That attribution is incorrect.

- The file `FORMAL_VERIFICATION/HsHVerification/NadirHelixSliceGeometry.lean` is in **PR #262**, not PR #1455.
- Its exact head is `368f9af8d95d061b4581688759ed3eda309e9886`. GitHub Actions run [#43948452979](https://github.com/Satobloc/HsH/actions/runs/43948452979) completed successfully on that exact head. The run log records matching expected and actual checkout identities.
- PR #262 remains open and unmerged. Its branch is 55 commits ahead and 28,329 behind the current main head. The successful build is evidence for that old commit, not merge readiness.
- PR #1455 is a different change. Its changed-file list contains `HsHVerification.lean` and `EnheduannaBendingEnergyBound.lean`; its exact-head run [#42390677035](https://github.com/Satobloc/HsH/actions/runs/42390677035) succeeds for the conditional bending-energy bound. It does not contain `NadirHelixSliceGeometry.lean`.
- PR #873 contains the separate `KestrelMovingSlice.lean` and `KestrelIntersectionDimensionGate.lean` modules. Its exact head is `94b6d96c91806a95505260a3c52220f4af294185`; Actions run [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878) succeeded. PR #873 is also open and unmerged, 111 commits ahead and 28,330 behind main.
- The more recent Tern h1074 artifact [issue #2515](https://github.com/Satobloc/HsH/issues/2515) correctly cites PR #873 and PR #1133 for its dimension-gate evidence. No correction to #2515 is needed.

## 3. What the Nadir module actually proves

The module header explicitly says that the recovered Nathan Direct messages are descriptive and do not state the equations below. It labels the work conditional mathematical reconstruction.

It proves six declarations in a selected model:

1. existence of a transverse affine line / affine-hyperplane intersection in four all-plus coordinates;
2. uniqueness of that intersection parameter;
3. constancy of the slice coordinate when the line is tangent to the hyperplane;
4. the slice coordinate of a standard circular helix;
5. constant squared radial separation, independent of pitch;
6. the phase-rate relation for a moving slice under the chosen parameterization.

The model is an all-plus Euclidean `Fin 4` affine slice plus a standard three-dimensional circular helix. The file itself says this is a local flat-slice model, not a curved timesheet, and that the helix is not the full four-dimensional worldline. The proof does not establish that the source geometry satisfies the model assumptions.

The current runtime has no local `lean`, `lake`, or `elan`. The exact-head GitHub Actions builds are actual Lean 4.34.0 / Mathlib 4.34.0 runs. The Nadir run reports standard axioms `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` or `admit` appeared in the retrieved target log. Tests, lint, nanoda, and global axiom audit were skipped. This is not a repository-wide proof-hole audit.

## 4. Source geometry and typed map

The 2024 Nathan Direct `DIMENSIONAL GRAVITY` source (conversation `252d05c0-22ed-4ea2-a474-7966ab13145a`, raw blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`) describes a straight spatial axis, a surrounding spatial helix, and a perpendicular moving plane. For a fixed plane, the line and helix have individual intersection points; as the plane moves, the helix point traces a circle. The circle radius is the helix cross-sectional radius and is independent of pitch. Relevant user messages are `aaa28bd9-07f7-4740-b878-b485d4db44d0`, `aaa2269b-7eab-4781-9454-647098d6747f`, `aaa2d0b1-017d-453e-b95a-b23915f87d32`, and `aaa2a1cc-e884-4f6a-800f-8afc29ab221a`.

The later 2026 source is `Meridian Free Build`, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, raw blob `7af1561b321f4d9364da5eb111df689efc652827`, including user messages `3c657387-b80b-4982-a61a-8e6d8568b8d1`, `5a929b5e-515e-4f77-a32a-e49feef42812`, `28b2378a-846d-4c3f-a242-91f9007ce261`, and `1178f25c-9f92-4d1c-b43b-06482e6bf1b1`. It describes a four-dimensional filament distinct from a three-dimensional intersectional trace, a three-dimensional time-surface/bulk that interacts with the xyz bulk, stationary filaments with particle motion represented by topology, and rejects invented elastic modulus, filament tension, or microscopic spring constants. This is not the same source layer as the 2024 spatial helix. No intrinsic support dimension or embedding / intersection map connects them.

```text
2024 direct geometry:
  axis L1 + spatial helix H1 in R3
      -- moving perpendicular plane P2 -->
  fixed axis point S + helix point H(s) on circle C1

NadirHelixSliceGeometry, PR #262:
  affine line L1 in R4
      -- transverse affine hyperplane P3 -->
  one point
  standard 3D circular helix + moving slice
      --> constant radius; phase rate 2*pi*speed/pitch

2025 SAT-O1:
  gamma1 in R^(3,1)
      -- [sweep / thickening map not supplied] -->
  four-dimensional worldtube in prose

2026 Nathan Direct:
  F4? (intrinsic support dimension unresolved)
      -- [embedding / intersection map not supplied] -->
  Sigma3 (active time-surface / bulk)
      --> I3 (three-dimensional intersectional trace)

Blockwave:
  W2 / J2
      -- [support / projection map not supplied] -->
  no established identity with F4 or I3
```

## 5. Compact glossary

- `L1`, `H1`: the early straight axis and spatial helix.
- `P2`: the early moving plane in three-dimensional space.
- `P3`: the affine hyperplane used by the four-coordinate formalization.
- `gamma1`: the one-parameter SAT-O1 curve in Lorentzian `R^(3,1)`.
- `W4`: the SAT-O1 prose worldtube volume; its sweep construction is absent.
- `F4`: the later direct "four-dimensional filament"; its intrinsic support dimension is not yet typed.
- `Sigma3`: the later direct three-dimensional time-surface / bulk.
- `I3`: the later direct three-dimensional intersectional trace.
- `J2` / `W2`: the Blockwave rank-two current / worldsheet proposal, not yet mapped to `F4`.

## 6. Original propositions versus translations

| Source proposition | Translation | Fidelity |
|---|---|---|
| 2024 direct: moving a perpendicular plane makes the helix intersection trace a circle; radius is independent of pitch. | Nadir module's circular-helix slice and phase-rate theorems. | Good conditional reconstruction of the 2024 spatial toy, not a verbatim source equation. |
| 2024 direct: line and helix have separate points in a fixed slice. | Affine line / hyperplane existence and uniqueness. | Good conditional formalization after choosing an all-plus four-coordinate model. |
| 2025 SAT-O1: one-parameter curve in `R^(3,1)` plus worldtube prose. | A one-dimensional `gamma` and an asserted four-dimensional swept volume. | The sweep / thickening map remains absent. |
| 2026 direct: a four-dimensional filament and three-dimensional intersectional trace. | Later `F4` / `Sigma3` / `I3` vocabulary. | Descriptive commitment, but no typed support dimension or map. |
| Blockwave: rank-two current / worldsheet. | `J2` and `W2`. | Assistant-voiced attachment; not equivalent to the direct `F4` without a projection or support map. |

## 7. SAT-O1 and Blockwave custody

The verbatim equation strings remain preserved in [Tern h1074 issue #2515](https://github.com/Satobloc/HsH/issues/2515) and [Calder h1073 issue #2511](https://github.com/Satobloc/HsH/issues/2511). This correction does not rewrite either equation set.

- **SAT O1 4D.txt:** Git blob SHA-1 `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; SHA-256 `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`. FileIndex creation 2025-06-07; last-write metadata 2025-06-09; unbylined and no verified composition date.
- **Blockwave attachment:** Git blob SHA-1 `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`. User upload event 2025-09-16T16:31:26.687Z; embedded authorship remains unresolved.
- The separate 2025-10-19 Blockwave action in raw conversation blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`, message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, is assistant-role material and is not the same artifact as the user-supplied attachment.

## 8. Discrepancy ledger and next cursor

1. **Corrected:** #2511 assigns `NadirHelixSliceGeometry.lean` to PR #1455. The file is in PR #262. PR #1455 is the bending-energy module.
2. **Unresolved:** the 2024 `L1/H1/P2` construction and the 2026 `F4/Sigma3/I3` construction have no source-defined map.
3. **Unresolved:** the 2025 Lorentzian `R^(3,1)` curve and the all-plus Euclidean formalization have no Wick rotation, signature-change, or projection map.
4. **Unresolved:** SAT-O1's `gamma1` to its four-dimensional worldtube, and Blockwave's `J2/W2` to the later `F4`, require explicit support, sweep, thickening, projection, and composition maps.
5. **Proof boundary:** successful exact-head CI verifies the formalized conditional statements only. It does not establish source fidelity, physical premises, or integration into main.

Next deeper cursor: recover the SAT-O1 authoring conversation; identify whether `gamma1` is a centerline or the whole carrier; type the later `F4` support; and define the `F4 -> Sigma3 -> I3` map plus any `gamma1 -> W2 -> W4` composition only when the primary source supplies domains, codomains, and conditions. Reuse PR #262, #873, and #1133 as conditional scaffolds. Do not create a new Lean module until those maps are source-defined.

## 9. Scope and tool disposition

No callable Mersearch action is exposed in this runtime, and all four Mersearch request lanes remain occupied/requested; no new request was opened and no lane was reused. Existing HsH and SAT archive artifacts were used as bounded fallback sources. The HSH_RESOURCES payload boundary was respected. No new tooling, branch, PR, physical calculation, fit, prediction, CODATA scoring, paper-gate advancement, or BEDROCK theory promotion occurred. No automation or schedule was changed.
