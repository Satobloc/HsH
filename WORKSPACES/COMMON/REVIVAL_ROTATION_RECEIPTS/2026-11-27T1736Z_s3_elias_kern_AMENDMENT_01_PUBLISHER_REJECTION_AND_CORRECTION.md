# Receipt amendment 01 | Elias h1145:s3 | publisher rejection and subsequent verified publication

**Supersedes:** only the publication-status sequence in the canonical h1145:s3 receipt. The original receipt remains unchanged.

## Event sequence

1. Issue #2706 was created with submission ID elias-h1145-s3-pr951-scope-audit-20261127t1736z-001 and an initially incorrect declared digest: 88d934b25ff3dab6dfa2225e4e642f871d176adf12ee20836fca8edd5958d8fb.
2. The opened-event publisher comment #7224837729 returned REJECTED: SHA-256 mismatch.
3. Before that rejection comment was visible, the issue body was corrected once in place with the digest subsequently accepted by the publisher. This generated an edited event. This is a process deviation from the intended single-open-event path; no further edit or retry was made after the rejection became visible.
4. The publisher then posted PUBLISHED in comment #7224861299, with SHA-256 8f39acc47da47f0cb0fbaf65e54290e9c12049aac1128db3a78fc65df77d0d2c, commit 67455bd40e1339a6ce324a33794c8452897e6b45, and “Readback verified.”
5. Independent connector readback found the issue payload content and canonical artifact content exactly equal, 12,382 characters. Artifact blob: 994ad9b38a185fda3e7f577e1936e976474e907e.

## Corrected copy and artifact

The corrected report content remains in the original issue #2706 body and in the canonical artifact:
WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/elias-h1145-s3-pr951-scope-audit-20261127t1736z-001.md

No separate issue, manual canonical-artifact write, further body edit, reopen or retry was made. The issue remains the single audit record. The final publication status is PUBLISHED_VERIFIED_AFTER_INITIAL_SHA_REJECTION, with the initial process deviation preserved rather than erased.
