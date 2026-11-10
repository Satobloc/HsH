# CODATA 2022 G evaluation | Reproducible weighted-mean source audit

**Disposition:** SOURCE-LOCKED REPRODUCTION / CODATA EVALUATION REPRODUCED TO PUBLISHED PRECISION / NO NEW MEASUREMENT / NO H(s)H PROMOTION.

Additive to [HsH issue #1328](https://github.com/Satobloc/HsH/issues/1328). This does not replace the existing source-custody record or claim an independent determination of G.

## 1. Versioned reference and cut-off

Primary reference: Mohr, Newell, Taylor and Tiesinga, “CODATA recommended values of the fundamental physical constants: 2022,” *Reviews of Modern Physics* 97, 025002 (published 30 April 2025), [official NIST-hosted PDF](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=958143).

NIST identifies the latest posted values as 2022 CODATA, Web Version 9.0, dated 9 May 2024. The NIST page says the next regularly scheduled 2026 adjustment accepts data discussed in a publication or preprint before 31 December 2026. As of 10 November 2026, the 2022 values remain the latest posted set. See the [NIST constants page](https://physics.nist.gov/cuu/Constants/) and [version history](https://physics.nist.gov/cuu/Reference/versioncon.shtml).

The 2022 adjustment's input-data closing date was 31 December 2022. Publication in 2025 is not the measurement-data cut-off.

## 2. The 79/80 count

The joint 2022 least-squares adjustment uses 133 input data and 79 adjusted constants. The Newtonian constant G is treated separately because the report regards it as independent of all other constants; its separate evaluation is a weighted mean of 16 G measurements. Thus 79 refers to the joint adjustment, while 80 includes the separately evaluated G in the total recommended-constant set. This is a scope/counting distinction, not an inconsistent adjustment.

## 3. G measurements and evaluation

Table XXX lists 16 measured G values in units of 10^-11 m^3 kg^-1 s^-2:

| Identification | G | Standard uncertainty | Method |
|---|---:|---:|---|
| NIST-82 | 6.67248 | 0.00043 | Fiber torsion balance, dynamic |
| TR&D-96 | 6.6729 | 0.0005 | Fiber torsion balance, dynamic |
| LANL-97 | 6.67398 | 0.00070 | Fiber torsion balance, dynamic |
| UWash-00 | 6.674255 | 0.000092 | Fiber torsion balance, dynamic compensation |
| BIPM-01 | 6.67559 | 0.00027 | Strip torsion balance, compensation/static deflection |
| UWup-02 | 6.67422 | 0.00098 | Suspended body, displacement |
| MSL-03 | 6.67387 | 0.00027 | Strip torsion balance, compensation |
| HUST-05 | 6.67222 | 0.00087 | Fiber torsion balance, dynamic |
| UZur-06 | 6.67425 | 0.00012 | Stationary body, weight change |
| HUST-09 | 6.67349 | 0.00018 | Fiber torsion balance, dynamic |
| BIPM-14 | 6.67554 | 0.00016 | Strip torsion balance, compensation/static deflection |
| LENS-14 | 6.67191 | 0.00099 | Double atom interferometer, gravity gradiometer |
| UCI-14 | 6.67435 | 0.00013 | Cryogenic torsion balance, dynamic |
| HUSTT-18 | 6.674184 | 0.000078 | Fiber torsion balance, dynamic |
| HUSTA-18 | 6.674484 | 0.000077 | Fiber torsion balance, dynamic compensation |
| JILA-18 | 6.67260 | 0.00025 | Suspended body, displacement |

Three correlated pairs are reported:
- r(NIST-82, LANL-97) = 0.351
- r(HUST-05, HUST-09) = 0.134
- r(HUST-09, HUSTT-18) = 0.068

No new relevant G input datum entered the 2022 adjustment. The same 16 measurements were used in 2018 and 2022. CODATA therefore reused the 3.9 multiplicative uncertainty expansion factor. The report says this brings all normalized residuals to 2 or less; after expansion, chi-squared is 12.9 for 15 degrees of freedom, p = 0.61, and the Birge ratio is 0.93. The 2022 recommended G is consequently unchanged from 2018.

The factor expands input standard uncertainties; it does not change measured central values. For correlated pairs, covariance is scaled consistently so the correlation coefficients remain unchanged.

## 4. Reproduction from Table XXX

The script uses the published central values and parenthetical standard uncertainties, all in units of 10^-11 m^3 kg^-1 s^-2. It constructs the covariance matrix from the three reported correlations and evaluates the generalized least-squares weighted mean.

```python
import numpy as np
from scipy.stats import chi2 as chi2_dist

names = [
    "NIST-82", "TR&D-96", "LANL-97", "UWash-00",
    "BIPM-01", "UWup-02", "MSL-03", "HUST-05",
    "UZur-06", "HUST-09", "BIPM-14", "LENS-14",
    "UCI-14", "HUSTT-18", "HUSTA-18", "JILA-18"
]
G = np.array([
    6.67248, 6.6729, 6.67398, 6.674255,
    6.67559, 6.67422, 6.67387, 6.67222,
    6.67425, 6.67349, 6.67554, 6.67191,
    6.67435, 6.674184, 6.674484, 6.67260
])
u = np.array([
    0.00043, 0.0005, 0.00070, 0.000092,
    0.00027, 0.00098, 0.00027, 0.00087,
    0.00012, 0.00018, 0.00016, 0.00099,
    0.00013, 0.000078, 0.000077, 0.00025
])
R = np.eye(16)
ix = {name: i for i, name in enumerate(names)}
for a, b, rho in [
    ("NIST-82", "LANL-97", 0.351),
    ("HUST-05", "HUST-09", 0.134),
    ("HUST-09", "HUSTT-18", 0.068)
]:
    i, j = ix[a], ix[b]
    R[i, j] = R[j, i] = rho

V = np.outer(u, u) * R
Vi = np.linalg.inv(V)
one = np.ones(16)
Gbar = (one @ Vi @ G) / (one @ Vi @ one)
u0 = np.sqrt(1.0 / (one @ Vi @ one))
residual = G - Gbar
chi2_unexpanded = residual @ Vi @ residual

k = 3.9
u_expanded = k * u0
chi2_expanded = chi2_unexpanded / (k * k)
p = chi2_dist.sf(chi2_expanded, 15)
birge = np.sqrt(chi2_expanded / 15)
z_expanded = residual / (k * u)

print(Gbar, u0, u_expanded, u_expanded/Gbar)
print(chi2_unexpanded, chi2_expanded, p, birge)
print(np.max(np.abs(z_expanded)))
```

### Reproduced output

| Quantity | Reproduction | CODATA report |
|---|---:|---:|
| Weighted mean, in 10^-11 SI units | 6.6743003956 | 6.67430 |
| Standard uncertainty before expansion | 0.0000378913 | Not final reported uncertainty |
| Standard uncertainty after 3.9 expansion | 0.0001477760 | 0.00015 |
| Relative standard uncertainty after expansion | 2.214 x 10^-5 | 2.2 x 10^-5 |
| chi-squared after expansion | 12.8651 | 12.9 |
| Probability, 15 degrees of freedom | 0.6127 | 0.61 |
| Birge ratio after expansion | 0.9261 | 0.93 |
| Maximum absolute normalized residual after expansion | 1.9865 | At most 2 |

The mean rounds to 6.67430 x 10^-11 m^3 kg^-1 s^-2 and the expanded uncertainty to 0.00015 in the same 10^-11 units. This reproduces the published 6.67430(15) x 10^-11 result to displayed precision.

A sensitivity check omitting the three correlations gives a mean of 6.6742898382 and expanded uncertainty 0.000146573 in the same units. Retaining the reported correlations shifts the mean by about 1.58 x 10^-6 relative and raises the expanded uncertainty by about 0.8% versus the diagonal-only calculation. The correlations are part of the stated evaluation and must not be silently omitted.

## 5. Limits and relation to H(s)H

This is a reproducibility check of the published CODATA weighted-mean evaluation using rounded Table XXX entries and reported correlations. It is not an independent measurement of G and not a reanalysis of the 16 laboratories' raw experimental records. The last displayed digits are limited by the precision published in the table; no hidden precision is inferred.

CODATA is a standard-reference evaluation, not a single experiment. The vortex paper's g = 9.81 m s^-2 is local gravitational acceleration, not Newton's constant G. No numerical comparison between G and the Kelvin-vortex experiment was made. No H(s)H prediction, fit, worldtube/timesheet map, or physical calculation for that vortex was performed here.

The Kelvin-vortex paper identifies Figshare DOI 10.6084/m9.figshare.30903347, but the raw file inventory, exact dataset version, bytes, checksums and acquisition-level covariance remain unverified. The candidate remains governed by [HsH issue #1484](https://github.com/Satobloc/HsH/issues/1484), candidate-only.

**Provenance:** Assistant-authored source and calculation addendum based on the public NIST CODATA 2022 report and NIST constants reference. Not Nathan Direct, not a historical SAT/H(s)H equation, and not physical validation of H(s)H.
