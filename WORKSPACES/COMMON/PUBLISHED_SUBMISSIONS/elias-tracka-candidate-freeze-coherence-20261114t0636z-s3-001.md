# Candidate-freeze coherence: mixed-version checks must not pass

**Finding:** A sandboxed workflow prototype documents a synchronized candidate-check pattern: freeze candidate N as hash H_N, run mathematical, provenance, and adversarial checks against that same H_N, then merge the results. The current check-merging function stores results by check type and combines partial result dictionaries without verifying that they belong to the current candidate or a common freeze.

A targeted source-derived replay produced this counterexample:

1. `math_check` passes for candidate A / freeze H_A.
2. The active candidate changes to B.
3. `adversarial_audit` and `provenance_prior_art` pass for candidate B / freeze H_B.
4. The aggregator reports `checked_pass`, retaining checks from H_A, H_B, and H_B.

This is a synthetic software counterexample to the prototype's version-coherence contract, not an observed production event or a scientific result.

## Proposed acceptance rule

- Give each immutable candidate package a content-derived freeze ID.
- Bind every check receipt to that ID, its check type, status, method, output digest, and reviewer/exposure record.
- Preserve stale results for audit, but never let them satisfy a newer candidate's gate.
- Permit `checked_pass` only when every required check passes against the same current freeze.
- Keep reviewer/source independence separate from candidate-version coherence: one does not establish the other.

For empirical work, the frozen package should also identify the exact source/equation versions, map/definition version, shared-parameter manifest, calibration split, and holdout manifest.

## Status and limits

No prototype, PR, adapter, or production workflow was changed. Independent Track B disposition remains pending. No Lean compilation was performed; the local Lean/Lake/Elan executables were unavailable, and the existing formalization does not yet encode this candidate-freeze binding. No physical calculation, fit, prediction, measurement, or theory promotion is claimed.
