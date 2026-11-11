# Kestrel h766 | Readout sufficiency and the cross-scale prediction chain

**Date:** 2026-11-11 22:36 UTC  
**Run key:** `REVROT3-19-20261011:766:s3`  
**Selected ring label:** Kestrel (index 14)  
**Successor:** Meridian (index 15)  
**Actor:** current assistant, source-grounded Kestrel-method synthesis; not an authenticated historical Kestrel instance or thread.  
**Disposition:** ADDITIVE CROSS-BOUNDARY SYNTHESIS / DETERMINISTIC READOUT SUFFICIENCY SEPARATED FROM STATISTICAL IDENTIFIABILITY / EXISTING EXACT-HEAD LEAN RESULT REUSED / NO PHYSICAL CALCULATION / NO THEORY PROMOTION.

## 1. The new distinction

The prior Kestrel synthesis separated geometric parameter scaling, finite-core profile, braid/constituent organization, and parent-child/coarse-graining into different kinds of relation ([issue #1604](https://github.com/Satobloc/HsH/issues/1604)). This note adds a second gate:

- **Deterministic readout sufficiency:** does a downstream quantity depend only on the information retained by an upstream readout?
- **Statistical parameter identifiability:** can distinct parameter values be distinguished from the probability distribution of actual noisy measurements?

These are not the same question. A deterministic factor map can exist while parameters remain statistically unidentifiable. Conversely, a statistical fit cannot repair an undefined geometric map.

## 2. Source-grounded map inventory

The relevant direct-source propositions remain deliberately distinct:

- Nathan's June 23 message `28895d46-780e-46d9-a4cd-646f92fad193` proposes one recursively nested 4D Nth-order superhelical worldline/worldtube, while explicitly leaving the placement of the scale operation unresolved.
- Nathan's July 11 messages `357fae86-dd21-41fc-bf92-646bb4c336ac`, `95993cdf-7794-4270-84cb-af391d7cbaf1`, and `c3f309e3-fc8d-4cca-98f7-4072c322e722` treat the Q=3 hadronic braid as foundational and He-3 scale repetition as a model commitment and potential test, while explicitly distinguishing braid nesting from superhelical nesting. The uniqueness phrase is qualified; this is a source-defined hypothesis/test opportunity, not independent validation.

The November 8 Primary Operational Guideline is an assistant-organized transcription of Nathan's direct statement, not a verbatim user-authored file. It currently frames worldline/worldtube and timesheet as the minimal starting structures and a responsive medium as a provisional third candidate, to be eliminated, absorbed, or retained only if required. It does not supply the missing maps or promote a physical mechanism.

The map types should therefore remain separate:

| Map or relation | Type | Missing before physical use |
|---|---|---|
| Generator parameter map | Geometric parameter transformation | Source-selected domain, codomain, units and rule |
| `Phi_core` | Finite-core support/profile construction | Embedding, normal-fibre domain, profile law and boundary conditions |
| Q=3 braid relation | Topological/constituent organization | A source-defined braid-to-state or braid-to-readout map |
| Parent-child/coarse-graining `C_l` | Assembly or representation transition | Explicit state spaces and retained/lost distinctions |
| Timesheet intersection | Geometric incidence operation | Defined sheet, support, transversality and boundary conditions |
| Instrument readout `O` | Measurement map | Actual instrument, calibration, units, response and uncertainty |

A braid relation is not a scalar rescaling. A coarse-graining map is not automatically physical nesting. Timesheet intersection is not interchangeable with an arbitrary projection or instrument readout.

## 3. Deterministic readout-sufficiency condition

Let

\[
P_0:X_0\to Y_0,\qquad C_0:X_0\to X_1,\qquad P_1:X_1\to Y_1.
\]

A deterministic induced map

\[
D_0:P_0(X_0)\to P_1(X_1)
\]

satisfying

\[
D_0(P_0(x))=P_1(C_0(x))
\]

exists if and only if

\[
P_0(x)=P_0(x')
\ \Longrightarrow\
P_1(C_0(x))=P_1(C_0(x'))
\]

for every pair \(x,x'\in X_0\).

In words: all underlying states collapsed to the same upstream readout must also agree on the downstream quantity after the proposed transition. The downstream quantity must be constant on every fibre of the upstream readout.

If this condition fails, the downstream quantity is not a deterministic function of that readout alone. The honest options are to add a genuinely measured state variable, refine the readout, or specify a probabilistic conditional model. Failure does **not** by itself establish a hidden physical primitive, and it does not license adding a free variable after inspecting the desired result.

For two successive stages, the existing witness-carrying composition result requires each stage to satisfy its own fibre-constancy condition. The intermediate image witness makes the second map well-typed. This is a useful conditional architecture for a multi-level readout chain, not a physical construction.


## 4. Geometry-first admission and inside/outside boundary

This readout criterion is not a new SAT/H(s)H incorporation tier. It does not establish Tier 1 geometric admissibility, Tier 2 explanatory value, Tier 3 unprompted cross-sector emergence, Tier 4 counterfactual indispensability, or empirical truth.

The controlling order remains geometry first: recover and specify the actual source-defined object, its dimensions, topology, support, incidences, boundaries and transformations; then derive the mathematics that describes that object. A successful abstract factorization proof cannot supply a missing physical object or make an assistant-added map source-authorized.

For a future selected system, keep the **inside** and **outside** layers separate:

- **Inside:** generator, finite-core support/profile, braid/constituent organization, worldtube/timesheet interaction, and any explicitly defined parent-child transition.
- **Outside:** projection or intersection into the observable domain, instrument response, calibration, uncertainty/covariance, and the holdout acquisition.

The Q=3 braid/He-3 proposal belongs in a QCD/nuclear-structure comparison. It is not a claim that QCD constituents are string-theory fundamental strings. No cross-formalism equivalence is asserted here.

No actual system-specific geometric plot, hostile fidelity review, or same-version plot/file display was produced in this run. The Factory Floor geometry gate is therefore not passed.

## 5. Lean status: existing theorem, current exact head

The relevant existing module is `NadirWitnessCarryingComposition.lean`, blob `babec58f7bcdf3b25b3688888c5dc5f2648876ea`, in Nadir's PR #1189.

The branch's current head is `4a852c4ae5f69be275cc1fe9ff97878abaee1cd8`; the module blob is unchanged at that head. GitHub Actions run #43084102284, job #130743880601, checked out that exact commit and completed a full Lean 4.34.0 / Lake 5.0.0 build successfully (8,959 jobs). The module-specific axiom outputs are:

- `inducedRangeMap_factors`: `Classical.choice`
- `rangeFactorization_iff_fiberwise`: `Classical.choice`
- `inducedRangeMap_unique`: `Quot.sound`
- `twoStage_witness_carrying_composition`: `Classical.choice`

The captured build log contains no `sorryAx` or bare `admit` occurrence. Tests, lint, leanchecker, nanoda and the separate global axiom audit were not run. PR #1189 remains OPEN / DRAFT / UNMERGED, with no formal reviews.

This is a successful exact-head compilation of the formalized abstract map statements. It does not establish that any source-defined SAT/H(s)H physical map exists, that the source-to-formal translation is sound, or that a physical premise is true.

## 6. Prediction-readiness matrix

| Candidate hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification threshold | Current state |
|---|---|---|---|---|---|---|
| Q=3 braid organization repeats in the He-3-scale construction | Not yet source-specified as a common parameter set; must be frozen before fitting | No selected raw acquisition/covariance package or independent holdout | Must be derived through explicit constituent/braid → finite-core geometry → timesheet/readout → instrument maps | Standard QCD and nuclear-structure predictions for the same observables | Must be preregistered from the actual joint uncertainty/covariance and comparator; not currently numeric | Direct-source model commitment/test opportunity; not empirically tested |
| One recursively nested superhelical worldtube with a scale operation | Scale operation's location/type is explicitly unresolved in the source | None selected | Undefined until the scale map and readout are specified | Established physics in the chosen geometric representation | Blocked until a unique or constrained observable map exists | Direct-source proposal with open parameterization |
| Generator curve to finite-core worldtube | No source-authorized profile parameters or shared scale law yet | None selected | Core support/profile and its measured projection | Standard finite-size model for the selected real system | Requires actual system-specific geometry and measurement uncertainty | Required map is missing; no physical prediction |

The table is a readiness contract, not a completed P2 test. No real physical system has been selected for this run. No raw dataset, calibration, joint covariance, holdout, fitted parameter, numerical threshold, or measured-versus-predicted residual was invented.

## 7. What would distinguish a real prediction from a flexible reconstruction?

Before a physical test can be called predictive:

1. Freeze the source-faithful geometric object and all map domains/codomains.
2. Freeze shared parameters and nuisance parameters using a declared calibration set.
3. Define the instrument response and uncertainty/covariance from the actual acquisition.
4. Establish that the downstream observable is identifiable from the retained readout, or explicitly use a probabilistic model.
5. Freeze a genuinely independent holdout and its access history.
6. Pre-register the comparator, scoring rule and falsification threshold from the actual uncertainty model.
7. Report every outcome, including H(s)H failure, standard-model failure, both-pass and neither-pass.

A deterministic fibre-factorization theorem addresses only item 4 at the abstract map level. It does not supply items 1–3 or 5–7.

## 8. Status and next cursor

- Source-faithful scale-map taxonomy: refined, not replaced.
- Existing Lean composition theorem: exact-head compiled; abstract and conditional.
- Physical maps: not instantiated.
- Real measured system and dataset: not selected for this synthesis.
- Physical calculation, fit, prediction and independent holdout: not performed.
- P2 November 30: HOLD.
- P3 December 14: INCOMPLETE.
- No BEDROCK promotion, manuscript edit, new Lean code, PR, branch, tool, dependency or subscription.

**Next useful step:** when a P2 real system is selected, instantiate one complete map chain for that system and test fibre-constancy before fitting. If the map is not identifiable, expose the missing measured information rather than silently increasing model freedom.
