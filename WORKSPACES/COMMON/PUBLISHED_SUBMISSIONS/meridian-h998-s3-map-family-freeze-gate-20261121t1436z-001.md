# Meridian h998:s3 | Map-Family Freeze Gate v0.1

**Nominal slot:** 2026-11-21T14:36:00Z  
**Run key:** `REVROT3-19-20261011:998:s3`  
**Selection:** h=998; seq=5h+3=4993; 4993 mod 19=15, Meridian.  
**Next ring label:** Mercer, index 16.  
**Disposition:** `MAP_FAMILY_FREEZE_GATE_PROPOSED / WORKFLOW_ONLY / NO_PHYSICAL_TEST / P0_PRESERVED`.

## Executive result

One bounded Lane 36 architecture improvement: the **Map-Family Freeze Gate (MFFG) v0.1**.

It preserves multiple admissible geometry-to-observable maps, requires the entire candidate family and its parameter domains to be frozen before holdout access, and evaluates a family-level prediction envelope rather than selecting whichever map best fits the holdout. A "least-wild" route preference is permitted only after the empirical hard gates pass and candidates are observationally equivalent at a declared resolution. The least-wild metric is not yet defined, so no ranking is made.

This is a workflow contract, not a new geometric primitive, physical model, solver, H(s)H prediction, or BEDROCK amendment. It is a one-run Lane 36 overlay. Meridian's standing P0 assignment remains controlling; no general solver or geometry work was reopened.

## 1. Source authority and historical remit

No standalone signed Meridian specialist charter or authenticated current Meridian thread was found. This is assistant-level, source-grounded reconstruction, not participation by a historical Meridian instance.

The relevant direct user sources are:

- Meridian Minkowski Ring Analysis raw export, conversation `6a9aa91b-11f4-83ea-80a1-4d502522e441`, blob `d21e251df093013903cc19789ded562f83b6e6ea`. Direct messages `054d1aea-cf67-4154-93c8-e302dc3ce1ea`, `39299849-e2a4-4b63-88a0-5612c700cc1a`, and `f6a2377c-8873-41ee-9107-41aeeb0d2589` concern the Gendarme Graticule, configurable geometric solvers, comparison with conventional calculations, and verification of the Whirligig's GR/QM procedure.
- Meridian Free Build raw export, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, blob `7af1561b321f4d9364da5eb111df689efc652827`. Direct user message `97d301cb-5174-4861-a273-ac4cc0b60d8b` states that multiple valid answers should be preserved and that the Whirligig should search for the least-wild routes rather than imply a unique solution.

The last statement is a design requirement, not a theorem that every equation has multiple solutions.

Existing implementation boundaries were checked:

