# Hale :48 | BEC Bragg open-data comparator audit

**Nominal slot:** 2026-10-31T11:48Z  
**Run key:** `REVROT3-19-20261011:491:s4`  
**Selection:** h=491; seq=5h+4=2459; 2459 mod 19 = 8  
**Selected label:** Hale (index 8)  
**Next label:** Elias Kern (index 9)  
**Participation:** CURRENT_ASSISTANT_SOURCE_GROUNDED_RECONSTRUCTION / NOT_AUTHENTICATED_HISTORICAL_HALE

## 1. Identity, authority and controls

Hale's historical specialist source is `WORKSPACES/SABLE/WAKE_PACKETS/REV-006-HALE-REENTRY.md`, blob `2840500bec1873fc634e564f83d7eda7d1da74f0`. It establishes an external-literature landscape, Python/code/scoring/statistical-calibration and matched-period comparison remit. Hale was externally exposed by design and is not a blind theory reviewer. The 2026-09-12 check-in supports the Hale continuity identity; it does not authenticate a current Hale conversation ID or current thread access.

The incoming Calder handoff `2026-10-31T1136Z_from_s3_to_s4_hale.md`, blob `304d052bf0cd57f46ca710181a547ffb4abf9b8b`, and Calder receipt `2026-10-31T1136Z_s3_calder.md`, blob `6ea090c01d1698334f7e66a53c4d3c215982a645`, were read. Calder's corrected Seo et al. (2017) source and sign-permutation design are treated as prior work, not repeated.

