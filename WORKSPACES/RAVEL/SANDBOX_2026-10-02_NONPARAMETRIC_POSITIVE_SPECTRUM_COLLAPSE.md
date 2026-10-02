# Ravel sandbox checkpoint — nonparametric positive-spectrum collapse

Status: **siloed sandbox metrology; not canonical H(s)H theory and not evidence for a particle identity**.

## Narrow question

Can a training-selected, nonnegative nonparametric relaxation spectrum match or beat the discrete two-channel memory model without concentrating into two narrow peaks?

## Sources actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/4DHH-UC BUILDOUT DEV.txt` — substantial direct read of the exposed synthesis, derivation-map, cross-sector-test, and audit material. The useful user-authored control is that translating familiar sector equations into SAT language is not enough: a construction must traverse an explicit dependency chain and must not route around a blockage with an attractive adjustment. The file's lattice, fixed constants, mass rules, particle labels, and generated validation claims were not imported.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_104_EXACT_FINITE_SLAB_FOLD_DISCRIMINATOR.md` — full sequential read. Its exact finite-slab reduction demonstrates that dimensionless collapse and an exact forward map can still leave a two-valued inverse problem. Used only as inverse-method discipline: expose branch structure and conditioning rather than silently selecting a favored reconstruction.
- Google Drive targeted search for `nonparametric positive relaxation spectrum nested cross validation` — no relevant internal construction returned.
- Slack collision search after the independent construction — found only the two preceding Ravel spectrum checkpoints; no prior nonparametric implementation.

## Source fact, derivation, conjecture boundary

**Source fact:** the archive asks for explicit cross-sector dependencies and rejects success language that outruns the calculation. The H(s)H slab packet supplies an exact example where a forward law remains inversely branched.

**Standard/synthetic derivation:** positivity-constrained least squares, covariance propagation, nested cross-validation, and the numerical comparison below are standard inverse-method machinery applied to a declared synthetic fixture.

**Sandbox inference:** if an H(s)H finite-core readout eventually exhibits this response structure, two localized relaxation neighborhoods would be a candidate constitutive signature. Nothing here establishes that a physical worldtube has those channels.

## Candidate construction

The discrete benchmark remains

\[
D_2(z;a)=a^{-2}-z^2-iz\sum_{j=1}^{2}
\frac{A_{0j}a^q}{1-iz\tau_j}=0,
\]

with the synthetic injection

\[
q=2.4,\qquad
(\tau_1,\tau_2)=(0.25,2.0),\qquad
(A_{01},A_{02})=(0.012,0.008).
\]

The rival is not assigned a band shape. On a fixed 25-bin logarithmic grid

\[
0.04\le \tau_k\le12,
\]

it uses

\[
M_{\rm NP}(z)=\sum_{k=1}^{25}\frac{w_k}{1-iz\tau_k},
\qquad w_k\ge0.
\]

For fixed (q), the observable reality closure is linear in (w_k):

\[
g_i=\operatorname{Im}\left[z_i^2+iz_i a_i^qM_{\rm NP}(z_i)\right].
\]

Smoothness is controlled by

\[
\lambda\|D_2(w/W)\|_2^2,
\]

where (D_2) is the second-difference matrix and (W=0.02) is a fixed numerical scaling. The grids

\[
q\in\{1.8,1.9,\ldots,3.0\},
\qquad
\lambda\in\{0,10^{-2},1,10^2,10^4\}
\]

were frozen before scoring. For each of three outer radius folds, (lambda) was chosen using two inner folds drawn only from the outer training radii. Covariance was re-propagated through each fitted response. The outer test fold was never used to choose smoothness.

Independent repeat ensembles were tested at (R=96) and (R=192), with the complete (82\times82) pole covariance estimated from those repeats.

## Predictive comparison

Define

\[
\Delta_{\rm NP-2}
=\mathrm{NLL}_{\rm NP}-\mathrm{NLL}_{2\text{-pole}},
\]

so positive values favor the discrete two-pole model.

| repeats | foldwise (Delta_{\rm NP-2}) | sum | folds favoring two poles |
|---:|---|---:|---:|
| 96 | ((-0.746,,3.170,,18.376)) | (20.800) | 2/3 |
| 192 | ((0.457,,1.035,,5.567)) | (7.059) | 3/3 |

The nonparametric rival therefore did not beat the two-pole model in aggregate at either repeat count. At (R=96), however, it won one fold slightly, so no fold-universal discriminator is claimed.

## Shape result

For the full (R=96) ensemble, inner selection chose

\[
\lambda=100,\qquad q=2.3,
\qquad N_{\rm eff}=\left(\sum_k p_k^2\right)^{-1}=10.83,
\]

where (p_k=w_k/\sum_jw_j). The reconstruction was broad and placed substantial weight at both grid boundaries, (	au=0.04) and (12). That is an underidentification warning: the inferred spectrum depends on relaxation times outside the measured window.

For the full (R=192) ensemble, selection instead chose

\[
\lambda=0,\qquad q=2.4,
\qquad N_{\rm eff}=3.67.
\]

Its nonzero mass concentrated into four neighboring bins forming two localized clusters:

| (	au_k) | normalized weight |
|---:|---:|
| 0.211 | 0.221 |
| 0.268 | 0.374 |
| 1.793 | 0.175 |
| 2.273 | 0.230 |

The injected values (0.25) and (2.0) were revealed only after fitting. Thus, at the higher repeat count, the flexible positive-spectrum rival approaches the discrete model by becoming an approximate two-atom measure rather than by sustaining a broad continuum.

The smaller aggregate NLL gap at (R=192) is not evidence of poorer data. With enough information, the nonparametric grid can resolve and approximate the two discrete poles; it partly nests the discrete architecture.

## Surviving residual

The result moves the discriminator from “discrete versus continuous by label” to **resolution stability of spectral concentration**.

Under log-(	au) grid refinement:

- a genuinely discrete channel should occupy a shrinking physical width while its integrated cluster weight and centroid stabilize;
- a genuinely continuous band should retain a nonzero physical width;
- an underidentified reconstruction should move weight with the grid endpoints or regularization range.

This is a stronger test than asking which named model has the smaller residual.

## Failure conditions

Revise or reject this result if:

1. independent repeat ensembles reverse the aggregate ordering;
2. expanding the (	au) interval removes or moves the two clusters;
3. finer grids yield stable finite-width bands rather than narrowing clusters;
4. a denser nested (lambda) or (q) search changes the selected morphology;
5. four- or five-fold outer validation reverses the comparison;
6. apparatus repeats are nonstationary or the covariance estimator is misspecified;
7. full complex-dispersion scoring contradicts the reality-closure scoring.

## Exact next dependency

Repeat the (R=192) fit on 25-, 49-, and 97-bin log-(	au) grids and on intervals expanded by a factor of four at both ends. Report cluster centroids, integrated weights, log-widths, endpoint mass, and held-out NLL before revealing the injection. Stable centroids with widths proportional to grid spacing would be the specific signature of two discrete channels.

Artifacts:

- `WORKSPACES/RAVEL/SCRIPTS/nonparametric_positive_spectrum_cv.py`
- `WORKSPACES/RAVEL/DATA/nonparametric_positive_spectrum_cv.json`
- `WORKSPACES/RAVEL/VISUALS/nonparametric_positive_spectrum_cv.svg`
