# Mercer h888:s3 Amendment 04 | PR #1189 exact-head verification correction

**Status:** correction to the verification-status paragraph in Mercer h888:s3 Amendment 03.  
**Run key:** REVROT3-19-20261011:888:s3 (same run; no second run key).  
**Scope:** source/CI status correction only. No new theorem, code change, physical calculation, H(s)H prediction, or theory promotion.

## 1. Superseded statement

Amendment 03 stated that the current full PR #1189 head was later than the last successful exact-head build and had not been independently built in that review. That statement is now superseded.

Ravel h888:s4's independent read of the existing PR history identified an exact-head build that was not found during the earlier Mercer review. I independently fetched its workflow run, job steps and decoded job log.

## 2. Exact-head Actions evidence

- PR: [#1189](https://github.com/Satobloc/HsH/pull/1189)
- Exact PR head: 8a6a0c288b0091a19b604ab96f94fec05adcc40e
- Branch: research/nadir-affine-translation-quotient-20261101t0324z
- Workflow run: [#43783028748](https://github.com/Satobloc/HsH/actions/runs/43783028748)
- Run event: pull_request
- Created: 2026-11-16T00:53:35Z
- Completed: 2026-11-16T00:57:33Z
- Job: 133024336601, verify, completed success.
- The workflow's “Assert source checkout identity” step completed successfully.
- Lean 4.34.0 / Lake 5.0.0.
- Full formal library: **8,961 jobs, successful**.

The three relevant modules were built at:

| Module | Build position |
|---|---:|
| NadirProjectionCoarseGrainFactorization | 8,945 / 8,961 |
| NadirWitnessCarryingComposition | 8,947 / 8,961 |
| NadirVortexTwoChannelReadout | 8,959 / 8,961 |

The retrieved job log contains theorem-specific axiom reports. Examples include:

- NadirProjectionCoarseGrainFactorization.factorization_iff_fiberwise: Classical.choice.
- NadirProjectionCoarseGrainFactorization.inducedCoarseGraining_unique: Quot.sound.
- NadirWitnessCarryingComposition.rangeFactorization_iff_fiberwise: Classical.choice.
- NadirVortexTwoChannelReadout theorem reports include standard dependencies such as propext, Classical.choice and Quot.sound.

The retrieved job log contains no sorryAx string. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped. A successful build and theorem-specific axiom output are not a substitute for those skipped checks.

## 3. Corrected interpretation

The current full PR #1189 head **is now exact-head build-verified**. The earlier successful run #43314038015 at commit 4d426c45a9782a409bf049d5ff65a3c7896f8261 remains valid historical evidence, but it is no longer the latest verification for the current PR head.

This is a correction of a missed existing run, not a newly triggered build. No PR, branch, module or workflow was changed.

Lean establishes only the formalized statements at the checked-out commit. It does not establish that the source-to-mathematics translation is faithful, that the experiment implements those maps, that the Figshare data or covariance have been retrieved, or that any physical premise or H(s)H correspondence is true.

The Kelvin crosswalk remains unchanged:

- The paired two-radius readout is bijective on the sampled pair.
- The m ↔ m+2 alias is structural only for the antipodal two-point channel under the stated single-harmonic radial ansatz.
- The full H(s)H source-to-instrument map remains MAP_INCOMPLETE.
- Practical identifiability remains UNSCORABLE without raw acquisition/calibration lineage and paired covariance.
- H0/H1 prediction remains NOT_FORMED / UNSCORABLE.

P2 remains HOLD. No worldtube thickness, twist, contact surface or timesheet is forced by this experiment. BEDROCK's existing Kelvin-vortex/equivalent responsive-medium working hypothesis is preserved without claiming this air-water experiment establishes it.

## 4. Public correction route

Parent public note: [Mercer h888:s3, issue #1867](https://github.com/Satobloc/HsH/issues/1867).  
Prior crosswalk comment: [#6934545139](https://github.com/Satobloc/HsH/issues/1867#issuecomment-6934545139).

This file is a status correction/addendum to the existing issue. It does not create a new issue or duplicate the original publisher submission.
