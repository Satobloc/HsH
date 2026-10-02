# Ravel sandbox checkpoint — lambda-path ensemble identifiability

**Status:** `GEN/CANDIDATE`; synthetic finite-core readout inverse problem. No particle identity or ontology claim.

## Exact question

After removing discontinuous point selection of the roughness parameter, does a 50-seed ensemble establish that the recovered positive relaxation spectrum contains two discrete, grid-invariant channels?

## Sources actually consulted

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/CORRECTION TO RMS CRITIQUE .txt` — **full sequential read**. Controlling source facts: construct the benchmark map first; extract candidates only from differences, invariants, necessities, constraints, or failures visible in that map; preserve a bidirectional audit trail; return a null/open result rather than inventing an interpretation.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_136_CROSSOVER_INVERSE_MAP_IDENTIFIABILITY.md` — **full sequential read**. Source fact retained: an effective combination can be globally identifiable while its internal decomposition remains non-identifiable without another observable.
3. Google Drive search for `lambda path relaxation spectrum endpoint leakage` — **indexed/targeted search**. It returned an unrelated conversation-sample sheet; no controlling spectrum construction was used.
4. Slack `#all-hsh-working-group-one` search for `lambda spectrum` — **targeted read**. It located the immediately preceding Ravel spectrum chain and no independent lambda-path ensemble result.

## Object and dimensional type

The object fitted here is a nonnegative spectral measure on the one-dimensional relaxation-time half-line,

\[
d\mu(\tau)\ge0,\qquad \tau\in\mathbb R_+,
\]

entering a complex finite-core readout kernel

\[
K(z;a)=a^q\int_{\mathbb R_+}\frac{d\mu(\tau)}{1-iz\tau}.
\]

It is a constitutive/readout representation, not the worldtube itself. A two-atom measure is compatible with two discrete relaxation channels; a finite-width component is compatible with a distributed or unresolved layered sector.

## Construction

The previous blinded stage independently recovered \(q=2.4\) in all six configurations. This run conditions on that data-derived value to isolate spectral-shape identifiability; it does not reinsert the injected times or amplitudes.

For each of 50 independent \(R=192\) repeat ensembles:

- estimate the complete complex-pole covariance from repeats;
- fit nonnegative spectra on 25, 49, and 97 bins;
- use intervals \([0.04,12]\) and \([0.01,48]\);
- evaluate \(\lambda=0\) plus 13 logarithmic values over \(10^{-8}\)–\(10^4\);
- score each \(\lambda\) on three held-out radius folds;
- form predictive-evidence weights

\[
\alpha_\lambda=
\frac{\exp[-(L_\lambda-L_{\min})/2]}
{\sum_{\lambda'}\exp[-(L_{\lambda'}-L_{\min})/2]};
\]

- average the full-data positive spectra,

\[
\bar\mu=\sum_\lambda\alpha_\lambda\mu_\lambda;
\]

- compute two blind log-time clusters, their centroids, integrated masses, physical log-widths, and endpoint mass.

The roughness discretization remained grid-consistent:

\[
\mathcal R_h=\lambda h^{-3}\lVert D_2u\rVert^2,
\qquad h=\Delta\log\tau.
\]

This is predictive-evidence averaging, not a fully specified Bayesian posterior over \(\lambda\); the distinction is retained.

## Ensemble result

Values are medians with 95% seed intervals.

| interval | bins | fast centroid | slow centroid | fast mass | fast width | slow width | endpoint mass U95 |
|---|---:|---|---|---|---|---|---:|
| base | 25 | 0.230 [0.105,0.281] | 2.050 [1.884,2.183] | .592 [.570,.612] | .150 [.087,1.097] | .117 [.094,.296] | .322 |
| base | 49 | 0.229 [.068,.287] | 2.040 [1.491,2.294] | .599 [.446,.616] | .199 [.062,1.055] | .064 [.016,.625] | .305 |
| base | 97 | 0.230 [.067,.292] | 2.056 [1.495,2.298] | .599 [.447,.619] | .151 [.042,1.063] | .045 [.023,.620] | .312 |
| wide | 25 | 0.239 [.098,.268] | 2.024 [1.972,2.111] | .597 [.582,.606] | .167 [.057,1.550] | .077 [~0,.159] | .207 |
| wide | 49 | 0.235 [.060,.284] | 2.031 [1.470,4.862] | .596 [.412,.613] | .172 [.062,1.658] | .077 [.012,1.370] | .254 |
| wide | 97 | 0.224 [.051,.290] | 2.053 [1.492,6.998] | .596 [.413,.618] | .233 [.054,1.667] | .052 [.028,1.498] | .305 |

The post hoc reveal was \((\tau_1,\tau_2)=(0.25,2.0)\) with normalized amplitudes \((0.60,0.40)\).

## Candidate comparison

### Two discrete channels

The median centroids and mass split are compatible, but atomicity requires physical width to contract with \(h\). The fast median width is \(0.167\to0.172\to0.233\) on the wide interval, and its 97.5% bound is \(1.550\to1.658\to1.667\). This candidate therefore fails the declared ensemble atomicity criterion.

### Broad continuous spectrum

The ensemble-median spectrum is not broadly continuous; it remains sharply bimodal. A single broad continuum is therefore also a poor description of the typical recovery.

### Layered/effective-sector architecture

The currently admissible description is weaker and cleaner: the readout identifies two effective integrated sectors with a stable typical mass split, while the internal shape of the fast sector and the rare-seed slow-sector tail remain unresolved. This mirrors the source theorem's distinction between identifiable effective support and non-identifiable internal decomposition.

## Surviving residual and failure

**Survives across representation changes:**

- median fast centroid \(0.224\)–\(0.239\);
- median slow centroid \(2.024\)–\(2.056\);
- median mass split \(0.592\)–\(0.599\) / \(0.401\)–\(0.408\);
- bimodality of the ensemble-median spectrum.

**Does not survive at 95% ensemble level:**

- contracting fast-sector width;
- negligible endpoint leakage;
- bounded slow centroid on the refined wide grid;
- a unique regularization scale. The median effective number of contributing \(\lambda\) values remains about 8.1–8.8.

The earliest unsupported edge is therefore the conversion

\[
\text{two effective spectral sectors}
\not\Rightarrow
\text{two discrete physical channels}.
\]

## Prediction and falsification

No external prediction is earned. The calculation produces a clean internal null result: with the present radius/readout design and noise, \(R=192\) is insufficient to certify atomicity at the 95% seed level even though median locations and masses are accurate.

The next discriminator must change information, not regularization. Add an independent frequency/readout axis or extend the radius crossover range, then rerun the same blinded ensemble. The discrete-channel candidate is falsified for this measurement class if the fast-width upper bound remains finite/noncontracting as repeat count and independent readout coverage increase.

## New sandbox conjecture

The stable mass partition with unstable internal width suggests that finite-core measurements may naturally identify **sector weights before sector morphology**. In a layered H(s)H architecture, bulk/support/boundary/readout components could therefore be observable first as integrated constitutive weights, with their internal carrier geometry requiring an orthogonal aperture or frequency sweep. This is a new `GEN/CANDIDATE` conjecture, not a source claim.

## Exact next dependency

Ravel/Meridian: add one orthogonal frequency-sweep observable to the same synthetic fixture, hold the 50 seeds and six grids fixed, and test whether the fast-sector 97.5% log-width bound contracts under joint radius–frequency inference. Do not increase model complexity unless that added information still fails.
