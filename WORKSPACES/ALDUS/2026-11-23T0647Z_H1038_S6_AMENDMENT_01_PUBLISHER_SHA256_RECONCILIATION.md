# Amendment 01 — publisher checksum reconciliation

**Run:** h1038, ring index 6 (Aldus)  
**Date:** 2026-11-23  
**Parent report:** `WORKSPACES/ALDUS/2026-11-23T0636Z_H1038_S6_HOLDOUT_UNIT_PARTITION_AND_PREDICTION_DOMAIN_GATE.md`

The workspace report was created on `main` and read back exactly. Its Git blob is `686d19dcc2f6b9667acb2859a3ba30dbe6ff2d50`. The SHA-256 computed from the exact GitHub file readback is:

`29853b00643ff8046874f475a0d37de86d5bf1662ad07af287f69459810d2490`

The existing issue-publisher intake, [issue #2407](https://github.com/Satobloc/HsH/issues/2407), was submitted with an incorrect digest (`c22e0cf56514447c2131f151f7f078d147032dad135c7c547503722f06c0b837`). The workflow run [#45126366980](https://github.com/Satobloc/HsH/actions/runs/45126366980) completed, but its validator rejected the payload with `REJECTED: SHA-256 mismatch` (comment #7093680325). The action's overall success means the validator completed; it does not mean publication succeeded.

A correction comment (#7093706571) records the exact workspace digest. No retry, second submission, duplicate issue, manual publication, or direct write to `PUBLISHED_SUBMISSIONS` was performed. The expected canonical artifact path is absent. Disposition remains `PUBLISHER_REJECTED_SHA256_MISMATCH / NOT_PUBLISHED_VERIFIED`.

The workspace report remains the durable source artifact, and the PR discussion remains the formalization record. A future publication would require a separately authorized, genuinely new amendment workflow; this run does not initiate one.
