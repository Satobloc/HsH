# Addendum to WWRD rope-mechanics record: aramid-strand contact metrology

**2026-11-07 | Source/metrology addendum | No H(s)H equivalence, fit, prediction, or theory promotion**

This addendum extends the existing WWRD evidence record in [HsH issue #1096](https://github.com/Satobloc/HsH/issues/1096). The 2025 aramid-rope study was already listed there as a lead; this note adds the measurement protocol, calibration limits, and uncertainty boundary recovered from the full article. It does not duplicate the earlier rope-ground, climbing-rope fall, or nylon kernmantle impact records.

## Identifiable measured system

The study, “Experimental analysis of contact forces between strands in three-strand ropes,” examines three-strand aramid-fiber ropes with different strand/yarn twist configurations. The reported specimens use yarns containing 1,000 filaments. This is a stranded aramid-rope system, **not** a climbing kernmantle rope and not an H(s)H object.

## Measurement and calibration

- Strand-to-strand contact pressure was measured with pressure-sensitive film.
- The film was calibrated in situ between sapphire blocks.
- Tests were conditioned at 20 °C and relative humidity above 55%.
- Film scans were acquired at 600 dpi and processed with a calibration curve in MATLAB.
- Contact width was measured optically with a VHX-5000 microscope and edge detection.
- The reported pressure-film accuracy is approximately ±10%; the usable measurement range is 10–40 MPa. Below that range sensitivity is inadequate; above it the film saturates.
- The study reports at least eight measurements per load condition.

The paper defines contact force per unit rope length from the measured pressure and contact width:

\[
q_\ell = p\,w.
\]

For independent first-order propagation, the required uncertainty is

\[
u^2(q_\ell) \simeq w^2u_p^2+p^2u_w^2
+2pw\,\operatorname{Cov}(p,w).
\]

The article supplies a pressure-film accuracy figure but does not provide a complete uncertainty for optical contact width or the pressure/width covariance. Therefore a complete uncertainty for \(q_\ell\) cannot be reconstructed from the published information alone. No contact-force values were recalculated here.

## What the evidence supports

The measured contact pressure and width vary with rope construction and twist. This supports a material- and geometry-specific contact model; it does **not** support a universal rope law or a universal twist/contact coefficient.

The article's data-availability statement says the data are available upon reasonable request. I did not retrieve raw files, a file inventory, checksums, replicate-level values, or a covariance matrix. This is a calibrated published measurement description, not an independently reanalysed dataset.

## Relevance to WWRD, with the analogy boundary preserved

The study is useful as a mechanical comparator because it makes internal strand contact, twist, filament count, contact width, and pressure explicit. A later comparison would need a specified rope construction, material law, local director/twist frame, contact/friction law, boundary conditions, and an instrument/readout map.

No map from this rope system to the current H(s)H Klein-Fabric/worldtube construction is source-defined. The older reciprocal filament/timesheet-deformation description remains superseded by the later Nathan Direct Klein-Fabric update. The rope result is not a physical equivalence, not a WWRD validation, and not an H(s)H prediction.

## CODATA and calculation status

No CODATA constant is an input to this material-contact experiment. No CODATA numerical comparison, H(s)H calculation, parameter fit, or physical prediction was performed. The missing width uncertainty/covariance and unavailable raw data are explicit blockers to a defensible numerical reanalysis.

## Reference

“Experimental analysis of contact forces between strands in three-strand ropes,” *Textile Research Journal*, DOI: [10.1177/00405175251333381](https://doi.org/10.1177/00405175251333381). First published online 2025-05-06.

**Disposition:** literature/metrology addendum to issue #1096; no new universal rope claim and no theory promotion.