Controlling material read:
- BEDROCK.md, blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`, 568 lines. ND-2026-10-25-01 requires genuine measured systems/data for calculations and specific prior Nathan permission for any data-free calculation. BR-007 requires Mersearch first for archive research.
- Steering Charter 2026-10-26, blob `5f4263381afcb065e9062d5b5885593d0baa58db`.
- Three Paper Campaign, blob `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`.
- New Instance Start Here, blob `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0`.
- Revival Rotation V3, blob `90863a2a2b82b2d8e37ba1bd9f796389066f5409`.
- Task Branch Graph, blob `3c341c616aa893bf56ad5ad5919e09a17e0c2b46`, updated 2026-10-30T06:12Z.
- Code Grurple roster, blob `cc96c0bfafc95c54e7960899c7306031e5abce17`; Presentation Gate, blob `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`.
- Active automation roster, blob `603315c321b05572e99061bed2a2d121782f6f17`.
- Mersearch Worker Start Here, blob `086778737a004c467b0b52142d71ab5a961fc166`; Mersearch Releases, blob `e44316bd01a5d8618433e866a209fe63e04e25a6`; Mersearch Research Platform, blob `d841660211892a2474e5bfceb42719ce73e7ae70`.
- Hale inbox and latest prior Hale report/receipt.

## 2. Mersearch-first status

All four shared request lanes remain occupied or unreleased. The four current request files were inspected:
- Lane 1: Orson cognition-bank request; request JSON remains `requested`, while its request-scoped manifest/compact receipt record completed execution. The request file is not silently treated as released.
- Lane 2: `archive-harvest-20261025-optics-01`, status `requested`.
- Lane 3: `aldus-o9-blockwave-equation-genealogy-20261031-1124`, status `requested`.
- Lane 4: `ariadne-kirk-riley-source-lineage-20261031-1119`, status `requested`.

No lane was overwritten, released or resubmitted. The local runtime has no checked-out three-root SAT/HsH/HSH_RESOURCES Mersearch corpus. Therefore **no Mersearch query was run**. The external-paper and data-catalog review below used the installed SciSpace app plus bounded public primary-source/catalog retrieval. This is not an archive Mersearch result and does not establish absence or novelty in the SAT/H(s)H archive.

## 3. Primary-system distinction: Seo 2017 is sodium

Calder's correction is retained: Seo, Ko, Kim and Shin, *Observation of vortex-antivortex pairing in decaying 2D turbulence of a superfluid gas*, Scientific Reports 7, 4587 (2017), DOI 10.1038/s41598-017-04122-9, used **23Na in |F=1,mF=-1>**, not 87Rb. Its reported sign readout uses a local derivative of the Bragg differential signal over a stated integration window, with crescent-core morphology used when close dipoles produce weak or absent Bragg signal. Data are available from the corresponding author on reasonable request. The raw Seo image series, shot-level vortex catalog and covariance table remain unobtained; no request was sent in this run.

The Calder report and corrected public artifact #1150 already document the isotope correction and conditional shot-level null design. No repeated parameter-ratio calculation is presented here.

## 4. New closer external comparator: Johnstone et al. 2019

Johnstone et al., *Order from chaos: Observation of large-scale flow from turbulence in a two-dimensional superfluid*, Science 364(6447), 1267-1271 (2019), DOI 10.1126/science.aat5793; preprint arXiv:1801.06952.

This is a separately conducted Monash/NIST experimental programme using a highly oblate, approximately uniform **87Rb** BEC in the F=2,mF=2 state. It is not the Seo sodium system and is not a direct replication of Seo's decaying-turbulence result.

Reported apparatus/readout details include:
- Approximately 2.2 million atoms and 67(3)% condensate fraction in a 125 x 85 micrometre hard-walled elliptical trap.
- Final trap frequencies approximately 2 pi x (1.8, 1.6, 108) Hz; healing length approximately 0.5 micrometres.
- Grid turbulence generated by optical barriers; hold times 0.5 to 5.0 s in 0.5 s increments.
- 25 repeated experiments per hold time after each obstacle-grid sweep; plotted results retain 10-25 measurements per hold time after image-quality rejection.
- Bragg pulse of 600 microseconds after 300 microseconds expansion, two-photon detuning 900 Hz, and approximately 6 ms separation before imaging.

### Distinct sign-assignment algorithm

The Johnstone pipeline is materially different from Seo's local derivative plus morphology fallback:
1. Blob detection supplies initial vortex positions.
2. Human inspection adjusts detections; images with hard-to-distinguish vortices, strong fringes or unusually low atom number are rejected.
3. For every possible sign assignment, a point-vortex model (including image vortices) computes the flow field.
4. The model flow is projected onto the Bragg-beam axis.
5. The sign of the projected flow is compared with the Bragg differential signal within 5 micrometres of each vortex.
6. The sign configuration with the largest number of matching pixels is selected.

This is a global, model-conditioned assignment, not independent sign ground truth. The best configuration is selected on the same Bragg pixels used to score it. A large in-sample maximum therefore is not a calibrated sign-classification accuracy.

The paper's Supplementary Figure S7 gives one example with 14 vortices, hence 2^14 = 16,384 candidate sign configurations, and 606 compared pixels. It reports 297 matches on average across configurations, 303 as half the pixels, and 487 for the best configuration.

A bounded Python calculation on those source-reported counts gives:
- Best selected score: 487/606 = 80.3630%.
- Mean score across candidate configurations: 297/606 = 49.0099%.
- Best-minus-mean: 190 pixels, or 31.3531 percentage points.

These are derived ratios for one published example frame. The best score is a selected maximum over 16,384 configurations, not an out-of-sample accuracy, p-value or error rate. The full score distribution and an independent ground-truth label are needed for calibration.

### Public raw-data and code route

Monash Research Data describes an HDF5 experiment dataset, DOI **10.26180/5BDB8A1059E79**. Each file corresponds to one experiment run and is described as containing the labscript experiment logic, hardware instructions, raw images and analysis results. The catalog lists **CC BY-NC-SA 4.0**. This is the closest open raw-image Bragg comparator found in this bounded pass.

The existing code repository `shjohnst/BEC-vortices-2D` contains Monte Carlo and experimental-analysis code and is licensed GPL-3.0. Its README points to a separate code/materials deposit DOI 10.26180/5bdf9e6d58d59. Do not confuse that code/materials DOI with the raw HDF5 experiment-data DOI above.

The data landing page and repository metadata were inspected, but no HDF5 files were downloaded or checksum-verified in this run. File-level access, exact inventory, version, run count and retained/rejected-image completeness remain pending.

## 5. Complementary position-only dataset: Gauthier et al. 2019

Gauthier et al., *Giant vortex clusters in a two-dimensional quantum fluid*, Science 364 (2019), DOI 10.1126/science.aat5718; preprint arXiv:1801.06951.

This is a separate 87Rb BEC experiment in a bounded elliptical geometry. The paper explicitly states that the apparatus did **not** determine vortex circulations. Circulations were inferred from vortex position relative to the ellipse's minor axis and checked against numerical simulations.

Zenodo record 2548958, DOI 10.5281/zenodo.2548958, provides an experimental vortex-position archive, including `Exp_Vortex_Location_Data.zip` (250.9 kB), and Monte Carlo output including `Raw_MC_output.zip` (4.8 MB). The dataset is listed CC BY 4.0.

This is useful for position-level clustering and sensitivity analysis of geometry-based inferred signs. It is **not** a direct sign-resolved Bragg dataset and must not be counted as independent sign measurement.

The two 2019 Science studies were described by their authors as independent and simultaneous observations of Onsager vortex states. They are complementary experimental programmes, not two independent validations of Seo's specific 23Na C2 result.

## 6. Statistical and methodological implications

Three distinctions now matter:
- **Seo 2017:** 23Na, decaying turbulent sample, local Bragg-derivative sign readout with morphology fallback; raw shot data on reasonable request.
- **Johnstone 2019:** 87Rb, Bragg sign readout using global point-vortex model selection; public HDF5 raw-image/run-data route.
- **Gauthier 2019:** 87Rb, position-level data; signs inferred from a geometric location rule, not measured directly.

The same nearest-neighbor C2 statistic appears in Seo and Johnstone. The 2Nv neighbor relations remain within-shot dependent; the experimental run/shot is the candidate independent unit. For Johnstone, variable retained n=10-25 follows manual image-quality rejection. This is a potential selection mechanism to audit, not evidence that the rejection caused bias.

A defensible follow-on analysis, after obtaining the Monash HDF5 files, would:
1. Pin the dataset version, per-run file hashes, run metadata, all attempted runs and retained/rejected status.
2. Reproduce the authors' existing analysis using their GPL-3.0 repository before writing replacement code.
3. Compare the published global sign-configuration method with a separately specified local Bragg-derivative method on the same raw frames.
4. Use spatially blocked held-out Bragg pixels for out-of-sample scoring; random pixel splits alone risk leakage because neighboring pixels are correlated.
5. Check sign-assignment stability across held-out spatial blocks and distinguish model-selection score from ground-truth accuracy.
6. Preserve run/hold-time structure; bootstrap or model at the run level, not the 2Nv neighbor-edge level.
7. Use Gauthier's position archive only for position-based metrics or explicitly labeled geometry-inferred signs.
8. Request Seo's raw 23Na images/catalog only if authorized; do not substitute 87Rb constants or observations for sodium.

## 7. P2 and H(s)H boundary

The live task graph still lists P2 active with no owner and no selected dataset. Issue #565's latest inspected docket material includes GW170817 and the earlier Meridian BEC finite-core/readout comparator; Calder's corrected Seo artifact #1150 is an additive comparator/source correction. No P2 dataset selection or paper advancement is made here.

The Johnstone and Gauthier data are **standard-physics external comparators/data-access leads only**. No source-authenticated SAT/H(s)H worldtube-to-medium/readout map was established in this run. No cross-sector explanatory power was tested. They are not H(s)H construction candidates, predictions, fits or validations.

The explicit C2 formula is a Lean/formalization trigger. A data-free theorem about its abstract range would require specific prior Nathan permission under BEDROCK ND-2026-10-25-01. No such proof was attempted or compiled. No physical calculation, model fit or uncertainty propagation was performed.

## 8. Tools, publication and limits

- SciSpace was used for discovery; primary papers and dataset/catalog records were inspected directly.
- Existing `shjohnst/BEC-vortices-2D` code was identified; no new software, fork, dependency or service was created.
- No paid service or subscription was used.
- No raw data bytes were downloaded, so no file checksum, code replay or empirical reanalysis is claimed.
- The Johnstone HDF5 license is CC BY-NC-SA 4.0; the Gauthier position dataset is CC BY 4.0; the Johnstone analysis repository is GPL-3.0.
- Code Grurple remains ACTIVE. No manuscript, reader, feed, public issue, PR, branch, paper gate, task graph or BEDROCK theory status was changed. This report remains an internal research note; no public publisher action was attempted.
- P1 Nov 9, P2 Nov 30 and P3 Dec 14 remain separate. Orson retains P1 cognition ownership.
- FIE rereview is not due; last full review remains 2026-10-27. The last recorded unrelated-reading break in Hale's current inbox was TheTANGLE, ending at the line-1201 cursor; no duplicate break was performed here.

## 9. Next cursor

First obtain and checksum the Monash HDF5 experiment dataset and its run inventory. Then reproduce the existing Johnstone analysis, including image rejection, before comparing global versus local Bragg sign assignment. Keep Gauthier position data as a separate sign-free/inferred-sign control. Do not infer Seo's 23Na sign-error rate from 87Rb data. Do not connect either dataset to H(s)H until Nathan's original relevant construction and a typed, testable medium/readout map are recovered.
