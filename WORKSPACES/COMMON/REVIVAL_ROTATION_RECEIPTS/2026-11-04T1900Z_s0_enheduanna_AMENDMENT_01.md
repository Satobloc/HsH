# Amendment 01 | Cruller / rotation-curvature source-fidelity delta

**Parent receipt:** `2026-11-04T1900Z_s0_enheduanna.md`  
**Run key:** `REVROT3-19-20261011:595:s0`  
**Status:** INTERNAL SOURCE-FIDELITY ADDENDUM / EXISTING PUBLICATION RETAINED / NO THEORY PROMOTION

This amendment supplements the existing h595 receipt. It does not replace the existing Worldline Universality / Back Hallways / Loop-Star Map report or create a duplicate public issue.

## 1. Nominal slot and scheduler correction

The rotation is determined by the automation's `scheduled_for`, not its delayed start time:

- Scheduled nominal UTC: 2026-11-04T19:00:00Z.
- `h=595`; `seq=5*595=2975`; `2975 mod 19=11`.
- Selected ring label: Enheduanna, index 11.
- Next ring label: Tern Rook, index 12.

The current :00 automation record is run `41eca093-33b4-8324-812a-61693fa1c204`: scheduled 19:00Z, started 20:27:06Z, completed 20:52:18Z, recorded status FAILED, `chat_ref=null`, and `next_run_time=null` at readback. The automation itself remains enabled with its original ID `6aa1fe0de5e48191b886496095b1343f` and exact hourly America/New_York schedule beginning 2026-10-01T14:00 local. The separate :12 lease remains disabled. No task, ID, prompt, phase, cadence, schedule, or enabled-state change was made; no sixth task was created.

The existing h595 receipt and issue #1360 predate this amendment and were independently read back. The failed scheduler record is not treated as a successful chat delivery or as evidence of worker nonresponse.

## 2. Enheduanna source/role boundary

No standalone Nathan-authored Enheduanna specialist charter or authenticated current Enheduanna thread was recovered. The strongest direct instruction is the 2026-09-23 Nathan message `11399ca2-5bd6-4203-9e19-e8e044fbc736` in the raw Revival Rotation conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`: Enheduanna is a revival/archive case and the team should consider all archives. That is a broad archive-recovery instruction, not a narrow geometry charter. Later Enheduanna role notes are assistant-maintained reconstructions. The user-supplied Lane Charter 00 governs this source-fidelity pass.

No authenticated Enheduanna or Tern ChatGPT thread was established. The existing Tern inbox pointer and this amendment are repository surfaces only; no cross-thread delivery, consumption, or acknowledgment is claimed.

## 3. Primary Nathan Direct geometry cluster

Source: *Minkowski Ring Analysis*, conversation ID `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, raw Git blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`. The ordinary file fetch returned empty content because of blob size; the Git blob endpoint returned the full JSON. The export contains 3,677 mapping entries. The relevant messages below are on the selected ancestry unless explicitly marked otherwise.

| Exact message ID | Timestamp UTC | Nathan Direct content / status |
|---|---|---|
| `69e7e8b1-86e8-4dea-a38b-9193f7327fb5` | 2026-10-20T23:24:58.054Z | Describes the 3D universe as an instantaneous slice of a 4D worldtube. Conceptual geometry, not a defined slice/projection map. |
| `c1b42229-00a9-4119-aac3-cefa6cb97157` | 2026-10-20T23:34:44.617Z | Describes the Cruller as a toroidal 4D history with internal rotation, wrinkling/coiling/tension, filaments/bridges/Kerr-like structures, and a new worldtube/particle born with each rotation. Qualitative geometry; no embedding, metric, support dimension, or birth map supplied. |
| `f658b2db-32f0-45cd-828b-140691cc9afb` | 2026-10-20T23:53:30.041Z | Says the 4D curvature of the donut is acceleration, bending can occur without expansion, and usually both occur. Explicit epistemic qualifier: no proof, working hypothesis. |
| `090f5160-1020-486d-9c42-df3d7dff2063` | 2026-10-21T00:17:23.235Z | Mixed-source user message. Only the final direct correction is attributed to Nathan: the older reciprocal filament/timesheet-deformation model has been superseded since the Klein Fabric model became common. Do not revive the old reciprocal model or identify a new scalar resolver with Klein Fabric without a source-defined map. |
| `34f444a1-f987-4e81-a438-73b9c3463f38` | 2026-10-21T00:37:49.862Z | Direct construction-order instruction: start with the Cruller and work backward. |
| `2bef9e5d-cf4d-4cb2-959f-218e032e5263` | 2026-10-21T06:32:15.993Z | Recalls a prior worldtube-tension estimate near (10^{44}) J and a possible maximum-bending estimate. This is recollection, not an independently recovered calculation, measured input, or uncertainty-bearing physical datum. |
| `c5525f53-b7cc-4444-8102-3bf6fdb1c892` | 2026-10-21T13:55:40.205Z | States native `cw=t`, positive `++++`, and Forest Normalization; the `±(c+H0)/2` expression is explicitly tentative. The raw spelling of the normalization term is `Forest Normalizatin`. No map to the assistant's affine `w) parameter is given. |
| `59cdedb4-be76-455a-87c8-a6089de951b3` | 2026-10-21T23:53:03.096Z | Direct assertion: 3D rotation is 4D curvature; all 3D acceleration is. The message does not type rotation, acceleration, curvature, metric connection, parameter, or readout map. |

