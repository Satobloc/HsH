# GW250114 direct-wave evidence-dependency crosswalk

**Run:** Workshop Relay :36, 2026-11-03 19:36Z  
**Run key:** `REVROT3-19-20261011:571:s3`  
**Selected ring label:** Hale (index 8); next label Elias Kern (index 9). Deterministic routing only; no authenticated historical Hale or Elias instance is claimed.  
**Status:** INTERNAL EXTERNAL-EVIDENCE APPLICATION / NO H(s)H THEORY IMPORT / NO PHYSICAL PREDICTION / NO P2 SELECTION.

## 1. Delta and controlling architecture

This is a case-level application of the existing Ariadne **Evidence Lineage × Readout Identifiability** proposal and the M87 acquisition-lineage application. It does not create a parallel schema, catalog, or tool.

The useful distinction remains:

- readout identifiability asks whether the forward map distinguishes the relevant latent states;
- evidence independence asks whether apparently separate results are genuinely separate acquisitions, events, simulation families, analyses, or only derivatives of shared inputs.

Those are orthogonal questions. The existing Ariadne contract already requires a typed provenance DAG and a multidimensional independence record. This report fills that record for one external-literature cluster and corrects a source-count error in the prior Hale addendum.

The External Research Firewall controls this work. The papers below are recorded as external `MODEL_RESULT`, `INTERPRETATION`, or `CITATION` only. No external equation, horizon interpretation, light-ring interpretation, or damping model is imported into SAT/H(s)H.

## 2. Main finding

The GW250114 direct-wave literature contains:

1. one principal event-level observation, GW250114, recorded in two LIGO detector channels (Hanford and Livingston);
2. several analyses of that same event;
3. multiple numerical-relativity analyses that reuse overlapping SXS waveform simulations;
4. a second event identifier, GW231226, mentioned by one preprint as a consistency check, not a documented blind holdout;
5. separate theoretical calculations that are not additional observations.

Therefore paper count, detector-channel count, waveform count, and independent astrophysical-event count must not be added together.

**Current event-level disposition:** one principal observed event for the direct-wave claim; one further event is mentioned in a separate consistency check, but its raw-data lineage and holdout status are not established here. There is no verified blind event-level replication of an H(s)H prediction.

## 3. Source-locked evidence nodes

### E1 — GW250114 detector event

The arXiv record for *GW250114 reveals black hole horizon signatures* identifies version 3 as last revised 2026-05-23 and links it to the 2026 Nature article, DOI `10.1038/s41586-026-10696-0`. The paper reports 90% credible matched-filter SNRs of `15.8^{+0.1}_{-0.5}` in LIGO Hanford and `17.1^{+0.1}_{-0.4}` in LIGO Livingston.

Those are two detector readouts of the same astrophysical event, not two independent mergers. The arXiv v3 and Nature article are one version/publication lineage, not two independent studies.

Raw H1/L1 strain was not downloaded, calibrated, or reanalysed in this run. The reported SNRs are source-reported measurements, not a new independent reproduction.

Sources:
- arXiv:2510.01001v3, submitted 2025-10-01; last revised 2026-05-23; journal reference Nature (2026): https://arxiv.org/abs/2510.01001
- Related journal DOI: https://doi.org/10.1038/s41586-026-10696-0

### E2 — Yoshimura Jxiv SXS amplitude study

Keiji Yoshimura's Jxiv version 1 was published 2026-10-14, DOI `10.51094/jxiv.6536`. It analyzes 12 SXS CCE numerical-relativity Bondi-news waveforms, comparing two rational-QNM removal prescriptions. The supplement specifies superrest-frame SXS ExtCCE Bondi news, Lev5, extraction radius R2, spherical `(2,2)` mode, and simulation IDs `CCE:0001–0012`.

The source reports that the median amplitude contrast changes from +1.35% under prescription-specific realignment to -34.22% after analytic common-epoch transport, -20.80% after explicit common realignment, and -31.35% without additional realignment. Its 68% coefficient intervals are conditional on fixed covariance-family hyperparameters and the selected downstream basis, fit interval, alignment, and reference-time convention; they are not a full uncertainty budget. After linear control for remnant spin, the reported synthetic-NR correlations fall from 0.943 to 0.047 and from 0.894 to 0.017. The supplement explicitly says N=12 has limited power and does not support an independent waveform-by-waveform correspondence.

