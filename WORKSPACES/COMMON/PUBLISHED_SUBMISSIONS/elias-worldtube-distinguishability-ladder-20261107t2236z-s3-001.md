# Worldtube Distinguishability Ladder and Evidence Matrix

**Status:** DESIGN NOTE / PROPOSAL ONLY / NOT IMPLEMENTED / NOT A PHYSICAL RESULT  
**Relay key:** `REVROT3-19-20261011:670:s3`  
**Scope:** Architecture, prediction, and evidence workflow. No POC, production, or Lean EvidenceLedger change.

## Executive result

The current worldtube claim gate has separate status axes for geometry, interaction/response, testability, empirical validation, and publication. The existing Lean witness layer binds source-to-formalization evidence and build outcomes, but does not yet bind the remaining axes to concrete projection maps, prediction rows, datasets, holdouts, and publication artifacts.

This run adds a durable **distinguishability ladder** and **gate-to-artifact matrix**. Its substantive refinement is a mandatory **calibration-ancestry** field: an observable is not an independent holdout merely because it is a different observable. If its model parameters or current operators were fitted to that observable, or to correlated observables, it is calibration-class.

This is a design specification only. A current Track B review boundary explicitly blocks POC/production changes and Lean EvidenceLedger extensions until independent disposition. No code was changed.

## Source and build footing

### H(s)H evidence gates

- `EliasWorldtubeClaimEvidenceGate.lean`, PR #951 head `4aa7b8e02f01bd2ed847332507c39782dbbd36a2`, blob `a34720b07942f973000271a961bf6363d1cd55dd`.
- `EliasWorldtubeEvidenceWitnessGate.lean`, same head, blob `938044dc22287c0c953ee59ecf743322c9e5b80d`.

The claim gate separates geometry, response, testability, empirical validation, base publication readback, and latest-branch readback. The witness gate binds source artifacts, formalized claims, translation review, and build outcome. Its scope note leaves geometry, response, testability, and empirical witnesses for later work.

PR #951 remains draft and unmerged. Run `42402136180`, job `128492003772`, succeeded on merge reference `57be06f5f95beb27fb23e0f4e676fe1ea36c04c0`. This is a merge-reference build, not an exact-head standalone build. The independent translation-review witness remains absent from the observed Ravel record.

### Ravel measurement and response work

PR #993 remains draft and unmerged. Current head `5e19d01b7f7ee9dc996e316dc82664a8a933585b`; merge reference `32cd73bc9b69145bc2d2d07556cb6538342449fe`.

- `RavelHelionJLabE04018DataGate.lean`, blob `53324ab00d9755ede488246062a2e4849532803d`.
- `RavelHeliumResponseCrossChecks.lean`, blob `667c300cd899cc6ec5ebd9dc7e7705ab5eb0774d`.
- `RavelHelionMagneticMomentLedger.lean`, blob `b80c6a7a71e3d456001f5914fa3d814e036aa9a8`.
- Root aggregator, blob `8bc9762286ef166696308b94b8323118d3bd963b`.

The current JLab, response-cross-check, and aggregator blobs match the successful merge-reference build. Run `42330897900`, job `128276931880`, built 8,952 jobs successfully. The captured log contains no `sorryAx` or `admit` hits. This is still a merge-reference build, not exact-head standalone verification or independent physical validation.

The JLab module formalizes the **standard Rosenbluth measurement layer** and exact-rational checks over published inputs. It proves that one reduced-cross-section point does not identify both standard form-factor contributions, while two points at distinct abscissae identify the two parameters in the stated linear model. This is not an H(s)H current-map result.

The response cross-check records a crucial dependency: the cited QMC electromagnetic current operators use five low-energy constants fitted to A=2-3 magnetic moments and deuteron observables. Therefore, the 3He magnetic-moment comparison is calibration-class, not an independent prediction. The 3He elastic Zemach result is a distinct cross-observable output but remains conditional on the fitted current operator. The HFS-extracted effective Zemach radius and elastic electron-scattering Zemach radius need not be identical estimands; their quoted difference is descriptive, not by itself a same-observable inconsistency.

### Published Ravel report readback

