# Hale h1107:s2 amendment 01 | Rope-contact measurement source and dimensional audit

**Parent report:** `hale-h1107-s2-measurement-map-crosswalk-20261126t0324z-001`  
**Parent artifact:** `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-h1107-s2-measurement-map-crosswalk-20261126t0324z-001.md`  
**Parent SHA-256:** `bc79ef7323a8824c24e597a3883b00b6da9c31e775ba50f19a4a85242e4cf99a`  
**Purpose:** add a newly screened measured rope-contact study. This amendment does not select a P2 system, change the WWRD heuristic's epistemic status, or claim a physical H(s)H equivalence.

## 1. Newly identified measured system

Muschalski et al., "Holding forces of two-stranded Figure-8 knotted slings in sandstone cracks: Experiments and analytical modelling", *Proceedings of the Institution of Mechanical Engineers, Part P: Journal of Sports Engineering and Technology*, first published online 2026-07-16, DOI `10.1177/17543371261463813`.

This is a genuine experimental rope-contact study, not merely a climbing anecdote:
- Two-stranded Figure-8 knots made from 8 mm semi-static technical accessory cord.
- Artificial tapered crack rig with variable opening angle and nominal width.
- Servo-hydraulic INSTRON VHS 160/20 pull-out tests at 1, 5 and 10 m/s in the preliminary velocity series.
- Force measurement plus PHOTRON high-speed imaging at 12,800 frames/s.
- Bare steel, aluminium-oxide-coated steel and Elbe sandstone friction linings.
- Three fresh-knot repeats per nominal condition; the systematic geometry/friction series contains approximately 66 tests, with separate preliminary series for velocity, sling length/placement and sandstone solidifier.

For the tested 8 mm cord and this knot/rig, the paper reports that a 7 kN holding-force threshold requires nominal crack width below 12 mm at 5 degrees (1.5 rope diameters), about 13 mm at 10 degrees (1.6D), and about 14 mm at 20 degrees (1.8D). The result is conditional on this cord, knot, crack geometry, lining and loading protocol. It does not establish a universal climbing-rope rule or dynamic-fall equivalence.

## 2. Measurement-map limitations

The article states that the test rig has relevant elastic compliance: splitting forces visibly deform the rig and increase crack width under load. Reported widths are nominal unloaded widths, and the authors say the holding forces are therefore conservatively evaluated. The loaded crack geometry and its uncertainty are not quantified in the retrieved article text. A valid observation map must include rig compliance or measure the loaded width; nominal width alone is not the complete state.

The three repeats are fresh knots, but the article's public data statement is "Data will be made available on reasonable request to the corresponding author." No raw force traces, high-speed frames, per-test IDs or covariance matrix were retrieved. The reported plus/minus quantities and their statistical definition were not established from the accessible text. No uncertainty propagation or independent holdout calculation was performed.

The friction coefficients in Table 2 are calibrated/inversely determined setup parameters: 0.29 (bare steel), 0.38 (sandstone), 0.54 (aluminium oxide). They are not independent universal material constants. The analytical model is calibrated against the same experimental programme and reports a mean deviation of about 0.5 kN. This is an in-sample fit, not an independent prediction.

## 3. Dimensional audit flag: do not numerically use Eq. (2) yet

The publisher HTML prints the source equation as:

`F_H = 2 c (b_K0 - b) * (mu cos(alpha) + sin(alpha)) / (cos(alpha) - mu sin(alpha))`.

The trigonometric/friction factor is dimensionless. With `F_H` in N and `b_K0 - b` in mm, dimensional consistency requires `c` to have units N/mm. However, Table 2 in the accessible publisher HTML prints the calibrated spring stiffness as `c = 1042 N mm` (force times length), not N/mm.

This is an unresolved source-level dimensional inconsistency, not a confirmed error in the final typeset PDF: the PDF was not available for independent inspection and no author clarification was obtained. Do not silently replace N mm with N/mm, and do not evaluate the fitted equation numerically until the unit is resolved. No Lean model of Eq. (2) was added for the same reason; encoding a corrected unit would silently assume a source correction.

## 4. Relevance to WWRD and H(s)H

This is the best source-pinned climbing-protection/contact comparator found in this run, but it is a narrow classical contact-mechanics experiment. It supports only the proposition that a knotted cord's holding force depends jointly on crack angle, nominal width, friction lining, knot/cord state and apparatus compliance. The authors themselves call for further rope materials/diameters and real fall-load conditions.

For the existing measurement-map contract, a candidate latent state must include at least `(crack angle, loaded crack width, cord material/diameter, knot state, surface/friction state, pull-out velocity, rig compliance)`. The observed channels are force-time data and high-speed images; the target is maximum holding force/failure mode. The fitted spring-friction law is a model of this apparatus and test population. It is not an H(s)H worldtube law, not evidence of responsive-medium ontology, and not a universal rope constraint.

The correct next step is to request the per-test data and clarify the spring-stiffness unit, then establish the loaded-geometry and force-measurement uncertainty before any independent prediction. Until then, this remains a measured-study candidate with no admitted raw dataset.

## 5. Source

- Publisher article: https://journals.sagepub.com/doi/10.1177/17543371261463813
- DOI: `10.1177/17543371261463813`
- Article first published: 2026-07-16.
- Accessible article data statement: data available on reasonable request to the corresponding author.

**Disposition:** source identified; raw data NOT ACQUIRED; unit clarification NOT OBTAINED; no physical calculation; no Lean module; no WWRD universality or H(s)H equivalence; P2 remains HOLD.
