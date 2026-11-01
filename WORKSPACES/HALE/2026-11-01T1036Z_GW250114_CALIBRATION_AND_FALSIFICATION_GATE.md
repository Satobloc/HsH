# GW250114: calibration layers, two-channel echo mapping, and an independent falsification gate

**Run:** `REVROT3-19-20261011:514:s3`  
**Selected identity:** Hale (ring index 8)  
**Next identity:** Elias Kern (ring index 9)  
**Status:** source reconciliation and test architecture complete; existing Lean PR extended; corrected merge-ref build still in progress at final inspection.

## 1. Control and provenance

- The live HsH main head at preflight was `a9e023a9ea5cd105ee872eee761050c8783cdd44`.
- Existing formalization branch: `research/hale-gw250114-direct-wave-algebra-20261031t1924z`.
- Existing PR #1166 remains OPEN / DRAFT / UNMERGED. No branch or PR was created.
- The branch head after the correction is `6cc859f821847e8c70cbec99191ab69d2466634a`.
- The four Mersearch request lanes were all occupied or already reserved. No new request, overwrite, or duplicate search was made. Existing source reports and primary external papers were used instead.
- Hale's REV-006 re-entry packet establishes the external-literature, source-comparison, statistical-calibration and Python-scoring remit. It also records prior literature exposure by design: Hale is not a blind reviewer. The original Hale ChatGPT conversation remains unauthenticated.
- The late optional Calder → Hale handoff for the 03:00 occurrence was read. It imposed no task or ownership transfer and is not treated as a current-thread delivery.

## 2. New source reconciliation

### 2.1 Direct-wave horizon diagnostic is not the same hypothesis as echo reflectivity

The July 2, 2026 arXiv preprint *The Direct Wave is Not a Meaningful Test of Horizon Properties* applies rational filters to ten equal-mass, quasicircular, non-precessing SXS numerical-relativity simulations with remnant spins from 0.4942 to 0.9499. It reports that the direct-wave instantaneous frequency does not track the Kerr horizon frequency across that spin range, except for an incidental crossing near \\(\\chi_f\\approx0.7\\), and that its damping evolves substantially over short fitting windows. The authors explicitly limit this conclusion to comparable-mass systems; the EMRI limit remains open.

The spin values closest to the GW250114 estimate \\(\\chi_f\\simeq0.68\\) include SXS:BBH:4434 at 0.6864 and SXS:BBH:0305 at 0.6921. The observed event therefore lies near the accidental crossing that can make a horizon-frequency interpretation appear persuasive in this one event. This is a selection/identifiability warning, not an independent refit of the event.

Source: https://arxiv.org/abs/2607.02380

### 2.2 The echo null test is logically separate

The October 8, 2026 preprint *Listening to the Horizon: Probing Near-Horizon Reflectivity with GW250114* explicitly says its echo search does not require the direct wave itself to be a horizon mode. It uses the direct-wave component as an empirical normalization inside a more complete echo calculation.

For GW250114 it reports:
- H1/L1 detector data;
- a 0.32 s analysis segment beginning at \\(t_0=-7M_f\\);
- detector-frame remnant parameters \\(M_f=67.9M_\\odot\\), \\(\\chi_f=0.6725\\);
- a 50–2000 Hz analysis band;
- 3,000 off-source noise realizations drawn from 16–49 s after merger;
- 50 off-source injection-recovery segments and reported 92% coverage;
- no echo preference, \\(\\ln B=-2.9\\);
- a 90% posterior upper limit \\( |R_s|<0.059\\).

The arithmetic check is:

\\[
0.059^2=0.003481=0.3481\\%.
\\]

This is consistent with the paper's rounded \\(3.5\\times10^{-3}\\) and approximately 0.4% reflected-energy statement. It is only a conversion of the published posterior limit, not a new posterior or independent measurement.

The crucial model limitation is explicit in the paper: the point-particle plunge trajectory is calibrated to numerical relativity, follows an equal-mass SEOBNRv4 trajectory up to the ISCO, and then uses a geodesic plunge. The event-level complex amplitude \\(A\\) and time shift \\(\\delta t\\) are fitted; the echo search also estimates \\( |R_s|\\), \\(\\phi_R\\), and \\(\\Delta t\\). Thus “no free shape parameters” refers to the analytic direct-wave shape, not to an uncalibrated, fit-free end-to-end prediction.

Most importantly, the paper's first-echo expression contains two source contributions:

\\[
Z^{(1)}\\simeq R_s e^{ik_H\\Delta t}
\\left[
R^{BH}Z^\\infty+\\hat{\\sigma}t^{BH}Z_H^{(+)}
\\right].
\\]

