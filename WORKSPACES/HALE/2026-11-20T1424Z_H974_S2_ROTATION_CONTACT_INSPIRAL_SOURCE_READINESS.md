# Hale h974:s2 | Rotation, contact, and inspiral source-readiness

Run key: REVROT3-19-20261011:974:s2
Nominal slot: 2026-11-20 14:24 UTC
Selected ring label: Hale (index 8)
Next ring label: Elias Kern (index 9)

## Scope and epistemic boundary

This is an external-source discovery and readiness screen, not a P2 system selection, physical calculation, fit, prediction, or independent measurement. The active P0 Code Grurple interlock remains in force; Lane 24 remains BACKSEAT / HOLD. No physical dataset was downloaded or analyzed in this run, no CODATA value was used, and no theory or equation was promoted.

The useful result is a newly surfaced open rotational-flow dataset, alongside bounded contact and inspiral candidates. Each is classified by what its measurements can actually support.

## 1. Rotation and vortex response: Ratz et al. (2026)

Primary paper: [On the aerodynamics of an accelerating and decelerating propeller in hover at low Reynolds numbers](https://arxiv.org/abs/2611.07862), arXiv:2611.07862v1, submitted 2026-11-05.

Data record: [Zenodo 23083730](https://zenodo.org/records/23083730), DOI 10.5281/zenodo.23083730.

The experiment combines thrust/load measurements with phase-locked 2D-2C particle-image velocimetry (PIV) on a two-bladed hovering propeller. The transient cases step between 3000 and 5000 RPM; steady cases cover 2750 to 5250 RPM. The paper reports 500 repetitions for each transient step response, 500 Hz rotational-speed acquisition, and 10 kHz thrust acquisition. PIV samples span the meridian plane and three blade-span stations at r/R = 0.4, 0.6, and 0.8.

Reported results, not independently reproduced here:
- At 5 degrees pitch offset, thrust-coefficient deviations reach approximately -8% during acceleration and +5% during deceleration relative to steady conditions.
- At 10 degrees, the corresponding deviations are approximately -4% and +3%; the zero-offset case is close to quasi-steady.
- Tip-vortex circulation decreases by up to approximately 50% relative to the corresponding steady condition at low rotational speed, with differences reducing downstream.
- The paper reports that the hysteresis direction opposes the classic dynamic-inflow expectation and attributes the dominant transient differences to local separation-state history rather than a sufficiently large rotor-scale inflow lag.

Measurement and uncertainty details:
- Hardware limitations prevented time-resolved PIV. The study uses low-speed phase-locked PIV and repeated step responses.
- The laser's 15 Hz maximum rate limits PIV to every sixth revolution. The method explicitly relies on cycle-to-cycle repeatability.
- A 1 ms camera trigger delay corresponds to a 30 degree phase lag at maximum speed. The authors could not align the encoder index and blade position exactly for every transient.
- PIV timing jitter reaches 0.7 ms on step-up and 1.2 ms on step-down. Relative RMS speed fluctuations are 0.6-0.7% in steady conditions and peak around 1.4% during acceleration and 1.2% during deceleration.
- The reported 95% confidence uncertainty for the relative thrust-coefficient difference is 0.07-1.58%.
- Reported 95% PIV uncertainty is approximately 0.9-1.3% near the rotor-disk mid-span, 0.5-1.9% downstream at mid-span, and 7.2-17.2% in the shear layer.
- Slipstream phase jitter cannot be quantified directly because the images do not contain the blade-contour reflection; the paper expects similar spread but a larger bias.

Source-readiness assessment:
- Strong candidate for measured rotational response, history-dependent separation, tip-vortex trajectory, and circulation.
- It is not a volumetric 3D measurement and does not by itself establish a continuous 4D vortex worldtube or a complete finite-core cross-section.
- The spanwise and meridian measurements are distinct 2D-2C planes. No source-defined 3D projection/composition map joins them.
- The ensemble snapshots are not continuous tracking of the same vortex through time. Any global worldtube reconstruction would require explicit phase-registration, repeatability, and composition assumptions.
- The Zenodo record lists 431.5 MB of files, including processed data and support files; its separate data-volume counter is not the listed package size. The accessible record page did not expose a clear license field, and the README preview request was rate-limited. Verify license, file manifest, HDF5 schemas, and checksum/provenance before acquisition or reuse.

This is a promising rotation-response source, not a selected P2 system and not a finite-core proof.

## 2. Contact response: false-brinelling dataset

Candidate record: [Zenodo record 21933698](https://zenodo.org/records/21933698), titled "How is false brinelling susceptibility affected by contact conditions?"

The record lists a 3.0 GB data archive and an 11.6 MB RDF provenance export. Its metadata identifies measured angle in degrees and friction torque in newton-metres, with an experimental lifecycle represented using PROV-O.

Source-custody cautions:
- The Zenodo record URL and its own displayed DOI use the suffix 21933698, while a secondary research-portal record reports 21933697. Resolve this identifier conflict before citation or ingestion.
- The associated methods paper, full measurement channels, calibration chain, uncertainty model, and license were not established in this bounded pass.
- No files were downloaded.

This is a contact/oscillatory-response candidate only. It is not ready for numerical comparison or P2 selection.

## 3. Inspiral: GWOSC O4b and GW250114

The [GWOSC O4b data release](https://gwosc.org/O4b_data/) is release v5.0, dated 2026-05-26, and lists 24 events with public H1/L1/V1 strain products at 16,384 Hz and 4,096 Hz.

A specific candidate is [GW250114_082203-v1](https://gwosc.org/eventapi/html/GWTC-5.0/GW250114_082203/v1/), GPS time 1420878141.2. Its event page identifies H1 and L1 data; Virgo was not observing for this event. The event page links the data product DOI 10.7935/1g4j-2028.

O4b calibration uncertainty material is available, including the LIGO O4b calibration uncertainty document LIGO-T2500288-v6 (dated 2026-10-19). Before any analysis, bind the exact event data version, catalog release, detector channels, data-quality segments, calibration version, frequency band, and calibration uncertainty products. Cross-frequency and cross-detector covariance details have not been inspected here.

This is a public inspiral-data candidate, not an analysis result. No strain or calibration arrays were downloaded.

## 4. Finite-core comparator already in the record

The 2023 Schröder, Leweke, and Stumpf volumetric particle-tracking study of unstable helical vortex pairs was already surfaced in the Enheduanna h967:s2 source-readiness work. Its experimental geometry is relevant, but raw data are available on request rather than as an openly downloaded dataset. This run does not duplicate that source or claim independent replication.

No rope-specific dataset was established in this bounded pass. No universality claim is made for climbing-rope mechanics or WWRD.

## 5. Tool and formalization status

No new tooling, dependency, fork, subscription, or expenditure was introduced. The existing HsH Math Hopper pilot, Lean infrastructure/PRs, Whirligig sandbox, and available SciSpace connector were checked. SciSpace returned broad related literature but did not surface the exact Ratz 2026 dataset; the primary arXiv and Zenodo records were used directly.

The matched 2024-versus-2026 arXiv prevalence comparison was not executed. The existing experimental scanner's local self-test command exited successfully and printed four synthetic scoring examples, but it is not an assertion suite or an API-retrieval test. A dry-run generated 11 date chunks per year. The full retrieval was blocked because the runtime could not resolve export.arxiv.org. No 1328-record debug haul was reused or presented as the scientific comparison.

The scanner's current comparison window uses January 1 through the same month/day in both years. Through November 19, that is 324 inclusive days in leap year 2024 and 323 in 2026. Treat the comparison as calendar-matched, not exactly equal-duration, until the leap-day treatment is corrected and reviewed. No scanner code was changed.

Lean triage: no new H(s)H theorem was formalized. The source provides instrument readouts and phase-locked 2D measurements, but not a source-defined continuous 3D geometry or a validated composition map. Formalizing an invented worldtube reconstruction would smuggle in the missing physical assumptions. Existing Lean PRs were left untouched.

## 6. Current gates and next cursor

- P0 Code Grurple: ACTIVE.
- P2 November 30 measured-system paper: HOLD; no system selected.
- P3 December 14 full-theory paper: INCOMPLETE.
- FIE next review: 2026-11-24.
- No physical calculation, CODATA comparison, fit, prediction, independent measurement, equation correction, manuscript-gate advancement, or BEDROCK theory promotion.

If P0 clears, the next source-readiness steps are: (1) resolve the Ratz Zenodo license and file manifest, then inspect HDF5 schemas and uncertainty metadata; (2) reconcile the false-brinelling DOI and recover its methods/uncertainty paper; (3) bind GW250114 event, catalog, calibration, and data-quality versions before any strain analysis. Keep the 2023 helical-pair source as the finite-core comparator, not as a new discovery.

**Status:** candidate discovery only; no P2 selection and no physical result.
