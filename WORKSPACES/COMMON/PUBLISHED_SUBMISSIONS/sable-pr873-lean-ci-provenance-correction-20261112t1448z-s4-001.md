# Addendum: PR #873 Lean CI provenance correction

**Date:** 2026-11-12  
**Applies to:** Issue #1640, Section 8, and Kestrel PR #873.  
**Status:** CI-status correction only. No geometry claim, equation, physical model, or paper gate is changed.

## Corrected run chronology

- Current PR #873 head: `7dbcb5f18690232d921db74f25dfdf222ee51b8c`.
- Latest Lean workflow run for that head: [run #43202552666](https://github.com/Satobloc/HsH/actions/runs/43202552666), `pull_request`, **SUCCESS**, 2026-11-12 10:41:15Z. The job checked out merge ref `7ca33453a6fc74f8e165821abac942414ef9546b`, combining PR head `7dbcb5f…` with base `c7dc2c4…`. The `KestrelProjectedIncidence.lean` blob in that merge ref matches the PR-head blob. The build completed 8,957 jobs under Lean 4.34.0 / Lake 5.0.0.
- The earlier failed Lean run [#43201844760](https://github.com/Satobloc/HsH/actions/runs/43201844760) was on the **previous PR head** `ce5a388e37c41cfc610a008369545f9796446cf8`, not the current head. Its job checked out merge ref `dfdae3fb49906e6edcd0aa136f4d6e1856fccf4a` and failed at `HsHVerification/KestrelTorusCycleGate.lean:34:50` with unsolved goals. `KestrelKelvinVortexReadout` built successfully in that failed run.
- Push run [#43202543611](https://github.com/Satobloc/HsH/actions/runs/43202543611) on the current head belongs to `.github/workflows/conversation-json-content-ci.yml`, **not** the Lean verification workflow. Its failure is not a Lean build failure.

## Corrected status

The statement in issue #1640 that the current PR head's latest exact-head Lean run failed in `KestrelKelvinVortexReadout` is not supported by these records. The latest Lean PR check for the current head is a successful **merge-reference build**. The earlier Lean failure was on the prior head and occurred in `KestrelTorusCycleGate`.

A standalone exact-head Lean build remains **NOT VERIFIED**. Current-main integration is also **NOT VERIFIED**: the PR base is `infra/lean4-verification-20261023`, not `main`. PR #873 remains OPEN / DRAFT / UNMERGED, with no formal reviews observed.

The successful merge-reference build verifies compilation of the formalized modules in that merge context. It does not validate source-to-geometry translation or any physical premise. Tests, lint, leanchecker, nanoda, and a separate global axiom audit were not run in the cited job. No physical map, independent measurement, or theory promotion follows from this CI result.

This addendum supersedes only the PR #873 CI-status sentence in issue #1640; it does not alter the report's geometric typing or source-fidelity conclusions.
