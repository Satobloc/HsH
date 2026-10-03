# Ravel sandbox checkpoint — pole-residue spectral identifiability

Status: **sandbox result, not canonical H(s)H theory**

## Exact question

Does a second readout from the same finite-core/worldtube response—the complex residue of each damped pole—remove the relaxation-spectrum width ambiguity left by pole locations alone, without adding a new relaxation component?

## Sources actually consulted

### SAT archive

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT QR/SATPatch.txt`
- Coverage: full fetch and substantial sequential read.
- Retained source fact: the archive distinguishes a mode/response amplitude from a mode location and repeatedly treats an explicit solver/experiment readout as necessary.
- Rejected as controlling input: its historical numerical phase claims, lattice and Z3 constructions, completion language, and internally inconsistent numerical outputs. No archived constant or particle label entered this construction.

### H(s)H

- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/RUN_143_LAG_CONDITIONED_RECURRENCE_DISCRIMINANT.md`
- Coverage: full sequential read.
- Retained source fact: an independently chosen conditioning/readout variable can change algebraic separability; the document's lag discriminant collapses as \(\tau^4\) at small lag. The methodological control used here is that residue is specified before inversion and is not tuned after seeing recovery.

### Connected-team search

- Google Drive search: `H(s)H pole residue spectral readout`; no relevant result, so no Drive content entered the derivation.
- Slack search for `pole` and `residue`: four hits, all from the current Ravel spectral-identifiability lineage; no prior pole-residue solution was found.

## Boundary between source, inference, and conjecture

- **Source fact:** SAT historical material treats response amplitude/readout as distinct from mode position; the H(s)H recurrence note shows why an independent, preregistered conditioning observable can restore rank.
- **Inference:** for a causal finite-core response, pole residue is the lowest-cost observable already carried by the same transfer function and should be tested before adding constitutive structure.
- **New sandbox construction:** use joint pole locations and calibrated unit-forcing residues to invert the positive relaxation measure, keeping the previous fixture, seeds, grids, roughness path, and evidence averaging unchanged.

## Construction

The response denominator is

\[
D(z;a,\nu)=\left(\frac{\nu}{a}\right)^2-z^2
-iz\,a^q\int\frac{d\mu(\tau)}{1-iz\tau}.
\]

For unit forcing, \(\chi(z)=1/D(z)\). At a simple pole \(z_p\),

\[
\mathcal R_p=\operatorname*{Res}_{z=z_p}\chi(z)=\frac{1}{D'(z_p)}.
\]

Differentiating the same constitutive kernel gives the exact identity

\[
-\mathcal R_p^{-1}-2z_p
= i a^q\int\frac{d\mu(\tau)}{(1-iz_p\tau)^2}.
\]

The pole-location equation supplies one real closure equation after eliminating the unknown real bare frequency:

\[
\Im\left[z_p^2+i z_p a^q\int\frac{d\mu(\tau)}{1-iz_p\tau}\right]=0.
\]

The residue identity supplies two additional real equations. Location and residue therefore sample distinct first- and second-resolvent kernels without adding a material mode. The implemented identity was numerically verified to maximum absolute error \(5.75\times10^{-15}\) on the noiseless fixture.

## Fixed blinded protocol

- \(q=2.4\), conditioned from the preceding run rather than refit here.
- Carrier multipliers \(\nu=\{0.65,1,1.55\}\).
- 41 radii and 192 repeated readouts per seed.
- Seeds `740000`–`740049`.
- Relative noise \(3\times10^{-4}\) on pole and residue channels, with independent synthetic location/residue readouts.
- Six grids: 25, 49, and 97 log bins on `[0.04,12]` and `[0.01,48]`.
- The same nonnegative inversion, roughness path, cross-validated conditional likelihood, and evidence averaging as the location-only run.

## Candidate comparison

| Readout architecture | Added constitutive DOF | Information supplied | Result |
|---|---:|---|---|
| Pole location only | 0 | first resolvent kernel | noncontracting global width |
| Pole location + calibrated residue | 0 | first and squared-denominator kernels | clean native-interval contraction; rare expanded-interval tails remain |
| Extra relaxation component | 1+ | changes material model | not admitted because the readout-only test has not yet failed |

## Result

Fast-component width (median / 95% upper bound):

| Interval | bins | location + residue | location-only comparison |
|---|---:|---:|---:|
| `[0.04,12]` | 25 | 0.1162 / 0.1173 | — |
| `[0.04,12]` | 49 | 0.0577 / 0.0584 | — |
| `[0.04,12]` | 97 | 0.0273 / 0.0322 | — |
| `[0.01,48]` | 25 | 0.1050 / 0.1065 | 0.2855 U95 |
| `[0.01,48]` | 49 | 0.0728 / 0.0990 | 0.4514 U95 |
| `[0.01,48]` | 97 | 0.0464 / 0.1885 | 0.5471 U95 |

On the native interval, the upper bound contracts strongly with grid refinement and endpoint leakage remains zero: this is the first clean atomicity pass in this lineage. On the fourfold-expanded interval, median widths still contract and are far below the location-only baseline, but rare seeds place small mass at interval endpoints. At 97 bins, endpoint-mass U95 is 0.00621 and fast-width U95 rebounds to 0.1885. The result therefore does **not** establish interval-robust atomicity.

The blind centroids converge near 0.2496 and 2.0000 with mass split near 0.600/0.400; only after inference were the fixture values revealed as 0.25, 2.0 and 0.6/0.4.

## Surviving residual and failure condition

The earliest unsupported edge is readout calibration. A measured transfer function generally has

\[
H(z)=\frac{N(a,\nu,z)}{D(z)},\qquad
\widetilde{\mathcal R}_p=\frac{N(a,\nu,z_p)}{D'(z_p)}.
\]

The present residue identity is usable only when the forcing/readout numerator \(N\) is known or independently calibrated. An unconstrained numerator can absorb constitutive information.

**Failure condition:** if an admissible low-complexity numerator family fits the same joint observations while restoring noncontracting widths or endpoint leakage under refinement, residue-based atomicity is a readout artifact rather than a property of the finite core.

## Prediction status

No physical prediction is earned. The result is an identifiability discriminator conditional on calibrated forcing and readout.

## Exact next dependency

Introduce the preregistered separable numerator

\[
N(a,\nu)=\exp(c_0+c_a\log a+c_\nu\log\nu),
\]

constrain its three coefficients with two off-resonance complex response samples per channel, marginalize that calibration uncertainty, and rerun the identical 50 seeds and six grids. Atomicity survives only if native-interval contraction and the improvement over location-only inversion remain after numerator uncertainty. Do not add a relaxation component before this test.

## Artifacts

- Solver: `spectral_joint_location_residue.py`
- Compact summary: `spectral_joint_location_residue_summary.json`
- Figure: `spectral_joint_location_residue.svg`

