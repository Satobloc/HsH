# Optional context handoff: Mercer :00 → Ravel

- from_run_key: `REVROT3-19-20261011:577:s0`
- to_ring_successor: `Ravel` (index 17)
- nominal_next_run_key: `REVROT3-19-20261011:577:s1`
- sender label: Mercer (nominal ring selection only; no authenticated Mercer ChatGPT instance/thread)
- status: `OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_OWNERSHIP_TRANSFER / NO_RESPONSE_REQUESTED`
- chat delivery: `UNAVAILABLE`; repository inbox is the only delivery route; recipient consumption/acknowledgment is not claimed.
- schedule note: the current Mercer inbox says the `:12` lease remains disabled. Do not enable it or create another task. This packet is queued for Ravel's next actual appearance, not a claim of an immediate :12 run.

## Why this delta exists

This is a bounded source-fidelity crosswalk between historical SAT-O5/O8 filament-scale equations and Nathan Direct's later distinction between coil size, intrinsic filament thickness, 4D filament geometry, and 3D intersectional trace. It is not a new theory claim and does not supersede the already-published dimensional or geometry audits.

## Primary-source anchors

1. `SAT_O5.pdf` is a historical source, not authenticated Nathan Direct. Git blob SHA-1 `a8e09cfb70c96776b715b223d72c6e572356de70`; source PDF SHA-256 recorded in its extraction as `0380aaaee6eaa8a46dca8418ad248219908e94edbf3d97e50a7936c41321010d` (source-recorded, not recomputed here). Archive index last-write: 2025-06-03 08:17:50 local. First extant Git import: 2025-10-27T01:24:42Z. The two archived paths are the same blob.
2. `SAT_O8.txt` is a historical, undated module with `[Author Name]` and blank date placeholders. Git blob SHA-1 `b5147fe08da0a65cb40e73365c71717aaad149ff`; archive index last-write: 2025-06-06 13:40:48 local; first extant Git import: 2025-10-27T01:24:42Z.
3. Nathan Direct, Meridian Free Build, raw blob `7af1561b321f4d9364da5eb111df689efc652827`, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, message `1178f25c-9f92-4d1c-b43b-06482e6bf1b1`, 2026-10-09T07:40:38.859Z: coil-size bounds are not filament thickness; `ell_f` is an ambiguously named first-order coil diameter/radius-like axis-to-circumference scale; stiffness controls coil size; a pictured 3D trace is not the 4D filament itself.
4. Nathan Direct, Reasoning with SAT-HSH Skill, raw blob `b7868607d89f66bbc0e638398182fb2d6b2da2ce`, conversation `6a51def1-1224-83ea-8b56-d9405e694034`, message `ac413920-99c7-40c0-84b8-343fa8b001cc`, 2026-07-12T21:39:03.288Z: if the fabric is BEC worldtubes, multiplicity already exists; straight tubes are the vacuum-like baseline; helicity is proposed to distinguish something beyond that baseline. BEDROCK classifies BEC here as an illustrative working hypothesis, not independently validated physics.
5. Nathan Direct, Meridian Minkowski Ring Analysis, raw blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`, conversation `6ad7e9c0-e8a0-83ea-b76f-6805ece3ee9f`, message `c5525f53-b7cc-4444-8102-3bf6fdb1c892`, 2026-10-21T13:55:40.205Z: preserve `cw=t`, Forest Normalization, and `(++++)`; the adjacent `(c+H0)/2` expression is explicitly tentative.

## Historical equations preserved, not silently repaired

SAT-O5/O8 source equations:

`ell_f^3 = 2 A / T`

`g^(-2) ~ rho_link * ell_f^2`

SAT-O8 additionally states `T ~ c^4/G` and `m_psi^(0) ~ T * ell_f / c^2`.

Dimensional consequences, conditional on conventional SI dimensions:

- `c^4/G` has force dimension. If `T` is force, the cube-root scale requires `A` to have units N·m^3.
- If `A` means conventional beam flexural rigidity `EI` (N·m^2), the cube-root scale requires `T` to be force per length (N/m). But then `T*ell_f/c^2` is mass per length, not mass.
- The mass formula therefore selects force-like `T`, while the ordinary `EI` interpretation selects force-per-length `T`. The source does not define `A` or `T` well enough to resolve this.
- SAT-O5 describes `rho_link` as number of links per unit volume, but `rho_link*ell_f^2` is not dimensionless for a 3D or 4D volume density. It is dimensionless for an areal density. The source does not define the support measure or the projection that would make it areal.

These are conditional unit checks, not numerical physical calculations, CODATA scoring, or measured results. No correction has been selected.

## Geometry map still missing

```text
1D centerline gamma^1 in M^4
    -- requires metric, normal bundle, radius, and no-self-overlap conditions -->
4D finite-core region W^4
    -- explicit time-slice/intersection map -->
3D section W^4 ∩ Sigma_t^3
    -- explicit boundary or selected-support map -->
2D support C_t^2  OR  3D support S_t^3
    -- define density measure -->
rho_link^(2)  OR  rho_link^(3)
    -- define spatial circulation/velocity field on the slice -->
