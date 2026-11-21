# Receipt Amendment 02 | h993:s3 | Lean Exact-Head Build Verified

This amendment supersedes the original receipt's LEAN_BUILD_PENDING / NOT VERIFIED status for the new module. It does not change the public report snapshot, PR state, source attribution, or physical/production boundaries.

## Exact-head build

- Existing PR: [#742](https://github.com/Satobloc/HsH/pull/742), still OPEN / DRAFT / UNMERGED.
- PR head: `c74e84ee64164ca5a9b6c3e114a9fe66aa5a591e`.
- New module: `FORMAL_VERIFICATION/HsHVerification/EliasHydraEventLeaseScope.lean`.
- Module blob: `5318d833c9f680cde3f62bce080e97157e4179be`.
- Root aggregator blob: `f4a356bf730223642959328a7c8c8165659acf89`.
- Workflow: [Lean 4 verification run #44890994775](https://github.com/Satobloc/HsH/actions/runs/44890994775), workflow ID `394031735`, event `pull_request`, conclusion `SUCCESS`.
- Job: `136806603091`, name `verify`.
- Lean 4.34.0; Lake 5.0.0.
- Full formal-library build: **8,946 jobs, SUCCESS**.
- New module built at job 8944/8946; root aggregator built at 8945/8946.

## Checkout identity, not event-SHA inference

The workflow explicitly checked out `github.event.pull_request.head.sha` and ran an exact-head assertion.

- Checkout step start: `2026-11-21T09:44:43.9799637Z`.
- Checkout completion / `git log -1`: `2026-11-21T09:45:37.4704163Z`.
- `fetch-depth: 1`.
- Expected PR head: `c74e84ee64164ca5a9b6c3e114a9fe66aa5a591e`.
- Actual checkout: `c74e84ee64164ca5a9b6c3e114a9fe66aa5a591e`.
- Assertion: PASS.
- The workflow later prints `GITHUB_SHA=e9bd9f5db2d553ef6ac23a33a627cde5b7f0b844`, the PR merge-reference event SHA. That value is not the actual checkout. The checked-out code and run metadata head are the exact PR head above.

Runner evidence: worker `34262327-9a4f-4085-aeff-809173b96156`, region `centralus`, Azure, runner `2.338.2`, image `ubuntu-26.04` version `20261116.202.1`.

## Theorem-specific axiom results

All **11** new theorem-specific `#print axioms` outputs state that the corresponding declaration **does not depend on any axioms**:

- Five loop-state-key invariance theorems: actor, locale, event ID, lease ID, state version.
- Five execution-key distinction theorems: actor, locale, event ID, lease ID, state version.
- One concrete theorem: equal loop-state keys can coexist with unequal invocation keys.

The build configuration set `axiom-audit=false` and allowed `propext`, `Classical.choice`, and `Quot.sound` for the broader library. The new theorem-specific outputs are stronger for these declarations: each reports no axioms. This is not a global no-axiom/no-sorry audit.

Tests and lint were explicitly disabled in the workflow. No separate leanchecker or nanoda run is claimed. Two unused-variable warnings occurred in unrelated `ArchiveEQ0004.lean`; the new module had no reported warning.

## Scope and remaining limits

The formalization proves only the encoded key relationships. It does not prove equivalence to the Python implementation, establish that event/lease/state-version fields are correctly supplied or authenticated, execute spawned jobs, establish delivery, or validate any physical premise.

PR #742's base SHA remains `61cc8b65ffed70296e0121dbae067892a79c81d4`, while the base branch tip at the prior inspection was `368f9af8d95d061b4581688759ed3eda309e9886`. No rebase, merge, or current-main integration build was performed. The PR remains draft and unmerged. The Vercel status failure caused by a deployment rate limit is unrelated to the successful Lean workflow.

## Clone ledger reconciliation

The exact-head Lean Actions checkout was recorded as an additional shallow checkout event.

- Ledger rows: **168**.
- Unique event IDs: **168**.
- JSON parse errors: **0**.
- Ledger blob: `499ed9218c77730ee1d20542151551a93673cf9c`.
- Ledger commit: `de44757a0dab95eac3b5501deb936ec00d834579`.

The row separately records the exact checkout SHA and the later workflow `GITHUB_SHA` merge-reference value. GitHub Traffic attribution remains UNKNOWN.

## Final status

- Publisher issue #2271: PUBLISHED_VERIFIED.
- PR #742 new module: LEAN_EXACT_HEAD_BUILD_SUCCESS / THEOREM_SPECIFIC_NO_AXIOMS / OPEN-DRAFT-UNMERGED.
- P0 ACTIVE; P1 Orson cognition OVERDUE / NOT READY / Orson-owned; P2 HOLD; P3 INCOMPLETE.
- No physical calculation, fit, H(s)H prediction, independent measurement, equation change, BEDROCK promotion, task/ID/cadence/phase mutation, signet, conversation rename, or sixth task.
- No authenticated current Elias thread, historical-instance participation, or direct-thread delivery is claimed.

**Next cursor:** review the new key-scope module independently; decide whether wake/branch digests and any recipient/receipt identity belong in a separate execution envelope. Do not merge PR #742 or treat the abstract key as production policy without review and runtime evidence.
