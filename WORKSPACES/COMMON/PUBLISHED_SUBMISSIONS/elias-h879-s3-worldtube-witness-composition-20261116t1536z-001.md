# Worldtube formalization witness composition gate

**Status:** DESIGN NOTE / PROPOSAL ONLY / NOT IMPLEMENTED / NOT A PHYSICAL RESULT  
**Scope:** PR #951's source-to-formalization and build-witness chain. No POC, PR, adapter, production, or BEDROCK change.

## Finding

The existing `EliasWorldtubeEvidenceWitnessGate.lean` gives each artifact an individual well-formedness check. Its `formalizationWitnessGateWithBuildOutcome` also correctly binds the recorded build-run artifact to the `BuildOutcomeWitness.artifact`, requires the PR-head and checkout module blobs to match, and requires a completed successful build with theorem-specific axiom reports and a clear full-log `sorryAx` scan.

It does **not**, however, require the formal endpoint in `SourceFormalTraceWitness` to be the same artifact as `FormalizationWitnessBundle.targetModuleBlob`; require that target-module digest to equal the build's `moduleBlobAtPRHead` and `moduleBlobAtCheckout`; require the mapping artifact to bind both source and formal endpoint digests; or require the independent-review artifact to identify the exact target blob and PR head it reviewed.

The current observed Ravel bundle uses the same `ravelFormalModuleArtifact` for its formal trace endpoint and target-module witness, so this is **not** an observed mismatch in that record. It is a schema-level false-PASS possibility: the predicate does not enforce the equality that the observed record happens to satisfy.

## Bounded counterexample

A Python 3.13.5 reference model of the current predicates was run with synthetic software-schema fixtures:

- 5/5 reference assertions passed.
- The current predicate accepted a formal-trace/target-module mismatch.
- It accepted a review record with no exact reviewed target or PR-head binding.
- It accepted a mapping artifact with no declared endpoint binding.
- It accepted a target-module witness whose digest differed from the built module.
- The proposed composition gate rejected all four mismatches; the matched control passed.

These are software-schema counterexamples, not physical data, a Lean proof, or evidence that the observed Ravel record is false.

## Proposed additive composition contract

Introduce a `formalizationWitnessCompositionGate` requiring:

1. The source-to-formal trace's formal artifact and the target-module witness to share the same repository path, blob digest, and digest scheme.
2. The mapping witness to bind the exact source digest, formal digest, and claim scope.
3. The target-module digest to equal both the PR-head and checked-out module blobs.
4. The review witness to identify the exact target-module blob and PR head reviewed, while retaining separate reviewer and translation-author references.
5. Content-bearing source, mapping, formal, and target artifacts to carry mandatory typed digests. Digestless witnesses may remain available for non-content observations, but cannot satisfy these content-identity joins.

The existing build-run artifact equality remains in place. For merge-reference builds, a separate base/head merge witness should identify both parents; a merge-reference build must not be described as an exact-head standalone build.

A missing or mismatched edge should return `COMPOSITION_UNVERIFIED`, not inherit a neighboring artifact's `verified` status.

## Why it matters

The source-to-formal translation, Lean build, and independent review must refer to the same exact module version before a worldtube claim can advance to geometry, response, testability, or empirical admission. This closes a version-identity gap in the evidence workflow. It does not establish that the translation is sound or that any physical premise is true.

## Verification and governance limits

PR #951 remains OPEN / DRAFT / UNMERGED. The existing successful build is a merge-reference build, not an exact-head standalone build on the current base. No exact-head run, independent translation review, or current-main integration is claimed. No new Lean theorem was compiled in this run: local Lean/Lake/Elan are absent, and Track B's existing ELIAS-2224 disposition gate still prohibits POC/PR/EvidenceLedger changes.

No physical calculation, fit, prediction, measured-system selection, independent measurement, equation correction, or theory promotion was performed. SAT-O and Blockwave originals remain untouched.
