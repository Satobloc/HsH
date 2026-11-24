# GW241011 event-version strain locator and detector-set reconciliation

**Disposition:** SOURCE-METADATA RECONCILIATION / ADDITIVE QC / NO RAW-STRAIN ANALYSIS / NO P2 SELECTION / NO H(s)H EVIDENCE.

**Relay label:** Calder; next deterministic label: Hale. This is assistant-level source-grounded work, not authenticated participation by a historical Calder thread.

## Executive result

The earlier GW190425 × GW241011 cross-event profile correctly identified the event-specific detector-product overlap as V1, but its GW241011 v2 locator remained unresolved. This bounded follow-up finds a more precise distinction:

- The **O4 Discovery Papers v1 legacy event JSON** lists eight event-specific strain files, four each for H1 and V1.
- The newer **GWOSC API v2 strain-file and timeline endpoints return zero rows** for both the O4 Discovery Papers v1 event version and the GWTC-5.0 v2 event version.
- The GWTC-5.0 v2 event-detail record still identifies H1 and V1 and supplies a GPS event time, but its v2 file and timeline endpoints do not expose products.
- Therefore the zero-row API response is an endpoint/version locator limitation, not evidence that the v1 strain products do not exist. The v1 legacy file list must not be silently substituted for a v2 catalog analysis.

The earlier report's v1 detector-set intersection remains correct:

\[
F_{190425,v3}=\{L1,V1\},\qquad
F_{241011,v1}=\{H1,V1\},
\]

\[
F_{190425,v3}\cap F_{241011,v1}=\{V1\}.
\]

This is a detector-label overlap derived from event-specific product inventories, not a statistical-independence score or calibration-transfer result.

## 1. Historical role and attribution

The available historical Calder role witness is the 2026-09-12 entry in the HsH Common check-in record. It describes empirical/statistical work involving angle clustering, null design, independent observational units, source independence, covariance, and provenance. This is a worker-authored self-report, not a standalone signed Nathan-authored specialist charter.

The exact empirical-Calder conversation identity remains unresolved. No authenticated current Calder ChatGPT thread or exact conversation ID was recovered, and no alternate same-name conversation was used as a substitute. This report is therefore an assistant reconstruction under the current Review-MIND lane.

Source: [HsH Common check-ins](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/CHECKINS.md).

## 2. Event-version inventory

| Event/version | Published GPS value | Legacy event JSON strain entries | API v2 strain-files rows | Product-derived detector set |
|---|---:|---:|---:|---|
| GW190425, GWTC-2.1-confident v3 | 1240215503.0 | 24 | 24 | {L1, V1} |
| GW241011, O4 Discovery Papers v1 | 1412725132.9 | 8 | 0 | {H1, V1} from legacy JSON |
| GW241011, GWTC-5.0 v2 | 1412725133.0 | No v2 legacy file list established here | 0 | Event-detail record says {H1, V1}; v2 product set unresolved |

The GW190425 v3 API event-detail response has a broader `detectors` array containing H1, L1, and V1, while its event-specific strain-file inventory contains only L1 and V1. The LIGO/Virgo discovery summary states that Hanford was temporarily offline, Livingston supplied the detection, and Virgo data were useful for source-parameter estimation despite not crossing the search threshold. The broad event-detail array must not be treated as an event-specific operational mask.

For GW241011, the O4 Discovery Papers v1 HTML page lists frame-channel labels H1, L1, and V1, while noting that L1 was not in observing mode. The v1 legacy JSON strain array lists only H1 and V1. The event-specific set is therefore taken from the actual strain-file inventory, checked against the operational note, not from the frame-channel label list alone.

## 3. Exact file-level locators

The GW190425 v3 API inventory returns 24 entries: L1 and V1, 4,096 Hz and 16,384 Hz, 32-second and 4,096-second durations, with GWF, HDF5, and TXT formats.

Representative 16,384 Hz / 4,096-second HDF5 files:

- L1: `L-L1_GWOSC_16KHZ_R1-1240213455-4096.hdf5`
- V1: `V-V1_GWOSC_16KHZ_R1-1240213455-4096.hdf5`

The GW241011 O4 Discovery Papers v1 legacy JSON returns eight entries: H1 and V1, 4,096 Hz and 16,384 Hz, 4,096-second duration, with GWF and HDF5 formats.

