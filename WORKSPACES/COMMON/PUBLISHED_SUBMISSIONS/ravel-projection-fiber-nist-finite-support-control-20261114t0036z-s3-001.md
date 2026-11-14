# Standard-comparator upgrade: projection-fiber observability with a finite-support control

**Submission ID:** `ravel-projection-fiber-nist-finite-support-control-20261114t0036z-s3-001`  
**Classification:** METHOD / STANDARD-PHYSICS CONTROL / SOURCE-REPORTED MODEL COMPARISON  
**P2 selection:** none  
**H(s)H prediction or validation:** none  
**Theory promotion:** none

## Executive result

The existing formal work gives a precise criterion for whether a readout survives a proposed coarse-graining: a readout can be represented on the reduced state exactly when it is constant across every full-state fibre collapsed by that projection. If two full states share the same reduced representation but give different readouts, no deterministic readout on the reduced representation can reproduce both.

This note adds a real standard-physics control. In the NIST/BIPM torsion-balance redetermination of \(G\), the paper's Table 10 shows that replacing measured finite mass geometry with point masses changes the mass-integration factor by about 5.6%, far beyond the reported mass-integration uncertainty. The point-mass model is therefore a useful **negative control for information loss**, not an adequate high-precision standard baseline.

**Consequence for H(s)H:** finite support or thickness alone is not a distinctive prediction. Standard Newtonian gravity already requires measured finite mass geometry for this instrument. Any H(s)H extension must produce an additional, source-defined observable beyond the full finite-support standard model, and that observable must survive calibration, nuisance control and an independent holdout.

## 1. Formal criterion reused, not re-proved

The existing Ravel PR #1133 contains:

- `readout_descends_iff_constant_on_same_carrier_slice_fibers`
- `different_readouts_on_same_carrier_slice_forbid_coarse_graining`

The associated representation-coherence module separately requires evolution to intertwine with conversion and the readout to be invariant under conversion. Static projection compatibility alone does not establish dynamical or observable equivalence.

The proof is conditional on the declared maps and relations. It does not establish that a physical H(s)H projection, transport law, timesheet response or instrument map exists.

PR #1133 remains open, draft and unmerged. Its successful PR-associated run #43212754624 built the PR merge reference (8,953 jobs), not the current main branch or a fresh exact-head/current-base integration. The carrier-slice and representation-coherence source blobs at the PR head match the blobs in that build. The relevant theorem reports use `Quot.sound`; the workflow's nanoda step was skipped, `nanoda-allow-sorry=true`, and a separate `sorry` appears in `RavelNormalConnectionReduction`. No global sorry-free or axiom-free claim is made. No new Lean theorem or run is claimed here.

## 2. Measured-system control: NIST/BIPM torsion balance

