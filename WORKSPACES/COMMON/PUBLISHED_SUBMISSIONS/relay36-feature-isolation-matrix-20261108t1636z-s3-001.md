# Feature-isolated geometry comparison matrix: addendum to the non-compensatory model-selection overlay

**Run key:** REVROT3-19-20261011:688:s3  
**Nominal slot:** 2026-11-08T16:36Z  
**Disposition:** ASSISTANT-PROPOSED WORKFLOW ADDENDUM / SOURCE-BOUNDED / NO PHYSICAL CALCULATION / NO THEORY PROMOTION

## 1. The specific gap

The non-compensatory model-selection overlay published in issue #1488 has a useful feature-status ledger, but its H2 comparison row bundles finite thickness, twist, and contact into one compound extension.

That row can compare the package against H0/H1. It cannot identify which constituent is required:

- If the package passes, no individual feature has thereby been shown necessary.
- If the package fails, the failure cannot be assigned to thickness, twist, contact, or their interaction.
- A compound fit can also hide channel-specific retuning or compensating degrees of freedom.

The existing Elias feature-isolation protocol in issue #1391 already supplies the right general rule: compare a full model with an ablated model for one candidate feature at a time, while preserving the source-defined object and matched measurement conditions. This addendum applies that rule to the concrete H2 row in #1488. It does not create another generic feature gate.

## 2. Correct the feature-status asymmetry before comparing models

The three geometric terms do not currently have the same epistemic status.

| Feature | Status in the existing source/workspace record | What remains unresolved |
|---|---|---|
| Intrinsic finite-core thickness ε | The live BEDROCK and Elias feature gate record ε as source-committed within the finite-core construction. | Support type, cross-section/profile, metric, embedding, scale, numerical value, and source-to-observable map. This is not an empirical measurement. |
| Local twist / normal connection τ | A separate material-frame or normal-bundle connection is additional structure, not a completed source-defined field or law. General helical appearance or rotational-spin language does not by itself define it. | Frame/director, transport or connection, boundary conditions, pitch/rate law, and an independently identifying readout. |
| Contact interface / law c | A historical point-contact scenario and the current interbraid premise do not establish a universal contact surface or constitutive contact law. | Contact set and dimension, participating supports, boundary/constitutive conditions, response map, and a contact-specific observable. |

Two distinctions are mandatory:

1. A boundary shell follows from a chosen regular finite tubular core and its declared normal bundle/embedding. It is not automatically a material contact surface or contact-force law.
2. Intrinsic thickness ε, first-order coil radius ℓ_f, and resolver/slab thickness δ are different quantities. No one may be substituted for another without a source-defined map.

The thickness entry therefore needs special treatment. Do not silently place ε in an optional-extension bucket if the source-defined finite-core construction already requires it. The minimal source-admissible H1 must retain every source-required feature. If a zero-thickness ablation changes the object type or violates the source construction, mark it NOT_ABLATABLE / REPRESENTATION_CHANGE. Compare admissible finite-core support/profile representations instead; do not invent a numerical ε.

The current BEDROCK/source ledger is the authority for the recorded status above. This addendum does not reauthenticate the underlying raw user messages, reproduce SAT-O or Blockwave equations, or turn an assistant summary into a Nathan Direct quotation.

## 3. Replace the compound H2 test with feature-isolated comparisons

Use the following model family. H1 means the minimal source-admissible worldtube/timesheet representation, not an arbitrarily thinned or source-stripped convenience baseline.

