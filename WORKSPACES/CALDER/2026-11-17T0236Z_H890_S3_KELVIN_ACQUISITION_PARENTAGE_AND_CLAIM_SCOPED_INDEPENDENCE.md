# Calder h890:s3 — Kelvin-vortex acquisition parentage and claim-scoped independence

**Status:** SOURCE-BASED DEPENDENCY MAP COMPLETE · EXISTING PR #1515 EXTENDED · EXACT-HEAD LEAN RUN PENDING AT REPORT FREEZE · NO RAW DATA INGESTION · P2 HOLD.

This is an additive source-lineage crosswalk to the existing two-campaign P2 matrix in [issue #1855](https://github.com/Satobloc/HsH/issues/1855). It does not replace or alter the E/D/F/R gate.

## Finding

The Nature Physics and Physical Review Letters Kelvin-vortex papers are separate publications by the same three-person research team, with overlapping institutional affiliations and closely matching apparatus geometry. They do not demonstrate independent-laboratory replication. More importantly, their published acquisition descriptions do not expose every run/parentage relation needed to declare independent holdout.

A single **independent=true/false** field is inadequate. The comparison needs a **claim-scoped dependency profile**: record each dependency axis separately, then declare which axes must be distinct for the particular claim.

## Primary-source acquisition map

**Nature Physics, 10 February 2026:** Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” [DOI 10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w).

- Main contour record: typically 300 fps for 30 s over a 12.5 cm axial window; 60 μm/px image resolution and about 0.1 mm typical radius/position uncertainty.
- Left/right contours from the same optical recording produce a = (r0 + rπ)/2 and η = (r0 - rπ)/2. These are an invertible readout transform of the same two radial samples, not independent sensors.
- PDF acquisitions: a(z,t), 10 min at 100 fps; η(z,t), 3 min at 360 fps. Each is sliced into 1,000 axial positions across 2.5 cm and concatenated. Those positions are derived channels from a recording, not 1,000 independent replicates.
- PIV: separate modality, 6,000 fps for 0.1 s, 37×23 grid, 2.7 mm spatial resolution; circulation uncertainty about 0.005 m²/s. PTV tracks 1.5 mm particles; vertical-velocity uncertainty about 0.05 m/s.
- The paper fits Γ,v_z to the dispersion data and then checks agreement *a posteriori* with PIV/PTV. These are measured consistency checks, not a pre-registered independent holdout.
- Data locator: [Figshare DOI 10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The exact package version, files, acquisition IDs, raw bytes, checksums and covariance were not retrieved.

**Physical Review Letters, 21 September 2026:** Barckicke, Gissinger & Falcon, “Experimental Evidence of Kelvin-Wave Turbulence along a Vortex Core,” [DOI 10.1103/t3bt-m431](https://doi.org/10.1103/t3bt-m431).

- 480 fps, 3 Mpix camera tracking η(z,t) over a 20.6 cm axial window.
- The paper reports 1 min acquisitions for the wave spectrum, 15 min for the probability distribution, and 75 min for high-order correlation estimators.
- Pentacoherence is a sixth-order statistic formed from spatial Fourier amplitudes of the acquired η(z,t) field and averaged over T=75 min; it is not a separate sensor.
- Acquisition/run IDs and overlap/nesting among the 1-, 15- and 75-minute records are not published. Their cross-record parentage is therefore **UNKNOWN**, not proven SAME and not proven DISTINCT.
- Research data/software are not publicly available; the paper directs requests to the authors. No request was sent.

The earlier conversational shorthand that all three PRL analyses came from one proven “same measurement stream” is too strong. The source supplies analysis-specific durations, not the acquisition-parentage map.

## Cross-campaign dependency profile

| Axis | Status | Basis |
|---|---|---|
| Personnel | SHARED | Same three authors |
| Laboratory/institutional group | SHARED | Overlapping Université Paris Cité/CNRS MSC and LPENS/ENS/Université PSL affiliations |
| Apparatus family | SHARED | Both describe a 21 cm × 45 cm cylindrical container within a 50 cm cube reservoir, with two pumps/four inlets |
| Exact hardware identity | UNKNOWN | No serial/build/maintenance record |
| Raw-data overlap | UNKNOWN | Nature package not retrieved; PRL data not public |
| Acquisition/run parentage | UNKNOWN | No complete run-ID/overlap map |
| Calibration lineage | UNKNOWN | No shared calibration manifest/covariance package retrieved |
| Analysis lineage | PARTIAL | Same team, differing analyses; code/version lineage unavailable |
| Evaluation | SHARED STANDARD COMPARATOR | Classical Kelvin/Rankine/hollow-core models; comparator sharing is not itself a defect |

Thus the papers are separate publications and study analyses, but do not establish independent laboratory replication. Within-campaign independent holdout is also not admissible until acquisition IDs, parentage, covariance and calibration are recovered.

## Architecture improvement

The acquisition record now separates:

1. **Parentage:** UNKNOWN / AMBIGUOUS / VERIFIED unique acquisition parent. Equality of verified IDs identifies same-parent records; unequal verified IDs identify distinct parents.
2. **Dependency profile:** RAW_DATA / ACQUISITION / APPARATUS / PERSONNEL / CALIBRATION / ANALYSIS / EVALUATION / LABORATORY, each UNKNOWN / SHARED / DISTINCT / PARTIAL.
3. **Claim policy:** an explicit, nonempty set of axes that must be DISTINCT for the particular claim.

Examples are different policies, not universal rules: independent-acquisition holdout, independent-apparatus replication, independent analysis, and independent-laboratory replication. Shared lab does not automatically invalidate an independent analysis; separate papers do not automatically establish independent replication.

Covariance/uncertainty remains a separate empirical obligation. The existing E/D/F/R gates remain unchanged.

## Lean formalization

The existing Calder [PR #1515](https://github.com/Satobloc/HsH/pull/1515) already formalizes unit-fold factorization: channels assigned to one declared acquisition unit cannot be split across folds. That is **split integrity**, not statistical independence.

I added **CalderIndependenceProfile.lean** to the same PR. It formalizes the distinction between unique parentage and claim-specific dependency axes, blocks unknown/ambiguous parentage and unknown/shared/partial required axes, and proves that verified parentage alone does not admit an independent-replication claim.

This is an evidence-admission specification, not a proof of empirical independence. It does not authenticate locators/manifests, estimate covariance, validate source statements, or prove physical premises. No physical dataset, numerical fixture or physical calculation was used.

At report freeze, exact-head Actions run [#44008796146](https://github.com/Satobloc/HsH/actions/runs/44008796146) had failed on initial implementation errors. A correction was committed to the same PR; the new exact-head run for **77b357fdf80abb4a8332def3fd9ad05dedf8198c** was still pending at report freeze. No Lean pass is claimed here. PR #1515 remains OPEN / DRAFT / UNMERGED; no rebase or merge was attempted.

## P2 disposition

The source-defined readout chain is (r0, rπ) → (a, η) → spectra/statistics. The H(s)H composition still needs an explicit source-authorized map: H(s)H object → physical vortex state → camera image → (r0, rπ) → (a, η) → observables.
Only the camera/readout portion is defined. No worldtube-to-vortex map, added thickness, twist, contact surface, or distinct timesheet is forced by these experiments.

No measured data were ingested, no physical fit or prediction was made, and no numerical falsification threshold is justified. P2 remains **HOLD**.
