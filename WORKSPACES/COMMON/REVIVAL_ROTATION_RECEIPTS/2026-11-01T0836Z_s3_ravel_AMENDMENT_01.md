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
- Head: `90f091d88620259d0289a986f402ee258c5ee433`
- New module: `FORMAL_VERIFICATION/HsHVerification/RavelCarrierSheetDimensionGate.lean`
- Module blob: `0362d94e13ec19fc0aca24d745da926069103e45`
- Root aggregator blob: `db4d5e73e00c46ae30804d20cf380dbbe805418e`

The module formalizes conditional dimension arithmetic and a generic `SliceCompatibleRetraction` contract. A tube-to-carrier retraction does not automatically induce a map between their timesheet pullbacks; the candidate must supply an explicit `preservesSlice` law and sheet reparameterization. The module does not instantiate a physical bundle or prove that this law holds.

### Lean verification status

- Actions run `41292061092`: CANCELLED before compilation when the later aggregator-registration commit superseded the earlier module-only commit.
- Actions run `41292069239`: IN PROGRESS at the Lake dependency-manifest step at last inspection.
- No successful Lean compile is claimed yet.
- No exact-head standalone build is claimed.
- No `sorry` or `admit` appears in the new source; theorem-level axiom reporting and full CI remain pending.

## Publication and readback

The existing issue #1202 was used; no duplicate issue or publisher artifact was created.

- Additive issue comment: `6555985381`
- Exact comment readback: PASS.
- Supplemental report: `WORKSPACES/RAVEL/2026-11-01T0836Z_CARRIER_CORE_SLICE_DIMENSION_GATE_SUPPLEMENT.md`
- Supplemental report Git blob: `3c08a88a41e4a4157fc3d2bec73a580a25d8b33b`
- Exact file readback: PASS.

The immutable original issue artifact was not rewritten.

## Boundaries

- BEDROCK and STATE_OF_THE_THEORY unchanged.
- No SAT-O or Blockwave equations changed.
- No physical calculation, fit, prediction, or measurement.
- No manuscript, paper gate, Code Grurple, PR #993, or measured-data gate changes.
- No new Mersearch request; existing lane requests and outputs were not overwritten.
- No Orson inbox write, task transfer, or response obligation. The existing context-only handoff remains the only handoff; Orson's protected cognition remit is untouched.
- No automation, task ID, schedule, phase, prompt, or enablement changes.
- No new tool, dependency, branch, or PR.

**Next cursor:** verify Actions run `41292069239`; then update this amendment with the actual checkout SHA, build conclusion, theorem/axiom audit scope, and remaining limits. Resolve whether the later “4D filament” denotes the 1D carrier, its 4D swept worldtube, or a distinct intrinsic 4D support before defining the physical sweep and current-response maps.
