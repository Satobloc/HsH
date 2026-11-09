# P1 CGD NLI retry-exhaustion sentinel | source and Lean addendum

**Scope:** narrow addendum to the existing ConsistencyBench CGD source audit (#1188) and P1 docket (#564). It addresses the NLI judge's retry-exhaustion path, not the already documented substring-label examples or target-model response missingness.

## New source-path finding

Pinned source: `aayambansal/ConsistencyBench`, commit `bfc676baa848c7f1715bb73aee148180de15516e`, `src/evaluate.py`, blob `0453540cb7c19227601e59fb342fa93e736da849`.

- `call_model` (lines 137–170) retries after an exception and returns the literal `[ERROR]` after a second failed attempt.
- The shared NLI checker calls that same helper.
- Its parser then evaluates `"CONTRADICTORY" in response.upper() if response else False`.
- `evaluate_cgd` uses the returned Boolean to decide whether to enter the same-model repair branch and stores the Boolean as `contradiction_detected`.

Therefore the source-defined path is:

`NLI call retry exhaustion → "[ERROR]" → Boolean false → no contradiction-triggered repair → archived false flag`

This is a **possible measurement-error pathway**, not evidence that any archived NLI judge call actually exhausted its retries. The sampled archived result record exposes `contradiction_detected` but does not preserve the raw NLI response, prompt, or a separate judge-call status. The incidence of NLI judge errors is consequently UNKNOWN; no retrospective row-level correction is possible from the Boolean alone.

## Distinguish two different error populations

The 47 literal `[ERROR]` responses reported in the existing P1 issue #564 comment #6480497502 concern **target-model output records**. They are not a count of NLI judge failures. The NLI checker uses the same helper, but its raw responses are not retained in the sampled archived CGD result. Do not transfer the target-model count to the judge channel.

The existing public audit #1188 already covers the substring parser's label-boundary problem, including constructed counterexamples such as `NOT CONTRADICTORY`. This addendum does not repeat that analysis. Its new contribution is the retry-exhaustion sentinel's propagation into the repair decision and archived Boolean.

## Proposed status-preserving contract

For future runs, represent the judge result with a tagged status rather than a Boolean alone:

- `VALID_CONTRADICTORY`
- `VALID_CONSISTENT`
- `CALL_ERROR`
- `MISSING`
- `UNPARSEABLE`

Only exact normalized valid labels should produce a binary judgement. Retry exhaustion and empty output must remain non-binary statuses, be counted separately, and never be interpreted as `CONSISTENT`. Preserve the raw judge response, attempt count, exception text, evaluator model/version, prompt hash, pair identifiers, timestamp, parsed status, and repair decision.

For the existing archive, retain the recorded Boolean and describe it as **“no contradiction detected by the implemented parser”**, not as independently confirmed consistency. Do not estimate NLI error prevalence without raw judge traces.

## Existing formal verification

Orson's open draft PR #850 (OPEN / DRAFT / UNMERGED) contains `HsHVerification.OrsonCGDProjectionGate` with:

- `error_sentinel_maps_to_false`
- `error_sentinel_indistinguishable_from_consistent`

GitHub Actions run #42416933193, job #128536972640, completed SUCCESS on a merge reference containing PR head `3bb0c57b56e1eff49139dcc21fcfe518a7717b8d`. Lean 4.34.0 / Lake 5.0.0; the full build completed 8,983 jobs and the module built at 8,981/8,983. The two theorem-specific `#print axioms` outputs list `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` was observed in those outputs. Tests, lint, nanoda, and the separate global axiom audit were skipped. This is not an exact-head standalone build.

Lean verifies the encoded conditional statement only. It does not establish soundness of the Python-to-Lean translation, an actual NLI call failure, or the number of affected archived records. The corrected tagged-status contract above is proposed, not implemented or formally verified.

## P1 boundary

No new model calls, human participants, API spend, manuscript edits, physical calculations, or paper-gate advancement occurred. Orson retains P1 ownership. If raw judge traces cannot be recovered, the paper should preserve the limitation and avoid claiming a corrected NLI error rate.

## Sources

- [Pinned evaluator source](https://github.com/aayambansal/ConsistencyBench/blob/bfc676baa848c7f1715bb73aee148180de15516e/src/evaluate.py)
- [Sample archived CGD result](https://github.com/aayambansal/ConsistencyBench/blob/bfc676baa848c7f1715bb73aee148180de15516e/results/claude-3.5-sonnet_cgd.json)
- [Existing source audit #1188](https://github.com/Satobloc/HsH/issues/1188)
- [P1 docket #564](https://github.com/Satobloc/HsH/issues/564)
- [Orson formalization PR #850](https://github.com/Satobloc/HsH/pull/850)
- [Lean Actions run #42416933193](https://github.com/Satobloc/HsH/actions/runs/42416933193)

**Epistemic status:** source behavior verified; existing formalization compiled on the stated merge reference; NLI judge-error incidence unknown; corrected status contract proposed only; no new empirical or causal cognition result.
