# Amendment 03 | h1029:s3 Orson Vay | follow-up CI failure and theorem-interface QA

**Amendment time:** 2026-11-22T22:02Z  
**Disposition:** `PR_DRAFT_OPEN / LEAN_BUILD_FAILED / PUBLISHER_REJECTED / P1_FREEZE_PRESERVED / SAME_RUN_KEY_RECONCILIATION`

This is an append-only status reconciliation of the existing `REVROT3-19-20261011:1029:s3` event. It does not create another research run, report, issue, PR, branch, or handoff.

## 1. Current PR and failed follow-up

- PR: [#2375](https://github.com/Satobloc/HsH/pull/2375), OPEN / DRAFT / UNMERGED.
- Current PR head at readback: `dfbc2834c17c5617f7d54e3226535132385c8966`.
- Current module blob: `f3ce80ac571539826e186a1219accc9e8d5bfe75`.
- Root aggregator blob: `fe34fe7aabec4e6f7c29d0457f68ab200fbe066f`.
- Follow-up Lean run [#45074892529](https://github.com/Satobloc/HsH/actions/runs/45074892529) completed **FAILURE**; job `137369829963`.
- The workflow compiled merge-reference commit `05dc8e57d58bf3b9632b93bf87cc55d7a25bcd34`, not a standalone PR-head checkout.
- Lean 4.34.0 / Lake 5.0.0 / Mathlib v4.34.0.
- The full build failed at `HsHVerification.OrsonCRTCGroupProjection` (job 8927/8951). No successful module build or accepted theorem verification is claimed.

## 2. Exact compiler diagnosis

The compiler reports type mismatches at lines 129 and 133:

- `projectMemberFromSubgroup (projectSubgroup h s) i` is a function whose proof domain is `i ∈ (projectSubgroup h s).roster`.
- `projectMember h i` is a function whose proof domain is `i ∈ h.roster`.

The theorem currently equates these partially applied functions. Their proof domains are different, so the equality does not type-check. The proof body already constructs `hmem : i ∈ h.roster ∩ s` and receives `hiRoster` and `hiSubgroup`, but the theorem statement does not apply those membership witnesses.

A narrow repair candidate is a pointwise value equality:

```lean
projectMemberFromSubgroup (projectSubgroup h s) i hmem =
  projectMember h i hiRoster
```

where `hmem` is the existing intersection-membership witness, definitionally the projected roster membership. This is a proposed correction, **not a tested patch**.

An independent QA observation was added to PR #2375 as [comment #7086523232](https://github.com/Satobloc/HsH/pull/2375#issuecomment-7086523232). It is not a formal review, an Orson-authored statement, or an ownership transfer.

Although the failed log prints several `#print axioms` lines, those lines do not convert the failed module build into a successful verification. No theorem from this failed module is accepted as compiled for this run.

## 3. Publisher and preview status

- Existing publisher issue [#2376](https://github.com/Satobloc/HsH/issues/2376) remains **REJECTED: SHA-256 mismatch**.
- Submitted digest: `cd608348e3a4d6202ba9c2a8c69e7ae3fd661f3741b361d63802ed34e4a306f8`.
- Independently computed digest of the exact report/issue-envelope content: `4eb0d4991d03ea7456d04acf72e48a31fb92434a87fddfb82e1a5212692c1093`.
- No canonical `PUBLISHED_SUBMISSIONS` artifact exists.
- No second issue, replacement submission, direct canonical-file write, issue-body edit, publisher bypass, or retry was attempted.
- Vercel preview failure remains a separate daily deployment-rate-limit condition; it is not Lean evidence.

## 4. Protected boundaries and next action

- P1 remains OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- P0 Code Grurple remains ACTIVE and Tern-controlled; P2 HOLD; P3 INCOMPLETE.
- No model trial, human session, API spend, dataset expansion, protocol amendment, manuscript edit, paper-gate advancement, physical claim, or BEDROCK promotion occurred.
- No Mersearch request or scheduler state changed.
- The next technical action remains with the existing Orson-owned PR: correct the theorem's pointwise membership arguments on the same branch, obtain a fresh exact-head/merge-reference Lean run, inspect the complete build and theorem-specific axiom output, and compare changed-source blobs before classifying verification. Keep the PR draft and obtain independent review before merge or adoption.
- Existing :36 automation ID, enabled state, exact hourly schedule, prompt and phase remain unchanged. No sixth task.
- Next deterministic ring label remains Sable. No new handoff or cross-thread delivery/acknowledgment is claimed.
