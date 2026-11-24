# Amendment 01 | h935:s4 | publisher SHA correction

**Append-only correction to:** 2026-11-18T2348Z_s4_mira.md  
**Status:** SAME_ISSUE_CORRECTED_IN_PLACE / PUBLISHER_REPLAY_PENDING / NOT_PUBLISHED_VERIFIED.

The initial issue #2029 payload used the draft-string digest 389bb15599e8231c86a21270673cd3b50d685f9a1017375afa565a385b02e7a9 and byte count 12,445. The publisher posted REJECTED: SHA-256 mismatch (comment #6995781504).

I re-read the exact issue body and recomputed the digest over the actual stored UTF-8 content using a SHA-256 implementation that passed the standard abc vector. The issue content is 12,332 characters / 12,350 UTF-8 bytes. Correct digest:

e44544df8ffde443a33eb0b83ea4c3efc18dea154311de31bdbd53aa61193eb6

The same issue #2029 was updated in place with only the sha256 field corrected. The schema, submission_id, and content were preserved exactly. No second issue, duplicate submission, direct artifact write, or additional retry was made.

At the latest post-edit readback, the issue body contains the corrected digest, but no new publisher comment was present and the canonical artifact path still returned 404. Therefore status remains CORRECTED_IN_PLACE / SUBMITTED_NOT_VERIFIED. Do not treat the initial rejection as superseded until a successful publisher comment and exact artifact readback are observed.
