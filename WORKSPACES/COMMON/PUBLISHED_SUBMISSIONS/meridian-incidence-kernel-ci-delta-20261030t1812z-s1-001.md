# Meridian :12 — SAT-O / Blockwave incidence kernel and CI delta

**Status:** additive recovery note; not a theory promotion, canonicalization, merge request, or physical validation.

**Rotation key:** `REVROT3-19-20261011:474:s1`  
**Nominal slot:** 2026-10-30 18:12 UTC  
**Selection calculation:** (h=474), (seq=5h+1=2371), (2371\bmod19=15): **Meridian**; next index 16: **Mercer**.  
**Predecessor consumed:** Kestrel's 18:00Z handoff to Meridian.  
**Successor:** Mercer, 18:24Z slot. Ravel's 18:25Z handoff correctly marked this Meridian receipt as missing/in-flight; this receipt and the paired handoff close that gap.

## What this adds

This note is deliberately additive to the already-published source work:

- [Mercer source-fidelity report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-sat-o-blockwave-whirligig-source-fidelity-20261030t0312z-s1-001.md)
- [Loom Blockwave speaker/UV ledger](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/tagging_ledgers/2026-10-28-LOOM-BLOCKWAVE-UV-SPEAKER-CONTRADICTION-01.md)
- [Kestrel one-core/worldtube handoff report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-one-core-worldtube-inertia-20261030t1800z-001.md)
- [Nadir worldline/timesheet recovery note](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/NADIR_VOSS/2026-10-30T1712Z_WORLDLINE_TIMESHEET_READOUT_RECOVERY.md)

The new work here is the **typed incidence/readout synthesis**, the exact current-head Lean/CI delta, and a provenance correction for the embedded 2025 mass discussion. No source inventory from the earlier reports is being republished as new.

## Mersearch-first recovery record

The existing lane-4 request was `alberr-sat-o-worldline-timesheet-interbraid-20261030-1212`, not a new Meridian request. It searched all three roots: `SAT_THEORY_ARCHIVE_2023-25`, `HsH`, and `HSH_RESOURCES`.

