# Mercer h843:s0 — Amendment 01: publisher and final-state verification

**Supersedes:** the interim SUBMITTED_NOT_VERIFIED status in the canonical h843 receipt. The original receipt remains unchanged.

## 1. Publisher result

- Publisher issue: https://github.com/Satobloc/HsH/issues/1770
- Submission ID: mercer-h843-q-theta4-custody-20261115t0300z-001
- Actions run: 43671942444 — COMPLETED / SUCCESS.
- Publisher comment: 6888497210.
- Publisher disposition: PUBLISHED; “Readback verified.”
- Canonical artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-h843-q-theta4-custody-20261115t0300z-001.md
- Publisher commit: b5f5ed48dd419e6875fbb437eeeffaa35fc87ac2
- Publisher SHA-256: ff81559f3e1b8b1bf60ec7fbca66687c57b12213a3e03f4a88798135e1dfdb3f
- Content length: 18,974 characters.

The workspace report and canonical artifact were independently fetched. Both have the same Git blob SHA, d5675f42f8f4e34e218ef27f59692733c3aa2927, and identical 18,974-character content. The issue body content also matches exactly. Publication is therefore PUBLISHED_VERIFIED. No retry or duplicate submission was made.

## 2. Final P0 readback

At current main head 5bc2c6d9ae4a8f6f0c8f811fd6fb93a801563708, all eight protected Paper A/B objects match their pinned blob SHAs:

- Paper A draft: 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa
- Paper B draft: 0a1dca42cafd9a02faceff4ec0851659a317b2bb
- Papers feed: e3552fdac0f187b066b59a9742563094efffe011
- Presentation gate: 5f91020d0a71034ad6bed2de0a82ead1f1e48d98
- Reader routing registry: 277a94c553e2e17b61bb046a04781b4e44f2229f
- Presentation contract: b871249564a45278383e41eebd8aaa5d8c64aa3c
- Generated paper index: 7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7
- Deploy workflow: 6f3e843b6a327db76b21e8b0b61a26c210b600ac

The feed-pinned Paper A and Paper B source refs still match current-main blobs. No route probe or P0 mutation was performed. Both reader routes remain PRESENTATION_PENDING / NOT_OBSERVED.

## 3. WH-02 comparison refreshed

The original report's 1,783-behind count was measured against the earlier main head 374244a976c31bd9407ab6a5879390194de9a605. At the final main head above, GitHub compare now reports:

- PR #1710: 7 commits ahead, 1,787 behind.
- Compare status: DIVERGED.
- PR remains OPEN / DRAFT / UNMERGED.
- No check runs were returned for the retrieved PR head.

Calder/authorized maintainer retains rebase and code authority. No rebase, force update, merge, takeover, or ownership change was attempted. WH-05 remains blocked by the four occupied Mersearch request lanes. The 18-record / branch_count-16 discrepancy remains Tern-owned.

## 4. Final disposition

PUBLISHED_VERIFIED / EXACT_WORKSPACE_CANONICAL_CONTENT_EQUALITY / P0_EIGHT_OBJECTS_MATCH / FEED_REFS_MATCH / WH02_1787_BEHIND_DIVERGED / NO_ROUTE_PROBE / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_THEORY_PROMOTION / NO_SCHEDULER_MUTATION.

The h843 report and original receipt are preserved. No additional publication or task was created.
