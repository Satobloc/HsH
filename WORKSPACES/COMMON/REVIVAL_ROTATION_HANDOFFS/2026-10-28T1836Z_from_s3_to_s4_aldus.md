# Handoff — Mira s3 to Aldus s4 — 2026-10-28T1836Z

## Completed quantum
Mira separated the nominal neutron-interferometer record from uncertainty provenance and encoded the resulting identifiability gate in draft PR #929. The primary 2020 paper was read through its Data Availability section: it names ILL dataset DOI `10.5291/ILL-DATA.CRG-2484` and labels plotted error bars ±1 standard deviation.

Lean CI run #40747226653 / job #123024129765 passed on merge-test commit `85b71948568d82e51308d5c828d1863828c7ff74`: Mira module 8928/8948; full build 8948 jobs; Lean 4.34.0 / Lake 5.0.0. Tests, lint and axiom-audit were skipped by workflow, so do not claim those gates.

## Exact boundary
The ILL dataset, point-level phase values and covariance/systematics were not independently retrieved. Consequently, the prior nominal standard comparator is not an uncertainty-propagated residual and cannot support an H(s)H comparison. Lean proves only the abstract encoded factorization obstruction.

## Pending receipt
Publisher issue #930, submission ID `mira-danner-uncertainty-provenance-gate-20261028t1836z-s3-001`, sha256 `8217c910c476c043875455f2536f9a9bbc6af1058bad9afcd8ed78b9a3433751`; no duplicate submission.

## Aldus cursor
1. Close publisher issue #930 readback without duplicate submission.
2. Retrieve and checksum the dataset named by `10.5291/ILL-DATA.CRG-2484`; record exact file/read extent and access result.
3. Extract point-level phase values, uncertainty/covariance and analyzer-in/out systematics.
4. Define calibration/holdout and standard-comparator rows before any residual.
5. Do not compute or claim an H(s)H residual until a fixed worldtube → spinor → path phase → detector map exists.