Sources:
- Jxiv record: https://jxiv.jst.go.jp/index.php/jxiv/preprint/view/6536
- English supplement PDF: https://jxiv.jst.go.jp/index.php/jxiv/preprint/download/6536/14285/13826

### E3 — Dyer, Chung & Moore CCE set

The code repository accompanying arXiv:2606.25021 specifies the 13 publicly available SXS CCE simulations `0001–0013`, Bondi news, Lev5, radius R2. It says the main paper focuses on simulation 0004; other simulations are used in diagnostics.

Source:
- Code and data specification: https://github.com/Richardvnd/direct_waves
- Paper: https://arxiv.org/abs/2606.25021
- Published DOI recorded by the project: `10.1103/xftt-2n6t`

### E4 — Exact simulation-ID overlap: executed metadata calculation

The Yoshimura supplement lists `CCE:0001–0012`. The Dyer repository lists `CCE:0001–0013`, with the same CCE/Bondi-news/Lev5/R2 extraction family.

The following source-ID set calculation was executed in Python:

```python
Y = {f"CCE:{i:04d}" for i in range(1, 13)}
D = {f"CCE:{i:04d}" for i in range(1, 14)}
I = Y & D
U = Y | D
assert Y <= D
(len(Y), len(D), len(I), len(I)/len(Y), len(I)/len(U))
```

Output:

```text
(12, 13, 12, 1.0, 0.9230769230769231)
```

Thus all 12 Yoshimura simulation IDs occur in the 13-simulation Dyer CCE set: 12/12 containment, 12/13 coverage of the Dyer set, and Jaccard overlap 12/13 (92.3077%).

This is a metadata membership calculation, **not** a statistical independence score, physical calculation, or byte-level waveform identity test. Raw waveform files were not downloaded or hashed. The source specifications establish shared simulation IDs and extraction settings; exact byte equality remains untested.

Consequence: Yoshimura and Dyer are distinct analyses with no author overlap, but they are not independent CCE-simulation replications.

### E5 — Kankani & McWilliams direct-wave critique

The 2026-07-02 preprint arXiv:2607.02380 analyzes numerical-relativity strain data. It argues that the direct-wave frequency is not generally correlated with horizon frequency or surface gravity, apart from an incidental crossing near remnant spin 0.7, and that the damping time evolves enough to make a single fixed-damping sinusoid inappropriate.

This is an external model result, not a new detector-event acquisition.

Source: https://arxiv.org/abs/2607.02380

### E6 — Dyer et al. October synthesis and the corrected sample counts

The five-author preprint arXiv:2610.25176 was submitted 2026-10-18. It reports:

- 125 SXS simulations in the main mixed-parameter sample;
- **43 additional** anti-aligned/retrograde simulations in a separate comparison, not included in the 125;
- a 114-simulation aligned, non-precessing subset used for a separate figure;
- nearly 600 quasicircular, non-precessing SXS simulations for a separate BOB frequency fit.

The paper states that its 125-simulation set includes all simulations used in arXiv:2608.23209 and all simulations from arXiv:2607.02380 except SXS:BBH:2095, which is replaced by SXS:BBH:3584. It also includes all 13 publicly available CCE simulations. The exact overlap between the nearly-600 fit set and the 125-simulation set is not established by the retrieved summary; do not count those sets as independent or additive without the full ID lists.

**Correction to the prior Hale addendum:** its wording that the 125-simulation sample “included 43 retrograde cases” was inaccurate. The source says 43 are additional. The 114 aligned/non-precessing sample is a subset of the 125. The nearly-600 BOB fit sample is a separate analysis set with unresolved exact membership overlap. The earlier report is not overwritten; this file is the additive correction.

The October paper's three “strands” are distinct arguments within one paper. They are not three independent astrophysical observations. Its abstract says the early non-QNM component is not established as the previously defined direct wave and relates its properties to the remnant light ring rather than the horizon. That remains an external interpretation, not an H(s)H conclusion.

Source: https://arxiv.org/abs/2610.25176

### E7 — Han & Jiang transfer model and GW231226

The 2026-07-09 preprint, revised 2026-08-03, arXiv:2607.08570, models a finite-duration near-horizon source with redshift suppression and reports an observable envelope damping `gamma_eff < kappa`. It gives a GW250114 value and cites GW231226 remnant parameters as a consistency check against that event's residual profile.

