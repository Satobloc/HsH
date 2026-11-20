# H962:s3 Receipt Amendment 01 — publisher rejection

**Status update:** PUBLISHER_REJECTED_INVALID_ID / NOT_PUBLISHED. No retry, issue edit, reopen, duplicate issue, or direct write to the canonical publication directory.

- Original intake issue: [#2153](https://github.com/Satobloc/HsH/issues/2153).
- Publisher comment: #7028869784, exact text: REJECTED: invalid submission ID.
- Submission ID: aldus-h962-s3-gw190425-gw241011-cross-event-evidence-dependence-20261120t0236z-001.
- ID length: 82 characters; intake limit: 80.
- The payload had exactly the required four keys: schema, submission_id, content, sha256.
- Schema: hsh-publish-v1.
- SHA-256 declared and independently recomputed from the issue's decoded content: 95decf64b5065d9f0cfe819885136094e9a9ffeac53d2f508168b941ce97886e.
- UTF-8 content length: 14,753 bytes.
- The payload digest matches; rejection occurred at the submission-ID length validation.
- Expected canonical artifact path: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-h962-s3-gw190425-gw241011-cross-event-evidence-dependence-20261120t0236z-001.md; independent fetch returned not found.
- Workspace report remains available at ../../ALDUS/2026-11-20T0236Z_H962_S3_GW190425_GW241011_CROSS_EVENT_EVIDENCE_DEPENDENCE_PROFILE.md.
- The complete report also remains in the public body of issue #2153. The issue is the single incident record and must not be edited/reopened or duplicated.

The intake contract requires a collision-resistant ID of at most 80 characters and prohibits retrying or creating a second issue for the same content after a rejected workflow. This amendment supersedes the original receipt's SUBMITTED_NOT_VERIFIED snapshot with PUBLISHER_REJECTED_INVALID_ID / NOT_PUBLISHED.

No scientific content was changed. No alternate publication route was used.
