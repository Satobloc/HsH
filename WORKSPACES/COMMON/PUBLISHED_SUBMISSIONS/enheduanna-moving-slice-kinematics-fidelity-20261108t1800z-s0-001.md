# Lane 00 | Moving-slice kinematics and geometry fidelity

**Run key:** `REVROT3-19-20261011:690:s0`  
**Worker label:** Enheduanna; successor identity: Tern Rook.  
**Status:** source-fidelity extension; not a theory promotion.

## Principal finding

The 2024 direct geometry is a moving-plane construction: a straight axis and a coaxial helix are intersected by planes perpendicular to the axis. A particular plane intersects the helix at one point, not a spiral of points. As the plane advances, the axis point S is stationary in slice coordinates and the helix point H moves around S. The radius is the helix's radial distance from the axis; pitch and slice speed control phase rate.

The historical assistant initially misdescribed the intersection as a spiral-like sequence. Nathan corrected it. Later, Nathan asked for two points to approach, meet, and separate at a steady rate, proposing oppositely opening parabolas. The assistant only paraphrased that request. A simple conditional reconstruction shows that ordinary parabolas produce quadratic separation and zero separation speed at contact; two straight lines crossing the slice family produce linear separation and constant speed magnitude on either side. The latter is a reconstruction, not a source-authored equation.

## Primary-source custody

- 2024 `DIMENSIONAL GRAVITY`, raw export SHA-1 `2cea1924266418e19b825b95ae51e6b7cbace7e1`. Relevant direct messages: `aaa2269b` (one intersection per plane), `aaa2d0b1` (moving-plane circular trace), `aaa2a1cc` (radius independent of pitch), `aaa2b827` (angle/pitch criterion), `aaa2d58f` (two-point steady-rate request), `aaa2fa79` (two-parabola proposal).
- SAT-O1 draft: `SAT_THEORY_ARCHIVE_2023-25/SAT_O REWRITE/SAT 4D/SAT4D_LIVE_DRAFT.txt`, blob SHA-1 `2a79fe25018cce7e99a2c33786d88b0551db6ae7`, byline Nathan McKnight, June 2025. Path-specific first extant upload is 2025-10-27 23:52:03Z; an earlier report records a different timestamp, so source-date reconciliation remains open.
- Blockwave minimal-action file: `SAT—Blockwave Ideal Model.txt`, blob SHA-1 `dd0631bc0b25c951dc5e1d6738280e08487b46b2`, first extant HsH upload 2026-10-08 02:42:49Z; no verified byline/creation date.
- Blockwave clean-action attachment: `🧱BLOCKWAVE.txt`, blob SHA-1 `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; outer attachment is user-supplied, embedded authorship unresolved.
- Assistant unified action: raw conversation blob SHA-1 `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`, assistant message `121d607d`, 2025-10-19 12:29:46.538Z. It is assistant synthesis, not Nathan Direct.
- User-supplied θ-sector summary: raw conversation blob SHA-1 `7e5dc51d2ec7f93e2277a37b491707b7acb3df83`, user message `c4b21c6d`, 2025-10-22 10:52:44.465Z. Its θ-sector text was first formatted by an assistant; treat it as adopted working text, not proof of original equation authorship.
- 2026 direct geometry: `Meridian Free Build` raw blob `7af1561b321f4d9364da5eb111df689efc652827`; `Minkowski Ring Analysis` raw blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`. Direct updates specify one helical core, hollow outer coil, no second core; coil scale is not filament thickness; filaments can be stationary while particle motion is topological; the time surface must interact with matter; and the earlier reciprocal filament/timesheet model is superseded by the Klein Fabric model. A separate donut-curvature/acceleration claim is explicitly a working hypothesis with no proof.

## Direct geometry and conditional corrections

For a normalized helix with pitch p and radial distance r:

```text
H(z) = (r cos(2πz/p + φ), r sin(2πz/p + φ))
S   = (0, 0)
|H(z) - S| = r
z(t) = v t  =>  angular rate ω = 2πv/p
```

The radius is independent of pitch. The 2024 phrase “angle of intersection much lower than pitch” compares an angle with a length and is not a defined dimensionless criterion; plane normal and a slope/ratio are required.

For the two-point request, a simple parabolic reconstruction is `C±(z)=(0,±az²,z)`, giving `Δy=2az²`; at constant slice speed its separation rate vanishes at contact. A straight-line pair `C±(z)=(0,±mz,z)` gives `Δy=2m|z|`, constant rate magnitude away from contact. The labelled points pass through one another; a bounce requires a cusp/reflection rule.

## Dimension-typed mapping

For transverse submanifolds in 4D, `dim(A∩B)=dim(A)+dim(B)-4`.

```text
3D toy:  axis L¹ + helix H¹ -- plane Σ² --> points S⁰, H⁰
4D lift: filament γ¹       -- time Σ³ --> point p⁰
candidate worldsheet W²    -- time Σ³ --> curve γ¹
finite support V⁴          -- time Σ³ --> 3D trace V³
```

Thus 1D, 2D, and 4D carriers yield different slice objects. The 2026 phrase “4D filament / 3D intersectional trace” is under-typed: if filament means a 1D curve, a transverse 3D slice gives a point, not a 3D trace. SAT-O1 calls γ a 1D curve but its “worldtube” a 4D volume without supplying a normal-bundle thickening or sweep map. Blockwave's assistant-generated `J^{μν}` is described as a conserved two-form/worldsheet current, again a different carrier. No source-defined map joins these.

## Historical equations and fidelity cautions

SAT-O1's archived draft uses:

