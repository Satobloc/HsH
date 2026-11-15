# Meridian h846:s3 amendment 02: final-head verification and discovery readback

**Parent artifact:** [Issue #1776](https://github.com/Satobloc/HsH/issues/1776).  
**Status:** Additive verification amendment. The earlier pending status was correct at submission time and is superseded by this readback.

## 1. Final-head Lean result

The existing [PR #1471](https://github.com/Satobloc/HsH/pull/1471) is OPEN / DRAFT / UNMERGED at head `0d40ba0ff5bee19beee36b87b202e66490463e09`, based on `infra/lean4-verification-20261023`. It is not a current-main integration.

Workflow run [#43687772215](https://github.com/Satobloc/HsH/actions/runs/43687772215) completed with overall FAILURE on a PR merge reference.

- The `CodeGrurpleObservationGate` target built.
- The target theorem axiom reports list only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appears in those reports.
- The full root build failed in the separate `MovingPlaneTraceGeometry.lean` module at lines 72, 76, 80, 84, 96, 100, and 197.
- Those failures are outside the PR's changed-file list.
- Tests, lint, nanoda, leanchecker, and the separate global axiom audit were skipped.

The earlier run on the preceding head failed in the new observation module. The current head removed those module errors, but the full verification root still does not build. This is a target-module build success, not an overall library-build success, and not an exact-head standalone or current-main integration.

Lean checks only the formalized state machine. It does not inspect a browser, verify a deployment, recompute external capture hashes, or establish the truth of source/derivative/route attestations.

## 2. Latest discovery snapshot

The latest main refresh commit is [22fd97cb](https://github.com/Satobloc/HsH/commit/22fd97cbabb9a854f827f233f5e15d2e5cc08611). Its parent is `daf1cb0262c71b34c36d73a7a0f298f574b05da`, which exactly matches the HsH source commit embedded in the generated discovery snapshot updated at 2026-11-15T07:17:34Z.

This refresh is source-consistent for this instance. It does not establish that the generator has a permanent transactional guard against future source-head races.

Current index counts:

- 14,992 documents.
- 8,061 WORKSPACES records, all 8,061 with raw reader targets.
- 48 rolling-docket entries.
- 577 visual records.
- 6 reported errors.
- Search scope is titles, paths, formats, and bounded excerpts; full-text research requires Mersearch.

The two protected Paper R1 records remain discoverable, but their raw reader targets remain present:

| Paper | Protected source blob | Current reader target | Excerpt |
|---|---|---|---:|
| A, `DRAFT_R1.tex` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | Raw reader route present | 0 characters |
| B, `DRAFT_R1.md` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | Raw reader route present | 1,400 characters |

Both source blobs still match their protected Code Grurple identities. The raw routes remain contrary to the existing presentation policy. Paper B also retains a raw excerpt.

The canonical P0 incident remains [issue #1747](https://github.com/Satobloc/HsH/issues/1747). No live route probe, site change, manuscript edit, PDF build, or P0 standdown occurred.

## 3. Scope

No physical calculation, fit, H(s)H prediction, independent measurement, P2 selection, or theory promotion occurred. No production change was made.