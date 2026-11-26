# Enheduanna h1119:s2 — 2026 NIST/BIPM torsion-balance and CODATA source audit

**Date:** 2026-11-26  
**Status:** source-audited measured-system candidate; not selected as the P2 system  
**Worker label:** Enheduanna, deterministic ring selection only; historical identity/thread not authenticated  
**Scope:** Lane 24, H(s)H generation / worldtube characterization / CODATA provenance

## Executive disposition

A useful new rotational-metrology candidate is the 2026 NIST replication of the BIPM torsion-balance measurement of Newton's gravitational constant. It supplies a real, dimensioned apparatus, a published geometry-to-torque equation, two distinct instrument readout modes, four configuration-level estimates, a full four-result correlation matrix, and an explicit treatment of unexplained configuration effects.

This is **not** an H(s)H validation, not a finite-core worldtube experiment, and not a material-rope analogue. It is a candidate source for a future measured-system comparison because the apparatus geometry and measurement chain are unusually explicit. P2 remains HOLD; no final system is selected.

## Primary source and a material metadata conflict

Primary paper: Stephan Schlamminger et al., “Redetermination of the gravitational constant with the BIPM torsion balance at NIST,” *Metrologia* 63 (2026), 025012, DOI [10.1088/1681-7575/ae570f](https://doi.org/10.1088/1681-7575/ae570f). Published 16 April 2026. Open-access final PDF: [NIST publication PDF, pub_id=961075](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075).

The final PDF abstract and Eq. (64), the DOI landing page, and NIST's 16 April 2026 news release agree on:

- \(G=(6.67387\pm0.00038)\times10^{-11}\;\mathrm{m^3\,kg^{-1}\,s^{-2}}\)
- relative standard uncertainty \(5.7\times10^{-5}\).

The NIST publication-record HTML page also lists eight authors, whereas the final PDF and DOI metadata list Antonio Possolo as an additional author. Its abstract currently reports a conflicting \(6.67366\pm0.00020\times10^{-11}\) and relative uncertainty \(3.0\times10^{-6}\). That is not a rounding difference. The discrepancy is unresolved at the metadata layer; this audit uses the peer-reviewed final PDF / DOI text and NIST news release, not the conflicting HTML abstract. Do not silently copy the HTML summary into a numerical dataset.

## Actual apparatus and forward measurement map

The paper describes four cylindrical test masses on an aluminium torsion disk, spaced by 90 degrees on a mounting circle of radius \(R_t\). The disk is suspended by a copper-beryllium torsion strip. Four source masses are mounted outside the vacuum enclosure on a motor-driven carousel, also spaced by 90 degrees on a mounting circle of radius \(R_s\). The apparatus includes an electrostatic shield, electrodes, autocollimator readout, and a vacuum can.

The source and test assemblies interact according to the paper's Eq. (1):

\[
N(\Delta\phi)=G\,\frac{8m_s m_t}{R_s}\,\Gamma(\Delta\phi),
\]

where \(\Delta\phi=\phi_s-\phi_t\), and \(\Gamma\) is the mass-integration factor for the measured source/test mass geometry. The source assembly is moved between torque extrema separated by 37.67 degrees. The inferred constant follows from the measured torque difference and calculated geometry factor:

\[
G=\frac{\Delta N_{\max}R_s}
{8m_s m_t(\Gamma_{\max}-\Gamma_{\min})}
\approx
\frac{\Delta N_{\max}R_s}{16m_s m_t\Gamma_{\max}}.
\]

The paper reports \(\Gamma_{\max}\approx0.485\) for this geometry. The mass integration uses measured dimensions, masses, mounting-circle radii, cutouts, interfaces and disk components; the paper compares numerical geometry models and documents sensitivity to metrology choices. This is a genuine geometry-to-equation-to-observable chain in standard Newtonian metrology.

Two readout modes are used:

1. **Free deflection:** the source masses move between positions, the torsion pendulum responds, and angular motion is measured with an autocollimator.
2. **Electrostatic servo:** electrode voltages apply a counter-torque so the pendulum is held near its reference position; voltage and capacitance-gradient calibration supply the torque readout.

The paper's data were collected from 24 January through 22 June 2024. Copper source masses were measured in three azimuthal orientations to average a possible radial density gradient; sapphire source masses were measured in one orientation. The apparatus was kept under vacuum.

The inspected official paper and publication pages expose the derived configuration estimates, uncertainty budget and correlations. I did not locate a separate raw time-series archive in this source pass; the four values below are published derived estimates, not raw samples. This is a bounded retrieval statement, not proof that no separate dataset exists elsewhere.

## Published estimates, uncertainties and correlations

The paper's Table 16 reports four individual determinations. Table 17 gives the uncertainty budget and Table 18 the correlation coefficients. Values below preserve the published central values and use the more precise combined relative standard uncertainties from Tables 17–18.

| Configuration | \(G_i\;(10^{-11}\,\mathrm{m^3\,kg^{-1}\,s^{-2}})\) | Relative standard uncertainty (ppm) |
|---|---:|---:|
| Copper, servo | 6.673642 | 23.2 |
| Copper, free | 6.674021 | 30.3 |
| Sapphire, servo | 6.672637 | 37.5 |
| Sapphire, free | 6.673636 | 93.9 |

Off-diagonal correlations in the order (Cu-servo, Cu-free, sapphire-servo, sapphire-free):

- \(r_{12}=0.42\)
- \(r_{13}=0.38\)
- \(r_{14}=0.12\)
- \(r_{23}=0.23\)
- \(r_{24}=0.23\)
- \(r_{34}=0.25\).

The dominant common uncertainty contribution is mass integration (16.2 ppm in each configuration). Autocollimator non-linearity contributes 10.7, 14.2, 9.3 and 85.7 ppm respectively. Other named contributions include Type-A repeatability, capacitance/voltage measurement in servo mode, zero torque, pressure correction, mounting-circle radii, mass, disk moment of inertia, anelasticity and period measurement.

The authors find servo-mode values below the corresponding free-deflection values in both material campaigns. They do not identify a conclusive cause. A possible thermal torque associated with servo currents was investigated, but no significant time-dependent effect was observed. The paper introduces configuration-specific “dark uncertainty” in a Bayesian hierarchical combination rather than pretending the unexplained offset has been physically resolved.

## Reproducible covariance-aware descriptive calculation

I computed within-study mode contrasts from the four Table 16 estimates and Table 18 correlation matrix. This is a summary-table calculation, not a reanalysis of raw time series and not an H(s)H prediction.

For a contrast vector \(a\), with covariance \(C_{ij}=G_iG_j u_i u_j r_{ij}\) and relative standard uncertainties \(u_i\), the first-order contrast variance is \(u^2(a^TG)=a^T C a\).

Using the published covariance:

- Copper free minus copper servo: **+56.79 ± 29.43 ppm**, normal-approximation \(z=1.93\).
- Sapphire free minus sapphire servo: **+149.70 ± 92.00 ppm**, normal-approximation \(z=1.63\).
- Difference between those two mode gaps: **+92.90 ± 91.68 ppm**, normal-approximation \(z=1.01\).

The correlation matrix is positive definite (eigenvalues approximately 0.500, 0.766, 0.902, 1.832). These contrasts preserve the reported covariance; treating the four estimates as independent would be wrong. The normal \(z\) summaries are descriptive approximations only. The paper's configuration-specific dark-uncertainty posterior is a separate model and is not included in these contrasts.

Reproduction:

~~~python
import numpy as np

G = np.array([6.673642, 6.674021, 6.672637, 6.673636])
u = np.array([23.2, 30.3, 37.5, 93.9])  # relative standard uncertainty, ppm
R = np.array([
    [1.00, 0.42, 0.38, 0.12],
    [0.42, 1.00, 0.23, 0.23],
    [0.38, 0.23, 1.00, 0.25],
    [0.12, 0.23, 0.25, 1.00],
])
C = np.outer(u, u) * R  # relative covariance, ppm^2

def contrast(a):
    a = np.asarray(a, dtype=float)
    scale = np.mean(G[np.flatnonzero(a)])
    delta = a @ G
    var_G = a @ (np.outer(G, G) * C * 1e-12) @ a
    return delta / scale * 1e6, np.sqrt(var_G) / scale * 1e6

for name, a in {
    "Cu free - Cu servo": [-1, 1, 0, 0],
    "Sapphire free - sapphire servo": [0, 0, -1, 1],
    "(Cu gap) - (sapphire gap)": [1, -1, -1, 1],
}.items():
    d, s = contrast(a)
    print(name, d, s, d / s)
~~~

## CODATA source, version, evaluation and independence limits

The latest NIST constants database version available on 26 November 2026 is Web Version 9.0, updated 9 May 2024 to the **2022 CODATA recommended values**. The 2022 CODATA value is:

\[
G_{2022}=6.67430(15)\times10^{-11}\;\mathrm{m^3\,kg^{-1}\,s^{-2}},
\qquad u_r=2.2\times10^{-5}.
\]

The 2022 adjustment did not use new G data relative to the 2018 closing date. It used 16 published measurements, three nonzero input correlations, and a separate least-squares weighted-mean adjustment because G is independent of the other adjusted constants. The same 3.9 uncertainty-expansion factor was retained to reduce normalized residuals to 2 or less; the reported adjustment has \(\chi^2=12.9\) for 15 degrees of freedom, \(p=0.61\), and Birge ratio 0.93. BIPM-14 and JILA-18 were the largest pre-expansion residuals. Thus the 2022 recommended value is an evaluated, uncertainty-expanded synthesis, not a single 2022 experiment.

CODATA's official page states that the next regular 2026 adjustment closes on **31 December 2026**, with results expected early 2027. The NIST paper was published 16 April 2026 and is therefore eligible for consideration, but its acceptance into the 2026 adjustment is not established.

Two independence cautions prevent a naive numerical comparison here:

1. The NIST paper's final Bayesian consensus model uses a Gaussian prior for its consensus \(\mu\) centered on the 2022 CODATA value, plus configuration-specific half-Cauchy priors for dark uncertainty. Its final consensus estimate is therefore not an independent prior-free comparator to CODATA 2022.
2. CODATA 2022 includes BIPM-14, and the 2026 NIST experiment uses the same BIPM apparatus lineage; the paper also states that Clive Speake contributed to both efforts. No cross-covariance between the 2026 NIST result and the CODATA-2022 evaluated value was identified in the inspected sources.

Accordingly, **no uncertainty-normalized NIST-versus-CODATA comparison is performed in this audit**. The next valid comparison requires the 2026 CODATA input list and covariance treatment, or an explicit defensible cross-covariance model. The 2026 CODATA task group has a scheduled G session; this does not guarantee acceptance of the NIST result.

## H(s)H map status and P2 disposition

The standard-physics chain is explicit:

\[
\text{measured mass geometry}
\rightarrow \Gamma(\Delta\phi)
\rightarrow \Delta N
\rightarrow \text{free/servo readout}
\rightarrow G_i.
\]

The missing H(s)H link is a source-defined map from a worldtube/timesheet/responsive-medium construction to this actual apparatus geometry and its torque/readout law. The torsion strip is a material component of the instrument; it is not automatically an H(s)H filament, responsive medium, or WWRD climbing rope. The source does not establish such an equivalence.

A future H(s)H test would need a source-faithful geometric plot of the actual apparatus, explicit forward geometry-to-equation and reverse equation-to-geometry maps, a declared readout map, and a preregistered observable prediction that distinguishes the H(s)H model from standard Newtonian/instrument models. The unexplained servo/free offset is a possible discriminator only if an H(s)H mechanism predicts it independently before seeing these results. Post-hoc assignment is not admissible.

**Disposition:** new rotational-torque metrology candidate added to P2 screening; not selected as the final P2 system. Existing finite-core vortex, contact, propeller, inspiral and rope candidates retain their separate system identities. No universal rope claim, no H(s)H physical prediction, no fit, no CODATA comparison, no theory promotion, no manuscript-gate advancement, and no SAT-O/Blockwave equation modification.

## Formalization cross-check (existing modules only)

No new theorem or PR was created. Three existing exact-head Lean 4.34.0 / Lake 5.0.0 builds were rechecked:

- Enheduanna PR #2293, head 00cc2535be7bd863df594e0cbbfb8c6923515453: build success, 8,948 jobs. Its EnheduannaObservedSliceIdentifiability module proves conditional source-lineage, observation-pipeline composition and identifiability statements. The newly added map-binding/lineage declarations print without theorem-specific axioms. The module explicitly instantiates no physical geometry, detector, dataset, fit or H(s)H prediction.
- Nadir PR #1189, head 3f344a3f120a9ed63c1836549e3bcb696589eaea: build success, 8,963 jobs. Relevant rotating-fluid/PIV and observation-factorization results compile; several declarations use standard propext, Classical.choice or Quot.sound.
- Ravel PR #1133, head 95f508ed2625b169f36803479b9c1484b3e93374: build success, 8,959 jobs. Directed slice-chain composition/retraction declarations compile without theorem-specific axioms; other quotient/projection results have standard propext, Quot.sound or Classical.choice dependencies.

Retrieved logs contained no sorryAx, bare admit, or compiler errors. Separate global axiom audit, tests, lint, leanchecker and nanoda were not run. These builds establish only the formalized conditional mathematics, not the physical premises, source-to-formal translation or empirical truth.

## Source and authority ledger

- Primary NIST paper/PDF: [DOI 10.1088/1681-7575/ae570f](https://doi.org/10.1088/1681-7575/ae570f); [final NIST PDF](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075).
- NIST news release, 16 April 2026: [NIST Weighs In on the Mystery of the Gravitational Constant](https://www.nist.gov/news-events/news/2026/04/nist-weighs-mystery-gravitational-constant).
- Conflicting NIST publication-record abstract: [publication page](https://www.nist.gov/publications/redetermination-gravitational-constant-bipm-torsion-balance-nist).
- CODATA 2022 adjustment paper: [Tiesinga et al., JPCRD 54, 033105 (2025), PDF](https://physics.nist.gov/cuu/pdf/JPCRD2022CODATA.pdf).
- NIST CODATA version history: [Web Version 9.0, 9 May 2024](https://pml.nist.gov/cuu/Reference/versioncon.shtml).
- CODATA 2026 adjustment schedule: [Fundamental Physical Constants / TGFC](https://codata.org/initiatives/data-science-and-stewardship/fundamental-physical-constants/).
- HsH P2 register: [issue #565](https://github.com/Satobloc/HsH/issues/565).
- Existing conditional source/map formalization: [PR #2293](https://github.com/Satobloc/HsH/pull/2293); [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189); [Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133).

All source claims above are classified as standard reference / published measurement / assistant calculation / proposal as appropriate. The new NIST measurement is an actual measured result; the H(s)H apparatus map remains a proposal and an open obligation.
