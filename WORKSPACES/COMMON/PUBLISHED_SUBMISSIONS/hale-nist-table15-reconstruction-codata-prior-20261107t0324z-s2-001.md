# NIST Table 15 reconstruction and CODATA prior-dependence audit

**Disposition:** source-based numerical reconstruction and covariance diagnostic; **candidate only**; no P2 system selection; no H(s)H prediction; no theory promotion.

**Additive scope:** This is a new calculation supplement to the acquisition-level source/identifiability record in issue #1435 and the four-summary contrast record in issue #1432. It does not replace either artifact or repeat their source-to-nuisance argument.

## 1. Measured system, source, and provenance

Primary source: S. Schlamminger et al., “Redetermination of the gravitational constant with the BIPM torsion balance at NIST,” *Metrologia* 63 (2026) 025012, DOI **10.1088/1681-7575/ae570f**.

The paper reports torque-difference measurements collected **24 January–22 June 2024** using electrostatic-servo and free-deflection readouts. Table 15 contains eight published torque differences: three copper source-mass azimuths (0°, 120°, 240°) and one sapphire configuration, each measured with both readouts. The displayed Table 15 uncertainties are Type A only, not the combined uncertainty.

Table 2 supplies masses averaged over the four masses in each set:
- test mass \(m_t=1150.156\,\mathrm{g}\);
- copper source mass \(m_s=11191.68\,\mathrm{g}\);
- sapphire source mass \(m_s=5015.60\,\mathrm{g}\).

The source masses are **apparent masses corrected for air buoyancy**. Table 15 supplies configuration-specific \(R_s\) and dimensionless \(\Gamma_{\max}\). The calculation uses these rounded published inputs. No raw torque/angle time series, acquisition-block metadata, CMM point cloud, or full eight-observation covariance was retrieved.

## 2. Forward measurement equation and table-level reconstruction

The paper's standard geometry-to-torque relation is

\[
N(\Delta\phi)=G\,\frac{8m_sm_t}{R_s}\,\Gamma(\Delta\phi,\eta).
\]

For the peak-to-peak torque difference,

\[
\Delta N=G\,\frac{16\,\Gamma_{\max}m_sm_t}{R_s},
\qquad
G=\frac{\Delta N\,R_s}{16\,\Gamma_{\max}m_sm_t}.
\]

This is the source's ordinary three-dimensional mass-geometry → mass-integration factor → torque map. It is not an H(s)H worldtube map.

I converted \(\Delta N\) from nN·m to N·m, \(R_s\) from mm to m, and both masses from g to kg. The displayed \(u_A\) propagates **only the Table 15 torque Type-A uncertainty**, holding the rounded masses, \(R_s\), and \(\Gamma_{\max}\) fixed:

\[
u_A(G)_{\Delta N\;\mathrm{only}}=G\,\frac{u_A(\Delta N)}{\Delta N}.
\]

| Configuration | Readout | Reconstructed preliminary \(G\;(10^{-11}\,\mathrm{m^3\,kg^{-1}\,s^{-2}})\) | Torque-only \(u_A(G)\;(10^{-11})\) |
|---|---|---:|---:|
| Sapphire | Free | 6.673643 | 0.000095 |
| Sapphire | Servo | 6.672640 | 0.000143 |
| Copper 0° | Free | 6.673946 | 0.000064 |
| Copper 0° | Servo | 6.673582 | 0.000086 |
| Copper 120° | Free | 6.673897 | 0.000064 |
| Copper 120° | Servo | 6.673598 | 0.000128 |
| Copper 240° | Free | 6.674254 | 0.000043 |
| Copper 240° | Servo | 6.673826 | 0.000064 |

These are **reconstructed preliminary values from rounded published inputs**, not new measurements and not the paper's final configuration estimates. The uncertainty column is not a combined uncertainty and must not be compared directly with CODATA uncertainty.

The raw Table 15 central torque differences (free minus servo) are 1.7, 1.4, and 2.0 pN·m for copper at 0°, 120°, and 240°, and 2.1 pN·m for sapphire. The paper reports combined run-level differences of \(1.8\pm0.3\) pN·m for copper and \(2.1\pm0.3\) pN·m for sapphire. The published marginal Type-A entries do not specify the covariance of each paired readout, so I do not assign pairwise error bars.

Reproduction code for the eight preliminary values (inputs copied from Tables 2 and 15):

