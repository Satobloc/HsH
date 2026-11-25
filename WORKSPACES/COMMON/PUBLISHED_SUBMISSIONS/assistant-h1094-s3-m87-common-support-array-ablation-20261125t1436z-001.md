# M87* candidate: common-support array-ablation bridge

**Run:** `REVROT3-19-20261011:1094:s3`  
**Status:** assistant-authored measurement-architecture proposal; candidate-only; unreviewed. **No P2 system selection, blind holdout, physical prediction, fit, raw-data reanalysis, or theory promotion.**

## 1. Why this is an additive refinement

Existing [issue #1302](https://github.com/Satobloc/HsH/issues/1302) already establishes that the M87* 2017/2018/2021 products are distinct epochs but not independent-system replications, that the 2021 array change may test baseline-coverage sensitivity if predicted in advance, and that the published 2017–2021 comparison is retrospective rather than a blind holdout.

The existing [holdout-axis gate #1385](https://github.com/Satobloc/HsH/issues/1385) separates temporal, frequency, and instrument-regime generalization. This addendum does **not** repeat those classifications. It makes the previously identified 2021 baseline-coverage sensitivity test operational by adding a paired same-epoch array-ablation control and a cross-epoch common-support arm.

The primary external source reports polarized M87* images at 230 GHz for 2017, 2018, and 2021, and explicitly states that the 2021 baseline coverage improved through addition of the 12 m Kitt Peak Telescope and NOEMA. It also reports epoch-to-epoch changes in total intensity and linear polarization. [EHT Collaboration, A&A 704, A91 (2025), DOI 10.1051/0004-6361/202555855](https://doi.org/10.1051/0004-6361/202555855).

## 2. New control: separate source epoch from array support

Do not compare native 2017/2018/2021 image summaries and attribute every difference to source evolution. The measurement operator changed with the station complement and resulting baseline/uv coverage.

For each epoch \(e\), retain the full observation operator \(\mathcal O_{e,A}\), including Fourier sampling, station gains, polarization leakage/EVPA calibration, flags, time/frequency averaging, weighting, and the released calibration products. Let \(A_{\cap}\) denote the station/baseline support actually shared across the selected epochs, and let \(U_{\cap}\) denote the common uv-support domain under a predeclared matching tolerance and weighting rule. These sets must be derived from the raw acquisition manifests; neither their membership nor adequacy is assumed here.

### Four analysis arms

| Arm | Data operation | What it can establish | What it cannot establish |
|---|---|---|---|
| `2021_NATIVE` | Full 2021 station complement and native uv coverage | Published/native-array reference | Temporal change separated from array change |
| `2021_COMMON_RECAL` | Reprocess the same 2021 acquisition using only \(A_{\cap},U_{\cap}\), with calibration solved on that subset | Same-epoch paired sensitivity to station/uv support under subset calibration | Independent replication; a different acquisition |
| `2021_COMMON_AFTER_FULLCAL` | Calibrate the full 2021 array, then restrict the calibrated data to \(A_{\cap},U_{\cap}\) | Sensitivity to calibration solutions that used the added stations | A clean subset-only calibration |
| `2017_2018_2021_COMMON` | Reprocess each epoch on the common support and common weighting, retaining epoch-specific calibration solutions and covariance | Retrospective cross-epoch comparison with reduced sampling-support differences | Identical calibration, a blind holdout, or proof that source evolution is the only remaining difference |

The two 2021 common-support arms are intentionally distinct. Do **not** assume that data restriction and calibration commute. The comparison

\[
\Pi_{\cap}^{\mathrm{data}}\,\mathcal C_{2021,\mathrm{full}}(V_{2021}^{\mathrm{raw}})
\quad\text{versus}\quad
\mathcal C_{2021,\cap}\!\left(\Pi_{\cap}^{\mathrm{data}}V_{2021}^{\mathrm{raw}}\right)
\]

is a proposed operator-order sensitivity check, not a claim that either expression has been evaluated. Here \(\Pi_{\cap}^{\mathrm{data}}\) is a data-space baseline/uv restriction, not a timesheet intersection or a projection of the physical worldtube.

A station-name intersection alone is insufficient: the common uv domain, time/frequency averaging, flags, weights, polarization calibration, and covariance must also be specified. If \(A_{\cap}\) or \(U_{\cap}\) is too sparse to resolve the chosen readout under the actual uncertainty model, return `COMMON_SUPPORT_INSUFFICIENT` or `PRACTICALLY_UNIDENTIFIABLE`; do not loosen the match after seeing the result.

## 3. Candidate test matrix

| Hypothesis | Shared parameters and calibration | Calibration / holdout | Predicted observable | Standard comparator | Falsification condition |
|---|---|---|---|---|---|
| \(H_0\): standard accretion-flow account | Same source parameters, station gains, leakage/EVPA policy, averaging, noise model, and covariance used by \(H_1\) | Freeze model and calibration policy before any genuinely unseen acquisition; preserve epoch-specific calibration uncertainty | Calibrated complex visibilities and cross-hands; image-derived \(\beta_2\) and EVPA-helicity summaries secondary | GRMHD plus general-relativistic polarized radiative transfer, including spatially varying Faraday contributions | A preregistered covariance-aware predictive failure on untouched data, not a retrospective interval mismatch |
| \(H_1\): H(s)H candidate | Exactly the same observation operator, nuisance freedom, data, and covariance as \(H_0\); geometry parameters must be source-defined and not freely retuned per epoch | Same freeze and holdout rules as \(H_0\); no epoch-specific rescue parameters | The same visibility/cross-hand products, with a derived—not independently fitted—\(\beta_2\) summary | Same matched \(H_0\) above | Reject only the tested H(s)H map/version if its frozen predictive distribution fails while the matched comparator passes |
| `ARRAY_SUPPORT_CONTROL` | Same 2021 acquisition; compare native, common-subset recalibrated, and full-calibrated-then-restricted arms | Paired within-epoch diagnostic; not an independent holdout | Change in visibility-domain and secondary image-domain readouts caused by support/calibration choice | Same 2021 source state processed through the declared alternative operators | If the readout is support-sensitive, the native-array difference cannot be assigned to source evolution without the operator model |

**Holdout correction:** the 2025 paper already analyzes 2017, 2018, and 2021. For a model developed with that paper or the existing HsH summaries, none of those epochs is a blind holdout. The common-support arms can provide retrospective robustness and identifiability checks only. A genuine blind predictive test requires a future unexposed acquisition or an independently acquired system, with a recorded parameter-freeze timestamp and holdout-access audit. The 2021 full-vs-common pair is one acquisition processed two ways, not two independent observations.

The 2021 345 GHz product remains a frequency-generalization candidate, not a temporal holdout merely because it is a different band. The existing #1385 gate remains controlling for that distinction.

## 4. Geometry-to-readout boundary

The required H(s)H composition remains incomplete:

\[
\text{worldtube/core geometry}
\rightarrow \text{electromagnetic current and field orientation}
\rightarrow \text{synchrotron emissivity/absorption}
\rightarrow \text{Stokes }(I,Q,U,V)
\rightarrow \text{Faraday transfer}
\rightarrow \text{complex visibilities}
\rightarrow \text{measured readout}.
\]

The source-grounded H(s)H map must define the domains, codomains, composition order, and conditions for each arrow. The array-support restriction acts downstream in data/readout space; it is not a geometric projection of the worldtube.

No added worldtube thickness, material-frame twist, normal-bundle connection, or contact surface is forced by the 2021 station change or by an EVPA-helicity pattern. Finite thickness requires a source-defined radius/profile and an observable coupling; material-frame twist requires a defined frame/connection and transport law; a contact surface requires a second support, contact relation, and constitutive interaction. These remain optional until the source and map make them necessary and testable.

The existing [M87 polarimetric readout report #1297](https://github.com/Satobloc/HsH/issues/1297) correctly distinguishes \(\beta_2\)/EVPA helicity from direct worldtube twist and records the missing geometry-to-Stokes/Faraday map. The 2017 Stokes-I audit [#1565](https://github.com/Satobloc/HsH/issues/1565) is not a substitute for the polarimetric data needed to test polarization-only signatures.

## 5. Minimum evidence package before computation

1. Exact 2017/2018/2021 raw or calibrated product IDs, release versions, file hashes, acquisition/day/band IDs, station lists, baseline lists, and parent/derivative manifests.
2. Per-epoch uv-coordinate support, flags, time/frequency averaging, weights, and a frozen \(A_{\cap},U_{\cap}\) construction with adequacy criteria.
3. Calibration pipeline/version, station-gain and polarization-leakage/EVPA solution identities, subset/full-array calibration provenance, and the joint measurement/calibration covariance with support and effective rank.
4. Frozen \(H_0\) and \(H_1\) versions, common physical and nuisance parameters, source-evolution rule, observation operators, analysis code commit, calibration split, holdout identity, and holdout-access audit.
5. A preregistered covariance-aware predictive region and multiplicity treatment. No numeric falsification threshold is frozen until the actual covariance and holdout package are retrieved and validated.

## 6. Reuse and limits

- Existing issue #1302 supplies the acquisition-lineage classification and identifies the 2021 station change as a possible baseline-coverage sensitivity test.
- Existing issue #1385 supplies the holdout-axis and outcome gate.
- Existing issue #1297 supplies the uniform-phase null and the unresolved geometry-to-Stokes/Faraday boundary.
- Existing PR #873 supplies conditional projection/factorization mathematics. Reuse it when the actual maps are defined; do not create a duplicate generic theorem.

No Mersearch lane was available for a new archive query; all four lanes remain occupied. This report uses the existing source records and the public 2025 EHT article. The full article PDF and raw 2018/2021 products were not independently downloaded or inspected in this run. No claim is made that the full paper lacks a matched-subarray analysis; that must be checked against the complete methods and released data before implementation.

**Disposition:** `M87_CANDIDATE_ONLY / COMMON_SUPPORT_BRIDGE_PROPOSED / RETROSPECTIVE_NOT_BLIND / RAW_DATA_NOT_RETRIEVED / COVARIANCE_NOT_RECONSTRUCTED / H1_FORWARD_MAP_MISSING / P2_HOLD / NO_PHYSICAL_CALCULATION / NO_FIT / NO_PREDICTION / NO_THEORY_PROMOTION`.

This is an assistant-authored workflow proposal, not Nathan Direct, not an independent review, not an empirical result, and not a P2 system selection.
