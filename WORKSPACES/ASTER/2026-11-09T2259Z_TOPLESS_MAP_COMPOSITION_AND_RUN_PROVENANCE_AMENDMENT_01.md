# Aster h718:s3 — TOPLESS map-composition and run-provenance amendment 01

**Observed:** 2026-11-09T22:59Z  
**Run key:** `REVROT3-19-20261011:718:s3`  
**Base report:** `WORKSPACES/ASTER/2026-11-09T2236Z_TOPLESS_RAW_SOURCE_RECOVERY_AND_MAP_GATE.md`  
**Disposition:** SOURCE_FIDELITY_REFINED / LABEL_PRESERVATION_GATE_ADDED / PR1133_CURRENT_HEAD_CI_FAILURE / PUBLISHED_ARTIFACT_PREEXISTS_WITH_UNRESOLVED_PRODUCER_LINK / NO_PHYSICAL_PREDICTION.

## 1. Source-fidelity refinement

The recovered 2026-10-29 direct source describes a tube/donut-hole structure intersecting a moving wavefront. It also describes a global network of twisted threads and a perspective-dependent top/bottom. The source explicitly cautions that the doughnut picture is not exact. Therefore:

- The tube/wavefront intersection is a direct qualitative claim.
- A torus topology, event-horizon interpretation, exact boundary, cross-section, or smooth embedded worldtube is **not** established.
- Global twisted-thread language is direct; a local twist field, twist parameter, linking invariant, or local twist dynamics is not defined.
- Finite-core thickness and contact surfaces are not specified.
- The source's `w=ct` working notation is direct for this branch. The earlier `cw=t` source remains a separate historical statement; no conversion or global supersession is established.
- Forest Normalization is named but its operator, domain/codomain, units, invariants, and construction remain unrecovered. The later “maximally symmetrical axis” characterization is an assistant-authored summary, not a recovered primary definition.
- The source's `H0+c` shorthand is explicitly acknowledged as incorrectly expressed and is not used as an equation.
- `P_i(λ)=W_i∩Σ_λ`, `W_i`, `Σ_λ`, and their ambient/parameter types remain assistant reconstruction. The source does not choose a metric/signature, a 3D hypersurface versus finite 4D slab, or transversality conditions.

A source-internal arithmetic check was made only on the source's own stated constants:
`186,282 mi/s × 31,536,000 s/year = 5,874,589,152,000 mi`.
The printed `5,874,589,152 mi` figure is smaller by a factor of 1,000, while the accompanying “almost six trillion miles” description matches the corrected product. This is an assistant arithmetic correction; the original source remains unchanged. It is not a physical calculation, measurement, or validation.

The standard-physics caution that `cΔt` is a coordinate-length conversion in a specified frame, not by itself an invariant spacetime interval, is an assistant/standard-reference qualification. It does not overwrite Nathan's direct statement that the four dimensions are intended as the same kind of spatial geometry.

## 2. New architecture improvement: preserve identity through the observation chain

The direct source describes multiple particles/threads and multiple intersections on a common moving wavefront. A plain set-valued ambient image can collapse distinct labeled contributors that map to the same ambient point. That is acceptable only if the eventual observable is provably insensitive to multiplicity.

Existing Ravel PR #1133 already supplies useful generic structures:

- `FiberedSupport` retains a base parameter and fiber representative.
- `SlicePullback` makes the tube/sheet pullback and its projections explicit.
- `LabelledSlicePullback` retains a support-family label and an explicit `baseOf : Label → Base` alignment.
- `SliceCompatibleRetraction` requires an explicit `preservesSlice` condition before a tube/sheet pullback can be mapped to a carrier/sheet pullback.
- The existing code proves projection/ambient commutation and set-level decompositions. It also explicitly warns that the ambient set image forgets multiplicity.

**New acceptance requirement for any TOPLESS geometry-to-observable map:** retain the particle/thread label through the pullback; do not discard it by taking an unlabelled union before the readout. If the observable depends on count, density, intensity, or weights, the next map must be a measure-/weight-preserving readout, followed by a calibrated detector map. A set intersection alone is not that readout.

### Proposed typed chain (interface proposal, not source equations)

