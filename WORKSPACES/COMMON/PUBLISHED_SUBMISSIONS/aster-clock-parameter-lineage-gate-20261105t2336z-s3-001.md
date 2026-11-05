# Clock and parameter lineage gate for geometry-to-observable predictions

**Run:** Workshop Relay :36, 2026-11-05 23:36 UTC (`REVROT3-19-20261011:623:s3`)  
**Status:** Architecture/workflow proposal; source-conditioned; no physical prediction, fit, or P2 selection; not BEDROCK; not Factory Floor.

## Executive result

A geometry-to-observable chain can be spatially well typed and still be unfit for a rate, frequency, or phase prediction if its curve parameter has not been connected to a physically calibrated clock and an observer/instrument timebase.

The new gate is therefore **clock lineage**: distinguish the parameter used to describe a curve or material motion, the observer's physical clock, the coordinate-time convention, the instrument timestamp, and a user-interface playback parameter. A missing clock map is an identifiability gap, not a cosmetic unit omission.

This is an architecture extension to existing map-completeness and identifiability work, not a new H(s)H law.

## Why this is a distinct gap

The existing records already establish three relevant boundaries:

1. Aster's source-fidelity addendum, published as [issue #1395](https://github.com/Satobloc/HsH/issues/1395), separates the historical verbal w-length statement from the later native `c w = t` convention. No source-defined conversion joins them.
2. Loom's carrier/trace/frame gate, [issue #1397](https://github.com/Satobloc/HsH/issues/1397), requires a parameter-to-laboratory-time map before relative winding or Thirring rates can be compared. It also records that assistant `A_u du/dt` requires a source-defined `u(t)`, while `m + Ω_N` is per curve parameter, not a laboratory-time rate.
3. Kestrel's coarse-grained memory gate asks whether a reduced slice state closes under transfer or requires a source-derived memory representation. That question presupposes a declared time function and observer; it does not supply them.

The present delta makes clock lineage an explicit, reusable eligibility gate for every time-dependent prediction, including cases where the spatial geometry and projection maps have otherwise been specified.

## Typed quantities

The following are local labels for this contract, not canonical SAT/H(s)H symbols:

| Label | Meaning | Must not be silently identified with |
|---|---|---|
| `u` | Curve/carrier parameter | Proper time, coordinate time, or laboratory time |
| `s` | Material arclength | Time |
| `φ` | Material phase | A physical frequency without a clock map |
| `τ_O` | Observer proper time, only where metric and observer define it | An arbitrary curve parameter |
| `t_C` | Chosen coordinate-time parameter | Proper time without a metric/observer relation |
| `t_L` | Instrument timestamp/timebase | Theoretical coordinate time without synchronization/calibration |
| `n` | Sample index | Uniform physical time without verified sampling metadata |
| `p_UI` | Presentation/playback parameter | Physical time or a measured rate |

## Clock-lineage contract

A rate-bearing geometry-to-observable prediction is eligible only when the following are recorded:

1. **Parameter declaration:** name, unit or dimensionless status, domain, orientation, branch, and the object it parameterizes.
2. **Clock declaration:** observer, clock type, metric/signature where relevant, synchronization convention, instrument/timebase, and calibration provenance.
3. **Explicit map chain:** the actual maps connecting the source parameter to the observer clock and then to the instrument timebase, for example `u → τ_O → t_L`. Each map needs domain, codomain, regularity, monotonicity or branch conditions, calibration identity, and uncertainty.
4. **Rate eligibility:** a derivative with respect to `u`, `s`, or `φ` remains a parameter-rate until a valid clock chain converts it to the declared observer/instrument clock. If the map is absent, report `PARAMETER_RATE_ONLY`; do not report a physical rate or frequency.
5. **Identifiability:** if the clock map is many-to-one, branch-ambiguous, or multiple admissible maps fit calibration data but imply different holdout predictions, report `CLOCK_MAP_NONIDENTIFIABLE`. Do not choose the convenient map after seeing the holdout.
6. **Uncertainty:** propagate the actual joint uncertainty of geometry, clock calibration, synchronization, instrument response, and sampling. Do not assume independence where the acquisition or calibration process creates shared errors.
7. **Freeze and holdout:** estimate or calibrate the clock map on calibration data only; freeze it before evaluating held-out time, frequency, phase, or cross-channel observables.
8. **Matched comparator:** evaluate the standard comparator with the same observer, timebase, instrument pipeline, nuisance budget, and holdout access rules.

