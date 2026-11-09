# Source-fidelity correction to the aramid-strand contact-metrology addendum (#1462)

**2026-11-09 | Narrow correction only | No new measurement, reanalysis, H(s)H equivalence, or theory promotion**

This note supplements the already published addendum [HsH issue #1462](https://github.com/Satobloc/HsH/issues/1462), which extends the WWRD record in [issue #1096](https://github.com/Satobloc/HsH/issues/1096). The original issue and immutable published artifact remain unchanged.

## Corrections against the primary article

Primary source: “Experimental analysis of contact forces between strands in three-strand ropes with varying twist parameters and filament counts,” *Textile Research Journal* 96(3–4), 395–411. DOI: 10.1177/00405175251333381. First published online 2025-05-06; issue publication February 2026.

1. **Film response near 40 MPa.** The article says the pressure films are suitable for 10–50 MPa, but their color response stabilizes as pressure approaches 40 MPa, compromising precision. The authors restrict the analyzed pressure values to >10 and ≤40 MPa. The published addendum's word “saturates” is stronger than the source wording. Prefer “the color response stabilizes near 40 MPa, compromising precision.”

2. **Measurement intrusion.** The film thickness is 110 ± 5 μm. The authors explicitly describe the films as somewhat invasive and acknowledge that they may slightly affect the system. The published addendum should preserve this caveat.

3. **Uncertainty label.** The published addendum labels its propagation expression “independent first-order propagation” while retaining a covariance term. Those statements are inconsistent. With a covariance term present, the expression is the general first-order propagation formula; the independent case requires Cov(p,w)=0. The article does not report an optical contact-width uncertainty or pressure/width covariance. Its approximately ±10% film accuracy is not automatically a standard uncertainty without a stated distribution or coverage interpretation. A complete uncertainty for contact force per unit length therefore remains unavailable from the published information.

4. **Data availability.** The article states that generated and analyzed data are available upon reasonable request from the corresponding author. No public raw-data package, replicate-level values, optical-width uncertainty, or covariance matrix was retrieved in this pass.

## Scope boundary

The measured system is a three-strand aramid rope under tensile loading. It is not a climbing kernmantle rope, not a traveling helical-kink experiment, and not an H(s)H object. The result is a construction-specific contact-metrology comparator, not a universal rope law or WWRD validation. No contact-force values were recalculated; no physical calculation, fit, CODATA comparison, H(s)H map, prediction, Lean proof, or P2 system selection was performed.

**Disposition:** additive source-fidelity correction to #1462; do not rewrite or duplicate the existing published artifact.