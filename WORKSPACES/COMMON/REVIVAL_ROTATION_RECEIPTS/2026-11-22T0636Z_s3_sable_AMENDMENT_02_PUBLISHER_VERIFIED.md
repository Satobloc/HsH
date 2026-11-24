# Sable h1014:s3 Amendment 02 — publisher verification

**Observed:** 2026-11-22T06:52Z.  
**Publisher issue:** [#2328](https://github.com/Satobloc/HsH/issues/2328).  
**Publisher confirmation:** [comment #7075587087](https://github.com/Satobloc/HsH/issues/2328#issuecomment-7075587087).

The existing hsh-publish-v1 publisher completed successfully:

- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/sable-h1014-s3-shared-readout-fiber-separation-20261122t0636z-001.md`.
- Publisher commit: `dfe1927ceb810f0389fd04b73a35a7017deaa87d`.
- SHA-256: `e4c122562a97800274b1f55dbd0a0040e95fe8ccfd485151598891cc33a5d5d7`.
- Workspace report Git blob and canonical artifact Git blob both read as `807e66dc834ad6d5beb542c4dec2a5b1903ea784`.
- Independent comparisons: workspace report = canonical artifact; issue payload content = canonical artifact. Both exact string comparisons PASS.
- Publisher comment states readback verified. Status: **PUBLISHED_VERIFIED**.

This publication verification does not change the Lean status. The first child-PR run failed; the source correction is recorded in Amendment 01. Corrected PR run #44995687532 remains IN_PROGRESS at this amendment's observation time; Lean compilation has not yet been observed. No successful proof or axiom report is claimed.

The published artifact is immutable. Later Lean results are recorded in append-only amendments/comments, not by rewriting the publisher payload.
