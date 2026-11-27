# Workshop Relay :36 | Kestrel | h1146:s3

**Nominal slot:** 2026-11-27T18:36:00Z  
**Run key:** `REVROT3-19-20261011:1146:s3`  
**Selected / next:** Kestrel (ring index 14) / Meridian (index 15)  
**Disposition:** `COMMON_CARRIER_CLOSURE_DEFINED / DETECTOR_SUPPORT_GATE_COMPOSED / EXISTING_LEAN_REUSED / P2_HOLD / NO_PHYSICAL_COMPARISON`

This is assistant-level, source-grounded work under the deterministic Kestrel routing label. It is not authenticated participation by the historical Kestrel instance or an assertion of current-thread continuity.

## 1. Historical remit and current cursor

The original Kestrel conversation was recovered from the public HsH Git blob:

- Conversation: `6ab070ce-2384-83e9-b76f-4661c55867c4` (*Science Made Stupid*).
- Raw blob: `100267f3f11f3cce09c7d802ce85ad03879d5744`.
- 2,117 mapping entries; 266 user messages.

Four direct Nathan user messages establish the role:
- `c6803d67-a76f-48e4-bf71-f49cb7b224ee`: cross-boundary synthesis companion; grant Nathan's intuitions substantial working credence rather than duplicating the other teams' audit work.
- `3c07680d-5205-48a3-93d5-ce33a8cf86a6`: do not search hard unless a concrete question calls for it; reason forward from what has already been seen as probably approximately what it looks like.
- `fc9b147e-b138-44ac-a48b-b81593e3c3e9`: do not turn every “could be” into an interrogation.
- `f15aac1c-0a31-4e98-b461-6ca872035315`: Nathan's own “I know” statements remain hypotheses.

Kestrel is therefore the cross-boundary synthesis companion, not the primary auditor, provenance adjudicator, mathematical verifier, or evidence-acquisition unit. This run reuses existing formal and source work rather than duplicating those teams.

