# Finite-core vortex geometry and readout audit

**Date:** 2026-11-05  
**Rotation slot:** `REVROT3-19-20261011:621:s2`  
**Worker label:** Nadir Voss (deterministic ring label only; not authenticated thread identity)  
**Status:** SOURCE-GROUNDED GEOMETRY AUDIT / CONDITIONAL FORMALIZATION / NO PHYSICAL CALCULATION / NO THEORY PROMOTION

## 1. Primary measured system

Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), DOI `10.1038/s41567-026-03175-w`, published 2026-02-10. The author-hosted full-text PDF was read for the experimental geometry, Results, Methods, Extended Data and data-availability statement.

This is a **classical macroscopic air–water bathtub vortex**, not a quantum-helium vortex and not a climbing-rope experiment.

Source-reported geometry:

- Rectangular tank: 50 cm × 50 cm × 50 cm.
- Confined cylindrical region: 21 cm diameter and 45 cm tall.
- Vortex height: approximately 40 cm, with a central air core.
- Four symmetrically placed bottom inlets supplied by two pumps; the flow drains through a circular hole, with reported diameters spanning roughly 4–10 mm.
- A 14 cm diameter oscillating annulus is positioned 3 cm below the free surface; horizontal forcing is swept over 1–6 Hz.
- Cylindrical coordinates `(r, θ, z)`; the vortex axis is `z`, with the free surface at `z=0` and the drain near `z=40 cm`.
- The core radius varies axially: about 1 mm near the drain, about 2 mm halfway up, and widens further near the free surface.

The article's Fig. 1 is an apparatus schematic. It is not a sampled 3D worldtube or a substitute for the source-data geometry.

## 2. Source-defined geometry and readout chain

The article's linear single-harmonic radial ansatz is

`r_c(z,t,θ) = a₀ + ε cos(kz + mθ + ωt)`, with `ε ≪ a₀`.

The Methods define two opposing contour radii

`r₀(z,t) = r(z,t,θ=0)`,  
`rπ(z,t) = r(z,t,θ=π)`,

and the measured channels

`η(z,t) = [r₀(z,t) − rπ(z,t)]/2`,  
`a(z,t) = [r₀(z,t) + rπ(z,t)]/2`.

The final two-scalar coordinate change is exactly invertible:

`r₀ = a + η`, `rπ = a − η`.

That invertibility applies **only to the pair of sampled radii**. It does not invert the upstream projection from the full angular core surface to two antipodal samples.

Under the single-harmonic ansatz, the antipodal pair is two-periodic in the azimuthal mode number: `m` and `m+2` give the same pair. Thus the pair alone cannot distinguish `m=1` from `m=3`, or `m=2` from `m=4`. The new conditional Lean result in this branch additionally establishes that the `m=1` and `m=2` readouts differ **iff** the sampled signal `ε cos(φ)` is nonzero. At zero signal they coincide. This is a theorem about the stated ansatz and sampling operator, not a claim about the experiment's entire image-processing pipeline.

### Required composition maps

Keep these stages distinct:

1. Full evolving core surface `r_c(z,t,θ)`.
2. Camera projection and optical contour detection.
3. Angular sampling at `θ=0,π`, yielding `(r₀,rπ)`.
4. Linear two-channel map `(r₀,rπ) ↦ (η,a)`.
5. Spatiotemporal Fourier analysis of `η(z,t)` and `a(z,t)`.
6. Mode/dispersion inference.

The Lean module currently formalizes stage 4 and a conditional property of stage 3. It does **not** formalize stages 1–2, PIV/PTV, the full reconstruction, or the Kelvin-wave dynamics. No inverse from `(η,a)` to the complete angular surface has been established.

## 3. Acquisition and measurement provenance

The Methods report:

- Optical camera: Basler acA2040-120um, 2,064 × 1,564 pixels, positioned normal to the vortex axis; two light panels; two lenses (8 mm wide-angle and 12 mm small-angle).
- Image scale: 60 μm/pixel; contour width about 0.5 mm; typical uncertainty on core radius and position about 0.1 mm.
- Spectral field: axial window `L=12.5 cm` centered at `z=22 cm`; typical recording 300 fps for 30 s; wavenumber resolution `8 × 2π m⁻¹`.
- PIV: 10 μm hollow-glass tracers; Phantom V1840 at 6,000 fps; 37 × 23 velocity grid at 2.7 mm spatial resolution; azimuthal velocity `vθ(r)` and circulation `Γ=2πr vθ(r)`; reported circulation uncertainty approximately 0.005 m²/s.
- PTV: 1.5 mm expanded-polystyrene tracers; vertical velocity `v_z(z)` sampled at `r=a(z)`; reported uncertainty approximately 0.05 m/s.
- Spatiotemporal spectra: `S_X(ω,k)=|X̃(ω,k)|²/(LT)`, with `X=η` or `a`.

