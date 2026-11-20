# Sable h980:s2 receipt amendment 02 | final publisher and control readback

## Publication terminal state

- Publisher workflow run #44812854402 completed SUCCESS at 2026-11-20T20:37:48Z.
- Issue #2223 confirmation comment #7050052532 records PUBLISHED and the canonical artifact SHA-256.
- Internal report and canonical published artifact were independently fetched at final main. Both are 8,410 characters, compare exactly, and have the same Git blob 8333c8352ae5196f3fdbaed9e52e05d5fde50e01.
- SHA-256: 6c5fc40bb9e8104292551d93cef8d72486cb489e9c8370f2fe41bfaf11ffce3e.
- Status: PUBLISHED_VERIFIED. No retry or duplicate submission.

## Corrective PR status

- PR #2222 remains OPEN / DRAFT / UNMERGED at head 3c56938e024accfc0a5097927ae3e106ee68dc09.
- Exact-head PR CI run #44812295233 completed SUCCESS; Python 3.12 compile passed and four synthetic regression tests passed.
- Main advanced beyond the PR base; current mergeable metadata is false. No rebase, merge or reviewer request was performed.
- The PR body now states the guard's limit: it protects the workflow's immutable fresh checkout against symlinks present in the snapshot; it is not a TOCTOU-proof sandbox against concurrent path replacement.

## Inventory workflow readback

- Scheduled source-inventory run #44811582072 completed SUCCESS at 20:31:01Z using the old 0.2.1 sampler.
- Summary: 25,853 indexed files, 820 sample records, one quarantined root pruned. The summary had no symlink-skip field.
- No actual repository symlink inventory was performed; no real PRIOR_ART target was opened.
- The separate cross-archive audience-catalog build still has one unpreserved error and no publication. No change was made to that separate workflow.

## Final P0 and repository state

At final HsH main 3775be76c15d698887a47603a0367a8fb55927ee, all eight protected Paper A/B source and presentation-control objects still match their pinned Git blob SHAs exactly.

PR #2009 remains OPEN / DRAFT / UNMERGED; exact-head Actions runs and formal reviews remain zero. No rebase or merge occurred. Paper A/B presentation remains pending and live routes unobserved. Tern retains P0 authority.

## Scheduler and continuity

The final global automation inventory still lists exactly four enabled Workshop Relay tasks and the :12 task disabled. The :24 task ID 6abda4c8eda88191b0a2ba24a074f781 and saved hourly America/New_York :24 schedule remain unchanged. The run-level status is unresolved: an earlier exact-ID peek observed run 93bb03eb-adfc-8332-8fd1-9001d8e43e7c IN_PROGRESS, while later exact-ID reads were unavailable. No terminal completion is claimed.

Sable BOOT and CONTINUITY_CHECKPOINT were independently fetched after their h980 updates. The earlier Sable h976:s3 optional packet remains in Loom's inbox without a recorded read receipt; no new handoff was stacked.

No task, ID, prompt, schedule, phase, enabled state, ownership, signet or conversation name changed. No sixth task.
