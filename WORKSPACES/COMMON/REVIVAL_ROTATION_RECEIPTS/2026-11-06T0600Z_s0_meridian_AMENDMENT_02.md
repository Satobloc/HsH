# Meridian h630:s0 — Amendment 02
## Graticule ↔ 4D filament cross-scale geometry fidelity

**Amends:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-06T0600Z_s0_meridian.md`  
**Preserves:** the base receipt and Amendment 01 unchanged.  
**Scope:** primary-source geometry, type fidelity, and missing-map identification only. No theory promotion, physical calculation, CODATA scoring, or new solver/tooling.

## 1. New finding

The September Gendarme Graticule work and the October 4D-filament clarification describe different levels of the geometry. The historical assistant's standard torus construction is a two-parameter surface embedded in 3D. The later direct source describes a 3D intersectional trace associated with a 4D filament and explicitly warns against assuming that the 3D trace self-closes.

The 3D torus surface can therefore be retained as a **candidate local trace, cross-section, or display geometry**. It cannot be silently identified with the 4D filament or with the complete 3D intersectional trace. The map that would justify any of those identifications is absent.

This narrows the base receipt's open cursor, “global-carrier to local-Graticule cross-section/embedding map,” into two distinct missing transformations:
1. the source-defined 4D object to 3D trace/slice operation; and
2. the 3D trace to the 2D Graticule domain/peer-solver operation.

The missing maps are not interchangeable with the already specified left/right display reflection.

## 2. Primary source cluster read

### Gendarme Graticule — September 4–8, 2026

Conversation: `6a9aa91b-11f4-83ea-80a1-4d502522e441`.

- Base raw snapshot: `d21e251df093013903cc19789ded562f83b6e6ea` (343 mapping nodes).
- Expanded raw snapshot: `1f841895a2585843373fe33d55a0180c91cc8423` (706 mapping nodes). The earlier #1390 source audit checked relevant shared message IDs, roles, timestamps, and content across the two snapshots. They are snapshot witnesses, not independent corroboration.

Relevant user-role source turns:

- `27f949c9-f0d4-452c-bed3-d3b3f0608b70`, 2026-09-04T12:49:03.435Z, and `a66284fc-11bf-441d-a0c6-d9c2d3cb2600`, 13:17:54.764Z: tentatively describe a global θ₄ ground state as 90° with respect to time or 0° with respect to time propagation; identify the ordinary embedded donut torus; describe position-dependent null trajectories tangent to the large circumference and complementary small-circumference paths.
- `dd2d0663-03f6-45ee-aae2-b4e792b02d06`, 13:44:08.651Z: defines the Gendarme grid from two axes in a small cross-section, four quadrants, and a central primary-circumference tangent direction that doubles the local sectors to eight; asks for two overlapping parities and both straight and torus-proper tangent references.
- `fd780628-bf2d-4791-9646-e551c3fa5a91`, 13:52:22.306Z: explicitly rejects adding an independent parameter; the relationships are to be defined by angles and torus elements.
- `b2f97b0c-21ab-49ad-a0a4-4871e6503765`, 15:19:45.111Z: distinguishes inner/outer torus side from left/right; distinguishes straight tangent from the torus-circumference tangent; introduces prograde/retrograde and chirality as relational descriptors.
- `bfac52b1-98d1-4caa-bf18-d9b513584a2f`, 15:29:58.273Z: chooses 90° as the local null reference, identified with the primary-circumference tangent.
- `e380f83e-ba07-4889-8394-e898a95d448b`, 15:50:24.133Z: corrects the earlier cancellation intuition: the two Graticulae do not cancel.
- `71ae32d1-1de0-45a0-83d6-11a58d7a7c31`, 16:38:16.684Z: specifies ordinary/inverse Graticulae as a precise left/right display reflection.
- `7a99e50b-d6c8-4d27-b3fc-a7fcca03c11f`, 17:20:36.687Z: requests a genuine 3D torus calculation, primary-circumference tangent, reference vector, integration around the relevant symmetry, and a spherical-graticule comparison.
- `054d1aea-cf67-4154-93c8-e302dc3ce1ea`, 2026-09-08T02:45:59.163Z: directly identifies the Graticule as a peer geometric solver, not merely a visualization.

### Meridian Free Build — October 7–10, 2026

Conversation: `6ac45d1f-17b0-83ea-ad1f-fa524602378b`; raw blob `7af1561b321f4d9364da5eb111df689efc652827`.

- `1d284b55-d7be-45f7-92a6-15e4734347c8`, 2026-10-07T06:12:30.134Z: describes angular rotation (“torsion”) of the time normal as a result of interaction with matter.
- `3c657387-b80b-4982-a61a-8e6d8568b8d1`, 2026-10-09T01:50:55.112Z: identifies Newtonian-limit worldtube bending with inertia; uses the earlier literal `w=ct` coordinate convention.
- `5a929b5e-515e-4f77-a32a-e49feef42812`, 02:46:38.173Z: directly clarifies that inertia and worldtube bending are equivalent descriptions of the same system, not a finer-scale spring/substructure explanation. The message contains quoted assistant text; only the user's correction is treated as direct.
- `28b2378a-846d-4c3f-a242-91f9007ce261`, 07:39:31.044Z: distinguishes a 3D intersectional trace from a second-order 4D filament and warns against assuming the trace must self-close.
- `1178f25c-9f92-4d1c-b43b-06482e6bf1b1`, 07:40:38.859Z: closely related follow-up; not counted as independent corroboration.

### Meridian Minkowski Ring Analysis — October 20–21, 2026

Conversation: `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`; raw blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`.

