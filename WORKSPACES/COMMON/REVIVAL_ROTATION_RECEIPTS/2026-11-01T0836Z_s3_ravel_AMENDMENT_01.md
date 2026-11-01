# Ravel :36 receipt amendment 01 — carrier/core/slice dimensional gate

**Run key:** `REVROT3-19-20261011:512:s3`  
**Selected identity:** Ravel (17)  
**Successor:** Orson Vay (18)  
**Classification:** ADDITIVE SAME-SLOT AMENDMENT; NO DUPLICATE PRIMARY RECEIPT.

## New substantive result

A source-first comparison now separates:
1. The July 2025 SAT.O 1D filament in a 4D ambient manifold with a 3D wavefront (unbylined source, raw blob `167136310cdf33ca8f986f33634692314c1a0946`).
2. The June 2025 SAT4D draft's 1D curve and separately defined 4D worldtube volume swept by the vibrating filament (document-level Nathan McKnight byline, AI assistance acknowledged, raw text-extraction blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`).
3. Nathan Direct's later 2026 “4D filament” / 3D intersectional-trace wording and the separate helical-core, hollow-outer-winding, and interacting-timesheet statements (raw conversation blob `7af1561b321f4d9364da5eb111df689efc652827`).

The 2024 line/plane construction remains explicitly heuristic (raw conversation blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`).

For a 4D ambient and 3D timesheet, conditional standard dimension arithmetic gives:
- 1D carrier: normal-complement rank 3; transverse carrier/timesheet intersection 0D.
- Full 4D tube region: transverse tube/timesheet intersection 3D.
- General k-dimensional carrier: normal-complement rank (4-k); expected transverse carrier/timesheet intersection (k-1), for (1\leq k\leq4).
- Intrinsic 4D carrier in the same 4D ambient: normal-complement rank 0; no nontrivial ordinary normal thickening in that ambient.

A normal-bundle tube is one candidate construction, not source-established. The SAT4D draft says “swept by the vibrating filament” but does not define the sweep map. Twist, contact surfaces, a specific normal radius, and a physical current law are not forced by dimension counting. `epsilon`, `ell_f`, and the worldtube axis-to-circumference dimension remain distinct. A second-order core remains rejected by Nathan Direct.

## Formalization

Existing PR #1133 was extended on its existing branch; no new PR or branch was created.

- Branch: `research/ravel-carrier-slice-reconstruction-20261031t0212z`
- Head after proof repair: `10099fa9b9a8175269405bd77e71e0803143f645`
- New module: `FORMAL_VERIFICATION/HsHVerification/RavelCarrierSheetDimensionGate.lean`
- Module blob after proof repair: `69c15e6dd9c7e4cb067e0706997f0b3a770b9ec4`
- Root aggregator blob: `db4d5e73e00c46ae30804d20cf380dbbe805418e`

The module formalizes conditional dimension arithmetic and a generic `SliceCompatibleRetraction` contract. A tube-to-carrier retraction does not automatically induce a map between their timesheet pullbacks; the candidate must supply an explicit `preservesSlice` law and sheet reparameterization. The module does not instantiate a physical bundle or prove that this law holds.

### Lean verification status

- Actions run `41292061092`: CANCELLED before compilation when the aggregator-registration commit superseded the module-only commit.
- Actions run `41292069239`: FAILED at the generic dimension lemma because `omega` did not unfold the expected-intersection definition. The `#eval` table executed; the new module target failed.
- Corrected proof: explicitly `change k + 3 - 4 = k - 1` before `omega`; theorem-specific `#print axioms` commands were added.
- Corrected Actions run `41292451762`, job `124806308038`: **SUCCESS**, full `lake build` of 8,946 jobs under Lean 4.34.0 / Lake 5.0.0.
- Actual checkout: merge commit `81da81cf87218b1ab5c2666b55c896af1781444e`, merging PR head `10099fa9b9a8175269405bd77e71e0803143f645` into base `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Module blob `69c15e6dd9c7e4cb067e0706997f0b3a770b9ec4` and root aggregator blob `db4d5e73e00c46ae30804d20cf380dbbe805418e` matched exactly between PR head and merge ref.
- `#eval` output: `[(3, 0), (2, 1), (1, 2), (0, 3)]`.
- `#print axioms`: `carrierSliceDimension_eq_k_minus_one` depends on standard `propext` and `Quot.sound`; `positiveNormalRank_implies_carrier_lt_four` depends on `propext`; concrete dimension results and `inducedMap_commutingWitness` report no axioms.
- Full decoded job log: 0 `sorryAx`, 0 `admit`.
- Tests, lint, nanoda, and the separate automated axiom-audit action were skipped. The theorem-specific `#print axioms` commands did run.
- Classification: `MERGE_REF_BUILD_SUCCESS / EXACT_PR_HEAD_STANDALONE_NOT_RUN`. Lean checks only the formalized conditional statements, not source-translation soundness, physical premises, transversality, normal-bundle existence, or the physical current response.



## Additional Nathan Direct source refinement

The September 7 Ravel raw-user-verified source explicitly corrects the Kerr cross-section dimensionality: use a spatial Kerr section extended along the filament, not the full 4D Kerr spacetime as the cross-section of another 4D object. This yields a candidate 1D-filament base with a 3D spatial Kerr fiber and a 4D worldtube total space, conditional on a locally trivial bundle/embedding. The exact bundle projection, fiber transport, and ambient embedding remain unspecified. The source also says force is primitive and filament/timesheet must mutually accommodate it; the eventual response law must therefore be coupled, not a passive projection. Rest mass is associated only with persistent coil. The later f-boson/t-boson grammar remains provisional.

## Publication and readback

The existing issue #1202 was used; no duplicate issue or publisher artifact was created.

- Additive issue comment: `6555985381`
- Exact comment readback: PASS.
- Supplemental report: `WORKSPACES/RAVEL/2026-11-01T0836Z_CARRIER_CORE_SLICE_DIMENSION_GATE_SUPPLEMENT.md`
- Supplemental report Git blob after final source/CI update: `e13c440102fc15dd8da19a6b4c83e4032a2eab8d`
- Exact file readback: PASS.

The immutable original issue artifact was not rewritten.


### Final publication verification

- Initial dimensional-gate issue comment: `6555985381`, exact readback PASS.
- CI-failure correction comment: `6556011007`, exact readback PASS.
- Successful-build/source refinement comment: `6556057573`, readback PASS.
- PR #1133 proof-failure correction: `6556011980`, readback PASS.
- PR #1133 successful-build/source refinement: `6556057876`, readback PASS.
- Existing issue #1202 and PR #1133 were used; no duplicate issue, publisher artifact, or PR was created.

## Boundaries

- BEDROCK and STATE_OF_THE_THEORY unchanged.
- No SAT-O or Blockwave equations changed.
- No physical calculation, fit, prediction, or measurement.
- No manuscript, paper gate, Code Grurple, PR #993, or measured-data gate changes.
- No new Mersearch request; existing lane requests and outputs were not overwritten.
- No Orson inbox write, task transfer, or response obligation. The existing context-only handoff remains the only handoff; Orson's protected cognition remit is untouched.
- No automation, task ID, schedule, phase, prompt, or enablement changes.
- No new tool, dependency, branch, or PR.

**Next cursor:** resolve whether the later “4D filament” denotes the 1D carrier, its 4D swept worldtube, or a distinct intrinsic 4D support. Recover the exact spatial Kerr section and define the candidate 1D-base/3D-fiber bundle, its projection, fiber transport, and ambient embedding. Then prove or reject the slice-preserving retraction and source the coupled force/filament/timesheet response (R_t). Only after those maps are fixed should the existing measured helion holdout be reconsidered with complete cross-section covariance and normalization. No physical calculation or prediction before that gate.
