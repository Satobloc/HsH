# Nadir h507:s2 amendment 03 | NICER finite-radius comparator

This additive empirical note supplements Amendment 01's pulsar-rotation and GW170817 inspiral comparators.

## PSR J0030+0451: rotating-star mass/radius inference

The NICER X-ray timing data for the 205.53 Hz millisecond pulsar PSR J0030+0451 provide a real finite-radius comparator. The result is an inference from energy-dependent pulse profiles, not a direct geometric image of the stellar surface.

Two independent 2019 ApJL analyses used relativistic ray tracing and different hot-spot parameterizations:

- Riley et al., ApJL 887 L21, DOI `10.3847/2041-8213/ab481c`: (M=1.34^{+0.15}_{-0.16}M_\odot), (R_{eq}=12.71^{+1.14}_{-1.19}\,\mathrm{km}), reported marginal posterior bounds approximately at the 16th and 84th percentiles.
- Miller et al., ApJL 887 L24, DOI `10.3847/2041-8213/ab50c5`: (M=1.44^{+0.15}_{-0.14}M_\odot), (R_e=13.02^{+1.24}_{-1.06}\,\mathrm{km}) at 68% credibility.

The event data are NICER X-ray spectral-timing observations. The analyses use instrument response matrices (RMF/ARF version 1.02) and relativistic pulse-profile models. The calibration documentation notes greater uncertainty below detector channel 40, including trigger-efficiency modeling and limited Crab counts at low energies.

A 2025 arXiv preprint comparing four inference scenarios reports that hot-spot geometry choices for PSR J0030+0451 can shift inferred EOS stiffness and maximum mass; it finds pulse-profile systematics dominate the resulting EOS uncertainty. This is a model-dependence warning, not a replacement for the peer-reviewed 2019 measurements.

**Epistemic classification:** measured input = NICER photon/event data and calibrated detector response; inferred quantity = mass/radius posterior conditional on pulse-profile and hot-spot models; H(s)H prediction = none. The two 2019 analyses are independent analyses of the same source data, not independent astrophysical events.

This supplies a real rotating-star finite-radius benchmark, but it does not directly measure the core boundary, a worldtube, a timesheet, or a responsive-medium law. No numerical H(s)H comparison or physical fit was performed.

References:
- Riley et al. (2019), `https://doi.org/10.3847/2041-8213/ab481c`.
- Miller et al. (2019), `https://doi.org/10.3847/2041-8213/ab50c5`.
- NICER calibration discussion, NASA NTRS PDF: `https://ntrs.nasa.gov/api/citations/20210010694/downloads/Arzoumanian_PSR%20J0030%2B0451%20Mass_paper.pdf`.
- Biswas & Char (2025 preprint), `https://arxiv.org/abs/2507.12540`.

**Status:** measured finite-radius comparator added; no physical prediction, no CODATA comparison, no theory promotion.
