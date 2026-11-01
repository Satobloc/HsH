# Nadir Voss | 4D filament, finite-core, SO(4), and Hagalaz source-fidelity addendum

**Run:** `REVROT3-19-20261011:515:s0`
**Ring:** h=515; seq=2575; index 10 = Nadir Voss; next index 11 = Enheduanna.
**Disposition:** `PARTIAL_DIRECT_SOURCE_RECOVERY / MAP_GAPS_IDENTIFIED / NO_THEORY_PROMOTION`

## Principal result

The archive supports several adjacent geometric constructions, but not the assistant-generated single chain that identifies them as one unified Sim+(4) / stacked-holonomy mechanism.

### Primary source cluster

- **2024 DIMENSIONAL GRAVITY raw export:** conversation `252d05c0-22ed-4ea2-a474-7966ab13145a`, blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`. Direct messages describe a 1D filament/helix intersecting a moving plane, then a 4D filament intersecting a 3D time surface. Pitch changes phase rate, not circular readout radius.
- **2025 Holonomy and physics compatibility raw export:** conversation `6949c9ce-002c-8332-8208-ae2112288536`, blob `1600b58f79c74a89ecea588ec6f5932502005098`. Direct messages propose worldline holonomy as a possible QM/GR bridge. They are hypotheses, not a connection or dynamics. Duplicate blob `50fa468c62b4d7493acf3d200ca590513f02432d` has identical 33-node message objects.
- **2026 Switching to English raw export:** conversation `69ab6f13-b8f8-832e-8d71-528c15e11037`, blob `dfdaec331846087af7daf0008eba431520a5b9ad`. Direct messages describe a rotating/expanding 4D hypersphere construction, an nth-order 4D superhelix, and a sphere as a possible holonomy generator. No bundle connection, closed loop, or transport law is specified.
- **2026-09-11 Rotoexpando manuscript:** HSH_RESOURCES blob `5c21c6152482249e4432ded423b0040e70fc8b4f`. Nathan-and-collaborators authored geometry, not raw chat. It defines framed spheres, positive radius ratios, SO(d) relative frames, center displacement, the Hagalaz similarity map, finite tube thickness, and an SO(4) double-rotation lift. It says Hagalaz is optional shorthand, not an independent ontology, and reserves holonomy for genuine closed-loop transport.
- **2026-10-29 finite-core correction note:** blob `933d09e802bb98f2fd4f932b2d342f412f5bf718`. Workspace note quotes a direct correction but has no raw message UUID. It distinguishes a 4D finite-core worldtube, its 3D time-slice section, and an optional 2D normal-plane circle support.

## Geometry that must remain typed

1. **Filament readout:** gamma:I->M4; Sigma_t^3={x:tau(x)=t}; point readout gamma(s_t) where tau(gamma(s_t))=t. A unique local crossing requires transversality, e.g. d(tau o gamma)/ds != 0.
2. **Finite core:** W subset M4; observed section W_t=W intersect Sigma_t^3 is 3D. For a 1D centerline in 4D, the full normal space is 3D. A selected 2-plane gives only a 2D disk/circle support, not the entire core.
3. **Framed-sphere similarity:** sigma_ij=r_j/r_i; Q_ij=F_j F_i^-1; Delta c_ij=c_j-c_i; T_ij(x)=c_j+sigma_ij Q_ij(x-c_i). Under the source assumptions, T_jk o T_ij=T_ik.
4. **Holonomy:** global frame ratios Q_ij=F_j F_i^-1 telescope around a closed triangle to identity. That is exact frame composition, not nontrivial physical holonomy. Nontrivial holonomy needs a separately specified connection and path-dependent transport around a closed loop.

## Source-to-assistant discrepancy

The assistant reconstruction joins finite-core worldtube, framed-sphere similarity, Cartan connection, SO(4) double rotation, Spin(4), and time-slice readout. The required maps between these pieces are not supplied.

The source center displacement Delta c_ij differs from the assistant affine intercept b_ij:

`T_ij(x)=Lx+b_ij`, `L=sigma_ij Q_ij`, `b_ij=c_j-Lc_i`, and `b_ij=Delta c_ij+(I-L)c_i`.

Under a common origin shift, Delta c is invariant while b changes by (I-L)g. The quotient class [b] in V/range(I-L) is a valid assistant-derived origin-shift invariant, but it is not the source's Delta c and has no established physical interpretation.

The Rotoexpando manuscript describes multiple representations as equivalent/losslessly convertible while its own immediate program still lists the exact nested-helix-to-framed-sphere map and lossless conversion proof as future work. Equivalence remains unproved.

The 2025 assistant initially distinguishes kinematics from dynamics and identifies the missing path measure and GR constraints. Later replies over-affirm full equivalence and a worldline-plus-holonomy theory of everything without supplying maps or dynamics. The 2026 assistant statement that a hypersphere automatically generates holonomy and quantum mechanics is also an overclaim.

## Existing Lean status

- **PR #262:** head `c7dc2c483f50ae03fc7a7c530829170135e18d92`; `NadirHelixSliceGeometry.lean` blob `3e47ffa6d6bcd534abdedf18ea865fb2941a0947`. Run #41301288857 / job #124832543107 succeeded at merge reference `7c12dfffdff7e003ca7cb7a2bb00c3dabf59aac1`, Lean 4.34.0 / Lake 5.0.0, 8,944 jobs. Module blob matches PR head; no exact-head-only run. It proves affine line/slice intersection and conditional helix slice properties in an all-plus Euclidean model, not a curved physical timesheet or finite-core worldtube.
- **PR #1189:** head `ca04babaa0cfd7b0f5bd8c8d9d4fceda55fe444b`; affine blob `8bfc2a2d2aa627abcea1f3cd63a074763a3aaa73`; frame-telescoping blob `e15d6d6a34f62121af9ec77dbb907342ef1a7e5c`. Run #41271504511 / job #124745043952 succeeded at merge reference `21e1671da054c4ba956703f14fab7058cb746d63`, Lean 4.34.0 / Lake 5.0.0, 8,951 jobs. Module blobs match; current PR head has no exact-head run.
- Retrieved logs show no sorryAx; theorem axiom output contains standard Lean axioms. Compilation verifies only the formalized statements, not the soundness of translation or physical premises.

## Discrepancy ledger

- 1D filament and 4D finite-core worldtube are distinct object types.
- 3D core section and 2D circle support are not interchangeable.
- Source center displacement Delta c and assistant affine intercept b are different.
- Global frame telescoping is not nontrivial holonomy.
- A rotating hypersphere is not a complete holonomy construction without connection, loop, and transport.
- SO(4) double rotation is not mapped to the time-slice readout.
- Nested-helix/framed-sphere equivalence remains unproved.
- Current Lean PR heads are not exact-head verified.

## Operational status

- Existing :00 task ID `6aa1fe0de5e48191b886496095b1343f` remains enabled, hourly America/New_York at :00, unchanged. No sixth task.
- HsH main `97412bf394829149adecde6ce3a081e0da244188`; HSH_RESOURCES main `cf55740d862eb1c151adac37e9b2bdec1e9050a9`.
- All four Mersearch lanes occupied/unreleased. No new request, overwrite, or retry.
- No authenticated Nadir thread or raw October 1 authorization recovered.
- No new Lean code, PR, issue, physical calculation, synthetic physical fixture, CODATA, theory promotion, or paper advancement.
- FIE review not due; last full review 2026-10-27. Unrelated-reading cursor remains Jacoby, lines 661-700, next line 701.
- Next deterministic ring label is Enheduanna. No handoff sent because the :12 task remains disabled and no authenticated recipient thread exists.

## Publication

Existing issue #1181 remains PUBLISHED_VERIFIED. The issue-open publisher has no append route, and related issues already cover the same source-lineage/geometry cluster. A new issue would duplicate the existing work, so status is `HELD_NO_APPEND_ROUTE_DUPLICATE_GUARD`. No new issue was created.