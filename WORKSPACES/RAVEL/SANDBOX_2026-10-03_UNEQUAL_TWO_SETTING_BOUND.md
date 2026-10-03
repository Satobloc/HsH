# Ravel sandbox checkpoint — fixed-budget unequal two-setting closure

**Status:** siloed sandbox construction, not canonical H(s)H. `STD/DERIVED` conditional on the declared uniform measures, linear top-hat readout, independent offset bounds, binomial sampling, and control guard. `SAT/CANDIDATE` only as a finite-core carrier discriminator.

## Exact question

At certified relative miscentering \(|u|/R\le0.08\) and total specimen budget exactly (N=192), can any fully unequal two-setting resolver design

\[
(t_1,c_1,n_1),\qquad(t_2,c_2,192-n_1)
\]

drive both composite (B^3)-versus-(S^2) classification errors below 5%, or does the two-setting family close numerically before a third setting is considered?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/.[⚙️_AI_FILES]/LLM_WORKSPACES/Argus/XW-013_PUBLIC_FINITE_SLAB_CHRONOLOGY_AND_SCALE_CANDIDATE.md` — **full sequential read**. It gives a bounded public chronology for finite resolving thickness and preserves the distinction (a=\) carrier/core radius versus (h_\Sigma=\) resolving-layer thickness. Its historical (h_\Sigma\sim\lambda\) or coherence-length proposal is generated, coefficient-free, and quarantined; it was not used to choose this run's apertures.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_104_EXACT_FINITE_SLAB_FOLD_DISCRIMINATOR.md` — **full sequential read**. It derives an exact finite-slab volume in the frozen quadratic-contact model and shows a two-valued inverse fold. It supports treating slab thickness as a typed readout variable, but its (J(r)) function is not imported into the present linear aperture model.
3. Google Drive searches `unequal aperture minimax offset` and `finite slab resolver center error` — **targeted post-construction search**. No relevant result; one unrelated spreadsheet hit was not opened.
4. Slack `#all-hsh-working-group-one`, searches `aperture minimax` and `unequal` — **targeted post-construction read**. Recovered Parallax's ideal aperture-tomography identities and the preceding Ravel offset packet. No prior full unequal-setting fixed-budget closure was found.

## Source fact, inference, and new conjecture

- **Source facts:** finite carrier radius and resolving-layer thickness are separate variables; aperture sweeps reconstruct projected carrier density in the ideal linear model; finite-slab inverse maps can fold.
- **Derived here:** the five-variable design search, exact discrete profiled risk, worst-pair affinity bound, and collapse of the best exact-risk candidate found to one geometric setting.
- **Sandbox conjecture:** under a severe offset nuisance, distinct resolver placements may spend specimen budget estimating nuisance rather than discriminating bulk from boundary; the correct next intervention may be added information per specimen, not another placement.

## Typed model

- Candidate A: uniform volume measure on (B^3_R).
- Candidate B: uniform area measure on covariance-matched (S^2_{sR}), (s=\sqrt{3/5}).
- Resolver: ​top-hat slab ​with dimensionless half-thickness (t=h/R) and commanded center (c/R).
- Candidate-specific nuisance: (u_B,u_S\in[-0.08,0.08]), because the composite hypotheses must be allowed independent admissible offsets.
- Empty/full controls: 192 repeats each, zero errors, giving
  \[
  e=1-0.025^{1/192}=0.019029522168779844,
  \qquad p=e+(1-2e)M.
  \]

For clipped (F_{B^3}),

\[
F_{B^3}(x)=\frac12+\frac34x-\frac14x^3\quad(-1\le x\le1),
\]

\[
M_{B^3}(t,c,u)=F_{B^3}(u+c+t)-F_{B^3}(u+c-t),
\]

\[
M_{S^2}(t,c,u)=
\frac{|[u+c-t,u+c+t]\cap[-s,s]|}{2s}.
\]

## Optimization and exact test

The design box was preregistered as

\[
t_i\in[0.08,1.12],\qquad c_i/R\in[-0.30,0.30],
\qquad n_1/192\in[0.05,0.95].
\]

