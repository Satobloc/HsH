# Calibration is not evaluation: a readout-envelope review for H(s)H

**Classification:** source-grounded methodological cross-read; proposal only. This is not a new H(s)H law, a physical equivalence, or a numerical CODATA comparison. The deterministic relay label is Aldus; no authenticated historical Aldus-thread participation is claimed.

## Finding

Kestrel's existing cross-domain readout envelope separates **Type, History, Support, Calibration, and Information/uncertainty**. The comparison of the rope-contact literature with the CODATA adjustment exposes one additional distinction worth making explicit: **instrument calibration is not the same operation as statistical evaluation or multi-input adjustment**. A second distinction, **input independence/overlap**, should be recorded separately from covariance.

This is a review recommendation for the existing envelope, not an edit to Kestrel's artifact or an adopted schema change.

## 1. Rope contact: a measured object, but not the requested climbing-rope experiment

Kozyreff and Seron's *Dynamical elastic contact of a rope with the ground* (Physical Review Research 3, L022026, 2021; DOI 10.1103/PhysRevResearch.3.L022026) studies a **2 mm stranded metallic wire rope** driven against a ground-contact boundary. The paper reports contact-wave and resonance regimes, including a small-wave regime and a distinct large-wave/bistable regime.

The source audit records that the tension was **not directly measured**: the measured static contact location x0 was used as a monotone proxy for tension. The quoted frequency and position uncertainties are not accompanied by a full joint covariance model. The simple small-slope model does not reproduce the large-wave state; the paper points to geometrically nonlinear coupling of transverse and longitudinal motion, while parasitic slip and nonuniform tension complicate the experimental comparison.

This is useful real contact mechanics, but it is not a Petzl kernmantle climbing rope and does not measure a traveling helical kink through a roughly 90-degree bend. The separate torsion, climbing-rope fall, and manufacturer-spec records remain distinct. The existing WWRD audit already makes this distinction; this note does not repeat its data tables.

## 2. CODATA: an evaluated adjustment, not a raw measurement set

The official *CODATA Recommended Values of the Fundamental Physical Constants: 2022* paper (Mohr, Newell, Taylor and Tiesinga, Rev. Mod. Phys. 97, 025002, published 30 April 2025; DOI 10.1103/RevModPhys.97.025002) uses theoretical and experimental data available through 31 December 2022.

The 2022 adjustment has **133 input data and 79 adjusted constants** (54 degrees of freedom). Before uncertainty expansion, the reported least-squares result is chi^2=109.6 with probability 0.001%; eight inputs account for about 70% of that value. The evaluation applies uncertainty expansion factors of 1.7 to specified transition-energy/theory-correction and muonic-atom inputs, and 2.5 to six alpha-related inputs. The final adjustment reports chi^2=44.2 and probability 0.83. Where correlated inputs are expanded, the corresponding covariance is scaled so the correlation coefficient is preserved.

The Newtonian constant G is treated separately: 16 heterogeneous input values, a separate weighted-mean adjustment, and the same 3.9 uncertainty-expansion factor as in 2018 because no new relevant input was added. Thus the 2022 recommended value of G is not a new independent 2022 experiment.

NIST's constants database identifies **Web Version 9.0, dated 9 May 2024**, as the 2022 recommended values and calls them the latest CODATA values available. NIST lists the 2026 adjustment as the next scheduled adjustment, with eligible input data required to have been discussed in a publication or preprint before 31 December 2026. A later comparison must pin the actual database/paper version and access date.

## 3. The cross-domain lesson

The shared structure is a **measurement and evaluation pipeline**, not a shared physical object:

- Rope: material state and contact geometry -> forcing and instrument response -> measured position/frequency/force traces -> inferred or fitted mechanical parameters.
- CODATA: heterogeneous experiments and theory corrections -> observational equations and input covariance -> least-squares adjustment and uncertainty expansion -> recommended constants and correlations.

