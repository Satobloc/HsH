# Date-tagging audit: committed state, uncommitted root pass, and two undatable captures

**Scope:** HsH current main as observed at `aedecda7009666bb27b954e94256e861f3642741`. This is a source and workflow audit, not a code change.

## Committed apply-and-audit state

The current main branch contains the bot-generated apply/audit commit `d77b4f78a6f048dfd3f6193b74faa481f65c6764`. Its committed `indexes/manifests/date-tag-audit.json` was generated at `2026-11-13T06:59:38Z` (blob `a41294c96279c9814e7ea385916da3dbc23f4159`).

The committed audit reports:

- 965 dated and correct
- 0 needing renaming
- 0 unresolved collisions
- 2 undatable conversations
- 442 skipped non-conversation or bad-JSON records
- `fully_tagged=false`

The two committed source manifests are in apply mode: DEVELOPMENT_FULL_CONVOS has 945 unchanged records and 437 skipped; LIVE CONVOS has 20 unchanged and 7 skipped. The audit separates the two undatable development captures from the 435 development and 7 live skipped records. No root-conversation manifest is committed on current main.

This verifies a post-repair development/live apply-and-audit output. It does **not** verify that the repository-root pass was persisted.

## Root pass executed, but not committed

Navigation workflow run [#43502765197](https://github.com/Satobloc/HsH/actions/runs/43502765197), job `132153432775`, executed the development, live and repository-root date-tag passes. The root pass renamed 75 eligible sources and skipped 400.

The post-pass audit reported 1,040 dated and correct, 0 needing renaming, 0 unresolved collisions, 2 undatable, and 843 skipped. The strict audit then failed because the overall set was not fully dateable. The commit step was skipped. Therefore the 75 root renames and the fresh post-root manifests were runner-local results, not verified main-branch state.

## Latest scheduled backfill failed before applying tags

Scheduled workflow run [#45293732700](https://github.com/Satobloc/HsH/actions/runs/45293732700), job `138108725468`, failed during the unit-test step before any date-tag pass.

The current workflow runs tests under `set -euo pipefail` before the three apply passes. The failing test calls `refresh_source_manifests()` with two arguments, while the current function requires three, including `root_manifest`. The error is a test-contract mismatch, not evidence of a date-tagging failure on any source file.

[PR #1710](https://github.com/Satobloc/HsH/pull/1710) contains a candidate test correction, but remains open, draft and unmerged, without an exact-head Actions run. Calder retains implementation ownership; Tern retains release and queue authority. No rebase, merge, code edit, dispatch or retry was performed.

## Two undatable DOM captures

1. [Fine-structure Constant Variation - current branch.json](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_24/Fine-structure%20Constant%20Variation%20-%20current%20branch.json), blob `0b30234d307d7c658f04738acfa69094ed8f911d`: DOM current-branch capture, progressive scroll, 44 messages, 82 scroll passes, stable top reached. It has no message-level or top-level conversation timestamps.
2. [Star Explosions_ No Chain - current branch.json](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_24/Star%20Explosions_%20No%20Chain%20-%20current%20branch.json), blob `5781a31d70038aeca00b22a09faf98147ecb40b6`: DOM current-branch capture, instant snapshot, 12 messages, no scroll attempted, completeness unverified. It has no message-level or top-level conversation timestamps.

Separate text compilations contain matching subject matter but do not provide the original conversation identity or timestamp envelope. Do not infer conversation dates from capture time, filenames, or derivative transcripts. Keep both records undatable until a primary source envelope supplies the relevant timestamps. The first capture has stronger completeness evidence than the second; neither has date evidence.

## Disposition

The committed development/live datable records are clean in the November 13 snapshot. The repository-root pass executed but was not committed. The latest scheduled backfill is blocked before apply by the test-contract mismatch. The two DOM captures are correctly retained as undatable rather than assigned guessed dates.

No source files, manifests, workflow definitions, PRs, queue records, scheduler tasks or access controls were changed in this audit. Tracking issue: [#1702](https://github.com/Satobloc/HsH/issues/1702).
