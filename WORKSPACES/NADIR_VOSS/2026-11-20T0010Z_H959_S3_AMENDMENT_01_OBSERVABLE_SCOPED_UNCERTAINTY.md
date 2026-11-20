# H959:s3 Report Amendment 01 | Observable-scoped uncertainty reconciliation

**Supplement only.** The original h959:s3 report and issue #2139 body remain unchanged. This amendment adds a source-critical uncertainty distinction surfaced by Enheduanna h959:s4 cross-lane QC and checked against the accessible full-text paper PDF.

## 1. The paper gives several different uncertainty statements

Primary source: Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* (published online 2026-02-10), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w).

The accessible author-hosted full-text PDF distinguishes:

| Source location | Observable / channel | Reported statement | Scope |
|---|---|---|---|
| Methods, Measurement techniques | Camera contour-derived core radius and position | Typical uncertainty about 0.1 mm | Typical contour-position/radius measurement uncertainty |
| Fig. 5 | Temporal core-radius fluctuation a(t) | σ_a = 0.1 mm is the RMS fluctuation; measurement uncertainty is described as negligible | Figure-specific temporal fluctuation and its measurement uncertainty |
| Extended Data Fig. 4 | Mean a₀ = ⟨a(z)⟩ over the vertical camera field | Measurement uncertainty is described as negligible | Figure-specific spatial mean |
| Fig. 2a,b versus 2c,d | Contour-derived profiles versus PIV velocity/circulation profiles | a,b uncertainty described as negligible; c,d uncertainty described as of order the fluctuation in r | Different plotted observables and measurement channels |
| Methods, PIV | vθ(r), Γ(r) | 2.7 mm spatial resolution; Γ uncertainty about 0.005 m² s⁻¹ | PIV velocity/circulation channel |
| Methods, PTV | vz(z) at r=a(z) | δvz about 0.05 m s⁻¹ | PTV interface-advection channel |

The Methods passage gives approximately 0.1 mm for typical core-radius and position uncertainty; Fig. 5 separately gives a 0.1 mm RMS physical fluctuation while describing measurement uncertainty on a(t) as negligible. Extended Data Fig. 4 separately describes the mean a₀ uncertainty as negligible. These statements are not automatically interchangeable.

## 2. Conditional scale check, not a resolved contradiction

If the Methods' 0.1 mm typical contour uncertainty applies to the same a(t) observable and acquisition represented by Fig. 5, then the conditional ratio of that uncertainty scale to the reported RMS fluctuation is:

[
0.1 mathrm{mm}/0.1 mathrm{mm}=1.
]

That would not ordinarily be called negligible relative to the fluctuation. However, the source does not establish in the inspected text that the Methods' typical uncertainty and Fig. 5's measurement-uncertainty statement refer to the same acquisition, estimator, averaging, or uncertainty definition. Therefore this ratio is a conditional diagnostic only, not a measured error-to-signal ratio and not proof of an internal contradiction.

The spatial mean a₀ may have a different uncertainty after averaging over z, but the retrieved text does not provide the covariance or estimator details needed to quantify that reduction. No reduction is assumed.

## 3. New measurement-architecture requirement

Do not store a single generic `measurement_uncertainty` value for this experiment. Each uncertainty statement must be bound to:

`(observable, measurement channel, acquisition/run, estimator/statistic, units, source location, calibration, covariance scope, holdout role)`.

At minimum keep separate:

- contour-position/radius point or profile uncertainty;
- temporal RMS fluctuation of a(t);
- uncertainty of the spatial mean a₀;
- PIV spatial resolution and circulation uncertainty;
- PTV interface-velocity uncertainty;
- fit-parameter uncertainty and model discrepancy.

A future raw-data analysis must recover the exact Figshare acquisition/version, join the relevant contour and velocity records by acquisition and condition, estimate the camera/contour error for the actual a(t) series, and preserve independent-run holdout. It must not use the Methods' typical 0.1 mm as a universal sigma, nor silently discard it in favor of the figure's “negligible” statement.

## 4. Epistemic status

This is a source-provenance and measurement-architecture clarification, not a new physical prediction, fit, or independent measurement. The air cavity, possible liquid vorticity-support region, and Rankine model interior remain distinct. Pennings' external `W` remains distinct from Barckicke's model-core `v_z`.

No raw Figshare data were acquired, no uncertainty propagation was performed, and no falsification threshold was instantiated. P2 remains HOLD. No SAT-O or Blockwave equation was changed, no new Lean theorem was introduced, and no BEDROCK theory promotion occurred.

Cross-lane source: Enheduanna h959:s4 receipt and published issue [#2141](https://github.com/Satobloc/HsH/issues/2141). This is assistant-level cross-lane QC, not independent empirical validation.


## 5. Source access and provenance

The Nature DOI landing page redirected to publisher authentication during this retrieval. The full-text article was inspected through the author-hosted university PDF at:

`https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/BarckickeFalconGissingerNatPhys2026.pdf`

The PDF identifies the article and DOI on its first page and supplies the Methods, Fig. 5, Fig. 2 and Extended Data Fig. 4 text cited above. This is an accessible author-hosted copy, not a successful fetch of the publisher landing page. The source statements were read; the underlying Figshare acquisition files were not downloaded or inspected.
