# Sable h551 | Line-with-thickness and October 29 source-boundary correction

**Nominal slot:** 2026-11-02 23:00Z  
**Run key:** `REVROT3-19-20261011:551:s0`  
**Selection:** Sable (index 0); next ring label Loom (index 1).  
**Status:** SOURCE-FIDELITY DELTA; `SOURCE_RECOVERY_BLOCKED` for the raw 2026-10-29 conversation. No physical validation, CODATA scoring, manuscript-gate change, or BEDROCK promotion.

## Executive finding

The 2026-10-29 “4D/3D slice clarification” is **not** a recovered finite-core geometry definition.

Prior-context retrieval recovered a short user statement distinguishing a four-dimensional universe from a three-dimensional time slice. It did not recover a direct definition of a finite-core worldtube, cross-section, normal bundle, or intersection map. The accompanying file `WORKSPACES/COMMON/2026-10-29_NATHAN_DIRECT_4D_3D_SLICE_CLARIFICATION.md` adds assistant-authored notation and geometry (`W⁴`, `Σ³`, `W⁴∩Σ³`, optional 2D support). Those additions must not be attributed to Nathan Direct.

The raw originating conversation title, conversation ID, message UUID, parent, and role graph remain unavailable. The correct status is `SOURCE_RECOVERY_BLOCKED` for the raw October 29 source. This corrects the previous Sable cursor “recover the October 29 finite-core clarification”: no such direct finite-core definition was recovered.

This is an additive provenance correction, not a repeat of Sable’s support-degree audit or Kestrel’s November 2 one-core/SAT-O/Blockwave crosswalk.

## 1. Historical Sable authority and continuity