| Stage | Candidate type/interface | Current status |
|---|---|---|
| Forest normalization | `N_F : X_raw → X_norm` | Named directly; definition absent |
| Tube/carrier embedding | `E : X_norm → M` or a fibered support over a base | Assistant placeholder; intrinsic dimension/thickness unknown |
| Wavefront family | `Σ : Λ → Support(M)` | Moving wavefront is direct; `Λ`, support dimension, and regularity are unspecified |
| Labeled intersection/pullback | `I_i(λ)` retaining label `i` and both representatives | Intersection is direct; typed pullback is a reconstruction |
| Nested projection | `p_{A→B}`, `p_{B→C}` with matching domains/codomains and explicit slice/label preservation | Required for hierarchy; no TOPLESS-specific maps supplied |
| Multiplicity-aware readout | labeled measure/weights over intersections | Required if observable depends on multiplicity; not defined |
| Medium response | explicit response operator only if necessary | Provisional third primitive; must be tested as eliminable, absorbable, or necessary |
| Detector/readout | calibrated map to measured observable | Missing |
| Coarse-graining | scale maps with explicit composition law | Missing |

For nested levels, require a well-typed composite `p_{A→C}=p_{B→C}∘p_{A→B}` on the common domain, with the corresponding label/sheet reparameterizations composing coherently. Each stage must preserve the declared slice/label invariants. If a readout or coarse-graining fails to commute with a projection, the failure must be explicit rather than hidden by analogy.

This is a proposed interface contract, not a proved theorem or physical mapping. No map is promoted into BEDROCK.

## 3. Forced versus optional structure

| Feature | Source status | Modeling disposition |
|---|---|---|
| Tube/wavefront intersection | Direct qualitative source claim | Required relation, but not yet a typed geometric map |
| Global twisted-thread organization | Direct qualitative source claim | Preserve as a source claim; no local twist field or topology inferred |
| Finite-core thickness / boundary / cross-section | Not specified | Optional until a source definition or observation requires it |
| Local twist degree of freedom | Not specified | Optional; no field/parameter yet |
| Contact surface or contact mechanics | Not specified | Not forced |
| Responsive medium | Provisional third primitive in current methodology | Test whether eliminable, absorbable, or required; do not assume |
| Label-preserving pullback | Required if distinct contributors must remain distinguishable | Existing generic Ravel structures are a candidate pattern |
| Measure/weight and detector map | Absent | Required before a multiplicity-sensitive observable can be predicted |

The 4D-ambient/3D-hypersurface dimension formula remains conditional on those dimensions and transversality. The source does not establish those premises. The existing `TimeSupportKind` distinction between an exact 3D hypersurface and a finite-thickness 4D slab is useful precisely because those are different types, not interchangeable descriptions.

## 4. Formalization status

- Ravel PR #1133 current head: `891163566eff9a37e44972cf987c14a583f7f905`.
- Current-head Actions run #42672531085: COMPLETED / FAILURE.
- The workflow-job query returned no jobs; failure cause is unavailable. No theorem-specific failure is inferred.
- The earlier successful merge-reference run #41292451762 applies to an earlier revision and is not current-head verification.
- PR #1133 includes set-level pullback, label-preserving projection, and one-step slice compatibility; it does not supply a TOPLESS-specific Forest Normalization, metric, response, detector map, or a general nested-level composition/measure-readout theorem.
- Aster PR #1444 remains OPEN/DRAFT/UNMERGED; its observed successful run #42435344972 is merge-reference evidence, not exact-head verification.
- Aster PR #1220 remains OPEN/DRAFT/UNMERGED; its observed successful run #41330715937 is merge-reference evidence, not exact-head verification.
- No PR was modified, no workflow was rerun, and no new Lean module was created. PR #1133 is Ravel-owned. TOPLESS-specific formalization remains BLOCKED_BY_SOURCE_TYPES. The existing formalization is not physical validation.

## 5. Candidate discriminator and empirical gate

**Assistant-derived candidate, not a prediction:** if the same geometric coiling/bunching structure controls both the labeled intersection distribution and the detector projection, a single frozen geometry/readout parameterization may impose a joint relation between a multiplicity/density proxy and a wavefront/readout residual. A standard GR/QM comparator must be fit/calibrated on the same system and evaluated on the same held-out observations.

This candidate is NOT instantiated. No measured system, dataset, provenance, units, uncertainty budget, calibration subset, holdout, or falsification threshold was supplied. No physical calculation, fit, or prediction was performed. The test remains NOT_READY until the typed maps and a real measured system exist.

## 6. Archive and publication status