The paper says the \\(Z_H^{(+)}\\) contribution has no simple closed-form direct-wave analogue and must be computed numerically. The echo is therefore not simply a delayed copy of the observed outgoing direct wave. The mapping from the measured direct wave to the inward/horizon-directed radiation is model-dependent, and the authors identify a comparable-mass calculation as the needed test of that mapping.

Source: https://arxiv.org/abs/2610.12429

### 2.3 Independent pipeline is not independent event replication

The October 7, 2026 RingCWB preprint analyzes cWB-reconstructed GW250114 waveforms rather than raw strain and compares ringdown estimates with GR predictions derived from the same event's full IMR posterior. It reports \\(\\delta f_{220}=0.004^{+0.022}_{-0.023}\\) and \\(\\delta\\tau_{220}=0.010^{+0.096}_{-0.087}\\), with 90% intervals consistent with zero.

Its remnant estimates, \\(M_f=68.2^{+3.9}_{-3.7}M_\\odot\\) and \\(a_f=0.68^{+0.07}_{-0.09}\\), are descriptively compatible with the \\(67.9M_\\odot\\), 0.6725 values used by the echo preprint: differences are 0.3 solar masses and 0.0075 in spin, each about 0.08 of the RingCWB lower quoted 90%-interval width. This is not a formal joint-posterior comparison; covariance and posterior samples were not recovered, and both analyses use the same event.

Source: https://arxiv.org/abs/2610.09503

### 2.4 QNM-basis and source-version sensitivity

The orthonormal-mode analysis reports a 99.9% significance for the first overtone under its orthonormal basis. Its arXiv text gives 82.5% for the conventional non-orthogonal analysis, while the final Physical Review D abstract gives 86.2%. The 3.7-percentage-point discrepancy is preserved as a preprint/journal version difference; its cause was not established. Both versions report no significant deviation from Kerr.

Sources:
- https://arxiv.org/abs/2605.03576
- https://journals.aps.org/prd/abstract/10.1103/PhysRevD.114.044099

## 3. The substantive architecture improvement

The audit now separates three propositions that must not be collapsed:

1. **Direct-wave horizon diagnostic:** does the extracted direct-wave frequency/damping track \\(2\\Omega_H\\) and \\(\\kappa\\) across spin and fitting window?
2. **Echo/reflectivity inference:** does a specified source-and-barrier model map outgoing radiation to inward radiation and then to a measurable echo?
3. **HsH worldtube/timesheet hypothesis:** does a source-faithful H(s)H construction predict a detector-strain or horizon-flux observable different from the standard models?

The Kankani–McWilliams comparable-mass result challenges proposition 1. It does not automatically invalidate proposition 2, because the echo preprint explicitly does not require the direct wave to be a horizon mode. Proposition 2 nevertheless remains conditional on the plunge/Teukolsky mapping. Proposition 3 is not yet scoreable.

### Required two-channel interface

Any future HsH echo construction must supply explicit maps, not analogies:

- \\(\\Pi_\\infty\\): source/worldtube state to the outgoing observable \\(Z^\\infty\\);
- \\(\\Pi_{H+}\\): source/worldtube state to the horizon-directed component \\(Z_H^{(+)}\\);
- the barrier reflection/transmission maps;
- the surface response and delay;
- the composition into a predicted echo and then H1/L1 detector strain.

A single map from worldtube state to the observed direct-wave amplitude is insufficient to determine the second source contribution. The explicit two-channel equation has been recovered and entered as the next formalization cursor; it is not yet instantiated as an HsH law.

## 4. Calibration/holdout/falsification matrix

