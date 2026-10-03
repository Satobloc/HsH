# Ravel sandbox checkpoint: causal-zero calibration and native-support atomicity

**Status:** Conditional readout-identifiability result in a siloed sandbox. It is neither canonical H(s)H theory nor a physical prediction.

## Exact bounded question

Does the previously observed native-support two-timescale atomicity survive when the measurement numerator contains one causal instrumental zero whose time constant is estimated anew in every repeat from known-load probes?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT THEORY — Superhelicalism.txt` — **full sequential read**. Retained source fact: naïve transfer across scale can silently change filament/bundle material response, spacing, tension, and bending. Its historical battery, centrifuge, and gravity proposals were not used as mechanisms or targets.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md` — **full sequential read**. Retained source fact: two independent readout signatures can separate support parameters that a single composite observable conflates. The document's local model is sandbox geometry, not physical law.

Targeted connected-corpus searches found no independent prior causal-zero construction. A Slack hit was the immediately preceding Ravel checkpoint defining this run's dependency; a Drive search for an instrumental-zero calibration artifact returned no result.

## Source / inference / conjecture boundary

- **Source fact:** scale transfer requires explicit recalibration of hidden response; independently identified signatures are preferable to one conflated readout.
- **Inference:** a measured relaxation spectrum cannot be called geometric until numerator phase slope is separately calibrated from the denominator-bearing response.
- **New sandbox construction:** represent the smallest omitted readout dynamics by one stable causal zero, fit it only from known loads, propagate its uncertainty repeat by repeat, and retest spectral atomicity without adding any constitutive mode.

## Construction

Use the measured transfer

\[
H(z;a,\nu)=\frac{N(z;a,\nu)}{D(z;a,\nu)},\qquad
N(z;a,\nu)=G(a,\nu)(1-i z\tau_N),
\]

with

\[
G(a,\nu)=\exp(c_0+c_a\log a+c_\nu\log\nu).
\]

For a known-load calibration probe,

\[
Y(\omega)=H_{\mathrm{cal}}(\omega)D_{\mathrm{cal}}(\omega)
=G(a,\nu)(1-i\omega\tau_N).
\]

Therefore `Re(Y)` identifies the positive gain and `Im(Y)` identifies the common phase slope. The coefficients and `tau_N` are estimated separately in each repeat, so calibration uncertainty enters the corrected residue rather than being fixed post hoc.

Protocol: 50 seeds (`740000`–`740049`), 192 repeats per seed, 41 radii, `nu={0.65,1,1.55}`, relative complex noise `3e-4`, native support `[0.04,12]`, and 25/49/97 log-spaced bins. Known-load probes use `beta={0.45,1.65}`, `omega=beta*nu/a`, and `D_cal=(nu/a)^2-omega^2`. Posthoc fixture truth is `(c0,ca,cnu)=(0.18,0.35,-0.22)` and `tau_N=0.40`; these values were not selected from an observable target.

## Candidate comparison

| Readout candidate | Information retained | Result |
|---|---|---|
| Full complex zero calibration | Gain plus frequency-linear phase slope | Numerator relative-error median `2.33e-4`; global maximum `1.61e-3`; native atomicity survives |
| Gain-only tare | Gain only | Leaves exact multiplicative error `N/G-1=-i\omega\tau_N`; maximum contamination ranges from `1.17` to `10.23` across probes |

The gain-only representation is therefore not equivalent to the causal-zero representation: it is a projection that discards an independently identifiable phase degree of freedom.

## Numerical discriminator

| Bins | Fast centroid | Slow centroid | Fast mass | Median fast log-width | U95 fast log-width | Endpoint mass |
|---:|---:|---:|---:|---:|---:|---:|
| 25 | 0.23150 | 1.94910 | 0.58413 | 0.11578 | 0.11706 | 0 |
| 49 | 0.24840 | 1.99552 | 0.59879 | 0.05781 | 0.05844 | 0 |
| 97 | 0.24937 | 1.99809 | 0.59945 | 0.02760 | 0.03681 | 0 |

Both the median and upper-95% fast-sector widths contract under grid refinement, while endpoint leakage remains zero. The surviving residual is thus a native-support pair of atomic timescales after explicit causal-zero marginalization. It is a property of this inverse problem and fixture, not yet an interval-invariant physical object.

## Failure condition and exact next dependency

Failure occurs if the unchanged expanded support `[0.01,48]` restores noncontracting U95 width or endpoint leakage after the same per-repeat zero calibration. The calibration also fails physically if known-load and live measurements do not share the same numerator transfer.

**Next dependency:** run only the expanded-support 25/49/97 grids with the same 50 seeds and calibrated zero. Add no further readout factor or material mode.

## Prediction status

No physical prediction is earned. The test produces a falsifiable solver discriminator: expanded-support U95 contraction with zero endpoint leakage is required before calling the atomicity interval-robust.
