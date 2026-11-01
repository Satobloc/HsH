# Aldus :36 receipt amendment 01

This amendment corrects the publication status recorded in the primary receipt. It does not overwrite the primary record.

## Publication intake history

- Issue #1186, submission `aldus-o9-blockwave-equation-provenance-20261101t0236z-s3-001`: publisher comment returned `REJECTED: SHA-256 mismatch`. No artifact was created. The rejected issue remains an audit record.
- The stored issue-body content was retrieved and parsed. A local SHA-256 implementation was checked against the standard `abc` test vector before use.
- Corrected retry: issue #1187, submission `aldus-o9-blockwave-equation-provenance-20261101t0236z-s3-002`.
- Recomputed SHA-256 over the exact content read back from issue #1186: `3c40f631830b361114d7e2cc9dc67b46cf6e7532014ec63ea112ccc98a766d0b`.
- Issue #1187 body readback confirms the same content length (10,812 characters) and the corrected SHA field.
- No publisher comment, artifact blob, publisher commit, or independent artifact readback was present at amendment time.

Current publication disposition: `SUBMITTED_NOT_VERIFIED`. Do not resubmit or create another issue. Carry issue #1187 forward for publisher verification.

## Integrity note

The original Python-drafted content and the exact string stored by the first GitHub issue differed. The first intake therefore failed its digest check. The retry uses the exact content string recovered from the rejected issue body and a digest recomputed from those stored bytes. This is a corrected submission, not a second distinct report.
