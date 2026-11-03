# Elias Track A: typed build-outcome witness gate — CI repair and verification

**Nominal run:** `REVROT3-19-20261011:556:s3`  
**Selected ring identity:** Elias Kern (index 9); next identity Nadir Voss (index 10).  
**Disposition:** MERGE-REF LEAN BUILD VERIFIED / TARGET MODULE BLOB MATCHED / NO PRODUCTION OR THEORY PROMOTION.

## 1. Existing branch and repair

The work remains on the existing draft PR #951 branch:

- Branch: `research/elias-tracka-publisher-status-20261028t23z`
- PR head: `8ad21c2638a9f8f4a675aa07ebb2c70fcafbe2cd`
- Target module: `FORMAL_VERIFICATION/HsHVerification/EliasWorldtubeEvidenceWitnessGate.lean`
- Target-module blob at PR head: `938044dc22287c0c953ee59ecf743322c9e5b80d`

The preceding attempt, Actions #41580757558 / job #125734776850, failed at line 457 because the simplifier did not unfold the nested definition `ravelBuildRunArtifact` while checking the observed Ravel build record. The subsequent existing-branch commit `8ad21c2` added `ravelBuildRunArtifact` to the theorem's simp set. No theorem statement or workflow policy was changed.

## 2. Actual Lean run

Actions #41581373430 / job #125736755725 completed **SUCCESS**.

- Checked-out merge ref: `226b698b9ba4ed551b19edb1cfd496edd1949d31`
- Merge base: `c7dc2c483f50ae03fc7a7c530829170135e18d92`
- Lean: `4.34.0`
- Lake: `5.0.0`
- Full library build: **8,955 jobs; completed successfully**
- Target module: `EliasWorldtubeEvidenceWitnessGate`, built at 8,953/8,955
- Root aggregator: `HsHVerification`, built at 8,954/8,955
- Target-module blob at merge ref: `938044dc22287c0c953ee59ecf743322c9e5b80d`

The target module blob at the PR head and merge ref is identical. This is a successful **merge-ref** build, not a separate exact-head-only build.

## 3. Theorem-specific axiom output

All 15 theorem-specific reports in the target module were inspected.

| Theorem | Reported dependencies |
|---|---|
| `statusOnlyPassExample_formalization_gate` | `propext` |
| `status_only_gate_can_pass_without_witnesses` | `propext` |
| `witness_gate_implies_status_gate` | `propext` |
| `independent_review_witness_requires_distinct_refs` | `propext` |
| `observedRavel_source_and_build_witnesses_well_formed` | `propext, Classical.choice, Quot.sound` |
| `observedRavel_independent_translation_review_witness_missing` | none |
| `observedRavel_witness_gate_not_passed` | `propext` |
| `observedRavel_build_and_axiom_evidence_complete` | `propext, Classical.choice, Quot.sound` |
| `observedRavel_typed_witness_still_blocked_by_translation_review` | `propext` |
| `observedEliasSticky_build_succeeded` | `propext, Classical.choice, Quot.sound` |
| `observedEliasSticky_reports_remain_partial` | `propext, Classical.choice, Quot.sound` |
| `observedM87_target_module_blob_matches` | none |
| `observedM87_failed_build_is_not_accepted` | `propext, Classical.choice, Quot.sound` |
| `formalizationWitnessGateWithBuildOutcome_implies_build_accepted` | `propext` |
| `observedRavel_automated_audit_not_passed` | none |

The full job log contains **zero `sorryAx` and zero bare `admit` occurrences**. The reported `Classical.choice` and `Quot.sound` are standard Lean dependencies, not proof holes. The log's separate `admitRewrite` state label belongs to the pre-existing Hydra progress evaluation and is not a Lean `admit`.

The module's existing `#eval` outputs are `true, true, false`: source-content witness present, source-to-formal trace present, independent translation-review witness absent. These outputs concern the Ravel witness bundle; they are not a runtime authentication of GitHub or of the new build record.

## 4. What the gate now distinguishes

The observed records deliberately separate properties that a green badge or matching source blob cannot collapse:

- **Ravel:** successful build and complete theorem/axiom evidence; overall witness gate remains blocked because the independent translation-review witness is absent.
- **Elias sticky lifecycle:** successful build, but theorem-report coverage remains partial; it is not classified as complete build-and-axiom evidence.
- **M87 polarimetry:** target module blob matched, but the recorded workflow conclusion was failure; `buildRunAccepted` is false. Matching source identity does not turn a failed build into a successful proof check.
- **This witness-gate module:** the repaired target module was built successfully on the merge ref, with its blob matching the PR head.

This is a workflow-evidence distinction, not an empirical physics result.

## 5. Limits and remaining work

Lean checks the formalized predicates and encoded records only. It does not authenticate GitHub's underlying event, prove that a record was transcribed faithfully, establish source-to-formal translation fidelity, or validate any physical premise.

The four-axis Threading proposal remains separate from this build-specific witness gate. The existing Python `OutputReceipt` still stores free-form `metadata: Dict[str, str]`; the source `state_threshold_met` does not consume that metadata. No source-defined Python projection to the Lean four-axis record has been established. That correspondence remains **FORMALIZATION_BLOCKED_DEFINITION**.

No Python POC change, production workflow change, PR merge, theory promotion, physical calculation, H(s)H prediction, or paper-gate advancement occurred. The M87* branch remains blocked on its Lean failure and, more fundamentally, on a source-grounded H(s)H geometry-to-EM/Stokes/Faraday map and calibrated raw data with uncertainties. No raw UVFITS reanalysis or holdout prediction is claimed.

The next useful architecture step is to give the build witness structured repository / PR / workflow-run / job / event identifiers rather than relying on free-form locator strings, then separately define and test the source-backed Python `OutputReceipt` → four-axis projection in the sandbox. Independent Track B review remains required before any production integration.

**Status:** PR #951 remains open/draft/unmerged. No theory or production authority is conferred by this compile.