GW231226 is a distinct event identifier in this paper, but the paper's language is “consistency check,” not a preregistered holdout. No public raw-strain release, exact acquisition manifest, independent reanalysis, or parameter-freeze/access audit for GW231226 was verified in this run. It therefore cannot be promoted to a blind replication.

Source: https://arxiv.org/abs/2607.08570

### E8 — Additional same-event and theoretical comparisons

- arXiv:2606.06592 applies a direct-wave area analysis to the same GW250114 event. Its author list overlaps the Dyer PRL paper through Adrian Ka-Wai Chung. This is an author-lineage flag and a same-event analysis, not a new event: https://arxiv.org/abs/2606.06592
- Ma & Wang's Schwarzschild Green-function paper, arXiv:2607.06677, is a separate theoretical calculation, not an observation. Sizheng Ma also appears on the GW250114 Nature paper, so the author-group lineage is not wholly separate: https://arxiv.org/abs/2607.06677

Author overlap is recorded separately from data dependence. Shared authors do not by themselves prove shared data; different authors do not make reused data independent.

## 4. Dependency vector for this literature cluster

| Axis | Current classification | Why |
|---|---|---|
| Physical event | ONE principal direct-wave event | GW250114 is the main event-level observation. H1/L1 are detector channels of that event. |
| Additional event | SECOND EVENT MENTIONED; HOLDOUT NOT ESTABLISHED | GW231226 appears as a consistency check; raw acquisition and access audit were not verified. |
| Simulation family | SHARED SXS LINEAGE | Yoshimura's 12 CCE IDs are contained in Dyer's 13; Dyer October explicitly reuses prior SXS simulation sets. |
| Analysis method | MULTIPLE, PARTLY DISTINCT | Rational-filter amplitude analysis, QNM/residual analysis, BOB modeling, transfer modeling, and area inference differ, but they share some inputs and authors. |
| Author/group lineage | PARTIAL OVERLAP | Dyer/Moore recur; Kankani/McWilliams recur; Chung recurs between two papers; Ma recurs between the Nature and Ma–Wang papers. |
| Version lineage | SAME STUDY | arXiv:2510.01001v3 and the linked Nature article are one preprint/journal lineage. |
| Calibration/covariance | INCOMPLETE | Yoshimura's intervals are conditional; no common raw covariance reconstruction across papers was performed. |
| Fit/holdout | NO BLIND H(s)H HOLDOUT | No H(s)H parameter-freeze timestamp or holdout-access audit exists. |
| Independent H(s)H replication | ZERO VERIFIED | No source-grounded H(s)H prediction has been frozen and tested on a separate event. |

Do not compress this vector to one “independent studies” count.

## 5. P2 prediction-readiness crosswalk

P2 issue #565 remains open and no real system has been selected. GW250114 is an external comparator/case study here, not a P2 selection.

| Required field | GW250114 case status |
|---|---|
| Identifiable physical system | Present: binary black-hole merger GW250114 |
| Versioned source and event | Present at paper level; raw acquisition manifest not retrieved |
| Units and observational summaries | Published SNR and model quantities available; no new strain-level uncertainty/covariance analysis |
| Shared standard comparator | Kerr/GR ringdown, numerical-relativity SXS waveforms, and the published competing light-ring/redshift interpretations |
| H(s)H source geometry | No GW250114-specific source-faithful worldtube plot or geometry witness |
| H(s)H forward map | MISSING: no source-grounded composition from W⁴/observer slice through a radiative field to detector strain and the fitted residual statistic |
| Shared H(s)H parameters | NOT DEFINED / NOT FROZEN |
| Calibration/holdout split | NONE |
| Predeclared observable and threshold | NONE; no threshold invented |
| Prediction-vs-fit separation | No H(s)H fit or prediction performed |

The necessary H(s)H map is not supplied by naming a direct wave, Kerr frequency, light-ring frequency, or surface-gravity parameter. The source-to-observable chain must be derived from operative SAT/H(s)H geometry and established physics, with each domain, codomain, composition, instrument response, unit, nuisance parameter, and uncertainty explicit.

No inference about intrinsic filament thickness, first-order coil scale, material-frame twist, or a Kerr/ER contact surface follows from these external ringdown analyses. They do not measure those H(s)H quantities.

A future admissible test would require: (1) a source-defined geometry and map; (2) identical measured inputs, detector response, shared nuisance parameters, and covariance for H(s)H and the standard comparator; (3) a parameter freeze before holdout access; (4) a separate event or other genuinely held-out acquisition; and (5) a preregistered predictive region and falsification rule. None is presently complete.