```python
def preliminary_G(dN_nNm, u_dN_nNm, Rs_mm, Gamma, ms_g, mt_g):
    G = (dN_nNm * 1e-9) * (Rs_mm * 1e-3) / (
        16 * Gamma * (ms_g * 1e-3) * (mt_g * 1e-3)
    )
    uA = G * u_dN_nNm / dN_nNm  # torque Type A only
    return G / 1e-11, uA / 1e-11

mt_g = 1150.156
records = [
    ("Sapphire", "free", 13.9799, 0.0002, 213.9680, 0.485613, 5015.60),
    ("Sapphire", "servo", 13.9778, 0.0003, 213.9680, 0.485613, 5015.60),
    ("Copper 0 deg", "free", 31.1979, 0.0003, 213.9642, 0.485637, 11191.68),
    ("Copper 0 deg", "servo", 31.1962, 0.0004, 213.9642, 0.485637, 11191.68),
    ("Copper 120 deg", "free", 31.1842, 0.0003, 213.9817, 0.485467, 11191.68),
    ("Copper 120 deg", "servo", 31.1828, 0.0006, 213.9817, 0.485467, 11191.68),
    ("Copper 240 deg", "free", 31.1856, 0.0002, 213.9822, 0.485464, 11191.68),
    ("Copper 240 deg", "servo", 31.1836, 0.0003, 213.9822, 0.485464, 11191.68),
]
for row in records:
    print(row[0], row[1], preliminary_G(*row[2:], mt_g))
```

## 3. Full four-summary covariance: a no-dark-effect null diagnostic

The paper's Table 16 reports four final configuration estimates (not eight independent raw measurements):

| Configuration | \(G\;(10^{-11}\,\mathrm{m^3\,kg^{-1}\,s^{-2}})\) | Relative standard uncertainty, ppm |
|---|---:|---:|
| Copper servo | 6.673642 | 23.2 |
| Copper free | 6.674021 | 30.3 |
| Sapphire servo | 6.672637 | 37.5 |
| Sapphire free | 6.673636 | 93.9 |

Table 18 gives the corresponding correlation matrix, in the order above:

\[
R=\begin{pmatrix}
1&0.42&0.38&0.12\\
0.42&1&0.23&0.23\\
0.38&0.23&1&0.25\\
0.12&0.23&0.25&1
\end{pmatrix}.
\]

Using \(V_{ij}=u_i u_jR_{ij}\), with \(u_i=G_i u_{r,i}\times10^{-6}\), I performed a generalized least-squares fit to the deliberately restrictive null model \(G_j=\mu\): one common mean and no configuration-specific dark effect.

**Result:** \(\hat\mu=6.673611\times10^{-11}\), standard uncertainty \(0.000142\times10^{-11}\), \(\chi^2=25.04\) for 3 degrees of freedom, \(p=1.52\times10^{-5}\).

This is a **fit diagnostic**, not a prediction. Under the published measurement covariance, a single common mean without additional configuration effects is inadequate. It supports retaining the paper's configuration-specific dark-uncertainty treatment; it does not identify the physical cause and is not evidence for H(s)H.

The paper identifies shared uncertainty contributions from mass integration and autocollimator non-linearity, making all six off-diagonal correlations positive. Its combined uncertainty budget uses 23 input quantities grouped into 14 categories. Do not replace that structure with independent-cell error bars.

Reproduction code for the common-mean diagnostic:

```python
import numpy as np
from scipy.stats import chi2

G = np.array([6.673642, 6.674021, 6.672637, 6.673636])
ur_ppm = np.array([23.2, 30.3, 37.5, 93.9])
R = np.array([
    [1.00, 0.42, 0.38, 0.12],
    [0.42, 1.00, 0.23, 0.23],
    [0.38, 0.23, 1.00, 0.25],
    [0.12, 0.23, 0.25, 1.00],
])
u = G * ur_ppm * 1e-6
V = np.outer(u, u) * R
Vi = np.linalg.inv(V)
one = np.ones(4)
mu = (one @ Vi @ G) / (one @ Vi @ one)
u_mu = np.sqrt(1 / (one @ Vi @ one))
residual = G - mu
chi2_value = residual @ Vi @ residual
p_value = chi2.sf(chi2_value, 3)
```

## 4. CODATA version and adjustment history, before comparison

As of this audit, the NIST constants database still identifies the **2022 CODATA values** as the latest published recommended set. NIST's current notice says the next, 2026 adjustment admits data discussed in a publication or preprint before **31 December 2026**. The 2024 NIST acquisition post-dates the 2022 adjustment and is temporally eligible for consideration in the 2026 evaluation; inclusion is not assumed.

The 2022 CODATA paper (Mohr, Tiesinga, Newell and Taylor, *Reviews of Modern Physics* 97 (2025) 025002, DOI **10.1103/RevModPhys.97.025002**) treats \(G\) separately because it is independent of the other adjusted constants. Its recommended value is the weighted mean of **16** published \(G\) determinations, with three reported pair correlations:
- NIST-82 / LANL-97: 0.351;
- HUST-05 / HUST-09: 0.134;
- HUST-09 / HUST\(_T\)-18: 0.068.

The input uncertainties were multiplied by an **expansion factor of 3.9** to reduce the substantial inconsistencies among the measurements. The adjusted weighted mean has \(\chi^2=12.9\), 15 degrees of freedom, \(p=0.61\), and Birge ratio 0.93. The CODATA authors state that no new \(G\) values had entered since the 31 December 2018 closing date, so the 2022 recommended value is identical to the 2018 value:

\[
G_{\mathrm{CODATA\;2022}}=6.67430(15)\times10^{-11}\;\mathrm{m^3\,kg^{-1}\,s^{-2}},
\qquad u_r=2.2\times10^{-5}.
\]

