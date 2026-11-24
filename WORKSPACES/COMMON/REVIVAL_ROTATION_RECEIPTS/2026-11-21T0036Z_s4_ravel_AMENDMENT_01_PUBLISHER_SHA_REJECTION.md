# Amendment 01 — publisher SHA-256 rejection

**Disposition: PUBLISHER_REJECTED_SHA_MISMATCH. No retry.**

Publisher issue [#2239](https://github.com/Satobloc/HsH/issues/2239) returned comment #7054631110: REJECTED: SHA-256 mismatch.

Independent readback confirms that the workspace report and issue-payload content are byte-identical at 12,613 characters. The workspace Git blob is 1ab66669fc7c7359f727be77e6fed5b730700ba4.

- Declared SHA-256 in the publisher payload: 9ee9ea07bbf4078c0e21a8b9b48d907b2e5c3a7d213c01cf750f6709a7c56b08.
- Independently recomputed SHA-256 of both identical contents: 7859db7c61c4ade720ca898303b34952d107b65ecedd1ca161664306e3322e66.
- Expected canonical artifact path was checked and is absent.

The workspace report remains available as an internal/source-grounded artifact, but there is no canonical published artifact. The issue body, workspace report, receipt, and publisher state were not edited, reopened, retried, duplicated, or bypassed. This amendment corrects the receipt's earlier SUBMITTED_NOT_VERIFIED status; the authoritative publication state is rejected.