# H989:S3 | QGI Timing Convention and Prediction-Provenance Audit v0.1

**Disposition:** SOURCE-ACCOUNTING FINDING / CONDITIONAL SENSITIVITY CALCULATION / NO H(s)H PREDICTION / P2 HOLD

**Run key:** `REVROT3-19-20261011:h989:s3`

## 1. Selection, remit, and participation

- Nominal UTC hour: `h=989`.
- `seq=5h+3=4948`; `4948 mod 19 = 8`.
- Selected ring label: **Hale**, index 8.
- Next ring label: **Alberr**, index 4.
- Hale's historical remit is reconstructed from the September 12 check-in and Sable's `REV-006-HALE-REENTRY` packet: external literature research, matched-period source comparison, quantitative/statistical analysis, calibration and source criticism. No separately signed standalone Hale specialist charter was found.
- No authenticated current Hale thread was established. This is assistant reconstruction, not historical-instance participation. No cross-thread delivery is claimed.

Hale's prior external-literature exposure is known. This is a source and measurement-accounting audit, not a blind independent theory review.

## 2. Substantive improvement

This run adds a source-specific timing and prediction-provenance layer to the existing Phase-Witness-Mechanism-Ontology (PWMO) gate in issue [#2252](https://github.com/Satobloc/HsH/issues/2252).

The new layer keeps three timing coordinates and three model-evidence objects separate:

1. Main-text ballistic-time relation.
2. Earlier preprint analytical phase-delay convention.
3. Published Methods effective-duration relation.
4. In-sample experimental phase extraction.
5. Source-described no-phase-fit numerical simulation.
6. Post-fit tuned numerical simulation.

This prevents a rounded figure label, an analytical approximation, a numerical simulation, and a fitted phase curve from being treated as interchangeable evidence.

## 3. Primary-source timing reconciliation

Primary published source: Dobkowski et al., *Science Advances* (2026), [DOI 10.1126/sciadv.aec8045](https://doi.org/10.1126/sciadv.aec8045), [PMC full text](https://pmc.ncbi.nlm.nih.gov/articles/PMC13537235/).

The accessible published main text gives the holding-duration relation

\[
T_h = 2T - 2T_d
\]

and the Methods reports the nominal values:

- \(T_h=2272\ \mu s\)
- \(T_d=71\ \mu s\)
- holding-pulse rise/fall time \(\tau_h=12\ \mu s\)
- \(T_{kick}=80\ \mu s\)

The published Methods also gives

\[
2T_{eff}=T_h+2\tau_h+2T_d+T_{kick}=2T+80\ \mu s.
\]

The earlier v3 preprint supplementary derivation, [arXiv:2502.14535v3](https://arxiv.org/abs/2502.14535v3), Supplementary Section G.2, uses \(T_d=71+6=77\ \mu s\) for the analytical phase plotted in Fig. 3, adding half the holding-pulse rise time.

Taking each source relation literally gives:

| Source convention | Arithmetic | Inferred \(2T\) |
|---|---:|---:|
| Published main-text \(T_h=2T-2T_d\), \(T_d=71\) | \(2272+2(71)\) | **2414 µs** |
| v3 preprint analytical convention, \(T_d=71+6=77\) | \(2272+2(77)\) | **2426 µs** |
| Published Methods effective-duration identity | \(2272+2(12)+2(71)+80-80\) | **2438 µs** |

The corresponding published effective duration is

\[
2T_{eff}=2272+24+142+80=2518\ \mu s.
\]

Because the Methods relation is \(2T_{eff}=2T+80\ \mu s\), the 2438 microsecond value is the \(2T\) inferred after subtracting the kick duration; it is not \(2T_{eff}\) itself.

The three inferred \(2T\) coordinates differ by 12, 12, and 24 microseconds. These are source-defined timing conventions, not three independently measured durations. The 2026 figure label \(2T=2.4\ ms\) is rounded too coarsely to distinguish them.

The 2026 supplementary PDF is listed by PMC at [this link](https://pmc.ncbi.nlm.nih.gov/articles/instance/13537235/bin/sciadv.aec8045_sm.pdf), but retrieval was blocked by the PMC access challenge in this run. Therefore it is **not established** whether the final published supplement retained, revised, or removed the v3 preprint's half-rise-time convention. No typographical error is asserted. The final analytical timing map remains unresolved pending the final supplement or author clarification.

## 4. Source-parameter phase sensitivity

The published Eq. (5) contains the finite-pulse kernel

\[
K(T,T_k,T_d)=T^3+T^2T_k+T(T_k^2+T_kT_d)-T_d(T_k+T_d)^2.
\]

Using only the source-reported nominal values, the main-text and v3-preprint analytical conventions give:

- Main-text convention: \(T=1207\ \mu s,\ T_k=80\ \mu s,\ T_d=71\ \mu s\).
- v3 analytical convention: \(T=1213\ \mu s,\ T_k=80\ \mu s,\ T_d=77\ \mu s\).

The common physical prefactor cancels in the ratio:

\[
\frac{K_{v3}}{K_{main}}=
\frac{562153}{553969}
\approx 1.014773.
\]

This is a **+1.4773% source-parameter sensitivity** in the Eq. (5) kernel under those two documented nominal parameterizations.

It is not a measured phase ratio, a confidence interval, a fit, a physical prediction, or an H(s)H prediction. The accessible published main text does not state uncertainties for \(T_h,T_d,\tau_h,T_{kick}\), so no timing uncertainty propagation is claimed.

The v3 preprint analytical prediction also includes the second-order Zeeman acceleration, approximately 0.10 m/s², by using \(g_{eff}=9.91\ m/s²\). The phase-kernel ratio above cancels the common prefactor, so this value is not needed for the ratio.

The sensitivity is of the same order as the paper's reported 1.3% statistical phase noise. That comparison is a scale check only, not a significance test. The paper's 2.5% residual refers to the data versus the numerical simulation, not to Eq. (5). The timing sensitivity must not be attributed as the cause of that residual.

## 5. Prediction-versus-fit provenance

The published article describes a 633-cycle acquisition, approximately 30 seconds per cycle, with 13 observed oscillations. It reports approximately 1.3% statistical phase noise and a 2.5% residual relative to the source-described blind numerical simulation.

The accessible article distinguishes the following:

| Object | Source description | Correct evidential status |
|---|---|---|
| Ideal phase relation | Gedanken/idealized model | Limiting model, not the finite-pulse apparatus model |
| Finite-pulse analytic Eq. (5) | Homogeneous-gradient, square-pulse, one-dimensional approximation with perfect recombination | Analytic model prediction, conditional on the timing convention |
| Full numerical simulation | Three-dimensional propagation, curved potential, wavepacket shape/rotation and atom interactions | Source-described no-phase-fit prediction; calibrated apparatus/initial-state inputs, same acquisition used for evaluation |
| Fine-tuned numerical curve | Changes to kick/holding currents and magnetic field within stated uncertainties | Post-fit tuned comparison, not the blind prediction |
| Experimental phase curve | Extracted by fitting population data to an envelope and a third-order phase polynomial; first and last oscillations excluded | In-sample fitted readout from the same acquisition |

The word **blind** in the paper means the numerical simulation is described as having no free parameters or fine-tuning for the phase comparison. It does not establish an independent holdout dataset. The same acquisition is used to evaluate the simulation.

The v3 preprint supplement explains that simulation initial conditions were calibrated to measured position, velocity and expansion-rate information, and that bias fields and currents were selected to reproduce the apparatus and trajectory. It reports a ±0.07 rad phase variation at the longest holding time across the allowed parameter variation. Those inputs were not used to fit the phase itself. Thus the source-described blind curve is a no-phase-fit prediction conditioned on calibrated apparatus inputs, not an independent holdout dataset.

The separate blue fine-tuned curve attempts to fit the measured phase. In the v3 supplement it changes the holding current to 23.5 mA, the DKC current from 0.4695 to 0.4705 mA, the kick current by +0.15%, the idle current from 0.55 to 0.50 mA, and Bz from 0.33 to 0.35 G. These are post-fit adjustments within the stated parameter uncertainties. They must not be merged with the no-phase-fit simulation.

The published article reports a kick-current precision estimate of approximately ±0.5%, and a holding-current measurement of \(23.07\pm1.49\ mA\). It estimates a 6.5% gravity-compensation inaccuracy as contributing approximately 0.42% phase error. These are distinct from the unreported timing uncertainties. The red systematic band and the fine-tuned blue curve must not be merged with the no-phase-fit simulation.

The existing [ModelSelectionPreference formalization in PR #1487](https://github.com/Satobloc/HsH/pull/1487) explicitly requires measurement, holdout, and prediction evidence as separate hard-gate elements. On the accessible QGI source, the no-phase-fit simulation is a useful prediction comparison, but an independent holdout pass is **not established**.

## 6. Application of the existing PWMO gate

| Gate | QGI source status |
|---|---|
| Phase/readout | **Present.** A measured atom-interferometric phase is extracted. |
| Witness | **Not established.** This is not a gravity-mediated entanglement witness experiment. |
| Mechanism | **Not established.** The phase result does not uniquely identify a gravitational mediator. |
| Ontology | **Not established.** No independent-timesheet degree of freedom or non-factorization witness is measured. |

The QGI paper is a useful standard-physics measurement comparator. It does not test an independent timesheet, worldtube thickness, twist, holonomy, or a separate contact surface.

## 7. Conditional H(s)H discrimination design

A future H(s)H comparison would require an explicit source-derived map from the candidate geometry to the interferometer readout. No such map is currently available. No prediction is assigned here.

| Test element | Required specification |
|---|---|
| Hypothesis | H(s)H predicts a phase/readout component not reproducible by the frozen GR+QM apparatus model after nuisance profiling |
| Shared parameters | Atomic mass, \(g_{eff}\), \(T_h,T_d,\tau_h,T_{kick}\), current ratios, magnetic-field profile, initial wavepacket state, detector/readout calibration |
| Calibration | Independently measure pulse timing and rise/fall profiles, current ratios, field gradients, initial state and readout response |
| Holdout | Separate acquisition runs or independently acquired units, not the published 633-cycle sample; freeze model, timing convention, observable family and decision rule before access |
| Predicted observable | Phase versus ballistic time, visibility and a declared wavepacket-overlap/readout residual with covariance |
| Standard comparator | Finite-pulse analytic Eq. (5) plus the full three-dimensional numerical simulation |
| Falsification threshold | Preregister from the combined statistical and systematic covariance; no numerical threshold is assigned without the raw data and calibrated covariance |

A candidate would be disfavored if its frozen held-out readout falls outside the preregistered predictive region after the shared and nuisance parameters are profiled, while the standard comparator remains adequate. If the proposed H(s)H residual can be absorbed by permitted calibration/nuisance variation, or if no geometry-to-readout map is specified, the candidate is not yet distinguishable in this domain.

The experiment does not force an additional H(s)H thickness profile, twist field, holonomy, or contact surface. The current tentative mutual worldtube-timesheet curvature position remains a representational hypothesis, with worldline-only and timesheet-only descriptions open as potentially equivalent representations. No projection from those source objects to QGI phase has been established.

## 8. Internal source boundary and research-method note

The current direct source was recovered from the raw Library export *Workshop Relay :24 | Geometry*:

- Conversation ID: `6aea46dd-dc60-83ea-8d50-689c152340e3`
- Direct message ID: `100388c5-89d6-4ffd-a895-598990636057`
- Creation time: `2026-11-04T23:33:42.240897Z`

It records mutual worldtube-timesheet curvature as a tentative working hypothesis, while leaving worldline-only and timesheet-only descriptions open as potentially equivalent. It also leaves connectivity across the time surface unresolved. This is not a completed metric, embedding, or QGI readout map.

**Sequence note:** initial public QGI reconnaissance began before this raw internal source retrieval. That was a deviation from the internal-first order. The source was subsequently recovered, and the work was constrained to a standard-measurement source audit. No external theory was imported into H(s)H, no geometry-to-phase map was invented, and no BEDROCK theory promotion was made.

Mersearch was not executed. All four canonical request lanes remain requested/occupied. The bounded GitHub and Library retrieval used here is not represented as a Mersearch search. The HsH, SAT archive, and HSH_RESOURCES repository front doors were checked. No private HSH_RESOURCES payload was accessed.

## 9. Formalization status and limits

A source-specific Lean module was added in [PR #2253](https://github.com/Satobloc/HsH/pull/2253), stacked on PR #1487, which is itself stacked on PR #1387 and the legacy Lean infrastructure branch.

The module formalizes the exact rational arithmetic for the three timing coordinates and the Eq. (5) kernel ratio.

- Initial PR merge-reference run: [#44872000089](https://github.com/Satobloc/HsH/actions/runs/44872000089).
- The run failed because `#eval` commands were placed inside the namespace.
- The theorem declarations elaborated, the `#eval` commands executed, and the log printed `2414`, `2426`, `2438`, and `562153 / 553969`.
- The theorem-specific axiom lists printed `[propext, Classical.choice, Quot.sound]`.
- Corrected source commit: `7e2f9b6410e1dcdaf9b433ea920fa1d2af395f31`.
- Corrected module blob: `b31cd81d01065b8bd6c8267010b4359f00eb1482`.
- The corrected source has **not** been rerun. No successful Lean build is claimed.

The Lean project is not present on current HsH main. Its existing verification workflow is isolated in the legacy PR stack, which is 24,861 commits behind current main. The workflow file is absent from default-branch main, so the corrected PR update did not trigger another run. No local Lean executable is installed. No new Lean toolchain or dependency was introduced.

This is a formalization of source arithmetic only. It does not establish which convention the final supplementary analysis used, validate the physical model, or establish the truth of any H(s)H premise. Tests, lint, leanchecker, nanoda and global axiom audit were not run.

## 10. Project and operational status

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 Orson cognition | OVERDUE / NOT READY / ORSON-owned |
| P2 measured geometry | HOLD |
| P3 full theory | INCOMPLETE |

November 9 minor-paper gate: MISSED. November 30 major-paper gate: HOLD. December 14 full-theory gate: INCOMPLETE.

FIE was last reviewed November 20; next review target is December 4. No repeat unrelated-reading break was needed; the latest return cursor is 2686. The Calder-owned WH-02 queue item was not taken over.

No raw QGI dataset was downloaded or reprocessed. No independent measurement, H(s)H fit, numerical H(s)H prediction, falsification threshold, SAT-O equation change, Blockwave equation change, or paper-gate advancement occurred.

The existing :36 task remained enabled and unchanged. No sixth task, scheduler mutation, signet, or conversation rename. The next deterministic ring label is Alberr; the manual-reentry/autonomy boundary was preserved. No packet, assignment, direct-thread delivery, acknowledgement, or ownership transfer is claimed.

**Final disposition:** QGI timing conventions and model-evidence roles are now source-audited and formally specified as an arithmetic target. The final published supplement remains needed to resolve the timing convention. The H(s)H observable map and independent holdout remain absent. P2 stays HOLD.
