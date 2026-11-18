# Meridian h934:s0 | Nambu-Goto ratio provenance and Lean addendum

**Disposition:** ADDITIVE_SOURCE_FIDELITY / CONDITIONAL_ALGEBRA_ONLY / LEAN_PENDING / NO_PHYSICAL / NO_CODATA / NO_THEORY_PROMOTION.

## 1. Scope and non-duplication

This is a narrow addendum, not a repeat of the full Cruller or Nambu-Goto source audit.

- The detailed Nambu-Goto/worldline source-fidelity audit is already in [h838](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/nadir-h838-ng-worldline-source-fidelity-20261114-2200z-s0-001.md).
- The Cruller/worldline-curvature lineage is already covered by [h820](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/2026-11-14T0400Z_H820_S0_LANE00_CRULLER_WORLDLINE_CURVATURE_SOURCE_FIDELITY.md) and [h897](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/LOOM/2026-11-17T0900Z_H897_S0_MATERIAL_HISTORY_CURVATURE_AND_NATIVE_COORDINATE_FIDELITY.md).
- The original assistant sandbox is [issue #192](https://github.com/Satobloc/HsH/issues/192).

The new contribution is a source-provenance refinement and a Lean formalization of one algebraic identity already present in that assistant-origin sandbox. It does not derive a new physical model.

## 2. New source-provenance refinement

### Earlier transcript excerpt

HsH file LIVE CONVOS/A TYPICAL EXCHANGE.txt is a 399-line labelled transcript excerpt (Git blob SHA-1 7a2be6b0d9f95d840a36c88dc5f8228705d6416d). It contains a NATHAN-labelled request to calculate whether a rotating thread in Minkowski geometry has an oscillating transverse diameter. The excerpt has no raw conversation ID or timestamp metadata.

The request authorizes investigating the rotating-thread kinematics. It does not itself select:
- a Nambu-Goto area action;
- a string tension parameter T;
- closed-string periodic boundary conditions;
- a two-travelling-wave ansatz;
- a Kerr identification.

Those are additional modelling choices in the later assistant work.

### Raw continuation and attribution boundary

The later role-tagged conversation is Meridian Minkowski Ring Analysis, conversation ID 6ad7e9c0-e8a0-83e9-984e-94d020de3abf, raw Git blob 56a84cb85d5c386efa4ea11d322d11e95e2c7703 (3,678 mapping nodes; 112 user messages; 1,292 assistant messages).

- User-role message df68cd5f-3c9a-4f1e-a864-4aa65b027f30 relays a prior-assistant-style comparison and equations. Its outer role is user, but the embedded explanatory voice and structure are not evidence that Nathan authored those equations.
- Assistant message 8f98bc12-d9b8-41a6-89bb-9453439acd68, 2026-10-20T22:52:24Z, introduces the relation D_min = 4 a_spin.
- User messages 3edaefcf-1f7b-4a80-b5c7-eacba417cb81 and 400cadff-e6c4-49f5-96d6-7d294bda79de react to the result and ask why the minimum is folded. They establish engagement with the sandbox, not an explicit adoption of it as native H(s)H dynamics or a Kerr solution.

### Current direct geometry and supersession

The later direct messages in the same raw conversation are more authoritative for the current working geometry:

- f658b2db-32f0-45cd-828b-140691cc9afb, 2026-10-20T23:53:30Z: expanding-Minkowski geometry is the global working picture; bending/4D curvature and expansion are distinct and may coexist; no proof, working hypothesis.
- 090f5160-1020-486d-9c42-df3d7dff2063, 2026-10-21T00:17:23Z: the older reciprocal filament/timesheet deformation descriptions are no longer the active model after the Klein Fabric model became common.
- c5525f53-b7cc-4444-8102-3bf6fdb1c892, 2026-10-21T13:55:40Z: current notation includes cw=t, Forest normalization, and a ++++ native metric convention. The type and units of w remain unresolved.
- 59cdedb4-be76-455a-87c8-a6089de951b3, 2026-10-21T23:53:03Z: direct statement that 3D rotation is 4D curvature and all 3D acceleration is.

Current BEDROCK entries ND-2026-10-20-01/02 and ND-2026-10-21-02 control. In particular, they prohibit importing Nambu-Goto actions, extra tension laws, or Kerr identities as native SAT physics. The external Euclidean comparator using q=ct is not the native cw=t notation. No conversion map is supplied.

Meridian's historical direct remit also favors preserving multiple admissible solutions and ranking them by least-wildness rather than silently promoting one. The direct message 97d301cb-5174-4861-a273-ac4cc0b60d8b in the Meridian Free Build source states that multiple valid answers are expected. The NG family is one candidate model, not a unique consequence of the direct geometry.

## 3. Typed mapping diagram

~~~text
NATHAN DIRECT
Cruller / expanding-Minkowski working hypothesis
  - rotation and material-history curvature
  - expansion is distinct and may coexist
  - no proof; working hypothesis
  - Klein Fabric supersedes the older reciprocal deformation picture
                  |
                  | NO SOURCE-DEFINED MAP
                  v
ASSISTANT-ORIGIN Nambu-Goto FAMILY
flat 3+1 Minkowski, signature (-,+,+,+), c=1, chosen tension T
closed worldsheet with a two-wave ansatz
  D_min = 2 R s
  E     = 2 pi T R
  |J|   = pi T R^2 s
                  |
                  | algebraic elimination only
                  v
  D_min = 4 |J| / E = 4 a_spin  (c=1)
~~~

No map has been supplied from the NG worldsheet to the Cruller, Klein Fabric, the native cw=t/Forest/++++ frame, the SAT-O1 curve, or the Blockwave current. This diagram is a source-lineage map, not a physical equivalence.

## 4. Glossary

| Term | Meaning | Status |
|---|---|---|
| Cruller | Global expanding-Minkowski/toroidal working geometry | Nathan Direct; explicitly unproved |
| Klein Fabric | Current model name that supersedes the older reciprocal filament/timesheet description | Nathan Direct; detailed maps still open |
| cw=t | Current native notation | Nathan Direct; w type and units unresolved |
| q=ct | External Euclidean kinematic comparator | Assistant reconstruction; not native cw=t |
| NG family | Closed Nambu-Goto string family used in the assistant sandbox | Assistant-origin model choice |
| D_min | Full envelope diameter at the NG family's minimum configuration | Model-specific; not a core radius |
| a_spin | J/(M c), or J/E in c=1 units | Standard spin-length ratio; not proof of Kerr geometry |
| J^{mu nu} | Rank-two Blockwave current | Different object from NG angular momentum J |
| gamma^mu(lambda) | SAT-O1 one-parameter filament curve | Historical source object; no sweep map supplied |
| W^4 | 4D worldtube/support candidate | Separate from a 2D NG worldsheet |

## 5. Original versus translated propositions

| Source proposition | Historical translation | Fidelity result |
|---|---|---|
| Calculate the rotating-thread transverse oscillation in Minkowski geometry | Select a Nambu-Goto action, tension T, closed-string boundary conditions, and a two-wave family | Assistant model choice, not specified by the request |
| Cruller bending/curvature and expansion are distinct and may coexist | Euclidean R4 kinematic flow used as a comparator | Conditional mathematical example, not a derivation of the Cruller |
| Older reciprocal filament/timesheet deformation is superseded by Klein Fabric | Earlier reciprocal model remains in some historical summaries | Retire the older description as current; no map to Klein Fabric has been defined |
| Native notation includes cw=t and ++++ | External comparator uses q=ct and a different signature | Distinct conventions; no conversion map |
| Multiple admissible answers are expected | One NG family is displayed | One candidate only; no uniqueness result |
| The direct Cruller remains unproved | D_min = 4 a_spin is described as a notable relation | Algebraically notable inside the assistant model, not a physical or Kerr result |

## 6. Discrepancy ledger

1. **Equation authorship:** the user-role relay message df68... contains prior-assistant-style text. Its embedded equations are not classified as Nathan Direct.
2. **Action selection:** the earlier calculation request does not specify a Nambu-Goto action. The assistant selected that dynamics and its tension.
3. **Conditional ratio:** D_min = 4 J/E follows algebraically from the three NG-family expressions. It is not derived from the current Cruller or Klein Fabric geometry.
4. **Kerr boundary:** using the standard spin-length ratio does not derive the Kerr metric, its ring singularity, or a material Kerr ring.
5. **Fold versus core:** the NG family's minimum is folded, not a regular circular ring. A positive full diameter does not imply a positive regular core radius at the fold.
6. **Coordinate boundary:** the NG model uses flat 3+1 Minkowski with (-,+,+,+); the current native notation is cw=t with ++++ and unresolved w typing. No map connects them.
7. **Supersession:** the older reciprocal filament/timesheet deformation picture is not the current Klein Fabric description.
8. **SAT-O1 distinction:** SAT-O1 supplies a 1D curve and line action, not the NG worldsheet area action.
9. **Blockwave distinction:** Blockwave's J^{mu nu} is a rank-two current, not the NG model's angular momentum J.
10. **No physical evidence:** no measured system, dataset, units/uncertainties, prediction, fit, or independent observation supports the NG ratio as a physical relation.

## 7. Original equation custody

### SAT-O1 original

Historical unbylined source; archive index dates 2025-06-07 and 2025-06-09, timezone unspecified. Git blob SHA-1 7577aa1ee5a6c3850ce3b226c75377de6367aedc; previously source-custodied SHA-256 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937; 3,521 bytes.

Verbatim curve and action:

~~~text
gamma^mu(lambda) = (lambda,
  A_x sin(k_x lambda + phi_x),
  A_y sin(k_y lambda + phi_y),
  A_z sin(k_z lambda + phi_z))

S[gamma] = integral d lambda L(gamma^mu, v^mu)
L = 1/2 m v^mu v_mu - V_tension(gamma)
~~~

This is a one-parameter curve and line-action expression. It does not define the NG area action or the missing sweep/thickening map to a 4D support.

### Blockwave attachment

User-supplied attachment event 2025-09-16T16:31:26.687Z. Git blob SHA-1 ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d; previously source-custodied SHA-256 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664; 24,627 characters. Embedded authorship is unresolved; the prose is assistant-voice and is not treated as Nathan Direct equation authorship.

Verbatim core current equations:

~~~text
J^{mu nu} = 1/2 epsilon^{mu nu rho sigma} nabla_rho B_sigma
nabla_mu J^{mu nu} = 0
~~~

The attachment's longer compact action has malformed tokens/indices in the recovered text and is not repaired here. Its rank-two current is not the NG angular momentum J.

**Corrected equations: NONE.** SAT-O1 and Blockwave originals were not edited. The NG-family equations remain a separate assistant-origin sandbox.

## 8. Lean formalization

A small conditional algebraic module was added on the existing formal-verification branch, not to main:

- [Draft PR #2023](https://github.com/Satobloc/HsH/pull/2023)
- Module: FORMAL_VERIFICATION/HsHVerification/MeridianNGRatioIdentity.lean
- Branch: formalization/meridian-ng-ratio-h934-20261118t2200z
- Base branch: infra/lean4-verification-20261023
- Corrected head at last check: e3ff045 (full commit SHA is in the PR).
- Exact-head CI run #44419170613 is IN_PROGRESS. The prior two exact-head runs exposed implementation mistakes in this new module: first a missing noncomputable section, then a missing closing end. Both were corrected. No successful compile is claimed yet.
- Local Lean/Lake/Elan are not installed.
- The theorem only proves the algebraic identity from the supplied definitions. It does not prove the Nambu-Goto equations, the family solution, the Kerr correspondence, the Cruller map, or physical truth.
- No Factory Floor submission is made: this is an algebraic identity with no source-faithful geometric plot or physical system.

The existing PR #1245 is a draft whose successful run is a merge-reference build, not an exact-head run. PR #1785's separate failure occurs in its own changed geometry module. Neither is substituted for the current PR's exact-head check.

## 9. Research and tooling check

- Mersearch is unavailable in this run. All four request lanes remain occupied; expected compact result receipts/manifests were not found at their prescribed paths. No lane was overwritten or retriggered.
- Bounded GitHub fallback was used in HsH and the SAT archive. HSH_RESOURCES orientation, AI-start, and tool-chest indexes were read; no private prior-art payload was opened. This is not claimed as complete Mersearch coverage across all three repositories.
- Existing Whirligig Kernel 0 was inspected and is a bounded sandbox, not a general solver.
- Math Hopper references/issues #578 and #854 are present in the resource index.
- SciSpace functions are available but were not needed for this source-attribution task.
- Fork enumeration through the available GitHub endpoint returned HTTP 400; fork count is unverified.
- No new tool, dependency, subscription, or cost was introduced.

## 10. Operational disposition and next cursor

The explicit Lane Charter 00 in this run was treated as a one-run source-fidelity overlay. Meridian's standing P0 assignment remains unchanged: Paper A/B presentation QA only. P0 Code Grurple remains ACTIVE; no route probe, manuscript edit, or presentation repair was attempted. P1 Nov 9 remains OVERDUE / NOT READY; P2 Nov 30 HOLD; P3 Dec 14 INCOMPLETE. FIE review is next due November 24.

The current main branch was read at e9b9d476e3a06b6f8b3d7a5f80f2a55e0bbd42c1 before publication. The task branch graph remains ACTIVE_SEED; its declared branch_count is 16 while the branches array has 18 entries. No graph change was made.

The unrelated reading break advanced SAT archive “fun break - lx.txt” from lines 2401-2440; next cursor 2441.

**Next deeper cursor:**
1. Check exact-head Lean run #44419170613 and record its actual result.
2. If the algebraic theorem compiles, retain it strictly as an assistant-sandbox identity. Do not promote it to Kerr, Cruller, Klein Fabric, SAT-O1, or Blockwave physics.
3. Recover the raw original conversation behind “A TYPICAL EXCHANGE.txt” if it exists. The current transcript excerpt has no raw ID or timestamp.
4. Define a source-backed map from Klein Fabric/native cw=t geometry to any proposed worldtube or worldsheet before claiming equivalence.
5. No physical calculation until an identifiable measured system, dataset, provenance, units, uncertainties, and prediction-versus-fit separation are available.
