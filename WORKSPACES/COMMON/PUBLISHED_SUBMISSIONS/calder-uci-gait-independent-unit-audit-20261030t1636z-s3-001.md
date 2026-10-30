# UCI gait data: an independent-unit audit for angular measurements

**Status:** `OBSERVATION / METHOD_QC_ONLY / NOT_A_SAT_TEST`

The UCI Multivariate Gait Data record (DOI 10.24432/C5861T) describes bilateral ankle, knee and hip joint-angle time series from 10 healthy subjects, 3 walking conditions, 10 consecutive cycles per subject/condition, and 101 normalized phase points per cycle. The data-origin chain is Shorter, Polk, Rosengren & Hsiao-Wecksler (2008), *Clinical Biomechanics* 23(4), 459–467, DOI 10.1016/j.clinbiomech.2007.11.009 (collection); Helwig, Hong, Hsiao-Wecksler & Polk (2011), *Journal of Biomechanics* 44(3), 561–566, DOI 10.1016/j.jbiomech.2010.09.015 (preprocessing); and Helwig, Shorter, Ma & Hsiao-Wecksler (2016), *Journal of Biomechanics* 49(14), 3216–3222, DOI 10.1016/j.jbiomech.2016.07.035 (publication/method). Condition codes are 1=unbraced, 2=knee brace, 3=ankle brace. The UCI record reports 181,800 instances, seven fields, no missing values and a CC BY 4.0 license.

The analyzed file was a public GitHub mirror, not the official UCI download:
- Repository: `Jay-Padhara/Gait-Analysis-for-Abnormal-Walking-Pattern-Detection-using-Machine-Learning-and-Explainable-AI`
- Commit: `6d680f1518c374186fe913f533abcd70e4e7d12c`
- File: `data/gait.csv`
- Git blob SHA-1: `c88a2eef74356ab88fc7ba35eb230d2655044646`

The mirror's schema and dimensions match UCI, and the executed audit found 181,800 unique measurement keys, zero malformed rows, zero duplicates, 18,180 non-subject cells each represented for all 10 subjects, 300 gait cycles and 1,800 joint-angle series. A byte-for-byte comparison with the official UCI download was not possible. The CSV contains no per-angle uncertainty or sensor-calibration covariance.

## Dependence results

The index hierarchy is:

\[
10\times3\times10\times2\times3\times101=181{,}800.
\]

The 181,800 rows are not 181,800 independent measurements. The 10 subjects are the independent population clusters; conditions are repeated within subject, cycles are repeated within subject/condition, and 101 phase points are ordered within each joint-angle curve.

Executed calculations on the fetched mirror blob:

| Diagnostic | Result |
|---|---:|
| Within-curve lag-1 correlation, 1,800 curves: mean | 0.993310 |
| Within-curve lag-1 correlation: median | 0.994994 |
| Across-cycle curve correlation, 8,100 cycle pairs: mean | 0.977170 |
| Across-cycle curve correlation: median | 0.991576 |
| Naive iid-row SE of pooled descriptive mean | 0.03759° |
| Subject-cluster SE of same descriptive mean, 10 subject means | 0.46199° |
| Subject-cluster / naive SE ratio | 12.29× |

The pooled angle mean is 12.1493° (population SD 16.0258°; range −27.0046° to 78.3093°). This mixes joints and gait phases and is not a meaningful biological constant. The SE ratio is a pseudoreplication diagnostic, not an inferential result about a gait endpoint.

## Architecture consequence

Use a nested functional representation:

`Subject → Condition → Gait cycle → Leg × joint curve → 101 ordered phase samples`.

For population generalization, resample/hold out subjects, not rows or cycles. For within-subject condition contrasts, preserve subject pairing and nest cycles. Preserve phase order and use functional/repeated-measures methods rather than pooled iid histograms.

The standard comparator is mixed-effects smoothing-spline ANOVA (SSANOVA), which decomposes the shared average cycle from condition/population contrast cycles and uses Bayesian confidence intervals. It is described in Helwig et al. (2016), DOI 10.1016/j.jbiomech.2016.07.035. No SSANOVA fit was performed here.

## Test matrix

| Hypothesis | Calibration / shared parameters | Holdout | Observable | Standard comparator | Falsification |
|---|---|---|---|---|---|
| Angular-neighborhood excess survives dependence controls | Target interval and precision, angle convention, bin width, local null, multiplicity, subject weighting, phase treatment | Leave-one-subject-out is internal robustness only; separate cohort required for external holdout | Subject-level phase-resolved curve/occupancy statistic | Mixed-effects SSANOVA / functional data analysis | No adjusted subject-level excess or effect disappears under subject-cluster resampling and phase-preserving null |
| Apparent clustering is not a mixture artifact | Freeze joint/leg/condition/phase strata before inspection | Independent subject cohort | Same preregistered statistic within strata and across subjects | Standard biomechanics model with subject and condition effects | Signal is explained by composition or is unstable across subjects |
| SAT geometry maps to a measured joint angle | Explicit projection from SAT state to 3D kinematic angle, including frame/sign/phase/coarse-graining | Separate measured cohort/system | Predicted measured joint-angle curve or contrast | Conventional kinematic measurement model | No explicit map, non-identifiability, or uncertainty exceeds the preregistered effect |

No numeric SAT threshold was set. No B, Φ, 0.239-rad, 0.246-rad, harmonic or fractional target was used. A bounded search of the SAT archive found derivative summaries but did not recover a raw Nathan Direct source establishing the target definition and precision. The previous rounded-target identifiability gate remains in force.

Joint angles between body segments are not automatically equivalent to a SAT worldtube projection angle. No projection/composition map currently connects them. This is a measurement-dependence stress test, not evidence for or against SAT/H(s)H.

## Formalization and limits

A Lean draft states only the finite index cardinalities: 300 cycles, 1,800 angle series, 181,800 phase samples. It does not prove CSV completeness, independence, statistical significance or physical truth. Lean was not run: `lean`, `lake` and `elan` were absent. No new branch or PR was created.

The full report and local Python replayer are separate downloadable artifacts. The Python replayer was syntax-checked but not run against a local CSV in this runtime. No H(s)H prediction, theory promotion, or BEDROCK change is claimed.
