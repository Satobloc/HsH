import Mathlib

/-!
# Version-scoped product coverage for GW241011

Source snapshot inspected 2026-11-20 from the official GWOSC records:

* O4 Discovery Papers v1 legacy event JSON:
  https://gwosc.org/eventapi/json/O4_Discovery_Papers/GW241011_233834/v1/
* API v2 strain-file endpoint for that same event release:
  https://gwosc.org/api/v2/event-versions/GW241011_233834-v1/strain-files?format=api
* API v2 timeline endpoint for that same event release:
  https://gwosc.org/api/v2/event-versions/GW241011_233834-v1/timelines?format=api
* GWTC-5.0 v2 event-version record:
  https://gwosc.org/api/v2/event-versions/GW241011_233834-v2?format=api
* GWTC-5.0 v2 API v2 strain-file and timeline endpoints:
  https://gwosc.org/api/v2/event-versions/GW241011_233834-v2/strain-files?format=api
  https://gwosc.org/api/v2/event-versions/GW241011_233834-v2/timelines?format=api

The v1 legacy JSON lists eight strain products: H1/V1, 4096/16384 Hz,
4096-second duration, GWF/HDF5. The API v2 strain-file and timeline
endpoints returned zero rows for both the O4 v1 and GWTC-5.0 v2 event
versions. The v2 event-version record itself exists and identifies H1/V1.

This module encodes that source-reported metadata snapshot. It proves only
the finite facts encoded below. It does not authenticate the upstream
responses, prove endpoint completeness, establish that v1 products are
GWTC-5.0 v2 analysis products, or validate any strain bytes, calibration,
PSD, data-quality segments, covariance, waveform, or physical model.
No raw strain files were downloaded or analyzed.
-/

namespace HsHVerification.CalderVersionedProductCoverage

/-- A catalog/event release identity, distinct from the API version. -/
inductive EventRelease
  | o4DiscoveryPapersV1
  | gwtc5V2
  deriving DecidableEq, Repr

inductive Detector
  | h1
  | v1
  deriving DecidableEq, Repr

inductive ProductFormat
  | gwf
  | hdf5
  deriving DecidableEq, Repr

inductive ApiEndpoint
  | strainFiles
  | timelines
  | eventVersionRecord
  deriving DecidableEq, Repr

/-- A source-listed strain-file locator, not acquired file bytes. -/
structure StrainProduct where
  eventRelease : EventRelease
  detector : Detector
  sampleRateHz : Nat
  durationSeconds : Nat
  format : ProductFormat
  deriving DecidableEq, Repr

/-- The legacy JSON inventory is scoped to one exact event release. -/
structure LegacyInventory where
  eventRelease : EventRelease
  products : List StrainProduct
  deriving DecidableEq, Repr

/-- An API response is scoped independently by event release and API version. -/
structure ApiObservation where
  eventRelease : EventRelease
  apiVersion : Nat
  endpoint : ApiEndpoint
  rowCount : Nat
  deriving DecidableEq, Repr

def o4Product (detector : Detector) (rate : Nat)
    (format : ProductFormat) : StrainProduct :=
  { eventRelease := .o4DiscoveryPapersV1
    detector := detector
    sampleRateHz := rate
    durationSeconds := 4096
    format := format }

def gw241011O4V1LegacyInventory : LegacyInventory :=
  { eventRelease := .o4DiscoveryPapersV1
    products :=
      [ o4Product .h1 4096 .gwf
      , o4Product .h1 4096 .hdf5
      , o4Product .h1 16384 .gwf
      , o4Product .h1 16384 .hdf5
      , o4Product .v1 4096 .gwf
      , o4Product .v1 4096 .hdf5
      , o4Product .v1 16384 .gwf
      , o4Product .v1 16384 .hdf5
      ] }

def gw241011O4V1ApiV2StrainFiles : ApiObservation :=
  { eventRelease := .o4DiscoveryPapersV1
    apiVersion := 2
    endpoint := .strainFiles
    rowCount := 0 }

def gw241011O4V1ApiV2Timelines : ApiObservation :=
  { eventRelease := .o4DiscoveryPapersV1
    apiVersion := 2
    endpoint := .timelines
    rowCount := 0 }

def gw241011Gwtc5V2ApiV2StrainFiles : ApiObservation :=
  { eventRelease := .gwtc5V2
    apiVersion := 2
    endpoint := .strainFiles
    rowCount := 0 }

def gw241011Gwtc5V2ApiV2Timelines : ApiObservation :=
  { eventRelease := .gwtc5V2
    apiVersion := 2
    endpoint := .timelines
    rowCount := 0 }

def gw241011Gwtc5V2ApiV2EventVersionRecord : ApiObservation :=
  { eventRelease := .gwtc5V2
    apiVersion := 2
    endpoint := .eventVersionRecord
    rowCount := 1 }

def HasLegacyProductFor (release : EventRelease) : Prop :=
  exists product, product in gw241011O4V1LegacyInventory.products
    and product.eventRelease = release

theorem o4v1_legacy_inventory_has_eight_products :
    gw241011O4V1LegacyInventory.products.length = 8 := by
  decide

theorem o4v1_api_v2_strain_files_returns_zero_rows :
    gw241011O4V1ApiV2StrainFiles.rowCount = 0 := by
  decide

theorem o4v1_api_v2_timelines_returns_zero_rows :
    gw241011O4V1ApiV2Timelines.rowCount = 0 := by
  decide

theorem gwtc5v2_api_v2_strain_files_returns_zero_rows :
    gw241011Gwtc5V2ApiV2StrainFiles.rowCount = 0 := by
  decide

theorem gwtc5v2_api_v2_timelines_returns_zero_rows :
    gw241011Gwtc5V2ApiV2Timelines.rowCount = 0 := by
  decide

theorem gwtc5v2_event_version_record_is_present :
    gw241011Gwtc5V2ApiV2EventVersionRecord.rowCount = 1 := by
  decide

/-- Concrete source-record counterexample to the unscoped inference
    "zero rows from API v2 means this event release has no strain products." -/
theorem api_v2_zero_rows_do_not_imply_release_wide_product_absence :
    gw241011O4V1ApiV2StrainFiles.rowCount = 0
      and HasLegacyProductFor .o4DiscoveryPapersV1 := by
  decide

/-- The v1 legacy inventory is not evidence of a GWTC-5.0 v2 product. -/
theorem o4v1_legacy_products_do_not_attest_gwtc5v2 :
    not HasLegacyProductFor .gwtc5V2 := by
  decide

#eval gw241011O4V1LegacyInventory.products.length
#eval gw241011O4V1ApiV2StrainFiles.rowCount
#eval gw241011O4V1ApiV2Timelines.rowCount
#eval gw241011Gwtc5V2ApiV2StrainFiles.rowCount
#eval gw241011Gwtc5V2ApiV2Timelines.rowCount
#eval gw241011Gwtc5V2ApiV2EventVersionRecord.rowCount

#print axioms o4v1_legacy_inventory_has_eight_products
#print axioms api_v2_zero_rows_do_not_imply_release_wide_product_absence
#print axioms o4v1_legacy_products_do_not_attest_gwtc5v2

end HsHVerification.CalderVersionedProductCoverage
