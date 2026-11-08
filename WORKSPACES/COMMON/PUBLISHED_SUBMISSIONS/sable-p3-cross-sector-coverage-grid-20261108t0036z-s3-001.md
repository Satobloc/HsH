# P3 Cross-Sector Coverage Grid and No-Refit Holdout Protocol

**Date:** 2026-11-08  
**Run:** `REVROT3-19-20261011:672:s3`  
**Selected ring label:** Sable (index 0); successor Loom (index 1). This is a source-grounded assistant reconstruction, not an authenticated historical Sable thread.  
**Primary docket:** [HsH issue #566 — P3 full-theory manuscript](https://github.com/Satobloc/HsH/issues/566)  
**Status:** FIRST-PASS COVERAGE ARCHITECTURE / INCOMPLETE SOURCE MAP / NO PHYSICAL PREDICTION / NO THEORY PROMOTION.

## 1. Purpose and controlling distinction

The live P3 task graph identifies a specific unmet requirement: a complete cross-sector coverage matrix has not been verified. This artifact supplies the first-pass grid and, more importantly, an operational test for whether a proposed common construction actually predicts across sectors without independent sector-by-sector retuning.

The central Nathan Direct constraint is that the sectors are different readouts of one coupled four-dimensional system. The construction must therefore close dimensionlessly across domains before one independent dimensionful anchor sets physical scale. A collection of individually plausible sector fits is not that result.

This report is a workflow and source-status artifact. It is not a new physical model, a numerical calculation, a fitted result, an H(s)H prediction, a geometric plot, or evidence that Tier 2, 3, or 4 has been achieved.

## 2. First-pass sector coverage

Status language below is local to this report. It does not create new BEDROCK status classes.

| Coverage area | Standard comparator family | Current SAT/H(s)H source status | Missing map or closure | Present test status |
|---|---|---|---|---|
| Shared 4D construction | Minkowski control; GR geometry where required | One interacting filament/worldline and moving 3D timesheet are source commitments; Klein Fabric/worldtube hierarchy is source-recovered but not fully typed | Manifold, metric/signature, gluing, core profile, twist law, contact law, local/dual-shell projection, and composition conditions | MAP INCOMPLETE; no physical prediction |
| Gravity / GR | Minkowski limit; Einstein GR; Schwarzschild/Kerr limits; exterior multipoles and gravitational-wave observables | Finite-core/worldtube and Kerr/ER structures remain working candidates; no H(s)H metric-to-asymptotic-multipole map | Derive the H(s)H metric and its standard-limit map, then its own metric-to-mass/angular-momentum/quadrupole-to-dimensionless-spin/multipole-deviation observable chain | GW241011 comparison NOT READY; no H(s)H prediction, fit, or threshold |
| Electromagnetism | Maxwell/QED; static Coulomb and time-dependent current response | Electromagnetic response remains an active residual question; operational preference is active-wavefront thickness, with Kelvin-vortex or a justified equivalent retained as the response candidate constraint. Wavefront-local versus persistent-medium ontology remains open | Typed current/field map, support region, coupling/response law, static limit, finite-speed response, and observer map | MAP INCOMPLETE; no Coulomb or transient-response prediction |
| Spin | Standard angular momentum and spin representations; spin-statistics | Literal rotational-spin interpretation is a live candidate; historical SAT4D presentation associates a spinor with local bundle twist, but that is not a derivation | Map the source-defined rotation/frame to the standard spin representation and independently measurable angular-momentum, transformation, and statistics observables | TENTATIVE; no quantitative spin prediction |
| Flavor | Standard flavor mixing and oscillation observables, with the specific target sector declared | Precession/shelf-cocking is described as one underlying relative-tilt mechanism; this is qualitative source status, not a recovered mixing matrix | Map orientation/phase state to the selected standard flavor variables, transition amplitudes, and oscillation observables; identify any shared parameters | TENTATIVE; no mixing or oscillation prediction |
| QM / Standard Model | Quantum mechanics, QFT, Standard Model gauge structure, spectra and transition rates | A June 2025 historical SAT4D formal presentation contains scalar, path-integral, metric, gauge-potential, field-strength, spinor and Dirac-style proposals. It is authored “SAT Framework Team,” not Nathan Direct, and does not itself derive or verify the current H(s)H maps | Recover original SAT-O/Blockwave genealogy; type the state space, operators/Hamiltonian, gauge representation, spectrum map, limits and measurement operators | HISTORICAL FORMAL PROPOSAL; known-physics reproduction NOT ESTABLISHED |
| String theory | A specifically selected, mature string-theory model and its observable consequences | No specific string-theory model or observable has been selected; no H(s)H/string-theory equivalence or imported string action is established | Select one exact comparator and domain; define both constructions and a common observable before comparing | COMPARATOR NOT INSTANTIATED; no equivalence claim |
| Information / readout | Information theory, data processing, coarse-graining and statistical sufficiency | Projection/readout and information loss are active formal-method concerns; existing conditional map/fiber work is not a physical H(s)H measurement map | Explicit source-to-readout projection, composition conditions, information discarded, sufficient statistics, nuisance response and uncertainty propagation | FORMAL METHOD ONLY; physical map missing |
| Time / cosmology | Minkowski control and GR cosmology; expansion and conservation observables | Expanding/radial Minkowski is a working global picture with linear Minkowski as a local control; cosmobarygenesis and time-normal mechanisms remain hypotheses | Derive the relevant metric/dynamics, time/readout map, conservation accounting and dimensionful normalization from one declared anchor | WORKING HYPOTHESIS; no Hubble-rate, expansion, or baryogenesis prediction |

### 2.1 Historical equation status

The historical file `SAT 4D Theory Work/SAT4D_Covariant_Field_Equations.tex` (blob `c2493431c743ab14e677aae0a18bce7fb32880da`) is dated June 2025 and names “SAT Framework Team” as author. It presents candidate scalar, path-integral, metric, gauge and spinor/Dirac constructions. It is useful historical formal provenance, but it is not a Nathan Direct transcript, not a current H(s)H decision, and not evidence that the displayed field maps have been derived or physically verified.

`SAT-O Theory Work/SAT4D_Sections_Overview.txt` (blob `facb65271154235d7f08de50ef3ef5fe5cfef7f6`) is an 89-page extracted text object with material OCR/glyph and word corruption. It is a navigation/source lead, not a safe verbatim equation source.

`LEAN CHECK_drafts/SATO-BLOCKWAVE_leancheck.txt` (blob `b128efd3004fe34e48dc7da2c39bdd14f9926ddc`) is pseudo-Lean containing `sorry` placeholders and incomplete type/field declarations. It is not a Lean 4/Mathlib build, proof, or verification receipt. No canonical verbatim Blockwave Lagrangian was recovered in this bounded pass; the existing Aster source-recovery report also leaves the exact source genealogy unresolved. No SAT-O or Blockwave equation was changed, corrected, or promoted here.

`STATE_OF_THE_THEORY.md` is a descriptive routing surface subordinate to BEDROCK and newer Nathan Direct. The November 7 task graph supplies the current P3 blockers.

## 3. The missing experiment in the architecture: hold out a whole sector

Existing joint-readout/identifiability work addresses multiple channels within a measured system. That is necessary for P2, but it is not sufficient for P3. A full-theory claim needs a stronger test: calibrate the common construction on a declared subset, then predict at least one genuinely held-out sector without changing the shared geometry or refitting a sector-specific version of it.

### Proposed protocol

1. **Freeze the construction first.** Recover the Nathan Direct geometry and exact historical equations for the chosen candidate. Type every object and map: domain, codomain, dimension, topology, metric/signature if defined, units, orientation, support, boundary conditions, and admissible states. An absent map is `MAP_NOT_DEFINED`, not a blank to fill by analogy.
2. **Separate interaction surfaces from readout channels.** Multiple detector channels do not automatically establish multiple physical interaction surfaces. Keep the Tier-2 surface-witness requirement distinct from the cross-sector readout matrix.
3. **Declare calibration and holdout before inspecting holdout outcomes.** Identify the actual system, acquisition, raw dataset, provenance, instrument/measurement operator, units, uncertainty model, and shared-systematic covariance. Where sectors are not readouts of the same coupled system or a source-defined common state, do not stitch unrelated datasets together and call the result cross-sector closure.
4. **Close dimensionlessly first.** Derive the common dimensionless construction from the calibration set. Only after that closure may one independently identified dimensionful anchor set scale. Record the anchor source, uncertainty, and propagation. A second sector-specific scale anchor is a model change, not a harmless normalization.
5. **Freeze shared parameters and nuisance freedom.** Before opening the holdout set, freeze the common geometry, all cross-sector maps, calibration values, measurement operators, allowed sector-specific nuisance parameters, and model-discrepancy terms. No sector-specific geometry refit is allowed in the primary test.
6. **Generate held-out predictions.** Produce predictions for the held-out sector from the frozen common construction. Record the standard comparator's prediction using the same observations and declared measurement process. Report each model's independent calibration inputs and effective free-parameter count after declared gauge/degeneracy handling; do not hide flexibility behind relabeling.
7. **Evaluate jointly.** Use the full measured covariance, including cross-sector correlations and shared calibration systematics. Pre-register the scoring rule and rejection threshold with an independent reviewer before unblinding. Do not invent a generic sigma threshold in the absence of the actual data and covariance.
8. **Publish the failure path.** Preserve residuals, exclusions, failed predictions, missing observables, and every attempted rescue parameter. A model that succeeds only after changing the held-out sector's geometry or adding an unlicensed independent scale has not passed the cross-sector prediction.

### Falsification and non-result states

| State | Meaning |
|---|---|
| `MAP_NOT_DEFINED` | The source-to-observable chain is incomplete. No prediction exists yet; this is not an empirical pass or failure. |
| `UNIDENTIFIABLE` | Distinct allowed shared constructions produce indistinguishable declared readouts at the available resolution/uncertainty. No discriminating prediction has been established. |
| `NO_COMMON_SOLUTION` | No single frozen dimensionless construction satisfies the calibration-sector constraints within the preregistered uncertainty model. |
| `HOLDOUT_SECTOR_FAILURE` | The held-out observations fall outside the preregistered predictive region under the frozen construction and full covariance. |
| `RESCUE_PARAMETER_REQUIRED` | A new sector-specific geometry parameter, extra independent scale anchor, or post-hoc map change is required to recover the holdout. The original cross-sector prediction fails. |
| `CROSS_SECTOR_SUPPORTED` | A frozen common construction predicts independent held-out sector data within the preregistered criterion, survives comparator and nuisance audits, and passes independent review. This supports the tested construction only; it does not alone establish full physical truth. |

A numerical falsification threshold is deliberately **NOT SET**. It must be derived from an identified real dataset, its units, uncertainties and covariance, the frozen prediction, the standard comparator, and an independent preregistration/review. No measured system was selected in this pass.

## 4. P2 and P3 are different gates

- **P2, November 30:** one actual measured physical system; source-faithful geometry; mature standard equations; real raw data and provenance; units; uncertainties/covariance; prediction-versus-fit separation; independent hostile review. The current P2 docket remains HOLD and no system is selected.
- **P3, December 14:** full source genealogy and typed construction, plus a sector-by-sector known-physics map. The P3 cross-sector claim requires frozen shared structure and sector-level holdout, not a collection of separately tuned examples.
- **P1, November 9:** Orson's LLM-cognition paper remains separate, Orson-owned, and November 9 NOT READY. This physics matrix does not advance or absorb P1.

The matrix is a first pass, not completion of P3. It does not supply the exact original SAT-O/Blockwave equation set, complete geometry, standard-limit derivations, real-data reproductions, independent hostile review, source LaTeX, compiled PDF, or readable reader.

## 5. Proof, geometry, tier and empirical boundaries

- The existing conditional projection/fiber theorems and joint-readout contract may be reused as abstract mathematical controls. Their Lean status must retain the exact checkout/build scope; a successful merge-reference build is not automatically an exact-head/current-base build.
- No new Lean theorem was introduced. This artifact defines a workflow and records incomplete physical maps; it does not state a new source-derived theorem. A data-free formal calculation is not authorized by this pass.
- No Tier-2, Tier-3, or Tier-4 promotion is claimed. A sector row is not an interaction surface; a cross-sector table is not unexpected explanatory emergence; and the counterfactual indispensability test has not been performed.
- No Factory Floor admission is claimed. This artifact is a matrix, not a precise source-faithful geometric plot, dynamic model, or hostile-reviewed object.
- No physical calculation, fit, CODATA comparison, raw-data reanalysis, numeric prediction, or independent measurement was performed.

## 6. Next evidence gates

1. Recover original SAT-O and Blockwave user-role passages and equation artifacts through a released Mersearch lane. Preserve repository/path, immutable blob, source date, outer role, conversation/message locator, exact verbatim equation, and first-extant date separately. Keep corrected equations in a separate assistant/worker layer.
2. Type the shared Klein-Fabric/worldtube parent and its actual maps before assigning any sector-specific field, thickness, twist, contact surface, or projection.
3. Complete the standard-comparator and source-to-observable map for each row. Start with the best-defined sector and record why other rows remain open.
4. Select a real P2 system only when raw data, provenance, units, uncertainties, covariance and a source-defined H(s)H prediction map are available.
5. For P3, choose calibration and whole-sector holdout sets before fitting; retain the no-refit rule and independent review.
6. Produce source-faithful geometry plots at the point of each geometric claim and obtain hostile review of the exact version before Factory Floor or paper geometry clearance.

## 7. Source and state ledger

- Live [BEDROCK](https://github.com/Satobloc/HsH/blob/main/BEDROCK.md), blob `527924246cc25caf7fac02dce4b20f024013cd19` (627 lines; current control source read in full for this pass).
- [Steering Charter 2026-10-26](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/STEERING_CHARTER_2026-10-26.md), blob `04822f3e48f746e9e464d893636ed4a670d68683`.
- [Three Paper Campaign](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/THREE_PAPER_CAMPAIGN_2026-10-26.md), blob `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`.
- [Task Branch Graph](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/TASK_BRANCH_GRAPH.json), blob `fc53157389b3052de8fc45ffdcc17d5034984435`, updated 2026-11-07 19:32Z; it records 18 branch records while declaring `branch_count=16` (Tern-owned; not edited).
- [P3 issue #566](https://github.com/Satobloc/HsH/issues/566), the controlling full-theory docket.
- HsH `main` head observed at `e5b2039ea7b42530de33160d00bed1196bff1844`; no worker branch was created.
- [Cross-Formalism Index](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/FORMALISM_INDEX/CROSS_FORMALISM_INDEX_2026-10-10.md), blob `cccca10267064650dffbc68dd0a6672ee65167e3`; navigation/translation index, not theory authority.
- Existing [joint-readout identifiability gate](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/relay36-joint-readout-identifiability-gate-20261103t0636z-001.md), blob `05d8ae7f5f4b734515ef70776e475ac36303715e` (P2 within-system channel/identifiability control).
- [Sable projection/composition and CI-scope audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/SABLE/2026-11-07T0504Z_PROJECTION_COMPOSITION_AND_CI_SCOPE_AUDIT.md), blob `ba6b254ce73b9b865732d798b696d699de3e7188`; source-to-map and proof-scope constraints, not a cross-sector coverage matrix.
- [STATE_OF_THE_THEORY](https://github.com/Satobloc/HsH/blob/main/STATE_OF_THE_THEORY.md), blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`; descriptive map subordinate to BEDROCK.
- Historical [SAT4D Covariant Field Equations](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%204D%20Theory%20Work/SAT4D_Covariant_Field_Equations.tex), blob `c2493431c743ab14e677aae0a18bce7fb32880da`, June 2025, author “SAT Framework Team.”
- Historical [SAT4D Sections Overview extraction](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT-O%20Theory%20Work/SAT4D_Sections_Overview.txt), blob `facb65271154235d7f08de50ef3ef5fe5cfef7f6`; OCR/glyph limitations recorded above.
- [SAT-O/Blockwave Lean-check draft](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/LEAN%20CHECK_drafts/SATO-BLOCKWAVE_leancheck.txt), blob `b128efd3004fe34e48dc7da2c39bdd14f9926ddc`; pseudo-Lean only, not a compiled proof.
- [Aster source-recovery delta](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ASTER/2026-11-06_TOPLESS_PRIOR_CONTEXT_RECOVERY_DELTA.md), blob `8971125f18e9cecad09b45c370e96a25159b2872`; bounded recovery lead, not an exhaustive source audit.

**Retrieval limits:** Mersearch was not exposed as a callable connector in this runtime and all four shared request lanes were occupied/requested. Bounded direct repository reads and existing receipts were used; this is not an exhaustive three-repository source search. The private HSH_RESOURCES repository was consulted for navigation only; no private path or content is reproduced here.

**Final status:** `P3_FIRST_PASS_CROSS_SECTOR_GRID_CREATED / WHOLE_SECTOR_HOLDOUT_PROTOCOL_PROPOSED / SOURCE_MAP_INCOMPLETE / NO_PHYSICAL_PREDICTION / NO_LEAN_THEOREM / NO_TIER_PROMOTION / NO_PAPER_GATE_ADVANCEMENT`.
