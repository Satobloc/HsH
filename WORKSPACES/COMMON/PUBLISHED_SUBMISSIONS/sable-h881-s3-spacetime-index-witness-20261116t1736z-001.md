# SpacetimeIndexWitness: preserve physical axes through processing

**Status:** Proposed additive provenance contract. Not an author-error allegation, physical prediction, empirical result, or BEDROCK change.

## Source and finding

Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22 (2026). [Article DOI](https://doi.org/10.1038/s41567-026-03175-w) · [author PDF](https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/BarckickeFalconGissingerNatPhys2026.pdf) · [data DOI](https://doi.org/10.6084/m9.figshare.30903347).

The Methods section describes 'a(z,t)' recorded for 10 min at 100 fps and 'η(z,t)' for 3 min at 360 fps, each sliced into 1,000 z-values over 2.5 cm and concatenated into a single temporal file. It does not specify the final array shape, axis order, flattening order, coordinate vectors, or inverse mapping from stored indices to physical time and position.

This is an **index-provenance ambiguity**, not evidence of an author error. The PDF pooling operation and plotted temporal traces may be separate products. A flattened sequence is not automatically a time series.

## Source-reported measurement channels

| Channel | Acquisition / resolution | Observable / uncertainty |
|---|---|---|
| Optical contour | Basler acA2040-120um; 2,064 × 1,564 px; 60 μm px⁻¹; 0.5 mm contour width; typical radius/position uncertainty ≈0.1 mm; spectral recording 300 fps × 30 s | 'a(z,t)', 'η(z,t)'; 12.5 cm z-window |
| PIV | Phantom V1840, 6,000 fps × 0.1 s; 37 × 23 grid; 2.7 mm spatial resolution; 10 μm tracers, St ≈0.1 | 'vθ(r)', Γ; typical Γ uncertainty ≈0.005 m² s⁻¹ |
| PTV | 1.5 mm expanded-polystyrene tracers at r=a(z) | 'vz(z)'; typical uncertainty ≈0.05 m s⁻¹ |

These are distinct measurement operators; their supports, grids, uncertainties and synchronization must not be collapsed into one generic resolution.

## Source-derived bookkeeping

| Recording | Duration | Rate | Frames | Frame interval |
|---|---:|---:|---:|---:|
| 'a(z,t)' | 600 s | 100 s⁻¹ | 60,000 | 0.010 s |
| 'η(z,t)' | 180 s | 360 s⁻¹ | 64,800 | 1/360 s ≈0.002778 s |
| Spectral optical | 30 s | 300 s⁻¹ | 9,000 | 1/300 s ≈0.003333 s |

If, and only if, every frame contributes all 1,000 z-values, the first two scalar totals would be 60,000,000 and 64,800,000. These are conditional storage counts, not verified array dimensions or independent sample counts. The article's 12.5 cm window gives 1/L=8 m⁻¹, consistent with its stated Δ(k/2π)=8 m⁻¹. This is acquisition bookkeeping, not an H(s)H calculation.

## Proposed contract and admission rules

SpacetimeIndexWitness adds a data-index layer to the existing CountStageWitness, SnapshotBoundMapEdge, and coarse-grained memory gate in [issue #1359](https://github.com/Satobloc/HsH). Bind source/file digest; acquisition/run/instrument/timebase/frame IDs; exact array shape and axis order; coordinate vectors/units; masks/boundaries; stored-index → physical-coordinate map; flattening order/inverse map; processing operator/version; sample semantics; and admissible analyses.

- **Temporal correlations / memory kernel:** require monotonic physical time, verified Δt, frame-gap record, and fixed z or explicit spatial reduction. A flattened (t,z) index is not physical time.
- **Spatiotemporal Fourier:** require original X(z,t), both coordinate vectors, Δz/Δt, mask and boundary/window treatment.
- **PDF pooling:** flatten only with declared pooled-ensemble semantics, weights and dependence. Scalar count is not independent N.
- **Cross-channel:** require run identity and explicit synchronization/resampling. Optical, PIV and PTV are not presumed simultaneous.
- **Coarse-graining:** bind fine-state index map, coarse operator, slice-transfer map and derived memory term. If indexing is unresolved, the memory test is UNSCORABLE, not a fitted kernel.

## H0/H1 test matrix

| Element | Standard H0 | H(s)H requirement | Status |
|---|---|---|---|
| Geometry | Measured vortex contour / standard fluid state | Source-authorized carrier, slice and projection maps | H(s)H map undefined |
| Indexing | Calibrated X(z,t) axes | Same index map bound to every readout edge | Raw axis manifest absent |
| Calibration | Shared optical/PIV/PTV calibration and covariance | Same calibration plus declared H(s)H response | Raw covariance absent |
| Prediction | Classical hollow-core / Rankine-core Kelvin dispersion; Sη(ω,k), Sa(ω,k) | Frozen observable differing from H0 after same instrument operator | Not formed |
| Holdout / falsification | Independent run; preregistered covariance-derived threshold | Same held-out run and nuisance budget; no post-hoc kernel freedom | Not selected; no numeric threshold |

Standard-model fitted a₀, Γ and vz are fit/readout values, not H(s)H predictions. A worldtube thickness, twist or contact surface is not forced by this indexing issue.

## Evidence boundary

The Figshare DOI is identified, but raw files, manifest, checksums, array shapes, coordinate vectors, flattening order, frame IDs and run-level covariance were **not acquired in this run**. No raw-byte readback, physical fit, H(s)H prediction or independent measurement was performed.

Primary article details are source-reported; frame counts and reciprocal-window check are derived arithmetic; 1,000-z-per-frame totals are conditional bookkeeping; SpacetimeIndexWitness is assistant-proposed. BEDROCK, SAT-O and Blockwave equations remain unchanged.
