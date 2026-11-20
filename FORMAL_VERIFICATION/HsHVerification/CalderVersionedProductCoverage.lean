import Mathlib

/-!
# Version-scoped product coverage and negative evidence for GW241011

Primary source snapshot inspected 2026-11-20:

* O4 Discovery Paper release documentation:
  https://gwosc.org/o4_eventdata_docs/
* O4 Discovery Papers v1 event page and JSON:
  https://gwosc.org/eventapi/html/O4_Discovery_Papers/GW241011_233834/v1/
  https://gwosc.org/eventapi/json/O4_Discovery_Papers/GW241011_233834/v1/
* GWOSC API v2 event-version records:
  https://gwosc.org/api/v2/event-versions/GW241011_233834-v1?format=api
  https://gwosc.org/api/v2/event-versions/GW241011_233834-v2?format=api
* API v2 strain-file early-release endpoints and timeline endpoints:
  https://gwosc.org/api/v2/event-versions/GW241011_233834-v1/strain-files?format=api
  https://gwosc.org/api/v2/event-versions/GW241011_233834-v1/timelines?format=api
  https://gwosc.org/api/v2/event-versions/GW241011_233834-v2/strain-files?format=api
  https://gwosc.org/api/v2/event-versions/GW241011_233834-v2/timelines?format=api
* The paper's data/code record:
  https://zenodo.org/records/17343574

The O4 Discovery Papers v1 legacy event JSON lists eight analysis-ready
strain-file locators: H1/V1 × 4096/16384 Hz × GWF/HDF5, each 4096 seconds.
The v1 event page gives GPS start 1412722688 and event GPS 1412725132.9.
The GWTC-5.0 v2 event record gives GPS 1412725133.0 and the same H1/V1
detector pair. The version timestamp difference is 0.1 seconds; it is
metadata, not an uncertainty interval.

The API v2 strain-file endpoint is explicitly scoped to **early releases**
for a specific event version. Its responses for both event versions have
results_count=0, num_pages=0, and next=null. The corresponding timeline
endpoints also return zero rows with no next page. These are complete
empty responses for those endpoint scopes, not evidence that the event has
no strain products anywhere. The v1 legacy event page is a concrete
counterexample to that unscoped inference.

The O4 release documentation warns that its data may contain preliminary
data-quality segments and calibration, with updated versions included in
catalog releases when available. Therefore event version, strain-file
locator, calibration version, PSD, data-quality segments, and covariance
must be bound separately before analysis. The Zenodo 17343574 record is a
4.1 GB data/code archive describing posterior samples, analysis products,
and notebooks; some notebooks require additional data not included by
default. It was not downloaded in this run.

This module encodes the source-reported metadata and the current retrieval
state. Lean verifies only these encoded finite statements. It does not
authenticate upstream responses, establish completeness beyond the named
endpoint scope, validate raw strain bytes, or establish any physical or
H(s)H result. No raw strain files were downloaded or analyzed.
-/

namespace HsHVerification.CalderVersionedProductCoverage

/-- Catalog/event-release identity, distinct from the API version. -/
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

/-- Scope is part of the meaning of a zero-row response. -/
inductive ProductCoverageScope
  | earlyReleaseStrainFiles
  | eventTimelines
  | allStrainProducts
  deriving DecidableEq, Repr

/-- A source-listed locator, not acquired file bytes. -/
structure StrainProduct where
  eventRelease : EventRelease
  detector : Detector
  sampleRateHz : Nat
  durationSeconds : Nat
  format : ProductFormat
  deriving DecidableEq, Repr

/-- Legacy event-page inventory bound to one catalog release. -/
structure LegacyInventory where
  eventRelease : EventRelease
  gpsStartTenths : Nat
  durationSeconds : Nat
  products : List StrainProduct
  deriving DecidableEq, Repr

/-- API version and event/catalog release are independent fields. -/
structure ApiListObservation where
  eventRelease : EventRelease
  apiVersion : Nat
  scope : ProductCoverageScope
  resultsCount : Nat
  numPages : Nat
  hasNext : Bool
  deriving DecidableEq, Repr

structure EventVersionDetail where
  eventRelease : EventRelease
  gpsTenths : Nat
  detectors : List Detector
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
    gpsStartTenths := 14127226880
    durationSeconds := 4096
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

def gw241011O4V1EventDetail : EventVersionDetail :=
  { eventRelease := .o4DiscoveryPapersV1
    gpsTenths := 14127251329
    detectors := [.h1, .v1] }

def gw241011Gwtc5V2EventDetail : EventVersionDetail :=
  { eventRelease := .gwtc5V2
    gpsTenths := 14127251330
    detectors := [.h1, .v1] }

def gw241011O4V1ApiV2StrainFiles : ApiListObservation :=
  { eventRelease := .o4DiscoveryPapersV1
    apiVersion := 2
    scope := .earlyReleaseStrainFiles
    resultsCount := 0
    numPages := 0
    hasNext := false }

def gw241011O4V1ApiV2Timelines : ApiListObservation :=
  { eventRelease := .o4DiscoveryPapersV1
    apiVersion := 2
    scope := .eventTimelines
    resultsCount := 0
    numPages := 0
    hasNext := false }

def gw241011Gwtc5V2ApiV2StrainFiles : ApiListObservation :=
  { eventRelease := .gwtc5V2
    apiVersion := 2
    scope := .earlyReleaseStrainFiles
    resultsCount := 0
    numPages := 0
    hasNext := false }