The direct September 22 instruction is user message `d3976dcf-c5dc-49c7-a523-e6469f4910db` in archived conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1` (“Revival Rotation”), raw blob `3bf173c217e0755419152aa2225f39713929a5fe`, timestamp 2026-09-22 04:03:52.997Z. It asks for “big bites” using the exact typed spelling `seive` and `Mersearch/Mercer_Searcher` for bulk triage and characterization. The separate `SABLE Revival Rotation` source contains direct September 14–15 instructions on system analysis, source quality, workflow/automation, knowledge-base work, and scripting. The broader consolidated remit in the current Sable README is workspace synthesis, not a verbatim charter.

No authenticated current Sable ChatGPT thread was recovered. The scheduled run has no authenticated `chat_ref`; the historical Sable conversations are archive sources, not proof of current-thread continuity. This is a source-grounded revival, not impersonation.

## 2. Primary-source cluster

| Source | Raw conversation / blob | User-role evidence |
|---|---|---|
| SAT Overview, 2026-06-23 | `6a3a279a-10cc-83ea-9abf-4fc1dab9fb55` / `023ff77688672546aeff02deb3745289f6709c90` | `28895d46…` describes one 4D Nth-order superhelix; scale-factor placement unresolved. `025057e3…` says “Finding the Donut” is the original formulation and the others are attempts to make it work. |
| Reasoning with SAT-HSH Skill, 2026-07-11 | `6a51def1-1224-83ea-8b56-d9405e694034` / `b7868607d89f66bbc0e638398182fb2d6b2da2ce` | `f8e3ca00…` describes one ER bridge as a line with thickness, “still a line, not a field.” `e568ef81…` describes a generalized superhelical core in a responsive medium with scale-dependent variability. |
| Ravel Syncmathcek, 2026-09-06/07 | `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f` / `c49367b0faa424491e7b3520a034b9e44fe6897f` | `a63b981d…` describes the filament as the totality of a 4D particle history. `496a15ea…` distinguishes the 3D diagram, full 4D bulk, and 4D view with 3D slice. `b9805319…` gives a historical force-primitive/mutual-accommodation description, later superseded. |
| Meridian Free Build, 2026-10-09 | `6ac45d1f-17b0-83ea-ad1f-fa524602378b` / `7af1561b321f4d9364da5eb111df689efc652827` | `6f00a97a…`: no separate carrier, one helical core, outer coil hollow. `28b2378a…`: 3D pattern is an intersectional trace of a second-order 4D filament/coil, not the filament itself. `1178f25c…`: ~0.7 fm is coil-scale, not filament thickness; `ℓ_f` is misnamed and no replacement diameter symbol is selected. |
| Meridian Free Build, same source | same conversation/blob | `5a929b5e…`: time slice is an active 3D bulk, not a passive readout. `3c657387…`: `w=ct` is stated as a time-length coordinate and worldtube bending is described as the geometric description of inertia at the classical limit. |
| Meridian Minkowski Ring Analysis, 2026-10-21 | `6ad7e9c0-e8a0-83e9-984e-94d020de3abf` / `56a84cb85d5c386efa4ea11d322d11e95e2c7703` | `090f5160…` says “back-hallway” corridors are metaphorical, not physical tunnels, and the older reciprocal filament/timesheet-deformation model is no longer current since the Klein Fabric model became common. Only the final user-added correction is attributed; the rest is pasted assistant material. |

The July 11 assistant had proposed a 1+1D field `X(τ,s)` and Cosserat-rod/field action. The direct correction rejects treating the fundamental object as a field. The October 9 assistant expression `X(s)=C(s)+a[cos φ(s)N(s)+sin φ(s)B(s)]` adds a separate carrier curve, directly contrary to the user’s “no carrier” correction. The later Euclidean lifted curve in PR #1245 is a different mathematical object, not the direct finite-core geometry.

## 3. October 29 source boundary

Prior-context retrieval recovered these user statements and timestamps, but not the originating raw export:

- 06:46:50Z: no graviton per se; the timesheet/wavesheet is primary; a soliton on it might be a graviton. The retrieved wording preserves the spelling “waferont.”
- 06:55:22Z: SAT.O is about 1.5 years old and not necessarily current.
- 07:17:34Z: the universe is four-dimensional and the time slice is three-dimensional.
- 07:20:19Z: a request to search for missing connections.

No conversation title, conversation ID, message UUID, parent, or role graph was recovered. None of these statements defines a finite-core worldtube or its cross-section.

Correct classification:

- `DIRECT_WORDING`: prior-context retrieved, raw locator missing.
- `W⁴`, `Σ³`, `W⁴∩Σ³`, `S¹×S²`, `S¹×S¹`: assistant reconstruction in the October 29 note.
- `FINITE_CORE_DEFINITION_FROM_2026-10-29`: not recovered.
- `RAW_2026-10-29_SOURCE`: `SOURCE_RECOVERY_BLOCKED`.

The graviton/timesheet statement is a separate ontology note, not a finite-core geometry definition.

## 4. Glossary and mapping diagram

| Term | Best-supported meaning | Status |
|---|---|---|
| 4D Nth-order superhelix | Preferred simple construction; scale-factor placement and coupling remain open | Direct proposal |
| Filament | Totality of a particle’s 4D history; may deform/oscillate | Direct description; support dimension unresolved |
| Centerline/worldline `γ¹` | 1D parameterized curve in 4D spacetime | Assistant/standard representation; not automatically the full filament |
| Kerr core | Only finite core in the October 9 description | Direct qualitative description; cross-section/normal rank undefined |
| Outer coil | Hollow; coil itself is the filament, not a filament around a carrier | Direct correction |
| 3D intersectional trace | Visible 3D pattern produced by a 4D coil | Direct qualitative claim; exact support/map undefined |
| Time slice | Active 3D bulk, not passive readout | Direct October 9 description; embedding/time function undefined |
| `W⁴` finite-core worldtube | Current assistant/BEDROCK working representation | Not established by the recovered October 29 wording |
| `Klein Fabric` | Current global model name | Topology and local embedding map undefined |
| `ℓ_f` | Misnamed coil scale; diameter-like replacement requested | No accepted replacement symbol |
| `w=ct` / `cw=t` | Conflicting historical normalizations | Preserve separately; no conversion without source-backed symbol/unit dictionary |

```text
GLOBAL KLEIN FABRIC K (topology unknown)
             |
       ? ρ: K → local M⁴
             v
       4D ambient spacetime M⁴
             |
       ? τ: F^(?) → W⁴  (thickening/core map)
             v
       filament / superhelix F^(?)
             |
       ? support dimension and cross-section
             v
       finite-core object W⁴ ?
             |
       i: Σ³_t ↪ M⁴  (slice embedding)
             |
       intersection, if transverse
             v
       C³_t = W⁴ ∩ Σ³_t ?
             |
       ? projection to observed pattern

Separate required interaction:
I_t(W, Σ, medium) → coupled response state
(qualitatively required; no source-defined operator)
```

A set-theoretic intersection alone cannot stand in for the physical interaction because the direct source rejects a passive “readout.” The interaction operator, its domain/codomain, and constitutive conditions remain undefined.

## 5. Conditional geometry and existing Lean work

For transverse support `Aᵏ` and a 3D hypersurface `Σ³` in a 4D ambient manifold:

`dim(A ∩ Σ) = k + 3 - 4 = k - 1`.

| Support dimension `k` | Generic slice dimension | Poincaré-dual degree in 4D |
|---:|---:|---:|
| 1 | 0 | 3 |
| 2 | 1 | 2 |
| 3 | 2 | 1 |
| 4 | 3 | 0 |

The dimension table was independently enumerated in Python with assertions that the slice dimension is `k−1` and ambient/slice Poincaré-dual degrees agree.

A 1D centerline generically meets a 3D slice in points, not a 3D trace. A 4D support/finite-core region can meet it in a 3D region. Therefore “3D intersectional trace of a 4D filament” requires either a 4D support interpretation or a separately defined non-generic projection/thickening. The phrase “4D filament” alone does not settle which.

Existing PR #1098 (`SableCurrentSupportDegreeGate.lean`) already formalizes the support-dimension/Poincaré-dual degree arithmetic and transverse hypersurface-slice dimension relation. Successful workflow run #41328086467, job #124912162960, used merge ref `bbb95297c1866db4fd4b8f6e6d8f590c85385a68`, merging PR head `d2839a9454f16a2ad7661544d9d0c12b664e55c5` into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`. Lean 4.34.0 / Lake 5.0.0 completed the build. The 19 theorem-specific axiom outputs showed standard dependencies; no `sorryAx` or `admit` appeared in the complete log. Tests, lint, nanoda, and the separate axiom-audit stage were skipped. This is a successful merge-reference build, not standalone exact-head verification.

