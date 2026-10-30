# Append-only amendment: Meridian geometry-fidelity receipt
**Amends, does not replace:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-30T2200Z_s0_meridian.md`  
**Run key:** `REVROT3-19-20261011:478:s0`  
**Recorded:** 2026-10-30T22:55Z

## 1. Source-attribution correction

The original receipt over-attributed the “no Hopf / no spherical carrier / no worldline wrapping” constraints to `b27ec702-f976-4273-8d87-166ecccdfeb8`. Correct locators:

- **`a96d56d7-59bc-48cc-8338-0a37240e8fd4`, 2026-10-10T03:04:36Z, Meridian Free Build raw JSON:** direct user correction. It rejects a 4D space built around a 3D spherical carrier, explicitly says “No Hopf fibres, no spherical carrier,” distinguishes “SAT is worldlines” from “H(s)H is worldtubes,” and asks how their intersection with a 3D surface produces particles and properties.
- **`59c5c4c6-c914-48d4-af4c-5f53a1698f37`, 2026-10-10T03:15:17Z, same raw JSON:** mixed message. Its opening is a Morrow/Kestrel cross-post, not Nathan Direct. The user's correction after that quotation is direct: worldlines do not wrap around anything; they are the 4D structure of matter; inertia is worldline curvature; the local core is tentatively a single helical ER/Kerr worldtube with a Kerr-shell cross-section; a second-order superhelix is hollow, not another core; any responsive medium is separate and optional; a soliton interpretation remains open.
- **`b27ec702-f976-4273-8d87-166ecccdfeb8`, 2026-10-10T02:49:59Z:** also mixed. Its opening “Cross-posting from Mercer for visibility” and quoted ER/Kerr proposal are Mercer material, not Nathan Direct. The user's later text is direct and discusses changed formalisms, the responsive medium, the open soliton construction, and time-wavefront thickness as an active-update region. It is not the source of the no-Hopf/no-carrier rule.

The two direct locators above are authoritative for those constraints. Read the original receipt's source summary with this correction.

## 2. Source corpus and Mersearch status

- **Meridian Free Build:** raw JSON blob `7af1561b321f4d9364da5eb111df689efc652827`, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, 80 user / 956 assistant / 1,463 tool nodes. Relevant direct messages include `3c657387-b80b-4982-a61a-8e6d8568b8d1`, `5a929b5e-515e-4f77-a32a-e49feef42812`, `1d284b55-d7be-45f7-92a6-15e4734347c8`, and the two October 10 locators above.
- **Meridian Minkowski Ring Analysis:** raw JSON blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`, conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, 112 user / 1,292 assistant / 2,273 tool nodes. Relevant direct messages include `e7286b27-5a16-4804-9bca-3950bd78ed97`, `68577213-0382-48d0-81a7-7f8f8a13253d`, `357da9ad-f0ac-44eb-b4b8-36fb4afe8b7b`, `c1b42229-00a9-4119-aac3-cefa6cb97157`, `f658b2db-32f0-45cd-828b-140691cc9afb`, `090f5160-1020-486d-9c42-df3d7dff2063`, `c5525f53-b7cc-4444-8102-3bf6fdb1c892`, and `59cdedb4-be76-455a-87c8-a6089de951b3`.
- **2024 DIMENSIONAL GRAVITY:** raw JSON blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`, conversation `252d05c0-22ed-4ea2-a474-7966ab13145a`. It records the earlier line/helix/plane-intersection construction. This is historical geometry, not the current no-carrier ontology; the later direct correction explicitly retires the old wrapping/carrier picture.
- **Geometry in Physics:** raw JSON blob `2e0c8477873583b92f20a0a3f2af6528643b4a8a`, conversation `6a25a665-3a10-83ea-a7c0-cebebfdcf1d9`. High-ranking Mersearch hit `ea296587-c07f-4136-9f81-5b3de2a7f322` is assistant-authored, not Nathan Direct. User-supplied “Fundamental Intuitions” document `d5e5afcc-56a7-4bd1-9b25-628b79b82e0a` carries an NM / 5 June 2026 signature, but remains a pasted archival document rather than raw sentence-level authorship proof. The user-role message `15338421-a5e7-4538-879a-d25d840d2bdd` in “0.239 Radians in Science” is likewise a pasted assistant summary, not direct authorship of its embedded equations.

Completed Mersearch outputs were read, not overwritten:
- Loom request `loom-sato-blockwave-source-set-20261030-2017`: manifest blob `2f13294a33eca393d55b3dd943af1b0cd6f98bae`; receipt SHA-256 `31df08a7646cd0cdad243e992fc0f70eec52ced9fbe8f00aefcf980b9f2097f7`.
- Alberr request `alberr-sat-o-worldline-timesheet-interbraid-20261030-1212`: manifest blob `15dc51969036c07aee88a837b0c048244a9d7a6f`; receipt SHA-256 `978bfc1a8b0cdfd81ec38d8b4fbbd523d9a36a6e081f2382b8ff1a8ffe8ae705`.
Raw Mersearch result sets remain withheld under their request policy. Lane 1 remains occupied by Orson; lane 2 remains an older request. No new request was opened.

## 3. Lean / existing branch delta

Existing draft PR #895, branch `research/meridian-cosmotopology-source-gate-20261028t13z`, remains open and draft.

- Exact-head run `41138500079` reached Lean and failed in `MeridianCosmotopologyFidelity.lean` with “No goals to be solved” at lines 80, 83, and 87. In each case `field_simp` had already closed the goal and the following `ring` was redundant.
- Only those three redundant tactics were removed. No theorem statement changed; no P1 cognition files were touched.
- Commit: `71a68306d33472bbbe54df609dd05a5063e30297`; file readback blob begins `508ae1`; readback confirmed.
- Replacement run `41141185069` attempt 1 failed before Lean compilation at “Generate Lake dependency manifest”; the job-log endpoint returned 404 and step summaries were inconsistent. One failed-job rerun was accepted. Attempt 2 was last observed **IN_PROGRESS** at the same manifest step, before Lean installation/compilation. No compile-success claim is justified yet.
- This module contains no visible `sorry` or `admit`, but no theorem-specific `#print axioms` audit was run. Compilation, if achieved, validates only the formalized conditional statements.

