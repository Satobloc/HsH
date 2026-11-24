# H962:S3 — Cross-event evidence-dependence profile: GW190425 and GW241011

**Disposition:** SOURCE-GROUNDED COMPARATIVE PROVENANCE PROFILE / ASSISTANT RECONSTRUCTION / NOT A P2 SYSTEM SELECTION / NO H(s)H EVIDENCE.

**Nominal slot:** 2026-11-20 02:36 UTC  
**Deterministic ring label:** Aldus (index 6)  
**Next ring label:** Calder (index 7)  
**Work type:** Cross-reading and evidence-lineage architecture; no authenticated historical Aldus participation is claimed.

## Executive result

GW190425 and GW241011 are two distinct astrophysical events, but they are not a pair of fully independent end-to-end measurement systems.

Their event-specific public strain sets are:

\[
D_{190425}=\{L1,V1\},\qquad D_{241011}=\{H1,V1\}.
\]

Therefore:

\[
D_{190425}\cap D_{241011}=\{V1\},\qquad
D_{190425}\cup D_{241011}=\{H1,L1,V1\}.
\]

They share Virgo (V1), while the LIGO detector differs (L1 versus H1). The event acquisitions are separated by 172,509,629.9 seconds, approximately 1,996.64 days or 5.47 years. This is a source-derived detector-label overlap, **not** a statistical-independence score.

The new workflow rule is to separate **run-level detector roster**, **event-specific operational status**, **strain-product availability**, **search/detection contribution**, **parameter-estimation contribution**, and **calibration/release version**. A single detector array or a paper count cannot stand in for this provenance chain.

## 1. Event identity and acquisition lineage

| Field | GW190425 | GW241011 |
|---|---|---|
| Event time | 2019-04-25 08:18:05 UTC; GPS 1240215503.0 | 2024-10-11 23:38:34 UTC; GPS 1412725132.9 |
| Source class | Binary neutron star (BNS) | Binary black hole (BBH) |
| Observing epoch | O3a | O4b |
| Event-specific strain products located | L1 and V1 | H1 and V1 |
| Event-specific LIGO detector | L1 | H1 |
| Shared detector | V1 | V1 |
| Event-specific release used in this audit | GWTC-2.1-confident v3 | O4_Discovery_Papers v1 |
| Later catalog/version lineage | GWTC-2.1 v3 product | Separate GWTC-5.0 v2 catalog record; exact v2 event-strain locator unresolved here |

**GW190425 detector roles are not a Boolean.** The discovery paper says LIGO Hanford was temporarily offline. LIGO Livingston supplied the detection, with network-search SNR 12.9. Virgo's SNR was 2.5, below the search threshold of 4, but Virgo data were still used in parameter estimation. The event-specific GWOSC v3 page lists L1 and V1 frame channels and strain products. Thus “detector contributed to the detection” and “detector contributed to parameter estimation” must be separate fields.

**GW241011 has the complementary event-specific set.** Its O4 Discovery Papers v1 event page states that L1 was not in observing mode and lists H1/V1 strain products. The run-level O4b release covers H1, L1, and V1, but that run-level roster must not be mistaken for this event's active detector set. The event page lists combined parameter-estimation results using IMRPhenomXO4a, IMRPhenomXPHM, and SEOBNRv5PHM.

The GWOSC API's GW190425 v3 event-level detector array includes H1, L1, and V1, while the event-specific strain inventory and discovery paper show H1 offline and L1/V1 products. The semantics of that broad API array are not sufficiently explicit in the inspected response to use it as an event-specific operational mask. **Use the event page, frame-channel inventory, and primary paper together.**

## 2. Release version and calibration lineage

These are not interchangeable data packages:

- **GW190425:** GWTC-2.1-confident v3 event products. The event page exposes 16,384 Hz and 4,096 Hz products and identifies the L1/V1 channels. The discovery paper reports maximum 1σ calibration uncertainties over 19.4–2048 Hz of 6% amplitude / 3.5° phase for LIGO and 5% amplitude / 7° phase for Virgo.
- **GW241011:** the located event-specific strain products are from O4_Discovery_Papers v1. The separate GWTC-5.0 v2 event record exists, but the inspected v2 strain-file and timeline API endpoints returned zero rows. That is an unresolved product locator, not proof that no v2 strain products exist. Do not silently substitute v1 strain bytes for a v2 catalog analysis.
- GWOSC release documentation warns that products from different releases can differ through calibration, data cleaning, and downsampling. O4 technical documentation identifies calibrated strain coverage of 10–5000 Hz and warns that the 4,096 Hz anti-aliasing filter can affect data near Nyquist; the 16,384 Hz product is the appropriate starting point for high-frequency work around and above 1,700 Hz.

