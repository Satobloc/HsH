# Nadir h754:s2 | GP-B archive custody path and LinearizedSixPlane status correction

Date: 2026-11-11. Run key: `REVROT3-19-20261011:754:s2`. This is a source-custody and methodology correction related to the earlier public artifact in HsH issue #1586. It is not a new physical result.

## Executive disposition

- **GP-B archive custody is documented.** NSSDCA records show a substantial GP-B archive (532 AIPs, 82.41 GB) ingested by 2010 and 82.41 GB of GP-B data outflow recorded in that year.
- **Current direct-download availability is not established.** The 2012 NSSDCA report does not list GP-B among its network-accessible Space Physics FTP collections over 1 GB. The current NSSDCA route is a CRUSO data request; large requests may be limited by budget and fulfillment constraints.
- **The GP-B `LinearizedSixPlane` fixture in the existing Nadir branch is reclassified `PROTOCOL_VIOLATION / NOT_EVIDENCE`.** It is an assistant-defined six-scalar to two-scalar projection, not a measured GP-B map, not an SO(4) representation, and not an H(s)H constitutive law. No specific prior permission for this data-free fixture was found.
- No archive request was sent. No physical calculation, numerical fit, CODATA comparison, independent holdout, or H(s)H prediction was performed.

## 1. Correction to the earlier six-plane fixture

The existing source file is:

`FORMAL_VERIFICATION/HsHVerification/NadirGPBFourGyroGate.lean`

Branch: `research/nadir-affine-translation-quotient-20261101t0324z`  
Branch head recorded in the latest Nadir receipt: `fbe078a94a0074c7eb00e98aee47bf718630d607`  
File blob: `0f3925feb15d8f3f57d3bb9772c69d65441fa8fe`

Lines 65-77 define `LinearizedSixPlane` with two named readout scalars and four invented hidden scalars, then define `measuredProjection` by discarding the four hidden coordinates. Lines 79-95 prove that this declared projection is insensitive to one hidden coordinate and is non-injective.

The source comments correctly say that the projection is an assumption and is not a physical GP-B SO(4) lift. That disclaimer does not satisfy the later Nathan Direct requirement for specific prior permission before data-free mathematical fixtures or exploratory calculations. The recovered historical Nadir conversation contains broad sandbox/theorizing permission, but no specific authorization for this six-coordinate GP-B fixture was found.

Accordingly, the following substructure is now classified:

`PROTOCOL_VIOLATION / NOT_EVIDENCE / QUARANTINE_FROM_PHYSICAL_INTERPRETATION`

This classification applies to `LinearizedSixPlane`, `measuredProjection`, `hidden_plane_invisible`, and `measured_projection_not_injective`. It does not retroactively invalidate the Lean compiler's verification of the encoded statements; it invalidates their admissibility as evidence about GP-B, SO(4), hidden physical components, or H(s)H.

The historical source is preserved for audit. No file was deleted, no PR was merged, and no branch was modified.

### Separate sub-results that must not be conflated

- `published_geodetic_residual` and `published_frame_dragging_residual` are exact arithmetic on values transcribed from Everitt et al., *Phys. Rev. Lett.* 106, 221101 (2011), Table II.
- The diagonal-only weighted means are diagnostics that deliberately omit the experiment's covariance blocks and systematics. They are not the published joint fit.
- `NadirGPBJointCovariance.lean` is a conditional two-dimensional Gaussian model with unknown correlation. Its optimizer is mathematically derived from the published residuals; it is not an observed or fitted correlation.
- `NadirProjectionCoarseGrainFactorization.lean` and `NadirWitnessCarryingComposition.lean` prove conditional map/fibre-factorization statements. They do not construct GP-B instrument maps.
- `NadirConnectorWitnessHolonomy.lean` proves abstract group identities for a supplied connector element. It does not construct a physical path, connection, parallel-transport operator, SO(3)/SO(4) representation, or measured readout.

## 2. GP-B archive custody and access evidence

### Primary archive documents