The branch's other changed files include answer-projection/provider-partition and pair-matrix artifacts outside this geometry lane. They were not edited. Keep PR #895 draft; do not merge or treat it as physical-theory validation.

## 4. Geometry-fidelity consequences

The source-grounded stable core is: SAT worldlines; H(s)H worldtubes; a 3D time surface/bulk; intersection as the route to observed particles; worldline/worldtube material-history curvature as the user's intended geometric description of inertia; a single tentative local helical core; a hollow outer superhelix; optional separate responsive medium.

Limits and mismatches:
- “3D rotation is 4D curvature” is compatible with curvature of a marked material history in flat ambient R4. It does not require nonzero ambient Riemann curvature.
- The assistant's `F = m c² d²x/dw²` is a coordinate/Newtonian reconstruction using the earlier `w=ct` convention, not a direct invariant formula. Current BEDROCK says preserve the later literal `cw=t` and do not silently assign the type of `w`. The notation/version map remains open.
- The assistant's Cruller mapping torus `(S³×[0,L])/((n,L)~(Qn,0))`, its S³/Hopf-coordinate decomposition, and its associated CTC theorem are sandbox proposals, not Nathan Direct topology. They do not implement the direct “birth of another worldtube” rule.
- The Nambu–Goto folded-string / pulsating-loop comparison is a historical assistant model, not a matched Kerr-like rotating-ring test. It does not settle the direct conjecture that a Kerr-like ring diameter oscillates.
- The time-normal “torsion” phrase is direct as a hypothesis about normal turning under matter interaction; the assistant's `Ω_t` formula is a proposal. Do not silently equate normal-field turning, a hypersurface shape operator, and affine-connection torsion.
- The dimension/type of the finite-core worldtube and the thickening map `γ → W` remain unspecified. For transverse intersections in 4D, a 1D worldline with a 3D hypersurface gives 0D events; a 2D worldsheet gives a 1D trace; a 3D embedded worldtube gives a 2D trace; a full 4D region gives a 3D slice. Type the intended H(s)H object before selecting one.
- Coarse-graining and slicing must be compared as maps, not analogy: `P_Σ ∘ C₄` versus `C₃ ∘ P_Σ`. Their equality/commutation conditions are not established.

No CODATA scoring, physical calculation, or new data-free numerical fixture was performed.

## 5. Control state and next cursor

- Code Grurple publication interlock remains active. No new issue, public submission, BEDROCK promotion, branch, task, ID, cadence, signet, or chat-title change was made.
- The 14-day FIE re-review is not due; the last recorded review was 2026-10-27.
- The predecessor's deliberate unrelated reading was `SAT Mark V/TheTANGLE.txt`, lines 1481–1520, return cursor 1521; no duplicate break was needed here.
- Next deep cursor: reconcile the exact type and normalization of `cw=t` against the earlier `w=ct`; then define `γ`, `W`, `Σ³`, the thickening/intersection maps, the normal-field operator, and the coarse-grain/slice composition. Keep the local Kerr/ER core hypothesis separate from the global Cruller/Klein-Fabric hypothesis. Do not promote the mapping-torus or Hopf-coordinate sandbox as the user's ontology.


## 6. Lean CI final result (2026-10-30T23:06Z)

The accepted rerun of Actions run `41141185069` completed **SUCCESS** on job `124358367833`, exact source commit `71a68306d33472bbbe54df609dd05a5063e30297`.

- Lean: `4.34.0`, commit `293d5d0c0c3f3dded4688b3ccd6a33939ac5102b`.
- Mathlib: revision `5ed2965256430c3649e86755f9576b54eca72435`.
- `lake build`: **Build completed successfully (8946 jobs)**.
- `HsHVerification.MeridianCosmotopologyFidelity` built successfully.
- The module's `#print axioms` output lists `propext`, `Classical.choice`, and `Quot.sound` for the first five theorems; the mapping-torus endpoint theorem lists `propext` and `Quot.sound`. No `sorryAx` is listed.
- The workflow's separate `axiom-audit` option was disabled; test and lint steps were skipped. This is a successful Lean build with in-file axiom reporting, not a full external axiom audit.

This resolves the compilation failure only. The statements remain conditional: the build does not establish that the mapping-torus quotient, Euclidean inversion, monotone global time, or their translation from Nathan Direct geometry are physically correct.
