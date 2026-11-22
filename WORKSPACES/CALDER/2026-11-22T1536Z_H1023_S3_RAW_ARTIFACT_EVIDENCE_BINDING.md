# Calder h1023:s3 | Raw-artifact identity and acquisition-condition binding

**Run key:** `REVROT3-19-20261011:1023:s3`  
**Nominal slot:** 2026-11-22 15:36 UTC  
**Classification:** assistant reconstruction under the deterministic Calder ring label; no authenticated current Calder thread or historical-instance participation is claimed.

## 1. Selection and authority

- `h=1023`; `seq=5h+3=5118`; `5118 mod 19 = 7`.
- Selected ring label: **Calder** (index 7).
- Next ring label: **Hale** (index 8).

The historical Calder source is the first September 12, 2026 self-report in `WORKSPACES/COMMON/CHECKINS.md`, concerning empirical angle-clustering, adversarial null design, independent-unit discipline and statistical calibration. It is a worker-authored self-report, not a signed Nathan Direct charter. A second CHECKINS entry explicitly marked as a duplicate-name Calder (Foundational Covariance / Global Architecture) is a distinct candidate and was not conflated with this source. No authenticated current Calder conversation was established.

## 2. Substantive architecture improvement

Extended the existing [PR #2167](https://github.com/Satobloc/HsH/pull/2167), branch `research/calder-versioned-product-coverage-20261120t0636z`, without creating another PR or branch.

The existing `ProductSetKey` identifies a catalog/event-version product inventory. Its `AnalysisReadiness` and `PredictionGateBinding` are indexed by that key, but the readiness record still contains booleans such as `bytesAcquired`, `sha256Verified`, `calibrationVersionBound`, `psdBound`, `dataQualitySegmentsBound`, and `covarianceBound`. Those booleans do not carry the actual raw artifact identity or the specific supporting evidence references.

Added an additive source-bound evidence layer:

- `EvidenceArtifactRef`: locator, declared SHA-256 string and byte length.
- `DigestVerificationRecord`: verifier, run ID, verification-record reference and reported digest.
- `ProductArtifactEvidence`: one catalog member, exact event version and catalog snapshot, raw artifact, acquisition ID, operating-condition ID, calibration/PSD/data-quality/covariance references, acquisition manifest and digest attestation.
- `ProductArtifactBundle`: explicit nonempty selected subset of the catalog inventory; every selected product must have a bound artifact; no unselected product may enter the bundle; all artifacts must share one declared operating condition.
- `sourceBoundEvaluationAdmissible`: existing readiness summary, declared artifact bundle and prediction hard gate must all hold at the same `ProductSetKey`.
- `reindexProductArtifactBundle`: moving a bundle across product-set indices requires explicit equality of the complete keys.

This closes a concrete provenance gap already identified in the h1004 Calder receipt: exact product locators and byte digests were still future work. It also makes calibration and other support records acquisition/condition-scoped, avoiding silent cross-condition borrowing.

The design is consistent with the source-grounded distinction in [issue #2287](https://github.com/Satobloc/HsH/issues/2287): the Barckicke m=1 and m=2 demonstrations are different operating states, and their calibration/measurement channels cannot be treated as a same-state joint observation. That packet is a source-grounded candidate note, not a raw-data reanalysis or P2 selection.

## 3. Exact source change and verification status

- Commit: `ed0f3da9c621fd1353b7c66d28656908ce5615a2`
- Changed module: `FORMAL_VERIFICATION/HsHVerification/CalderVersionedProductCoverage.lean`
- New module blob: `b5285404f7ebd81220cf7be381cbb34e82918789`
- Independent branch readback: exact blob match.
- Existing PR head before this change: `5d6b90dcb1c07e385058f359ea8bbc2dc6961500`.
- New PR-triggered Lean workflow: run `45036936408`, run number 1683; **IN_PROGRESS at this report snapshot**. The job had started but was still in checkout; no compilation result is claimed here. The prior exact-head build #44950701184 verified the earlier ProductSetKey module, not this new addition.

The new schema contains no concrete artifact instance, synthetic physical fixture, measurement, numerical calculation or `#eval`. It is a formal contract only. Lean can verify the formalized type relationships and theorem statements; it cannot authenticate the referenced files, compute the raw SHA-256 values, validate the verifier, parse the acquisition manifest, establish calibration correctness, or prove the physical premises. The declared digest and verification record remain external evidence until actual bytes and independent verification outputs are supplied.

## 4. Real-data and prediction boundary

The existing GWOSC example is metadata-only. No raw strain bytes, acquisition receipt, calibration version, PSD, data-quality segments or covariance were acquired in this run. No physical fit, H(s)H map, frozen prediction, calibration/holdout comparison, independent measurement or numerical falsification threshold was produced. The new schema is intended to prevent those missing items from being hidden behind readiness booleans; it does not make the current event analysis-ready.

P2 remains HOLD. No SAT-O or Blockwave equation was read as a new premise, changed, corrected or re-attributed. No BEDROCK theory promotion or manuscript-gate advancement.

## 5. Queue, tools and workflow boundaries

- The live BEDROCK, 2026-10-26 Steering Charter, Three Paper Campaign, Phase Steering, three-repository onboarding, Revival Rotation V3, V4 not-found revival and thread-first rules were read.
- Mersearch has no callable action in this runtime. The four canonical request files were read and all remain `status=requested`; request-scoped manifests/receipts were not found. No lane was overwritten, released or retriggered. GitHub connector retrieval is a bounded fallback, not a Mersearch result.
- The PWH queue file path referenced by Steering returned 404. The durable WH-02 issue #1702 remains open. Its latest recorded status says Calder-owned PR #1710 is stale and requires owner-controlled reconciliation, exact-head CI and independent review. No rebase or branch mutation was attempted.
- Existing HsH PR #2167 and Mathlib 4.34.0 were reused. No new tooling, dependency, fork, subscription or expense. No local Lean/Lake/Elan executable or local repository checkout was found. SciSpace is available but was not needed for this source-contract change.
- P0 Code Grurple remains ACTIVE / Tern-controlled. P1 Orson cognition remains OVERDUE / NOT READY / ORSON-OWNED. P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE. November 9 minor gate remains MISSED.
- FIE next review is November 24. The unrelated-reading break was completed November 20; no duplicate break or premature FIE rereview was claimed.
- No private HSH_RESOURCES payload was opened.

## 6. Publication and continuity

This report is submitted through the existing HsH Issue Publication Intake v1. Publication status is not verified until the issue-publisher comment, workflow result and exact canonical-file readback agree with the report's SHA-256.

The existing :36 automation was not modified. Task ID `6a9f52b69ec08191b0a2ba24a074f781`, hourly America/New_York :36 schedule and Lane Charter 36 phase remain unchanged. No sixth task, scheduler mutation, signet or conversation rename. The Automation read action was unavailable in this runtime, so no new live scheduler-state readback is claimed.

## 7. Return cursor

- PR #2167 head: `ed0f3da9c621fd1353b7c66d28656908ce5615a2`.
- Lean run: `45036936408` (verify final conclusion and exact checkout before claiming proof).
- Source module blob: `b5285404f7ebd81220cf7be381cbb34e82918789`.
- Prior verified ProductSetKey build: [run #44950701184](https://github.com/Satobloc/HsH/actions/runs/44950701184).
- P2 source/readiness crosswalk: [issue #2287](https://github.com/Satobloc/HsH/issues/2287).
- WH-02 blocker: [issue #1702](https://github.com/Satobloc/HsH/issues/1702).

**Next useful action:** inspect run #45036936408. If it succeeds, record the exact-head/source-blob relationship and theorem-specific axiom output. If it fails, repair only the Lean elaboration/proof issue on this existing branch and rerun; do not treat failure as a physical counterexample. Independently, keep the WH-02 rebase with its authorized owner and preserve P2 HOLD until actual measured artifacts and support records are acquired.
