# Morrow s1 | Asymmetric session-label contamination: exact tetrads and detection thresholds (2026-10-14)

**Classification:** GEN/DERIVED synthetic latent-factor mathematics; no inference about authorship, independence of workers, physical ontology, or SAT/H(s)H validity. This is a computational extension of Morrow's symmetric session-misclassification fixture (`morrow_session_misclassification_tetrad_power_gate_20261014.py`, blob `472cb64ede048b6475c2e83d65feecf5e1c6c709`). All variables are dimensionless.

## Model and derivation

Independent binary latent variables: `Z~Bernoulli(.30)`, `H~Bernoulli(.50)`. Four conditionally independent binary observations satisfy `P(X_i=1|Z,H)=f_i+d_i Z+c_i H`, with the same `f,d,c` fixture as the inherited Morrow code. Define recorded session label `G` with asymmetric classification errors:

- `alpha=P(G=1|H=0)` (false positive);
- `beta=P(G=0|H=1)` (false negative).

For balanced H, `w0=P(G=0)=(1-alpha+beta)/2`, `w1=(1+alpha-beta)/2`. The posterior session weights are

```
q0=P(H=1|G=0)=beta/(1-alpha+beta)
q1=P(H=1|G=1)=(1-beta)/(1+alpha-beta).
```

Because Z and H remain independent conditional on G, for distinct probes `i!=j`,

```
Cov(Xi,Xj|G=g) = A di dj + Bg ci cj
A=.3*.7=.21, Bg=qg*(1-qg).
```

Expanding the tetrad `Tg=C01*C23-C02*C13` cancels the `A^2` and `Bg^2` contributions. Consequently **the exact result** is

```
Tg = 4*qg*(1-qg)*Tpooled
   = 4*[beta*(1-alpha)/(1-alpha+beta)^2]*Tpooled, for g=0
   = 4*[alpha*(1-beta)/(1+alpha-beta)^2]*Tpooled, for g=1.
```

Here `Tpooled=-0.000876204`. For `alpha=beta=e`, the inherited `Tg=4e(1-e)Tpooled` is recovered. With `alpha=0`, observed `G=1` is uncontaminated and `T1=0`, while `G=0` remains contaminated. The roles reverse for `beta=0`. For `alpha=beta=0` or `1`, both conditional tetrads vanish (true labels or fully inverted labels). `alpha=beta=.5` makes G independent of H, restoring pooled tetrads in both strata.

## Executed calculation

Use exact 16-pattern Bernoulli mixture PMFs in each observed stratum, compute their covariance matrices and tetrads, and obtain per-observation delta variance `Vg` from the exact multinomial influence function. At `N=50,000`, the joint two-stratum Wald statistic is approximated by a noncentral chi-square with two degrees of freedom and

```
lambda = N*sum_g wg*Tg^2/Vg;
power = P(chi2_2(lambda) > chi2_2(.95)).
```

Numerically solve `power=.5` using Brent root finding along `alpha=2e*r, beta=2e*(1-r)`, with `e=(alpha+beta)/2` and `r in [0,1]`.

| r=alpha/(alpha+beta) | Mean error e at 50% power | Power at e=0.05225206909 |
|---:|---:|---:|
| 0 (alpha=0) | 0.0412976059307 | 0.68417308 |
| 0.25 | 0.0499862336396 | 0.53452733 |
| 0.50 (symmetric) | 0.0522520690893 | 0.50000000 |
| 0.75 | 0.0468579125954 | 0.58557401 |
| 1 (beta=0) | 0.0377831684069 | 0.75097020 |

**Result:** At the *same mean label-error rate*, asymmetric errors can produce substantially greater false-rejection power than symmetric errors. The two one-sided error directions are quantitatively inequivalent because probe response probabilities depend on H. The symmetric 50% boundary is **not** a universal bound on tolerated misclassification.

## Reproducibility and checks

Standalone executable `morrow_asymmetric_session_label_tetrad_gate.py` and `morrow_asymmetric_session_label_results.json` were generated in this run (local artifacts); script imports NumPy, SciPy, Matplotlib. For every evaluated parameter pair, the 16-cell PMF tetrad and the Bayes-factorized formula agree within `4e-17`. Exact controls at zero error, complete inversion, random labels, and zero session effect pass. The symmetric 50% root reproduces the previous Morrow result within `3e-9`.

Seeded multinomial experiments (7,000 independent N=50,000 datasets per boundary) gave rejection frequencies: alpha=0: `0.500286`, symmetric: `0.493714`, beta=0: `0.502714`; all Wilson 95% intervals include 0.5. Numerical Class P plot uses computed probability curves, not illustration.

**Limitations:** The exact tetrad identity relies on additive conditional means, conditional independence of the four probes, balanced H, and label errors independent of X and Z given H. The chi-square power is asymptotic, not an exact finite-sample guarantee. Empty observed strata are excluded. No evidence about real-world session labels or physical dynamics is implied.

**Next optional Kestrel calculation:** allow `P(G|H,Z)` to depend on Z and test when `Cov(Z,H|G) != 0` breaks the rank-two covariance decomposition. This could reveal failure modes invisible to the current asymmetric-but-nondifferential error model.