| Candidate | Increment or representation | Shared parameters and calibration | Predicted observable / holdout | Standard comparator | Falsification or disposition |
|---|---|---|---|---|---|
| H0 | Minimally sufficient established physics for the selected measured system. | Declare system parameters, nuisance budget, and calibration once. | Native instrument domain; independent acquisition block or condition. | H0 itself is the baseline. | Holdout lies outside the predeclared uncertainty-aware predictive set. |
| H1 | Minimal source-admissible two-primitive worldtube/timesheet construction; retain source-required finite-core commitments. | Same physical parameters and calibration as H0; only source-authorized maps may be added. | Predeclared gross morphology or geometry-derived observable in the same instrument domain. | H0 under the same measurement operator and nuisance treatment. | H1 fails its frozen holdout, or its added readout is absorbed by H0's declared nuisance/projection freedom. |
| H1-ε variants | Alternative admissible finite-core support, cross-section, or profile representations within H1. This is not automatically an optional extra primitive. | Freeze support type, profile family, metric, embedding, and scale before fitting. No numerical ε without actual data. | Calibrated cross-sectional/core readout or another source-defined thickness-sensitive observable. | H0 and the same source-admissible H1 baseline. | If the source forbids the zero-thickness comparison, NOT_ABLATABLE. If distinct variants collapse under the readout, UNIDENTIFIABLE at that resolution. |
| H1+τ | Add only a separately defined local material-frame/normal-connection structure. | Same shared parameters and calibration; expose the τ-specific parameters and prohibit post-hoc channel retuning. | Predeclared phase, handedness, or frame-transport readout that survives projection and nuisance control. | H0 and H1 under matched acquisition and covariance. | If the feature is absorbed by nuisance, collapses under projection, or fails the independent holdout, it is not empirically required in that scope. |
| H1+c | Add only an explicit contact set/interface and its law, if source or representation conditions admit it. | Same shared parameters and calibration; contact parameters declared before holdout. | Contact-specific event or response observable, not merely a boundary-shell image or observer readout. | H0 and H1 under matched acquisition and covariance. | No source/map definition means PREDICTION_NOT_FORMED; no distinct observable means UNIDENTIFIABLE; holdout failure rejects the added contact model in scope. |
| H1+τ+c | Joint twist/contact model. | Only after separate contrasts, or when a recovered source explicitly requires a coupled construction. Predeclare interaction parameters and a contrast design with full column rank for the estimands. | Joint readout with separately recorded phase/frame and contact channels. | H0, H1, H1+τ, and H1+c. | A package-level pass/fail does not establish either constituent's individual necessity. If the interaction is not identifiable, report UNIDENTIFIABLE rather than selecting the package. |
| H3 | Independent responsive-state candidate, kept separate from geometric feature additions. | Separate state, evolution, and initial/boundary data; no unconstrained retuning of H1. | Independent state-sensitive readout on a held-out acquisition. | Best adequate H0/H1/feature-isolated representation. | Apply Ravel's issue #1486 closure outcomes: eliminable, absorbable into timesheet, independent-third-state candidate, or unresolved. |

A combined H2 package may remain a candidate if the source explicitly couples its components. Its result applies to the package only. It cannot be used as evidence that ε, τ, and c are each required.

## 4. Common ablation and outcome rules

For each admissible feature comparison:

1. Freeze source identity/status, object type, support, topology, embedding, map domains, projection order, composition conditions, and instrument map.
2. Compare full and ablated representations only if the ablation preserves the declared object type and source constraints. Otherwise use NOT_ABLATABLE / REPRESENTATION_CHANGE.
3. Keep shared physical parameters, initial conditions, nuisance budget, calibration, measurement operator, and covariance treatment matched. Count every channel-specific retuning as added flexibility.
4. Freeze the independent holdout by acquisition block or condition before fitting. Adjacent frames or spatial points from one acquisition are not independent replications without an explicit dependence model.
5. Score gross morphology separately from auxiliary thickness, frame/twist, contact, and medium readouts.
6. Derive the score and falsification threshold from the selected system's actual uncertainty/covariance and model discrepancy. Do not invent a numeric threshold before those data exist.

Interpret outcomes conservatively:

- Full model passes and admissible ablation fails beyond the predeclared threshold: candidate EMPIRICALLY_REQUIRED_IN_SCOPE, subject to independent replication.
- Both pass within resolution: NOT_REQUIRED_AT_RESOLUTION for that observable and domain; this does not erase a source commitment.
- Both fail: the model class/comparison fails. Do not rescue it with post-hoc features.
- Different target-feature values share the same readout: UNIDENTIFIABLE under that readout.
- Missing source-to-observable composition: PREDICTION_NOT_FORMED.
- Missing raw data, units, calibration, covariance, or independent holdout: UNSCORABLE.
- A source-mandated feature cannot be removed without changing the object: NOT_ABLATABLE, not empirically optional.

