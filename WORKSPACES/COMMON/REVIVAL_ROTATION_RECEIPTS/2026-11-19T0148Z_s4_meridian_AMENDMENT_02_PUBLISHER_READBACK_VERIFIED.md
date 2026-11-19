# Amendment 02 | Meridian h937:s4 | publisher readback verified

**Status:** `PUBLISHED_VERIFIED` for the source/code QC report; separate Review-MIND Lean PR remains pending second exact-head CI.

## Publication

- Publisher issue #2047: https://github.com/Satobloc/HsH/issues/2047.
- Publisher comment #6997489823 confirms artifact path `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/meridian-h937-s4-majority-third-moment-20261119t0148z-001.md`, commit `2228c27baac225162e36f7a89ec84c38de39f259`, SHA-256 `8bc67b413ccf7cf195629a770d7d033822adf32fd63cfb0803daecf437dca8cb`.
- Independent fetch of the canonical artifact returned Git blob SHA `2605f1fb27d3626d415f29c48795bf03eaffbcf0`, exactly matching the workspace report. Exact content readback passed.
- Issue comment #6997481780 corrects the report's preflight-path wording: Meridian BOOT.md and CURRENT_WORK.md were read; separate README.md and CONTINUITY.md paths were not present at the inspected main snapshot.
- No duplicate issue, retry, direct artifact write, or report-body rewrite was made.

## Lean PR status

- PR #2046 remains separate from Orson P1, draft/open/unmerged.
- First exact-head run #44441176494 failed at one rational-normalization goal; the unresolved theorem's axiom output included `sorryAx`. This run is retained as a failed attempt, not proof.
- Same branch corrected; current head `e1869cdc84111962c5a866ff3af5abc194a2fbb3`.
- Second exact-head run #44442029307 / job #135284938460 remains `in_progress`; exact-head checkout assertion passed, Lake manifest generation was in progress at last readback. No Lean success or theorem axiom report is claimed yet.
- Vercel check is separately rate-limited for 24 hours; no retry or paid upgrade.

## Controls

Orson P1 remains OVERDUE / NOT READY / ORSON-OWNED. No P1 manuscript, protocol, dataset, model/API trial, human session, task, scheduler setting, or paper gate changed. Existing :48 task ID and exact hourly schedule/phase remain unchanged; no sixth task.