helicity / observable readout
```

The dimensions cannot be collapsed by analogy. A 1D centerline, 2D worldsheet, 3D boundary shell, and 4D full-dimensional core have different intersection dimensions and different Poincare-dual current degrees. The Blockwave `J^{mu nu}` two-form is an assistant-voiced 2D-worldsheet current proposal, not the same object as a 1D filament or a 4D core.

The Blockwave attachment `🧱BLOCKWAVE.txt` has file blob SHA-1 `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; its SHA-256 was not independently re-verified in this pass. Its content authorship is unresolved. The separate assistant message `3039b226-02d4-41a3-a2d3-c338e25204a9` in raw conversation blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`, 2025-10-19T12:31:03Z, supplies the `J^{mu nu}` current and interaction-action reconstruction. Do not attribute that action to Nathan Direct. Its `sqrt(-g)` convention also needs an explicit map before it can be read as the native all-plus `(++++)` convention.

## Existing formalization inspected

- Draft PR #1133, head `d8579403952ca658cf5dd0547e8c181701d18145`, exact-head Lean 4.34.0/Lake 5.0.0 run #41348936553, job #124974692430: SUCCESS, 8,950 build jobs. `RavelFilamentScaleDimensionAudit`, `RavelCarrierSheetDimensionGate`, `RavelFiberTransportNonuniqueness`, and `RavelCarrierSliceReconstruction` compiled. The key dimension theorems and `#eval` checks distinguish force vs force-per-length, volume vs areal density, 1D/2D/3D/4D carrier degrees, and show that a base projection alone does not determine fiber transport.
- This proves only the formalized conditional arithmetic/type statements. It does not prove that the source equations are translated correctly, that the physical core has the assumed dimension, or that the BEC/helicity interpretation is true.
- PR #873 exact-head run #41690832586 failed overall in `KestrelMovingSlice` with unsolved goals and `sorryAx`; do not describe that PR as proof-complete.
- The generic `Nat.sub` expected-dimension helper can collapse a negative expected dimension to zero unless the domain is constrained. Existing issue #1266 already flags this; no code change was made.

## Existing artifacts and publication decision

Related public artifacts already cover the component results: issues #329 and #336 (scale/density dimensions), #1154 (Klein orientation-cover/source distinction), #1281 (finite-core crosswalk), #1323 (core/coil hierarchy), and #1329 (boundary/section/contact dimensions), plus draft PR #1133. No new issue was opened because it would duplicate these artifacts. WWRD climbing-rope mechanics remains FIRST-BLUSH GEOMETRIC HEURISTIC only, not a physical equivalence.

Separate carry-forward: Mira submission issue #1320, submission ID `mira-normal-vs-temporal-direction-20261103t1900z-s0-001`, content SHA-256 `c9b4b314ecaa5010f38092d7092b679043d509bb6bdc3bca6ad6323e7708706c`, remains `SUBMITTED_NOT_VERIFIED`: issue open, no publisher receipt comment, expected artifact not present at last check. Do not duplicate it.

## Next cursor

Recover the original definitions and units of `A`, `T`, and `rho_link` from the earliest source-bearing records; establish whether `rho_link` is a 2D areal measure, 3D spatial-volume measure, or 4D spacetime-volume measure; then specify the actual projection/composition maps from the finite core to the timesheet and to the support on which density and helicity are defined. Preserve alternatives until Nathan Direct source or a real measured system resolves them. No physical calculation without identified data, units, uncertainties, and prediction-vs-fit separation.

## Controls

- Current Code Grurple assignment remains Paper A/B presentation QA. The user-supplied Lane Charter 00 was treated as the scope of this read-only source-fidelity pass; no manuscript, reader route, branch, PR, BEDROCK, paper gate, task, or schedule was changed.
- Main head at preflight: `affcbd6ef948ac88b8c7e1c559b685be18853784`; task graph blob `76b54e6ea2b39de62b027b337d77726470a44aa1`, timestamp 2026-11-03T22:37:50.813492Z, stale relative to current main.
- Mersearch lanes 1-4 were all occupied in `requested` state with no request-scoped manifests or receipts. No new request was submitted. A procedural deviation occurred: GitHub search was used as a locator before the live Mersearch lane check; all primary claims here are based on subsequently inspected raw blobs and exact files, not search snippets.
- No local repo checkout or local Lean/Lake/Elan was available. Math Hopper already exists (`tools/archive_math_hopper.py`, issue #578, draft PR #991); Whirligig is an existing HsH sandbox, not a separate repo. HsH, SAT archive, and HSH_RESOURCES each report zero forks. SciSpace is connected but not needed. No new tool or paid service was introduced; billing/quota was not inspected.
- FIE last full review 2026-10-27; next review due 2026-11-10. Last unrelated reading break remains `SAT Mark V/TheTANGLE.txt`, lines 1161-1200, return cursor 1201; no repeat. Orson's protected cognition work untouched. Paper gates remain Nov 9 / Nov 30 / Dec 14, separate.

## Delivery status

- Ravel inbox append is intended as repository-only optional context.
- ChatGPT-thread delivery: `UNAVAILABLE`.
- Ravel consumption or acknowledgment: `NOT_CLAIMED`.
- No task, ownership, response obligation, or schedule change.