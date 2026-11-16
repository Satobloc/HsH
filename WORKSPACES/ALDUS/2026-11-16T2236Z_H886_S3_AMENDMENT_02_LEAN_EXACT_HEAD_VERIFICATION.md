# Amendment 02 | Exact-head Lean verification

**Status: LEAN_EXACT_HEAD_PASS.**

[GitHub Actions run #43973867276](https://github.com/Satobloc/HsH/actions/runs/43973867276) completed successfully against PR #1860's exact head.

## Exact source and environment

- PR: [#1860](https://github.com/Satobloc/HsH/pull/1860), still OPEN / DRAFT / UNMERGED.
- Asserted PR head: `1dc0f79901e18ff7df609db6ecf723c7c80afa70`.
- Exact-PR-head checkout assertion: PASS.
- Actions job: `133672845635`.
- The Actions environment's `GITHUB_SHA` printed synthetic merge commit `a1eccb0a91dcf67a4663b4eccabaa16edd203ddc`; the workflow's explicit head assertion separately verified the actual PR head above.
- Lean 4.34.0.
- Lake 5.0.0.
- Mathlib requirement tag: `v4.34.0`.
- Full library: 8,951 jobs, SUCCESS.
- New module `HsHVerification.AldusTemporalProvenance`: built at 8,949/8,951.

## Executed probes

The four `#eval` outputs, in source order, were:

1. First-public claim / repository-ingest event: `false`.
2. First-public claim / public-release event: `true`.
3. First-public claim / analyst-access event: `false`.
4. Earliest-extant-known claim / repository-ingest event: `true`.

These confirm the intended classification table.

## Axiom and proof report

No `sorryAx` or custom axioms were reported.

The following core theorems reported no axiom dependencies:

- `definitelyBefore_irreflexive`
- `definitelyBefore_transitive`
- `no_order_across_clock_domains`
- `no_order_across_clock_scales`
- `first_extant_and_first_public_are_distinct_claims`
- `public_mention_is_not_analyst_access`
- `public_mention_is_not_context_inclusion`

The remaining theorem reports in this module depended only on `propext`. No `Classical.choice`, `Quot.sound`, or `sorryAx` appeared in the new module's theorem reports.

## Warnings and skipped checks

The module compiled with three non-fatal compiler warnings:

- Two unused names for conditional equality proofs in `compareIntervals`.
- One unused simp argument in `incomparable_when_known_clock_scales_differ`.

The workflow skipped tests, lint, leanchecker, nanoda, and the separate global axiom audit. The successful build is therefore not a claim that those checks passed.

## Limits

The build verifies the formalized contract only. It does not authenticate timestamp truth, source bytes, source-coverage completeness, cryptographic sealing, holdout isolation, analyst exposure or its absence, reviewer independence, implementation refinement, or any physical H(s)H premise. No physical calculation or prediction was performed; P2 remains HOLD.

The report's original publication-time LEAN_PENDING label is retained as a historical snapshot. This amendment supersedes it for current verification status without altering the published artifact.
