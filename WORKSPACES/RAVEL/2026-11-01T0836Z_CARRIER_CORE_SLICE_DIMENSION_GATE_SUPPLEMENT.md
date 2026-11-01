# Ravel :36 supplement — carrier, finite-core and timesheet dimension gate

**Run key:** `REVROT3-19-20261011:512:s3`  
**Selected identity:** Ravel (index 17); successor Orson Vay (index 18).  
**Classification:** SANDBOX / SOURCE-TYPED DIMENSIONAL AUDIT / CONDITIONAL LEAN FORMALIZATION.  
**No theory promotion, no physical prediction, no manuscript or BEDROCK change.**

This is an additive supplement to the existing same-slot report and receipt. It does not create a second primary receipt, a duplicate publication issue, or a new PR.

## 1. Source genealogy: three different objects were being too easily conflated

### A. July 2025 SAT.O Official Directives

Raw source blob: `167136310cdf33ca8f986f33634692314c1a0946`. The PDF is unbylined. It describes a 4D manifold populated by **1D filaments** and a propagating **3D wavefront**.

### B. June 2025 SAT4D Canonical Summary

Raw text-extraction blob: `2a79fe25018cce7e99a2c33786d88b0551db6ae7`. The document carries a Nathan McKnight byline and is marked as a draft with AI assistance acknowledged. Its O1 section defines a filament as a smooth 1D curve `gamma : R -> R^(3,1)`, then separately defines the worldtube as the **4D volume swept out by the vibrating filament**. An earlier methodology passage calls filaments “fixed 4D worldlines”; that wording is not a sufficiently precise substitute for the later explicit 1D curve definition.

### C. Nathan Direct, 2026-10-09 Meridian Free Build

Raw conversation blob: `7af1561b321f4d9364da5eb111df689efc652827`. Direct statements distinguish one helical core from a hollow outer winding, describe a “4D filament” and a “3D intersectional trace,” and describe the timesheet as an interacting 3D bulk rather than a passive readout. The same source keeps intrinsic core thickness `epsilon`, first-order coil radius `ell_f`, and the worldtube axis-to-circumference dimension distinct.

### D. September 2026 Nathan Direct Ravel source: spatial Kerr section, not 4D Kerr as a cross-section

The raw-user-verified batch \`WORKSPACES/COMMON/verified_batches/2026-09-13-RAVEL-SPRING-WORLDTUBE-05.md\` preserves Nathan's September 7 statements from the original Ravel conversation. Nathan first describes a four-dimensional worldtube extension with a Kerr cross-section, then corrects the dimensional reading: Kerr is itself a 4D spacetime solution, so the intended construction must choose a **spatial Kerr section** and extend that section along the filament. The full 4D Kerr spacetime is not to be used as the cross-section of another 4D object.

A candidate typed construction is therefore:

\[
\gamma^1 \longrightarrow W^4 \longrightarrow M^4,
\qquad
K^3_{\mathrm{spatial}}\ \text{as a 3D fiber over the 1D filament}.
\]

For a locally trivial smooth bundle, the dimension count is \(1+3=4\). Using a full 4D Kerr spacetime as the fiber over a 1D filament would instead give a 5D total space, inconsistent with a 4D worldtube. This is a dimensional consistency condition on that candidate construction, not proof that the bundle or embedding exists. The exact Kerr spatial slice, bundle projection, fiber transport/connection, embedding into the ambient space, and relation to the finite core remain unspecified.

The same direct source states that force is primitive and that filament and timesheet must mutually accommodate/distort in response. Thus the eventual response map \(R_t\) must be a coupled interaction law, not a passive projection. It also assigns rest mass only to persistent coil. The historical f-boson/t-boson grammar remains provisional and is not promoted here.

The later phrase “4D filament” is **not silently identified** with the earlier 1D SAT.O filament, the 4D worldtube volume, or a 4D intrinsic support. The source does not supply the map that would settle that identity.

The 2024 `DIMENSIONAL GRAVITY` construction (raw conversation blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`) remains an explicitly heuristic line/plane and moving-wavefront construction, not a physical derivation or ontology.