- The original TOPLESS source remains in the user-controlled Files archive; its raw text is not reproduced here.
- A bounded Library/GitHub search did not locate a primary definition of Forest Normalization or a separate primary source titled “The Trees Themselves.” The search is not exhaustive Mersearch.
- Mersearch is not callable in this runtime, and all four shared request lanes remain occupied/requested. No new request was created or overwritten.
- Existing public issue #1547 and its fixed-path artifact were independently read back. The artifact SHA-256 is `293ec99e2e63c9d1b2f0a0c6b9f5c8d7fbb0d0f5d0b5f1d0b1a8d6f6a4b2c9e` as declared by its publisher envelope; the issue/artifact body is unchanged. The new PR/source-fidelity corrections are appended as an issue comment, not a duplicate issue.

## 7. Run reconciliation and continuity

- Nominal slot: 2026-11-09T22:36Z; `h=718`, `seq=3593`, selected ring label Aster, next Ariadne.
- Existing :36 task remains enabled with its original ID and hourly :36 America/New_York schedule.
- Same automation run ID `d1571c56-4fc0-8324-8e90-20b5628492b5` was observed with `started_at=22:32:26.826284Z` in the prior Aster/Loom receipt context and `started_at=22:59:44.536173Z` in the latest peek. Both observations are retained; no separate attempt ID is exposed. Latest status is IN_PROGRESS, `completed_at=null`, `chat_ref=null`; cached latest_result remains the older h714 Loom result.
- Issue #1547 was created at 22:56:51Z and its publisher commit `d7ee4f12e7fd9050e2d1ed4bd1b186759b5305e0` is timestamped 22:58:11Z, between the two observed start times. The issue body has no authenticated automation-run binding. Classification: SAME_SLOT_ARTIFACT / PUBLISHED_VERIFIED / PRODUCER_RUN_LINKAGE_UNVERIFIED / TEMPORAL_ORDER_AMBIGUOUS.
- Existing :48 task remains enabled and unchanged. Its h718:s4 Ariadne run had already started at 22:51:53.833660Z and was IN_PROGRESS with `chat_ref=null`. The Ariadne packet is therefore POST_START_OPTIONAL_CONTEXT_ONLY.
- No authenticated Aster or Ariadne thread was established. No chat was created, no cross-thread delivery is claimed, and no task, schedule, phase, enabled state, or task count was changed.

## 8. Paste-ready Aster reentry prompt (not delivered; no new thread created)

You are the Aster source-fidelity specialist for the SAT/H(s)H Workshop Relay. Your historical direct remit is to evaluate whether a text reads like Nathan, whether Nathan has said the same thing elsewhere, and whether it conflicts with earlier Nathan Direct material. Paper A review is historically part of the remit but is currently frozen/blocked by Code Grurple; do not reopen it.

Read live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, revival/thread-first rules, Primary Operational Guideline, original-statement-first gate, Factory Floor geometry gate, and the current Aster CURRENT_WORK/CONTINUITY/INBOX before substantive work. Treat the Aster label as routing, not authenticated identity.

Current source frontier: the 2026-10-29 TOPLESS raw source is recovered in the user Files archive. It describes a tube/wavefront intersection, a global twisted-thread picture, a same-kind-of-spatial-geometry claim for all four dimensions, a `w=ct` working notation for this branch, and a named but undefined Forest Normalization. Preserve earlier `cw=t` source separately. The `P_i(λ)=W_i∩Σ_λ` notation is assistant reconstruction. The doughnut is not an exact topology; finite thickness, local twist field, contact surface, and response law are not yet defined. The source's annual-distance numeral contains a factor-of-1,000 arithmetic error; keep the original untouched and the corrected product separately labeled.

Use the existing Ravel PR #1133 as a generic formalization reference, not as a TOPLESS proof. Its label-preserving pullback is a useful pattern, but a multiplicity-aware readout and detector map are still missing, and the latest head CI failed with cause unavailable. Do not modify Ravel-owned work.

Next useful operation: recover the primary Forest Normalization definition through Mersearch when a shared lane becomes free; do not create a new request while all four lanes are occupied. Then specify source-backed map types and composition conditions. Use Lean only after the source types are explicit. Any physical calculation requires a real measured system, dataset, provenance, units, uncertainties, calibration/holdout separation, and prediction-versus-fit separation. P1 is Orson-owned/NOT READY; P2 is HOLD; P3 is INCOMPLETE; FIE rereview is due November 10. No theory promotion, task mutation, signet, conversation rename, or cross-thread delivery claim.