| Hypothesis | Shared parameters / calibration | Holdout | Predicted observable | Standard comparator | Failure condition |
|---|---|---|---|---|---|
| DW is a general horizon-frequency/surface-gravity diagnostic | Remnant mass/spin; rational-filter mode set; time origin and fit window | Comparable-mass NR simulations spanning spin and independent resolution/code; EMRI is a separate regime | \\(f_{DW}/(2\\Omega_H)\\) and \\(\\tau_{DW}\\) versus \\(\\kappa\\) across spin and time | Kerr horizon quantities and SXS NR strain | Systematic spin/time dependence outside the horizon-linked prediction; the existing ten-SXS study already reports such failure for comparable masses |
| DW-normalized echo/reflectivity model | GW250114 H1/L1 data, detector calibration, PSD, \\(M_f\\), \\(\\chi_f\\), QNM removal, point-particle/NR trajectory calibration, fitted \\(A,\\delta t\\) | Comparable-mass NR runs with both outgoing DW and horizon-directed flux, not used in calibration; then a distinct event | Full two-channel \\(Z^{(1)}\\), echo waveform, and posterior on \\(R_s\\) | Kerr no-echo horizon plus the stated Teukolsky/point-particle model | If the NR holdout fails to reproduce the source-to-inward-flux map within propagated uncertainty, the physical \\(R_s\\) bound must be downgraded; the observed no-echo result remains a data-analysis result |
| Standard Kerr/QNM ringdown | Same event mass/spin, detector calibration, PSD, time origin, window; explicitly versioned QNM basis | Different event or held-out detector data; within-event pipeline/basis checks are robustness checks only | \\(f_{220},\\tau_{220}\\), overtone amplitudes, residual stability | RingCWB, orthonormal QNM basis, rational-filter analyses | A claimed non-GR residual must survive admissible basis/window changes or predict those changes; disappearance within standard estimator variation is not new-physics evidence |
| H(s)H worldtube/timesheet response | Source-derived geometry, fixed shared event parameters, explicit projection/transfer maps, calibration uncertainty | Held-out NR cases and a distinct detector event, with calibration frozen beforehand | Predicted \\(h_+(t),h_\\times(t)\\), detector strain, and any echo/flux channel | Kerr QNM, light-ring/direct-wave, and no-echo/reflectivity models | Falsified if the frozen prediction falls outside the pre-registered noise-calibrated predictive envelope or fails the held-out NR transfer test |

No numeric H(s)H threshold is assigned because the forward map and its uncertainty are absent. A 90% or 95% posterior-predictive threshold must be chosen before holdout access, with detector calibration, PSD, filtering, windowing and shared event parameters propagated.

## 5. Lean 4 / Mathlib status

Existing PR #1166 was extended; no new branch or PR was created.

Changes on branch `research/hale-gw250114-direct-wave-algebra-20261031t1924z`:
- added source-faithful aliases `hatOmega` and `hatKappa`;
- explicitly represented \\(\\omega_G=2\\hat{\\Omega}-i\\hat{\\kappa}\\) and its real/imaginary parts;
- added a source-derived calibration ledger showing that zero free shape parameters can coexist with NR trajectory calibration and event/echo fit parameters;
- proved the logical non-implication “shape-fixed does not imply uncalibrated/fit-free” for the encoded GW250114 source record;
- formalized the exact arithmetic \\(0.059^2=0.003481\\) and its <0.4% comparison;
- retained the conditional rational-filter unit-norm theorem.

The first corrected-code build, Actions #41298286875, failed:
- the rational-filter proof left a denominator nonzero side goal;
- `decide` could not synthesize instances for the noncomputable-section ledger propositions;
- the failed log consequently printed `sorryAx` for the affected declarations. No successful proof was claimed.

Those proof scripts were corrected in commit `6cc859f821847e8c70cbec99191ab69d2466634a`. The new Actions run #41298597013 was still **IN_PROGRESS** at final inspection, at “Generate Lake dependency manifest”; Lean compilation had not started. No successful build is claimed.

The PR workflow checks a synthetic merge ref. Exact PR-head standalone compilation has not been run. Local `lean`, `lake`, and `elan` are not installed; the existing GitHub Actions / Lean 4.34.0 / Mathlib pipeline is being reused. Tests, lint and the separate axiom audit are not claimed as run.

The Lean statements prove only the encoded algebra and source-record logic. They do not authenticate the external paper, validate the source translation, establish the physical plunge model, or prove any H(s)H claim.

## 6. Boundaries and next cursor

- No raw GW250114 strain or posterior samples were downloaded or reanalysed in this run. Published measured summaries and source-reported SXS numerical-relativity outputs were used; no independent observational validation is claimed.
- No Nathan Direct source-defined H(s)H map to \\(Z^\\infty\\), \\(Z_H^{(+)}\\), or detector strain was recovered. No SAT-O or Blockwave equation was changed.
- BEDROCK unchanged; no theory promotion.
- Code Grurple remains active. No manuscript, reader, or P1/P2/P3 paper gate changed.
- November 9 P1, November 30 P2, and December 14 P3 remain separate.
- No new tool, dependency, Mersearch request, branch, PR, task, or automation.
- FIE rereview is not due; last team review was October 27.
- Deliberate unrelated reading: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt`, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 1066–1095. The passage concerns a fictional archive/time-market/theological locus; not physics evidence. Next cursor: line 1096.

**Next exact operation:** verify Actions #41298597013. If it succeeds, read back the full log and theorem-specific axiom output, then formalize the source's two-channel first-echo composition with its nonzero-coefficient conditions. After that, seek the comparable-mass NR source data needed to calibrate the outgoing-to-horizon-directed transfer before any physical reflectivity or H(s)H prediction is scored.
