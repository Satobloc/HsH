# Ravel sandbox checkpoint — joint offset/scale/confusion audit

**Status:** `STD/DERIVED` conditional numerical audit; `SAT/CANDIDATE` finite-core readout certification. Not canonical H(s)H and not a particle claim.

## Exact question

Does the previous (m=2500) labelled events per true bin calibration design retain (<5\%\) error when offset (u), scale ratio (\rho=\widehat R/R), and the sampled full (5\times5) confusion matrix (\widehat K) are audited together, rather than only at two preselected nuisance cells?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/CORRECTION TO RMS CRITIQUE .txt` — **full sequential read**. Controlling user-authored corrections retained: use standard physics to build the empirically constrained 4D map; extract only geometry-visible candidates; preserve a bidirectional audit trail; return null/open when the map supplies no candidate. No historical constants or particle identities were imported.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_136_CROSSOVER_INVERSE_MAP_IDENTIFIABILITY.md` — **full sequential read**. Retained the exact distinction between identifiable effective variables and an unresolved internal decomposition requiring an independently typed observable. Its quadratic-contact equations were not imported into the five-bin model.
3. Google Drive — **metadata-only targeted searches** for `five bin continuum nuisance calibration` and `offset scale confusion matrix audit`. No relevant construction was found; the unrelated returned spreadsheet was not opened.
4. Slack `#all-hsh-working-group-one` — **targeted post-construction search**. It recovered only the existing five-bin, scale, and calibration lineage; no prior between-cell nuisance audit was found.

## Source fact, inference, new construction

**Source fact:** Nathan's correction makes the empirical map and its audit trail controlling. Run 136 shows how a readout can identify a combined effective variable while leaving its internal decomposition unresolved.

**Inference:** in this classifier, (u), (\rho), and (K) must remain separately typed. Similar changes in reported bin counts do not make them one geometric variable.

**New sandbox construction:** retain the previous five-bin geometry and row-wise calibration,

\[
n_i\sim\operatorname{Multinomial}(m,K_i),\qquad
\widehat K_{ij}=\frac{n_{ij}+1/2}{m+5/2},
\]

with (m=2500). For (H\in\{B^3,S^2\}),

\[
p_{H,j}(u,\rho;\widehat K)
=\sum_i\left[F_H(\rho e_{i+1}-u)-F_H(\rho e_i-u)\right]\widehat K_{ij}.
\]

The GLRT profiles ((u,\rho)) independently under both candidates. A single threshold is frozen from 400 independent calibration matrices × 250 test repetitions at pilot-identified boundary cells. The full audit then evaluates a 25×17 true-nuisance mesh covering

\[
u\in[-0.08,0.08],\qquad \rho\in[0.984,1.016],
\]

while the classifier profiles a separate 31×17 nuisance grid.

## Two-stage audit

### 1. Mesh discovery

Using 240 independent calibration matrices and 40 test repetitions per mesh cell:

| Candidate | Largest mesh mean | Location | Coarse clustered upper |
|---|---:|---:|---:|
| (B^3) | 4.7813% | ((u,\rho)=(0.02667,1.016)) | 5.1981% |
| (S^2) | 4.7083% | ((u,\rho)=(-0.08,0.984)) | 5.1329% |

The upper excursions are dominated by only 40 repetitions within each calibration cluster. They locate boundary cells but are too noisy to certify them.

### 2. Independent boundary confirmation

The discovered boundary cells were frozen, the random stream was reset, and each was tested with 400 independent calibration matrices × 250 repetitions:

| Candidate | Confirmed error | Clustered 95% upper |
|---|---:|---:|
| (B^3) | 4.3030% | 4.4299% |
| (S^2) | 4.4690% | 4.6129% |

Therefore the previous (m=2500) calibration design survives the dense joint mesh and independent boundary confirmation:

\[
\boxed{\max_H \widehat P_{\rm err}=4.469\%,\qquad U_{95}=4.613\%<5\%.}
\]

This repairs the earlier result: (m=2500) is no longer supported only at two hand-selected cells. It is still not an analytic continuum theorem.

## Candidate comparison

| Architecture | Result |
|---|---|
| (B^3\) bulk + latent five-bin measure | Passes declared mesh |
| (S^2\) boundary + latent five-bin measure | Passes declared mesh; worst at offset/scale corner |
| Layered geometry → (K) readout | Naturally contains the calibrated construction |
| Geometry with (K) absorbed into carrier | Rejected as a type error; calibration drift would masquerade as morphology |

The bulk and boundary candidates remain distinguishable because the pushed-forward carrier measures differ. The readout matrix changes the observation channel but is not itself evidence for either carrier.

## Surviving residual

The adversarial risk concentrates on the scale boundaries: large (\rho) for (B^3), small (\rho) with maximal (|u|) for (S^2). No new interior failure basin appeared on the declared mesh. The exact sign and small displacement of the (B^3) worst cell are not treated as invariant; they remain compatible with symmetry plus Monte Carlo variation.

## Failure condition

The result fails if:

1. an analytic or finer adaptive search finds a between-mesh cell with error at least 5%;
2. empirical (K) depends on candidate, (u), (\rho), time, or calibration batch;
3. calibration labels do not reproduce the test-state conditional response;
4. independent scale uncertainty exceeds ±1.6%;
5. the radius estimate is recycled from the same five-bin observations;
6. non-adjacent leakage or specimen-level nuisance drift violates the row-stochastic stationary-channel model.

## Prediction packet

**Conditional equation:** the (p_{H,j}(u,\rho;\widehat K)) law above with (m=2500), (N=192), (|u|\le0.08), and (|\rho-1|\le0.016).

**Observable:** dimensionless composite misclassification rate under a frozen GLRT threshold.

**Prediction:** independent boundary confirmation should remain below 5%; current estimate is 4.469% with clustered 95% upper 4.613%.

**Rival contrast:** binary capture failed near 12.9%; the five-bin carrier-measure readout succeeds without changing the candidate carriers.

**Falsification:** any preregistered empirical or higher-resolution audit satisfying the declared model that yields a clustered 95% lower/upper certification incompatible with the 5% ceiling.

## Exact next dependency

Replace nominal (K) with a genuinely measured labelled matrix and certify between-grid behavior using either an analytic Lipschitz bound for the composite risk or adaptive interval subdivision. Until that step, call this a dense-mesh certification, not a continuum guarantee.