The CODATA input table includes BIPM-14, \(6.67554(16)\times10^{-11}\). The NIST paper says that balance was shipped to NIST in 2016. It characterizes the new work as an independent replication using the original hardware but mostly new personnel, environment, and analysis pipeline, while noting it is not entirely independent because C. C. Speake contributed to both. This is a cross-campaign replication, not an independent-hardware replication; no cross-study covariance is supplied.

## 5. The NIST 2026 consensus is CODATA-prior-conditioned

The NIST paper's four Table 16 configuration determinations are derived from the 2024 measurements and calibrated inputs. Its **final combined consensus** is a separate Bayesian hierarchical layer:

\[
G_j=\mu+\lambda_j+\epsilon_j,
\]

where \(\lambda_j\) represents configuration-specific effects with covariance built from the reported configuration correlations and dark-uncertainty scales. The prior for \(\mu\) is Gaussian, centered on the CODATA recommended value \(6.6743\times10^{-11}\), with standard deviation \(9\times10^{-15}\,\mathrm{m^3\,kg^{-1}\,s^{-2}}\). The four dark-uncertainty scales use half-Cauchy priors whose medians are ranked 1:2:3:4 by configuration reliability, from copper-free through sapphire-servo.

The paper's final result is

\[
G_{\mathrm{NIST\;2026}}=(6.67387\pm0.00038)\times10^{-11},
\qquad u_r=5.7\times10^{-5}.
\]

The paper reports a relative difference from CODATA of \(-6.4\times10^{-5}\) and \(p=0.29\). A simple independent-Gaussian arithmetic check gives a difference of \(-4.3\times10^{-15}\), combined standard uncertainty \(4.085\times10^{-15}\), and \(z=-1.05\), consistent with that reported \(p\)-value.

**Independence qualification:** the 2024 torque measurements are new post-2022 observations, but the published final NIST consensus is conditioned on a prior centered on CODATA 2022. Therefore the final posterior comparison is not an independent CODATA holdout. The raw Table 15 reconstruction above is prior-free at the table-calculation stage; it is not a complete independent determination because it omits the full calibration uncertainty and covariance. A prior-sensitivity or prior-free hierarchical reanalysis would be needed to quantify how much the CODATA-centered prior affects the final consensus. No posterior samples or full raw acquisition package were retrieved here.

## 6. H(s)H map status and falsification boundary

The standard source supplies a forward chain:

\[
\text{measured 3D mass geometry}
\rightarrow \Gamma(\Delta\phi,\eta)
\rightarrow \text{gravitational torque}
\rightarrow \text{servo/free readout}
\rightarrow \text{calibrated }G_j\text{ and covariance}.
\]

The missing H(s)H chain is still explicit and unresolved:

\[
\text{worldtube/timesheet/responsive-medium state}
\rightarrow \text{defined slice/support projection}
\rightarrow \text{mass geometry}
\rightarrow \Gamma
\rightarrow \text{torque}
\rightarrow \text{readout and covariance}.
\]

No source-grounded H(s)H projection, composition map, responsive-medium law, or independent observable prediction has been established. No rope-mechanics equivalence is asserted. The NIST system remains a **methodological candidate only**, not the P2 November 30 selected system. Code Grurple remains the active P0 interlock; no paper gate is advanced.

## 7. Reproducibility and epistemic labels

- **Measured:** the paper's eight Table 15 torque differences and their stated Type-A uncertainties.
- **Calibrated:** apparent masses, dimensional metrology, \(R_s\), mass-integration factors, readout calibrations and the paper's covariance/uncertainty budget.
- **Derived here:** eight preliminary \(G\) values from rounded Table 15/Table 2 inputs; the no-dark-effect GLS common-mean diagnostic from Tables 16 and 18.
- **Fit:** the one-common-mean GLS null. Its poor fit is not an H(s)H test.
- **Posterior:** the paper's final \(6.67387(38)\times10^{-11}\) consensus, conditional on its hierarchical model and CODATA-centered prior.
- **Predicted:** none. No H(s)H prediction or held-out result was produced.
- **Independent measurement:** none by this audit.

No new Lean module, PR, branch, Mersearch request, tool, dependency, paid service, paper manuscript, or theory integration was created. Existing PR #1387's first-harmonic algebra is a conditional formalization only: run #42317706397 succeeded on merge reference 31406fdfe8ba1c32ca4bd08449df3658b60de0f1, not an exact-head standalone build. It does not validate the source translation or physical premises.

### Public primary sources

1. Schlamminger et al., *Metrologia* 63 (2026) 025012, DOI 10.1088/1681-7575/ae570f.
2. Mohr, Tiesinga, Newell and Taylor, *Reviews of Modern Physics* 97 (2025) 025002, DOI 10.1103/RevModPhys.97.025002.
3. NIST, *Fundamental Physical Constants*, 2022 CODATA database (version 9.0; current published set at the time of this audit).

**Epistemic status:** assistant-authored source-based calculation and model audit; not Nathan Direct, not a historical Hale statement, not an independent measurement, and not a theory result.
