# Comma Gate 003 | Shared-geometry calculation pass 2026-11-10

**Status:** STANDARD-PHYSICS SANITY CHECKS EXECUTED; H(s)H GEOMETRY-TO-CONNECTION MAP NOT DERIVED. Not Factory Floor cleared. Not H(s)H candidate evidence.

## Purpose

Continue the GP-B/Cassini cross-sector gate using actual experimental systems and measured mission summaries. This pass calculates a leading-order diagnostic for the GP-B orbit and the leading solar Shapiro round-trip delay for the 2002 Cassini conjunction. It deliberately does not fit an H(s)H parameter or treat the standard-physics comparator as an H(s)H derivation.

## Source-grounded physical systems

### Gravity Probe B

GP-B collected science data from 28 August 2004 to 14 August 2005. The final all-gyro results were:
- Geodetic drift: -6601.8 +/- 18.3 mas/year; published full-GR prediction -6606.1 mas/year.
- Frame-dragging drift: -37.2 +/- 7.2 mas/year; published full-GR prediction -39.2 mas/year.

The mission's measurement is not a bare gyroscope-vector norm. The spacecraft telescope tracked guide star IM Pegasi, and the spin readout was resolved in spacecraft-fixed north-south and west-east axes. Will's covariant GP-B treatment explicitly formulates the observable as spin direction relative to spacecraft-fixed readout loops, including spacecraft roll and guide-star pointing. Therefore a vector precession estimate cannot be compared directly to the published N-S/W-E channels without reconstructing that instrument geometry.

### Cassini

The 2002 superior solar conjunction occurred on 21 June 2002. The radio path passed the Sun with minimum impact parameter approximately 1.6 solar radii; Cassini was approximately 8.43 AU from the Sun. The reported result was gamma = 1 + (2.1 +/- 2.3) x 10^-5. The experiment estimated gamma from coherent two-way radio Doppler/frequency shift, with multi-frequency calibration to suppress solar-corona dispersion.

## Calculations actually executed

The companion script `comma_gate_003_shared_geometry_pass_2026-11-10.py` was executed in a Python runtime.

### GP-B circular-orbit diagnostic

Using the approximate 642 km altitude, equatorial reference radius, JPL DE440 Earth GM, and a circular orbit:
- Reference radius: 7,020,137 m.
- Circular period: 97.5614 min.
- Leading geodetic magnitude: 6,620.9703 mas/year.
- Leading orbit-averaged Lense-Thirring vector magnitude: 40.9295 mas/year.

Compared with published full-GR values:
- Geodetic diagnostic is higher by 14.8703 mas/year.
- Frame-dragging diagnostic is higher by 1.7295 mas/year.

These differences are not anomalies. This calculation uses a rounded altitude, spherical/point-mass orbital approximation, a reference Earth angular momentum built from an approximate inertia factor, and a simplified orbit-averaged vector. It does not reconstruct the mission ephemeris, Earth's multipoles, the spacecraft roll, guide-star geometry, gyro-specific readout calibration, or the covariance of the final estimator. The mismatch is a diagnostic that the full geometry/readout is required, not permission to add a fitted correction.

### Cassini leading Shapiro delay

Using the leading PPN round-trip expression

`Delta_t = 2(1+gamma) GM_sun/c^3 * ln(4 r_1 r_2 / b^2)`

with gamma=1, r1=1 AU, r2=8.43 AU, and b=1.6 solar radii gives:

**262.4234 microseconds**.

This is a leading geometric delay estimate. It is not a re-fit of Cassini's Doppler time series and should not be compared as if it were the exact reported observable. The published measurement used the time-varying two-way fractional frequency shift as the spacecraft-Earth-Sun geometry evolved, not simply one scalar round-trip delay.

## What the common construction must generate

The standard comparator's architecture is:

1. A single spacetime metric.
2. Its connection, determining parallel transport of a gyroscope spin four-vector along the spacecraft worldline.
3. The same metric's null condition and null geodesics for the radio link.
4. The metric's rotational/off-diagonal structure, producing the Earth-spin/frame-dragging contribution.
5. The instrument/observer/readout maps converting those geometric quantities into the reported GP-B N-S/W-E drift and Cassini two-way Doppler observable.

The GP-B observable requires an explicit observer and readout map. The Cassini observable requires emitter/receiver worldlines, the radio null path, and the two-way coherent transponder phase/frequency readout. These cannot be collapsed into a generic "angle" or one coefficient.

## H(s)H geometry gate: current blockers

Recovered Nathan Direct source statements establish a straight vacuum worldtube, particle identity as tube morphology, a finite four-dimensional tube-like core, and an interacting time-bulk. However, the source set currently retrieved does not provide a unique, typed map from those objects to:
- a metric with declared signature and coordinate/observer structure;
- a connection or equivalent transport law;
- the GP-B gyroscope's physical spin director and spacecraft-fixed readout loops;
- the Cassini emitter/receiver paths and null-propagation/readout structure.

The source-fidelity audit also documents non-interchangeable historical object descriptions (1D filament, 4D worldtube, 3D time-bulk, and assistant-reconstructed two-form current) without a source-derived composition map. These must not be silently identified.

Therefore the H(s)H derivation is **BLOCKED at geometry-to-connection/readout specification**, not at numerical comparison. No new physical mechanism, metric, connection, coefficient, or topology has been introduced to rescue the calculation.

## Gate disposition

- Real experimental systems and reported results: **SOURCE-VERIFIED**.
- GP-B simplified diagnostic: **EXECUTED, NOT A MISSION RECONSTRUCTION**.
- Cassini leading Shapiro delay: **EXECUTED, NOT A DOPPLER RE-FIT**.
- Standard common metric/connection framework: **COMPARATOR SPECIFIED**.
- H(s)H source geometry: **PARTIALLY RECOVERED; OBJECT-MAP NONUNIQUE**.
- H(s)H connection and common transport/readout: **BLOCKED / NOT DERIVED**.
- Tier 1 hypothesis candidacy: **NOT ESTABLISHED by this calculation**.
- Factory Floor: **NOT SUBMITTED**; no system-specific precision geometric plot with hostile fidelity review is attached.
- No theory promotion, no comma interpretation, and no claim of physical validation.

## Primary references

- Everitt et al., 2011, GP-B final results, *Physical Review Letters* 106, 221101, DOI: 10.1103/PhysRevLett.106.221101. Stanford mission results page: https://einstein.stanford.edu/highlights/status1.html
- Will, 2003, "Covariant calculation of general relativistic effects in an orbiting gyroscope experiment", *Physical Review D* 67, 062003, DOI: 10.1103/PhysRevD.67.062003. The paper explicitly models spin relative to spacecraft-fixed readout loops and guide-star pointing.
- Bertotti, Iess & Tortora, 2003, "A test of general relativity using radio links with the Cassini spacecraft", *Nature* 425, 374-376, DOI: 10.1038/nature01997.
- Will, 2006, "The Confrontation between General Relativity and Experiment", *Living Reviews in Relativity*, DOI: 10.12942/lrr-2006-3. Summarizes the Cassini 2002 conjunction geometry and gamma result.

## Reproduction

Run:

```bash
python comma_gate_003_shared_geometry_pass_2026-11-10.py
```

The code contains every numeric input and prints the actual outputs. It is an independently executable research script, not a verified GitHub Actions run.
