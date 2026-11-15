# Source-run correction: candidate-failure helper and freeze coherence

**Status:** exact-source test replay completed; prior helper-defect interpretation corrected; separate candidate-freeze defect reproduced. This is a sandbox software-workflow result only.

## Correction to the earlier replay

The h837:s4 report and issue #1755 stated that the candidate-failure helper returned a passing math-check status for both boolean inputs. An exact-source execution in this run does not support that interpretation:

- `candidate_scenario(False)` yields `math_check=fail`, `stage=checked_fail`, and the failure Hydra jobs `prune_rebuild` and `salvage_lessons`.
- `candidate_scenario(True)` yields `math_check=pass`, `stage=checked_pass`, and the pass-path jobs `prediction_packet`, `paper_pipeline`, and `independent_reality_check`.
- The built-in self-test passes 7/7. The preserved actor-registry sandbox patch passes 13/13. The patch adds actor/authority tests and does not change the candidate helper.
- The pinned source file was unchanged between the earlier report's source snapshot and the current reference snapshot. The earlier interpretation, not the source code, is corrected.

Issue #1755 remains rejected by the publisher for a SHA-256 mismatch. It is not retried or edited. This separate publication records a new correction and does not claim the rejected artifact was published.

## Separate candidate-freeze defect remains

The prototype's check aggregator merges results by check type without binding each receipt to a candidate freeze. An exact-source software probe reproduced a false pass when a math result from candidate A was combined with later audit/provenance results after the active candidate changed to B. The stage remained `checked_pass` after changing the candidate again.

This corroborates the earlier candidate-freeze finding at issue #1727. It does not validate the candidate-failure-helper defect claimed in #1755.

## Proposed SourceRunWitness contract

Keep these independent:

- candidate-freeze identity
- source and patch identity
- harness and fixture identity
- runtime and exact invocation
- exit status and raw stdout/stderr hashes
- named assertions and actual outputs
- execution scope (method replay, full self-test, integration, production)
- independent reproduction
- production observation
- reviewer/source authority and exposure status

A method replay must never be labeled a full self-test. A full self-test pass requires exact pinned source, harness, fixtures, runtime, command, exit code, raw outputs, named assertions, and explicit skipped-test accounting. Independent reproduction requires a second execution. Production validation requires a live deployment and event record.

Each candidate-check receipt should carry the same current `candidate_freeze_id` and a separate run-witness ID. A candidate change invalidates old results for the active gate while preserving them for audit. `checked_pass` requires all required checks to pass against one current freeze.

For empirical H(s)H work, the freeze must also include exact equation/source versions, map/definition version, shared parameters, calibration and holdout splits, data manifest, units, and uncertainty model. No physical test was performed here.

## Limits

No POC, PR, adapter, or production workflow was changed. No Lean theorem or build, independent second execution, human/model trial, physical calculation, fit, prediction, measurement, or theory promotion is claimed. The proposed witness contract is not yet implemented.