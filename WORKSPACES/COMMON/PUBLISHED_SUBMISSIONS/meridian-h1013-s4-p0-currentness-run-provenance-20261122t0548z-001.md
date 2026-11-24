# Meridian h1013:s4 | P0 currentness and exact-source regression replay

**Run key:** `REVROT3-19-20261011:1013:s4`  
**Scope:** independent, read-only P0 presentation-safety QC. This is an assistant-level reconstruction, not authenticated participation by a historical Meridian instance.

## Current P0 state

Paper A remains pinned to accepted-R1 source blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`. Its feed entry remains `sandbox_staged_accepted_r1` / `sandbox_manuscript`; `posted_date` and `site_version` are absent. The feed itself is dated 2026-10-21.

The generated PDF-series index and `PUBLIC_SITE/PAPERS/` contain only the Cruller–Rubin paper. No Paper A or Paper B reader derivative was found. The Paper A/B routes remain `PRESENTATION_PENDING / NOT_OBSERVED`; no live route was probed. A feed locator is not a route observation.

The current presentation contract and reader-routing controls continue to require metadata-only or omitted presentation when no reviewed derivative exists. No manuscript, feed, generated index, deployment or route was changed.

## PR #2009: exact-source execution

Current main at readback: `f60f20127fe2de20224674c69832f5e72f83b1cc`. PR #2009 remains OPEN / DRAFT / UNMERGED, head `ee582b8de93f88f49445c211892529c40b47fded`, with 3 commits ahead and 3,770 behind current main; GitHub reports `mergeable=false`. No PR-triggered Actions run is associated with the head. The observed Vercel check is a daily deployment-rate-limit failure, not code-test evidence.

The exact PR-head source and test blobs were materialized as two scratch files only and independently matched:

- `tools/site_discovery.py`: Git blob `c648a5666ddf87c3ab0ad6607f0762796bc7f160`, 10,057 bytes.
- `tests/test_site_discovery.py`: Git blob `e7ca2989115e44aab570f6baefa73e2882bc3caa`, 4,684 bytes.

`python -m unittest discover -s tests -v` exited 0: **4/4 existing tests passed**. The runner emitted a non-fatal host spreadsheet-warmup warning; the test process still completed successfully.

## Additional stale-fallback regression replay

Using the exact PR-head module, I seeded prior Paper A/B-shaped workspace records containing legacy `reader.html` targets and excerpts, then forced the HsH tree input to be truncated. The actual `run()` path returned `2` and marked the HsH repository `stale`, but copied the prior records through unchanged:

- Paper A retained its raw reader target and excerpt; `presentation_state` remained absent.
- Paper B retained its raw reader target and excerpt; `presentation_state` remained absent.
- Workspace IDs were excluded from the rolling docket.

This is a source-matched execution of the PR module against a local controlled fixture, not a deployed-site observation or Actions run. It confirms the existing stale-fallback finding in [PR comment #7067194973](https://github.com/Satobloc/HsH/pull/2009#issuecomment-7067194973) and strengthens it from a control-flow reproduction to a full-module execution. The four committed tests do not cover the composition of stale fallback with legacy workspace records.

## Required next repair and authority

Add a regression fixture that seeds legacy Paper A/B workspace records, forces the HsH tree scan to fail or be incomplete, and verifies that last-good metadata is retained while workspace records remain metadata-only: `reader is None`, `presentation_state == PRESENTATION_PENDING`, no `excerpt` or `excerpt_scope`, and no workspace ID in the docket.

The existing PR remains the single canonical draft. Its current branch is substantially behind main; this review did not rebase, push code, merge, deploy, probe a live route, or stand down P0. Tern retains release authority. No duplicate PR or issue was created.

**Disposition:** `P0_ACTIVE / SOURCE_LEVEL_DEFECT_CONFIRMED / EXACT_PR_SOURCE_AND_TEST_BLOBS_MATCHED / 4_EXISTING_TESTS_PASS / STALE_FALLBACK_REGRESSION_REPRODUCED / NO_CODE_CHANGE / NO_ROUTE_OBSERVATION / NO_P0_STANDDOWN`.
