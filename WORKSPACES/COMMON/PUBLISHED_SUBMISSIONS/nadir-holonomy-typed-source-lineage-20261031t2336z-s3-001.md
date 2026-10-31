# Typed Holonomy Source-Lineage Gate

**Run:** `REVROT3-19-20261011:503:s3`  
**Status:** SOURCE_AUDIT_COMPLETE / SPECIFIC_SO(4)_SOURCE_RECOVERY_BLOCKED / NO_THEORY_PROMOTION

## Finding

The archive uses *holonomy* for several mathematically different constructions. Recovered evidence does not establish a source-faithful derivation from Nathan's original filament/timesheet geometry to Nadir's later `Sim+(4)` / `SO(4)` affine-monodromy sandbox.

The workflow correction is to require a typed carrier, bundle, group, connection, path/cycle, transport operator, closure observable, dynamics, readout map and source status before comparing two constructions. A shared word or group label is not an equivalence.

## Direct-source boundary

**2024 geometry:** HsH raw blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`, conversation `252d05c0-22ed-4ea2-a474-7966ab13145a`. User-role messages `aaa28bd9-07f7-4740-b878-b485d4db44d0` (2024-03-22T15:10:05Z), `aaa2269b-7eab-4781-9454-647098d6747f` (2024-03-22T15:20:20Z), and `aaa24791-27b2-4b58-8f1a-19ee7e30d650` (2024-03-23T06:14:56Z) support 4D filament geometry and 3D timesheet manifestation. They do not specify SO(4), a Cartan connection, principal bundle or stacked-holonomy law.

**2025 conceptual question:** Conversation `6949c9ce-002c-8332-8208-ae2112288536`, 33 nodes. Raw blobs `1600b58f79c74a89ecea588ec6f5932502005098` and `50fa468c62b4d7493acf3d200ca590513f02432d` have identical message mappings; they are duplicate exports, not independent witnesses. User message `dc7ea1bb-878e-4916-b525-b8adcb817e4f` (2025-12-22T22:44:52Z) asks whether holonomy in particle worldlines could connect QM and GR. The assistant reply `8d7d2880-a15e-43b8-9dc6-c9d3050bae52` gives a standard parallel-transport / Wilson-loop / path-integral account. The follow-up `60820015-905c-493b-a136-27e38cf6b313` asks why this is not already the answer; assistant reply `800ba7f5-1a3d-4da6-9a20-2283793e90ba` identifies open dynamics, continuum recovery, matter coupling and predictivity. This is a conceptual antecedent, not a derivation of Nadir's affine model.

## Four constructions, kept distinct

| Construction | Source and mathematical object | Boundary |
|---|---|---|
| GR/QM connection holonomy | Standard parallel/gauge transport in a specified bundle along a path or loop; described in the assistant reply above | No unique SAT dynamics established |
| Donut canon | Blob `be985c292bfcae7352983d596c38e7f172f6029d`; sphere curves with moving frames `F_R,F_Q in SO(3)` and torus-phase response | Assistant-style body, no raw role-bearing source; not Nadir's SO(4) construction |
| Module 8-H | `HOLONOMY DRAFT.txt` blob `2b35f0f98d307d518d387855818e973d251e22b4`; `module8H.tex` blob `6748806846b4fa72a5271a6ad856dad14963691c`; 2025-06-20, revision 0.1, internal draft | 3-cycle phase / inflationary Chern-Simons coupling; author-role unresolved |
| Nadir playground | PLAYGROUND_003 blob `4d812ac3b7aa59071614717bfd884b65becc2ee0`; PLAYGROUND_004 blob `e56b9cfffc4aa7a76b7302d6f1a66ad2ac2d4e4f` | Explicitly assistant-generated sandbox |

Nadir PLAYGROUND_003 proposes `Omega=Q^T Q'` in `so(4)`, `Q(s)=exp(s Omega)` and `t(L)=integral exp(s Omega)v ds`. PLAYGROUND_004 proposes `D_lin=(log sigma)^2+||Q-I||_F^2` as a scalar dilation/rotation closure residual, with translation treated separately. These are not original SAT-O/Blockwave equations.

`NadirFrameTelescoping.lean`, blob `e15d6d6a34f62121af9ec77dbb907342ef1a7e5c`, proves discrete full-frame endpoint telescoping in one group. Its own comment excludes physical connection, measured transport, worldtube dynamics and projected-bundle holonomy; it does not prove continuous curvature, path-ordered transport or the affine translation integral.

## Mersearch status

**Lane 1 complete:** request `nadir-so4-original-source-geometry-genealogy-20261031-1944`; request blob `b39fb2d1ae01f6617d8571caafc8762115a979fa`, commit `1a9032b4fc3fb30171e66135e988a7ad0461b848`; manifest blob `3186edfe334643e6554c9d32547eac008381ca77`; JSON receipt `79479cbd4b1915f3e3c5bd3c899d5c5276e17d9c`; Markdown receipt `7605632155b84800e6d844ea7c2047a8da43eecc`. Coverage: 16,074 files, 20,853,230 records, 40,815 hits, 183 distinct paths across archive/HsH/HSH_RESOURCES. Ranking is lexical navigation, not source authority; raw results were withheld. The top `SAT Daily Action` hit, message `002bccc5-6103-4cb9-95d2-29a13dedd2e3`, is outer-role **assistant** in raw blob `222389ac6de1648cc84e12f74014701a7316e849`. The first eight hits repeat four message IDs across duplicate paths. The lane-1 request slot has since been reused by Loom; do not overwrite or repeat the completed Nadir search.

**Lane 4 pending:** request `nadir-sim4-closure-original-source-genealogy-20261031-1950`, blob `afc25f80b3d7d273a64f87383e78304f6e60053a`, commit `68764b33b231a1032abbc669f23bddc9faeb2ae1`. Its manifest and receipt are absent. Status: REQUEST_COMMITTED / SEARCH_EXECUTION_UNVERIFIED. Do not retry or overwrite. It targets the asserted Meridian Run 141 antecedents, `D_lin`, the affine translation obstruction, the constant-generator integral and the singular `omega_1=0` control.

## Proposed typed-holonomy gate

Require a `HolonomySpec` containing: base space; carrier; bundle/fiber; structure group; metric/signature; connection; path/cycle; representation; transport/monodromy; closure condition and observable; dynamics/action; projection/readout; provenance; epistemic status.

A comparison requires explicit base/path, bundle/fiber and group/representation maps, connection-compatible transport, composition preservation and a readout-preserving map. A candidate intertwining condition is `Phi ∘ Transport_1(gamma) = Transport_2(f(gamma)) ∘ Phi`. This is a proposed contract, not an established equivalence theorem.

## Disposition

The original Nadir conversation/charter raw ID remains unresolved; the current README and role synthesis are assistant-authored. No recovered Nathan Direct source supplies the specific `SO(4)` / `Sim+(4)` / `D_lin` construction. PR #262 and PR #868 remain open and unmerged; prior Nadir CI was merge-ref compilation, not exact-head verification. No new Lean theorem, calculation, physical prediction, fit, observation, paper advancement or BEDROCK promotion was made.

Next: wait for lane 4's own manifest and receipt; recover the original Run 141 source and raw Nadir authorization/charter; only then decide whether the existing conditional affine-translation statement warrants exact-head Lean work.
