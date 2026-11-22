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

/-- Identity of a catalog-listed product set. This is a source-version key,
    not raw-byte identity or proof that the products have been acquired. -/
structure ProductSetKey where
  eventRelease : EventRelease
  eventVersion : Nat
  sourceSnapshot : String
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

/-- Source-defined identity for the O4 Discovery Papers v1 product inventory.
    The key identifies the catalog product set, not acquired strain bytes. -/
def gw241011O4V1ProductSetKey : ProductSetKey :=
  { eventRelease := .o4DiscoveryPapersV1
    eventVersion := 1
    sourceSnapshot :=
      "https://gwosc.org/eventapi/json/O4_Discovery_Papers/GW241011_233834/v1/"
    products := gw241011O4V1LegacyInventory.products }

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

/-- Proposed readiness gate indexed by the exact source-defined product
    set. These fields describe retrieval state, not a property of the event. -/
structure AnalysisReadiness (key : ProductSetKey) where
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

def analysisReady {key : ProductSetKey} (state : AnalysisReadiness key) : Bool :=
  state.eventVersionBound
    && state.productVersionBound
    && state.locatorBound
    && state.bytesAcquired
    && state.sha256Verified
    && state.calibrationVersionBound
    && state.psdBound
    && state.dataQualitySegmentsBound
    && state.covarianceBound

def gw241011O4V1CurrentReadiness :
    AnalysisReadiness gw241011O4V1ProductSetKey :=
  { eventVersionBound := true
    productVersionBound := true
    locatorBound := true
    bytesAcquired := false
    sha256Verified := false
    calibrationVersionBound := false
    psdBound := false
    dataQualitySegmentsBound := false
    covarianceBound := false }

/-- A prediction hard gate is explicitly indexed by the product set to which
    its source-bound measurement/prediction packet applies. The index is an
    asserted source binding, not authentication of the source or premises. -/
structure PredictionGateBinding (key : ProductSetKey) where
  hardGate : Prop

/-- Moving a prediction gate between product-set indices requires an explicit
    equality of those indices; the gate is not silently reused across products. -/
def reindexPredictionGate {keyA keyB : ProductSetKey}
    (h : keyA = keyB)
    (prediction : PredictionGateBinding keyA) :
    PredictionGateBinding keyB := by
  cases h
  exact prediction

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



/-!
## Compose product availability with the existing prediction hard gate

The existing ModelSelectionPreference formalization in PR #1487 carries the
source/map, measurement, matched-comparator, nuisance-identifiability,
shared-parameter, acquisition-unit/holdout, prediction, and falsification
obligations. This module owns the versioned-product readiness gate.

The earlier proposition-only composition did not bind the prediction
proposition to the same product set as the readiness record. It could therefore
pair a ready product set with a prediction gate intended for a different
event/version. The revised interface indexes both objects by one
ProductSetKey. Reuse across keys requires an explicit equality through
reindexPredictionGate.

PR #1487's current Candidate does not yet expose this ProductSetKey, so no
automatic cross-PR adapter or integration is claimed. Before wiring, its
source-bound measurement packet/Candidate must expose the same key. The index
is a typed scope declaration, not authentication of source bytes or physical
premises.

The failed-gate proposition below is a logical counterexample only, not a
physical fixture, synthetic dataset, numerical calculation, or measurement.
-/

/-- Evaluation is admissible only when the measured product set is ready and
    the separately formalized prediction/holdout gate is indexed by that
    exact same product set. -/
def evaluationAdmissible {key : ProductSetKey}
    (data : AnalysisReadiness key)
    (prediction : PredictionGateBinding key) : Prop :=
  analysisReady data = true ∧ prediction.hardGate

/-- Even a ready product set cannot pass when its matching prediction gate
    fails. This is a generic logical witness, not a physical fixture. -/
theorem analysis_readiness_alone_does_not_imply_evaluation_admissibility
    {key : ProductSetKey} (data : AnalysisReadiness key)
    (hReady : analysisReady data = true) :
    analysisReady data = true ∧
      ¬ evaluationAdmissible data (⟨False⟩ : PredictionGateBinding key) := by
  refine ⟨hReady, ?_⟩
  intro h
  exact h.2

theorem evaluation_admissibility_requires_analysis_readiness
    {key : ProductSetKey} (data : AnalysisReadiness key)
    (prediction : PredictionGateBinding key)
    (h : evaluationAdmissible data prediction) :
    analysisReady data = true :=
  h.1

theorem evaluation_admissibility_requires_prediction_hard_gate
    {key : ProductSetKey} (data : AnalysisReadiness key)
    (prediction : PredictionGateBinding key)
    (h : evaluationAdmissible data prediction) :
    prediction.hardGate :=
  h.2

/-- The current GW241011 O4-v1 metadata record blocks evaluation regardless
    of the prediction proposition because its source-versioned product set
    has not been acquired and characterized. This is not a P2 verdict. -/
