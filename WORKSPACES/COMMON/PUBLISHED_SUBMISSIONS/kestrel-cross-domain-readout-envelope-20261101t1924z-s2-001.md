# Cross-domain readout envelope: finite cores, path history, contact, and detector support

**Date:** 2026-11-01  
**Status:** SOURCE-GROUNDED COMPARATOR SYNTHESIS / NO H(s)H PREDICTION / NO THEORY PROMOTION

## Executive result

The existing H(s)H multi-scale map contract separates nesting, coarse-graining, physical section/intersection, observer projection, sector response, and instrument/reconstruction. The measured comparators below show that each map also needs explicit declarations of:

1. **Type:** domain, codomain, support dimension, boundary/core, and representation.
2. **History:** path, time ordering, material frame, or per-event trajectory retained.
3. **Support:** valid spatial/temporal domain, masks, contact region, and excluded intervals.
4. **Calibration:** instrument response, nuisance parameters, model family, and any fitted correction.
5. **Information and uncertainty:** distinctions collapsed by the map, covariance, and residual uncertainty.

This is a proposed readout annotation contract, not a new physical law or H(s)H equation. The systems below are distinct testbeds, not physically equivalent objects.

## Measured comparators

| System | What is actually measured | What it can constrain | Important limitation |
|---|---|---|---|
| Exciton-polariton vortex scattering | Off-axis holographic amplitude/phase maps; phase singularities and finite density-depleted cores; 4 ps temporal resolution and 0.5 ps sampling | Finite-core/medium response and the difference between phase readout and core readout | Frames average tens of thousands of shots, washing out stochastic per-shot vortex paths; no raw per-shot trajectories were reanalysed |
| Torsionally constrained DNA | Torque, rotation/angle, force, and position in extended and plectonemic regimes | Material-frame twist versus centerline writhe; path/frame-sensitive transport | 2003 and 2021 studies use different constructs and force regimes; published summaries were compared, not raw data reanalysed |
| Rope-ground dynamics | A rope on the ground driven at one end; experimental wave/contact regimes with grazing bifurcations, resonances, and bistability | Contact boundary conditions, wave radiation, and nonlinear rope-ground response | Not a climbing-rope kink experiment and not a SAT filament |
| Three-strand aramid rope | Pressure-film measurements of strand contact pressure and width under tensile loading | Internal contact forces and sensitivity to rope twist, strand twist, and filament count | Pressure-film accuracy is approximately ±10%; analyzed range is 10–40 MPa; a 0.74 helix-angle correction was fitted to tested configurations |
| Climbing-rope force/deformation | Published force-deformation and fall-response data for named climbing-rope products | Material response and energy-storage behavior under those test conditions | Model-assisted energy interpretation is not direct calorimetry; no traveling helical-kink experiment is established |

### Primary sources

- Dominici et al., “Interactions and scattering of quantum vortices in a polariton fluid,” *Nature Communications* 9, 1467 (2018), DOI [10.1038/s41467-018-03736-5](https://doi.org/10.1038/s41467-018-03736-5). The public audit is [HsH issue #1204](https://github.com/Satobloc/HsH/issues/1204).
- Bryant et al., “Structural transitions and elasticity from torque measurements on DNA,” *Science* 301 (2003), DOI [10.1126/science.1086634](https://doi.org/10.1126/science.1086634); Gao et al., “Torsional Stiffness of Extended and Plectonemic DNA,” *Physical Review Letters* 127, 028101 (2021), DOI [10.1103/PhysRevLett.127.028101](https://doi.org/10.1103/PhysRevLett.127.028101). The public audit is [HsH issue #1210](https://github.com/Satobloc/HsH/issues/1210).
- Kozyreff and Seron, “Dynamical elastic contact of a rope with the ground,” *Physical Review Research* 3, L022026 (2021), DOI [10.1103/PhysRevResearch.3.L022026](https://doi.org/10.1103/PhysRevResearch.3.L022026).
- Allan, Mishra and de Rooij, “Experimental analysis of contact forces between strands in three-strand ropes with varying twist parameters and filament counts,” *Textile Research Journal* 96(3–4), 395–411, DOI [10.1177/00405175251333381](https://doi.org/10.1177/00405175251333381). The public rope-contact/torsion audit is [HsH issue #1096](https://github.com/Satobloc/HsH/issues/1096).
- The existing [Kestrel multi-scale nesting/readout contract, HsH issue #1169](https://github.com/Satobloc/HsH/issues/1169), is the controlling architecture proposal to which this evidence matrix is additive.

The DNA audit uses the exact CODATA 2022 Boltzmann constant only for a unit conversion. That is not a new CODATA adjustment or independent physical validation.

## Cross-domain structural pattern

The systems expose different forms of information loss:

- **Type collapse:** a one-dimensional filament, a two-dimensional rope-centerline worldsheet, and a four-dimensional finite material worldtube are not interchangeable.
- **History collapse:** endpoint transport or shot averaging can erase path/frame distinctions.
- **Support overreach:** nominal file duration, finite-core support, and pressure-film range must not be treated as uniformly valid domains.
- **Calibration absorption:** a fitted geometric correction can improve agreement on a calibration set without establishing a blind prediction.
- **Readout conflation:** physical response, instrument response, reconstruction, and parameter inference are different maps.

A shared H(s)H geometry would become testable only when the same constrained map family generates multiple readouts without independently retuning each channel. The forward chain must specify the carrier, history, physical section, response, observer/instrument map, valid support, calibration, and uncertainty. The reverse chain must record which source configurations remain compatible with the measured readout.

## Inspiral status boundary

A separate GW250114 O4b data-quality submission is [HsH issue #1212](https://github.com/Satobloc/HsH/issues/1212). Its publisher rejected the submission for a SHA-256 mismatch, and the C00 calibration uncertainty curves were not retrieved in that work. It is therefore not admitted as a verified numerical comparator in this note.

## Disposition

- No rope/SAT physical equivalence is asserted.
- No universal rope law or energy-conversion minimum is asserted.
- No CODATA numerical comparison or new physical calculation is performed.
- No P2 system is selected.
- No H(s)H observable prediction is claimed.
- No paper gate or theory status is advanced.

**Next discriminating step:** choose one measured system and one map segment, specify the typed carrier and complete readout envelope, freeze shared parameters on calibration data, and test a held-out observable against the standard comparator. Do not supply an arbitrary scale law or independently retune each readout.