This matters for a cross-event comparison of higher-order inspiral terms. A product's sample rate, calibration version, conditioning, frequency band, and exact file identity must be frozen with the waveform and prior. The 2026 GW241011 Kerr analysis includes a 3.5PN octupole contribution; the data product used for any independent replay must be pinned rather than inferred from the event name.

## 3. Publication lineage is not event independence

- GW190425's discovery paper, its later GWTC-2.1 catalog product, and different GWOSC release versions all concern the **same physical event**.
- GW241011's O4 discovery analysis, GWTC-5.0 catalog record, and the 2026 Kerr-hypothesis paper all concern the **same physical event**. The 2026 paper is a later analysis, not a new astrophysical observation.
- The 2026 paper's zero-noise injections are synthetic recovery/degeneracy checks, not independent measurements.
- The two events are distinct acquisitions, but both sit inside the LVK/GWOSC collaboration and data-release ecosystem. They do not constitute independent-laboratory replication.

The event classes and parameterizations also differ. GW190425 is a BNS analysis with tidal/EOS-sensitive waveform structure, including IMRPhenomPv2_NRTidal. GW241011's later Kerr test uses IMRPhenomXPHM and spin-induced quadrupole/octupole deviations. Raw posterior values from these different parameter families must not be pooled or compared as though they were the same observable.

## 4. Existing evidence-independence vector instantiated for this pair

This uses the existing Ariadne Evidence Lineage × Readout Identifiability contract; it introduces no new schema.

| Existing vector axis | Pairwise disposition | Reason |
|---|---|---|
| holdout_exposure | RETROSPECTIVE / EXPOSED | Both events and analyses are public; no pre-registered H(s)H parameter/map freeze or blind holdout audit exists. |
| acquisition_separation | SEPARATE EVENTS | Distinct event IDs/times and non-overlapping event acquisitions; raw strain bytes were not downloaded or hashed in this run. |
| calibration_transfer | PARTIAL / UNRESOLVED | V1 is shared, but O3a and O4b use different run/release calibration products. Cross-run V1 calibration covariance was not obtained. |
| instrument_transfer | PARTIAL | V1 is common; GW190425 uses L1 while GW241011 uses H1. |
| independent_laboratory_replication | NONE | Both are LVK/GWOSC ecosystem analyses, not independent-laboratory replications. |

Additional contract fields remain explicitly incomplete:

- **raw_acquisition_ids** and **raw_artifact_blob_ids**: event pages and release identifiers are pinned; raw strain files and file hashes were not acquired.
- **event_or_system_cluster**: two distinct physical-event clusters; multiple papers/releases for each event remain grouped under that event.
- **instrument_and_calibration_ids**: event-specific channels and release labels identified; calibration files and cross-run covariance not retrieved.
- **analysis_pipeline_and_prior_ids**: waveform families and some analysis roles identified; a complete software/prior dependency graph is not established.
- **uncertainty_covariance_id** and **calibration_dataset_ids**: no joint covariance or calibration-file bundle acquired.
- **holdout_dataset_ids** and **holdout_access_audit**: none.
- **cross_channel_consistency_status**: NOT_ASSESSED.
- **independent_replication_status**: NOT_ESTABLISHED.
- **standard_comparator**: event-specific BNS and BBH waveform comparators identified.
- **pre_registered_score_and_falsification_threshold**: NOT_INSTANTIABLE.

**No scalar “independence score” is assigned.** The vector records different kinds of dependence; it is not a probability that the two results are independent.

## 5. Conditional H(s)H test architecture

A cross-event test becomes admissible only if H(s)H supplies an explicit, source-grounded map from its geometric variables to a common observable in both source classes.

| Test component | Required specification |
|---|---|
| H0 standard comparator | Event-specific GR waveform, including the appropriate BNS tidal or BBH multipole structure |
| H1 candidate | A frozen H(s)H geometry-to-waveform map that predicts a common dimensionless phase residual or other explicitly shared invariant |
| Shared parameters | Only those geometric couplings and scale-law parameters that the source-defined map makes common |
| Event-specific parameters | Masses, spins, BNS EOS/tidal parameters, BBH multipole parameters, detector calibration, PSD, and event-specific nuisance parameters |
| Calibration | Pin exact event strain files, sample rate, conditioning, calibration release, PSD, frequency band, waveform approximant, and prior |
| Holdout | Freeze the map and shared parameters before access to a complete independent event; do not retrospectively call an already analysed event a blind holdout |
| Predicted observable | A source-defined common invariant or phase residual, not raw BNS tidal parameters compared directly with BBH multipole deviations |
| Falsification threshold | A pre-registered residual threshold derived from the actual joint measurement/calibration covariance and holdout; currently NOT_INSTANTIABLE |

A useful future design would calibrate the geometry-to-observable map on one event class and hold out an entire event from another class, provided the map explicitly covers both. The present pair is **retrospective exploratory comparison only**. It cannot yet test a universal H(s)H coupling because the cross-sector map is absent and the calibration/holdout covariance is unavailable.

