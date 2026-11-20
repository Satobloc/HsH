# Mercer h983:s3 → Ravel h983:s4 | Optional coupled-readout proof context

**Classification:** TIMING_UNVERIFIED_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / NO_ASSIGNMENT / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER.

## Purpose

A narrow Lane 36 architecture/proof improvement was developed because the existing coupling-preserving projection contract and pairwise-discrimination record had a specific formalization gap: the generic readout factorization theorem had not been instantiated with a heterogeneous product readout (observable, coupling signature).

## New formal work

- [Stacked PR #2236](https://github.com/Satobloc/HsH/pull/2236), currently OPEN / DRAFT / UNMERGED.
- Branch: `research/mercer-coupled-readout-metric-20261120t2336z`.
- Current PR head at packet creation: `7eb96858b7295bc24ce7a9d1e38e94ee217a75a4`.
- Base: Ravel's `research/ravel-carrier-slice-reconstruction-20261031t0212z` branch, head `fc7f92722fe5e0757d55f961b54a12bdee66d5da`, associated with PR #1133. The new PR does not modify Ravel's branch.
- New module: `FORMAL_VERIFICATION/HsHVerification/MercerCoupledReadoutMetric.lean`.

The intended theorems state that a product readout (Q=(O,C)) descends through a tube-only or sheet-only quotient iff both components are constant on the corresponding projection fibers. A component difference on a same-fiber pair is a no-go witness for that reduction.

The same module adds a dimension-indexed scalar interface. A raw sum of squared channel differences can carry one dimensional signature only when the channel dimensions agree. A diagonal normalized squared discrepancy can instead be formed using separate positive reference scales with dimensions matching their respective channels.

## Verification state at packet creation

- First merge-reference build: Actions run #44838777695, failed in the Lean source. Two issues were corrected: the product-readout corollaries now use explicit definitional changes, and real division definitions are marked noncomputable; the dimension-division proof now uses simplification rather than reflexivity.
- Second merge-reference build: Actions run #44839250236, currently IN_PROGRESS at packet creation. Do not infer success.
- The first run used default PR merge ref `refs/pull/2236/merge`, fetch-depth 1, checkout SHA `3a3c4f0992f8a7b044a48392a3711e5f2f80e34c`; this is expected to differ from the PR head. Checkout/Traffic evidence is recorded in the HsH clone ledger.
- The new module has not yet passed a successful compile. No exact-head build is claimed.

## Physical and source boundaries

- The November 4 direct source makes mutual worldtube-timesheet curvature the tentative working hypothesis while leaving worldline-only and timesheet-only representations open.
- The November 5 direct source identifies worldtube, timesheet and responsive medium as candidate perturbation carriers, while leaving the medium/timesheet relation unresolved.
- This does not select a carrier, prove equivalence, establish a physical metric, or determine a coupling law.
- The September 9 archive paper `DIMENSIONAL_NORMALIZATION.tex` proposes one frozen coordinate normalization (w=ct). The new per-channel reference scales are a separate measurement-space comparison device, not a new physical coordinate map. They must be justified by calibration/source, frozen before holdout, and never tuned to holdout outcomes.
- No H(s)H physical map, measured system, dataset, calibration, covariance, fit, prediction, or independent measurement is instantiated. No numerical physical calculation is performed.
- The normalized diagonal discrepancy is not asserted to be a metric or likelihood. If covariance is material, a covariance-aware metric must be specified; otherwise retain componentwise thresholds rather than silently combining channels.
- No SAT-O or Blockwave equation, manuscript, BEDROCK theory statement, P0 presentation object, site route, or existing PR #1133 file was modified.

## Existing work reused

- [CPPG v0.1, issue #2234](https://github.com/Satobloc/HsH/issues/2234).
- [PDR v0.1, issue #2228](https://github.com/Satobloc/HsH/issues/2228), still rejected for SHA mismatch at last read.
- [Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133), generic fiber-factorization and dimensional-audit modules.
- [Math Hopper #578](https://github.com/Satobloc/HsH/issues/578) and PR #991 remain existing infrastructure; no new tooling was built.

## Recipient boundary

Ravel is the next deterministic ring label, not an authenticated ChatGPT identity. This packet is optional repository context only. It is not a review assignment or a request to modify PR #1133. No direct-thread delivery, consumption, acknowledgment, response obligation, or ownership transfer is claimed.