## 5. Corrected P2 order

To prevent candidate-shopping and data-driven feature invention, order the P2 work as follows:

1. Recover and source-lock the original SAT-O/Blockwave statements and equations, preserving verbatim bytes, source path, source commit/blob, date, and message provenance. Keep any corrected or normalized equation separately labeled.
2. Freeze the source-status and representation-status ledger for the minimal model and each candidate feature.
3. Specify the source-level map skeleton: domains, codomains, support/embedding, projection, composition, slice/intersection, coarse-graining fibers, and conditions for each composition.
4. Only then select one real measured system because its acquisition can identify a predeclared observable, not merely because a convenient dataset exists.
5. Retrieve and hash the exact dataset/version/files; establish acquisition IDs, units, calibration, covariance, uncertainty, nuisance structure, and an independent holdout.
6. Instantiate the maps in the actual measurement domain, test fiber compatibility and parameter identifiability, freeze shared parameters, and execute H0/H1 plus the feature-isolated comparisons.
7. Set the falsification threshold from the actual measurement model, then obtain independent geometry/source review and replication where required.

This ordering is an additive workflow correction. It does not change task ownership or the task graph.

## 6. Existing formalization: what it does and does not prove

The existing Lean project was inspected rather than duplicated:

- PR #1487, current head 7f7a6054dc9db68105543a449b94832139759656: Actions run #42494441101, merge reference 329fc57f92ab39b7adc54806be5c8614b44d3624, Lean 4.34.0 / Lake 5.0.0, full build successful (8,947 jobs). ModelSelectionPreference's four theorem-specific reports say no axioms. Tests, lint, nanoda, and separate global axiom audit were skipped.
- PR #1387, current head 2589d4c3ac6cb3aa44910c8cef068a1cdd6e6105: Actions run #42488518645, merge reference 3d5e41f365e3f307b1f2f64cd6e80b3e68d46186, full build successful (8,946 jobs). FactorialContrastIdentifiability compiled. Its reported results use standard Lean axioms including propext, Classical.choice, and Quot.sound; the log contains tactic/linter warnings. Tests, lint, nanoda, and separate global axiom audit were skipped.
- PR #873, current head 1971e3d58a28f7c6de5cf024039dbcedb133121c: Actions run #42153410233, merge reference a2c3304edafa5274530ce5286cbe15ac1ed47b0b, full build successful (8,955 jobs). KestrelProjectedIncidence compiled; some theorems report no axioms, while others use standard axioms. Tests, lint, nanoda, and separate global axiom audit were skipped.

These are actual merge-reference Lean builds, not standalone exact-head builds. The existing 2x2 factorial formalization does not prove a three-feature thickness/twist/contact interaction design. No such three-feature rank theorem is claimed or added here. The new contribution is a test-design and source-status correction, not a new Lean theorem.

Lean checks only the formalized statements. It does not establish that the source was translated faithfully, that the physical premises are true, that a proposed map describes a measured system, or that a feature is empirically necessary.

## 7. Current evidence ceiling and next cursor

No P2 measured system is selected. No versioned raw dataset, acquisition map, calibration/covariance package, or independent holdout has been admitted for this comparison. Therefore this addendum supplies no numerical ε, twist rate, contact law, physical prediction, fit, or falsification threshold. The Kelvin-vortex response remains a separate active tentative candidate under the existing controls; it is not silently deleted by the geometry-only baseline.

All four Mersearch request lanes are occupied/requested. No request was submitted or overwritten. Bounded GitHub repository searches are not represented as Mersearch, and no original SAT-O/Blockwave equation was re-extracted or modified in this run. Math Hopper #578 / PR #991 remains an extraction/provenance pilot; Whirligig remains a geometry/sandbox workstream, not a physical equivalence; existing Lean PRs and the connected SciSpace capability were checked. No new tool, dependency, plugin, fork, paid service, branch, or automation was created.

**Result:** the H2 compound row is retained only as a package-level candidate. The operational comparison now distinguishes source-required finite-core commitment from unresolved local twist and contact structures, and requires feature-specific contrasts before any claim of individual necessity. P2 remains HOLD; no BEDROCK theory promotion or paper-gate advancement follows.