## 2. Conditional dimension result

Let the ambient space be 4D and the timesheet be a 3D embedded submanifold. Let the intrinsic carrier dimension be k, left as a parameter.

For a smooth embedded carrier with a suitable normal complement:

\[
\operatorname{rank}(\nu C)=4-k.
\]

For a transverse intersection:

\[
\dim(C\cap\Sigma_t)=k+3-4=k-1
\quad (1\leq k\leq4).
\]

For a full-dimensional 4D worldtube region:

\[
\dim(W^4\cap\Sigma_t)=4+3-4=3
\]

under the corresponding nonempty transverse-intersection assumptions.

| Carrier dimension (k) | Conditional normal-complement rank | Expected carrier/timesheet intersection |
|---:|---:|---:|
| 1 | 3 | 0D |
| 2 | 2 | 1D |
| 3 | 1 | 2D |
| 4 | 0 | 3D |

**Consequence:** a 3D trace is not the generic transverse intersection of the bare 1D SAT.O carrier with a 3D timesheet. It can be the intersection of a full 4D worldtube with the timesheet, or arise from a different higher-dimensional support. That is a conditional dimensional distinction, not a claim that the physical worldtube map has been derived.

## 2A. What is forced, and what remains optional

**Source-stated constraints:**
- 4D ambient manifold, 1D filaments, and a 3D propagating wavefront in the July 2025 SAT.O directive (unbylined source).
- A 1D curve and a separately defined 4D worldtube volume swept by the vibrating filament in the June 2025 SAT4D draft (document-level Nathan McKnight byline; AI assistance acknowledged).
- In the 2026 Nathan Direct source: one helical core, hollow outer winding, a 3D intersectional trace, and an interacting 3D timesheet bulk. A second-order core is explicitly rejected.
- `epsilon`, `ell_f`, and the worldtube axis-to-circumference dimension remain distinct.

**Conditionally forced by standard geometry:**
- If the carrier is a smooth 1D embedded curve in a 4D ambient space and the chosen construction is a normal-bundle tube, the normal-complement rank is 3.
- If that full 4D tube region intersects a 3D timesheet transversely, the expected slice dimension is 3.
- If the carrier itself is 1D, its transverse intersection with the 3D timesheet is 0D.
- If the carrier is intrinsically 4D in the same 4D ambient space, its normal-complement rank is 0.

**Not forced by the current sources:**
- A normal-bundle tube as the actual worldtube construction; the SAT4D draft says “swept by the vibrating filament” but does not define the sweep map.
- A constant circular cross-section, a specific normal radius, or identifying `epsilon` with a normal-bundle radius.
- Any twist/normal connection, contact surface, boundary condition, or constitutive response. These require explicit maps and laws; dimension counting alone does not produce them.
- A Kerr-core identification or responsive-medium soliton; both remain tentative.
- Any equality among `epsilon`, `ell_f`, and the worldtube axis-to-circumference dimension.

The source therefore forces a 4D worldtube-volume role in the SAT4D draft and a 3D timesheet interaction in the later direct account, but it does not yet force one unique construction of the volume, its cross-section, twist, or contact response.

If “4D filament” means a genuinely 4D support inside the same 4D ambient space, its normal-complement rank is zero. A nontrivial finite core then cannot be obtained by ordinary normal thickening within that same ambient space; an intrinsic/internal core structure or a different ambient space would have to be specified.

A normal-bundle tube around a 1D curve is one possible realization, not a source-established mechanism. It would require a smooth embedding, a suitable nondegenerate normal complement, and an injective tubular map/radius. The SAT4D prose instead says “swept by the vibrating filament”; it does not define that sweep map. No equality of `epsilon`, `ell_f`, or the worldtube dimension is introduced.

## 3. The missing projection condition