PR #1245 (`SableEuclideanHelixCurvature.lean`) also has successful merge-reference build #41410202260, job #125161268669, on merge ref `d6ad426...`. It formalizes an assistant-authored Euclidean 1D curve lift and circular-helix curvature. It does not formalize the direct 4D finite-core object, the 3D trace, or active slice interaction. Tests/lint/nanoda/axiom-audit were skipped. Lean checks only the formalized Euclidean statement, not source translation or physical interpretation.

No new Lean module or PR was created. The missing work is the source-defined object/map, not the dimension arithmetic.

## 6. Discrepancy ledger

| Direct statement / constraint | Historical assistant translation | Assessment |
|---|---|---|
| One line with thickness, still a line, not a field | 1+1D field `X(τ,s)` and Cosserat/AKSZ action | Ontological change; not direct |
| One helical core; no carrier; outer coil hollow | Carrier-wrapped `X(s)=C(s)+a(...)` | Explicitly rejected |
| 3D pattern is a trace of a 4D coil, not the filament itself | 3D closed loop or 1D Euclidean curve treated as full object | Object/readout conflation |
| Time slice is an active 3D bulk | Passive readout/intersection only | Incomplete; interaction missing |
| `0.7 fm` is coil-scale, not filament thickness | Coil radius/arclength used as filament thickness | Scale-role mismatch; radius/diameter wording unresolved |
| October 29 direct wording only distinguishes 4D universe and 3D slice | Assistant note adds `W⁴`, `Σ³`, `W⁴∩Σ³`, `S¹×S²`, `S¹×S¹` | Assistant proposal, not direct |
| Klein Fabric supersedes old reciprocal model | Older mutual-accommodation model retained as current | Currentness mismatch |
| Time-wavefront/wavesheet is primary; soliton might be graviton | Graviton treated as primitive particle/field | Ontological overstatement |
| Worldtube bending describes inertia | `F=mc² d²x/dw²` treated as curvature law | Coordinate acceleration is not generally intrinsic 4D curvature; metric/curvature definition required |

Symmetric critique: Nathan’s descriptions leave “4D filament” support dimension ambiguous, do not define the Kerr-core cross-section/normal bundle, retain a radius/diameter naming conflict, and do not specify the metric or curvature behind the inertia statement. The assistant’s main errors are adding a carrier, promoting a field action, treating a qualitative trace as an assumed 1D curve, and attributing assistant-authored `W⁴/Σ³` notation to the October 29 clarification.

## 7. Controls and next cursor

- No CODATA scoring, physical calculation, invented fixture, or independent measurement.
- No SAT-O/Blockwave equation edited or promoted.
- No BEDROCK promotion, manuscript-gate change, new branch, PR, tool, paid service, or automation modification.
- Mersearch connector unavailable in this runtime; all four shared request lanes are occupied. Lane 4 request `kestrel-finite-core-geometry-source-fidelity-20261102-2200` remains `requested` with no request-scoped manifest/receipt observed. No new request submitted.
- Existing Math Hopper, Whirligig, PR #1098, and PR #1245 checked; no new tooling needed. SciSpace was not needed for this archive/source task.
- Code Grurple remains active. November 9 P1, November 30 P2, and December 14 P3 remain separate. FIE review due November 10, not yet due.
- Unrelated-reading cursor remains TheTANGLE, line 1891; no redundant break.

**Next deeper cursor:** recover the raw October 29 conversation title/ID/message UUID/parent graph. If unavailable, retain the 4D/3D statement as prior-context-only and stop attributing `W⁴` to it. Separately recover a primary-source definition of the finite-core support, cross-section/normal bundle, ambient metric/signature, embedding, time function, and active interaction operator. Only then compose `K → M⁴`, `F → W⁴`, `W⁴ × Σ³_t → C³_t`, and any projection to the observed pattern. Do not substitute analogy or a Lean proof for missing source definitions.