Six differential-evolution starts minimized the largest product Bhattacharyya affinity over every independent nuisance pair ((u_B,u_S)). Finalists and neighboring integer allocations were then evaluated on the complete ((n_1+1)(n_2+1)) count lattice. Each candidate family was profiled over 2,001 deterministic nuisance points, and the likelihood-score threshold was shifted to minimize the larger worst-case error.

The information surrogate consistently found the expected opposed-offset family near

\[
(t_1,c_1)=(0.80294,+0.05165),\quad
(t_2,c_2)=(0.80369,-0.05090),
\]

but its exact profiled error was about 13.14%. The lowest exact risk among the audited finalists instead collapsed to

\[
\boxed{t_1=t_2\approx0.8545966695,\qquad c_1=c_2\approx0},
\]

with nominal allocation (92+100). The split supplies only a deterministic ancillary randomization at the boundary; it is not a second geometric view.

| Design | Total (N) | Worst (B^3) error | Worst (S^2) error | Max error |
|---|---:|---:|---:|---:|
| Prior symmetric displaced pair, (t=.8025,c=\pm.0525) | 192 | 13.8364% | 11.9731% | 13.8364% |
| Best opposed-offset surrogate family | 192 | 13.1388% | 12.8353% | 13.1388% |
| Lowest exact-risk audited finalist; coincident settings | 192 | 12.8726% | 12.8835% | **12.8835%** |

Thus no passing two-setting design was found. Within the declared box and search protocol, the numerical performance ceiling is equivalently an error floor of 12.8835%, 2.58 times the allowed 5%.

## Information residual and degree of closure

For a fixed design, let

\[
A=\max_{u_B,u_S}\prod_{j=1}^2
\left(\sqrt{p_{Bj}p_{Sj}}+\sqrt{(1-p_{Bj})(1-p_{Sj})}\right)^{n_j}.
\]

Then (\mathrm{TV}\le\sqrt{1-A^2}), so every classifier for that nuisance pair obeys

\[
P_e\ge\frac{1-\sqrt{1-A^2}}2.
\]

For the coincident-setting finalist,

\[
A=0.5188515112,
\qquad
\boxed{P_e\ge7.25678097\%},
\]

at the least-separated pair (u_B=0, u_S=-0.08). This independently rules out 5% for that finalist.

The multistart surrogate search over the full declared box came within (6.7\times10^{-5}) error-probability units of a universal 5% Bhattacharyya certificate at one integer allocation, but did not clear it. Therefore:

- **earned:** a reproducible multistart numerical closure and exact failure of all audited finalists;
- **not earned:** an analytic global theorem that every point of the continuous two-setting box fails.

## Candidate comparison and surviving invariant

The historical finite-slab scale candidate does not repair the result because it concerns how (h_\Sigma) might be set, not whether two readout placements contain enough likelihood separation at fixed sample budget. Run 104's fold warns that inverse branches can be ambiguous, but the present obstruction is stronger and simpler: admissible (B^3) and (S^2) nuisance distributions remain too close.

The surviving invariant is the **composite likelihood separation after nuisance profiling**. Raw center values and setting labels are not invariant; swapping the settings and allocations changes nothing. Common carrier/resolver translation is gauge, while relative translation changes the readout.

## Prediction / test status

No external physical prediction is earned.

Internal falsifiable benchmark: under the declared model, (N=192), and ​(|u|/R\le0.08), the audited exact optimum must not be reported as a two-view 95% discriminator. A solver returning sub-5% error for the coincident finalist, or for the frozen symmetric pair, has mishandled nuisance profiling, specimen accounting, control error, or binomial discreteness.

## Failure condition

This closure does not apply outside (t\in[0.08,1.12]), ​(|c|/R\le0.30); to adaptive placements; to continuous-valued per-specimen readouts; to shared rather than candidate-specific offset; to non-top-hat kernels; to drifting controls; or to carrier measures other than the declared uniform (B^3/S^2) pair. The numerical closure also fails as a theorem if a denser/global optimizer finds a lower exact risk.

## Exact next dependency

**Meridian:** before adding a third placement, test one information-richer per-specimen readout at the same total (N=192): record the signed resolver-normal coordinate (or a preregistered multi-bin quantization) instead of binary capture. Profile the same independent ​(|u|/R\le0.08) nuisance and report whether the exact minimax error crosses 5%. This isolates whether the obstruction is binary compression or finite-core indistinguishability.
