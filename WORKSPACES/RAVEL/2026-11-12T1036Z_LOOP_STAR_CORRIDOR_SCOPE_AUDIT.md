# Loop/Star corridor scope: partial and branched maps versus closed transport

**Status:** source-grounded architecture addendum. This is not a new physical mechanism, not a completed Klein topology, and not a measured prediction.

**Relationship:** additive to the published Back Hallways source-fidelity note [#1248](https://github.com/Satobloc/HsH/issues/1248) and the existing Ravel conversion-coherence formalization in [PR #1133](https://github.com/Satobloc/HsH/pull/1133). This note does not repeat the fibered-support audit or claim that a mathematical corridor is a physical tube.

## 1. Source record and epistemic status

### Direct historical remit

The recovered Ravel archive is conversation 6a9d1a23-4fac-83ea-b76f-6805ece3ee9f, raw Git blob 17cfe3feb830f70009557d063482b35adba0834b. Direct user-role messages dated September 7-13, 2026 assign Ravel a primary co-theorist role: conceptual cohesion, drift detection, epistemic hygiene, full-theory probing, neglected assumptions, methodological risks, and source-grounded public-record accuracy. This is a historical remit, not an authenticated current Ravel thread.

### The relevant geometry and corridor chronology

- In the August 26, 2026 Calder conversation 6a8eacca-c470-83ea-af92-8fb8df194de9, raw blob 92454acdaad701193e2a0c6cf64a7d7b70a03dbb, direct user message 062ad8ee-8a0d-4e8e-9b2a-2a0a0f1f0f0f is on the current message ancestry. It describes a Klein-bottle fabric with worldtubes as twisted ER-bridge structures and a larger-scale Klein throat. This is an exploratory source proposal, not a completed topology, metric, or independent observation.
- Earlier dual-shell/local-flat-space speculation in that conversation occurs on off-current branches. A later direct user message in Meridian Free Build, 30f1e4cc-4a3c-4012-bc6c-6a337703fcd2 (October 7), explicitly flags dual-shell errors. The current BEDROCK treats a three-dimensional simultaneity surface as a slice of four-dimensional geometry, not a second physical shell.
- Direct user message 3c657387-b80b-4982-a61a-8e6d8568b8d1 (Meridian Free Build, October 9) uses w=ct as a time-length scale in meters.
- Direct user message 090f5160-1020-486d-9c42-df3d7dff2063 (Minkowski Ring Analysis, October 21) says the earlier reciprocal filament/timesheet-deformation construction is no longer current and clarifies that the Back Hallways are metaphorical mathematical corridors.
- Direct user message 47cf2603-bf28-439c-82b3-1f0e0c2a7dc8 (October 21) says Back Hallways should not be mistaken for fresh SAT; its formalism is different and predates the Forest. The Loop and later Star-Shaped Derivation Map are described as the conceptual programme, not as a completed equation set.
- Direct user message c5525f53-b7cc-4444-8102-3bf6fdb1c892 (October 21) records the strings cw=t, Forest Normalizatin, and (++++), while calling the (c+H0)/2 expression tentative. The earlier w=ct and later cw=t are preserved as an unresolved source-level notation conflict. No coordinate conversion, metric signature, or unit normalization is inferred from these strings.

The current BEDROCK preserves a finite-core worldtube as a working construction target, treats the global toroidal/cruller-like topology as incomplete, and states that changes in slice-intersection component count do not by themselves establish physical creation. The historical mutual-accommodation language is not silently promoted into the retired reciprocal-deformation formalism. Current interbraid/back-tug language remains a model commitment, but its constitutive and observable maps are not yet closed.

No inspected direct source establishes a complete mathematical definition of the Loop/Star map or a fully specified two-aspect decomposition of the Klein Fabric. The formulaic projection/translation scaffolding appearing in a pasted October 9 Back Hallways block is assistant-authored text inside a user-role message, not a Nathan-Direct derivation.

## 2. What the existing Lean formalization actually covers

The existing RavelFiberTransport / RavelRepresentationConversionCoherence formalization uses a total equivalence between every pair of representation states, with identity and composition coherence. Its theorems include:

- conversion_round_trip_source
- conversion_round_trip_target
- conversion_path_independent
- observable_after_evolution_independent
- identity_conversion_does_not_force_dynamics_compatibility
- identity_conversion_does_not_force_readout_invariance

This proves a useful conditional result: a closed, bijective, path-independent conversion preserves a readout only when the relevant evolution and observable-invariance conditions also hold. Identity conversion alone is insufficient.

**Scope limit:** this is the globally invertible corridor subcase. It does not formalize partial domains, branching relations, threshold termination, route-dependent maps, or non-closing round trips. The module is an assistant formalization of an earlier local/global representation question, not the Loop/Star map itself.

### Build evidence and limitations

PR #1133 is OPEN / DRAFT / UNMERGED. Its head is 19479ee3fad0e96c4f0ddb4f79842f4a5ab9bb61; its base is infra/lean4-verification-20261023. Relative to the inspected main head 58e2258d9bf181b55c01717b884f8e90f18ee4fb, the PR is 97 commits ahead and 14,727 behind.

Actions run [#43109180575](https://github.com/Satobloc/HsH/actions/runs/43109180575) succeeded on merge reference e4c4636e7252d9b1aac4ad19cf7f4c4ed11bc5b0, with 8,953 jobs. The RavelRepresentationConversionCoherence module blob matches between the PR head and that merge reference. This is a successful merge-reference build, not a standalone exact-head build. The corridor theorem-specific axiom output is [Quot.sound].

The same build also exposes Real.ofCauchy (sorry ...) in the separate RavelNormalConnectionReduction axiom report. The source module contains no literal local sorry, but the dependency-level proof gap is not resolved here. The nanoda stage and global axiom audit were disabled; the effective action input allowed sorry, so no repository-wide sorry-free claim is justified. The exact-head build, tests, lint, and independent review remain outstanding. See the additive verification correction on [issue #1635](https://github.com/Satobloc/HsH/issues/1635).

## 3. New corridor-class gate

A **corridor** is a mathematical relation between representation spaces, not a physical worldtube, filament, contact surface, or extra field. The direct source permits branches, dead ends, threshold disappearance, return by different routes, and failure to close. A single total bijection is therefore only one allowed case.

| Corridor class | Required representation | Minimum condition before prediction |
|---|---|---|
| Closed bijective | Total function with inverse | Round-trip identity, evolution intertwining, and observable invariance |
| Partial reversible | Partial map on declared domain | State the reversible subset; make no claim outside it |
| Branched | Relation with multiple outputs | Supply a branch-selection rule or probability law |
| Threshold-terminating | Domain with a boundary | Define the control variable, threshold, and uncertainty |
| Path-dependent | Route-indexed maps | Compare routes; claim path independence only if tested |
| Non-closing | Round-trip residual | Preserve and measure the residual; do not force it to zero |

A unique observable prediction requires either a single-valued map or a specified distribution over branches. A multivalued relation without a selection or probability law is not yet predictive.

A branch in a mathematical corridor is not evidence that a physical worldtube split, that a particle was created, or that material topology changed. The current BEDROCK explicitly separates four-dimensional material continuity from changes in a three-dimensional slice intersection. Physical source/sink or creation claims require their own material continuity law.

### Geometry status: forced versus optional

- **Finite-core worldtube:** part of the current H(s)H construction target; the profile, radius convention, and numerical thickness are not fixed by the corridor programme.
- **Twist:** appears in an exploratory Klein-worldtube source description, but no independent universal twist field or normal-bundle connection is forced by a representation map.
- **Contact surface:** not implied by a slice intersection or a mathematical corridor. A material boundary and contact law remain optional until a source-defined constitutive model requires and predicts one.
- **Timesheet thickness:** not established as a second shell. The current slice is a readout of four-dimensional geometry; any finite slab requires a separately defined support and response map.
- **Response map:** required if a physical interaction is asserted, but it need not be promoted to a new primitive or a material contact surface.

## 4. Independent test contract

For any proposed local/global or cross-formalism corridor:

1. Identify the physical system and the exact source-defined representations.
2. Define the map or relation, its domain, units, normalization, branch labels, and uncertainty.
3. Identify shared parameters and freeze them after calibration.
4. Predict a held-out observable in the target representation.
5. Use the same data and nuisance treatment for the standard comparator.
6. Pre-register the discrepancy threshold from the actual measurement covariance.
7. Do not add a branch, route, or threshold after inspecting the holdout.

| Candidate | Calibration / holdout | Predicted observable | Standard comparator | Current disposition |
|---|---|---|---|---|
| Local worldtube/slice readout to global toroidal/Klein construction target | No source-defined split or shared parameter set | No global invariant or instrument map is yet specified | Must be selected before testing | NOT_TEST_READY |
| M87* polarimetric readout as a local measurement anchor | Existing EHT 2017/2018/2021 products; no new preregistered holdout | Published beta-two mode readout; no worldtube-to-Stokes map | GRMHD plus synchrotron radiative transfer and Faraday treatment | Existing external data anchor only, not a global-topology test |

The M87* data and its worldtube-to-Stokes gap are already documented in [issue #1297](https://github.com/Satobloc/HsH/issues/1297). That record uses published method-ensemble ranges, not a new raw-data reanalysis or a full joint covariance. It does not supply a global Klein observable. No numerical falsification threshold is assigned here.

## 5. Equation custody: originals and proposed repair kept separate

### SAT.O Official Directives

Source: SAT.O Official Directives, July 2025, SAT archive blob 167136310cdf33ca8f986f33634692314c1a0946.

The source states that SAT.O is built on a four-dimensional differentiable manifold M populated by one-dimensional filaments, and that derived behavior is to emerge from filament geometry and intersection with a propagating three-dimensional wavefront Sigma_t. This file does not contain the later Maxwell-current equation quoted below.

### SAT4D Canonical Summary

Source: SAT4D Canonical Summary, June 2025 draft, byline Nathan McKnight, SAT archive blob 2a79fe25018cce7e99a2c33786d88b0551db6ae7.

Verbatim source equations:

\[
J_\mu(x)=\left\langle \text{Filament Flux and Linking Density}\right\rangle_{\mathcal{F}(x)}
\]

\[
\partial^\mu F_{\mu\nu}(x)=\mu_0\left\langle \text{Filament Flux Density}\right\rangle_{\mathcal{F}(x)}
\]

The second right-hand side has no displayed free nu index and is not defined there as a covector. The table identifies J_mu as an effective four-current, but the source does not supply the missing typed map from the flux-density expression to that covector.

### Blockwave assistant-generated action

Source: assistant-authored message 3039b226-02d4-41a3-a2d3-c338e25204a9, 2025-10-19T12:31:03Z, conversation 68f4d9b5-b908-832e-940e-6782db174a4a, HsH raw blob 1f074cc67057ae9df1e92bab45e8ba34c96b0d77.

The source defines a conserved antisymmetric two-form current:

\[
\nabla_\mu J^{\mu\nu}=0
\]

and uses a Lorentzian unit-timelike convention \(u^\mu u_\mu=-1\) with a spatial projector. This is assistant-generated Blockwave material, not Nathan Direct, and it is not the same tensor type as the SAT4D rank-one current.

### Separate type-repair candidate

A possible type repair to the SAT4D Maxwell source is:

\[
\partial^\mu F_{\mu\nu}=\mu_0 J_\nu
\]

This is a proposal, not source text and not a derived equation. It requires a defined covector current, units, and a source law. The existing Ravel two-form projection only contracts the rank-two Blockwave current with a chosen velocity to obtain a spatial current; it does not supply a full four-current or charge density. No map identifying the Blockwave two-form with the SAT4D current is established.

No source equation was altered or promoted in this run.

## 6. Disposition

- No new Lean theorem or data-free fixture was added. The existing closed-transport theorem was reused with its actual merge-reference build status and proof limitations.
- No physical calculation, fit, H(s)H prediction, raw-data reanalysis, or independent measurement was performed.
- No SAT-O/Blockwave equation was changed.
- No BEDROCK theory status, physical primitive, branch, PR, or task was promoted or modified.
- Next formalization requires a source-defined relation-valued map and branch/selection semantics. Until then, the broader Loop/Star programme remains a test architecture, not a completed mathematical or physical equivalence.


## Operational publication status

Issue #1637 was opened once with the required title prefix and four-key lowercase schema. Its initial issue-open event carried a mismatched SHA because the JavaScript template preserved escape characters before inline-code delimiters. The issue body was corrected in place at 2026-11-12T11:46:57Z to content SHA-256 24f7080c4ce163116e52a667a2415f23e45193f706d803ef5fe429f08a08fe83.

The publisher workflow listens only to issues.opened and validates the immutable event payload. Publisher comment #6822742505 returned REJECTED: SHA-256 mismatch. The expected PUBLISHED_SUBMISSIONS artifact path returned 404. The corrected current issue body does not trigger a retry. No duplicate issue and no direct artifact write were attempted.

Final publication state: PUBLISHER_REJECTED_STALE_EVENT_SNAPSHOT / NOT_PUBLISHED.
