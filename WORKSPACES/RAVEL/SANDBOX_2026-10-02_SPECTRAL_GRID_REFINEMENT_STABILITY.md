# Ravel sandbox checkpoint — spectral grid-refinement stability

**Status:** `GEN/CANDIDATE`; synthetic inverse-problem benchmark, not canonical SAT/H(s)H and not an empirical particle identification.

## Narrow question

Does the positive nonparametric relaxation spectrum found at 192 repeats converge to two grid-independent atoms when (i) the log-time grid is refined from 25 to 49 to 97 bins and (ii) the allowed time interval is expanded fourfold at both ends?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT 2026 HARD METHOD.txt` — **full sequential read** (single short file). Source fact retained: conventions and rescue factors may not repair a mismatch; calculations must be rebuilt and failure reported. No historical constant, lattice, mass rule, or particle label was imported.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_105_EXACT_FINITE_SLAB_FOLD_UNIQUENESS.md` — **full sequential read**. Source fact retained: a forward geometry can have two inverse branches around a fold, so a two-component inverse fit is not by itself a two-object physical identification.
3. Google Drive search for `spectral grid refinement relaxation centroid` — **indexed search**, no result.
4. Slack `#all-hsh-working-group-one` search for `spectral refinement` — **targeted read** of the immediately preceding spectrum checkpoints; no independent prior grid-refinement result found.

## Translation into current H(s)H language

The candidate object is not a pair of particles. It is a positive measure over relaxation times in a finite-core readout kernel,

\[
K(z;a)=\int \frac{d\mu_a(\tau)}{1-i z\tau},\qquad d\mu_a\ge 0.
\]

A discrete two-channel carrier is the special case

\[
d\mu_a(\tau)=a^q\bigl(A_1\delta(\tau-\tau_1)+A_2\delta(\tau-\tau_2)\bigr)d\tau.
\]

A continuous or layered finite core can instead produce a broad positive measure. The readout alone must discriminate them.

## Construction

The same 192-repeat synthetic complex-pole dataset, estimated covariance, three outer folds, and two-fold inner selection were reused for every grid. The inversion received no injected time, amplitude, or exponent.

On a uniform grid in \(x=\log\tau\), spacing \(h\), the continuum roughness is

\[
\mathcal R[u]=\lambda\int (u''(x))^2\,dx.
\]

Since \(u''(x_j)\approx(D_2u)_j/h^2\) and \(dx\approx h\), the grid-consistent discrete penalty is

\[
\boxed{\mathcal R_h[u]=\lambda h^{-3}\lVert D_2u\rVert_2^2.}
\]

This scaling is essential: using \(\lambda\lVert D_2u\rVert^2\) would silently weaken the same nominal prior as the grid is refined.

After each full-data fit, two clusters were summarized blindly by deterministic weighted 1-D k-means in \(\log\tau\). Only after centroids, masses, log-widths, endpoint mass, and held-out likelihoods were frozen were the injected values \((0.25,2.0)\) revealed.

## Results

| interval | bins | selected \(\lambda\) | blind centroids | cluster masses | log-widths | endpoint mass | \(\sum\Delta\mathrm{NLL}\), spectrum − two-pole |
|---|---:|---:|---|---|---|---:|---:|
| [0.04,12] | 25 | 0.01 | 0.2078, 2.0569 | 0.5894, 0.4106 | 0.4989, 0.1597 | 0.0086 | 95.8076 |
| [0.04,12] | 49 | 0.0001 | 0.1977, 2.0964 | 0.6002, 0.3998 | 0.7136, 0.0947 | 0.0534 | 82.9810 |
| [0.04,12] | 97 | 1 | 0.2057, 2.0061 | 0.5789, 0.4211 | 0.3594, 0.2057 | 0.0019 | 9.5250 |
| [0.01,48] | 25 | 0 | 0.2455, 2.0100 | 0.5986, 0.4014 | 0.0854, 0.0441 | ~0 | 4.9544 |
| [0.01,48] | 49 | 0.01 | 0.2517, 2.0502 | 0.6025, 0.3975 | 0.1666, 0.0619 | ~0 | 3.9598 |
| [0.01,48] | 97 | 0.01 | 0.1868, 2.0646 | 0.5969, 0.4031 | 0.9846, 0.0983 | 0.0556 | 12.2464 |

Foldwise \(\Delta\mathrm{NLL}\) remained positive except for one wide/25 fold (−0.0633). The second centroid stayed within 4.8% of the post hoc injected 2.0 in all six fits. The cluster masses stayed near 0.60/0.40, matching the post hoc normalized injected amplitudes. The first centroid was accurate on the coarse wide grids but shifted to 0.1868 at wide/97, with log-width 0.9846 and 5.56% endpoint mass.

## Surviving residual and failure

**Survives:** two separated mass clusters, their approximately 0.60/0.40 integrated weights, \(q=2.4\), and the slow centroid near 2 are representation-stable across these grids.

**Fails:** physical width does not contract monotonically with \(h\), the fast centroid is not interval/grid invariant, and inner selection is discontinuous. On the base grids the third outer fold selected \(\lambda=(100,100,1)\), producing most of the large held-out penalty; the other folds selected 0.01. The current finite lambda grid and foldwise point selection therefore confound spectrum shape with regularization instability.

Consequently the previous “approximately two-atomic” reading is not yet frozen. The evidence supports a robust slow cluster and integrated two-cluster partition, but not a grid-invariant atomic fast channel.

## Prediction / proposed discriminator

No empirical prediction is earned. The tight next solver test is fully specified:

1. use the same six grid/interval configurations;
2. replace point selection of \(\lambda\) by integration or stacking over a dense \(\log\lambda\) path;
3. run at least 50 independent repeat ensembles at \(R=192\);
4. report centroid, integrated mass, physical log-width, endpoint mass, and held-out NLL distributions before revealing the injected times;
5. declare an atomic channel only if its 95% upper width bound decreases with \(h\) while centroid and integrated mass remain stable under interval expansion.

**Falsification condition:** if the fast-cluster width or endpoint mass remains nonconvergent after lambda-path marginalization and seed replication, pole-only data do not identify a discrete fast channel under this readout.

## Sandbox conjecture

Conditional on later replication, the stable 0.60/0.40 mass split with an unstable fast width could indicate a layered architecture: one well-resolved slow bulk/support relaxation plus a fast boundary/readout sector that the present radius sweep sees only as an integrated weight. This is a new conjecture, not a source claim.

## Exact next dependency

Ravel/Meridian: implement lambda-path stacking on a dense \(\log\lambda\in[-8,4]\) grid and a 50-seed ensemble for the six configurations above; report whether the fast cluster's width and endpoint leakage converge without using the injected times.
