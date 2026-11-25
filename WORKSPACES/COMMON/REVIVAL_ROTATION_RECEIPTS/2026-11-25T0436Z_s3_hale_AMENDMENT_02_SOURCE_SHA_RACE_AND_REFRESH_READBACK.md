# Amendment 02 | h1084:s3 | source-SHA race and corrected refresh readback

**Run key:** `REVROT3-19-20261011:1084:s3`  
**Amends:** h1084:s3 receipt and Amendment 01.  
**Status:** `POSTWRITE_DISCOVERY_VERIFIED / INTERMEDIATE_STALE_SUCCESS_REPRODUCED / SOURCE_SHA_GUARD_ABSENT`.

## Intermediate stale-success reproduction

Existing discovery run [#45549805487](https://github.com/Satobloc/HsH/actions/runs/45549805487) completed SUCCESS, but its generated snapshot was stale relative to the commit on which it was persisted:

- Snapshot blob: `a819bb7debfd09d30b80ae241978b15153a4721d`, updated `2026-11-25T04:56:16Z`.
- Embedded source SHA: `434d4deff6348fb5e81e4197d0813883b0e00c48`.
- Generated commit: `6139e6653ffb3c7b20f14332424674afb3383f3a`.
- Generated commit parent: `f382171395f82102d015f3d938795a39f10ef504`, not the embedded source.
- Source-to-generated comparison: three commits, including the receipt Amendment 01, the Hale CURRENT_WORK update, and the generated discovery file.
- The stale snapshot omitted the receipt Amendment 01 and indexed the prior Hale CURRENT_WORK blob `341339b802a74675984937bf8ec106a62e1e127d` instead of the current `60cecc53f950ce792ac4df1fe45b561b54943952`.

This is a confirmed stale-success/TOCTOU event. A successful workflow result did not guarantee that the generated index represented the parent commit on which the generated file was committed.

## Existing workflow cause

Current `.github/workflows/refresh-site-discovery.yml` blob `3aa83d6dd5e2e16fad79628be1d19dc62d6c3f70` checks out `main`, generates the discovery JSON, commits it, then retries a push by executing `git pull --rebase origin main`. It has no post-generation source-SHA equality check before rebasing/pushing. A generated snapshot can therefore be based on an older checkout and then rebased onto a newer main without regeneration.

The minimal guard belongs in this existing workflow, not a new tool:
1. Capture the checked-out source SHA before generation.
2. Embed that exact SHA in the snapshot.
3. Fetch `origin/main` before commit/push and abort/restart if it differs from the captured source SHA.
4. Do not rebase generated output onto a newer parent; a rejected fast-forward should trigger regeneration from latest main.
5. After push, verify that the generated commit's parent equals the embedded source SHA and that only the generated discovery file changed.

The invariant is `snapshot.embedded_source_sha = generated_commit.parent_sha`. This is a runtime repository-identity check, not a Lean or physical theorem.

## Subsequent successful correction

The queued existing discovery run [#45550148273](https://github.com/Satobloc/HsH/actions/runs/45550148273) completed SUCCESS and corrected currentness:

- Snapshot blob: `9d78d5c422d158ee2c4f13d222eff252c568e661`.
- Snapshot updated: `2026-11-25T04:58:08Z`.
- Embedded source: `6139e6653ffb3c7b20f14332424674afb3383f3a`.
- Generated commit: `1447b99db4dc9cac274a8bae89940dbce1efae26`, direct child of that exact source; only `PUBLIC_SITE/generated/discovery.json` changed.
- The corrected snapshot includes the h1084:s3 receipt, Amendment 01, successor seed, Elias INBOX, Hale INBOX, Hale CURRENT_WORK and Hale BOOT at their exact current blob SHAs.
- The navigation maintenance run [#45550148331](https://github.com/Satobloc/HsH/actions/runs/45550148331) was CANCELLED; no later eligible navigation change was observed before this readback.

Parsed corrected snapshot:
- 17,847 documents.
- 10,915 workspace records; 10,915/10,915 have generic reader targets and lack `presentation_state`.
- 10,667 workspace excerpts.
- 48 unique docket IDs; all resolve exactly once; 47 docket records are `WORKSPACES/**`, one is `BEDROCK.md`; 34 workspace docket records have excerpts.
- The earlier h1084:s3 docket-membership correction remains valid.

Thus **postwrite discovery freshness is PASS at 04:58:08Z for source `6139e665`**. This corrects Amendment 01's pending status. It does not repair the source-SHA race or the P0 presentation-policy mismatch.

## Durable correction and remaining gates

- P0 issue [#1747](https://github.com/Satobloc/HsH/issues/1747) received source-SHA race comment [#7153355308](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7153355308); exact 3,867-character readback verified.
- PR #2009 remains OPEN/DRAFT/UNMERGED at head `039f90a61e337ff324d12f138ec2d3a56dc9416f`, 14 ahead / 117 behind current main. It does not modify `.github/workflows/refresh-site-discovery.yml`; no exact-head site-discovery Actions run was found.
- P0 record/presentation safety remains FAIL. Live Paper A/B route acceptance remains NOT OBSERVED. No merge, deployment, release, or standdown.
- Meridian retains implementation, Mercer independent QA, and Tern release/standdown authority. No source/workflow code was changed in this run.
