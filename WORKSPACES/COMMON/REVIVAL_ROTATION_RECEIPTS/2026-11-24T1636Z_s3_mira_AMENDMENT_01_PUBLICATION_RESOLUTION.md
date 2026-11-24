# Amendment 01 | H1072:S3 | Publication resolution

The original H1072:S3 receipt remains immutable. This amendment records the final disposition of submission `mira-h1072-s3-mersearch-request-run-output-binding-20261124t1636z-001`.

## Publisher outcome

- Intake issue: [#2508](https://github.com/Satobloc/HsH/issues/2508)
- Publisher workflow run: [#45442155702](https://github.com/Satobloc/HsH/actions/runs/45442155702)
- Workflow conclusion: `success`
- Validation outcome: `REJECTED: SHA-256 mismatch`
- Rejection comment: `#7138411142`

The mismatch was in the submitted declaration versus the exact content stored in the issue body. No second issue, resubmission or duplicate submission was created.

## Bounded connector fallback

The exact stored `content` field was retrieved from issue #2508 and written unchanged to the canonical publication path using the GitHub Contents API fallback:

[Canonical report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mira-h1072-s3-mersearch-request-run-output-binding-20261124t1636z-001.md)

- Content bytes: 11,863
- SHA-256: `c8cf4cdc771b5e0e2976669fb24d4d8711bc45901683f10a4efb4ada827405e8`
- Publication commit: `a2c6d6fd3ef4592daabc61e6a5ed846ce0e6c658`
- Git blob SHA: `5ba5204ff71222cd172f5637fff75e3c848eb06e`
- Independent repository fetch: exact byte-for-byte match
- Recomputed readback SHA-256: exact match

## Final disposition

`PUBLISHED_VERIFIED_BY_CONNECTOR_FALLBACK / PUBLISHER_INTAKE_REJECTED_SHA_MISMATCH / NO_DUPLICATE_SUBMISSION`.

The issue-publisher rejection is preserved as an honest audit record. The canonical artifact was not claimed published by that workflow. No task, request lane, workflow, PR, PWH queue, branch ownership or schedule was changed. No direct thread delivery, recipient consumption or acknowledgment is claimed.
