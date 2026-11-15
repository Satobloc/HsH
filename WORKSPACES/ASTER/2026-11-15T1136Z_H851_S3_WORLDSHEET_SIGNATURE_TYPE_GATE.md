# Worldsheet signature and time-typing gate

**Status:** source-fidelity / formal-architecture proposal. This is not a BEDROCK promotion, a physical result, or a claim that H(s)H is equivalent to string theory.

## 1. Source strata preserved, not normalized

The relevant direct-source strings are distinct:

- 2026-10-09: `w=ct`, described in the classical Minkowski limit as a length-valued time scale in meters. Raw conversation blob SHA-1 `7af1561b321f4d9364da5eb111df689efc652827`; direct message `3c657387-b80b-4982-a61a-8e6d8568b8d1`.
- 2026-10-21: `cw=t` and `++++`, alongside Forest Normalization. Raw conversation blob SHA-1 `56a84cb85d5c386efa4ea11d322d11e95e2c7703`; direct message `c5525f53-b7cc-4444-8102-3bf6fdb1c892`.
- 2026-11-08: the working description distinguishes fourth-spatial `w` from proper time `t`, with time moving along `w`; it leaves the timesheet construction open. See the source-custody and interpretation boundary in [issue #1779](https://github.com/Satobloc/HsH/issues/1779).

The literal `cw=t` is preserved as written, alongside the same source's `+/-(c+H_0)/2 [or whatever the proper expression of that is]`, Forest Normalization, and `++++` conventions. No assumption is made that `cw` means multiplication rather than a single symbol, and no units or operator are silently supplied. The older `w=ct` remains a separate historical source stratum. Neither is replaced by a corrected equation in this report.

## 2. The missing type distinction

Three objects can all be two-dimensional without being the same geometric object:

1. **HsH spatial sweep candidate:** a time-parameterized map `F: S^1 x I_t -> M^4_{++++}`. If its differential has rank two, its image is a two-dimensional spatially embedded sweep in the four-dimensional spatial model. Proper time is a parameter; it is not automatically a fifth ambient coordinate.
2. **Standard real-time string worldsheet:** a two-dimensional parameter manifold with Lorentzian signature `(1,1)`, embedded in a Lorentzian target spacetime.
3. **Euclidean string worldsheet:** a positive-definite two-dimensional surface used in Euclideanized path-integral formulations. The Wick rotation is part of the formulation, not a consequence of matching dimensions.

The November 8 source calls the string-theory convention a possible simplification, not an established identity. Equal dimension alone does not provide a map, an induced metric, a causal structure, or an equivalence.

## 3. Conditional signature obstruction

Under the positive-definite interpretation of the native `++++` metric, a rank-two induced metric on the HsH spatial sweep is positive definite. It cannot be isometric to a Lorentzian `(1,1)` worldsheet, because a positive quadratic form cannot assign a negative norm to a timelike tangent.

The existing Lean formalization in [KestrelGaugeNormalizationGate.lean](https://github.com/Satobloc/HsH/blob/research/kestrel-original-slice-fidelity-20261028t0900z/FORMAL_VERIFICATION/HsHVerification/KestrelGaugeNormalizationGate.lean) contains `positive_metric_excludes_unit_timelike_vector`. Its PR-associated Lean 4.34.0 / Mathlib build succeeded at [Actions run #43202552666](https://github.com/Satobloc/HsH/actions/runs/43202552666), on PR #873 head `7dbcb5f18690232d921db74f25dfdf222ee51b8c`.

That theorem proves only the formal conditional. The theorem file blob is `2cb45e91ba08a69b786495f34371a5408dd03ee4`. No local Lean/Lake/Elan executable was available, and no new theorem or build was created in this run. The existing CI result is on a draft PR branch, not current `main`. It does not establish that `++++` is the physical metric, that the HsH worldsheet metric must be induced, or that H(s)H has no separate intrinsic metric. An independent Lorentzian metric, an explicit signature-changing construction, or a Wick-rotated representation remains possible, but each requires a source-defined map and equations. No new theorem or main-branch integration is claimed.

## 4. Add one witness to the existing comparison freeze

Add a `WorldsheetSignatureWitness` subrecord to the existing model/comparison freeze. Do not create another generic freeze layer.

Required fields:

- ambient object, dimension, and signature;
- `w` role and proper-time role;
- exact source equation string, source date/hash, symbol parse, and units;
- worldsheet domain and target space;
- intrinsic signature and metric origin: induced, independent, Wick-rotated, or unresolved;
- sweep/embedding map and rank-two witness;
- any tube-to-mouth, aperture-to-rim, and loop-family maps, with domains, codomains, and boundary conditions;
- any tube-to-worldsheet reduction map and the fiber-constancy witness required for each observable;
- standard comparator, shared parameters, calibration set, held-out set, uncertainty model, and preregistered failure criterion.

The current unresolved fields are the parse and units of `cw=t`, the actual `w(t)` map, the worldsheet metric origin, the rank-two sweep map, and the source-defined tube-to-worldsheet/readout map.

## 5. Conditional test matrix

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Failure condition |
|---|---|---|---|---|---|
| HsH spatial sweep with induced metric | Same loop geometry, native metric, and declared `w(t)` relation | Calibrate on complete runs; hold out entire independent runs, not adjacent frames | Spatial sweep, loop phase, and induced metric | Standard real-time string embedding and ordinary 3+1 kinematics | A claimed Lorentzian induced metric contradicts positive `++++`; rank below two fails to define a 2D sweep |
| HsH sweep with independent intrinsic Lorentzian metric | Same geometry plus independently specified worldsheet metric | Freeze the metric and shared parameters before holdout | Causal propagation and mode phase | Lorentzian Nambu-Goto / Polyakov formulation | No source-defined metric bridge, no identifiable extra parameter, or no held-out observable beyond the standard model |
| HsH Euclideanized representation | Same geometry plus an explicit analytic-continuation rule | Calibrate before continuation; hold out independent real-time records | Euclidean correlator and its continued real-time observable | Euclidean Polyakov path integral | No well-defined continuation back to measured real-time observables |
| Standard string comparator | Same boundary and embedding data where a bridge exists | Same calibration and holdout | Worldsheet area, induced metric, and mode spectrum | Nambu-Goto / Polyakov | Baseline only; no HsH distinction is inferred from shared fit quality |

No numerical falsification threshold is set here. It requires an actual measured system, source-backed forward maps, units, calibration, covariance, and a predeclared holdout. The existing Han et al. vortex-ring experiment is a possible spatial-readout candidate, not a string-worldsheet test; its supporting raw data were not obtained in this run. No P2 system is selected.

## 6. Decision

The new admission rule is:

**Do not call an HsH two-dimensional spatial sweep a standard string worldsheet until the target-space map, time role, intrinsic metric, signature bridge, and observable-preserving reduction are all explicit.**

If the model claims an induced Lorentzian worldsheet directly from a positive-definite `++++` metric, that particular identification fails mathematically. If it supplies an independent metric or Wick rotation, the bridge remains a testable proposal. No physical prediction, fit, independent measurement, or theory promotion is claimed.

## Sources

- [HsH issue #1737: source-level `w` role and equation strata](https://github.com/Satobloc/HsH/issues/1737)
- [HsH issue #1779: fourth-spatial `w`, proper time, and map boundary](https://github.com/Satobloc/HsH/issues/1779)
- [Kestrel PR #873](https://github.com/Satobloc/HsH/pull/873)
- [Polchinski, *String Theory*, Vol. 1, §3.2, Cambridge University Press](https://doi.org/10.1017/CBO9780511816079.006)
- [Rutgers, Topological Field Theory lecture notes, December 14, 2015](https://www.physics.rutgers.edu/~gmoore/695Fall2015/TopologicalFieldTheory-December14-2015.pdf)



## Run ledger | h851:s3 | 2026-11-15

- Rotation: h=851, seq=4258, selected ring label Aster (index 2), next label Ariadne (index 3). Selection does not authenticate a current Aster instance or thread.
- Historical Aster raw source: conversation blob `1bf6e65c4ac1650297acb67d7e39f700454a03c8`. Direct user messages establish source-fidelity questions and a historical Paper A review assignment. The current roster supersedes that assignment: REVIEW FROZEN / CROSS-READ OPEN. No Paper A/B review or manuscript edit occurred.
- Prewrite HsH main head observed: `0fbccba` (full head read from the branch API). This run did not modify BEDROCK, SAT-O, Blockwave, the paper manuscripts, reader, renderer, or site.
- Lean: local Lean, Lake, and Elan are absent. Existing PR #873 contains the conditional positive-metric signature theorem; its PR-associated run #43202552666 succeeded on exact PR head `7dbcb5f18690232d921db74f25dfdf222ee51b8c`. No new theorem or build was created. The PR remains draft and is not main integration.
- Public publication: issue #1788, submission `aster-worldsheet-signature-type-gate-20261115t1136z-s3-001`, publisher digest `2d7731e8aa9626509ddbbf431715d9e5cde829f5e5553c0f7d50ea85d63e9566`. Issue was created by repository owner at 12:23:49Z. At first readback it had zero comments and the expected canonical artifact returned 404. State: SUBMITTED_NOT_VERIFIED. Do not retry or create a duplicate.
- Unrelated reading: SAT archive `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, lines 1761-1800. Next cursor: 1801. No physical break claimed.
- Mersearch: no callable Mersearch action in this runtime. All four request lanes remain occupied/requested; no lane overwritten or retriggered. Bounded GitHub search was used as fallback. HSH_RESOURCES root/navigation only; no private research payload opened.
- Portfolio: P0 ACTIVE; P1 Orson-owned cognition OVERDUE / NOT READY; P2 HOLD; P3 INCOMPLETE; FIE next review November 24. Tern retains graph and scheduler authority.
- Automation: existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with the exact original hourly :36 schedule, prompt, and phase. Current run `79f30399-7164-8332-a52f-61785c8f6932` was IN_PROGRESS, scheduled 11:36Z, started 12:01:02.118293Z, completion null, chat_ref null. Task-level cached timestamp/result remained stale. The :48 task's current run state was not accessible; no successor start, delivery, consumption, or acknowledgment is claimed.
- No physical calculation, fit, prediction, independent measurement, P2 selection, equation correction, theory promotion, task mutation, sixth task, signet, or conversation rename.


## Amendment 01 | final publication and execution readback

- Issue #1788 is **PUBLISHED_VERIFIED**. Publisher comment #6894277559 reports artifact path `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aster-worldsheet-signature-type-gate-20261115t1136z-s3-001.md`, publisher commit `e2cba62cbac573b41f493a0dbdbe3e89392f207c`, SHA-256 `2d7731e8aa9626509ddbbf431715d9e5cde829f5e5553c0f7d50ea85d63e9566`. Independent issue-envelope/artifact comparison passed exactly at 8,188 characters.
- The :36 run record subsequently completed as FAILED at 12:26:04.666817Z, with null chat_ref. The task remains enabled with its original ID and schedule. The failure cause is not inferred. Repository work and publication were completed and verified.
- Full readback details: [receipt Amendment 01](../COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-15T1136Z_s3_aster_AMENDMENT_01_PUBLISHER_AND_FINAL_RUN_READBACK.md).
