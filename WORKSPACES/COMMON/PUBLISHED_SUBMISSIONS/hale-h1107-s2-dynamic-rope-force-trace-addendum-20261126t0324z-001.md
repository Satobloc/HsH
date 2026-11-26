# Hale h1107:s2 amendment 02 | Public dynamic-rope force trace and identifiability limit

**Parent report:** `hale-h1107-s2-measurement-map-crosswalk-20261126t0324z-001`  
**Parent SHA-256:** `bc79ef7323a8824c24e597a3883b00b6da9c31e775ba50f19a4a85242e4cf99a`  
**Parent amendment 01:** `hale-h1107-s2-rope-contact-measurement-addendum-20261126t0324z-001`  
**Amendment 01 SHA-256:** `ea55915d405b3725e020c3546307713c94c0c5f19f330407984a9debd835c464`  
**Purpose:** add a public raw dynamic-rope force-time series. This amendment does not select a P2 system or assert a rope/H(s)H equivalence.

## 1. Newly identified public raw force-time series

Ken Cline's page, "Analysis of a test fall", republishes a force-time dataset collected by Hal Murray:
- Landing page: `https://www.cs.cmu.edu/~cline/Climbing/fall.html`
- Raw text: `https://www.cs.cmu.edu/~cline/Climbing/f.forces`
- Metadata on the landing page: 5,000 samples at 2,500 samples/s; 2.0 s total; date/time `2/12/89 11-04`; peak reported as 1,450; `10 ft, fall factor 1, old climbing rope, good condition`.
- The landing page identifies the plotted force unit as pounds. The raw file is a 5,000-line sequence of force values.

A nominal unit conversion of the page-reported peak is:
`1450 lbf * 4.4482216152605 N/lbf = 6.449921 kN` (about 6.45 kN).
The sample interval is `1/2500 s = 0.0004 s`. These are conversions of source-reported metadata, not a new peak search, calibrated measurement or uncertainty estimate.

## 2. What is measured and what is reconstructed

The force-time sequence is the direct published data product. The page's red position/extension curve is not a second measured channel: Cline reconstructed it by estimating the dropped mass and initial conditions, then integrating acceleration and velocity. The page explicitly says the initial conditions were not recorded and that alternate initial conditions move the position plot. Therefore the force trace alone does not identify the displacement/extension history without additional mass and initial-state information or an independent displacement measurement.

The page's author qualitatively describes a damped oscillation, accumulating inelastic stretch between bounces, and different behavior during elongation versus contraction. These are observations/interpretations for one old rope and one fall, not universal constitutive laws. The author explicitly cautions against extrapolating top-rope fall curves from this test because of rope inelasticity.

## 3. Provenance and uncertainty limits

No DOI, immutable dataset version, checksum, load-cell calibration certificate, sensor uncertainty, dropped mass, rope length/material/construction, anchor/clamp geometry, environmental conditioning or covariance information was found on the landing page. The raw text file was visible through the web reader, but it was not downloaded into the analysis environment or hashed; direct file retrieval was unavailable in this run. The nominal 1,450 lbf peak is page-reported and has no stated uncertainty. No fitting, impulse integration, displacement reconstruction or independent prediction was performed.

This is a public raw time-series candidate, not an admitted metrology-grade dataset. A defensible reanalysis needs the original test log, force-sensor calibration and uncertainty, dropped mass, rope specimen details, attachment geometry and initial conditions. The displacement curve must not be treated as measured.

## 4. Connection to the existing measurement-map theorem

For this record, let `P` be the observed force-time sequence and `Q` the displacement/extension trajectory. The source itself says the initial conditions are not recorded and alternate initial conditions shift the reconstructed trajectory. Thus `Q` does not factor through `P` alone on the source's admitted information. This is a concrete empirical example of the existing `factorization_iff_fiberwise` criterion: if two admissible hidden states yield the same force trace but different displacement histories, displacement is not identifiable from that trace alone.

The 2026 knotted-sling contact study in amendment 01 has a separate map: force plus high-speed images are observed, while loaded crack width depends on unquantified rig compliance. The two experiments are different regimes and must not be collapsed into one rope law.

Neither dataset establishes a physical H(s)H worldtube, timesheet or responsive-medium equivalence. They are classical rope/contact measurements with different acquisition maps and missing state variables.

## 5. Disposition

The 1989 force trace is a useful source-pinned dynamic-rope candidate, but raw calibration/provenance is incomplete. The 2026 knotted-sling study is a separate contact-mechanics candidate with request-only data and an unresolved printed spring-stiffness unit. No raw dataset is admitted for P2, no physical model is fitted, no prediction is made, and no uncertainty propagation is justified. WWRD remains a first-blush geometric heuristic, not a universal rope statement or H(s)H equivalence. P2 remains HOLD.