- `0862c00a-d8f5-42e9-a876-3af4e5254046`, 2026-10-21T07:31:09.576Z: places the Big Bang at the inner longitudinal circumference of the proposed donut, not at the center of the present slice.
- `c5525f53-b7cc-4444-8102-3bf6fdb1c892`, 13:55:40.205Z: gives the literal `cw=t` notation, Forest Normalization, and positive `(++++)` native metric convention.
- `59cdedb4-be76-455a-87c8-a6089de951b3`, 23:53:03.096Z: states that 3D rotation is 4D curvature and that 3D acceleration is included in that description. The assistant's immediate correction usefully narrows “curvature” to bending of physical history/worldtube, not automatically ambient Riemann curvature.

## 3. Historical SAT geometry and equation boundary

The original SAT archive was checked directly:

| Source | Blob SHA-1 | Source date / attribution |
|---|---|---|
| `SATOBLOC/SAT O1 4D.txt` | `7577aa1ee5a6c3850ce3b226c75377de6367aedc` | No internal date or author line; first extant repository commit was recorded as 2025-10-27T00:40:28Z in the prior source receipt. |
| `SAT 4D Theory Work/SAT4D_4.txt` | `efc88f4523b2fd616e64898737c2aa45e5f39b9a` | Internally dated July 2025; author line “SATO.4D Coherence Project.” |
| `SAT 4D Theory Work/SAT4D_6.txt` | `167136310cdf33ca8f986f33634692314c1a0946` | Internally dated July 2025; no author line. |

Verbatim SAT-O1 source equations remain:

[
\gamma^\mu(\lambda)=
(\lambda,
A_x\sin(k_x\lambda+\phi_x),
A_y\sin(k_y\lambda+\phi_y),
A_z\sin(k_z\lambda+\phi_z)).
]

[
L=\frac12 m v^\mu v_\mu - V_{\mathrm{tension}}(\gamma).
]

SAT-O1 calls γ a one-dimensional filament in four-dimensional spacetime and describes its worldtube in prose as the four-dimensional volume swept out by the vibrating filament. It does not provide the family/thickening map that constructs that volume.

SAT4D_4 defines Σ_t as a propagating three-dimensional wavefront, u^μ as its local time-flow normal, and θ₄ as the angle between v^μ and u^μ. The 2026 Graticule's “90° with respect to time / 0° with respect to time propagation” wording may be compatible with a zero-angle-to-propagation convention, but the reference-direction map must be explicit.

No SAT-O1 or Blockwave equation was corrected, rewritten, or merged in this amendment. The separate Blockwave J^{μν} source remains as recorded in the base receipt.

## 4. Geometry bracketed: source objects before their mathematics

The best source-supported hierarchy is:

1. **SAT-O1 filament γ:** a one-dimensional curve in a four-dimensional arena in the 2025 source.
2. **SAT-O1 worldtube:** described as a four-dimensional volume swept by the vibrating filament; the construction map is absent.
3. **2026 4D filament / worldtube language:** a later source generation that describes a 3D intersectional trace and explicitly rejects an assumption of 3D self-closure. Its exact intrinsic type is not settled by the quoted messages.
4. **3D intersectional trace / time bulk:** a direct 2026 descriptive object, but the operation “intersection” versus “projection” and its support dimension are not fully specified.
5. **Embedded ring-torus surface:** the assistant's f7a40 construction uses a two-parameter surface embedded in R³. That is a 2D surface, not by itself a 3D volume or a 4D filament.
6. **Gendarme Graticule:** a 2D small-cross-section domain with two transverse axes and a primary-circumference tangent orientation that doubles the local sectors to eight. It is also directly assigned a peer-solver role.
7. **Ordinary / inverse display:** a left/right reflection. This is a display relation, not physical cancellation.

### Mapping diagram

```
SAT-O1 1D filament
       |
       | missing family / thickening map
       v
4D worldtube (prose-defined volume)
       |
       | missing 4D-to-3D slice / intersection / projection map
       v
2026 3D intersectional trace / time bulk
       |
       | missing 3D-to-2D cross-section / embedding map
       v
2D Gendarme Graticule domain
       |
       | conditional left/right display reflection
       v
ordinary / inverse Graticule display
```

The assistant's standard 3D torus surface can occupy a candidate intermediate representation, but no source-defined map currently places it uniquely at the “trace” or “cross-section” level. The Graticule's solver operation must also be specified separately from its display operation.

## 5. Discrepancy ledger