Issue #1202's artifact at `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-worldtube-em-readout-helion-holdout-20261101t0836z-s3-001.md` was fetched. Blob: `a07f0217aeaacc546fdb23f1b4271b380351baca`. Its text exactly matches the issue payload's `content` field. Publisher comment `6555779860` records SHA-256 `0c0572b38478800ab281c636aa4cfae953e05943d2da65600022a73e5c6b47ea`. This relay verified exact content equality; the digest is inherited from the publisher record, not recomputed here.

## Distinguishability ladder

A pass at one layer does not imply a pass at the next.

1. **Source and claim identity:** label Nathan Direct, historical source, standard reference, assistant reconstruction/proposal, and independent measurement separately. Claim maturity is a second axis.
2. **Geometry and representation:** every projection/coarse-graining step needs source space, target space, map artifact, domain conditions, and composition law. A verbal analogy is not a map.
3. **Interaction and response:** define the worldtube/timesheet response to a conserved current, including constitutive law, normalization, gauge/continuity conditions, and parameter dependencies.
4. **Standard readout:** carry that current through the standard measurement layer to the measured observable. The Rosenbluth map is a comparator/readout, not the missing H(s)H current map.
5. **Identifiability and calibration ancestry:** freeze shared and nuisance parameters and record every external fit dependency. A different observable is not an independent holdout if its model parameters were calibrated on it or correlated data.
6. **Prediction and holdout:** predeclare hypothesis, shared parameters, calibration/holdout protocol, predicted observable, standard comparator, falsification threshold, and prediction-versus-fit separation.
7. **Empirical validation:** bind measured system/dataset, provenance, units, calibration, uncertainty/covariance, holdout result, and independent review.
8. **Publication:** base artifact and each later branch addition require separate checksum/readback. A verified base report does not certify later additions.

## Geometry feature triage

The Ravel report distinguishes intrinsic core thickness `epsilon`, first-order coil scale `ell_f`, and the separate worldtube axis-to-circumference dimension. They must not be collapsed into one radius.

| Feature | Current position | Admission status | Required evidence |
|---|---|---|---|
| Intrinsic core thickness `epsilon` | Recorded as distinct from `ell_f` and the worldtube envelope dimension | Source-traceable; geometry map not established | Exact source definition, embedding/projection map, domain conditions, composition law |
| Worldtube axis-to-circumference thickness | No settled symbol or map in the current record | Unresolved, not forced | Explicit definition, map, units/scale, uncertainty propagation |
| Twist | Not forced by dimension count alone | Optional or unresolved | Source class/maturity, typed map, conditions, composition law, observable discriminator |
| Contact surface | Not forced by dimension count alone | Optional or unresolved | Operational definition, typed map, conditions, composition law, observable discriminator |
| Stiffness / elastic response | Not ruled out, but no complete constitutive law, units, or stiffness-to-geometry map is bound | Unresolved | Constitutive law, units, response map, identifiability, uncertainty propagation |

The current source chain distinguishes finite-core thickening/embedding `E_epsilon`, set-level support intersection `I_t`, timesheet/medium response `R_t`, and standard electromagnetic readout `P_EM`. The support-intersection construction has an existing formalization. The finite-core embedding and H(s)H-specific response map remain unestablished. The standard readout does not supply the missing response map.

## Candidate test matrix

| Candidate / observable | Measurement class | Calibration ancestry | Comparator / prediction requirement | Current verdict |
|---|---|---|---|---|
| Jefferson Lab E04-018 Table I, 18 cross-section points | Published measured cross sections with kinematics and quoted total errors; raw machine-readable event data and full covariance/normalization matrix are not bound in the current gate | H(s)H shared parameters and nuisance/correction model not frozen | One-core H(s)H map must predict the same raw cross sections as the standard nuclear-current/Rosenbluth comparator using the same split | Not scoreable until provenance, covariance, shared parameters, and holdout are supplied |
| E04-018 Table II, eight form-factor rows | Derived absolute magnitudes, not signed form factors; magnetic entry absent at Q²=49; high-Q² charge interval at Q²=60.8 contains zero | Derived from the cross-section analysis, not an independent dataset from Table I | Secondary readout check only | Cannot establish sign changes or a zero location; insufficient for a global rejection statistic |
| Schneider et al. 2022 bound-ion `g'_I` and HFS | Directly measured bound-ion factor and hyperfine splitting; bare-nucleus `g_I` uses calculated shielding | QMC current-operator LECs were fitted to A=2-3 magnetic moments and deuteron observables | Magnetic-moment comparison with those operators is calibration-class | Cannot count as independent prediction without removing or explicitly accounting for that ancestry |
| CREMA 2025 muonic charge radius | Theory-dependent extraction from measured muonic transitions, not a direct worldtube-envelope measurement | Calibration anchor only, not simultaneously a holdout | May constrain a shared radius parameter if frozen before separate validation | Do not double-count as calibration and validation |
| 3He elastic Zemach radius | Distinct cross-observable output from HFS-extracted effective Zemach radius | Still conditional on the fitted QMC current operator; estimands need not match | Cross-observable check only after ancestry and estimand mapping | Descriptive difference, not a same-estimand inconsistency or H(s)H validation |