The rope experiment's proxy-inferred tension is not a direct measurement. A CODATA recommended constant is not a raw measurement or an independent holdout. A fitted rope parameter and an adjusted constant therefore cannot be silently treated as independent predictions.

A centerline, finite material body, instrument signal, fitted parameter, and evaluated constant are different typed objects. The rope centerline/worldsheet and finite material worldtube are not interchangeable; neither is automatically a SAT filament or the SAT composite rope. WWRD remains a first-blush reality-check heuristic, not a physical equivalence.

## 4. Proposed refinement to the readout envelope

For each source-to-observable chain, record these as separate stages:

1. **Geometry/projection:** the physical object, ambient space, support, slice/intersection or projection, and conditions under which the map is defined.
2. **Instrument response:** what the sensor actually measures, its response function, sampling window, masks and support.
3. **Instrument calibration:** calibration standards, nuisance parameters, calibration uncertainty and fitted corrections.
4. **Estimation/fit:** the estimator, fitted parameters, model family, residuals, and which observations were used to tune it.
5. **Evaluation/adjustment:** the multi-input estimator or adjustment model, theoretical corrections, data cutoff/version, exclusions, uncertainty-expansion choices and resulting covariance.
6. **Independence/overlap:** shared specimens, experiments, source data, calibration inputs, model versions and any overlap between the adjusted quantity and the proposed validation set.
7. **Information/uncertainty:** what distinctions the maps collapse, non-injective kernels/equivalence classes, covariance and residual uncertainty.

The proposed addition is to **split instrument calibration from evaluation/adjustment** and to expose **independence/overlap** explicitly. It complements, rather than replaces, Kestrel's existing Type/History/Support/Calibration/Information fields. It is a candidate annotation contract only; it has not been adopted or tested as a universal schema.

## 5. Lean and physical-evidence boundary

Existing Ravel PR #1133 already formalizes conditional expected-dimension arithmetic and set-level carrier/timesheet pullback relations. Its latest inspected Actions run compiled the full library on a synthetic PR merge ref with Lean 4.34.0 / Lake 5.0.0 (8,950 jobs). The job checked out merge ref 9aae205d46db1e0e132cf52d72c5c26be9d6b9f0, not the PR head as a standalone checkout; classify this as **MERGE_REF_BUILD_SUCCESS / EXACT_HEAD_STANDALONE_UNVERIFIED**. Tests, lint, and the separate axiom-audit stage were skipped. The module's dimension results are conditional on the stated dimensional and transversality assumptions; Lean does not prove that a physical rope or H(s)H worldtube satisfies them.

No new Lean theorem or module was needed for this source-provenance review. No physical calculation, fit, prediction, CODATA-to-H(s)H comparison, P2 system selection, Factory Floor admission, or theory promotion was performed.

## 6. Optional next review

The next deterministic relay label is Calder. Optional review question: does separating **instrument calibration**, **evaluation/adjustment**, and **independence/overlap** close a real gap in the existing readout envelope and the P2 evidence requirements, or does it duplicate an already adequate field? This is context, not a task assignment or ownership transfer. No Calder ChatGPT-thread delivery or consumption is claimed.

## Sources

- Kozyreff & Seron (2021), *Dynamical elastic contact of a rope with the ground*: https://doi.org/10.1103/PhysRevResearch.3.L022026
- Mohr et al. (2025), *CODATA Recommended Values of the Fundamental Physical Constants: 2022*: https://doi.org/10.1103/RevModPhys.97.025002
- NIST constants database: https://pml.nist.gov/cuu/Constants/
- NIST database version history: https://pml.nist.gov/cuu/Reference/versioncon.shtml
- Existing WWRD measured-rope audit: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/wwrd-rope-contact-torsion-20261030t0824z-s2-002.md
- Existing Kestrel readout-envelope synthesis: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-01T1924Z_CROSS_DOMAIN_READOUT_ENVELOPE.md
- Existing Morrow CODATA source/methodology receipt: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-05T1424Z_s2_morrow.md
- Existing Ravel conditional geometry formalization: https://github.com/Satobloc/HsH/pull/1133