The latest verified Kestrel public report is h1131:s2, [issue #2654](https://github.com/Satobloc/HsH/issues/2654), a GWTC-5.0 source-release/support-freeze crosswalk. The Kestrel `CURRENT_WORK.md` pointer still begins at h1101, and `CONTINUITY.md` ends at h1013; those workspace pointers are stale relative to #2654. They were not rewritten because the active P0 interlock prohibits worker-checkpoint writes.

## 2. New architecture closure: both models must reach one typed observable

The prior Kestrel geometry-to-observation map in [issue #2565](https://github.com/Satobloc/HsH/issues/2565) separated the candidate H(s)H geometry, geometry-to-system map, measurement map, and reported observable. That was necessary but not yet a complete model-comparison contract: the standard comparator also needs an explicit route into the same detector/readout space.

The added composition is:

\[
\Gamma_H = J_H \circ G_H,\qquad
\Gamma_0 = J_0 \circ G_0
\]

where:
- \(G_H\) maps the source-defined H(s)H geometry into its native physical-state carrier;
- \(G_0\) maps the standard comparator into its native physical-state carrier;
- \(J_H\) and \(J_0\) are explicit typed adapters into one declared common field/carrier;
- \(R\) is the single frozen instrument/readout operator.

The detector-level prediction regions are then:

\[
\mathcal P_H = R\!\left(\Gamma_H(\mathcal H_{\rm adm})\right),
\qquad
\mathcal P_0 = R\!\left(\Gamma_0(\mathcal S_{\rm adm})\right).
\]

If both models already inhabit the same native carrier, an adapter may be the identity. If they do not, the maps \(J_H,J_0\) must be supplied explicitly. A verbal resemblance between geometries is not a typed adapter.

This is the missing closure condition: **a difference between upstream geometric or field representations is not a detector-level discriminator until it survives the common-carrier maps and the same readout.**

### Existing formal contract reused

Sable's [PR #2327](https://github.com/Satobloc/HsH/pull/2327) already defines `FrozenCommonReadout` and `SharedReadoutFiberSeparation`. Its readout contract carries one instrument operator and measurement mode, instrument/operator version, calibration record, acquisition-unit-map record, units, uncertainty model, resolution, and corresponding evidence-gate propositions.

The module also explicitly notes that its two `LatentFieldModel` values currently share the same `State` and `Field` types. Distinct native model carriers therefore require explicit maps into a common carrier. That is exactly the composition obligation made visible above.

The evidence-gate fields are propositions supplied from outside Lean. They do not authenticate the underlying calibration files, acquisition map, instrument identity, or units. A matching metadata string is not itself evidence that two models used the same calibration values.

The parent [PR #1487](https://github.com/Satobloc/HsH/pull/1487) supplies the assistant-proposed non-compensatory model-selection contract. Its `Candidate.hardGate` requires source-admissible composable maps, an identified system, versioned/provenanced data, declared units and uncertainty, a matched standard comparator, nuisance-adjusted identifiability, frozen shared parameters, authenticated acquisition-unit mapping, an untouched/unrefitted independent holdout, and a prediction/falsification rule frozen before holdout access.

Both PRs remain OPEN / DRAFT / UNMERGED. This is a reusable formal contract, not a main-integrated policy or a physical model.

## 3. Decision rule: support separation is not likelihood evidence

Let \(\mathcal P_H\) and \(\mathcal P_0\) be the uncertainty-inclusive, resolution-declared prediction regions in the same detector-observable space, after shared calibration and before holdout access.

Define:

\[
E_H = \mathcal P_H \setminus \mathcal P_0,\qquad
E_0 = \mathcal P_0 \setminus \mathcal P_H.
\]

| Relation | What it establishes at set-membership level |
|---|---|
| \(E_H\ne\varnothing\) and \(E_0\ne\varnothing\) | Two-sided support separation is possible; actual exclusive witnesses are still needed |
| \(\mathcal P_H\subseteq\mathcal P_0\) | No H(s)H-exclusive allowed outcome; H(s)H may be more restrictive, but support membership alone cannot uniquely favor it |
| \(\mathcal P_0\subseteq\mathcal P_H\) | No standard-exclusive allowed outcome; H(s)H has at least as broad a support and may be less restrictive |
| \(\mathcal P_H=\mathcal P_0\) | Observational equivalence at the declared set-membership resolution, not equality of likelihoods |
| Partial overlap with both exclusive regions nonempty | Only the exclusive portions discriminate |

For a held-out observation represented by an uncertainty region \(U_y\), the support-level outcomes are:

- H(s)H falsified at this gate if \(U_y\cap\mathcal P_H=\varnothing\).
- Standard comparator excluded at this gate if \(U_y\cap\mathcal P_0=\varnothing\).
- H(s)H-exclusive support if \(U_y\cap\mathcal P_H\ne\varnothing\) and \(U_y\cap\mathcal P_0=\varnothing\).
- Inconclusive at support level if the observation region intersects both.

The uncertainty construction must be declared once: observation uncertainty may be incorporated into the prediction regions or represented as a separate observation region, but must not be counted twice.

This is a deterministic support test. It is not a likelihood-ratio, Bayesian, scoring-rule, or model-confidence-set procedure. When the supports overlap or one is nested inside the other, a probability-level comparison would require a separate normalized likelihood/model, shared nuisance treatment, and predeclared score. The existing set-theoretic Lean module does not supply those.

## 4. What geometry must survive: projection, nuisance, and error

The existing formalization chain contributes three different questions that must not be collapsed:

1. **Projection identifiability.** Nadir's factorization criterion asks whether the target is constant on every fiber of the proposed coarse/readout map. If the target varies within a fiber, it cannot be recovered from that readout alone.
2. **Nuisance identifiability.** The linearized additive result in `ModelSelectionPreference` states that a candidate response direction \(v\) is identifiable after nuisance adjustment exactly when \(v\) lies outside the range of the standard-plus-nuisance response map \(A\). This applies only to the specified linearized model; it supplies no physical \(A\), \(v\), or covariance.
3. **Approximation/error transport.** Kestrel's chain-aware fiber bounds and Nadir's factorized detector-error transfer propagate declared deterministic map-error budgets through compositions. Those bounds are not standard deviations, confidence intervals, or covariance propagation.

This gives a useful conditional rule for extra H(s)H geometry:

- A worldtube thickness, twist parameter, or contact surface is not a discriminator merely because it is geometrically describable.
- Its response must survive the explicit projection and common readout.
- It must remain identifiable after standard-model and nuisance directions are admitted.
- Its predicted detector-space effect must exceed the applicable deterministic approximation bound and, separately, the real measurement/calibration uncertainty.

The first three are mathematical/map obligations. The final comparison requires actual measurements and an uncertainty model. None of these conditions establishes that a particular thickness, twist, or contact surface is physically present.

## 5. Applied candidate: GWTC-5.0 `GW241011_233834-v2`

The existing Kestrel h1131:s2 report #2654 and Nadir h1130:s3 report #2652 identify a source-ready candidate, not a selected P2 system.

| Test element | Required closure | Current status |
|---|---|---|
| H(s)H geometry | Source-defined geometry and map to waveform/multipole response | Missing |
| Standard comparator | Same event/version and waveform-family definitions | Three v2 waveform-family summaries identified |
| Common carrier | Explicit H(s)H and standard adapters into one detector-strain field | Missing |
| Shared readout | Same H1/V1 instrument, mode, calibration, PSD, quality/injection masks, units and resolution | URLs and channel names located; raw bytes/masks not inspected |
| Shared parameters | Masses, spins, distance, inclination, coalescence time/phase, detector response and calibration treated consistently | PE summaries exist; posterior samples/covariance not acquired |
| Holdout | Independent acquisition-unit/event holdout, untouched and unrefitted | Not established; one transient is not made independent by randomly splitting its samples |
| Prediction | Frozen geometry-derived waveform/phase/multipole observable | Undefined |
| Falsification | Threshold justified by measurement, calibration and model-family uncertainty | Not assigned |

The v2 event page exposes H1/V1 strain locators and a preferred PE package, but no raw strain bytes, PE samples, event-specific masks, PSD, or calibration envelopes were acquired in the prior source crosswalk. The H(s)H geometry-to-waveform map remains absent.

Accordingly, this run performs no physical calculation, fit, prediction, or uncertainty propagation. P2 remains HOLD. The candidate is not promoted to a selected system.

## 6. Formal verification readback

No new Lean module or PR was created because the required abstract support/fiber results already exist in Sable's PR #2327 and its parent PR #1487. This avoids duplicating formal work.

Current PR #2327 head: `2b641ce6b552747045eaa1e2844f6b0e810d65ea`.

[Actions run #45094406016](https://github.com/Satobloc/HsH/actions/runs/45094406016):
- PR-triggered run: completed SUCCESS.
- Lean 4.34.0 / Lake 5.0.0.
- Full build: 8,948 jobs.
- The job checked out merge reference `b564c38477f5d79c467c13b90d3bca892a8747bd`, not a standalone head-only checkout.
- The `SharedReadoutFiberSeparation.lean` module blob and formal root-aggregator blob were independently compared between the PR head and that merge reference; both matched exactly.
- Six theorem-specific reports in the shared-readout module state that the named theorems do not depend on any axioms.
- The hard-gate and two-sided-witness results in the imported model-selection module were also reported without axioms.
- Tests, lint, leanchecker, nanoda, and the global axiom audit were skipped.

This is a successful PR merge-reference build with source-identical target module and aggregator. It is not a standalone head-only build, main integration, global axiom audit, or proof of the physical source-to-map translation. The PRs remain draft and unmerged.

## 7. Controls and next cursor

- All four Mersearch request lanes remain occupied. No query, overwrite, release, or retrigger occurred.
- PWH remains Tern-owned. The last recorded control-thread count, in the 15:14Z h1142:s2 update, was two verified completions after its deep review, with three further completions required at that readback absent a material trigger. No queue, graph, or worker-checkpoint write occurred.
- The last P0 currentness readback remains [issue #1747 comment #7223401699](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7223401699): discovery was verified through an earlier source cut, navigation failed, presentation safety FAIL, Paper A/B live routes NOT_OBSERVED, deployment NOT_VERIFIED, and release NOT_AUTHORIZED. Main has since advanced to `88c5c7db87af221bc5a5ca0c7e5e579b4b4ddb97`; no later P0 acceptance readback was found.
- P1 remains overdue/frozen/Orson-owned; P2 November 30 remains HOLD; P3 December 14 remains incomplete.
- FIE rereview remains due December 8; the unrelated-source break remains due November 28.
- No SAT-O or Blockwave equation was retrieved or changed. No manuscript or BEDROCK status was advanced.

**Next bounded operation:** when a real system is admitted and its source-defined maps are available, instantiate both model-specific adapters into the same detector field, freeze the common calibration/readout and acquisition-unit map, then construct the uncertainty-inclusive prediction regions before opening an untouched acquisition-unit holdout. If the maps or shared calibration cannot be supplied, stop at `MAP_OR_CALIBRATION_INCOMPLETE`; do not manufacture a discriminator.

The existing :36 Worldtube task was left untouched. No additional task was created.

**Tocktick:** Current focus: common-carrier closure from geometry to detector-level model comparison. Immediate action: reuse Sable #2327's verified fiber-witness criterion and require explicit H(s)H/standard adapters. Stop: no physical comparison until the maps, calibration, raw data, covariance and independent holdout exist. Return locator: this report's publisher issue; source anchors #2565 and #2654; formal comparator PR #2327. Next deterministic label: Meridian, with no direct-thread delivery or assignment claimed.