- 15,592 files and 20,809,012 records scanned; 3,276 hits across 444 distinct source paths.
- [Run manifest](https://github.com/Satobloc/HsH/blob/main/indexes/mersearch_requests/alberr-sat-o-worldline-timesheet-interbraid-20261030-1212/RUN_MANIFEST.json), blob `15dc51969036c07aee88a837b0c048244a9d7a6f`.
- [Compact search receipt](https://github.com/Satobloc/HsH/blob/main/indexes/mersearch_requests/alberr-sat-o-worldline-timesheet-interbraid-20261030-1212/SEARCH_RECEIPT.json), blob `1ea0faee051b38e689ba434cefdc3fb15840e876`.
- Underlying `SEARCH_RESULTS.json` SHA-256: `0e3a8aafdfce9080e1ba5146cbd22cef59b7c7da0ea7a3da6e2674cdb9e07d77`; raw result files were deliberately withheld from the public tree. The receipt explicitly says it is a lexical navigation summary, not an exhaustive or semantic ranking.
- The stable searcher ref was `mersearch-stable-1.0`, commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`. A runtime-only hotfix injected the missing `TOOL_NAME/TOOL_VERSION` constants; the stable branch was not changed.
- All four shared request lanes were occupied. No new request was opened and no lane was overwritten. Direct reads below are a bounded source pass, not a claim that all 444 paths were individually read.

## Minimal typed representation

The current source-faithful minimum is an **incidence/readout kernel**, not a field action:

1. **(K):** the 4D fabric/carrier (the current Klein-Fabric framing). Do not assume a Lorentzian metric at this layer.
2. **(W_i\subseteq K):** finite-core 4D worldtube histories. A source-level (gamma_i) may be used as a one-dimensional generator/spine of (W_i), but it is not a second physical core. The hollow outer coil is an envelope/geometry of the same object, not another core.
3. **(Sigma_\tau\subseteq K):** a family of 3D resolving/simultaneity slices derived from (K). The later Klein-Fabric correction supersedes the older picture of two independent, reciprocally deforming filament and timesheet objects.
4. **(Pi_\tau):** the source-defined incidence/projection/readout map from (W_i) to its 3D trace. The minimal set-theoretic instance is (W_i\cap\Sigma_\tau), but the physical operator (intersection, projection, or another typed map) is not yet fixed by a primary source.
5. **(B(W_i,W_j)):** an optional interbraid/topological constraint relation for interacting worldtubes. Keep it as a relation/coupling, not an invented independent force law.
6. **(U):** an optional responsive-medium state, with a separate constitutive coupling (C(W,U)) only if a source-derived law is recovered. The medium is not part of the minimal core.
7. **(O):** an observable/readout map downstream of the slice trace.

No metric, action, current degree, charge normalization, or medium constitutive law is selected by this representation. It preserves the user's one-core/3D-slice geometry while leaving the disputed equation layer open.

### Structural invariants and composition

- For a fixed slice, the incidence trace lies in both the support and the slice: (W\cap\Sigma\subseteq W) and (W\cap\Sigma\subseteq\Sigma).
- Slice incidence distributes over unions: ((A\cup B)\cap\Sigma=(A\cap\Sigma)\cup(B\cap\Sigma)).
- For a map (p), (p(A\cap B)\subseteq p(A)\cap p(B)); equality needs injectivity (or an equivalent fiber condition).
- A nonempty admissible extension disjoint from a single slice is invisible to that slice. Therefore a single 3D trace does not uniquely determine the 4D support.
- A downstream readout cannot recover distinctions already erased upstream. Injectivity of a composition requires injectivity of each relevant stage, or a clearly specified quotient/equivalence relation.
- Gauge equivalence is **not yet defined** for the SAT worldtube/slice map. The existing Lean results establish injectivity conditions, not a SAT gauge quotient.

Composition is therefore (K\to W_i\to\Pi_\tau(W_i)\to O(\Pi_\tau(W_i),U)), with (B(W_i,W_j)) between worldtubes when an interbraid is present. This is a typed interface, not a dynamical law.

## Compiled Lean evidence and current CI state

The verification project pins Lean 4.34.0 and Mathlib v4.34.0 in `FORMAL_VERIFICATION/lakefile.toml`. A `lake-manifest.json` is not committed, so the transitive dependency graph is not fully frozen. Local `lean` and `lake` executables are absent; all compilation claims below are from actual Actions logs. No new theorem was authored in this run.

| Module | Exact-head run | Result and boundary |
|---|---:|---|
| `CalderWorldtubeTimesheetIncidence` in PR [#1061](https://github.com/Satobloc/HsH/pull/1061) | [41032035940](https://github.com/Satobloc/HsH/actions/runs/41032035940) | **Module built** on the exact PR head although the overall PR failed elsewhere. It proves the generic slice/intersection and off-slice non-injectivity statements; no `sorryAx` was reported for this module. |
| `KestrelProjectedIncidence` in PR [#873](https://github.com/Satobloc/HsH/pull/873) | [41107163339](https://github.com/Satobloc/HsH/actions/runs/41107163339) | **Module built** on the exact current head although the overall PR failed in another module. It proves forward image/intersection inclusion and the injectivity condition for reverse lifting. |
| `KestrelReadoutComposition` in PR [#846](https://github.com/Satobloc/HsH/pull/846) | [40902356693](https://github.com/Satobloc/HsH/actions/runs/40902356693) | Green. It formalizes non-injectivity surviving downstream readout and the injectivity requirements for composition. |
| `MeridianUIOrigin` in PR [#750](https://github.com/Satobloc/HsH/pull/750) | [40996878087](https://github.com/Satobloc/HsH/actions/runs/40996878087) | Green. The two added algebraic results, `antisymmetric_contraction_is_tangent` and `antisymmetric_pairing_uses_only_antisymmetric_derivative`, compiled. The candidate map (j^\mu_\Sigma=J_{ws}^{\mu\nu}n_\nu) is a worker-derived bridge candidate, **not Nathan Direct**; the module does not define the worldsheet support, covariant derivative, charge normalization, or EM coupling. |
| `WorldtubeInertiaCoordinate` in PR #873 | [41107163339](https://github.com/Satobloc/HsH/actions/runs/41107163339) | Built. The (F=ma, a=c^2\kappa\Rightarrow F=mc^2\kappa) identity is conditional algebra, not a derivation of the physical acceleration/curvature map. |
| `AldusBlockwaveIdealSign` in PR [#1059](https://github.com/Satobloc/HsH/pull/1059) | [40985335092](https://github.com/Satobloc/HsH/actions/runs/40985335092) | Green. Conditional sign audit: under the stated Lorentzian ((-+++)) convention and the source Lagrangian's positive scalar-gradient term, the printed canonical-momentum sign disagrees with the derivative of that Lagrangian. This audits that historical action only; it does not validate SAT physics. |

**Current red runs, not stale PR-body claims:**

- PR #873 exact head `6c1d377ddfe62ade0f052599742bc3209eaa09a8` failed in `KestrelKelvinVortexReadout.lean`: line 32 requires a noncomputable definition for the real division; line 51 has a redundant tactic (`No goals to be solved`). The projection and inertia-coordinate modules built before that failure. The PR body still cites an older successful run; that is not the current-head status.
- PR #1061 exact head `8b428c5151228dc7e08e94c18e0621fe789f90e0` failed in `CalderObliqueTubeSlice` on a noncomputable `Real.sqrt` and unsolved goals; other theorems in that separate module report `sorryAx`. The incidence module itself built. These are other workers' branches; no edits were made.

The existing `MeridianUIOrigin` module is the only current candidate that bridges a 2-form worldsheet current to a slice-tangent vector by contraction with a slice normal. It does **not** solve the underlying support mismatch: a 1D curve in 4D, a 2D worldsheet in 4D, and a 4D finite-core worldtube require distinct current/support definitions.

## Source-fidelity delta

This section preserves the strongest provenance distinctions without duplicating the full earlier source audit.

- **Early direct geometry:** the 2024-03-22 `DIMENSIONAL GRAVITY` raw conversation (blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`) contains user-role constructions of 1D lines/filaments intersecting a moving higher-dimensional time surface. Historical geometry, not a finished action.
- **aSAT test, not canonical SAT:** the 2025-05-04 `Fundamental Physics Explanations` raw conversation (blob `9bcd42a355d05ebbbe6b6edec9744d1409d0cfd9`, user message `2b40efe6-eea0-49f4-a15a-6d6518a6afdc`) explicitly frames an alternate `aSAT` view of particles as intersections of 4D filament-like structures and a time wavefront. Do not silently promote that test framing to canonical SAT.
- **Header-attributed historical draft:** [`SAT4D_LIVE_DRAFT.txt`](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/50ce2aad8f8969275886ee5308669b6c2097c599/SATOBLOC/SAT4D_LIVE_DRAFT.txt), blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`, carries a Nathan McKnight / June 2025 header. It defines a 1D `gamma : R -> R^(3,1)`, describes a 4D worldtube volume, and uses an action with an explicit mass parameter and tension potential. The related [`SAT O1 4D.txt`](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/50ce2aad8f8969275886ee5308669b6c2097c599/SATOBLOC/SAT%20O1%204D.txt), blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, has no independent author metadata. Treat both as historical source material, not the current final action.
- **Mass discussion provenance:** the 2025-10-24 `Mass in SAT framework` raw export (blob `98237bd471553aa43ae5045dbe35a42a7267543d`, user message `79bf888c-de7c-4c1c-8617-5e1b49250af2`) is a single user-role message containing five provenance spans. The massless-filament/timesheet and drag framing occurs in a quoted earlier Nathan question: probable Nathan-authored wording, but not independently recovered as its own raw turn. The message then embeds a NotebookLM answer that adds topological-strain, tension, and coefficient formulas. A later quoted Nathan follow-up asks whether intrinsic drag exists and whether a friction coefficient has been established. No source-authenticated coefficient or constitutive drag law was found.
- **Assistant-generated Blockwave action:** the 2025-10-19 `Full action definitions` raw conversation (blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`) contains an assistant-generated action with a two-form/worldsheet current (J^{\mu\nu}). The assistant's later message `68759291-6e2c-4f72-b9f1-7c7d8a9b0c11` notes that (A_\mu=\alpha\nabla_\mu\theta) makes (F=dA) vanish locally for smooth (	heta). The user later repasting the action for review does not change its original authorship.
- **Unattributed/derived Blockwave files:** [`SAT—Blockwave Ideal Model.txt`](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT%E2%80%94Blockwave%20Ideal%20Model.txt), blob `dd0631bc0b25c951dc5e1d6738280e08487b46b2`, has no authenticated Nathan author and uses a Lorentzian ((-+++)) metric with (g,u,\theta) fields. [`🧱BLOCKWAVE.txt`](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/%F0%9F%A7%B1BLOCKWAVE.txt), blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, is assistant-generated and adds a two-form current and medium-response tensor. The [Blockwave extension](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE%20EXTENSION%20.txt), blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`, is a derived branch.
- **User-carried 3-form action:** the 2026-02-25 `0.239 Radians in Science` raw message (blob `67702fc58b0efce1d0f89d950b86a8819a189afb`, message `15338421-a5e7-4538-879a-d25d840d2bdd`) carries a pasted action that treats 1D worldlines as a conserved three-form (J_{\mu\nu\rho}). The outer role is user, but the pasted document's author is not established. Its unit-sensitive claims are not validated.
- **Current geometry source:** [`Meridian Free Build`](https://github.com/Satobloc/HsH/blob/main/LIVE%20CONVOS/26.10.05%E2%80%A226.10.20%E2%80%A2Meridian%20Free%20Build%20%E2%80%94%20raw.json), blob `7af1561b321f4d9364da5eb111df689efc652827`, has direct user-role messages `6f00a97a-aa84-45bf-9429-4ff70736014a`, `3c657387-b80b-4982-a61a-8e6d8568b8d1`, `5a929b5e-515e-4f77-a32a-e49feef42812`, and `1178f25c-9f92-4d1c-b43b-06482e6bf1b1`: one physical core, a hollow larger coil rather than a second core, worldtube resistance-to-change as the inertia interpretation, and a 3D slice/bulk overlap rather than an inert 2D sheet.
- **Klein-Fabric correction:** [`Meridian Minkowski Ring Analysis`](https://github.com/Satobloc/HsH/blob/main/LIVE%20CONVOS/26.10.20%E2%80%A226.10.21%E2%80%A2Meridian%20Minkowski%20Ring%20Analysis%20%E2%80%94%20raw.json), blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`, contains a user-role mixed-source annotation (`090f5160-1020-486d-9c42-df3d7dff2063)) that the earlier separate, reciprocally deforming filament/timesheet model is superseded by the common Klein-Fabric framing. It is an annotation, not a clean verbatim raw statement.
- The exact raw turn for the remembered phrase “time distance is spatial distance / w-vector” was not recovered in this pass; do not cite it as a located primary message.

The resulting type warning is material: the SAT4D draft uses a Dirac/vector current (J^\mu); assistant Blockwave uses a two-form (J^{\mu\nu}) associated with a worldsheet; the user-carried 0.239 text uses a three-form (J_{\mu\nu\rho}). A one-dimensional support in four dimensions and a two-dimensional worldsheet do not have the same Poincare-dual current degree. No primary source currently defines a unique map from the current finite-core (W/\gamma) to any of these (J)'s. The Lorentzian Blockwave action also cannot be silently merged with Meridian's native positive-definite 4D framing without an explicit map.

## Existing tools and environment

- [Math Hopper extractor](https://github.com/Satobloc/HsH/blob/main/tools/archive_math_hopper.py) v0.1.0 is extraction/provenance tooling, not a proof engine. PR [#991](https://github.com/Satobloc/HsH/pull/991) exact-head smoke run [40841280647](https://github.com/Satobloc/HsH/actions/runs/40841280647) is green. The bounded three-repository pilot workflow is present (read-only, 100-file cap per repository, 25 MB per file), but its execution was not independently verified because the connector did not expose the unfiltered push/workflow run listing.
- The existing [Whirligig R/Q contract](https://github.com/Satobloc/HsH/blob/main/tools/whirligig_rq/README.md) is a procedural 3D equation-to-curve mapper requiring an explicit branch, observables, and parameter interval; it is not a universal inverse.
- The [Meridian solver harness](https://github.com/Satobloc/HsH/tree/main/WORKSPACES/MERIDIAN/SOLVER_HARNESS) is a finite 3D control harness. Its analytic fixture is not physical validation and was not used for a physics calculation.
- Repository metadata reports zero forks; the fork-list endpoint was rejected by the connector allowlist, so no fork-by-fork inventory is claimed.
- SciSpace is available as a connected research tool; it was not needed for this internal provenance/Lean audit. No new software or plugin was installed.

## Control and priority guardrails

- Live [BEDROCK](https://github.com/Satobloc/HsH/blob/main/BEDROCK.md) SHA: `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`; [Steering Charter](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/STEERING_CHARTER_2026-10-26.md) SHA: `5f4263381afcb065e9062d5b5885593d0baa58db`; [Three Paper Campaign](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/THREE_PAPER_CAMPAIGN_2026-10-26.md) SHA: `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`.
- Revival rotation, thread routing, and worker autonomy protocol were read. The Meridian workspace has no separate README/ROLE_CHARTER in its current listing; the role was reconstructed from the current [trial checkpoint](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/TRIAL_CHECKPOINT.md), [current spine](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/MERIDIAN_CURRENT_SPINE_2026-10-05.md), [continuity](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/MERIDIAN_CONTINUITY_2026-10-21_CRULLER_NLM_ROTATION.md), and solver-harness README. No authenticated original Meridian chat thread was accessed.
- [Task branch graph](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/TASK_BRANCH_GRAPH.json), updated 2026-10-30T06:12Z, keeps HAGALAZ active but **BACKSEAT/HOLD** under Code Grurple. No branch, PR, merge, graph promotion, or BEDROCK edit was made.
- Orson's P1 cognition work for Nov 9 remains protected; P2 Nov 30 and P3 Dec 14 are unchanged. No general-physics task was pushed into Orson's specialization.
- FIE was reread on Oct 27, fewer than 14 days ago. Nadir's preceding 17:12Z run completed the unrelated Babbage reading through lines 431–480, next cursor 481; no duplicate lateral read was forced here.
- No physical-system calculation was performed. No new Lean proof was authored. No task ID, enabled state, hourly :12 Eastern schedule, or automation recurrence was changed. No cross-chat delivery is claimed. Tern remains comptroller.

## Handoff to Mercer

1. Continue from the typed ((K,W,\Sigma,\Pi,O)) contract and the compiled incidence/readout propositions; do not repeat the already-published Mercer/Kestrel source inventory.
2. Resolve the support-to-current map before selecting (J): distinguish a 1D curve/current, a 2D worldsheet current, and a finite-core 4D worldtube. The existing (j_\Sigma=J_{ws}\cdot n) is a candidate slice map, not a source-authenticated SAT law.
3. Define the admissible gauge/equivalence quotient and the coverage condition required for a full-slice reconstruction. The all-slice uniqueness theorem remains uncompiled; do not report it as proved.
4. Keep the responsive medium optional until its constitutive map is sourced. Do not import the assistant-generated Blockwave (M) tensor as Nathan Direct.
5. Preserve the current PR states and failure logs. No physical calculation without a real measured system, units, provenance, uncertainty, and the required permission where applicable.

**Handoff mode:** repository artifact only. No original worker-thread access or cross-chat delivery is claimed.
