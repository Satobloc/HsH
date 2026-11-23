# Typed terminal-map closure for near-fiber detector readout

**Date:** 2026-11-23  
**Run key:** `REVROT3-19-20261011:1033:s3`  
**Worker label:** Sable (ring index 0); next ring label Loom (index 1). These are deterministic routing labels, not authenticated ChatGPT instances or threads.  
**Epistemic status:** assistant reconstruction and workflow proposal only. Not Nathan Direct, not an independent review, not a physical result, and not a BEDROCK amendment.

## Finding

Two existing formal developments now cover complementary pieces of a possible H(s)H discrimination chain:

1. Kestrel PR [#2323](https://github.com/Satobloc/HsH/pull/2323) formalizes a near-fiber bound in an abstract terminal metric space `X_n`. Its bound depends on a pairwise decoder-stability assumption `K` for the specified decoder and pair. The theorem does not establish `K`, identify a detector, or supply physical data.
2. Sable PR [#2327](https://github.com/Satobloc/HsH/pull/2327) formalizes a common frozen readout and a detector-level fiber-witness condition. Its readout consumes a `Field` carrier and returns an abstract `Payload`. The current module is set-theoretic: it does not supply a detector metric, a noise or covariance propagation rule, or a statistical falsification threshold.

These are complementary, not yet composed. In particular, the `X_n` output of the near-fiber chain is not typed as the `Field` carrier consumed by the shared-readout module. A detector-level claim therefore needs an explicit terminal type closure. Merely naming both modules in the same test plan does not compose them.

## Existing formal evidence and limits

### Near-fiber result

PR #2323 head: `62198155ccfe00e3414e7988cbb45f1d37e1b462`.  
Merge-reference commit: `42ec8cf945cb57d66cda14ac9454b2d10f1d74f3`.  
Actions run: [#45091725762](https://github.com/Satobloc/HsH/actions/runs/45091725762), job `137422560377`.  
The `KestrelChainAwareFiberBound.lean` blob is identical at the PR head and merge reference: `8a338490801018215ff81c5ed9d9353f2b4bc59f` (same source bytes). Lean 4.34.0 / Mathlib 4.34.0 / Lake 5.0.0 completed a full 8,958-job library build. The three new theorem-specific `#print axioms` outputs list `propext`, `Classical.choice`, and `Quot.sound`; the captured log contains no `sorryAx` or `admit`. Tests, lint, leanchecker, nanoda, and a separate global axiom audit were not run. This is a successful merge-reference build of the PR head's module, not an isolated head-only checkout, merge to `main`, or physical validation.

The theorem assumes the pairwise stability bound for its particular decoder and pair. It does not prove that a proposed physical decoder has such a bound, that a finite calibration sample establishes a domain-wide bound, or that the bound applies to a different downstream readout.

### Common readout result

PR #2327 head: `2b641ce6b552747045eaa1e2844f6b0e810d65ea`.  
Merge-reference commit: `b564c38477f5d79c467c13b90d3bca892a8747bd`.  
Actions run: [#45094406016](https://github.com/Satobloc/HsH/actions/runs/45094406016).  
The `SharedReadoutFiberSeparation.lean` blob is identical at the PR head and merge reference: `6ae1044ff16cc8070d975c4a88068407d86587cc`. The merge-reference build completed successfully. The captured log contains no `sorryAx` or `admit`; this run did not provide a theorem-specific axiom report, and tests, lint, leanchecker, and nanoda were skipped. The PR remains draft and unmerged.

The module's `FrozenCommonReadout` and `EvidenceGatedFrozenCommonReadout` make the common instrument, measurement mode, calibration record, acquisition-unit map, units, uncertainty-model record, resolution, and operator version explicit as fields. Those fields are evidence obligations, not authenticated external records. The readout map consumes the module's `Field` carrier. The module does not itself provide a metric on `Payload`, quantitative noise/covariance propagation, or a statistical threshold.

### Existing architecture already in the repository

- Kestrel's detector-space typing boundary already requires a sourced `R_n : X_n -> D` when detector data live in a distinct space, with units, metric, calibration, and propagated error. This note does not claim that requirement as new.
- Loom's composed-map review distinguishes global-uniform from restricted-domain bounds, requires reference-map identity and metric/unit signatures, and warns that finite calibration samples alone do not establish holdout coverage.
- Meridian's map-family freeze gate requires candidate map identities and domains to be frozen before holdout.
- The worldtube distinguishability ladder and P2 matrix already require a source-grounded map chain, a common standard comparator, calibration/holdout separation, and detector-level uncertainty.

The missing integration is a typed closure between the actual `X_n` output and the carrier/readout used for detector comparison. The direct `R_n` requirement is already present in Kestrel's workspace; the added value here is the alternative factorized closure through the exact `Field` carrier and shared `O_m`, with the type and error obligations made explicit.

## New admission rule: close the terminal map by type, not by analogy

A proposed test must instantiate one of these two explicit closures:

**Direct closure**

`X_n --R_n--> D`

`R_n` is a source-bound map from the exact near-fiber terminal space to the detector space. Its domain, codomain, admissibility conditions, units, metric, calibration, resolution, and propagated uncertainty must be recorded.

**Factorized closure**

`X_n --J_n--> Field --O_m--> D`

`J_n` is an explicit adapter from the exact `X_n` carrier to the `Field` carrier consumed by the shared-readout operator `O_m`. Record its source, map identity/hash, domain/codomain, admissibility conditions, units, normalization, and error or sensitivity bound. `O_m` must then be the same frozen instrument/readout for H(s)H and the standard comparator.

The two routes are alternatives only when their maps and composition conditions are explicit. Do not silently identify `X_n` with `Field`, treat a type alias as a physical map, or assume that a readout is injective. A distinction in `X_n` may disappear in `Field` or in `D`; the fiber/separation check must be performed in the final detector space.

The `K` in the near-fiber theorem belongs to its specific decoder `g` and its declared input/output metrics and pair/domain. It is not automatically a bound for `J_n`, `R_n`, or `O_m`. Each downstream map needs its own source-bound stability/error evidence, or the test must be evaluated directly in the detector metric. A restricted-domain `K` certificate must show that every calibration and holdout input used by the claim lies within the certified domain. A finite sample maximum is not, by itself, a global bound. A statistical estimate of `K` cannot be inserted into the deterministic theorem as though it were a certified bound; that requires a separately stated probabilistic model and coverage claim.

## Minimal DetectorBridgeCertificate

| Field | Required content |
|---|---|
| `chain_id` | Versioned source-to-`X_n` map chain and exact source IDs/hashes |
| `terminal_space` | Exact `X_n` type/metric and unit normalization |
| `closure_kind` | `DIRECT_RN` or `FACTORIZED_JN_OM` |
| `terminal_map` | `R_n` or `J_n` identity/hash, domain/codomain, admissibility, composition conditions |
| `decoder_stability` | Exact decoder `g`, pair/domain scope, `K` bound, input/output metrics, evidence method, and validity domain |
| `coverage` | Calibration and holdout IDs plus domain coverage/reachability or invariance evidence |
| `readout` | `O_m` identity/version, instrument, measurement mode, calibration, acquisition-unit map, units, resolution, and uncertainty/covariance model |
| `comparator` | Same final readout and measurement mode for the standard comparator; frozen shared parameters |
| `prediction_test` | Detector-space observable, independent holdout, predeclared metric and falsification threshold |
| `review` | Independent source-to-map and measurement review |

If the terminal map, carrier compatibility, `K` scope, domain coverage, detector metric, or readout uncertainty is missing, mark this test `NOT_SCOREABLE` / `NOT_FALSIFIABLE`. That is not evidence for or against H(s)H. It means the proposed distinction has not yet been carried to an independently testable observable.

## Test-matrix insertion

| Hypothesis | Shared parameters and maps | Calibration / holdout | Predicted observable | Standard comparator | Falsification rule |
|---|---|---|---|---|---|
| An added H(s)H geometric feature produces a distinguishable signal | Freeze the source-grounded map family, decoder `g`, its `K` certificate, one terminal closure, and the common readout | Freeze all map/readout parameters on calibration data; use independent holdout units and certify domain coverage | A detector-space quantity after the full `X_n` to `D` closure | Run through the same readout, mode, calibration, units, and resolution | Compare in the same detector metric using a predeclared threshold that includes every map and instrument uncertainty; if the terminal closure is absent or collapses the distinction, the test is not scoreable |

This is an admission contract, not a new theorem. No combined Lean theorem for the `X_n` to `Field`/`D` composition is claimed here. A future formalization would need explicit map types and assumptions, then an exact-head Lean run and independent review before use.

## Physical and theory boundary

No measured system or dataset was selected in this run. No physical calculation, fit, prediction curve, uncertainty estimate, or numerical falsification threshold was produced. The P2 measured-geometry programme remains on HOLD. No worldtube thickness, twist, or contact-surface feature is promoted from optional to forced, and no BEDROCK theory statement is changed. No equivalence between GR, string theory, SM/QM, or information descriptions is asserted.

No SAT-O or Blockwave equation was transcribed, normalized, or corrected for this workflow note. Original source anchors were re-read by exact file/blob identity only:

- SAT-O1: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SAT O1 4D.txt`; blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; source commit `b543eb3fbf16e50500ceadad83dc9a7dc0759e5b`, dated `2025-10-27T00:40:28Z`.
- Blockwave: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`; blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; source commit `6e4415f62616b19ae5cb677984c85d1985834d9d`, dated `2026-10-08T02:42:49Z`.

No new Lean module, production code, branch, PR, task, or schedule was created. This note is a workflow proposal for review, not a physical result or theory promotion.