Representative 16,384 Hz / 4,096-second HDF5 files:

- H1: `H-H1_GWOSC_O4b_16KHZ_R1-1412722688-4096.hdf5`
- V1: `V-V1_GWOSC_O4b_16KHZ_R1-1412722688-4096.hdf5`

The corresponding 4,096 Hz files and GWF counterparts are listed in the same legacy JSON response. These names are metadata locators only. No file bytes were downloaded, opened, hashed, or analyzed in this review.

## 4. API-surface discrepancy

The following public endpoints were inspected:

| Event version | API v2 strain-files | API v2 timelines | Legacy JSON |
|---|---:|---:|---|
| GW190425 v3 | 24 rows | 24 rows | 24 strain entries |
| GW241011 O4 Discovery Papers v1 | 0 rows | 0 rows | 8 strain entries |
| GW241011 GWTC-5.0 v2 | 0 rows | 0 rows | No v2 legacy file list established |

For GW241011 v1, the legacy event JSON supplies the eight H1/V1 file URLs even though the API v2 `strain-files` and `timelines` endpoints return empty result arrays. For GWTC-5.0 v2, the event-detail endpoint returns a valid event record with catalog `GWTC-5.0`, run `O4b`, detector labels H1/V1, and GPS time 1412725133.0, but the v2 strain-file and timeline endpoints return zero rows.

The appropriate statement is therefore **“the inspected API v2 endpoints do not expose file/timeline rows for these GW241011 event versions”**, not “GW241011 has no public strain data.” The O4 Discovery Papers v1 legacy list is a usable locator for that v1 release only. It does not establish that those files are the GWTC-5.0 v2 analysis products.

## 5. Versioned event-time arithmetic

The event timestamps are source metadata, not a fitted or predicted quantity.

Using the GW241011 O4 Discovery Papers v1 value:

\[
1412725132.9-1240215503.0=172509629.9\ \mathrm{s}.
\]

That is approximately 1,996.639235 days or 5.46650030 Julian years.

The GWTC-5.0 v2 event-detail record gives 1412725133.0, producing:

\[
1412725133.0-1240215503.0=172509630.0\ \mathrm{s}.
\]

The two GW241011 version records differ by 0.1 seconds. This is a versioned metadata difference, not an uncertainty interval. The earlier 172,509,629.9-second result is correct for the v1 timestamp it used. A v2 analysis should use and preserve the v2 timestamp and product lineage rather than mixing versions.

## 6. Independence and physical interpretation boundary

The product-derived detector sets have one shared label, V1. That does not establish independent or dependent measurement errors by itself.

- GW190425 is an O3a event; GW241011 is an O4b event.
- V1 is the shared detector label, but the event releases and calibration products differ.
- No cross-run V1 calibration covariance, calibration-file bundle, PSD, data-quality segment set, or raw-acquisition hash was retrieved.
- The two events belong to the same LVK/GWOSC collaboration and release ecosystem. They are distinct astrophysical acquisitions, not independent-laboratory replications.
- GW190425 is a BNS analysis; GW241011 is a BBH analysis. Their waveform families and source parameters are not interchangeable.

No scalar independence score is assigned. The existing Evidence Lineage × Readout Identifiability vector remains the appropriate structure; this follow-up adds exact versioned product locators and does not introduce a new schema.

## 7. Formalization and execution status

The source-derived finite-set statement is explicit:

\[
\{L1,V1\}\cap\{H1,V1\}=\{V1\}.
\]

A Python check over the two source-derived finite sets and Decimal timestamp values reproduced the intersection and both version-specific time differences exactly at the precision of the published metadata.

**Lean status: NOT RUN.** The local runtime has no `lean`, `lake`, or `elan` executable. Existing PR #790 formalizes a source-origin/disjointness gate, not this event-version-to-strain-inventory map. Existing generic projection proofs do not establish the truth of these GWOSC source records. No new theorem, module, branch, PR, or tooling was created. A Lean proof of the finite-set identity would verify only the encoded set arithmetic, not the correctness or completeness of the source inventories, detector operation, calibration independence, or physical interpretation.

## 8. Scope and limitations

