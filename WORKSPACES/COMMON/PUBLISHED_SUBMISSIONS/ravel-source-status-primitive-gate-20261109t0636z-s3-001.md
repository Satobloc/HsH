# Source-status-first primitive-count gate and Helion observable-map contract

**Run key:** `REVROT3-19-20261011:702:s3`  
**Relationship:** Additive crosswalk between Ravel issue #1486 and the feature-isolation matrix in #1492. It replaces neither.  
**Disposition:** ASSISTANT-PROPOSED WORKFLOW ARCHITECTURE / SOURCE-BOUNDED / REAL-DATA CANDIDATE AUDIT ONLY / NO PHYSICAL CALCULATION / NO P2 SELECTION / NO THEORY PROMOTION.

## 1. The missing ordering rule

Ravel #1486 asks whether a responsive sector is eliminable, absorbable into an extended timesheet state, an independent third-state candidate, or unresolved. That decision concerns a **state-bearing sector**. It must not be applied directly to geometric attributes, boundaries, readout channels, or fitted parameters.

The feature-isolation matrix in #1492 distinguishes intrinsic finite-core thickness from optional twist and unresolved contact. This addendum makes the dependency explicit:

**Classify source and geometric feature status first; classify primitive/state count second.**

The statement in #1486 that thickness, twist, and contact are not forced by a fitted response coefficient, memory kernel, or provisional responsive sector is scoped to those response mechanisms. It does not make a source-defined finite-core feature optional. Conversely, a source commitment to finite-core geometry does not establish an independent responsive-medium state.

## 2. Source-status split

