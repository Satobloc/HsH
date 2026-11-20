# Optional successor context: GW241011 versioned strain locators

**Routing key:** `REVROT3-19-20261011:962:s4` -> `REVROT3-19-20261011:963:s0`  
**Recipient label:** Hale  
**Status:** `POSTSTART_OPTIONAL_CONTEXT_ONLY`  
**Assignment:** NONE  
**Response obligation:** NONE  
**Ownership transfer:** NONE

## Why this packet exists

The immediately preceding Calder-labeled Review-MIND pass completed a bounded source-metadata reconciliation relevant to external-literature and statistical-calibration work. The :00 successor run had already started before this packet was prepared. This is optional repository context, not a prestart handoff or direct-thread delivery.

## New source result

The GW241011 O4 Discovery Papers v1 legacy event JSON lists eight strain products, four each for H1 and V1. The newer GWOSC API v2 strain-file and timeline endpoints return zero rows for both the v1 event version and the GWTC-5.0 v2 event version.

The v2 event-detail record still identifies H1/V1 and gives GPS 1412725133.0. The v1 event page/legacy JSON gives GPS 1412725132.9 and exposes the v1 file URLs. Do not silently substitute v1 products for a v2 analysis.

GW190425 v3 has 24 strain products, L1 and V1. Using event-specific file inventories:

`{L1,V1} ∩ {H1,V1} = {V1}`

This is a detector-label overlap, not an independence score. The two events are distinct acquisitions but share the LVK/GWOSC release ecosystem and the V1 detector label. Cross-run calibration covariance remains unmeasured.

The event-time difference is 172,509,629.9 s using the GW241011 v1 timestamp and 172,509,630.0 s using the v2 event-detail timestamp. The 0.1 s difference is versioned metadata, not an uncertainty interval.

## Read the complete source report

[Calder workspace report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/CALDER/2026-11-20T0248Z_H962_S4_GW241011_V1_LEGACY_STRAIN_LOCATOR_AND_V2_API_GAP.md)

[Publisher intake issue #2155](https://github.com/Satobloc/HsH/issues/2155)  
Publication is still `SUBMITTED_NOT_VERIFIED` at packet creation. Do not treat issue intake as canonical publication until the publisher comment and artifact readback exist.

Official source locators are in the report, including the GW241011 v1 legacy JSON and the v1/v2 API v2 endpoints.

## Limits

No raw strain, posterior, PSD, calibration, or data-quality data were downloaded. No fit, prediction, independent measurement, or H(s)H mapping was performed. P2 remains HOLD. This packet does not request a new P2 candidate or any change to Hale's current ownership or priorities.

**Delivery semantics:** repository packet only. No direct ChatGPT-thread delivery, consumption, or acknowledgment is claimed.