| ID | Historical translation or possible conflation | Source-fidelity status |
|---|---|---|
| X1 | Assistant's 2D-parameterized torus surface treated as the 4D filament or complete 3D trace | Not established; missing type-changing maps |
| X2 | SAT-O1 1D γ, its prose-defined 4D worldtube, and the later 2026 “4D filament” treated as one unchanged object | Distinct source generations; construction and identity map unresolved |
| X3 | 3D trace treated as necessarily closed because the assistant's ring-torus surface is closed | Direct 2026 source explicitly warns against assuming 3D self-closure |
| X4 | Graticule treated only as a display | Direct user instruction assigns it a peer geometric-solver role |
| X5 | Local primary-circumference tangent identified with the global time normal without a reference-frame map | Potentially compatible angle conventions, not an established identity |
| X6 | Global Graticule θ₄ merged with the live `LOCAL:TRISWALE:θ₄` registry entry | Namespace collision; registry explicitly warns about angle-from-axis / angle-from-plane complements |
| X7 | Local inner/outer torus sides identified with the global inner longitudinal circumference | Shared vocabulary only; no map recovered |
| X8 | Time-normal torsion, worldtube-history curvature, and ambient Riemann curvature treated as one quantity | Keep separate. The assistant's D_s(time-normal) expression is a proposal requiring a declared connection and path, not a Nathan equation |
| X9 | Earlier `w=ct` silently substituted for later literal `cw=t` | Unresolved source notation; preserve both with dates and do not normalize by guess |

The local tangent/parity/Clairaut distinction, exact left/right display mirror, non-cancellation correction, and full f7a40 assistant span are already documented in #1322 and #1390. This amendment does not repeat or replace those findings. Existing Kestrel/Ravel/Ariadne worldtube reports likewise already cover the 4D-filament/3D-trace and curvature-type distinctions; the new contribution here is their explicit connection to the Graticule's local solver geometry.

## 6. Formalization and epistemic status

**FORMALIZATION_BLOCKED_DEFINITION** for the new cross-scale chain.

A generic set intersection theorem would be tautological here. The source does not yet specify:
- the exact four-dimensional source object and its intrinsic support dimension;
- the time function / 3D slice and whether the operation is intersection, projection, or finite-core overlap;
- the embedding and cross-section that produces the Graticule domain;
- the metric and orientation used to map the primary-circumference tangent to the time-normal reference;
- the solver operation on the Graticule domain and the condition under which it agrees with the 3D construction.

The conditional left/right involution and even/odd display decomposition already have a formalization target in #1322/#1390; they were not duplicated. Existing Lean PRs #873 and #895 remain separate workstreams. The local environment has no `lean`, `lake`, or `elan`; no new branch, PR, CI dispatch, or tool was authorized under the active Code Grurple P0 interlock. No Lean compile/run is claimed.

No physical system, dataset, provenance package, units, uncertainties, or prediction/fit split was supplied. No physical calculation, CODATA scoring, observational validation, or Factory Floor admission was performed.

## 7. Operational closeout and next cursor

- Deterministic selection: h=630, seq=3150, Meridian; next ring label Mercer.
- HsH default branch was `main`; pre-write head observed: `7afc53f540d289dfecef573631aa824e022db23d`. No research branch was created or switched.
- Task graph remains `branch_count=16` against 18 branch records; Tern owns reconciliation. No graph edit.
- Meridian's active assignment remains Code Grurple Paper A accepted-R1 presentation support only; P2/Whirligig remains HOLD. No manuscript, feed, site, or task edit.
- All four Mersearch lanes remain occupied; no request was overwritten or created. Raw-source retrieval was a bounded Git-blob fallback, not a completed Mersearch run.
- Tool Chest / Toolkit Digestion, Math Hopper, existing Lean PRs, Whirligig status, and connected SciSpace availability were checked. Math Hopper remains extraction/navigation rather than a Lean runner. No new tooling or paid service.
- Last unrelated-reading break was recorded in the h622:s2 Meridian receipt; the next cursor remains TheTANGLE line 1281. The one-per-five-activation target is not yet due. FIE rereview is due November 10, not this run.
- Big Push interactive heartbeat remains under the 36-hour stale threshold; no queued Big Push operation was taken.
- Existing h630:s1 handoff to Mercer is already present and parked; the :12 lease remains disabled. No duplicate handoff.
- Current scheduler run remains in progress with `chat_ref=null`; no authenticated Meridian thread, recipient acknowledgment, or cross-thread delivery is claimed.
- Task ID `6aa1fe0de5e48191b886496095b1343f`, exact hourly :00 schedule, and phase were preserved. No sixth task, task/ID/cadence change, signet, or conversation rename.

**Next deeper cursor:** recover the source-defined 4D filament/worldtube type; specify the 4D-to-3D trace/slice map; specify the 3D-to-2D Graticule cross-section and peer-solver operation; then reconcile the primary-circumference tangent, time normal, and source-qualified θ₄ conventions. Only after those maps exist is a source-faithful Lean theorem identifiable.
