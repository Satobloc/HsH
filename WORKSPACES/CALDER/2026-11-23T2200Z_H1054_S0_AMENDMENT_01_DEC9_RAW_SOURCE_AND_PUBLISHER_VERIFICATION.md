# H1054:s0 Amendment 01 — December 2025 raw source and publisher verification

**Additive only.** The original H1054 report and its published artifact remain unchanged.

## Publisher reconciliation

The original report is now **PUBLISHED_VERIFIED**.

- Existing publisher issue: [#2453](https://github.com/Satobloc/HsH/issues/2453).
- Publisher confirmation: [comment #7115739051](https://github.com/Satobloc/HsH/issues/2453#issuecomment-7115739051).
- Publisher-confirmed SHA-256: `f5fb4299fb1df91b07ff15bb08ff23f908e2a9d816638cae460b52ad3c64131b`.
- Workspace and published artifact share Git blob SHA-1 `e9aaf059b02dba0429be4e98e32c7179c2d7ae88`, 22,589 UTF-8 bytes.
- The publisher issue body's `content` field exactly matched the workspace report.
- Published artifact: [H1054 report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/calder-h1054-s0-marble-bosonic-timewave-geometry-fidelity-20261123t2200z-001.md).

The original receipt's `SUBMITTED_NOT_VERIFIED` state is superseded. No retry, duplicate issue, or replacement artifact was created.

## Existing Mersearch result reused

The H1054 next cursor asked for raw role-verified time-field / finite-slab source. An already completed Morrow result was reused, not rerun:

- Request: `morrow-finite-slab-originals-20261103-0524`.
- Status: `RESULTS_PRESENT / COMPACT_RECEIPT_VERIFIED / FULL_RESULTS_WITHHELD`.
- Audit: [Morrow source coverage and dedup audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MORROW/2026-11-03T2036Z_MERSEARCH_SOURCE_COVERAGE_AND_DEDUP_AUDIT.md).
- Raw conversation: `SAT theory clarification`; conversation ID `69378c7f-6320-8325-9e10-83e42fe1433c`.
- Raw Git blob SHA-1: `507a7000082415373ee98dbc95f18a991dff3c5a`; 996 mapping nodes.
- HsH and SAT archive copies are byte-identical mirrors of one source, not independent witnesses.

No new Mersearch action was available or invoked. The four current shared request lanes were not modified.

## Nathan Direct geometry recovered

The raw 2025-12-09 source contains these relevant direct user messages:

| Message ID | UTC timestamp | Proposition |
|---|---|---|
| `d13c1409-87c4-4fc2-a0aa-7c670d95f7be` | 03:33:24.524 | Time-slice as field; proposed energy exchange with particle trajectories |
| `05c717ab-5f2f-4fc3-bfa9-437b28f14a91` | 03:37:21.551 | Propagating time-field with finite temporal thickness; trajectory change across the slab |
| `75d25e2b-923b-4db2-b56f-202895213fc9` | 04:16:50.676 | Intersection angle proposed as interaction descriptor |
| `9561f902-e3cb-43d5-93e1-cdffab706a1f` | 04:18:16 | Angle explicitly marked as the difficult, unresolved part |
| `946f19e0-66af-405a-b7d0-72043f5407c9` | 04:29:40 | Further correspondences proposed, not derived |
| `07e8d0d0-5790-4f61-98b5-6af71acc7d8c` | 04:35:56.748 | Asks whether local allocation between time-field distortion and particle-wave evolution can convert while preserving global behavior |
| `e0adb9f3-47c4-45cb-b17c-f9ca72a4481e` | 05:09:22.838 | Describes the account as descriptive / retrodictive, not predictive |
| `cc23d323-1e0c-48ff-ba55-ba13196f0c63` | 05:13:22.529 | Says the developed picture grew through retrodictive steps from the original 4D particle-vector map |

These direct messages do not define a complete metric, field equation, constitutive law, or local-to-global map.

## Historical assistant discrepancy

The direct message `07e8d0d0` is a question about possible convertibility, not an assertion of equivalence. Its direct assistant child `63d479f5-e0ef-4dff-8cd5-2c021bba1d65` (04:35:57.096Z) adds “continuous freedom” and asserts equivalence / preserved global behavior without a parameter space, conversion map, evolution-intertwining condition, or invariant observable. “Continuous” is assistant-added, not Nathan Direct.

The 2025 finite-thickness slab, later 3D timesheet, and 2026 timewavefront remain distinct objects until a typed map is defined. The December source does not define the later propagation vector `w`, a foliation, thickness coordinate, or slab-to-timesheet projection.

## Existing Lean work and limits

No new Lean module was added. Existing conditional results were reused:

- [PR #873](https://github.com/Satobloc/HsH/pull/873), exact-head run [#42955799035](https://github.com/Satobloc/HsH/actions/runs/42955799035), head `8f49c39c8428e3d0195a8d6abd3d613aa786de4d`: `KestrelMovingSlice` and `KestrelProjectedIncidence` compiled.
- [PR #1133](https://github.com/Satobloc/HsH/pull/1133), historical exact-head run [#43109180575](https://github.com/Satobloc/HsH/actions/runs/43109180575), head `19479ee3fad0e96c4f0ddb4f79842f4a5ab9bb61`: carrier-sheet dimension and slice reconstruction modules compiled. Its axiom log also contains `Real.ofCauchy (sorry ...)` in another module, and `nanoda-allow-sorry: true`; no repository-wide no-sorry claim.
- [PR #1594](https://github.com/Satobloc/HsH/pull/1594), exact-head run [#43006069897](https://github.com/Satobloc/HsH/actions/runs/43006069897), head `136071f6b0665d28a4a77611712a53aeca74fe8c`: sweep-boundary and helix-slice modules compiled.
- PR #1133's current representation-conversion module has a successful merge-reference run [#44920965461](https://github.com/Satobloc/HsH/actions/runs/44920965461); exact-head verification of current head `8b6b19421327164f6c966be5cab3c58e7f9c0314` remains unverified. Its theorem requires evolution intertwining and observable naturality.

These builds check only their formalized statements, not source translation, physical maps, or physical premises. No observational validation is claimed.

## Source stratigraphy and unresolved origin

`NEOSAT 2025.txt` is explicitly a NotebookLM output naming `SAT_DEC2025.txt` as its source, not an independent raw conversation. The Morrow audit found 25/30 relevant direct-message bodies in `SAT_DEC2025.txt`, 12/30 in `NEOSAT 2025.txt`, and five absent from both text witnesses.

The recovered December source supports the time-field / finite-slab / intersection-angle proposal. It does not by itself authenticate the explicit “time is a boson” identity or “Temporon” name. No raw role-tagged summer 2025 message for that formulation has been recovered. December 9, 2025 is the earliest verified raw evidence currently in hand for this cluster, **not** evidence of a summer 2025 origin.

## Controls and next cursor

No physical calculation, synthetic fixture, measured-system fit, prediction, CODATA scoring, paper-gate advancement, or theory promotion. P0 remains ACTIVE; P1 OVERDUE / NOT READY / FROZEN / ORSON-OWNED; P2 November 30 HOLD; P3 December 14 INCOMPLETE. No task/ID/schedule/phase/cadence change, no sixth task, no signet, no chat rename, no new handoff, and no cross-thread delivery claim.

**Next cursor:** recover a raw, role-tagged summer 2025 conversation containing the explicit “time is a boson” / “Temporon” formulation. Until then, keep that attribution unverified. The December 9 raw-source recovery is complete and must not be repeated.