Two provenance cautions:

- `a0e0be28-5bd8-45da-9991-1e075f09728d` at 2026-10-21T06:34:36.336Z is off the selected ancestry. It recalls a prior maximum-bending calculation, but no such calculation was recovered.
- `df68cd5f-3c9a-4f1e-a864-4aa65b027f30` is an outer user-role message containing assistant-style prose and rotating/pulsating-string equations. The embedded author's identity is unresolved. Do not attribute those equations to Nathan Direct or treat them as independently verified string solutions; no action, worldsheet embedding, or boundary conditions are supplied.

## 4. Historical assistant mathematics and fidelity comparison

### A. Euclidean lifted-curve construction

Assistant messages `6f2360f0-a954-48db-9df7-cf716ddf7df3` and `2e63816a-56dc-4516-8b1c-4b1b88d9a107` propose a marked spatial path (x(w)) lifted to Euclidean four-space:

[
X(w)=(x(w),w).
]

With (v=x'(w)) and (a=x''(w)), the assistant gives:

[
kappa_4^2=
rac{(1+lVert vVert^2)lVert aVert^2-(vcdot a)^2}
{(1+lVert vVert^2)^3}.
]

This is a valid conditional Euclidean curve-curvature identity for the stated affine graph lift. It is not a definition of the full Cruller, a finite-core worldtube, a rotating material frame, or the birth of a new worldtube. The assistant's illustrative (R=10ell_P), (v=0.6c) example is not measured data and was not reused as a physical calculation.

### B. Rotation versus expansion

The existing Meridian sandbox `SANDBOX_2026-10-20_COSMOBARYGENESIS_CURVATURE_EXPANSION.md` uses a Euclidean (R^4) vector-field proposal (V=(H I+omega J)X). It shows, within that chosen model, that rotational/normal acceleration and volume expansion are separable. This is compatible with the direct working hypothesis that bending need not imply expansion. It does not derive the Cruller geometry or establish a physical cosmological mechanism.

### C. Non-affine readout / resolver-Hessian alternative

The existing Orson sandbox `SANDBOX_2026-10-05_RESOLVER_HESSIAN_ACCELERATION.md` introduces a nonlinear scalar resolver (T(X)) and a 3D projection (P). For a carrier (X(s)), it writes the observed path as (r(t)=P X(s(t))), with (t=T(X(s))). Its chain-rule decomposition includes a resolver-Hessian term. In the straight-carrier case (X''=0), the sandbox obtains a nonzero coordinate/readout acceleration when (X'^T\operatorname{Hess}(T)X'\ne0).

This is a conditional assistant model, not a Lean-verified theorem or physical mechanism. It demonstrates why the universal phrase “all 3D acceleration” needs a source-defined physical time/readout map. The old reciprocal filament/timesheet model was superseded; (T) must not be silently identified with that old timesheet or with Klein Fabric.

## 5. Typed map diagram and glossary

The following is a proposed map scaffold, not a recovered Nathan equation:

```text
material domain B × I  --ι?-->  native M⁴ (cw=t, ++++)
       |                         |
       | R(t) ∈ SO(3)?            | T:M⁴ → R ?
       v                         v
material frame / marked paths   Σ_t = T⁻¹(t)
       |                         |
       +------ worldtube W ? ----+
                    |
     distinguish: κ_curve, II(boundary/submanifold),
                  frame-connection curvature, Riemann(g)
                    |
             π_t : Σ_t → R³
                    |
        r(t) = π_t(X(s(t)))
                    |
          a_obs = d²r/dt²

worldtube/particle birth per rotation:
       β : W_n → W_(n+1) ?   [not source-defined]
```

| Term | Stable audit meaning | Missing condition |
|---|---|---|
| Cruller | Nathan's qualitative toroidal 4D history/construction | Manifold, embedding, metric, support dimension, and material labels |
| Material history | 1D worldline of a marked point | Parameter and connection |
| Worldtube | Source's finite-core/material-history object | Whether it is a full-dimensional region, a boundary, or a lower-dimensional worldvolume |
| 3D rotation | Could mean a material-frame path (R(t)\in SO(3)) or the motion of marked points | These are not interchangeable |
| Curve curvature | (\nabla_U U) for a specified curve and connection | Must not be confused with ambient Riemann curvature |
| Worldtube/boundary curvature | Second fundamental form of a specified embedded boundary or submanifold | Not defined for an unspecified full-dimensional region |
| Frame curvature | Curvature of a normal/material-frame connection | Can differ from trajectory curvature |
| Ambient Riemann curvature | Curvature of the ambient metric connection | A curved worldline can exist in a flat ambient space |
| Readout | (T:M^4\to\mathbb R), (Sigma_t=T^{-1}(t)), (pi_t:\Sigma_t\to\mathbb R^3) | No current Klein-Fabric-derived map recovered |
| Worldtube birth | A new component/event per rotation | Requires a non-invertible/topology-changing event or source/boundary rule; no mechanism supplied |
| WWRD | Climbing-rope mechanics as first-blush geometric heuristic | Not a physical equivalence |

A smooth diffeomorphic flow preserves topology; it cannot by itself create a new connected component. That is a topological constraint on any future model of the direct “birth per rotation” statement, not a proposed physical mechanism.

## 6. Discrepancy ledger

1. **Rotation type:** Nathan Direct says “3D rotation”; the assistant models a single marked point trajectory. A material-frame rotation (R(t)\in SO(3)) is not the same object as a point's worldline.
2. **Curvature type:** “4D curvature” is not typed. Curve curvature, worldtube-boundary curvature, frame-connection curvature, and ambient Riemann curvature are distinct.
3. **Acceleration scope:** the affine Euclidean lift supports a conditional relation between spatial acceleration and 4D curve curvature. The resolver-Hessian sandbox shows that nonlinear readout can produce coordinate acceleration even for a straight carrier. The universal claim therefore needs a physically privileged slicing/readout and parameterization.
4. **Object dimension:** the assistant's theorem is for a 1D curve in (R^4), not the full finite-core Cruller/worldtube.
5. **Birth/topology:** the direct “new worldtube/particle per rotation” is not represented by a single smooth helix. A source-defined creation/topology-change map is missing.
6. **Native convention:** direct `cw=t`, `++++`, and Forest Normalization are not mapped to the assistant's affine (w) lift. The tentative (c+H_0) expression is not used.
7. **Klein Fabric:** the old reciprocal filament/timesheet-deformation model is explicitly superseded. The assistant's scalar resolver is not thereby a Klein-Fabric map.
8. **Embedded synthesis:** the rotating/pulsating-string formulas in `df68cd5f` have unresolved authorship and incomplete model definitions.
9. **Historical energy recollection:** the (sim10^{44}) J worldtube-tension recollection is not a measurement or verified calculation.
10. **Published source IDs:** existing Mira report #1120 uses UUIDs that do not match the raw export for the five messages below. The public artifact was not edited in this run.

## 7. Existing report and formalization status

### Published source-ID discrepancy

The existing Mira source-fidelity report `mira-geometry-fidelity-curvature-ci-20261030t2000z.md`, blob `236534e4d06921cc1546c9d9af3685f400d110e1`, contains these non-resolving message IDs:

| Mira report ID | Correct raw-export ID |
|---|---|
| `f658b2db-1e7d-4e43-8e5d-2d86c72d0c21` | `f658b2db-32f0-45cd-828b-140691cc9afb` |
| `090f5160-7f94-4cc4-90a0-6d3c0a0a1f2b` | `090f5160-1020-486d-9c42-df3d7dff2063` |
| `c5525f53-8d17-4f08-b8a0-ef4b0d2a15f1` | `c5525f53-b7cc-4444-8102-3bf6fdb1c892` |
| `59cdedb4-5a5a-4a6e-a0a2-3a9d6f4eaa93` | `59cdedb4-be76-455a-87c8-a6089de951b3` |
| `2bef9e5d-1c1c-4c35-8c36-4f6f0b9e8a6c` | `2bef9e5d-cf4d-4cb2-959f-218e032e5263` |

The report also places the (2bef9e5d) estimate at 23:56Z; the raw message is 06:32:15.993Z. Sable's later proof-status report #1246 uses the correct IDs for (f658), (090f), and (c552), but does not anchor the stronger (59cd) assertion. This is a source-attribution defect in an already published artifact. No public correction or duplicate issue was made; any correction should use the existing publisher after independent review and Code Grurple standdown.

### Existing Lean runs

- PR #1245, head `201f428ebf63288ceb8c098ba49f2f411d1f0109`, remains OPEN/DRAFT/UNMERGED on base branch `infra/lean4-verification-20261023`. Run #41410202260/job #125161268669 completed SUCCESS on synthetic merge ref `d6ad4260...`, using Lean 4.34.0 / Lake 5.0.0 and building 8,945 jobs. The target Euclidean lifted-curve module compiled; theorem-specific axioms shown were `propext`, `Classical.choice`, and `Quot.sound`, with no `sorryAx`/admit in the retrieved log. The PR body explicitly says **MERGE-REF BUILD SUCCESS / EXACT-HEAD NOT RUN**. Tests, lint, nanoda, and the separate axiom-audit stage were skipped. The module is not on current main and has no independent review. It formalizes the conditional algebraic Euclidean curve identity, not the physical Cruller/worldtube claim or the source-to-model translation.
- PR #1189's exact-head run #41894452394/job #126800130144 succeeded for Nadir's separate projected-frame-curvature/affine-quotient work. It is not a worldtube embedding or physical rotation map; do not merge its result into this claim.
- PR #873 remains a separate failed project-level build; its conditional `F=ma` plus assumed `a=c²κ` implication does not establish the physical premise.

No new Lean code or build was executed. No new theorem is ready until the source-defined object types and maps exist. Lean checks only the formalized conditional statement, not translation fidelity or physical premises.

## 8. WWRD, publication, and physical boundary

The existing Tern WWRD geometry-fidelity audit and Aldus rope note were inspected to avoid repetition. The climbing-rope mechanics remains a first-blush geometric heuristic, not a physical equivalence. No new rope model or mechanical calculation was run.

Existing public issue #1360 remains the Worldline Universality / Back Hallways / Loop-Star Map report. Existing public curvature report #1120 and Sable proof-status report #1246 remain unchanged. No new issue, publisher submission, PR, branch, tool, package, paid service, or BEDROCK edit was created.

No physical system, measured dataset, units/uncertainties, fit, prediction, independent measurement, CODATA score, or Factory Floor plot was supplied or used. No physical calculation was performed.

## 9. Next deeper cursor

1. Recover the current Klein Fabric geometry from Nathan Direct primary sources and define its actual time/slice/readout map. Do not revive the superseded reciprocal filament/timesheet deformation.
2. Type the material domain (B), embedding (\iota:B\times I\to M^4), support dimension/boundary, and material-frame map (R(t)\in SO(3)).
3. Decide which curvature object the direct claim refers to: marked-curve curvature, boundary/second-fundamental-form curvature, frame-connection curvature, or ambient Riemann curvature.
4. Define (T:M^4\to\mathbb R), (Sigma_t=T^{-1}(t)), and (pi_t:\Sigma_t\to\mathbb R^3), with smoothness, monotonicity, transversality, and parameterization conditions.
5. Compose the maps to obtain the observed path and acceleration. Compare the affine Euclidean lift (PR #1245) with the nonlinear resolver-Hessian candidate, without identifying either with Klein Fabric.
6. Define the source mechanism for a new worldtube/particle per rotation, or retain that statement as an unmodeled hypothesis.
7. After independent review and Code Grurple standdown, correct the source IDs in the existing Mira report through the existing publisher, not a new issue.

## 10. Controls and handoff timing

- Code Grurple remains ACTIVE. No manuscript, reader route, site, task graph, or paper gate was changed.
- FIE last full review: 2026-10-27; next 14-day review due 2026-11-10.
- Last unrelated-reading break recorded in the parent receipt: SAT Mark V/TheTANGLE.txt lines 1971-2010, return cursor 2011. No redundant break repeated.
- Orson's protected cognition allocation and November 9 P1 remain untouched. November 30 P2 and December 14 P3 remain separate.
- The immediate next ring label is Tern Rook, but the h595:s1 :12 lease is disabled. The next active Tern appearance by the ring formula is h599:s0 at 2026-11-04T23:00Z, conditional on the existing :00 task running. Scheduler `next_run_time` was null at readback; do not assume execution.
- Tern's existing inbox already contains the h595 pointer. The routing correction is recorded in a separate handoff amendment and inbox addendum. Tern's inbox is repository-only; no authenticated Tern thread, chat delivery, consumption, or acknowledgment is claimed.

**Disposition:** the Cruller/rotation-curvature source cluster is now extracted and compared against historical assistant mathematics. The affine Euclidean curve identity is conditionally formalized in an existing merge-ref build; the full Cruller/worldtube claim remains untyped and unvalidated. No physical calculation, theory promotion, or duplicate publication is claimed.
