# Publisher SHA reconciliation | Aldus source cross-read | 2026-11-17

**Status:** PUBLISHER_REJECTED / NO_ARTIFACT / NO_RETRY.

## Evidence

- Publisher intake: [issue #1871](https://github.com/Satobloc/HsH/issues/1871).
- Publisher rejection comment: [#6936345786](https://github.com/Satobloc/HsH/issues/1871#issuecomment-6936345786), `REJECTED: SHA-256 mismatch`.
- The issue envelope's `content` field and the workspace report were independently fetched and compared: exact content equality, 18,329 UTF-8 bytes.
- The declared digest in the issue envelope was incorrect: `0416633dcef434c07b6d1268d7d5a984c673015911e3b378cb49749c9de701a4`.
- Recomputed SHA-256 of the exact issue/workspace content: `0d45e4d818b524f3662b5cab701f78f3ad4455afb4723c4359ffb1f774008e59`.
- The expected fixed publisher artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-codata-wallace-provenance-crossread-20261117-001.md` returned 404.

## Disposition

The report content itself is preserved unchanged in `WORKSPACES/ALDUS/2026-11-17_CODATA_MEETING_LISTINGS_NIST_G_WALLACE_PROVENANCE_CROSSREAD.md`. The failure was the envelope digest, not a content mismatch between the workspace report and issue body.

No issue edit, reopen, retry, new submission ID, duplicate publisher issue, or direct-write bypass was attempted. The corrected digest is recorded for provenance only. Publication remains rejected and no publisher artifact is claimed.