The existing `RavelCarrierSliceReconstruction.lean` (branch blob `ee05b9b104cd69e922face1cf1beb072e380b429`) already formalizes a generic `FiberedSupport`, `LabelledSlicePullback`, the explicit `baseOf` map, base composition, and commuting ambient maps. It proves a set-level pullback/intersection identity. It does not provide a physical normal bundle, a slice-preserving retraction, or a dynamical response.

A tube-to-carrier retraction `pi : W -> C` alone does **not** induce a map
`W ∩ Sigma_t -> C ∩ Sigma_t`: the foot point of a tube point on the timesheet need not itself lie on that timesheet.

For such a map, a candidate must supply a sheet reparameterization `r_t` and prove the slice-compatibility condition:

[
E(w)=\sigma_t(s)
\;\Longrightarrow\;
\iota(\pi(w))=\sigma_t(r_t(s)).
]

If the same timesheet event must be preserved, the stronger condition (r_t=\mathrm{id}) is required. The condition is not automatic from a tubular projection.

The physical interaction/current map (R_t) remains missing. The timesheet is source-described as interactive, so a passive geometric projection is not a substitute for the response law. The current map must ultimately produce a conserved electromagnetic current and determine both electric and magnetic form-factor channels under shared parameters; independently adjustable channel profiles would leave the construction indistinguishable from ordinary two-form-factor freedom.

## 4. Lean formalization

Existing PR #1133 was extended on its existing branch:

`research/ravel-carrier-slice-reconstruction-20261031t0212z`

New module:
`FORMAL_VERIFICATION/HsHVerification/RavelCarrierSheetDimensionGate.lean`

The module formalizes:
- the conditional codimension/normal-complement arithmetic;
- the (k-1) expected carrier/timesheet intersection dimension for (1\leq k\leq4);
- the 1D-carrier/3D-timesheet 0D case;
- the full-4D-core/3D-timesheet 3D case;
- the zero normal rank of a full-dimensional carrier;
- a generic `SliceCompatibleRetraction` contract with an explicit zero section, retraction, sheet reparameterization, and `preservesSlice` law;
- construction of the induced map between the two pullbacks, conditional on that law.

The module deliberately does **not** instantiate a physical carrier, normal bundle, metric, tubular radius, timesheet, or current. It does not prove transversality or that the slice-preserving law holds for H(s)H. The existing `pdDegree` function has the same numerical (4-k) expression but denotes Poincare-dual form degree, not normal-fiber rank; the two objects remain distinct.

Branch head after proof repair: `10099fa9b9a8175269405bd77e71e0803143f645`.  
New module blob after proof repair: `69c15e6dd9c7e4cb067e0706997f0b3a770b9ec4`.  
Root aggregator blob: `db4d5e73e00c46ae30804d20cf380dbbe805418e`.  
Actions runs: `41292061092` (cancelled before compile), `41292069239` (job `124805479699`, one proof failure corrected), and `41292451762` (job `124806308038`, SUCCESS).

**Lean status: MERGE-REF BUILD SUCCESS.** Corrected Actions run `41292451762`, job `124806308038`, checked out merge commit `81da81cf87218b1ab5c2666b55c896af1781444e`, which merges PR head `10099fa9b9a8175269405bd77e71e0803143f645` into base `61cc8b65ffed70296e0121dbae067892a79c81d4`. The new module blob (`69c15e6dd9c7e4cb067e0706997f0b3a770b9ec4`) and root aggregator blob (`db4d5e73e00c46ae30804d20cf380dbbe805418e`) were independently fetched at both PR head and merge ref and matched exactly.

Lean 4.34.0 / Lake 5.0.0 completed the full `lake build`: **8,946 jobs, success**. The new module built as target `8928/8946` in 6.8 seconds. Its `#eval` emitted `[(3, 0), (2, 1), (1, 2), (0, 3)]`.

The module's `#print axioms` results:
- `carrierSliceDimension_eq_k_minus_one`: `[propext, Quot.sound]`.
- `positiveNormalRank_implies_carrier_lt_four`: `[propext]`.
- The concrete line/core dimension results and `inducedMap_commutingWitness`: no axioms reported.