**Forced by the sources:** distinct event identities, event-specific detector roles, separate release/calibration provenance, and partial instrument overlap.

**Not forced:** worldtube thickness, twist, contact surfaces, a new medium law, or any particular H(s)H geometry-to-waveform mechanism.

## 6. Formalization boundary

The existing source-bound independence gate was reused rather than creating another generic theorem.

- Existing draft PR #790 exact head: bcb3fcc0fec05ac65620abbf6ac3c1967aaf9d19.
- Exact-head Actions run [#42944088253](https://github.com/Satobloc/HsH/actions/runs/42944088253), job #130272577725.
- Exact PR-head checkout assertion passed; Lean 4.34.0 / Lake 5.0.0; root build completed successfully with 8,953 jobs.
- The relevant theorem, independent_validation_requires_nonempty_disjoint_origins, compiled. Its reported dependencies are propext, Classical.choice, and Quot.sound.
- Tests, lint, nanoda, leanchecker, and global axiom audit were skipped. This is an exact-head compile/runtime result, not a whole-project axiom audit.

That theorem formalizes a source-lineage requirement for a nonempty disjoint-origin witness. It does **not** prove event identity, detector operation, calibration independence, statistical independence, or physical truth. The event-specific set intersection above is a deterministic script-checked calculation from the cited source records; it is not represented as a new Lean theorem. No new module was justified while raw acquisition identities and calibration/covariance records remain external and unpinned.

## 7. Scope and limitations

- No raw strain, PSD, posterior HDF5, calibration file, or detector-quality segment was downloaded.
- No waveform replay, fit, posterior combination, physical calculation, independent measurement, or H(s)H prediction was performed.
- No numerical falsification threshold is claimed.
- No SAT-O or Blockwave equation was copied, corrected, or modified.
- P2 remains HOLD; this is a comparative evidence-provenance example, not a selected P2 system.
- No BEDROCK theory promotion or paper-gate advancement.

## 8. Sources

Primary and official source records, accessed 2026-11-20:

1. [GWOSC: GW190425, GWTC-2.1-confident v3 event page](https://gwosc.org/eventapi/html/GWTC-2.1-confident/GW190425/v3/).
2. Abbott et al., [GW190425: Observation of a Compact Binary Coalescence with Total Mass ~3.4 M⊙](https://doi.org/10.3847/2041-8213/ab75f5), ApJL 892 L3 (2020).
3. [GWOSC: GW241011_233834, O4 Discovery Papers v1 event page](https://gwosc.org/eventapi/html/O4_Discovery_Papers/GW241011_233834/v1/).
4. [GWOSC O4b Data Release](https://gwosc.org/O4/O4b/) and [O4 technical details](https://gwosc.org/O4/o4_details/).
5. [GWOSC GWTC-2.1 data-release documentation](https://gwosc.org/GWTC-2.1/).
6. Abac et al., [Two high-spin black hole coalescences in the LIGO-Virgo-KAGRA O4 observing run](https://arxiv.org/abs/2510.26931).
7. Das et al., [Testing the Kerr hypothesis beyond the quadrupole with GW241011](https://arxiv.org/abs/2604.09828), arXiv v1, 2026-04-10.
8. [GWOSC GW190425 v3 API event record](https://gwosc.org/api/v2/event-versions/GW190425-v3?format=api), [GW241011 GWTC-5.0 v2 API event record](https://gwosc.org/api/v2/event-versions/GW241011_233834-v2?format=api), and the inspected [v2 strain-file](https://gwosc.org/api/v2/event-versions/GW241011_233834-v2/strain-files?format=api) and [timeline](https://gwosc.org/api/v2/event-versions/GW241011_233834-v2/timelines?format=api) endpoints. The latter two returned no rows in this audit; this is recorded as an unresolved locator, not proof of nonexistence.

Relevant HsH continuity:

- [Aldus h928 GW190425 data-quality audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-h928-s2-gw190425-dq-interval-20261118t1624z-001.md).
- [Loom h961 GW241011 parameter restriction/marginalization crosswalk](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/loom-h961-s3-gw241011-restriction-marginalization-20261120t0136z-001.md).
- [Ariadne Evidence Lineage × Readout Identifiability contract](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ARIADNE/2026-10-30T1913Z_EVIDENCE_LINEAGE_IDENTIFIABILITY_CONTRACT.md).
- [P2 tracker #565](https://github.com/Satobloc/HsH/issues/565).

**Return pin:** H962:S3 / ALDUS-LABEL-ASSISTANT-RECONSTRUCTION / GW190425-vs-GW241011 / EVENT-SPECIFIC-STRAIN-ROLE-VECTOR / SHARED-V1-PARTIAL-OVERLAP / NO-BLIND-HOLDOUT / NO-HSH-PREDICTION / P2-HOLD.