def gw241011Gwtc5V2ApiV2Timelines : ApiListObservation :=
  { eventRelease := .gwtc5V2
    apiVersion := 2
    scope := .eventTimelines
    resultsCount := 0
    numPages := 0
    hasNext := false }

/-- Complete pagination for this endpoint response, not global completeness. -/
def responseComplete (observation : ApiListObservation) : Bool :=
  (!observation.hasNext) && decide (observation.numPages = 0)

/-- A zero-row endpoint can support global absence only if its declared
    scope is the complete strain-product inventory. -/
def supportsGlobalStrainAbsence (observation : ApiListObservation) : Bool :=
  decide (observation.scope = .allStrainProducts)
    && responseComplete observation
    && decide (observation.resultsCount = 0)

def hasLegacyProductFor (release : EventRelease) : Bool :=
  gw241011O4V1LegacyInventory.products.any
    (fun product => decide (product.eventRelease = release))

/-- Proposed readiness gate. These fields describe the current retrieval
    state, not a property of the physical event. -/
structure AnalysisReadiness where
  eventVersionBound : Bool
  productVersionBound : Bool
  locatorBound : Bool
  bytesAcquired : Bool
  sha256Verified : Bool
  calibrationVersionBound : Bool
  psdBound : Bool
  dataQualitySegmentsBound : Bool
  covarianceBound : Bool
  deriving DecidableEq, Repr

def analysisReady (state : AnalysisReadiness) : Bool :=
  state.eventVersionBound
    && state.productVersionBound
    && state.locatorBound
    && state.bytesAcquired
    && state.sha256Verified
    && state.calibrationVersionBound
    && state.psdBound
    && state.dataQualitySegmentsBound
    && state.covarianceBound

def gw241011O4V1CurrentReadiness : AnalysisReadiness :=
  { eventVersionBound := true
    productVersionBound := true
    locatorBound := true
    bytesAcquired := false
    sha256Verified := false
    calibrationVersionBound := false
    psdBound := false
    dataQualitySegmentsBound := false
    covarianceBound := false }

theorem o4v1_legacy_inventory_has_eight_products :
    gw241011O4V1LegacyInventory.products.length = 8 := by
  decide

theorem v1_api_v2_early_release_response_is_complete_empty :
    responseComplete gw241011O4V1ApiV2StrainFiles = true
      ∧ gw241011O4V1ApiV2StrainFiles.resultsCount = 0 := by
  decide

theorem v2_api_v2_early_release_response_is_complete_empty :
    responseComplete gw241011Gwtc5V2ApiV2StrainFiles = true
      ∧ gw241011Gwtc5V2ApiV2StrainFiles.resultsCount = 0 := by
  decide

theorem v1_empty_early_release_endpoint_does_not_support_global_absence :
    supportsGlobalStrainAbsence gw241011O4V1ApiV2StrainFiles = false := by
  decide

/-- Concrete source-record counterexample to the unscoped inference
    "zero rows from the API v2 early-release endpoint means no strain
    products exist for the O4 Discovery Papers v1 event release." -/
theorem api_v2_zero_rows_coexist_with_v1_legacy_products :
    gw241011O4V1ApiV2StrainFiles.resultsCount = 0
      ∧ hasLegacyProductFor .o4DiscoveryPapersV1 = true := by
  decide

/-- The v1 legacy inventory is not evidence of a GWTC-5.0 v2 product. -/
theorem o4v1_legacy_products_do_not_attest_gwtc5v2 :
    hasLegacyProductFor .gwtc5V2 = false := by
  decide

theorem v1_event_offset_from_file_start_is_2444_9_seconds :
    gw241011O4V1EventDetail.gpsTenths
      - gw241011O4V1LegacyInventory.gpsStartTenths = 24449 := by
  decide

theorem event_version_gps_metadata_differs_by_0_1_seconds :
    gw241011Gwtc5V2EventDetail.gpsTenths
      - gw241011O4V1EventDetail.gpsTenths = 1 := by
  decide

theorem current_v1_metadata_snapshot_is_not_analysis_ready :
    analysisReady gw241011O4V1CurrentReadiness = false := by
  decide

#eval gw241011O4V1LegacyInventory.products.length
#eval gw241011O4V1ApiV2StrainFiles.resultsCount
#eval gw241011O4V1ApiV2Timelines.resultsCount
#eval gw241011Gwtc5V2ApiV2StrainFiles.resultsCount
#eval gw241011Gwtc5V2ApiV2Timelines.resultsCount
#eval gw241011O4V1EventDetail.gpsTenths - gw241011O4V1LegacyInventory.gpsStartTenths
#eval gw241011Gwtc5V2EventDetail.gpsTenths - gw241011O4V1EventDetail.gpsTenths
#eval analysisReady gw241011O4V1CurrentReadiness

#print axioms o4v1_legacy_inventory_has_eight_products
#print axioms api_v2_zero_rows_coexist_with_v1_legacy_products
#print axioms o4v1_legacy_products_do_not_attest_gwtc5v2
#print axioms v1_empty_early_release_endpoint_does_not_support_global_absence
#print axioms current_v1_metadata_snapshot_is_not_analysis_ready

end HsHVerification.CalderVersionedProductCoverage