The full decoded job log contains **0 `sorryAx` and 0 `admit` occurrences**. Tests, lint, nanoda, and the separate automated axiom-audit action were skipped; the theorem-specific `#print axioms` commands did run. This is a merge-ref build, **not** a standalone exact-PR-head build. The earlier module-only run `41292061092` was cancelled before compile when the aggregator commit superseded it; run `41292069239` exposed the single proof failure, which was repaired before the successful run.

Lean checks only these formalized arithmetic and conditional pullback statements. It does not prove the physical existence of a carrier, normal bundle, Kerr fiber, tubular/sweep map, transversality, slice-preserving law, or electromagnetic response. It does not establish the soundness of the source-to-formal translation or any physical premise.

## 5. Structural test matrix

| Candidate | Shared parameters / map required | Expected slice | Standard comparator | Structural failure condition |
|---|---|---|---|---|
| 1D carrier plus 4D swept/normal tube | Carrier embedding; three normal directions only if normal-tube model; sweep/thickening map; timesheet embedding | Bare carrier slice 0D; full tube slice 3D | Standard 4D worldline plus finite-size/worldtube representation | Claiming the 3D trace is the bare transverse curve/timesheet intersection |
| Intrinsic 4D carrier | Internal-core structure or enlarged ambient; no normal directions in the same 4D ambient | 3D carrier/timesheet intersection | Standard full-dimensional support | Claiming nonzero normal thickening inside the same 4D ambient |
| General (k)-dimensional carrier | Explicit (k), embedding, normal complement and transversality | (k-1) | Standard transverse-intersection dimension | Stated slice dimension contradicts (k-1) while transversality is retained |
| Tube-to-carrier slice projection | Retraction plus explicit sheet reparameterization and `preservesSlice` proof | Induced carrier-slice map only if compatible | Ordinary bundle projection without a slice constraint | No map can be constructed from the supplied data |
| Kerr spatial-section bundle candidate | 1D filament base; 3D spatial Kerr section as fiber; bundle projection, fiber transport and ambient embedding | 4D worldtube; 3D timesheet slice expected | Standard 1D worldline plus 3D finite-size spatial section | Full 4D Kerr spacetime used as fiber gives a 5D total space, not a 4D worldtube; missing bundle/embedding map |
| Physical EM response | Source-defined (R_t), current normalization/conservation, observer projection and shared parameters for (F_C,F_M) | Electric and magnetic channels from one frozen construction | Same standard nuclear-current/MEC comparator and same calibration/holdout | Independent channel shape functions, missing current law, or holdout outside a preregistered predictive region |

This is a structural acceptance/falsification matrix, not a scored physical experiment. The existing helion holdout remains **NOT SCOREABLE** until the source-defined thickening/sweep and (R_t) maps are supplied and the full cross-section covariance/normalization data are recovered. No new physical calculation, fit, or prediction was made.

## 6. Disposition and next cursor

- Existing PR #1133 remains OPEN / DRAFT / UNMERGED; no rebase or merge.
- Existing PR #993 and its measured-input gate remain untouched.
- Existing issue #1202 remains the publication destination; its immutable published artifact is not rewritten. This supplement is intended as an additive comment after Lean verification.
- No new issue, PR, branch, tool, dependency, Mersearch request, or automation.
- BEDROCK and STATE_OF_THE_THEORY unchanged; no SAT-O or Blockwave equation changed.
- Kerr-core identification and responsive-medium soliton remain tentative.
- The old (T\sim c^4/G) filament-tension value remains unaccepted.
- No Orson inbox write or task transfer; Orson's protected cognition remit remains untouched.
- The existing :36 automation remains enabled on its original task ID and hourly :36 phase.

**Next exact work:** resolve whether the later “4D filament” denotes the 1D carrier, its 4D swept worldtube, or a distinct intrinsic 4D support; then define the actual sweep/thickening map, prove or reject slice compatibility, and source the interacting current law before any physical prediction.