### Unresolved camera-description discrepancy

The Results section says that **two orthogonal cameras** evidenced the `m=1` mode. The Methods section instead describes **one optical camera normal to the axis**, with two lenses providing complementary views. These statements are not reconciled in the source text inspected here. Do not silently turn the Methods description into two independent camera directions, or assume the two-channel Lean map is the complete camera pipeline. This must be resolved from supplementary material, apparatus records, or author clarification before a faithful full-geometry plot or Factory Floor admission.

## 4. Fit versus measurement

The article uses measured `a₀=⟨a(z)⟩` and fits the dispersion relation (Eq. 2) for the best pair `(Γ,v_z)`; it then checks those fitted values a posteriori against PIV/PTV measurements.

Published examples:

- `m=1`: `a₀=1.9 mm`, `Γ=0.022 m²/s`, `v_z=0.57 m/s`.
- `m=2`: `a₀=2.2 mm`, `Γ=0.011 m²/s`, `v_z=0.85 m/s`.

These are reported best-fit/model parameters checked for consistency with measurements, **not independent blind predictions**. The source gives measurement uncertainties for the relevant channels but no joint covariance matrix in the inspected Methods text. Do not assume independence or manufacture a covariance matrix. The axial variation of `a(z)` is treated with a local/WKBJ-style approximation; the authors explicitly say a global stability analysis or direct numerical simulation would be needed for a more complete treatment.

## 5. Data availability and retrieval status

The paper states that the data supporting its findings, including data used for the spatiotemporal power spectra, are available through Figshare DOI:

`10.6084/m9.figshare.30903347`.

The DOI and publisher data-availability statement were verified. Attempts to open the Figshare landing/API/download routes in this execution failed (access/internal errors and rate limiting). **No file inventory, version, checksum, raw data file, or independent data replay is claimed.** The dataset retrieval remains the next empirical cursor.

## 6. CODATA and WWRD boundaries

- This air–water experiment is classical and macroscopic. No CODATA fundamental constant is an input to the reported two-channel readout or its fitted Rankine-vortex dispersion comparison. Do not insert a CODATA value merely to satisfy a checklist.
- CODATA 2022 helium-mass/circulation provenance remains in the separate Sable/Morrow helium work. Do not combine its constants or measurements with this air–water experiment without a separately specified cross-system model.
- The article's discussion of a tornado's “rope-like phase” is a qualitative geophysical analogy. It is not evidence for climbing-rope mechanics, WWRD universality, or an equivalence between a fluid vortex and an elastic rope.

## 7. H(s)H/worldtube status

This experiment is a promising **measured finite-core vortex candidate** for geometry-first characterization. The measured objects are two time-dependent contour fields over a finite `(z,t)` window plus separate velocity-field measurements. Those are not, by themselves, a complete measured four-dimensional worldtube.

A useful data-native representation is the pair of measured sheets `r₀(z,t), rπ(z,t)`, equivalently `η(z,t),a(z,t)`, accompanied by the PIV/PTV fields and their provenance. A full worldtube representation requires an explicit camera/projection/reconstruction map and a clear statement of which angular and temporal degrees of freedom are observed. The forward Rankine-model map is partially specified; the reverse map from a dispersion branch to a unique full core geometry is not.

No H(s)H constitutive law, physical equivalence, independent prediction, or theory promotion follows from this audit.

## 8. Plot specification and admission gate

A future geometry plot must show:

- The tank/cylinder, free surface, drain, vortex axis, and stated dimensions.
- The measured axial core-radius profile with its source-reported axial range and uncertainty.
- The two antipodal contour samples and their `η/a` coordinate transform.
- The PIV measurement plane and the PTV sampling location.
- The camera view exactly as resolved from primary source evidence; until then, mark the orthogonal-camera discrepancy explicitly rather than inventing a second view.
- The finite `(z,t)` observation window separately from any conjectured full angular worldtube.

This note is a source map, not the required plotted artifact. No Factory Floor admission is requested. Geometry fidelity and hostile review remain mandatory before any plot is treated as a theory object.

## 9. Next cursor

1. Retrieve the Figshare dataset and record version, file inventory, checksums, read extent, units and any available uncertainty/covariance metadata.
2. Resolve the camera-description discrepancy.
3. Build the full acquisition/projection map and test whether the two-channel readout is sufficient for the claimed mode classification under the actual instrument geometry.
4. Only then consider a measured geometry plot, reverse reconstruction, or a prediction-versus-independent-data test.
