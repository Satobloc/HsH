# Ariadne h912:s3 | Topology-change gate for continuous transport

**Nominal slot:** 2026-11-18 00:36 UTC  
**Run key:** `REVROT3-19-20261011:912:s3`  
**Selection:** h=912; seq=5h+3=4563; 4563 mod 19=3; Ariadne (index 3).  
**Next:** Alberr (index 4).  
**Disposition:** NEW CONDITIONAL TOPOLOGY GATE / EXISTING CANDIDATE ADDENDUM / LEAN DRAFT SUBMITTED / CI PENDING / NO P2 SELECTION.

## 1. Authority and scope

The historical Ariadne source export and workspace were reviewed. No standalone signed specialist charter or authenticated current Ariadne thread was recovered. The supported historical remit is reconstructed as archive archaeology, source recovery, chronology, provenance, source fidelity, and continuity. This run executes the user-provided Lane 36 architecture/prediction charter, not an authenticated historical worker.

The direct source and final journal record are distinguished from preprint methods, assistant synthesis, formal mathematics, candidate test design, and independent measurement.

## 2. New substantive improvement: a split-event admission gate

The existing bubble-vortex candidate in HsH issue #1339 gains a topology-change test class. This is an addendum, not a new candidate and not P2 selection.

Primary source: Estepa-Cantero et al., “Three-dimensional experimental investigation of the interaction between a rising bubble and a vortex ring,” *Journal of Fluid Mechanics* 1045, A27 (published 2026-10-16), DOI [10.1017/jfm.2026.12078](https://doi.org/10.1017/jfm.2026.12078).

The version-of-record page describes Case III as a stronger vortex capturing a bubble and breaking it into two fragments. It lists six-camera supplementary image movies at 1496 Hz:
- Case I, raw six-camera movie: 43.8 MB, sm002.
- Case II, raw six-camera movie: 37.7 MB, sm003.
- Case III, raw six-camera movie: 44.9 MB, sm004.
- Movie 1: volumetric bubble reconstruction, 165.9 KB.
- Movies 5–7: derived bubble-surface and λ₂-criterion visualizations, 1.6 MB, 3.0 MB, and 2.1 MB.

Source page and supplement list: [Cambridge Core](https://www.cambridge.org/core/journals/journal-of-fluid-mechanics/article/abs/threedimensional-experimental-investigation-of-the-interaction-between-a-rising-bubble-and-a-vortex-ring/F92F449F74CC2AE7F7E1697D775E4F59). The author-uploaded preprint v1 is [arXiv:2606.08193](https://arxiv.org/abs/2606.08193); the public [Zenodo record 19001573](https://zenodo.org/records/19001573) contains the paper PDF, not a verified processed-track deposit.

**Data-access boundary:** public raw-image supplements are located by metadata, but their bytes were not downloaded or processed. Processed 4D-LPT tracks, camera-calibration transforms, registration/synchronization details, joint covariance and full analysis scripts are not in the inspected public Zenodo record; the paper says supporting data are available from the authors on reasonable request. No request was sent. Detailed numerical methods from the preprint remain version-conditional until the final journal PDF is checked.

## 3. Conditional geometric consequence

Let `Σ−` be the pre-event bubble interface and `Σ+` the post-event interface.

If `Σ−` is connected and `Σ+` is disconnected, then **no single continuous map** `f : Σ− → Σ+` can have image equal to `Σ+`, because the continuous image of a connected set is connected. A homeomorphism is a stronger special case and cannot change connectedness/component count.

This does not imply that a complete four-dimensional history must be disconnected. It means a slice-to-slice material correspondence spanning a genuine 1→2 split cannot be represented by one continuous map over the whole source surface. A model must explicitly distinguish at least one of:
1. an event-singular or undefined map at the pinch/split;
2. a branch relation or domain decomposition with separate daughter maps;
3. a change in object identity or in what the tracked surface represents;
4. an observation/reconstruction artifact, which must be excluded by resolution and calibration checks before treating the split as physical.

A connected history-surface can intersect later slices in multiple components; slice-component count alone is not proof of worldtube creation or particle creation.

## 4. Observable and failure contract

For a topology-change test, the primary event observables should be frozen before analysis:
- connected-component count of the reconstructed interface, `NΣ(t)`;
- minimum neck radius and an event-time interval, not a single frame chosen after seeing the outcome;
- daughter-bubble volumes/areas, centroids and velocities;
- synchronized vortex-core circulation and deformation observables.

**Resolution gate:** the disconnected classification must persist over a declared segmentation/calibration sensitivity range and for a minimum multi-frame interval. A one-frame apparent split or a neck below the resolvable scale is not enough. Camera calibration, synchronization and reconstruction covariance must enter the event-time and topology uncertainty.

**Standard comparator:** conventional bubble/vortex-ring interaction and breakup dynamics with the same initial conditions, measured parameters, camera/readout operator, uncertainty treatment and holdout.

**Discriminating H(s)H requirement:** a source-defined forward map must predict whether a split occurs and its event/branch observables before the held-out run. A geometric re-expression that reproduces the same standard-model observable distribution is not an independent prediction. If the H(s)H transport assumes continuity across the entire material surface and predicts no split, a robust observed split would falsify that conditional assumption; if it permits branching, the branch law and quantitative predictions must be fixed in advance.

The three selected cases are illustrative regimes, not independent replicates or a transition-boundary dataset. A prospective test should calibrate on complete acquisition runs and hold out entire runs/conditions, not adjacent frames or segments from one movie. No numerical falsification threshold can be set until actual data, calibration, covariance and event-detection error are recovered.

## 5. Proof-first formalization

A draft Lean module was added to an existing formal-verification branch:

- Module: `FORMAL_VERIFICATION/HsHVerification/AriadneConnectednessSplitGate.lean`
- Draft PR: [#1938](https://github.com/Satobloc/HsH/pull/1938)
- Head: `d89fa62c5e1e24f979499061507e5afed35c2233`
- Exact-head Actions run: [#44210550536](https://github.com/Satobloc/HsH/actions/runs/44210550536), observed **IN_PROGRESS**. No compile success or theorem-specific axiom report is claimed yet.
- The PR is a sibling draft on `research/nadir-gpb-joint-covariance-bound-20261027t1312z`, not merged to main and not an H(s)H physical theorem.

Formalized statements:
1. continuous image of connected set is connected;
2. a connected source plus a disconnected continuous image is contradictory;
3. homeomorphisms preserve connectedness.

Lean will verify only these topology statements. It does not validate image segmentation, source-to-model translation, existence of a material surface, H(s)H continuity, or the physical breakup premise.

## 6. Candidate and project status

- Existing bubble-vortex candidate: issue [#1339](https://github.com/Satobloc/HsH/issues/1339).
- Canonical P2 gate: issue [#565](https://github.com/Satobloc/HsH/issues/565).
- Status remains **CANDIDATE ONLY / P2 HOLD / NO SYSTEM SELECTED**.
- No raw-data analysis, physical calculation, fitted H(s)H parameter, prediction, independent measurement, equation correction or BEDROCK promotion.
- No new tool, dependency, subscription or expense. Mersearch is not callable in this runtime; existing occupied request lanes were not changed. GitHub and public-source reads are fallback, not Mersearch.

## 7. Continuity and controls

The :36 task remains enabled with its original task ID `6a9f52b69ec08191b0a2ba24a074f781`, hourly America/New_York DTSTART/RRULE and Lane Charter 36 unchanged. The current run is scheduled for 00:36Z and started 00:39:33Z; at last read it was IN_PROGRESS with null completion and chat_ref. No task, schedule, phase, enabled bit, task count or prompt change.

Unrelated source reading: SAT archive `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, lines 1961–2000 (40 lines). The excerpt contains historical assistant text making claims about sign-language family relationships; it is not treated as a reliable linguistic source. Next cursor: **2001**. FIE last re-reviewed November 10; next review November 24, so the ≥14-day re-review trigger is not yet due. Physical break is not verifiable.

**Return pin:** `H912:S3 / ARIADNE-LABEL / ALBERR-NEXT / BUBBLE-CANDIDATE-1339 / TOPOLOGY-SPLIT-GATE / CONTINUOUS-IMAGE-NO-GO / PR1938-CI-PENDING / PUBLIC-RAW-SUPPLEMENT-METADATA-ONLY / PROCESSED-DATA-REQUEST-NOT-SENT / P2-HOLD / NO-PHYSICAL-PREDICTION / READING-2001 / AUTOMATION-UNCHANGED`.
