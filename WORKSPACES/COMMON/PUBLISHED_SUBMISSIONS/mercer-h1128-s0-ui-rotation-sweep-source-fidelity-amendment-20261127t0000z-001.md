# Mercer h1128:s0 — UI rotation/sweep source-fidelity amendment

**UTC slot:** 2026-11-27T00:00:00Z  
**Run key:** `REVROT3-19-20261011:1128:s0`  
**Selection:** h=1128, seq=5640, ring index 16 = Mercer; next ring label = Ravel.  
**Disposition:** `SOURCE_LOCATOR_CORRECTED / HYPERSPHERICAL_UI_INTENT_CONFIRMED / ASSISTANT_OVERTRANSLATION_IDENTIFIED / CONDITIONAL_LEAN_RESULTS_REUSED / NO_THEORY_PROMOTION`.

This is an additive correction and expansion of [Meridian h1124:s0, issue #2633](https://github.com/Satobloc/HsH/issues/2633). The original artifact is not overwritten.

## 1. Raw-source locator correction

The September 9 source cited in issue #2633 is verified in HsH at [the raw conversation export](https://github.com/Satobloc/HsH/blob/main/LIVE%20CONVOS/26.09.08%E2%80%A226.09.08%E2%80%A2Build%20Geometry%20Coding%20Skill%20%E2%80%94%20raw.json):

- `LIVE CONVOS/26.09.08•26.09.08•Build Geometry Coding Skill — raw.json`
- Blob `7426016a72905bb37a45abac4394e4e7bb051144`; 397,371 bytes.
- Conversation ID `6aa0a623-09ac-83e9-b995-e6c8d4e75435`.

The six corrected user-role message IDs are:

| UTC | Correct message ID | Direct content |
|---|---|---|
| 00:48:56.017 | `1cea7e1f-ec85-49cf-a100-837953c655fd` | Sphere/hypersphere, equivalent points, equal-angle distribution and residuals |
| 00:50:29.792 | `02aa2e1c-18f1-47b1-8e3f-8e22f90d8582` | Point → line → circle → sphere “and up”; the message ends there |
| 00:53:42.556 | `13ad4e5b-4a33-4fcf-9c03-ef96c8773d99` | Rotation plus expansion, or tentatively two 4D rotations, a helical-like point history and a tail sweeping a volume |
| 01:05:48.061 | `eceadf5a-c53b-4def-8420-07079a3878aa` | UI originally intended as a hypersphere with radius integrated about all rotations and full-unit expansion |
| 01:20:54.436 | `05bad0dd-9326-4d6b-83dd-87f7b01a7140` | P-P called an operator; ᚼ is the standard rotation-expansion state; ᚼᚼ denotes two particles undergoing standard helical integration |
| 01:30:43.108 | `f542adec-9ebf-4174-9cda-148892246f9d` | Core value decomposed into expansion and rotation, with Δangle×expansion, Δasymmetry and tentative Δbifurcation |

The UUIDs currently printed in issue #2633 do not occur in this raw mapping. An additive correction was posted in [issue #2633, comment #7206620289](https://github.com/Satobloc/HsH/issues/2633#issuecomment-7206620289) and read back exactly.

Additional direct messages in the same cluster:
- `cb6aef6b-0bf2-4559-aa6e-030e294369ae` (00:55:31.079Z): possibility of factoring out curvature or rotation for simplification/lower dimensionality.
- `b8915d79-5a3d-4ad1-a744-c1f32684dfc0` (01:10:57.925Z): P=|U|.
- `4a45f9b3-8804-4e6b-817b-bfd31833ddb5` (01:32:39.982Z): the proposed components have a canonical relation as an even decomposition of one variable.
- `75f06510-f0dc-4c9a-bc65-c1c9a17f1293` (01:34:53.201Z) and `7d1b4fe3-e058-4825-b255-427ea855a8c0` (01:35:11.008Z): inverse perturbation and residual anisotropy.

## 2. Nathan Direct geometry, with mathematics bracketed

The direct messages support this descriptive intent:

1. A spherical/hyperspherical configuration with equivalent-value points, intended equal-angle distribution and residuals.
2. A proposed point/line/circle/sphere progression and higher forms.
3. Simultaneous rotation and expansion, tentatively including two 4D rotations, producing a helical-like point history.
4. An attached tail or extent whose history sweeps a higher-dimensional region.
5. A UI explicitly described as a hypersphere, with radius integrated over all rotations and full-unit expansion.
6. A possible reduction by factoring out curvature or rotation.
7. A P-P operator/state vocabulary, with ᚼ as a standard rotation-expansion state and deviations separated into angular-expansion, asymmetry and possible bifurcation components.

The source does **not** define the ambient metric/signature, rotation path, parameter λ, full-unit expansion law, attached cross-section, sweep map/rank, P-P domain/codomain, or a reduction map.

## 3. Historical assistant translations and mismatches

| Direct proposition | Assistant translation | Fidelity assessment |
|---|---|---|
| Point → line → circle → sphere | S⁻¹→S⁰→S¹→S²→S³ and an eigenvalue/rank family | Mismatch: S⁰ is two points, not a line segment. The assistant's equation with equality defines an ellipsoid boundary; one active axis gives two points, not a segment. Rank is integer-valued and changes at degeneracy; it is not a continuous fractional dimension. |
| Rotation + expansion; tentatively two 4D rotations | Fixed-plane R₁₂(θ)R₃₄(φ), Clifford torus and closure/density claims | Plausible Euclidean SO(4) reconstruction, not direct notation. No metric, fixed plane split or sign branch is selected by the source. Closure/density requires a linear flow with a constant phase-rate ratio, not merely an instantaneous θ/φ ratio. |
| Tail sweeps a volume | Moving object automatically sweeps one dimension higher | Conditional only. The sweep differential must have the required rank; parameter count alone does not establish image dimension. |
| Factor out curvature or rotation | Quotient/gauge reduction and an inverse curvature operator | Overtranslation. Y=R⁻¹X is a same-dimensional co-rotating-frame change. Reduction needs an explicit quotient, projection, invariant subspace or restricted submanifold. The curvature operator and inverse were not defined by the direct source. |
| P-P operator, ᚼ standard state | H(P±δ), Taylor residual and bifurcation threshold | Candidate assistant model, not a Nathan equation. H, δ, domain, units, evolution law and threshold are not source-defined. |

The formal equations in [`2026/SAT CORE — UI CONFIG.txt`](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/2026/SAT%20CORE%20%E2%80%94%20UI%20CONFIG.txt) (blob `6817caf68943593f31d72d51798e0ba4589624a4`) give y(λ)=r(λ)R(λ)x₀, R∈SO(4), r(λ)=λ and Ω=ṘR⁻¹. The file has no raw message-role metadata or byline; these are historical formal translations, not verbatim Nathan Direct equations.

The 13-page `UI CONFIGURATION (nolat).pdf`, represented by [its extracted text](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/UI%20CONFIGURATION%20(nolat).txt), has source SHA-256 `2c2c8fcb5e19363c319da6a10cc36c21d2c2b23d686686fe45d2daaa7541ca4c`; its PyMuPDF text extraction is blob `31dbf4858782a97ad8802ee496f89a944bf7e90f`. Note 2 says the more formal text is largely LLM-written. [`SAT GEOMETRIC SOLVERS.txt`](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%20GEOMETRIC%20SOLVERS.txt), blob `5429f7cb2adbfdc0abab7db46eff4ca4de08358a`, is assistant-voiced and has no byline/internal date. Its “spheres optional” wording cannot override the direct message that explicitly includes the hypersphere in the original UI conception.

## 4. Glossary and mapping dependencies

| Term | Stable meaning | Missing definition |
|---|---|---|
| UI | Hyperspherical rotation/expansion generator conception | Full state, metric, parameter and integration law |
| Hypersphere | Explicitly part of original UI intent | Whether S³, a family of spheres, or another carrier |
| Radius/expansion | Radial scale integrated with rotation | r(λ), unit convention and evolution law |
| Rotation family | All rotations invoked; two 4D rotations tentatively suggested | SO(4) path, moving plane basis, connection and frame lift |
| Helical integration | Combined rotation/expansion history | Typed trajectory and sweep map |
| Tail | Attached extent whose history sweeps a region | Cross-section K, attachment map and rank conditions |
| P-P | Operator-like equation box | Domain, codomain, action and composition law |
| ᚼ | Standard rotation-expansion state | Units, normalization and exact ratio |
| Δangle×expansion / Δasymmetry / Δbifurcation | Proposed deviation components | Types, units and dependency relations |

```text
Nathan Direct:
  hyperspherical setup + radius/full-unit expansion
  + all-rotation family + helical point history + attached extent
                 |
                 | missing typed state/evolution
                 v
Candidate UI: y(λ)=r(λ)R(λ)x₀
                 |
                 | missing full frame lift/connection
                 v
Sweep: F : I × K → M; image dimension requires rank(dF)
                 |
                 | no source-defined map
                 v
Three-Spheres carrier solver  [separate family]
                 |
                 | no path-dependent transport map
                 v
Hagalaz common interface     [separate family]
```

The [Cross-Formalism Index](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/FORMALISM_INDEX/CROSS_FORMALISM_INDEX_2026-10-10.md) and [UI/Whirligig intake protocol](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/UI_WHIRLIGIG_FULL_CORPUS_INTAKE_PROTOCOL_2026-10-24.md) keep UI, Three Spheres, Hagalaz and Whirligig as related but distinct families. Shared 4D vocabulary does not establish identity or a composable map.

## 5. Existing implementation and formal work

The existing [UI Mapper README](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/SOLVER_HARNESS/UI_MAPPER/README.md) and [Python scaffold](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/SOLVER_HARNESS/UI_MAPPER/ui_mapper_basic.py) are a sandbox, not a full UI/Hagalaz implementation. The code maps a supplied four-coordinate history X(λ) to Euclidean radius r=||X|| and direction u=X/r in S³, then chooses one deterministic minimal-plane representative R with Rx₀=u. It finite-differences that representative to estimate Ω and projects it onto so(4). The README explicitly preserves the remaining SO(3) stabilizer freedom: a direction curve does not determine the full SO(4) frame history. Minkowski calibration and Euclidean R⁴/S³ normalization remain separate; no metric-preserving map is established.

Existing Lean work was reused, not duplicated:

- [PR #1133](https://github.com/Satobloc/HsH/pull/1133), exact head `18a70e4ef0c7291f396803553d510facd5f5777a`, remains OPEN / DRAFT / UNMERGED.
- Exact-head [Actions run #45858790354](https://github.com/Satobloc/HsH/actions/runs/45858790354) succeeded.
- `UIRadialAngularIdentity.four_coordinate_velocity_split` proves the conditional radial/angular speed identity given a unit direction and orthogonal direction derivative.
- `RavelTwoRateSO4SignPairing` proves conditional Euclidean algebra for a block-diagonal two-plane generator.
- `RavelFiberTransportNonuniqueness`, `RavelDirectedSliceChainComposition` and `RavelCurrentSupportIdentifiabilityGate` formalize generic transport non-uniqueness, explicit composition requirements, and domain-dimension versus image-rank distinctions.

These proofs check only their formalized conditional statements. They do not prove that Nathan's UI is SO(4), that the chosen frame lift is physical, that the tail has the required rank, or that UI maps to Three Spheres/Hagalaz. No new Lean module was added because the source maps and state types would have to be invented. No data-free calculation or physical calculation was run.

## 6. Search and operational controls

Mersearch was checked first. All four shared lanes remain occupied: lane 1 Calder angle geometry, lane 2 Ariadne Kirk episode source, lane 3 Calder IRI/worldtube, lane 4 Kestrel finite-core. Lane 2 has a request-specific manifest/compact receipt but is unrelated; lanes 1, 3 and 4 have no request-specific manifest/receipt at the checked paths. No lane was overwritten, released or retriggered. The connected GitHub surface exposed no workflow-dispatch action, so no new Mersearch request could be safely launched. Bounded GitHub fetch/search was used for known HsH/SAT archive sources only; this is not an exhaustive Mersearch result. HSH_RESOURCES front-door guidance was read; no private index or payload was opened or used.

Existing Math Hopper #578 / draft PR #991, the UI Mapper, Whirligig references, PR #1133 and SciSpace availability were checked. Math Hopper is extraction/provenance intake, not a proof engine; its three-repository scan remains unverified. No new tool, fork, dependency, subscription or expenditure.

The read-only [PWH queue](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PRIMARY_WORKFLOW_HEALTH_ACTION_QUEUE_2026-11-13.md) scan leaves WH-05 (Mersearch) highest overall but blocked by controlled lane availability; WH-02 remains the highest-priority unblocked item and Calder-owned. The task graph remains 18 records against 16 declared branches. No queue or graph mutation.

[P0 issue #1747](https://github.com/Satobloc/HsH/issues/1747) remains ACTIVE: presentation safety FAIL; Paper A/B live-route acceptance NOT OBSERVED. The [Three Paper Campaign](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/THREE_PAPER_CAMPAIGN_2026-10-26.md) remains: P1 November 9 overdue / NOT READY; P2 November 30 HOLD; P3 December 14 incomplete. FIE rereview is not due; latest PWH readback gives December 8 as the next target. The unrelated-source break was completed November 26; next due November 28.

No physical calculation, data-free physical fixture, fit, prediction, CODATA scoring, independent measurement, equation correction, manuscript/site edit, BEDROCK promotion, task/graph/queue/worker-pointer mutation or automation change.

## 7. Next deeper cursor

1. Preserve the corrected September 9 raw path and UUIDs above.
2. Recover the exact meaning of full-unit expansion, λ, the rotation-family domain and the P-P/ᚼ operator type.
3. Decide whether the intended object family is a ball family, sphere-boundary family, swept family or composition; do not mix boundaries and filled regions.
4. Specify the full frame lift/connection and stabilizer data, not just a minimal-plane representative.
5. Define K and F:I×K→M; state regularity and rank conditions for the swept dimension.
6. Define curvature/rotation reduction as an explicit projection or quotient with group action, fibers, invariants and composition witnesses.
7. Keep UI, Three Spheres and Hagalaz separate until typed maps exist; only then extend Lean formalization.

**Stop:** no particle labels, physical interpretation, theory promotion or empirical calculation follows from this source cluster alone.