### Minimal potentially distinguishing comparison

The candidate that could distinguish H(s)H from the standard two-form-factor description is a **single shared one-core geometry/current map** that predicts both charge and magnetic channels and the underlying cross sections with the same frozen parameters.

The comparator must use the same measured system, calibration/holdout partition, nuisance parameters, correction model, and uncertainty treatment. An unconstrained two-profile null is essential: if H(s)H can assign arbitrary independent functions to the two channels, it has the flexibility of the standard two-form-factor parameterization and supplies no distinctive prediction.

The falsification rule must be frozen before the holdout is opened and use the full experimental covariance plus model-prediction uncertainty. No numerical threshold is adopted here because the current evidence record does not bind those artifacts. A nominal 95% predictive region or p-value threshold would be a proposal, not an established result.

## Proposed gate-to-artifact admission contract

This is a reviewable design specification, not implemented code.

- **Geometry:** for each map, record source and target representations, map artifact, domain/boundary conditions, composition law, dynamics compatibility, coarse-graining, scale identifiability, uncertainty propagation, and slice/fiber contracts where applicable.
- **Feature triage:** classify thickness, twist, and contact surface as forced by a standard reference, stated by Nathan Direct, present in a historical source, independently measured, optional hypothesis, or unresolved. Keep source class and claim maturity separate. Optional hypotheses require a falsification route; unresolved features block geometry admission.
- **Prediction row:** bind hypothesis, shared parameter set and ancestry, calibration/holdout protocol, predicted observable, standard comparator, falsification threshold, and prediction-versus-fit separation.
- **Empirical witness:** require measured system/dataset, provenance, units, calibration, uncertainty/covariance, holdout partition/result, and independent review. Reviewer and study-author references must differ, but that alone does not prove independence.
- **Publication:** keep base artifact readback separate from latest-branch-addition readback.
- **Formalization:** keep source-to-formal trace, build run, exact module blob, axiom report, and independent translation review separate from empirical validation.

## Current gate disposition

| Axis | Current disposition |
|---|---|
| Source-to-formalization | Existing witness layer; merge-reference build succeeded; independent translation review still missing |
| Geometry | Status gate not passed; explicit map/domain/composition witnesses absent |
| Interaction/response | Status gate not passed; H(s)H-specific current response map and constitutive law absent |
| Testability | Status gate not passed; proposed matrix is not a frozen executable matrix |
| Empirical validation | Status gate not passed; raw dataset/covariance/holdout/independent review not bound |
| Publication | Base artifact readback verified; latest branch addition readback not checked |
| Full worldtube claim | Not admissible |

## Governance and next step

A current Track B inbox instruction withholds permission for POC/production changes and Lean EvidenceLedger extensions until independent disposition. No such change was made. PR #951 and PR #993 remain draft and unmerged. This note does not alter BEDROCK, a task graph, a worker charter, a production workflow, or a paper gate.

No physical calculation was performed. No synthetic physical fixture or data-free numerical example was introduced. No new tool, dependency, fork, paid service, or Mersearch request was created. The existing Math Hopper archive extractor was checked but is not a source witness or Lean build. Whirligig was not used as a physical equivalence. SciSpace is available in the runtime but was not needed for this source-grounded workflow audit.

**Next admissible step:** obtain the independent Track B disposition; then, if authorized, implement artifact-bound geometry/response/test/empirical witnesses in a focused reviewable change, run existing Lean CI, and require exact-head verification plus independent source-to-formal review. Until then, this matrix is a design contract only.