theorem gw241011_current_product_blocks_evaluation
    (prediction : PredictionGateBinding gw241011O4V1ProductSetKey) :
    ¬ evaluationAdmissible gw241011O4V1CurrentReadiness prediction := by
  intro h
  have hFalse : analysisReady gw241011O4V1CurrentReadiness = false := by
    decide
  have hReady := h.1
  rw [hFalse] at hReady
  cases hReady

#print axioms reindexPredictionGate
#print axioms analysis_readiness_alone_does_not_imply_evaluation_admissibility
#print axioms evaluation_admissibility_requires_analysis_readiness
#print axioms evaluation_admissibility_requires_prediction_hard_gate
#print axioms gw241011_current_product_blocks_evaluation


/-!
## Raw-artifact identity and acquisition-condition binding

ProductSetKey identifies a catalog/event-version inventory. It does not
identify the bytes actually acquired for an analysis. The earlier
AnalysisReadiness booleans and type index therefore remain necessary but
are not sufficient as a source-auditable data packet.

The following additive contract separates:
* catalog product-set identity;
* each acquired raw artifact and its declared digest;
* the acquisition/run and operating-condition identity;
* calibration, PSD, data-quality, and covariance artifacts;
* an acquisition manifest and a separate digest-verification record.

A bundle selects an explicit subset of catalog products, requires a
source-bound artifact for each selected product, and requires every artifact
in that bundle to belong to one declared operating condition. This prevents
a cross-condition calibration or product from being silently borrowed.

The strings and references are declarations, not authenticated facts.
Lean does not hash raw bytes, validate a verifier, parse an acquisition
manifest, establish calibration correctness, or authenticate any source.
No concrete artifact, measurement, fixture, or physical calculation is
instantiated here.
-/

/-- A source artifact reference with a declared locator, digest, and byte
    length. The fields are identifiers; Lean does not compute or authenticate
    the digest. -/
structure EvidenceArtifactRef where
  locator : String
  sha256 : String
  byteLength : Nat
  deriving DecidableEq, Repr

/-- A separately stored record of a digest check. The reported digest is
    compared with the artifact's declared digest below; verifier identity,
    execution, and the record's contents remain external evidence. -/
structure DigestVerificationRecord where
  verifier : String
  runId : String
  record : EvidenceArtifactRef
  reportedDigest : String
  deriving DecidableEq, Repr

/-- One acquired raw product, bound to a catalog key and its exact
    acquisition/condition support records. -/
structure ProductArtifactEvidence (key : ProductSetKey) where
  product : StrainProduct
  eventVersion : Nat
  catalogSnapshot : String
  rawArtifact : EvidenceArtifactRef
  acquisitionId : String
  conditionId : String
  calibration : EvidenceArtifactRef
  psd : EvidenceArtifactRef
  dataQualitySegments : EvidenceArtifactRef
  covariance : EvidenceArtifactRef
  acquisitionManifest : EvidenceArtifactRef
  digestVerification : DigestVerificationRecord
  productMember : product ∈ key.products
  releaseMatches : product.eventRelease = key.eventRelease
  eventVersionMatches : eventVersion = key.eventVersion
  catalogSnapshotMatches : catalogSnapshot = key.sourceSnapshot
  digestMatches : digestVerification.reportedDigest = rawArtifact.sha256

/-- Presence check only: a nonempty locator/digest and positive declared
    length. This does not establish that the locator resolves or that the
    digest matches the bytes. -/
def evidenceArtifactRefDeclared (ref : EvidenceArtifactRef) : Bool :=
  decide (ref.locator ≠ "")
    && decide (ref.sha256 ≠ "")
    && decide (ref.byteLength > 0)

/-- All required evidence references for one product are declared. Product
    membership, event version, catalog snapshot, and digest equality are
    carried as proof fields by ProductArtifactEvidence. -/
def productArtifactEvidenceDeclared {key : ProductSetKey}
    (evidence : ProductArtifactEvidence key) : Bool :=
  evidenceArtifactRefDeclared evidence.rawArtifact
    && decide (evidence.acquisitionId ≠ "")
    && decide (evidence.conditionId ≠ "")
    && evidenceArtifactRefDeclared evidence.calibration
    && evidenceArtifactRefDeclared evidence.psd
    && evidenceArtifactRefDeclared evidence.dataQualitySegments
    && evidenceArtifactRefDeclared evidence.covariance
    && evidenceArtifactRefDeclared evidence.acquisitionManifest
    && decide (evidence.digestVerification.verifier ≠ "")
    && decide (evidence.digestVerification.runId ≠ "")
    && evidenceArtifactRefDeclared evidence.digestVerification.record

/-- A selected analysis bundle is an explicit nonempty subset of one
    catalog product set. Every selected product has at least one bound raw
    artifact; no unrelated product is silently included; all support records
    share one declared operating condition. -/
