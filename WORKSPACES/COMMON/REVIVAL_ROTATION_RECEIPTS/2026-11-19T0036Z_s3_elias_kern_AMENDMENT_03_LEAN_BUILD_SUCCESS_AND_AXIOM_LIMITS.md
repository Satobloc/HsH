# H936:s3 receipt amendment 03 | Lean build success and theorem-specific axiom limits

This amendment supersedes the pending state in amendment 02 for the corrected PR head. It preserves both earlier failed attempts and their diagnostics.

## Corrected-head verification succeeded

- PR: [#2032](https://github.com/Satobloc/HsH/pull/2032), still OPEN / DRAFT / UNMERGED.
- Corrected head: `aad65f2dfd4edb216b6b0fe2dc12adfacaf87cc5`.
- Exact-head Actions run: [#44432360003](https://github.com/Satobloc/HsH/actions/runs/44432360003).
- Job #135252648340: SUCCESS.
- Exact PR-head checkout assertion: PASS.
- Lake dependency manifest: PASS.
- Lean 4.34.0 / Lake 5.0.0.
- Full `lake build HsHVerification`: SUCCESS, 8,952 jobs.
- New module `HsHVerification.ProducerQuiescence`: built successfully.
- Runtime evaluations: `TemporalOrder.before` and `TemporalOrder.after`.

## Theorem-specific axiom results

- `producer_completion_before_seal_and_seal_before_unblinding`: **does not depend on any axioms**.
- `seal_before_unblinding_does_not_imply_producer_completion_before_unblinding`: depends on `[propext, Classical.choice, Quot.sound]`.
- No `sorryAx` appears in the successful theorem report.
- Existing `definitelyBefore_transitive` also reports no axiom dependencies.

The global axiom-audit stage, tests, and lint stages were skipped by the workflow. Therefore this is a successful Lean library build and actual evaluation, with theorem-specific axiom output, but not a completed global axiom audit or independent review. The counterexample theorem is not axiom-free.

## What the proof establishes, and what it does not

It proves a conditional interval-order implication: if a producer-completion interval is definitely before a prediction-seal interval, and the seal is definitely before holdout unblinding, then completion is definitely before unblinding. The abstract counterexample shows that seal-before-unblinding alone does not imply producer completion-before-unblinding.

It does not authenticate event records, bind completion and seal to the same provider run, establish complete access-log coverage, prove holdout inaccessibility, validate the source translation, or establish any physical premise. Those source-bound witness requirements remain open.

P2 remains HOLD. No measured system, dataset, physical calculation, fit, prediction, numerical falsification threshold, or independent measurement. No SAT-O or Blockwave equation changes. No theory promotion. No changes to Elias Track A PR #951, the Switchboard/Threading POC, adapters, or production.

The earlier failures remain part of the record:
- Run #44431124843 failed because `seal` was parsed as a reserved token.
- Run #44431663457 failed because the counterexample proof did not synthesize `Decidable`; its failed theorem output included `sorryAx`.
- Run #44432360003 is the corrected-head successful build documented here.