A clock map is not an unrestricted rescue parameter. If it must be retuned by epoch, channel, or holdout to preserve agreement, the proposed shared map has failed that test or remains unidentifiable.

## Status vocabulary

| Status | Meaning |
|---|---|
| `SOURCE_DEFINED_CLOCK_MAP` | The relevant source supplies the map and its conditions. |
| `STANDARD_CLOCK_MAP` | Standard metrology supplies the map; usable for the comparator, not automatically an H(s)H premise. |
| `ASSISTANT_PROPOSED_CLOCK_MAP` | Sandbox proposal only; not source authority. |
| `CLOCK_MAP_MISSING` | No timed physical prediction is yet defined. |
| `CLOCK_MAP_NONIDENTIFIABLE` | Available observations do not select a unique map for the claimed prediction. |
| `CLOCK_MAP_CALIBRATED_FROZEN` | Map was fixed on calibration data and is eligible for holdout testing. |
| `CLOCK_MAP_FAILED_HOLDOUT` | Frozen map failed the predeclared held-out criterion in the tested domain. |

## Source-specific boundaries preserved

- The direct Calder raw export identifies Nathan's 2026-08-26 message `5b46e4d9-a51e-4281-904b-f74e41702f1b` (23:51:14.871Z): temporal persistence has a w-length in the block-universe representation, described verbally as temporal duration multiplied by `c` and expressed in meters. The following assistant response inserted `τ`; that parameter is not defined by the direct source. Keep the historical `w_M` and any proposed time variable separate.
- The later native convention is directly attested in Meridian raw conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`: Nathan Direct message `c5525f53-b7cc-4444-8102-3bf6fdb1c892` (2026-10-21T13:55:40.205Z) says the working frame is `cw=t`, Planck units, Forest normalization, and `(++++)`. That is a later native convention, not a recovered conversion from the earlier Minkowski w-length statement. No conversion map between the two source strata is asserted here.
- Assistant-generated `u(t)` and `A_u du/dt` remain assistant reconstruction; no source-defined `u(t)` has been established.
- The assistant's `m + Ω_N` construction is per curve parameter in its chosen curve/normal-frame model, not a laboratory-time physical rate.
- Whirligig's current browser branch distinguishes its Analemma curve parameter, material arclength/phase, torus orbital phase, and presentation controls. Treat its playback-speed control as presentation-only under the spec's geometry/kinematics/presentation separation; it is not an evidenced physical clock. Preserve the current inner-wall/equal-area browser reference, the older outer-wall standalone Python R/Q solver, and the sandboxed Clifford-torus branch as separate objects. The configurable-kinematics specification is on `whirligig-configurable-kinematics-2026-11-02`; this note proposes a clock-status field for future integration but does not edit that branch or claim the field is implemented.

## Prediction and falsification matrix

| Hypothesis / object | Shared parameters to freeze | Calibration | Holdout | Predicted observable | Standard comparator | Failure condition |
|---|---|---|---|---|---|---|
| Whirligig browser kinematics | Curve provider, material phase, arclength map, geometric constraints | Analytic/numerical closure checks for the declared sandbox geometry | Separate geometry/constraint regression cases | Contact, closure, phase-lock and trace diagnostics | No physical comparator; this is a kinematic instrument | Geometry or constraint regression fails. No physical-rate claim is eligible without a separately defined clock map. |
| H(s)H carrier-to-trace/winding rate | Source-defined carrier, support, observer, clock map, transport and projection; common parameters frozen | Independently calibrated clock and geometry inputs | Held-out time series or phase/frequency observations | Observer/instrument-time winding or phase observable | Applicable GR/standard transport model using the same observer and readout | Frozen H(s)H map misses the predeclared held-out region under the full joint covariance, or requires post-hoc clock/channel retuning. Current status: `CLOCK_MAP_MISSING`; not scoreable. |
| Kelvin-vortex measurement chain | Actual core geometry, laboratory timebase, camera pose/synchronization, contour and spectral pipeline | Existing source-defined acquisition/calibration records | A genuinely separate run or forcing condition, if raw data and independence are verified | Time-resolved contour, spectrum, branch and cross-view phase readouts | Classical finite-core Kelvin-wave model with the same measured inputs | Frozen map fails the held-out readouts within the declared measurement-plus-model covariance. This remains a candidate, not a P2 selection; raw arrays and sample-level covariance were not retrieved here. |

## What geometry is and is not forced

A clock conversion or reparameterization alone does **not** force intrinsic worldtube thickness, twist, a contact surface, or an additional normal-frame structure.

Such a feature becomes a candidate forced feature only when source-defined geometry and interaction rules require it to produce a distinct held-out observable that survives the shared-parameter, observer, calibration, and nuisance maps. If its effect is absorbed by an admissible clock reparameterization, it is not identified by that observable. If it is introduced only to rescue a fitted curve through epoch-specific retuning, it is hidden flexibility, not a prediction.

This is the practical distinction between a representational change and a physical discriminator: an independent reviewer must be able to reproduce the frozen clock/readout map and obtain the same failure or success on an untouched acquisition.

## Formal and empirical status

The chain-rule structure for converting parameter derivatives through declared differentiable clock maps is standard calculus. This note does not instantiate a source-specific map or claim a new theorem. The existing Kestrel `hallway_factorization_iff_fiber_compatibility` result concerns when a downstream observable factors through a possibly non-injective projection; it does not supply a clock calibration or physical time map. PR #873 remains open/draft/unmerged, and its previously cited successful build was a merge-reference build, not an exact-head whole-project proof.

No new Lean theorem, compile, or `#eval` was performed. The source-specific maps needed to state a physical theorem are missing, and a new data-free formal fixture remains `BLOCKED_PENDING_NATHAN_PERMISSION`. No measured system was selected; no raw dataset, fit, physical calculation, or held-out prediction was performed. No SAT-O or Blockwave original equation was recopied, corrected, or promoted. No BEDROCK edit, Factory Floor admission, P2 selection, or theory promotion occurred.

## Next source/evidence cursor

Recover the missing metric/clock definitions and any explicit source-defined map between the historical w-length statement and the later native `cw=t` convention. Keep the two source strata separate until that map is actually found. Then, only after selecting an identifiable measured system and obtaining versioned data, units, calibration, covariance, and a separate holdout, instantiate and test the clock/readout chain.

## Source and workflow references

- Aster source-fidelity publication: [issue #1395](https://github.com/Satobloc/HsH/issues/1395).
- Loom carrier/trace/frame comparability gate: [issue #1397](https://github.com/Satobloc/HsH/issues/1397).
- Tern's complete comparator-outcome and holdout-axis gate: [issue #1385](https://github.com/Satobloc/HsH/issues/1385).
- Kestrel's coarse-grained memory/geometry gate: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-memory-kernel-geometry-gate-20261104t1936z-s3-001.md`.
- Current Whirligig configurable-kinematics branch and specification: `whirligig-configurable-kinematics-2026-11-02`, `WORKSPACES/MERIDIAN/WHIRLIGIG_CONFIGURABLE_KINEMATICS_SPEC_2026-11-02.md`.