- NSSDCA GP-B Data Archive Plan, document S1016, revision 7 (15 May 2007): https://nssdc.gsfc.nasa.gov/archive/plan/GPB_S1016_dap_7.pdf
- GP-B/NSSDCA Memorandum of Understanding, S1018 (20 January 2006): https://nssdc.gsfc.nasa.gov/archive/mou/GPB_mou_20060120.pdf
- Current NSSDCA signed-MOU index: https://nssdc.gsfc.nasa.gov/archive/mou/
- Current NSSDCA data-request guidance: https://nssdc.gsfc.nasa.gov/nssdc/obtaining_data.html
- Current CRUSO support route: https://nssdc.gsfc.nasa.gov/about/about_cruso.html

The 2007 archive plan defines Level 0 raw telemetry, Level 1 decommutated/time-ordered telemetry, Level 2 preprocessed science data, and Level 3 data prepared for relativistic-drift estimation. It lists database products including `L2data`, `L3data`, `run_info`, `l2metadata`, `l3metadata`, `orbit_times`, `Mdcals`, `Tmcals`, `Tmderived`, `GPS_Timing`, `GPS_Orbit`, `Ephem`, `Covariance`, `Solution`, `Mean`, and `l2data_flag`.

The plan and MOU describe the permanent archive as not electronically accessible outside NSSDCA, while allowing replication/mailing of requested volumes with cost recovery. Public-domain status is not equivalent to immediate public FTP download.

### Historical ingest and distribution evidence

- NSSDCA's 2008 annual report says the GP-B project archive (about 0.54 TB) had been delivered via RAID; only one dataset was then defined, Level 2 was still being prepared for preliminary distribution, and a preliminary request for Level 1/Level 2 proton-monitor, magnetometer, and orientation data was fulfilled without star-tracker data.
- NSSDCA's 2010 annual report records 532 GP-B AIPs totaling 82.41 GB ingested to the nearline permanent archive and 82.41 GB of GP-B data outflow for that year.
- NSSDCA's 2012 annual report still lists 532 GP-B AIPs / 82.41 GB, with no additional GP-B AIP ingest shown for 2011 or 2012. GP-B is not listed among the report's network-accessible Space Physics FTP collections over 1 GB. This does not prove that no electronic copy exists elsewhere; it means the NSSDCA reports do not establish a current public FTP route.

Annual reports:
- 2008: https://nssdc.gsfc.nasa.gov/nssdc/annual/2008/2008AnnRep.pdf
- 2010: https://nssdc.gsfc.nasa.gov/nssdc/annual/2010/2010AnnRep.pdf
- 2012: https://nssdc.gsfc.nasa.gov/nssdc/annual/2012/2012AnnRep.pdf

The current NSSDCA guidance (page updated 8 September 2026) directs data requests through CRUSO. It notes that some large requests may not be fulfillable because of budget constraints and that payment methods are restricted. No request, fee commitment, or contact was made in this run.

## 3. What the GP-B measurement chain actually requires

Silbergleit et al., *Classical and Quantum Gravity* 32 (2015) 224019, DOI 10.1088/0264-9381/32/22/224019, describes the data handling in detail:

https://doi.org/10.1088/0264-9381/32/22/224019

- Ten science segments followed nine spacecraft anomalies; only six long segments (2, 3, 5, 6, 9, 10) were used for the drift-rate determination. Each segment had new local gyro-orientation initial conditions and readout/torque parameters, while relativistic drift and telescope-scale parameters were common across segments.
- Science inputs included LF and HF SQUID, telescope photodiodes, spacecraft roll phase, timing, and orbit data. The HF channel was sampled at 2200 Hz; the LF channel was separately filtered. HF snapshots were used for trapped-flux mapping and polhode/readout-scale-factor work.
- Level 0 was raw telemetry; Level 1 was decommutated, non-repetitive, time-ordered monitor data. Level 2 synchronized signals on a 2-second vehicle-time grid, with cleaning, filtering/compression/interpolation and timestamp correction.
- The authors report that L2 SQUID and telescope noise was strongly correlated and L1 timestamp corrections made sample spacing nonuniform. They therefore replaced the simple L1-to-L2 preparation with an iterative L1 → L1.5 → L2 → L3 ladder; L2 alone was insufficient for the final high-precision analysis.
- GPS/orbit data were transformed from Earth-fixed to Earth-centered inertial and then solar-centered inertial frames. Those transforms and time correlations are part of the measurement model, not optional metadata.
- The final covariance accounting includes corrected statistical covariance, parameter-sensitivity covariance, and covariance of unmodeled systematics. Marginal standard errors alone do not determine the joint likelihood.

