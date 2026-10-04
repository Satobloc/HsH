# Ravel sandbox — systematic calibration-to-test drift

**Status:** sandbox / conditional numerical discriminator; not canonical H(s)H.  
**Question:** How much systematic test-time detector drift can the frozen five-bin finite-core discriminator tolerate before its clustered 95% risk envelope reaches 5%?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT Mark V/SATv ACTUAL ANSWERS.txt` — **full sequential read**. Source fact used: the archive explicitly treats environmental and long-term instrumental drift, calibration drift, and reduction-pipeline differences as measurement systematics. Its historical numerical claims and physical interpretations were not imported.
2. `Satobloc/HsH/WORKSPACES/MERIDIAN/SANDBOX/RUN_063_CONNECTION_DECODER_AND_PARITY.md` — **full sequential read**. Source fact used: a native connection readout can be well conditioned while reconstruction through noisy point-curve data can reintroduce conditioning; true information loss must be separated from numerical readout failure.
3. Google Drive, `PLAYGROUND 001 — Old SAT Math Rebuild and H(s)H Bridges — 2026-10-01` — **full sequential read after the independent calculation**. Cross-check used: intrinsic carrier geometry and projection/readout geometry must not contaminate one another.
4. Slack `#all-hsh-working-group-one`, four recent calibration/readout messages — **targeted read after the independent calculation**. Used only to verify continuity with the frozen five-bin and joint-nuisance packets.

## Typed construction

- **Geometry:** latent five-bin probabilities `q_F(u,rho)` for candidate family `F in {B3,S2}`.
- **Calibration channel:** nominal row-stochastic `K0`, independently estimated with `m=2500` labelled events per true bin as `Khat_ij=(n_ij+1/2)/(m+5/2)`.
- **Systematic test-time drift:** a row-stochastic post-channel `D(d)` acting only after the calibrated detector,

  `K_test(d) = K0 D(d)`.

- **Decoder:** unchanged offset/scale-profiled GLRT with frozen threshold `t=-0.7990585579482143` and `N=192` test events.

Thus no geometry parameter is allowed to absorb detector drift.

Three drift families were compared:

1. symmetric adjacent blur: interior reported bins move left/right with probability `d/2` each;
2. coherent `+bin` drift: every nonterminal reported bin moves one bin right with probability `d`;
3. coherent `-bin` drift: mirror of the preceding map.

The two mirror critical cells per hypothesis were frozen from the prior dense audit. A common-random-number calculation with 200 independently sampled calibration matrices and 100 paired test repetitions per cell estimates only the drift-induced error increment. That increment is conservatively added to the independent 100,000-trial nominal bounds:

- B3 mean/U95 = 0.04303 / 0.0442990;
- S2 mean/U95 = 0.04469 / 0.0461293.

## Result

Interpolated first crossings of the 5% clustered risk envelope:

| post-channel family | crossing `d*` | percent |
|---|---:|---:|
| symmetric adjacent blur | 0.00113265 | 0.1133% |
| coherent +bin | 0.00058834 | 0.0588% |
| coherent -bin | 0.00047515 | 0.0475% |

The limiting candidate is S2 at `rho=0.984` and an offset endpoint whose sign follows the coherent drift. B3 remains below 5% through the crossing region. Directional asymmetry between `+` and `-` is a finite Monte Carlo / sampled-`Khat` residual; the mirror-symmetric model predicts equal ensemble limits, so the conservative coherent requirement is

`d_coherent < 4.75e-4` per event (about 0.0475%).

For symmetric added blur the corresponding conditional requirement is

`d_diffuse < 1.13e-3` per event (about 0.113%).

These are readout-stability requirements, not intrinsic finite-core invariants.

## Candidate comparison and sandbox inference

The same drift leaves the bulk B3 likelihood comparatively stable but rapidly increases S2 false acceptance/rejection risk at the support boundary. Sandbox inference: boundary-only carriers place more discriminating information in edge-bin transport, so coherent calibration drift is roughly twice as damaging as symmetric extra blur. This does not identify a physical particle or establish B3 as the true core.

## Failure and falsification

The packet fails if measured calibration-to-test drift exceeds the stated structured-family limit, if an empirical drift operator is not representable by these one-step channels, if a dense remesh relocates the worst nuisance cell, or if an independent high-power rerun moves a crossing materially. The result is not a general total-variation robustness theorem.

## Tight prediction / solver test

Blindly inject known post-calibration bin drift while holding geometry and calibration fixed. The S2 critical-cell error should rise first; the 5% clustered envelope should be crossed near 0.05% for coherent signed drift and near 0.11% for symmetric blur. B3 should remain subcritical at those points. A contrary ordering falsifies this frozen packet.

## Exact next dependency

Measure one empirical `K_cal` and one temporally separated `K_test`; compute `D_emp` (or establish that no row-stochastic post-factor exists), then rerun the paired audit with the empirical operator and a dense nuisance mesh.

Artifacts: `five_bin_systematic_drift_audit.py`, `five_bin_systematic_drift_audit.json`, `five_bin_systematic_drift_audit.svg`, `five_bin_systematic_drift_audit.png`.