- [Whirligig Kernel 0](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/SANDBOX/WHIRLIGIG_KERNEL_0.md) is explicitly sandbox-only. Its restricted exact encoder/decoder does not establish a general equation-to-curve encoder or a physical isomorphism.
- [Whirligig R/Q README](https://github.com/Satobloc/HsH/blob/main/tools/whirligig_rq/README.md) requires a specified solution branch, observable, and parameter interval for a faithful equation adapter. It also distinguishes the current browser inner-wall Analemma branch from the older standalone Python R/Q outer-wall branch. Their implementations and outputs must not be silently mixed.

## 2. New architecture: Map-Family Freeze Gate

The existing model-selection hard gate begins after a candidate model and its maps have been specified. MFFG adds a pre-holdout layer: **the admissible map family itself must be enumerated, bounded, and frozen before the holdout is opened.**

### Candidate-map record

Every admissible map candidate must carry:

1. A stable map ID and source witness (repository, path, blob, and relevant source-message or equation location).
2. Typed input and output objects, domain, codomain, admissible parameter interval, and solution branch.
3. Coordinate, frame, orientation, and clock/parameter conventions. Parameterization is retained as a separate channel where the source or decoder requires it.
4. Explicit intersection/restriction, projection, coarse-graining, and readout maps. These are distinct operations, not interchangeable descriptions.
5. The named observable, measurement units, instrument/readout definition, and uncertainty model.
6. Shared parameters and map-specific parameters, with the latter justified by a source witness rather than introduced after seeing a residual.
7. The standard comparator, calibration data identity, acquisition-unit map, holdout identity, and frozen prediction record.
8. A declared structural status for each proposed feature: inherited constraint, source-derived, optional candidate, or unsupported. This applies separately to finite-core thickness, twist/winding, and contact/boundary surfaces.
9. A family-level prediction-envelope rule and a predeclared falsification rule.

A candidate missing its source, map, branch, observable, or admissible domain is not an admissible member of the frozen family.

### Family-level test sequence

1. Enumerate all source-admissible candidate map chains. Do not assume uniqueness.
2. Reject or quarantine candidates that lack source provenance or a defined domain/codomain.
3. Test whether the intended observable is actually representable after each projection. If it is not, retain the lost channel or declare the readout lossy; do not call the projection information-preserving.
4. Freeze the complete candidate family, shared parameters, candidate-specific parameters, branch choices, and admissible intervals before holdout access.
5. Apply the same measured system, dataset, calibration, and standard comparator to every candidate.
6. Construct one predeclared family-level prediction envelope. The choice between a union of candidate prediction sets and a predeclared model mixture must itself be frozen before holdout access.
7. Evaluate the untouched holdout once under the frozen rule.
8. Record whether the family is supported in that domain, falsified in that domain, or too broad to be falsifiable.

A candidate may not be selected, widened, or replaced after inspecting the holdout. If the envelope can be widened after the result is known, the workflow has not protected falsifiability.

### What counts as failure

- If every admissible candidate fails the untouched holdout beyond the predeclared uncertainty-justified threshold, reject the frozen map family for that tested domain.
- If only some candidates survive, report the surviving subset only under a predeclared selection/update rule or independent source evidence. Do not quietly rewrite the original family.
- If candidates differ internally but produce the same observable distribution within the declared uncertainty, they are observationally equivalent for that test.
- If the family envelope is so broad that it can contain essentially any outcome, the family is not test-ready. That is hidden flexibility, not predictive success.

The least-wild route preference is a secondary ranking only. It cannot rescue a candidate that fails source, map, measurement, comparator, identifiability, or holdout gates. The metric for "wildness" is presently undefined; candidates remain unranked. The existing human-intelligibility preference in PR #1487 is not silently redefined as the least-wild metric.

## 3. Worldtube-to-readout hierarchy: status, not promotion

The live BEDROCK and source record distinguish the filament/centerline, finite-core worldtube support, timesheet/section or intersection trace, and lower-dimensional Graticule/readout. The exact source-to-observable maps and their composition conditions remain incomplete.

The new gate requires every candidate to state what it is doing at each level:

- **Finite-core worldtube:** the finite-core extension is part of the current working H(s)H target. Its actual thickness profile and shape are not numerically fixed here.
- **Coil scale:** the source distinguishes the first-order coil radius `ell_f` from filament/worldtube thickness. They must not be substituted for one another.
- **Core-thickness notation:** historical `epsilon` usage is not treated as a measured current thickness or a license to introduce a new free parameter.
- **Twist/winding:** existing source-level winding and orientation constraints must be carried forward. A separate independently adjustable twist field or parameter is not licensed merely by naming twist.
- **Contact/boundary surface:** Kerr-shell/contact language remains tentative. A distinct contact surface, coupling, and readout must be explicitly sourced and mapped; it is not inferred from a generic worldtube label.
- **Graticule:** the historical display convention is a source witness, but its complete map from the higher-dimensional construction to a measured observable is not yet established.

The candidate-map record therefore distinguishes inherited structure from optional additional degrees of freedom. It does not decide the unresolved physical construction.

## 4. Composition and coarse-graining contract

Each candidate must distinguish these paths:

- worldtube -> coarse-grained worldtube -> timesheet intersection -> projection -> common readout;
- worldtube -> timesheet intersection -> projection -> coarse-grained trace -> common readout.

The paths are comparable only if they terminate in the same named measurement space with compatible units, frame, clock, and observation operator.

A difference between the two paths is a representation/coarse-graining diagnostic. It is **not automatically a physical effect**. It becomes a candidate discriminator only if it changes a named measured observable, survives the actual readout, exceeds the propagated measurement uncertainty under a predeclared rule, and survives the untouched holdout.

This operationalizes the existing BEDROCK distinction between projection and coarse-graining without promoting their noncommutation into a physical claim.

## 5. Existing Lean proof substrate and limits

No new Lean module, PR, branch, or CI dispatch was created. Local `lean`, `lake`, and `elan` executables were not present. The new MFFG proposal also lacks a source-defined candidate-family type and a defined least-wild metric, so its own formalization is `FORMALIZATION_BLOCKED_DEFINITION`.

Two existing formal results were rechecked rather than duplicated:

- [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189), theorem `factorization_iff_fiberwise`: exact head `da1e7d5dff0cdbc1d81303e3c573b79832087a38`; [run #44106198466](https://github.com/Satobloc/HsH/actions/runs/44106198466), job #134119101991. Exact source-checkout assertion and full 8,961-job Lean 4.34.0 / Lake 5.0.0 build passed. The theorem's axiom report includes `Classical.choice`; the induced-map uniqueness theorem includes `Quot.sound`. This is the generic projection/fiber criterion, not a Graticule-specific physical map.
- [ModelSelectionPreference PR #1487](https://github.com/Satobloc/HsH/pull/1487), corrected head `be83ff68a38580735dd30047dcb19e6a49293715`; [run #44911184186](https://github.com/Satobloc/HsH/actions/runs/44911184186), job #136867147267. The corrected PR content compiled in a successful 8,947-job Lean 4.34.0 / Lake 5.0.0 merge-reference build. This is not a separately demonstrated head-only checkout. Five hard-gate/tie-break theorem outputs report no axioms; six nuisance-quotient outputs report `propext`, `Classical.choice`, and `Quot.sound`. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped.

These proofs establish only their formalized conditional statements. They do not authenticate a physical map, a measured system, the least-wild metric, or an H(s)H prediction. Both PRs remain OPEN / DRAFT / UNMERGED and were not modified.

## 6. Test matrix: current disposition

| Required element | Current state |
|---|---|
| Source-complete H(s)H candidate map family | NOT ENUMERATED |
| Frozen map IDs, branches, frames, clocks, parameter domains | NOT FROZEN |
| Projection/fiber sufficiency for a Graticule readout | NOT INSTANTIATED |
| Least-wild metric | UNDEFINED / UNRANKED |
| Measured physical system | NOT SELECTED |
| Versioned dataset and provenance | NOT SELECTED |
| Units and joint uncertainty model | NOT SELECTED |
| Standard comparator | SYSTEM-SPECIFIC / NOT INSTANTIATED |
| Shared and candidate-specific parameters | NOT IDENTIFIED |
| Calibration and acquisition-unit map | NOT DEFINED |
| Untouched holdout | NOT DEFINED |
| Frozen prediction envelope | NOT CREATED |
| Falsification threshold | NOT SET |
| Overall disposition | NOT TEST-READY; P2 REMAINS HOLD |

No physical calculation, fit, synthetic fixture, H(s)H prediction, independent measurement, or falsification threshold was produced. This is deliberate: the campaign has not selected a P2 system, and no source-grounded H(s)H map currently connects a chosen measured system to a named readout. The next physical test must start from a real measured system, versioned data, units, covariance, acquisition-unit identity, and a standard comparator.

## 7. Tooling, archive coverage, and project safeguards

- Mersearch was not executed: no callable Mersearch action or stable local checkout was available. All four existing request files remain `requested`; no lane was changed, overwritten, retriggered, or released. Known-path GitHub retrieval is bounded fallback, not exhaustive Mersearch coverage.
- Checked the existing Math Hopper documentation (#578 / PR #991 references), Whirligig Kernel 0, the R/Q README, and existing Lean PRs. SciSpace remains an available connector but was not needed for this workflow-only change.
- No new tool, dependency, fork, subscription, paid endpoint, branch, PR, or expense.
- HSH_RESOURCES root README and repository metadata only; no private/internal payload or index was opened. SAT archive root README was read.
- P0 Code Grurple remains ACTIVE. Meridian's standing assignment remains Paper A accepted-R1 presentation support only; Mercer retains independent Paper A/B presentation QA. No P0 manuscript, site, reader, deployment, or PR #2009 change.
- P1 Orson cognition remains OVERDUE / NOT READY / ORSON-OWNED. P2 measured geometry remains HOLD with no system selected. P3 full theory remains INCOMPLETE.
- November 9 minor gate: MISSED. November 30 major gate: HOLD. December 14 full-theory gate: INCOMPLETE.
- FIE last full review: November 20; next review: December 4. No duplicate unrelated-reading break; the preceding run already recorded one.
- No SAT-O or Blockwave equation was changed. No BEDROCK premise was promoted. No paper gate advanced.

## 8. Continuity and next cursor

The existing :36 task remains enabled and unchanged. No task ID, schedule, prompt, phase, cadence, or ownership mutation; no sixth task, signet, or conversation rename.

The current :36 occurrence had no authenticated run-level thread reference at the last read. The next :48 Mercer occurrence had already started, also without an authenticated thread reference. Any repository handoff is therefore POSTSTART_OPTIONAL_CONTEXT_ONLY. No direct-thread delivery, consumption, acknowledgment, assignment, review request, response obligation, or ownership transfer is claimed.

**Next useful step:** after P0 standdown and an authorized P2 system selection, enumerate the source-admissible worldtube-to-readout map family for that measured system, freeze all candidate maps and the family envelope before holdout access, and then apply the existing measurement, comparator, identifiability, and falsification gates. Until then, keep MFFG as a workflow proposal and P2 on HOLD.
