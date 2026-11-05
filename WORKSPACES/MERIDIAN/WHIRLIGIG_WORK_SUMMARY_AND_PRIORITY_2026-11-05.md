# Whirligig | Work summary and priority reset | 2026-11-05

**Status:** ACTIVE / SECOND-TIER PRIORITY / SANDBOXED RESEARCH AND INSTRUMENT DEVELOPMENT  
**Priority:** Below core theory and its mandatory geometry/evidence gates; above general LLM-cognition and general provenance/archival work.  
**Likely specialist fit:** Mira for braid/topology translation, citation, bibliography, and cross-formalism interpretation, subject to the existing quarantine/access gate. Meridian is the engineering/solver counterpart for configurable kinematics and geometry.  
**Authority:** Nathan Direct, 2026-11-05.

## 1. What was checked

### A. Historical hostile reviews and author responses

- [Issue #23 — Meridian hostile peer review](https://github.com/Satobloc/HsH/issues/23): Meridian's independent first-pass review recommended **MAJOR REVISION**. It verified the inverse-forced orbit, Euler–Lagrange equation, positive Hessian, and half-turn Fourier selection rule. It identified the λ=0 counterexample: the parity rule remains while cross-plane response vanishes. It rejected claims of general physical isomorphism and initially noted a comparator-text access limitation.
- [Issue #23 follow-up](https://github.com/Satobloc/HsH/issues/23#issuecomment-6108317830): Meridian later located and read the full 26-page Asselmeyer-Maluga (2019) extraction. The comparator access blocker was closed; the **MAJOR REVISION** verdict remained.
- [Issue #24 — Mercer hostile peer review](https://github.com/Satobloc/HsH/issues/24): Mercer independently checked the full 9,440-character Whirligig draft including v0.2/v0.3. Recommendation: **MAJOR REVISION** for a physics-comparison paper. It independently reproduced the 64-node Fourier calculation, with relative residual (6.0920\times10^{-13}), first-plane harmonic-3 amplitude 0.07535009021913369, second-plane harmonic-2 amplitude 0.14955851240473828, and forbidden-parity modes at approximately (4.14\times10^{-14}). It also identified the topological boundary: π₁(S³)=0, so winding is protected only inside the imposed Clifford torus, not under arbitrary S³ deformations. The sidebands are conditional classical elastic mode conversion, not braiding Berry holonomy or observed physics.
- [Issue #24 author update](https://github.com/Satobloc/HsH/issues/24#issuecomment-6071063970): the v0.2 rank-one interplane coupling and half-turn parity result were explicitly submitted for review; no review was presumed at that point. Mercer's later comment supplied the independent review above.
- [Mira's Whirligig two-frequency and mass-bridge audit, issue #248](https://github.com/Satobloc/HsH/issues/248): the published audit finds the unequal-frequency stationary claim false for the uncoupled constant-radius action, verifies the corrected algebraic coefficient (512\pi^5/81), and finds the historical positive mass bridge inconsistent with 2022 CODATA. The audit is explicitly historical mathematical recovery / sandbox, not empirical proof or BEDROCK promotion. Exact algebra was checked in executed Python.
- [Issue #1330, Meridian candidate sets and cognitive event projections](https://github.com/Satobloc/HsH/issues/1330): this is a source-grounded methodological note, not a review or implementation of the configurable browser branch. Its two comments are a publisher/readback receipt and a correction that PR #895's CI was a merge-reference build, not exact-head-only. No independent reviewer response to the Nov 2 configurable-kinematics branch was found in this check.

### B. Configurable browser instrument branch

The branch [whirligig-configurable-kinematics-2026-11-02](https://github.com/Satobloc/HsH/tree/whirligig-configurable-kinematics-2026-11-02) contains:
- `WORKSPACES/MERIDIAN/WHIRLIGIG_CONFIGURABLE_KINEMATICS_SPEC_2026-11-02.md`
- `PUBLIC_SITE/instruments/whirligig/presets/factory-reference-2026-11-02.json`

The specification separates geometry, kinematics, constraints, presentation, and evidence. It requires a versioned configuration object, immutable factory reference, explicit degrees of freedom, underdetermination reporting when a released constraint lacks an evolution law, preset persistence, diagnostics, and regression tests.

The spec records the current equal-area Analemma / inner-wall reference separately from the older outer-wall standalone Python R/Q solver. It also records the user's Viviani/pole-kissing clarification and a model-derived pole-kissing stretched-curve candidate. The candidate is not user-approved and its numerical self-intersection scan is not a symbolic global proof. Classical Viviani, the equal-area reference, and the stretched pole-kissing candidate must remain distinct modes.

**Implementation boundary:** the two branch files were committed and read back in the prior work. The existing browser application was not yet modified by that branch commit, and no live ChatGPT Sites deployment was verified. The branch spec is not evidence that its proposed controls exist in the running instrument.

## 2. Consolidated findings

1. The existing Whirligig elastic/SO(4) work contains reproducible mathematical results, but its strongest claims are conditional on the declared action, forcing, constraints, and parameter regime.
2. The half-turn symmetry gives a valid parity selection rule. It does not guarantee nonzero cross-plane transfer.
3. The Clifford-torus winding labels are not invariants under arbitrary deformations in (S^3); do not equate the result with protected braid topology or non-Abelian Berry/Wilczek–Zee transport.
4. Inverse-designed forcing establishes a manufactured stationary solution, not an independent apparatus prediction.
5. The mass bridge fails its own CODATA comparison; the exact coefficient error is fourfold, and the historical positive bridge has the wrong direction and insufficient magnitude.
6. The configurable browser instrument is a separate engineering track. It must not inherit conclusions from the elastic benchmark or the legacy Python solver.
7. The Nov 2 alternate Analemma work needs geometric inspection and independent hostile review before acceptance. In particular, preserve the exact transverse equatorial crossing, pole-tip tangencies, and opposite oriented tangent vectors; do not replace these with an arbitrary visual stretch.

## 3. Priority and ownership

**Priority reset:** Whirligig is a moderate, second-tier project priority. Core theory remains above it. Whirligig now sits above general LLM-cognition and general provenance/archival work in the discretionary project queue. This does not override the active Code Grurple emergency publication interlock, paper deadlines, BEDROCK, real-data-first rules, geometry-first gates, or specialist access controls.

**Mira:** likely best fit for braid/topology translation, citation, bibliography, and mathematical crosswalk. This is a provisional lane-fit only. Current operational records keep Mira outside the active internal-review corpus under quarantine; only cleared operational answers may cross. No Mira inbox was accessed, no private/quarantined source was opened or transferred, and no new assignment was delivered to an authenticated Mira thread. Do not treat this priority note as clearance.

**Meridian:** engineering/solver counterpart for configurable kinematics, geometry providers, constraints, and reproducible numerical comparisons.

**Independent review:** Mercer/Meridian review findings remain separate; no consensus or physical validation is inferred.

## 4. Next work, in order

1. Preserve the existing factory-reference preset and current browser behavior as a regression baseline.
2. Implement the versioned configuration/constraint-state engine without changing the rendering first.
3. Add preset save/load/import/export and dependency recomputation; released degrees of freedom must be explicit or marked underdetermined.
4. Add the curve-provider interface and analytic/numerical diagnostics. Keep pole-to-pole modes disabled until their geometry is specified and passes the interface.
5. Add the independent second-crossbar mechanism as a distinct variant; do not assume wobble amplification, projector orientation, or trace reconnection.
6. Run regression comparisons against the original browser reference, then hostile geometry review of exact plots/files.
7. Keep the older R/Q solver, elastic back-hallway benchmark, and browser instrument separately versioned and separately described.
8. Revisit braid/topology translation and external comparators only through the permitted source/provenance path and after the Mira access boundary is cleared.

## 5. Nonclaims and controls

- No BEDROCK promotion, physical equivalence, empirical validation, or Factory Floor admission.
- No live-site deployment or browser implementation completion claimed.
- No new scheduler task, recurrence, or worker prompt created.
- No Mira access/quarantine boundary changed.
- No existing factory reference or main-branch implementation changed by this priority update.

**Return cursor:** configurable branch specification → configuration/constraint-state engine → reference regression → geometry-first hostile review → only then alternate mechanism promotion.