- No raw strain, posterior samples, PSD, calibration files, or data-quality segments were downloaded.
- No waveform replay, parameter fit, physical prediction, independent measurement, or calibration-covariance calculation was performed.
- The 0.1-second version difference is not interpreted as a physical shift or measurement uncertainty.
- The detector-label intersection is not an independence score.
- No H(s)H geometry-to-waveform map, SAT-O/Blockwave equation, or theory premise was introduced or changed.
- P1 remains Orson-owned and protected; no Orson study, dataset, model trial, or manuscript was accessed or changed.
- P2 remains HOLD; this is a metadata/provenance correction, not a selected physical system or a paper-gate advancement.
- No BEDROCK theory promotion is proposed.

## 9. Sources

Official event and data records, inspected 2026-11-20:

1. [GWOSC GW190425, GWTC-2.1-confident v3 event page](https://gwosc.org/eventapi/html/GWTC-2.1-confident/GW190425/v3/).
2. [GWOSC GW190425 v3 legacy event JSON](https://gwosc.org/eventapi/json/GWTC-2.1-confident/GW190425/v3/).
3. [GWOSC GW190425 v3 API event-version record](https://gwosc.org/api/v2/event-versions/GW190425-v3?format=api).
4. [GWOSC GW190425 v3 API strain-file inventory](https://gwosc.org/api/v2/event-versions/GW190425-v3/strain-files?format=api).
5. [GWOSC GW241011 O4 Discovery Papers v1 event page](https://gwosc.org/eventapi/html/O4_Discovery_Papers/GW241011_233834/v1/).
6. [GWOSC GW241011 O4 Discovery Papers v1 legacy event JSON](https://gwosc.org/eventapi/json/O4_Discovery_Papers/GW241011_233834/v1/).
7. [GWOSC GW241011 O4 Discovery Papers v1 API v2 strain-file endpoint](https://gwosc.org/api/v2/event-versions/GW241011_233834-v1/strain-files?format=api) and [timeline endpoint](https://gwosc.org/api/v2/event-versions/GW241011_233834-v1/timelines?format=api).
8. [GWOSC GW241011 GWTC-5.0 v2 API event-version record](https://gwosc.org/api/v2/event-versions/GW241011_233834-v2?format=api).
9. [GWOSC GW241011 GWTC-5.0 v2 API strain-file endpoint](https://gwosc.org/api/v2/event-versions/GW241011_233834-v2/strain-files?format=api) and [timeline endpoint](https://gwosc.org/api/v2/event-versions/GW241011_233834-v2/timelines?format=api).
10. [LIGO Scientific Collaboration, GW190425 science summary](https://ligo.org/science-summaries/gw190425/).
11. Abbott et al., [GW190425: Observation of a Compact Binary Coalescence with Total Mass ~3.4 M⊙](https://doi.org/10.3847/2041-8213/ab75f5), ApJL 892 L3 (2020).
12. Das et al., [Testing the Kerr hypothesis beyond the quadrupole with GW241011](https://arxiv.org/abs/2604.09828), arXiv v1, submitted 2026-04-10.
13. [GWOSC O4b data release](https://gwosc.org/O4/O4b/) and [O4 technical details](https://gwosc.org/O4/o4_details/).

Relevant HsH continuity:

- [Aldus h962:s3 cross-event evidence-dependence profile, workspace source](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ALDUS/2026-11-20T0236Z_H962_S3_GW190425_GW241011_CROSS_EVENT_EVIDENCE_DEPENDENCE_PROFILE.md). Its publisher intake was rejected for an invalid submission ID; this follow-up is a distinct additive file-locator reconciliation, not a retry of that submission.
- [Ariadne Evidence Lineage × Readout Identifiability contract](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ARIADNE/2026-10-30T1913Z_EVIDENCE_LINEAGE_IDENTIFIABILITY_CONTRACT.md).
- [P2 tracker #565](https://github.com/Satobloc/HsH/issues/565).

**Return state:** EVENT-VERSIONED-STRAIN-PRODUCTS / GW190425-v3={L1,V1} / GW241011-v1={H1,V1} / GW241011-v2-LOCATOR-UNRESOLVED / SHARED-V1-IS-NOT-INDEPENDENCE / NO-RAW-DATA / P2-HOLD.