The live [BEDROCK entry ND-2026-10-18-07](https://github.com/Satobloc/HsH/blob/main/BEDROCK.md#L507-L529) records as Nathan Direct that intrinsic filament thickness was operative in the early finite-core construction. It separately identifies the historical first-order coil radius, intrinsic core thickness, resolving-slab thickness, envelope/boundary, and actual time-slice morphology.

The current [symbol registry entry for SAT:ε](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/terminology/SYMBOL_REGISTRY.md#L104-L116) marks the numerical candidate HISTORICAL / UNRESOLVED, says its exact origin and modern interpretation need provenance audit, and says it does not establish the current H(s)H core or shell thickness.

These records can be reconciled only by keeping three questions separate:

1. **Existence/role:** intrinsic thickness belongs to the early finite-core construction recorded in BEDROCK.
2. **Symbol genealogy/value:** the historical `ε` candidate, its exact source locator, numerical value, and modern interpretation remain unresolved.
3. **Current-model mapping:** no source-defined map currently identifies that historical `ε` with a numerical thickness of the present H(s)H core or shell.

The source-status wording in #1492 should be read at the first level, not as a measured value or frozen current parameter. No registry or BEDROCK edit is made here.

| Feature | Status | What must not be inferred |
|---|---|---|
| Intrinsic finite-core thickness | Source-recorded geometric role in the early finite-core construction; profile, support, metric, scale, numeric value, raw-message locator, and current-model map remain unresolved. | A measured value, current H(s)H core radius, shell thickness, or separate state-bearing primitive. |
| First-order helical coil radius `ℓ_f` | Historical geometric scale, distinct from intrinsic thickness. | Substitution for `ε`. |
| Resolving-slab thickness `δ` | Observer/reconstruction scale, distinct from material-core thickness. | Identification with `ε`. |
| Boundary shell | Conditional geometric boundary of a chosen regular finite tubular core and declared embedding/normal bundle. | A material contact surface or contact-force law. |
| Local twist / normal connection `τ` | Optional additional structure; no complete current source-defined field/connection/pitch law is frozen. | A required universal twist rate from helical appearance alone. |
| Contact interface / law `c` | Unresolved. | A contact set, dimension, or constitutive law from a boundary shell alone. |
| Responsive medium | Active, tentative state-bearing candidate under #1367 and OC-002. | An established independent third ontology, or something automatically removed by a geometric feature ablation. |

The raw-message locator for the BEDROCK thickness statement is not present in the current record. The raw source pointer quoted in #1391 supports the separate worldtube-curvature/inertia proposition; it does not settle the numerical genealogy of `ε`. Preserve that provenance gap.

## 3. Ordered evidence and model-selection pipeline

This order composes existing work rather than creating another generic gate:

1. **Source authority and feature status:** apply the four independent axes in [Elias's feature gate #1391](https://github.com/Satobloc/HsH/issues/1391): source authority, representation necessity, observability/identifiability, and empirical necessity.
2. **Object/primitive typing:** distinguish geometric attribute, state-bearing variable, boundary, instrument/readout property, and fitted parameter. Only state-bearing sectors enter the primitive-count decision in #1486.
3. **Map contract:** specify source/target state spaces, domains/codomains, evolution maps, encoding or projection, slice/intersection, coarse-graining, readout, initial/boundary data, and conditions for each composition. A missing map means `PREDICTION_NOT_FORMED`, not assumed equivalence.
4. **Measured-input gate:** identify the actual system and versioned data; retain provenance, units, uncertainty/covariance, calibration, nuisance structure, and an independent holdout.
5. **Identifiability and shared-parameter gate:** freeze common physical parameters and calibration before holdout access; test whether the proposed feature survives projection and nuisance control without channel-specific retuning.
6. **Primitive-economy decision:** apply #1486 only to the responsive state: `ELIMINABLE`, `ABSORBABLE_INTO_TIMESHEET`, `INDEPENDENT_THIRD_STATE_CANDIDATE`, or `UNRESOLVED`. The independent-third-state outcome requires independent initial/boundary data, dynamics, and a separately measurable held-out consequence.
7. **Non-compensatory selection:** apply [PR #1487](https://github.com/Satobloc/HsH/pull/1487). Intelligibility/complexity preference cannot rescue a candidate that fails source, map, data, comparator, identifiability, shared-parameter, or holdout hard gates.

This preserves the BEDROCK build-first rule: construct the source-admissible geometry under the same constraints, inspect its output, and only then investigate explanatory mechanisms.

## 4. Real-data candidate matrix: helium-3 readout

The existing [Ravel measured-input gate PR #993](https://github.com/Satobloc/HsH/pull/993) records a real candidate data package. It is **not selected as the P2 flagship system** and is not yet an H(s)H prediction test.

| Candidate | Data/provenance | H(s)H predicted observable | Shared parameters / calibration / holdout | Standard comparator | Falsification threshold | Current disposition |
|---|---|---|---|---|---|---|
| H0: conventional baseline | Published `⁴He` transition frequency `192510702148649(48) Hz`; `³He` transition input from van der Werf et al. (2025); JLab Hall A E04-018 `³He` elastic form-factor magnitude table from Camsonne et al. (2017). PR #993 records units and quoted uncertainties. | Standard atomic finite-size and elastic-scattering readouts. | Published inputs are not a raw acquisition/covariance package; no new calibration/holdout split is declared here. | Conventional QED finite-size relation and Rosenbluth/form-factor analysis. | Must be derived from the selected dataset's actual covariance and predeclared predictive set; not computed here. | Real measured data exist; candidate only. |
| H1: minimal source-admissible worldtube/timesheet | Same published inputs. | No source-faithful geometry-to-electromagnetic-current/form-factor/atomic-readout composition is presently defined. | H(s)H shared parameters and calibration are not frozen; no independent holdout partition. | H0 on the same measurement operator and nuisance treatment. | None before the H(s)H map and covariance/holdout contract exist. | `PREDICTION_NOT_FORMED`. |
| H1+`τ` | Same data. | Twist-specific current/readout map and source-defined `τ` law are absent. | No separately identifiable `τ` parameter or holdout. | H0 and H1. | Not defined. | Optional extension, not presently testable. |
| H1+`c` | Same data. | Contact set/law and contact-specific observable are absent. | No contact parameter or holdout. | H0 and H1. | Not defined. | Unresolved; `PREDICTION_NOT_FORMED`. |
| H3: independent responsive state | Same data do not independently measure a responsive-medium state. | State evolution, encoding, and independent readout maps are absent. | No independent initial/boundary data or state-sensitive holdout. | Best adequate H0/H1 representation. | Not defined. | #1486 remains `UNRESOLVED`; no third-state promotion. |

The current JLab table has identifiability limits already recorded in PR #993: at `Q²_eff = 49.0 fm⁻²`, only a forward-angle measurement is available and the magnetic form factor is absent; at `Q²_eff = 60.8 fm⁻²`, the quoted charge-form-factor uncertainty exceeds its central magnitude, so its one-sigma interval contains zero. The table stores magnitudes, not signs. The standard unpolarized reduced readout is invariant under sign flips of the charge and magnetic form factors; one Rosenbluth point cannot identify their signs.

A candidate discriminating target in the existing Ravel continuity is a charge-to-magnetic prediction without an independent magnetic parameter. This is an assistant-maintained research cursor, not a recovered Nathan Direct equation or established H(s)H law. To make it testable, the source-faithful map chain must specify the worldtube/timesheet/state support and admissible domain; a conserved electromagnetic-current construction with units and normalization; charge and magnetic form-factor projections; the instrument/Rosenbluth readout and nuisance/covariance model; composition conditions connecting geometry to readout; and a calibration subset, frozen shared parameters, and independent magnetic holdout.

Until that chain exists, the real data do not supply an H(s)H prediction. No fit, parameter extraction, numerical prediction, or falsification score is performed here.

## 5. Existing Lean verification and limits

Existing formalizations were inspected rather than duplicated:

- **PR #1487:** Actions run #42494441101, merge-reference commit `329fc57f92ab39b7adc54806be5c8614b44d3624`, Lean 4.34.0 / Lake 5.0.0, full build successful (8,947 jobs). The four `ModelSelectionPreference` theorem-specific outputs report no axioms. Tests, lint, nanoda, and the separate global axiom audit were skipped.
- **PR #993:** Actions run #42330897900, merge-reference commit `32cd73bc9b69145bc2d2d07556cb6538342449fe`, full build successful (8,952 jobs). It formalizes arithmetic checks over published measurement inputs and readout sign/identifiability statements; some theorem reports use standard Lean axioms including `Classical.choice` and `Quot.sound`. It is not an independent measurement or an H(s)H prediction.
- **PR #873:** Actions run #42153410233, merge-reference commit `a2c3304edafa5274530ce5286cbe15ac1ed47b0b`, full build successful (8,955 jobs). It contains a static projection/factorization result, not the dynamic medium-absorption closure.

These are actual Lean 4.34.0 / Mathlib CI builds on merge references, not standalone exact-head builds. Tests, lint, nanoda, and separate global axiom audits were skipped. The dynamic closure proposition remains `FORMALIZATION_BLOCKED_DEFINITION`: the source-defined full/reduced state spaces and evolution/encoding maps are absent. No new theorem or data-free calculation is claimed.

Lean checks only the formalized statements. It does not establish source-translation fidelity, truth of physical premises, existence of proposed maps, or empirical necessity.

## 6. Limits and next cursor

- P2 remains HOLD; no measured system is selected.
- The helium dataset is an existing real-data candidate only, not a P2 selection.
- The intrinsic-thickness role is source-recorded; exact raw-message locator, numerical `ε`, and current-model mapping remain unresolved.
- Twist and contact remain optional/unresolved as stated above.
- The responsive medium remains an active tentative candidate; no elimination, absorption, or independent-third-state conclusion is reached.
- All four Mersearch request lanes are occupied/requested. No request was submitted or overwritten; no new equation was extracted or modified.
- No physical calculation, fit, H(s)H prediction, new Lean theorem, paper-gate advancement, BEDROCK edit, symbol-registry edit, or theory promotion occurred.

**Next:** when a Mersearch lane is free, recover the exact raw source lineage for `ε`; then define the source-faithful geometry-to-current and readout maps before selecting a measured system or opening a holdout. Keep the feature-status pre-gate and primitive-economy decision separate throughout.
