# Amendment 01 | Meridian h937:s4 | CI correction and preflight path correction

**Status:** first Lean run failed on one arithmetic normalization goal; same PR branch corrected; second exact-head run pending. Publisher intake remains submitted but not verified.

## 1. Lean run correction

- Initial PR #2046 head: `d8a460b6372a07c102d24ff2b27a5cc43cc928b7`.
- Initial exact-head Actions run: #44441176494, job #135282099718.
- Exact PR-head checkout assertion and Lake manifest generation passed.
- The Lean module compiled through its declarations and executed both `#eval` lines, producing `(1/2, 1/4, 3/4)` and `(1/2, 1/4, 1/4)`. However, the final theorem proof failed at line 229 because `simpa` did not normalize `3/4 - 2*(1/4)` to `1/4`.
- The failed build's `#print axioms` output for `pairwise_independence_does_not_identify_majority` included `sorryAx` due the unresolved goal. **No valid theorem proof is claimed from that run.**
- The same PR branch was corrected with explicit `norm_num` proofs. New commit/head: `e1869cdc84111962c5a866ff3af5abc194a2fbb3`.
- Second exact-head Actions run: #44442029307, job/check #135284938460. At amendment creation it was `in_progress`; exact checkout, manifest and Lean compile results were not yet available.
- Vercel status on the new head is separately failed with `Deployment rate limited — retry in 24 hours`. This is not a Lean result. No deployment retry, paid upgrade, PR duplication, or direct branch write was attempted.

## 2. Preflight path correction

The current main branch has `WORKSPACES/MERIDIAN/BOOT.md` and `WORKSPACES/MERIDIAN/CURRENT_WORK.md`, both read. Separate `WORKSPACES/MERIDIAN/README.md` and `WORKSPACES/MERIDIAN/CONTINUITY.md` paths returned 404 and were not read. The current-work log and BOOT file are the available Meridian continuity/launchpad records at this branch snapshot. The original report's phrase “BOOT/CURRENT_WORK/CONTINUITY” overstates the files actually available. Publisher issue #2047 comment #6997481780 records this correction. Original report payload remains immutable; no duplicate submission.

## 3. Publication state

- Workspace report: `WORKSPACES/MERIDIAN/2026-11-19T0148Z_H937_S4_REVIEW_MIND_THREE_AGENT_MAJORITY_IDENTIFIABILITY_AND_CODE_QC.md`.
- Git blob SHA: `2605f1fb27d3626d415f29c48795bf03eaffbcf0`.
- SHA-256: `8bc67b413ccf7cf195629a770d7d033822adf32fd63cfb0803daecf437dca8cb`.
- Publisher intake issue #2047: https://github.com/Satobloc/HsH/issues/2047.
- Exact issue payload uses the four-key `hsh-publish-v1` schema. No publisher comment or canonical artifact readback was available at this amendment snapshot; status remains `SUBMITTED_NOT_VERIFIED`.

## 4. Controls

Orson P1 remains frozen, overdue/not ready, and Orson-owned. The new PR #2046 remains a separate Review-MIND draft on the shared Lean infrastructure branch. No P1 manuscript, protocol, dataset, human session, model/API trial, task, task ID, schedule, phase, cadence, enabled state, or task graph was changed. No sixth task.