structure ProductArtifactBundle (key : ProductSetKey) where
  conditionId : String
  selectedProducts : List StrainProduct
  artifacts : List (ProductArtifactEvidence key)
  conditionIdNonempty : conditionId ≠ ""
  selectedProductsNonempty : selectedProducts ≠ []
  artifactsNonempty : artifacts ≠ []
  selectedProductsInCatalog :
    ∀ product, product ∈ selectedProducts → product ∈ key.products
  selectedProductsCovered :
    ∀ product, product ∈ selectedProducts →
      ∃ artifact, artifact ∈ artifacts ∧ artifact.product = product
  allArtifactsSelected :
    ∀ artifact, artifact ∈ artifacts → artifact.product ∈ selectedProducts
  allArtifactsSameCondition :
    ∀ artifact, artifact ∈ artifacts → artifact.conditionId = conditionId

/-- All references in the selected artifact bundle are declared. The
    dependent bundle type separately enforces catalog membership, coverage,
    and common-condition scope. -/
def productArtifactBundleDeclared {key : ProductSetKey}
    (bundle : ProductArtifactBundle key) : Bool :=
  decide (bundle.conditionId ≠ "")
    && decide (bundle.selectedProducts ≠ [])
    && decide (bundle.artifacts ≠ [])
    && bundle.artifacts.all
      (fun artifact => productArtifactEvidenceDeclared artifact)

/-- The stricter source-bound admission surface: the existing readiness
    summary, concrete artifact-reference bundle, and prediction hard gate
    must all pass at the same ProductSetKey. -/
def sourceBoundEvaluationAdmissible {key : ProductSetKey}
    (readiness : AnalysisReadiness key)
    (bundle : ProductArtifactBundle key)
    (prediction : PredictionGateBinding key) : Prop :=
  analysisReady readiness = true
    ∧ productArtifactBundleDeclared bundle = true
    ∧ prediction.hardGate

theorem sourceBoundEvaluation_requires_analysis_readiness
    {key : ProductSetKey}
    (readiness : AnalysisReadiness key)
    (bundle : ProductArtifactBundle key)
    (prediction : PredictionGateBinding key)
    (h : sourceBoundEvaluationAdmissible readiness bundle prediction) :
    analysisReady readiness = true :=
  h.1

theorem sourceBoundEvaluation_requires_declared_artifact_bundle
    {key : ProductSetKey}
    (readiness : AnalysisReadiness key)
    (bundle : ProductArtifactBundle key)
    (prediction : PredictionGateBinding key)
    (h : sourceBoundEvaluationAdmissible readiness bundle prediction) :
    productArtifactBundleDeclared bundle = true :=
  h.2.1

theorem sourceBoundEvaluation_requires_prediction_hard_gate
    {key : ProductSetKey}
    (readiness : AnalysisReadiness key)
    (bundle : ProductArtifactBundle key)
    (prediction : PredictionGateBinding key)
    (h : sourceBoundEvaluationAdmissible readiness bundle prediction) :
    prediction.hardGate :=
  h.2.2

theorem selected_product_has_bound_raw_artifact
    {key : ProductSetKey}
    (bundle : ProductArtifactBundle key)
    (product : StrainProduct)
    (hProduct : product ∈ bundle.selectedProducts) :
    ∃ artifact, artifact ∈ bundle.artifacts ∧ artifact.product = product :=
  bundle.selectedProductsCovered product hProduct

theorem selected_products_belong_to_catalog
    {key : ProductSetKey}
    (bundle : ProductArtifactBundle key) :
    ∀ product, product ∈ bundle.selectedProducts → product ∈ key.products :=
  bundle.selectedProductsInCatalog

theorem artifact_bundle_uses_one_operating_condition
    {key : ProductSetKey}
    (bundle : ProductArtifactBundle key) :
    ∀ artifact, artifact ∈ bundle.artifacts →
      artifact.conditionId = bundle.conditionId :=
  bundle.allArtifactsSameCondition

theorem artifact_digest_is_bound_to_verification_record
    {key : ProductSetKey}
    (bundle : ProductArtifactBundle key) :
    ∀ artifact, artifact ∈ bundle.artifacts →
      artifact.digestVerification.reportedDigest = artifact.rawArtifact.sha256 :=
  fun artifact _ => artifact.digestMatches

/-- Moving an artifact bundle between catalog product-set indices requires
    explicit equality of the complete ProductSetKey. -/
def reindexProductArtifactBundle {keyA keyB : ProductSetKey}
    (h : keyA = keyB)
    (bundle : ProductArtifactBundle keyA) :
    ProductArtifactBundle keyB := by
  cases h
  exact bundle

#print axioms reindexProductArtifactBundle
#print axioms sourceBoundEvaluation_requires_analysis_readiness
#print axioms sourceBoundEvaluation_requires_declared_artifact_bundle
#print axioms sourceBoundEvaluation_requires_prediction_hard_gate
#print axioms selected_product_has_bound_raw_artifact
#print axioms selected_products_belong_to_catalog
#print axioms artifact_bundle_uses_one_operating_condition
#print axioms artifact_digest_is_bound_to_verification_record

end HsHVerification.CalderVersionedProductCoverage
