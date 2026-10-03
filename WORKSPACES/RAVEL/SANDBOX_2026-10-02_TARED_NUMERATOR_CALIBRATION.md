# Ravel sandbox checkpoint — tared transfer-numerator calibration

Status: **sandbox identifiability result, not canonical H(s)H theory**

## Exact question

Does the residue-based relaxation-spectrum discriminator survive when the measured transfer function has a non-unit, radius- and carrier-dependent numerator that must be calibrated rather than supplied?

## Sources actually consulted

### SAT archive

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/HOMESTRETCH/HOMESTRETCH.txt`
- Coverage: full sequential read in three contiguous chunks (43,853 characters).
- Retained source fact: the tentative source requires the analytical instrument to be tared against a declared baseline before interpreting residuals, and it explicitly asks that SAT metaphors be translated into calculational or standard-physics language.
- Rejected as controlling input: its fixed vacuum-effort number, lattice, named angular constants, mass gears, particle assignments, and generated claims of deterministic superiority.

### H(s)H

- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/COMPLEX_RESONANCES.txt`
- Coverage: full sequential read (7,312 characters).
- Retained source fact: the code explicitly distinguishes a moving filament trace from a fixed-slice trace and gives the two readouts separate histories.
- Status: solver/visualization genealogy, not a derived H(s)H law. It supplied the typing discipline—modeled motion and fixed readout are different maps—not the numerator model or numerical result.

### Connected-team search

- Google Drive search: `H(s)H calibrated residue transfer numerator off-resonance`; no relevant result.
- Slack search in the Ravel channel for `off-resonance`, `numerator`, and `calibration`; no prior construction found.

## Source / inference / conjecture boundary

- **Source:** tare the analytical instrument; distinguish moving and fixed-slice traces.
- **Inference:** the residue readout must be factored into constitutive denominator and calibrated numerator before it can constrain the worldtube response.
- **New sandbox construction:** a positive separable numerator calibrated against a known-load reference in every repeat, followed by the unchanged six-grid positive-spectrum inversion.

## Construction

The measured transfer function is

\[
H(z;a,\nu)=\frac{N(a,\nu)}{D(z;a,\nu)},
\qquad
N(a,\nu)=\exp(c_0+c_a\log a+c_\nu\log\nu).
\]

At a simple pole,

\[
\widetilde{\mathcal R}_p
=\frac{N(a,\nu)}{D'(z_p)}
=N(a,\nu)\mathcal R_p.
\]

Two off-resonance samples per \((a,\nu)\) are taken against a tared reference state with known denominator

\[
D_{\rm cal}(\omega;a,\nu)=\left(\frac{\nu}{a}\right)^2-\omega^2,
\qquad
\omega=\beta\frac{\nu}{a},\quad \beta\in\{0.45,1.65\}.
\]

Thus

\[
N=H_{\rm cal}D_{\rm cal}.
\]

The three gain coefficients are fit separately in each of 192 repeats. Each raw pole residue is divided by that repeat's fitted gain before the joint location–residue covariance is estimated. Calibration uncertainty therefore enters the spectral inversion as correlated readout uncertainty rather than being removed beforehand.

The hidden numerator coefficients, revealed only after fitting, were

\[
(c_0,c_a,c_\nu)=(0.18,0.35,-0.22).
\]

All other controls were unchanged: seeds `740000`–`740049`, 41 radii, carrier multipliers \(\{0.65,1,1.55\}\), relative noise \(3\times10^{-4}\), 192 repeats, six grids, and the same roughness-evidence path.

## Why ordinary live-medium “off-resonance calibration” fails

If calibration is attempted in the live medium while pretending its denominator is the bare one,

\[
H D_0=N\frac{D_0}{D},
\]

not \(N\). The unknown constitutive kernel remains inside the gain estimate. In this fixture, the median contamination is small, \(6.3\times10^{-4}\) to \(2.3\times10^{-3}\), but the maximum across radius is 0.264–0.867, with phase errors up to 0.988 rad. “Off resonance” is therefore not synonymous with “tared.”

## Results

The fitted gain was accurate across the ensemble:

- median pointwise relative error: \(5.23\times10^{-5}\);
- median seedwise 97.5% error: \(1.88\times10^{-4}\);
- maximum across all seeds, repeats, radii, and carriers: \(5.21\times10^{-4}\).

Coefficient-error 95% intervals were

\[
\Delta c_0\in[-5.83,6.21]\times10^{-6},
\]

\[
\Delta c_a\in[-7.18,4.87]\times10^{-6},
\]

\[
\Delta c_\nu\in[-1.86,1.75]\times10^{-5}.
\]

Fast-sector log-width:

| Support | bins | median | U95 | endpoint-mass U95 |
|---|---:|---:|---:|---:|
| `[0.04,12]` | 25 | 0.11593 | 0.11735 | 0 |
| `[0.04,12]` | 49 | 0.05777 | 0.05855 | 0 |
| `[0.04,12]` | 97 | 0.02729 | 0.03468 | 0 |
| `[0.01,48]` | 25 | 0.10521 | 0.10672 | 0 |
| `[0.01,48]` | 49 | 0.07318 | 0.09722 | 0.00316 |
| `[0.01,48]` | 97 | 0.04686 | 0.16246 | 0.00509 |

The native-support atomicity pass survives gain calibration: both median and U95 contract with zero endpoint leakage. The expanded-support median also contracts, but rare boundary tails again make the finest-grid U95 rebound. The numerator tare removes the readout-gain ambiguity; it does not establish interval-robust atomicity.

The earlier unit-numerator ensemble used the same seeds and protocol but a different random-draw order. Small numerical differences between its U95 and this run must therefore be treated as independent-ensemble variation, not as a paired causal improvement.

## Candidate comparison

| Readout treatment | Constitutive information leaked into gain? | Result |
|---|---:|---|
| Unit numerator supplied | no | native pass; expanded-tail failure |
| Separable numerator + known-load tare | no | native pass preserved; expanded-tail failure preserved |
| Live-medium off-resonance samples + bare denominator | yes | not an admissible calibration; errors become order unity at some radii |

## Failure condition

The calibrated-residue claim fails if the numerator cannot be transferred from the tare to the live measurement, or if a low-complexity frequency-dependent numerator/zero can absorb the same squared-resolvent information and restore noncontracting native-support widths.

## Prediction status

No physical prediction is earned. This is a conditional readout-identifiability result.

## Exact next dependency

Replace the frequency-independent numerator by the minimal causal instrumental-zero model

\[
N(z;a,\nu)=
\exp(c_0+c_a\log a+c_\nu\log\nu)(1-iz\tau_N),
\]

calibrate \(\tau_N\) and the three gain coefficients exclusively from the same known-load probes, and rerun the unchanged ensemble. Residue-based atomicity survives only if the native-support width bound still contracts after uncertainty in the instrumental zero is marginalized.

## Artifacts

- Solver: `spectral_calibrated_numerator.py`
- Summary: `spectral_calibrated_numerator_summary.json`
- Class P diagnostic: `spectral_calibrated_numerator.svg`

