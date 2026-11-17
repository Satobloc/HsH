# Receipt Amendment 01 | h901:s4 | Publisher rejection

This amendment supersedes the initial receipt's `SUBMITTED_NOT_VERIFIED` status. The original receipt remains unchanged.

## Verified publisher outcome

- Issue: [#1902](https://github.com/Satobloc/HsH/issues/1902)
- Submission ID: `aldus-h901-s4-review-mind-context-configuration-and-provenance-20261117t1348z-001`
- Publisher workflow run: [#44105532557](https://github.com/Satobloc/HsH/actions/runs/44105532557)
- Run conclusion: `success` (the publisher script returned normally after recording a validation rejection; this is not successful publication).
- Publisher comment: #6951254591
- Exact rejection: `REJECTED: invalid submission ID`
- Submission ID length: 81 characters; the publisher allows at most 80.
- Payload schema: valid lowercase `hsh-publish-v1`; exactly four keys `schema`, `submission_id`, `content`, `sha256`.
- Declared content SHA-256: `246386d60c2039ada4c6da66e3cec02235eddf13d3dd3918e0554455a1884ecc`; this matches the committed report content.
- Content length: 15,865 UTF-8 bytes, below the 45,000-byte limit.
- Expected artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-h901-s4-review-mind-context-configuration-and-provenance-20261117t1348z-001.md`: 404 on independent readback.

## Final publication status

`PUBLISHER_REJECTED_INVALID_SUBMISSION_ID / NOT_PUBLISHED`.

No issue edit, retry, corrected duplicate issue, direct artifact write, or publisher bypass was attempted. The issue-opened publisher does not rerun on edits. The internal Common research report and its exact repository readback remain available; no public published artifact exists for this submission.
