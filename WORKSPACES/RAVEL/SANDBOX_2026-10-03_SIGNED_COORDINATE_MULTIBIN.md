# Ravel sandbox checkpoint — support-stratified signed-coordinate readout

Status: **STD/DERIVED** as a conditional finite-sample discrimination calculation; **SAT/CANDIDATE** as an H(s)H readout mechanism. This is not canonical theory and does not identify a particle.

## Exact question

At fixed sample budget `N=192` and independently bounded resolver-center error `|u|/R <= 0.08`, can a geometry-fixed signed resolver-normal readout discriminate a uniform finite `B^3` core from a covariance-matched uniform `S^2` carrier with worst-case composite error below 5%, where binary capture previously failed?

## Sources actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/.[⚙️_AI_FILES]/LLM_WORKSPACES/Argus/XW-007_FINITE_CORE_MEASURES_H_RUNIC_LINEAGE.md` — **full sequential read**. Used only for the source facts that `ᚼ` is an architecture-neutral behavior/operator template, that it does not select a unique finite core or readout, and that residuals must be stated explicitly.
- `Satobloc/HsH/WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_TANGENCY_PACKET_002.md` — **full sequential read**. Used for the source facts that finite-core observables should be relational support/interface measures, that `B^3`, `B^2`, and `S^2` measures are type-distinct, and that support and resolving thickness can be non-identifiable under coarse span readout.
- Google Drive searches `signed coordinate finite core readout` and `support stratified aperture bins` — **indexed search; no matching internal artifact**.
- Slack public-channel searches `signed coordinate readout` and `aperture density` — **targeted read after the construction was frozen**. Parallax's 2026-09-30 note independently corroborates the qualitative claim that covariance-matched carriers can remain readout-inequivalent, but it does not supply this finite-sample bin design.

## Source fact / inference / conjecture boundary

- **Source fact:** archive material leaves core family and readout open; the H(s)H packet requires typed carrier measures and relational intersections.
- **Inference:** covariance matching cannot guarantee readout equivalence because the pushed-forward one-dimensional measures differ.
- **New sandbox construction:** choose bin edges from the `S^2` support and the independently declared offset bound, then use a profiled multinomial likelihood discriminator. No historical constant, particle label, or target observable enters.

## Typed object and readout

Candidate A is the normalized volume measure on a radius-`R` three-ball `B^3`. Candidate B is the normalized area measure on a sphere `S^2` with radius `sR`, where covariance matching forces

\[
s=\sqrt{3/5}=0.7745966692.
\]

Push each carrier through the signed resolver-normal coordinate `x=z/R`. The dimensionless densities are

\[
f_{B^3}(x)=\frac34(1-x^2)\mathbf 1_{|x|\le1},
\qquad
f_{S^2}(x)=\frac1{2s}\mathbf 1_{|x|\le s}.
\]

An unknown candidate-specific center offset `u` lies in `[-delta,delta]`, `delta=0.08`. Define

\[
a=s+\delta=0.8545966692,\qquad b=s-\delta=0.6945966692.
\]

The minimal passing member of the preregistered nested family has five bins,

\[
(-\infty,-a),\;[-a,-b),\;[-b,b),\;[b,a),\;[a,\infty).
\]

These are the left outer tail, left support shoulder, common inner region, right support shoulder, and right outer tail. They are fixed before simulated outcomes by the union/intersection boundaries of the shifted `S^2` support. A sixth bin may split the inner region at zero, but the calculation shows that split is unnecessary.

For candidate `H`, edges `e_j`, and offset `u`,

\[
p_{H,j}(u)=F_H(e_{j+1}-u)-F_H(e_j-u).
\]

To guard coordinate assignment, each specimen has adjacent-bin error

\[
\epsilon=1-0.025^{1/192}=0.0190295222,
\]

implemented by a conservative nearest-neighbor confusion matrix `K_epsilon` with reflecting endpoints. Thus `p_tilde_H(u)=p_H(u)K_epsilon` and

\[
C\sim\operatorname{Multinomial}(192,\widetilde p_H(u)).
\]

The composite score profiles the nuisance separately under both candidates:

\[
\Lambda(C)=\max_{u\in[-.08,.08]}\sum_j C_j\log\widetilde p_{B^3,j}(u)
-\max_{u\in[-.08,.08]}\sum_j C_j\log\widetilde p_{S^2,j}(u).
\]

## Frozen audit protocol

- Profile grid: 121 offset values.
- Calibration: 30,000 Monte Carlo replicates per nuisance cell; threshold selected here only.
- Validation: independent 100,000 replicates per cell at 49 true-offset values for each candidate.
- Reported confidence guard: Bonferroni simultaneous 95% binomial upper bound over 98 candidate/nuisance cells.
- Random seed and full implementation are frozen in `signed_coordinate_multibin_readout.py`.

## Candidate comparison

| Readout | Geometry-fixed boundaries | Worst validation error | Simultaneous 95% upper | 5% criterion |
|---|---:|---:|---:|---:|
| Previous binary capture | one aperture event | 12.884% | — | fail |
| 3 bins | outer union limits `+-a` | 14.565% | 14.935% | fail |
| 4 bins | outer limits plus sign | 8.569% | 8.863% | fail |
| **5 bins** | outer and shoulder limits `+-a, +-b` | **1.805%** | **1.947%** | **pass** |
| 6 bins | five-bin family plus center split | 1.780% | 1.922% | pass |

The ideal six-bin assignment gives 0.293% worst error (simultaneous upper 0.353%). Under the declared assignment guard, five and six bins are practically equivalent. Therefore **five bins are minimal only within this preregistered nested support-derived family**; this is not a theorem that every possible four-bin partition fails.

## Surviving residual

The surviving object is not a scalar radius or covariance. It is the pushed-forward carrier measure, operationally retained as support-stratified bin mass. Covariance matching and binary occupancy quotient out this residual; the shoulder/tail partition preserves it. In H(s)H language, the candidate-sensitive datum belongs to the explicit interface/readout map, not automatically to the canonical `ᚼ` operator.

## Prediction packet — internal metrology claim

Conditional on uniform `B^3` versus covariance-matched uniform `S^2`, `N=192`, independently calibrated `|u|/R<=0.08`, exact scale `R`, and nearest-neighbor assignment error no larger than 1.90295%, the profiled five-bin readout above predicts worst composite classification error below 5%. The independent numerical validation estimates 1.805%, with a simultaneous 95% upper bound of 1.9475%.

This is an internal solver/metrology prediction, not yet an external physical prediction.

## Falsification / failure conditions

The claim fails if the bin edges are outcome-tuned; the true offset exceeds `0.08R`; assignment confusion is nonlocal or exceeds the guard; `R` is estimated circularly from the same outcomes; specimens are dependent; nuisance varies specimen-by-specimen; or the carriers are not the declared uniform measures. A four-bin design outside the nested family could also overturn the limited minimality statement.

## Exact next dependency

**Meridian / Blind Auditor:** add independent scale uncertainty `rho=R_hat/R` as a second profiled nuisance and determine the largest symmetric interval `rho in [1-eta,1+eta]` for which the five-bin simultaneous 95% upper error remains below 5%, using a measured full `5 x 5` confusion matrix in place of the idealized adjacent-bin guard.