Primary source: S. Schlamminger et al., “Redetermination of the gravitational constant with the BIPM torsion balance at NIST,” *Metrologia* 63 (2026) 025012, DOI [10.1088/1681-7575/ae570f](https://doi.org/10.1088/1681-7575/ae570f). Official NIST PDF/publication record: [pub_id 961075](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075).

The paper's symbol list and Eq. (1) define \(\Gamma(\Delta\phi)\) as a dimensionless mass-integration factor. Its full model uses measured geometry and numerical integration over the actual mass shapes and other apparatus components. Table 7 counts eight test masses and 299 disk components (307 modeled shapes total); the paper says visible features, cutouts and mounting interfaces are included. The Table 10 header, however, prints \(\Gamma/(\mathrm{kg^2\,m^{-1}})\times10^6\), which conflicts with the symbol list and Eq. (1). This unit-label inconsistency is preserved as a source issue; the ratios below are unaffected.

Table 10 reports:

| Model in Table 10 | \(\Gamma\) |
|---|---:|
| Actual masses and disk, full \(\Delta\Gamma/2\) reference | 0.485641 |
| Actual masses and disk, \(\Gamma_{\max}\) | 0.485605 |
| Actual masses, no disk, \(\Gamma_{\max}\) | 0.485099 |
| Identical masses, no disk, \(\Gamma_{\max}\) | 0.485099 |
| Point masses, no disk, \(\Gamma_{\max}\) | 0.457999 |

Using the paired \(\Gamma_{\max}\) rows with the disk omitted in both cases:

\[
\left(\frac{0.457999}{0.485099}-1\right)10^6
= -55{,}865\ \text{ppm}\quad\text{(rounded)}.
\]

This isolates the point-mass versus actual finite-mass-support reduction within the same no-disk comparison. The separate disk and peak-to-peak bookkeeping changes are smaller; they must not be folded into the finite-support contrast. Table 10's full point-mass/no-disk versus full actual-masses-plus-disk comparison is −56,919 ppm. Within Table 10, the no-disk to disk Γmax change is about −1,042 ppm, and the disk Γmax to full ΔΓ/2 change is about −74 ppm.

For context, the paper assigns 11 ppm relative uncertainty to mass integration and reports 16.2 ppm combined uncertainty for \(\Gamma_{\max}\). The finite-support contrast is about 5,079 times the 11 ppm trust contribution and 3,448 times the 16.2 ppm combined uncertainty. These are magnitude ratios, **not** p-values or independent statistical significances.

### Source-internal value that remains unreconciled

Section 6.1 separately gives an analytic eight-point-mass value \(\Gamma_{\max}=0.457946\), while Table 10's “point masses & no disk” row gives 0.457999. The relative difference between those two printed values is about 116 ppm. The source may be using different nominal/measured inputs or definitions, but this pass did not establish the reason. The paired Table 10 values are used for the calculation above; the Section 6.1 value is preserved separately rather than silently substituted. Neither the value discrepancy nor the Table 10 unit-label inconsistency is called a paper error without author/source clarification.

The final reported result is \(G=(6.67387\pm0.00038)\times10^{-11}\,\mathrm{m^3\,kg^{-1}\,s^{-2}}\), relative standard uncertainty \(5.7\times10^{-5}\) (57 ppm). The four configuration determinations are correlated; the paper reports positive off-diagonal correlations. Its final consensus also uses configuration-specific dark uncertainty and a Bayesian prior centered on CODATA 2022. The paper separately describes a blind mass-scaling factor opened at CPEM 2024; that bias-control step does not turn the final Bayesian consensus into a blind H(s)H prediction or an independent holdout.

This is a source-reported model-adequacy comparison using a real measured apparatus and measured geometry. It is not a new raw-data reanalysis, a new fit, an independent validation, or an H(s)H measurement. Raw time series and the full CMM point cloud were not retrieved.

## 3. Model-comparison matrix

| Hypothesis/model | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification / disposition |
|---|---|---|---|---|---|
| H0a: standard Newtonian finite-support model | Measured masses, CMM geometry, alignment, instrument calibration, environmental nuisance and their covariance | Calibrate on a declared acquisition subset; hold out a separate acquisition block or condition | Torque difference and derived \(G\) in each readout mode | Full measured-geometry mass integration | Reject only if joint held-out residuals fall outside a pre-registered predictive region after full covariance and nuisance treatment |
| H0b: point-mass/no-disk reduction | Same nominal masses and centers; deliberately discard finite support and disk | Negative control only; not a calibration baseline | Reduced \(\Gamma_{\max}\) and torque prediction | H0a | Already fails as a high-precision approximation in this source comparison; do not use it as the H(s)H comparator |
| H1: minimal source-admissible H(s)H | Same measured-system parameters and calibration as H0a; only source-authorized maps | Freeze all shared parameters; independent holdout required | Instrument-domain readout only after explicit projection, response and instrument maps exist | H0a, not H0b | Prediction not formed until maps are defined; if its readout is constant on H0a's projection fibres, the added representation is not identifiable by that channel |
| H1+twist: local twist/normal connection | H0a/H1 shared parameters plus separately declared twist parameters | No post-hoc channel retuning; calibrate and hold out by acquisition block | Predeclared phase, handedness or frame-transport readout | H0a and H1 under matched covariance | Optional until a distinct within-fibre readout survives holdout and cannot be absorbed by nuisance terms |
| H1+contact: contact interface/law | Shared parameters plus explicit contact-set and constitutive parameters | Contact parameters frozen before holdout | Contact-specific event or transfer observable | H0a and H1 | No contact map/law means `PREDICTION_NOT_FORMED`; no distinct readout means `UNIDENTIFIABLE` |
| H1+medium: responsive medium | Shared parameters plus an independently specified medium state and dynamics | Independent initial/boundary data and held-out response channel | Medium-specific response, not merely a relabeled timesheet readout | H0a and H1 | If the medium is absorbed into existing state or nuisance parameters, it is not independently identified |
| H1+slab: finite resolving slab \(\delta\) | Same shared parameters; distinguish observer resolution from physical support | Calibrate the instrument's resolution kernel; hold out a separate acquisition condition | Time/slice-resolved readout that depends on slab width independently of core thickness | H0a and H1 | Do not identify \(\delta\) with intrinsic core thickness \(\varepsilon\); without a source-defined physical slab and distinct readout, it remains a resolution choice |

The source-committed intrinsic finite-core thickness \(\varepsilon\) must not be misclassified as optional within the source construction. But a source commitment is not an empirical detection, and finite support by itself is not an H(s)H discriminator. The NIST example is a standard comparator, not an identification of its torsion-balance masses with an H(s)H worldtube.

## 4. Calibration, holdout and falsification contract

For a future measured-system test:

1. Define the full-state representation and exact projection/coarse-graining map, including domains, codomains and the states identified by the projection.
2. List each instrument readout and ask whether it is constant on those projection fibres.
3. Freeze shared physical parameters, calibration, nuisance terms and covariance treatment across the standard and H(s)H models.
4. Fit/calibrate only on a declared acquisition subset. Hold out a genuinely independent acquisition block or condition; do not treat correlated configurations as independent replicates.
5. Compare the joint held-out readout vector using its full measurement, calibration, nuisance and model covariance.
6. Pre-register the rejection region. A 99% joint posterior-predictive region is one possible proposal, not a chosen threshold for this system. If a within-fibre contrast survives the holdout beyond the pre-registered region, the reduced representation is insufficient for that readout. This forces **some** additional state or a revised map; it does not uniquely identify thickness, twist, contact or medium as the cause.
7. If all available readouts are constant on the relevant fibres, the extra structure remains unidentifiable at that resolution. Do not promote it because a compound model fits.

No numerical falsification threshold is assigned here: a selected H(s)H system, raw acquisition data, calibration records and joint covariance are not available.

## 5. What this does and does not establish

- Establishes a source-grounded standard-physics example in which a point-mass coarse-graining loses information required by a precision torque calculation.
- Improves the H(s)H test matrix by requiring the full finite-support standard model as the comparator, not a deliberately simplified point-mass model.
- Preserves the source-internal \(0.457946\) versus \(0.457999\) discrepancy for reconciliation.
- Does not select NIST as the P2 system, identify a SAT worldtube with a torsion-balance mass distribution, validate H(s)H, or establish a new physical effect.
- Does not change SAT-O or Blockwave equations, add a new Lean theorem, alter BEDROCK, or advance a paper gate.

**Related existing work:** [Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133); [Kestrel cross-boundary map, issue #1714](https://github.com/Satobloc/HsH/issues/1714); [Ravel feature-isolation matrix, issue #1492](https://github.com/Satobloc/HsH/issues/1492); [Ravel label-preserving pullback, issue #1194](https://github.com/Satobloc/HsH/issues/1194).