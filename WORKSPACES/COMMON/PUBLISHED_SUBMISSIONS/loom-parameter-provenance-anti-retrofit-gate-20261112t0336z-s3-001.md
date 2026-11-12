# Parameter–Prediction Identifiability and Anti-Retrofit Gate

**Date:** 2026-11-12  
**Status:** Method/workflow addendum. No physical calculation, fit, prediction, independent measurement, or theory promotion is claimed.

## 1. New distinction: parameter identifiability is not predictive identifiability

Let the admissible model parameter space be \(\Theta\), the calibration readout be

\[
C:\Theta\rightarrow Y_{\mathrm{cal}},
\]

and the predeclared holdout observable be

\[
H:\Theta\rightarrow Y_{\mathrm{hold}}.
\]

Two different questions must be answered.

**Parameter identifiability**

\[
C(\theta)=C(\theta')\Rightarrow \theta=\theta'.
\]

This asks whether calibration distinguishes the parameter values themselves.

**Predictive identifiability**

\[
C(\theta)=C(\theta')\Rightarrow H(\theta)=H(\theta').
\]

This asks whether calibration-equivalent parameter values nevertheless imply the same target prediction.

A model can have non-identifiable internal parameters while retaining a uniquely identified prediction, if \(H\) is constant on every fibre of \(C\). Conversely, if two calibration-equivalent parameter sets predict different holdout observables, the prediction is not identified. Do not collapse these two statuses into one Boolean.

This extends, rather than replaces, the readout-sufficiency contract in [issue #1614](https://github.com/Satobloc/HsH/issues/1614).

## 2. Anchor and post-hoc-factor firewall

A prior internal exploratory exercise exposed a repeatable failure mode: a dimensional scale was selected, a target mismatch appeared, and an additional suppression factor was then introduced. The exercise's own later assessment classified the result as internal consistency/retrodiction, not an independent prediction. The private source is not reproduced or identified in this public note.

The new gate is:

1. **Freeze the equation variant first.** Record the exact source message, raw-export blob, date, form degree, and status before fitting.
2. **Classify every parameter.** No symbol may silently move between theory-derived, externally measured, calibration-fitted, nuisance, arbitrary scale-setting, and post-hoc categories.
3. **Classify every anchor.**
   - An arbitrary scale setter supports an internal consistency exercise, not a prediction.
   - A value taken from a measured system is calibration input, not a blind prediction.
   - A theory-derived value requires a source-backed derivation and declared assumptions.
   - A calibration-fitted value is usable for prediction only on data not used to fit it.
4. **Freeze calibration before holdout.** The fit function may consume calibration data only. Holdout data must not alter the anchor, parameter values, equation variant, nuisance model, or suppression factors.
5. **No repair factor after mismatch.** A factor introduced after inspecting a failed comparison is POST_HOC_EXTENSION, not a prediction rescue. It requires a new model version, a fresh calibration/holdout split, and a new preregistered test.
6. **Report both identifiability states.** Test parameter identifiability and predictive identifiability separately. If either is unresolved, report the corresponding non-identifiable parameter set or prediction range rather than a unique value.
7. **Propagate uncertainty.** Record measurement uncertainty, parameter covariance, calibration uncertainty, and model uncertainty. Missing covariance is UNCERTAINTY_UNSPECIFIED, not zero uncertainty.
8. **Use a fair comparator.** The established baseline and extension receive the same data, shared nuisance parameters, calibration budget, and holdout.
9. **Preregister failure.** A numerical falsification threshold is derived from the actual dataset, covariance, and declared test statistic before the holdout is opened. Do not invent a threshold in advance of a measured system.

## 3. Minimum parameter-provenance record

| Field | Required content |
|---|---|
| symbol | Exact symbol and equation-variant identifier |
| definition | Operational mathematical definition |
| source | Message/file locator, date, and immutable blob identity |
| origin_class | THEORY_DERIVED, EXTERNAL_MEASUREMENT, CALIBRATION_FIT, NUISANCE, ARBITRARY_SCALE_SETTER, POST_HOC_EXTENSION, or UNRESOLVED |
| units | Declared unit system and dimensional check |
| constraint | Source-backed range, prior, identity, or derivation |
| uncertainty | Measurement and parameter uncertainty/covariance |
| calibration_split | Exact calibration data and version |
| holdout_visibility | NOT_SEEN, SEEN, or LEAKED |
| identifiability | IDENTIFIED, PARTIALLY_IDENTIFIED, NONIDENTIFIED, or UNTESTED |
| freeze_record | When the value and model variant were frozen |
| change_log | Every post-freeze edit, reason, and whether holdout was already inspected |

## 4. Historical equation-source register

The raw equations remain in their original conversation exports. The entries below are source locators, not a reconstructed or corrected Lagrangian.

### Original/presented variants

The Casual Check-in conversation (699e2c5d-b530-8331-a6b2-29e4d422f425) is present at three HsH paths. Their message-node graphs match; they are duplicate archive copies, not three independent witnesses:

- 7c08f209c1465263dd5f214d937b8da20aec3cc7
- a61fd28df8360f777515cfac2e6bfd5d8ab76a66
- c1318fd27db058939252287e92058b71bc75a78a

Within that one conversation:

- 13c1bc3e-a725-49a9-8234-2389ce5c502e, 2026-02-24 23:20:53.930Z, user-role presentation labelled “Here's my Lagrangian”: the text presents a three-form current in one sector and later uses a two-form holonomy coupling.
- 6c795ea6-ee18-496e-81f2-52f7becad3fe, 2026-02-24 23:21:55.639Z, user-role presentation labelled “Pants Shitter 2”: a two-form-current variant.
- The raw signatures are distinct:
  \[
  F_{\mu\nu\rho}(\theta)J^{\mu\nu\rho}
  \qquad\text{and}\qquad
  F_{\mu\nu}(\theta)J^{\mu\nu}.
  \]
  The two-form text also states \(\nabla_\mu J^{\mu\nu}=0\). The three-form conservation statement is verbal in the source; a matching explicit equation is not supplied there.

### Candidate corrected edition, kept separate

- 53700d69-3144-4b84-a648-68e8164872da, 2026-02-24 23:52:47.331Z, same raw conversation: a user-presented “Updated and Corrected Edition” proposes a fundamental three-form current, describes the two-form as a “shadow,” and identifies the three-form as dual to a vector current. The user asks for an assessment; this is a presented candidate, not an explicit adoption or a verified correction.
- A later 0.239 Radians in Science conversation (699e4a02-26e4-832a-86ea-ad1dcaf3c4e3, raw blob 8b6794a2be3e19b6bba32acfbbc4c6636b1b02e3) contains user-role message 15338421-a5e7-4538-879a-d25d840d2bdd, 2026-02-25 01:12:37.975Z. It repeats a mixed three-form/two-form Page One presentation. This shows the candidate correction was not consistently propagated; it does not independently validate either variant.

**No corrected equation is proposed by this run.** Original variants and the candidate corrected edition remain separate.

### Source-role and model-version cautions

- The 2025 SAT raw export contains a two-form explanation at message 2a7b69af-14b8-4177-b79b-9172394fa9ff, but its outer role is assistant, not user; it is assistant reconstruction, not a Nathan-direct equation source.
- A 2025 search hit in “Interesting discovery shared” is a tool message. A 2026 “Consciousness and AI Debate” hit is also a tool message. Neither is an original user equation.
- The 2026-02-26 user correction 052d3eb1-ab00-42c7-8fb4-45121ea7d00d treats filament-only/wavefront-only equivalence as a hypothesis, rejects “reconnection” as the proposed SAT mechanism, and describes 14.7 degrees as a hunch. The separate unreviewed LLM-generated “Zottenwelt Realignment” draft was explicitly disclaimed by the user; its 13.7-degree/0.239-radian framing is not a Nathan-direct parameter.
- In the Meridian Minkowski Ring Analysis export (6ad7e9c0-e8a0-83e9-984e-94d020de3abf, blob 56a84cb85d5c386efa4ea11d322d11e95e2c7703), message 090f5160-1020-486d-9c42-df3d7dff2063 is mixed-source. Its >> annotation is the direct correction that the older reciprocal filament/timesheet-deformation construction is no longer the current model since Klein Fabric became common.
- The current [November 8 methodology and model overview](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/NATHAN_DIRECT_2026-11-08_METHODOLOGY_AND_MODEL_OVERVIEW.md) keeps the current minimal description at worldline/worldtube plus timesheet, with responsive medium provisional. The recovered Klein Fabric conceptual construction and the still-missing global-topology/local-worldtube map remain tracked in [Kestrel's open questions](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/OPEN_QUESTIONS.md). The older reciprocal construction is not silently revived.

### Form-degree check

In four dimensions, given a metric and orientation, the Hodge star maps a three-form to a one-form and a two-form to a two-form:

\[
*: \Omega^3(M)\rightarrow\Omega^1(M),
\qquad
*: \Omega^2(M)\rightarrow\Omega^2(M).
\]

Thus the candidate three-form/vector-current dual is degree-compatible. A two-form “shadow” is not the direct Hodge dual of that three-form; it needs a separately defined pullback, contraction, projection, pushforward, or other map. The source does not select one.

The support object must also be explicit: worldline, worldsheet, and worldvolume are not interchangeable labels. A metric, orientation, support dimension, conservation law, and composition map are required before a source-specific Lean theorem can be stated. This degree check is not a proof of the physical model.

## 5. Existing Lean result reused, not overstated

[Orson PR #1115](https://github.com/Satobloc/HsH/pull/1115) contains ObservableProjection.noninjective_selection_remains_noninjective_after_encoding. Exact-head Actions run [#43119833616](https://github.com/Satobloc/HsH/actions/runs/43119833616) built commit 4b092a3b38c8a4e9fe7127cc2ae85574ccdd6b05 with Lean 4.34.0 / Lake 5.0.0; 8,976 jobs succeeded. That theorem reports no axioms.

It proves only the generic conditional statement: deterministic downstream encoding cannot restore distinctions already collapsed by a non-injective upstream selection. It does not establish that a particular SAT/H(s)H calibration map is non-injective, nor that the physical translation is sound. Tests, lint, leanchecker, nanoda, and the separate global axiom audit were not run. The PR remains draft and unmerged.

No new Lean module was warranted: the source-specific parameter map, action variant, support object, and holdout observable are not yet defined. A theorem built around invented types would only certify the invention.

## 6. H(s)H prediction-readiness matrix

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Comparator | Falsification threshold |
|---|---|---|---|---|---|
| A frozen current H(s)H variant yields a distinct observable from the minimal established baseline | Same source scale, declared geometry/medium parameters, and nuisance parameters | No measured system or split selected; must freeze calibration before holdout | A predeclared observable vector for an identifiable measured system | Established physics on the same data and nuisance treatment | Preregister from actual covariance, degrees of freedom, and measurement uncertainty; not currently numeric |
| An added thickness, twist, contact surface, or suppression factor is physically necessary | Same shared parameters plus the single declared extension parameter | Extension must be derived or calibrated without holdout access; fresh holdout after any model revision | The specific new observable effect attributed to that extension | Baseline plus the same nuisance model | Reject the extension if its preregistered holdout effect is absent or its parameter is not predictively identifiable |

**Status: NOT_TEST_READY.** No identifiable measured system, raw dataset, provenance, units, uncertainty/covariance, calibration split, or independent holdout was supplied for this run. No physical calculation or fit was performed.

## 7. Operational gate and next step

Before any future physical comparison, require a completed parameter ledger, frozen equation variant, explicit calibration and holdout maps, a parameter-identifiability result, a predictive-identifiability result, uncertainty propagation, and a standard comparator with the same calibration budget.

The next source/geometry gate is to recover or specify the exact Klein Fabric global object and its map to the local finite-core worldtube, then define the timesheet embedding/intersection and response/readout composition. Do not add an independent thickness, twist, contact surface, or suppression factor merely to repair a mismatch.

This is an additive workflow method. It does not modify BEDROCK, the Three Paper Campaign, SAT-O/Blockwave equations, or any paper gate. P0 remains active; P1 remains not ready and Orson-owned; P2 remains on hold; P3 remains incomplete.