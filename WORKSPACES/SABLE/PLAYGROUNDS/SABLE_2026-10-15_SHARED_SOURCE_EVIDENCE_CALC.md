# SANDBOXED | Sable systems: exact shared-source confirmation inflation | 2026-10-15

**Scope:** mathematical stress test of multi-agent SAT/H(s)H evidence handling, NOT a physical claim or measured worker behavior. Ordinary Sable systems lane; no theory-promotion authority.

## Exact dependence model
Let an agent's spurious apparent confirmation under a hypothetical null be (X_{gi}\in\{0,1\}). Each of (G) independent source groups has (m=N/G) agents. Within group (g), sample \(\theta_g\sim\mathrm{Beta}(\alpha,\beta)\), then conditionally independent \(X_{gi}|\theta_g\sim\mathrm{Bernoulli}(\theta_g)\). Define \(\alpha=p(1/\rho-1)\), \(\beta=(1-p)(1/\rho-1)\), so each marginal false-match rate is \(p\) and within-group pairwise correlation is \(\rho\). Across groups correlation is zero. At \(\rho=0\), use the independent binomial limit.

\[
P(K_g=k)={m\choose k}\frac{B(k+\alpha,m-k+\beta)}{B(\alpha,\beta)},\quad
P(K\ge r)=\sum_{k=r}^{N}[z^k]\left(\sum_{j=0}^m P(K_g=j)z^j\right)^G.
\]
\[
\mathrm{Var}(K)=Np(1-p)[1+(m-1)\rho],\quad N_{\rm eff}=\frac{N}{1+(m-1)\rho}.
\]
All variables dimensionless. The effective-N expression only matches count variance, not the full probability law.

## Fixture A: 8 workers, null p=.05, within-source rho=.10
Exact beta-binomial polynomial convolution:

| Independent source groups | P(4 or more false confirmations) | P(all 8 false confirmations) |
|---:|---:|---:|
| 1 | 0.0103993434464 | 1.23862295888e-5 |
| 2 | 0.00312251397871 | 2.15525424724e-7 |
| 4 | 0.000960903698574 | 2.76281640625e-9 |
| 8 | 0.000371751367187 | 3.90625e-11 |

Thus one shared source vs eight independent sources inflates the 4+ tail by **27.9739x**, and the all-eight tail by **317,087x** under this specified null. These are *not* Bayes factors or measured project error rates.

## Fixture B: 96 signs in 8 independent sessions of 12, null p=.5, rho=.10
Naive one-sided binomial rejection at 57+ positives has independent-null size **0.0410965343**, but actual beta-binomial-session null size **0.1164977308**. With known rho=.10, cutoff 61+ has size **0.0389676557**. With unknown within-session dependence, provided independent sessions and null-symmetric session totals, a randomized-tie session sign test rejects at 7+ positive sessions with exact size **9/256 = 0.03515625**.

## Independent executable check
A Python solver (NumPy/SciPy/Matplotlib) evaluated the exact PMF by discrete convolution and ran 250,000 *actual* seeded beta-binomial Monte Carlo trials per fixture, seed 20261015. MC rates: 0.010392 (8 workers) and 0.117004 (96 signs), each within one standard error of exact. Class P figures are code-drawn. The complete solver, derivation, JSON results and figures are available in the accompanying conversation artifact `sable_shared_source_evidence_20261015.zip`; the zip is **not** claimed to be stored in this repository.

**Next falsifier:** blind agents to disjoint source sets, pre-register matching criteria, and measure agreement on intentionally false controls. If within-source correlation is negligible, the inflation effect vanishes.

**Limit:** hypothetical null parameters only. No inference about correctness of SAT/H(s)H or actual multi-agent error rates.
