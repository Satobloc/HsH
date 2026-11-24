# H932:S3 | Hale | Figshare candidate-access state ladder

**Run key:** `REVROT3-19-20261011:932:s3`  
**Nominal:** 2026-11-18 20:36 UTC. `h=932`, `seq=4663`, index 8 Hale; next index 9 Elias Kern.  
**Identity:** source-grounded assistant reconstruction; no authenticated historical Hale instance/thread or cross-thread delivery claimed.

## Preflight

Live HsH main: `4adb1a1b811ac5232da6d73f1e6b66470bd6a17b`. Read live BEDROCK, Primary Operational Guideline, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, workflow orientation, revival rotation/thread-first/reentry, task graph, PWH queue, Hale continuity/INBOX, h928:s4 receipt, h894:s3 receipt, h931:s3 receipt and current P2 matrix.

Hale's historical remit is supported by Common CHECKINS (2026-09-12) and Sable REV-006: external-literature scanning, matched-period comparisons, statistical/code analysis, controls and calibration. No signed Nathan-authored specialist charter or authenticated current thread was found. h928:s4 was paired-bootstrap/code/data QC; h894:s3 was a P2 holdout-claim ceiling crosswalk. I avoid repeating those.

## One substantive improvement: data-access stage separation

The P2 candidate-data workflow now explicitly separates a DOI locator from actual acquisition and empirical readiness. Additive to the existing matrix; no new gate/schema.

| Stage | Evidence needed |
|---|---|
| R0 `LOCATOR_CONFIRMED` | Primary data statement + exact DOI |
| R1 `RESOLUTION_ATTEMPTED` | Landing/API request record, endpoint and response/error |
| R2 `METADATA_VERSION_PINNED` | API response, item version, dates, license |
| R3 `FILE_INVENTORY_VERIFIED` | Version-specific file IDs, names, sizes, formats |
| R4 `RAW_BYTES_ACQUIRED` | Original bytes + SHA-256, read-only provenance copy |
| R5 `STRUCTURE_AUDITED` | Format/schema, units, time/space axes, acquisition IDs, missingness, processing lineage |
| R6 `MEASUREMENT_LINEAGE_MAPPED` | Calibration, acquisition-unit join, uncertainty/covariance, dependence |
| R7 `HOLDOUT_EXPOSURE_AUDITED` | Frozen split, access history, calibration ancestry, independent-unit rule |
| R8 `PREDICTION_READY` | Source-authorized forward map, shared parameters, comparator, frozen scoring and uncertainty |

Failures must remain typed (`RUNTIME_ACCESS_BLOCKED`, `METADATA_NOT_RETRIEVED`, `FILE_DOWNLOAD_NOT_ATTEMPTED`, `RAW_NOT_ACQUIRED`, `STRUCTURE_UNASSESSED`, `LINEAGE_UNRESOLVED`, `HOLDOUT_EXPOSED`); do not collapse a runtime failure into `DATA_UNAVAILABLE`.

## Candidate audit

**System:** classical bathtub vortex in water. Barckicke, Falcon & Gissinger, *Nature Physics* 22, 409–414, published 2026-02-10, DOI `10.1038/s41567-026-03175-w`.

The primary paper says supporting data, including data used for spatiotemporal power spectra, are at Figshare DOI `10.6084/m9.figshare.30903347`. This establishes R0 only; it does not show raw paired contours, acquisition manifests, calibration records or joint covariance.

Bounded retrieval attempts:
- Nature article/data statement: verified.
- Web-open attempts at DOI landing page and Figshare API `/v2/articles/30903347`: internal fetch errors; no response obtained.
- `container.download` was blocked because the URL could not be successfully viewed first. No HTTP GET or file download is claimed.
- Exact DOI search across HsH, SAT archive and HSH_RESOURCES found only prior HsH locator references, not mirrored files or item metadata. Mersearch was not callable and no pinned checkout existed; this is bounded GitHub-search fallback, not exhaustive archive coverage.

State: `R0_LOCATOR_CONFIRMED / R1_RUNTIME_RESOLUTION_BLOCKED / R2_METADATA_NOT_RETRIEVED / R3_INVENTORY_NOT_RETRIEVED / R4_RAW_NOT_ACQUIRED / R5_STRUCTURE_UNASSESSED / R6_LINEAGE_UNRESOLVED / R7_HOLDOUT_UNAUDITED / R8_PREDICTION_NOT_FORMED`. This is a runtime limitation, not evidence the dataset is unavailable.

## Free retrieval route

Figshare's official API documents public article details, versions, version-specific files and download endpoints. Public retrieval does not require an account. Use a network-capable client, one request per second or less:

1. `GET https://api.figshare.com/v2/articles/30903347`
2. `GET https://api.figshare.com/v2/articles/30903347/versions`
3. Pin a version; then `GET https://api.figshare.com/v2/articles/30903347/versions/{version_id}/files`
4. For each inventoried file ID: `GET https://api.figshare.com/v2/file/download/{file_id}`

Record metadata and inventory before download. Hash each original file (repository checksum plus independent SHA-256); preserve bytes unchanged. Then audit units, IDs, raw/processed status, calibration and dependence. Only then assign calibration and whole-run/condition holdout.

Docs: https://docs.figshare.com/v2/ and https://info.figshare.com/user-guide/how-to-use-the-figshare-api/

## Prediction boundary and continuity

H0's existing standard Kelvin-vortex comparator family (hollow-core, Rankine, WKBJ, capillary and centrifugal alternatives) remains governed by H884's two-campaign matrix and H928's comparator-coverage envelope. H(s)H geometry-to-fluid-core/contour/spectrum map remains undefined. A locator cannot instantiate a forward map, calculate a fit/prediction, score residuals, set a falsification threshold or validate geometry.

**P2 HOLD:** no candidate selection, physical calculation, fit, prediction, threshold or independent measurement. No equation change, Lean theorem/build, or BEDROCK promotion.

Mersearch unavailable; four lanes occupied/requested; no request changed. Math Hopper #578 / Lean PR #991 and Whirligig Kernel 0 reused only as existing-resource checks. Task graph `ACTIVE_SEED`, 18 records / 16 declared branches; discrepancy unresolved. WH-01 OPEN/P1-HIGH, ledger 77 rows, cursor 2026-11-15 18:50Z; WH-02 PR #1710 Calder-owned; WH-05 blocked at Tern release gate. P0 ACTIVE; P1 Orson-owned OVERDUE/NOT READY; P2 HOLD; P3 INCOMPLETE; FIE next Nov 24.

No handoff/assignment to Elias Kern: his protected Track A remit has no actionable task from this access note. No inbox write, response obligation, ownership transfer or direct-thread delivery/consumption/acknowledgment claimed.

**Next cursor:** attempt metadata/version endpoint with a network-capable client; if successful, pin version and inventory before download. If not, record the exact result and keep the candidate at R1/R2, not `DATA_UNAVAILABLE`.

**Return pin:** `H932:S3 / HALE / ELIAS-KERN-NEXT / FIGSHARE-ACCESS-LADDER / R0-LOCATOR / R1-RUNTIME-BLOCKED / R2-R7-UNVERIFIED / R8-PREDICTION-NOT-FORMED / P2-HOLD / NO-LEAN / NO-PHYSICAL / TASK-UNCHANGED`.
