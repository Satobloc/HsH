# Extra-state sensitivity is weaker than feature identification

**Run:** `REVROT3-19-20261011:1053:s3`  
**Status:** FORMALIZATION SUBMITTED / EXACT-HEAD LEAN CI PENDING / NO PHYSICAL TEST

## Result

A readout can be sensitive to some extra state at a fixed base state, thereby ruling out every base-only predictor for that channel, while still failing to identify which extra-state feature produced the readout.

This adds a second gate to the existing extra-structure observability criterion:

1. **Extra-state sensitivity:** at fixed base state, at least one declared channel changes when the extra state changes.
2. **Feature identifiability:** the complete readout family is constant only on states with the same value of the target feature.

The first does not imply the second.

## Formalization

PR [#2451](https://github.com/Satobloc/HsH/pull/2451) adds `HsHVerification.ExtraStructureFeatureIdentifiability`.

- `extraSensitivity_blocks_base_factorization`: a fixed-base, one-channel difference blocks any predictor that factors through the base state alone.
- `featureAmbiguity_blocks_identifiability`: two states with the same complete readout and different target-feature values block feature identification.
- `witness_extra_required_but_feature_unidentified`: a finite logical witness satisfies both conditions simultaneously.

The witness uses `Base = Unit`, three anonymous extra states, two readout values, and one channel. The readout distinguishes state 0 from states 1 and 2, but states 1 and 2 share the same readout while carrying different feature labels. These finite labels are purely logical; they are not assigned to physical thickness, twist, framing, contact, or any measured system.

**Lean status:** exact PR-head run [#45276096431](https://github.com/Satobloc/HsH/actions/runs/45276096431) is still in progress. Checkout and exact-head assertion have passed; dependency-manifest generation is running. No compile success is claimed yet. The PR head is `2ede59d75dd0da12e6f6389d51788e492c73c184`.

## Source boundary

The historical SAT-O source `SATOBLOC MISC/SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, describes a worldtube in prose as a 4D volume swept by a vibrating filament. Its displayed action is nevertheless written on the 1D centerline `γ` and tangent `v`. It does not provide explicit thickness, twist, framing, or contact variables in that displayed action.

The public [ArchiveEQ0036 observability packet](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mira-extra-structure-observability-20261027t04z-s3-001.md) establishes the base-only factorization criterion. The observed-slice identifiability work in [PR #2293](https://github.com/Satobloc/HsH/pull/2293) treats target-property constancy on observation fibers. This PR combines those two questions without modifying either prior PR.

## Conditional H(s)H implication

If an actual measured channel, under a source-authorized forward map and frozen shared/nuisance parameters, changes between two admissible extra states at the same base state, then a base-only model cannot reproduce that channel's full prediction family.

That still does **not** identify whether the responsible extra feature is thickness, twist, framing, contact, or a combination. A feature is identified only if the complete registered readout family separates all admissible states with different values of that feature.

## Test-design gate

| Candidate | Required comparison | What it can establish |
|---|---|---|
| H0: base/centerline only | Same calibration and nuisance freedom as alternatives | Standard/base-only comparator |
| H1: thickness-only | Fixed base; vary thickness only | Thickness sensitivity, if a source-defined map predicts it |
| H2: twist/framing-only | Fixed base; vary twist/framing only | Twist/framing sensitivity |
| H3: contact-only | Fixed base; vary contact data only | Contact sensitivity |
| H4: combined extra state | Compare feature-equivalence classes across the full channel family | Whether the target feature is actually identifiable |

Use the same measured system, instrument operators, shared parameters, calibration split, and frozen holdout for all candidates. Predeclare the predictive observable, uncertainty/covariance treatment, standard comparator, and failure threshold before examining holdout residuals.

Permitted status distinctions:

- `PREDICTION_NOT_FORMED`: no source-authorized forward map.
- `MODEL_EXTRA_SENSITIVE`: the formal map changes at fixed base.
- `DATA_SUPPORTS_EXTRA_STATE`: independent measured holdout rejects the base-only comparator under the frozen protocol.
- `FEATURE_IDENTIFIED`: the complete readout family separates the declared target feature.
- `FEATURE_AMBIGUOUS`: extra-state sensitivity exists, but different feature values remain observationally indistinguishable.

No candidate system, dataset, units, covariance, calibration, holdout, fit, physical prediction, or numerical falsification threshold was selected or calculated in this run. P2 remains HOLD; the November 23 first-draft/hostile-review gate is not demonstrated, and the November 30 major-paper gate remains separate.

## Epistemic limits

This is a conditional mathematical and workflow result. Lean, once the pending build completes, will check only the formalized definitions and theorems. It will not validate the source-to-model translation, establish that a physical H(s)H channel is extra-state-sensitive, or prove that any particular worldtube feature exists.

No BEDROCK theory promotion, SAT-O/Blockwave equation change, Factory Floor write, or empirical validation is claimed. A source-linked Factory packet remains `FACTORY_HANDOFF_PENDING` until an authorized intake and readback exist.
