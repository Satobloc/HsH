# Ravel sandbox checkpoint — correlated predictive memory-model selection

Status: **sandbox candidate, not canonical theory**. This checkpoint tests whether the second relaxation channel inferred in the previous run predicts unseen radii after realistic pole-error covariance is included.

## Sources actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H Dev +/H(s)H CLAUDUH.txt` — full sequential fetch (display truncated after retrieval). Substantially read the Whirligig/Navier–Stokes prototype discussion and its audit. Retained source motif: code must make geometry dynamically load-bearing and must be judged by generated/residual behavior, not by decorative geometric scaffolding. Historical physical identifications and fitted constants were not imported.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/ACTIVATOR MODES.txt` — full sequential read. This is workflow genealogy, not theory. Retained source motif: QuickCode/Sim/Proof/Critic are distinct operations; coded testing and hostile criticism are required before promotion.
- Google Drive targeted searches for `correlated complex pole likelihood memory kernel` and `cross validation relaxation spectrum poles` — no relevant internal construction found; both returned an unrelated spreadsheet. No Drive content was used.
- Slack targeted collision search after construction — found the immediately prior `two-pole memory rejection boundary` checkpoint and the standing requirement that a nontrivial observable remain held out. No competing covariance-aware predictive construction was found.

## Independent construction

The injected two-channel causal response is

\[
D_2(z;a)=a^{-2}-z^2-iz\sum_{j=1}^2\frac{A_{0j}a^q}{1-iz\tau_j}=0.
\]

The inference does not use the bare real dispersion. For measured complex poles \(z_i\) at radii \(a_i\), require only the reality closure

\[
g_i(\theta)=\operatorname{Im}\left[z_i^2+iz_i\sum_j\frac{A_{0j}a_i^q}{1-iz_i\tau_j}\right]=0.
\]

Treat the stacked pole-coordinate error

\[
\delta y=(\delta\operatorname{Re}z_1,\ldots,\delta\operatorname{Re}z_N,
\delta\operatorname{Im}z_1,\ldots,\delta\operatorname{Im}z_N)
\]

as Gaussian with declared covariance \(C_z\). The benchmark uses relative pole noise \(10^{-4}\), radius-to-radius AR(1) correlation \(\rho=0.75\), and same-radius real/imaginary correlation \(\eta=0.35\). Analytic propagation gives

\[
C_g(\theta)=J(\theta)C_zJ(\theta)^T,
\]

where analyticity of \(F=z^2+iz\sum_j A_j/(1-iz\tau_j)\) gives

\[
\frac{\partial g_i}{\partial\operatorname{Re}z_i}=\operatorname{Im}F'_i,
\qquad
\frac{\partial g_i}{\partial\operatorname{Im}z_i}=\operatorname{Re}F'_i.
\]

Five interleaved interior-radius folds were held out, while the two span endpoints remained calibration anchors. Because train and test errors are correlated, the predictive distribution is conditional:

\[
\mu_{*|T}=C_{*T}C_{TT}^{-1}g_T,
\qquad
S_{*|T}=C_{**}-C_{*T}C_{TT}^{-1}C_{T*}.
\]

The score is

\[
-2\log p(g_*|g_T,\theta)=
(g_*-\mu_{*|T})^TS_{*|T}^{-1}(g_*-\mu_{*|T})
+\log\det S_{*|T}+n_*\log(2\pi).
\]

This is the discriminator: the richer model must predict radii excluded from its fit under the full declared covariance.

## Numerical result

Injected parameters were \(q=2.4\), \((\tau_1,\tau_2)=(0.25,2.0)\), and \((A_{01},A_{02})=(0.012,0.008)\). The five foldwise predictive advantages

\[
\Delta\mathrm{NLL}=\mathrm{NLL}_{1\text{-pole}}-\mathrm{NLL}_{2\text{-pole}}
\]

were

\[
(6.6364,\ 6.4638,\ 0.0810,\ 3.6065,\ -2.7636),
\]

with total \(\sum\Delta\mathrm{NLL}=14.0241\). Four of five folds favor two poles; one fold favors one pole. Thus the second channel survives covariance-aware held-out prediction in aggregate, but not uniformly pointwise.

Across folds, the recovered two-pole parameters were approximately

- \(q\in[2.3886,2.4098]\),
- \(\tau_1\in[0.1706,0.2568]\),
- \(\tau_2\in[1.8478,2.1634]\) except one high estimate \(2.3845\),
- \(A_{01}\in[0.01130,0.01240]\),
- \(A_{02}\in[0.00771,0.00886]\).

The wrong one-pole model collapses the pair to a typical \(\hat\tau\approx0.96\), \(\hat q\approx2.24\), \(\hat A_0\approx0.0212\), and leaves a structured closure trough near the slower relaxation knee.

## Candidate comparison and surviving residual

- **One-pole memory:** parsimonious but produces a broad, signed reality-closure structure that predicts unseen radii poorly in aggregate.
- **Two-pole memory:** five parameters recover both injected timescales and gain 14.0 units of covariance-aware held-out NLL, despite one losing fold.
- **Markov/local reduction:** corresponds to eliminating the frequency dependence altogether; it cannot reproduce two separated knees unless the sampled band is too narrow.

The surviving discriminator is not a raw residual amplitude. It is the conditional predictive likelihood under the declared complex-pole covariance. It is invariant to reordering the radii and to invertible linear re-expression of the residual vector when covariance and Jacobian are transformed consistently. It is not invariant to changing the held-out design, covariance family, or the radius span.

## Failure conditions

Reject this checkpoint as evidence for two physical channels if any of the following occurs:

1. the advantage vanishes under a preregistered independent noise realization or bootstrap distribution;
2. estimating \(C_z\) rather than injecting it reverses the aggregate likelihood ordering;
3. a continuous relaxation spectrum or non-rational kernel predicts held-out radii equally well with lower effective complexity;
4. endpoint anchors are doing essential target work rather than defining the calibrated radius span;
5. the two fitted timescales collapse, exchange discontinuously, or drift with the fold/radius window;
6. the full complex pole equation, rather than only reality closure, fails on the same held-out radii.

## Tight next test

Run a blinded Monte Carlo power study in which \(C_z\) is estimated from repeated complex-pole measurements, not supplied. Compare one pole, two poles, and a positive continuous spectrum by nested held-out log predictive density. Freeze the radius grid and model classes before generating noise. The two-channel candidate earns promotion only if its expected predictive advantage stays positive and both timescale intervals exclude collapse \(\tau_1=\tau_2\).

Artifacts:

- `WORKSPACES/RAVEL/SCRIPTS/correlated_cv_memory.py`
- `WORKSPACES/RAVEL/VISUALS/correlated_cv_memory.svg`