```text
γ : ℝ → ℝ^(3,1), parameterized by affine λ
γ^μ(λ) = (λ, A_x sin(k_x λ + φ_x),
             A_y sin(k_y λ + φ_y),
             A_z sin(k_z λ + φ_z))
v^μ = dγ^μ/dλ
S[γ] = ∫ dλ L(γ,v)
L = 1/2 m v^μ v_μ - V_tension(γ)
```

The draft also describes intrinsic filament tension/vibration and says interactions emerge without external forces. Later direct material says classical filaments can be stationary, particle motion is topology, and Newtonian-limit worldtube morphology is determined by force and mass. The relationship is unresolved. The phrase “No elastic modulus...” in a later user message is quoted assistant text, not an independent Nathan Direct axiom.

The Blockwave minimal-action variant contains `ρ/2(∇u)²`, `f²/2(∂θ)²`, `-μ⁴(1-cosθ)`, and `α₁, α₂, β` mixing terms. Its `ρ` is described as elasticity of the time-flow field, not filament tension. A separate assistant unified action adds `J`, `F`, and an unspecified `M` kernel; its kinetic coefficient `f_θ/2` differs from the minimal source's `f²/2`. The full verbatim assistant action is preserved in the cited raw assistant message and the companion full report. The exact-phase issue for `F=d(α dθ)` is already covered by the existing Morrow Blockwave audit and is not duplicated here.

`θ_BW` is a compact scalar phase; later SAT `θ₄` is a geometric incidence angle. No map makes them the same field. O1 and Blockwave use Lorentzian `R^(3,1)`/`g`, while current BEDROCK specifies native `(++++)` with Lorentzian readouts derived. The metric/readout map is missing.

## Lean evidence

Reused existing `FORMAL_VERIFICATION/HsHVerification/NadirHelixSliceGeometry.lean` on `infra/lean4-verification-20261023`; no new module or PR. Actual Lean 4.34.0 / Mathlib full build in PR #1455 merge-reference run `42390677035`, job `128457402086`: 8,945 jobs, SUCCESS. The job log includes the helix-slice module and theorem-specific `#print axioms`; captured dependencies are `propext`, `Classical.choice`, and `Quot.sound`, with no `sorryAx` in those theorem reports. Tests, lint, nanoda, and global axiom audit were not run. PR #1455 remains open/draft/unmerged and the module is not on main.

The Lean result proves only the formalized conditional helix/slice statements. It does not establish that the equations faithfully translate Nathan's descriptive source or that any physical premise is true. The parabola/line comparison is hand-derived and not Lean-formalized because the direct source gives no equations.

## Glossary and discrepancy ledger

- `γ¹` / filament / worldline: 1D curve in 4D.
- `Σ³` / time surface: 3D hypersurface advancing through the 4D block; later direct material requires interaction, not readout-only.
- `Σ²`: 3D-toy moving plane.
- `W²`: candidate worldsheet; its slice trace is 1D.
- `V⁴`: candidate finite 4D support; its slice trace is 3D.
- `J^{μν}`: assistant-originated rank-2 current; support map unresolved.
- `θ_BW`: compact scalar; not automatically `θ₄`.
- core/outer coil: one helical core and hollow outer coil; no second core.
- `w=ct`: time-length coordinate, not a metric map.
- Klein Fabric: current model label superseding the earlier reciprocal filament/timesheet model.

Main discrepancies: (1) assistant's initial static-helix intersection error; (2) radius/pitch confusion avoided by Nathan's correction; (3) angle-versus-pitch dimensional mismatch; (4) parabolas do not give steady-rate separation; (5) O1 curve/worldtube type gap; (6) O1 dynamics not reconciled with later stationary-filament/topological-motion description; (7) 1D/2D/4D support types are unmapped; (8) Lorentzian/native-`(++++)` map absent; (9) 2024 three-string proton picture not mapped to 2026 one-core/hollow-coil geometry; (10) assistant's `F=mc² d²x/dw²` is Newtonian coordinate kinematics, not intrinsic 4D curvature; (11) `θ_BW`, `θ₄`, and Blockwave action variants are not one canonical object; (12) assistant's “SM, GR, QM are projections” summary overclaims the direct source.

## Next deeper cursor

1. Recover primary Klein Fabric source and type the 4D object as curve, worldsheet, or 4D support.
2. Recover the direct definition of the second-order superhelix, hollow outer coil, and 3D trace; distinguish radius, diameter, pitch, arclength, and thickness.
3. Define the curve-to-worldsheet or curve-to-volume thickening map.
4. Define timesheet projection and composition coherence.
5. Reconcile native `(++++)`, Lorentzian O1/Blockwave representations, and `w=ct`.
6. Distinguish `θ₄` from `θ_BW` and identify any direct constitutive map.
7. Extend Lean only after the geometry is typed. No physical calculation without a measured system, dataset, provenance, units, uncertainties, and prediction-versus-fit separation.

## Controls

No CODATA scoring, physical calculation, BEDROCK promotion, or paper-gate advancement. All four Mersearch lanes remain occupied; no new query was created. GitHub raw-export retrieval was a bounded fallback, not a Mersearch run. HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES were consulted; no new tool, dependency, branch, PR, or Lean module was justified. FIE rereview remains due 2026-11-10. The November 9, November 30, and December 14 paper gates remain separate. Task-branch graph remains 16 declared branches versus 18 records; Tern retains reconciliation ownership.

**Companion files:** full report `enheduanna_geometry_fidelity_20261108.md` (SHA-256 `daa2a94b4f34c8f0bece842ef93a88797312e5d9759a698562c7fc2db15422ac`); plots `helix_moving_slice_3d.png`, `helix_slice_circle.png`, and `two_point_separation_comparison.png` are normalized, dimensionless schematics displayed with the report; they are not physical data or fits.
