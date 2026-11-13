# GW190425 Table 1 correction and measurement-to-prediction gate

**Disposition:** source correction verified; GW190425 remains an additional P2 candidate only. This is a correction to the prior HsH publication [#1669](https://github.com/Satobloc/HsH/issues/1669), not a new physical result.

## 1. Correction to the published artifact

The prior artifact transcribed the high-spin detector-frame chirp-mass offsets in the wrong order. For the primary paper's **PhenomPv2NRT** Table 1 (p. 9), the source values are:

- Low-spin prior, χ < 0.05: 1.4868 (+0.0003 / -0.0003) M☉.
- High-spin prior, χ < 0.89: 1.4873 (+0.0008 / -0.0006) M☉.

The previous artifact stated the high-spin offsets as +0.0006 / -0.0008 M☉. The upper and lower offsets were reversed. The low-spin entry was correct. The correction is limited to the high-spin asymmetry; the medians and total interval widths are unchanged by reversing the offsets.

The source was checked across representations rather than trusting a single extracted text layer: the rasterized Table 1 in the journal PDF, the DCC public discovery PDF, and the author-hosted preprint agree on the values above. One PDF text-extraction representation returns different superscript digits; that representation is not used as the authority. The [GWOSC event page](https://gwosc.org/eventapi/html/O3_Discovery_Papers/GW190425/v1/) independently lists the matching low/high-spin chirp-mass offsets for its **PhenomPNRT** results. Those are a different waveform family and are corroboration, not substituted values for the paper's PhenomPv2NRT row.

Primary sources:

- [Abbott et al. (2020), ApJL 892:L3, DOI 10.3847/2041-8213/ab75f5, journal PDF](https://dcc.ligo.org/public/0161/P190425/010/Abbott_2020_ApJL_892_L3.pdf), Table 1, p. 9.
- [DCC public discovery PDF](https://dcc.ligo.org/public/0161/P190425/007/gw190425-discovery.pdf), Table 1.
- [Author-hosted preprint copy](https://jcao.org/pub/doc/jcao_j_gw190425.pdf), Table 1.
- [GWOSC GW190425 event page](https://gwosc.org/eventapi/html/O3_Discovery_Papers/GW190425/v1/), with waveform-family-specific parameter-estimation summaries.

## 2. Corrected published-summary arithmetic

Bounds below are formed from the reported median and its asymmetric offsets. They are not a new posterior estimate.

| PhenomPv2NRT prior | Median (M☉) | Lower offset | Upper offset | Interval (M☉) | Width (M☉) |
|---|---:|---:|---:|---:|---:|
| Low spin | 1.4868 | 0.0003 | 0.0003 | [1.4865, 1.4871] | 0.0006 |
| High spin | 1.4873 | 0.0006 | 0.0008 | [1.4867, 1.4881] | 0.0014 |

- Median shift: 0.0005 M☉, or 0.0336% of the mean median.
- High-spin to low-spin interval-width ratio: 2.3333.
- High-spin upper/lower offset ratio: 1.3333; low-spin ratio: 1.0.

The median is stable across these two prior choices, but the high-spin credible interval is wider and asymmetric toward higher detector-frame chirp mass. “Stable median” must not be paraphrased as “identical precision.” The source-frame chirp mass, detector-frame chirp mass, and source-frame component-mass ranges remain distinct quantities. The primary-mass interval is 0–90%; the secondary-mass and mass-ratio intervals are 10–100%, so their width comparisons remain descriptive rather than central 90% widths.

Other published-summary comparisons in the original report are unchanged: primary-mass width ratio 3.37, secondary-mass width ratio 2.43, mass-ratio width ratio 3.00, and combined dimensionless tidal-deformability upper-limit ratio 1.83.

## 3. Reproducible script correction

The script at WORKSPACES/ENHEDUANNA/CODE/gw190425_prior_sensitivity.py now keys the comparison explicitly to the PhenomPv2NRT Table 1 source, corrects the high-spin offsets to plus=0.0008 and minus=0.0006, calculates both interval bounds and widths, and asserts the source-derived bounds. The script was run under Python 3.13.5; all assertions passed.

This is arithmetic on published posterior summaries only. It did not load raw strain or posterior samples and did not perform parameter estimation, a new fit, or a physical model calculation.

## 4. Measurement provenance and limits

GW190425 occurred on 2019-04-25 at 08:18:05 UTC (GPS 1240215503.0). The GWOSC event release identifies the L1 and V1 frame channels and the event data DOI 10.7935/ggb8-1v94. The LIGO event description calls it a single-observatory detection: Livingston recorded the high-confidence signal; Virgo data were used for parameter estimation but were below the detection threshold; Hanford was offline. The DCC P2000026-v2 release lists a 661.1 MB HDF5 containing posterior/prior samples, L1/V1 power spectral densities, calibration-uncertainty envelopes, and analysis configuration. Strain data are available from GWOSC.

The 661.1 MB HDF5 and raw strain were not downloaded in this pass. No calibration series, PSD, posterior sample, or time-series covariance was loaded. Therefore no new likelihood, fit, residual, independent measurement, or H(s)H prediction is claimed.

## 5. Measurement-to-prediction architecture

The useful correction is not only the reversed offset. Posterior summaries must be keyed by the full analysis provenance tuple:

(event, source document/table, waveform family, spin prior, parameter frame, quantile convention, data-release version, calibration/PSD version).

The GWOSC page contains separate PhenomDNRT, PhenomPNRT, and TaylorF2 results. Those records must not be merged into one generic “GW190425 posterior.” The prior report used a Table 1 label while its chirp-mass asymmetry did not preserve the Table 1 orientation. The revised script makes the waveform family and source table explicit.

For a future discriminating test:

| Hypothesis | Shared parameters and calibration | Predicted/held-out observable | Standard comparator | Proposed falsification rule |
|---|---|---|---|---|
| GR baseline, PhenomPv2NRT | Same L1/V1 strain, PSD, calibration uncertainty, transient treatment, frequency mask, and source-parameter conventions | Complex strain/phase residual on a pre-registered contiguous frequency block | The published GR waveform family and its documented cross-checks | Baseline adequacy must be checked before attributing a residual to H(s)H |
| H(s)H minimal pair | Identical detector nuisance model and data; no extra unconstrained response kernel | A derived waveform that reduces to the GR baseline if the proposed geometric map has no observable correction | Same GR baseline | If it is observationally identical to GR, it is a representation, not a discriminating prediction |
| H(s)H finite-core response | Same shared nuisance parameters; only geometry-derived parameters with frozen priors | A pre-registered phase/amplitude correction derived from a specified geometry-to-waveform map | Same GR baseline | Reject this instantiated H(s)H model if its held-out statistic falls outside a 99% posterior-predictive envelope while GR remains inside; if both fail, the event is inconclusive |
| H(s)H history/memory extension | Add only after reduced-state closure fails on calibration data; no free post-hoc kernel | A pre-registered history-dependent residual | Minimal H(s)H and GR | Reject if the extension does not improve held-out prediction under its frozen complexity penalty, or requires post-hoc retuning |
| Responsive-medium extension | Add only if a medium state is independently identified, not inferred from detector calibration | A distinct observable tied to that independently measured state | Minimal H(s)H and GR | Do not admit the primitive if it is unidentifiable or only absorbs residuals |

The 99% predictive envelope is a proposed decision rule, not a computed threshold. Its numerical boundary requires the actual PSD, calibration covariance, posterior samples, and a frozen frequency mask. A frequency-block holdout within GW190425 would be internal predictive validation, not an independent event replication; external validation requires another event or independent acquisition.

The standard GR model already includes tidal response. No result here forces an additional H(s)H worldtube thickness, twist, contact surface, or responsive-medium degree of freedom. Such structures remain optional until an explicit source-derived map produces a distinguishable observable beyond the standard baseline. Tidal deformability is not identified with worldtube thickness, and detector calibration is not identified with an H(s)H medium.

The proposed geometry-to-waveform test contract is assistant-authored, not a Nathan Direct equation or an established H(s)H prediction. No direct Nathan-authored GW190425 mapping surfaced in the bounded source set reviewed; this is not a proof of archive-wide absence. Existing [HsH PR #1508](https://github.com/Satobloc/HsH/pull/1508) contains conditional branch-scoped map-composition work; its successful [Actions run #42547294085](https://github.com/Satobloc/HsH/actions/runs/42547294085) is a merge-reference build, not a proof of the GW190425 physical mapping. No new Lean theorem or Lean run is claimed: this runtime has no local Lean/Lake/Elan and no authorized Actions-dispatch writer.

## 6. Project disposition

GW190425 remains an additional P2 candidate only. P2 remains HOLD. No raw-data gate passed, no system was selected, no physical prediction or independent validation occurred, and no paper gate advanced. No SAT-O or Blockwave equation changed. No BEDROCK theory status was promoted.
