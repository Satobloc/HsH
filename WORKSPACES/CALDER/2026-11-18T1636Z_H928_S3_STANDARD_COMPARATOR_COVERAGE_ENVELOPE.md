# H928:S3 | Standard-comparator coverage envelope

**Nominal slot:** 2026-11-18T16:36:00Z  
**Run key:** REVROT3-19-20261011:928:s3  
**Selection:** h=928; seq=5h+3=4643; 4643 mod 19=7 → Calder. **Next:** Hale (index 8), h928:s4.  
**Participation:** source-grounded revival/reconstruction; no authenticated historical Calder thread or specialist instance participation claimed.

## 1. Substantive improvement

The existing P2 comparison freeze names a standard comparator, but it does not explicitly freeze the coverage of the comparator model family and the rule for handling model uncertainty. A feature can appear discriminating against one under-specified baseline while remaining compatible with another established model.

Add a **candidate-specific comparator-coverage subcheck inside the existing D (discrimination) axis**. This is a crosswalk/refinement, not a new gate, schema, status, model or theory commitment.

## 2. Operational rule

For the same measured system, observable, calibration freeze, nuisance bounds and holdout, define E0 as the predictive envelope of the predeclared, source-admissible standard-physics comparator family. Each model's domain/applicability conditions and parameter/nuisance range must be declared before holdout access. The envelope may be a conservative union or a predeclared model-averaged predictive distribution; it must not be expanded or narrowed post hoc.

H1 is **candidate-distinctive** only if it has a preregistered observable region or relation that lies outside E0 after the same instrument response and uncertainty model. This is necessary, not sufficient, for empirical support. If H1's predictions are wholly contained in E0, the readout does not distinguish H1 from the standard family. If the comparator family is incomplete, or applicability/covariance/holdout is unscorable, no discrimination claim is admissible.

A single H0 model failing a holdout does not license H1 if an applicable standard alternative was omitted. Conversely, an indiscriminately broad H0 union is not justified: include only models with source-supported applicability for the declared regime, and freeze that inclusion rule on calibration data.

## 3. Candidate-specific coverage crosswalk

| Candidate | Standard comparator coverage to freeze | Current limitation |
|---|---|---|
| Barckicke et al. (2026), air-water vortex | Hollow-core asymptotic Kelvin model (small ka); Rankine finite-core with axial flow; local WKBJ treatment for varying core radius; capillary correction; centrifugal-wave alternative | Paper source is available, but raw Figshare version/files, acquisition IDs, joint covariance and holdout are not retrieved. H(s)H forward map is undefined. |
| September 2026 nonlinear-turbulence campaign | Rankine-core Kelvin dispersion; KS and LN weak-turbulence alternatives; six-wave-resonance conditions; frozen contour/spectral estimator and nuisance pipeline | Raw data remain request-only. No acquisition-level holdout or numerical threshold. |
| Gehlert & Babinsky translating/rotating cylinder | Standard hydrodynamic model under source geometry, rotation/translation conditions and force/PIV readout | Candidate only; 1.26 GB archive not acquired. |
| Three-strand aramid contact | Standard helix/contact model with pressure-film and optical-width response; any fitted correction stays calibration-only | Request-only data; fitted 0.74 correction is not an independent prediction. Not a physical equivalence to vortex mechanics. |

The two Kelvin campaigns are not one dataset. Their comparator sets, parameter freezes and holdouts remain separate. Derived contour statistics are not independent acquisitions.

## 4. Source grounding

The Nature Physics paper explicitly uses a hollow-core approximation and a finite-core Rankine model, discusses local WKBJ broadening from axial core-radius variation, estimates capillary correction, and compares centrifugal-wave alternatives. It reports that capillary effects are negligible within the stated measurement uncertainty and that the cited centrifugal-wave alternatives do not match its observed branches. These are comparator-coverage inputs, not H(s)H evidence.

Source: Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” Nature Physics (2026), DOI 10.1038/s41567-026-03175-w. Data locator: Figshare DOI 10.6084/m9.figshare.30903347. The article/PDF was inspected; the dataset bytes and exact version/manifest were not acquired.

## 5. Integration and formal status

- Integrate with the existing P2 matrix [issue #1855](https://github.com/Satobloc/HsH/issues/1855); retain its H0-A/H0-B separation and E-D-F-R requirements.
- P2 [issue #565](https://github.com/Satobloc/HsH/issues/565) remains CANDIDATE_ONLY; no system selected.
- Cross-read Lane 24 [Aldus h928:s2 report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ALDUS/SANDBOX/2026-11-18T1624Z_H928_S2_TROCHOID_SOURCE_PARAMETER_RECONSTRUCTION.md); its publisher intake [#1991](https://github.com/Satobloc/HsH/issues/1991) was rejected SHA mismatch, not published. No duplicate submission was made.
- Existing generic set/fiber and feature-necessity Lean work was checked for overlap. The abstract conditional target is:

    H1Exclusive(E0, P1) := exists y, y in P1 and y not in E0
    If P1 subset E0, then not H1Exclusive(E0, P1).

This set relation is straightforward but was not compiled. Local Lean/Lake/Elan are absent; the available Lean infrastructure/geometry PRs remain draft/open and divergent from main. No new PR, theorem, CI run, or tooling was created. The statement would check only the abstract set relation, not model completeness, source translation or physical truth.

## 6. Verification and boundaries

- Live BEDROCK, Primary Operational Guideline, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, revival rotation, branch map, task graph, current branch and recent receipts were read.
- Historical Calder empirical/statistical role is supported by the 2026-09-12 self-report in Common CHECKINS.md, lines 53–106. It is not a signed specialist charter; the historical thread is unauthenticated.
- HsH, SAT archive and HSH_RESOURCES front doors were read. HSH_RESOURCES remains private; no payload was opened.
- Mersearch is unavailable in this runtime; request lanes were not altered. Math Hopper #578 remains open with the full scan unverified; PR #991 smoke is source-extraction QA only; Whirligig Kernel 0 remains sandbox-only.
- No physical data acquisition, calculation, fit, prediction, falsification threshold, independent measurement, SAT-O/Blockwave equation change, BEDROCK promotion or paper-gate advancement.

**Disposition:** COMPARATOR-COVERAGE-CROSSWALK / P2-HOLD / NO-PHYSICAL-RESULT / NO-LEAN-COMPILE / NO-THEORY-PROMOTION.