The 2011 primary result is Everitt et al., *Phys. Rev. Lett.* 106, 221101, DOI 10.1103/PhysRevLett.106.221101. The reported final drift estimates are not a substitute for the time-resolved acquisition and calibration chain.

## 4. Concrete data-recovery request specification (not sent)

If/when the P0 gate and Lane 24 scheduling permit a request, ask CRUSO to confirm the current GP-B accession/collection identifier, complete AIP manifest, retention status, and whether electronic transfer or a limited subset is possible. Request:

1. Level 0 raw telemetry and Level 1 time-ordered monitor data for all four gyroscopes, including LF/HF SQUID, telescope photodiode channels, star-tracker centroids, roll phase, timing, GPS/orbit, laser ranging, proton monitor, magnetometer, and calibration signals.
2. The high-rate HF SQUID snapshots and trapped-flux-mapping (TFM) products, including the 2200 Hz channel/snapshot metadata and polhode/readout-scale-factor products.
3. Level 1.5, Level 2, and Level 3 products, with all run IDs, exact time windows, data grades, missing/de-weighted/interpolated-point flags, and the full processing/version history.
4. The archive's `Mdcals`, `Tmcals`, `Tmderived`, `run_info`, `orbit_times`, `l2metadata`, `l3metadata`, `l2data_flag`, `GPS_Timing`, `GPS_Orbit`, `Ephem`, `Covariance`, `Solution`, `Mean`, `L2data`, and `L3data` tables or equivalent exports.
5. The data dictionary, GP-B Data Management Plan S0331A, processing document S0401D, calibration tables, coordinate-frame/time-conversion specifications, guide-star astrometry, and checksum/version manifests.
6. Per-gyro and per-segment parameter estimates, full covariance/cross-covariance blocks, sensitivity-run covariance, unmodeled-systematic covariance, and the exact combination/weighting procedure used for the published joint drift estimates.
7. Confirmation whether star-tracker data omitted from the 2008 preliminary release, all six science segments, and the short excluded segments are present in the current retained archive.

The request should explicitly distinguish raw, preprocessed, calibrated, graded, and final science products. It should not treat the 24 segment-level estimates as independent holdouts without the shared-parameter and cross-segment covariance structure.

## 5. Formalization and evidence status

The latest Nadir branch head recorded for PR #1189 is `fbe078a94a0074c7eb00e98aee47bf718630d607`. Exact-head Lean Actions run #42979143722 checked out that head and completed the full root build successfully with Lean 4.34.0 / Lake 5.0.0 (8,958 build jobs). The target modules built. The theorem-specific `#print axioms` output includes expected `Classical.choice`, `Quot.sound`, and `propext` dependencies in the generic factorization/composition and group-algebra results. Tests, lint, nanoda/leanchecker, and a separate global axiom audit were skipped. The overall PR status check also has an unrelated Vercel build-rate-limit failure.

PR #1189 remains open, draft, and unmerged, with no formal reviews or review threads. The successful Lean build verifies only the encoded conditional mathematics. It does not establish the physical maps, data provenance, soundness of the translation, or truth of any H(s)H premise.

## Final disposition

`GPB_ARCHIVE_CUSTODY_DOCUMENTED / CURRENT_ELECTRONIC_ACCESS_UNCONFIRMED / REQUEST_SPEC_PREPARED_NOT_SENT / LINEARIZED_SIX_PLANE_PROTOCOL_VIOLATION_NOT_EVIDENCE / CONDITIONAL_MAP_AND_GROUP_THEOREMS_RETAINED_WITH_LIMITS / NO_PHYSICAL_CALCULATION / NO_CODATA_COMPARISON / NO_HSH_PREDICTION / NO_P2_SELECTION / NO_THEORY_PROMOTION`