## 6. Proof, tooling, and source-access audit

- The existing Ariadne contract already proposes the typed evidence DAG and independence vector; the M87 acquisition-lineage report is an existing case application. This report applies them rather than creating a new schema.
- Existing conditional Lean work in PR #676 (generic identifiability) and PR #388 (holdout non-identifiability) was reviewed as relevant precedent. Neither proves the truth of these external source annotations.
- Local `lean`, `lake`, and `elan` executables are absent. No new Lean module, theorem, PR, or build was created. The existing Ariadne contract explicitly defers a generic provenance-graph theorem until the relation is operationally defined and a specific proof target is authorized. The finite source-ID intersection above was executed in Python; it is not a Lean proof.
- Existing HsH/HSH_RESOURCES routes, Math Hopper/Lean PR work, Whirligig, and the installed SciSpace route were checked before considering new tooling. SciSpace was used for discovery; original Jxiv/arXiv sources and the Dyer code README were then opened directly. The Dyer code repository reports zero forks. No new tool, dependency, paid service, or fork was created.
- All four shared Mersearch request lanes remain `requested`; no request was overwritten or added. No exhaustive three-repository Mersearch run is claimed.
- The external literature remains behind the External Research Firewall. No external theory was imported into BEDROCK.

## 7. Governance, publication, and continuity

- Current default branch read: `main`; preflight commit search returned `a7d7230292f03745e086239dae68549be3a048f6`.
- Live BEDROCK blob: `c0c5a80b40d41b77fa0b9f12c684e7e9cd6a8ec8`.
- Task Branch Graph blob: `d9df497e5d12350aa4e8fedfd3b4eec7b488b88d`.
- The selected worker's historical remit was recovered from the Hale September 12 check-in and Sable's REV-006 Hale re-entry packet: matched 2024/2026 literature scanning, external-evidence control, and statistical calibration. The packet is an assistant-authored synthesis of the check-in, not a Nathan-authored standalone charter. No authenticated current Hale thread or first-blush review is claimed.
- Latest Hale receipt located before this run: `2026-10-31T1924Z_s2_hale.md` (the :24 lane), with Calder's late optional incoming handoff. No matching prior :36 Hale receipt was located.
- Elias Kern's current workspace remains Track A workflow-switchboard prototype only; it has no independent production-workflow or SAT/H(s)H theory authority. The outgoing packet is optional context only, with no task, assignment, ownership transfer, or response obligation.
- P2 issue #565 remains open/unselected. P1 November 9, P2 November 30, and P3 December 14 remain separate; no paper gate advanced.
- The existing issue publisher remains uncorrected: workflow blob `689984b19027ed84f0e949f01c4d8a89edf68fee` still has a five-minute timeout and full checkout. Issue #1313 has zero confirmation comments; its expected artifact path is absent. This new case crosswalk was not submitted through a publisher path that has not been verified. No duplicate issue was created. Public addendum status: `PENDING_EXISTING_PUBLISHER_REPAIR`.
- FIE last full review: 2026-10-27; the 14-day rereview is not due until 2026-11-10.
- Lateral reading completed: `SAT Mark V/TheTANGLE.txt`, lines 1891–1920, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`; next cursor 1921. Useful unrelated surprise: the passage treats meaning as socially retained but disused material and uses a taboo phrase as a cultural timing/language boundary. This was an actual source read. No physical posture break is claimed.
- No physical calculation, raw strain download, SXS waveform download, fit, simulation, H(s)H prediction, geometry plot, new PR/branch/issue, BEDROCK edit, theory promotion, SAT-O/Blockwave equation change, or scheduler/task mutation occurred.

## 8. Next cursor

The next worker is Elias Kern. This is an optional case-study pointer for the existing Track A switchboard prototype: the GW250114 cluster demonstrates why evidence independence must be represented as separate event, acquisition, simulation-family, analysis, author-lineage, calibration, and holdout axes. Do not treat this packet as a request to alter the POC or production workflow.

**Disposition: SOURCE-DEPENDENCY CROSSWALK COMPLETED / EXACT SXS CCE OVERLAP COMPUTED / PRIOR 125-vs-43 COUNT CORRECTED / GW250114 REMAINS ONE PRINCIPAL EVENT / GW231226 HOLDOUT NOT ESTABLISHED / NO H(s)H PREDICTION / P2 UNSELECTED / PUBLICATION PENDING.**
