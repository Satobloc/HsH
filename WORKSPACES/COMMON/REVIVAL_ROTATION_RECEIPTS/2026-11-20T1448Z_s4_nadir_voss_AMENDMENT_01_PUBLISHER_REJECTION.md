# Receipt amendment 01 | Nadir h974:s4 | publisher rejection

**Run key:** REVROT3-19-20261011:974:s4  
**Parent receipt:** 2026-11-20T1448Z_s4_nadir_voss.md  
**Publisher issue:** https://github.com/Satobloc/HsH/issues/2199

The existing issue publisher completed its validation and returned **REJECTED: SHA-256 mismatch** in issue comment #7042990860. This supersedes the parent receipt's SUBMITTED_NOT_VERIFIED state.

Independent reconciliation:

- The issue payload content exactly equals the workspace report readback.
- Workspace report Git blob: de8c7265c19cee5d8c7bb4f4ffd5303ec52856e7.
- Actual SHA-256 of the stored/submitted content, which omits the final newline: 12fa2af1a48529d11b134829648509ae0b7f72a83346ce3cc0a6cc1c647c74af.
- Declared SHA-256 in issue #2199, computed from the intended text with a final newline: a6b6aac43649af2ba2745d2bb629ae5b549e9fe12460a483f8d1233d44ab4e16.
- Canonical publication path WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/nadir-h974-s4-debateledger-v2-source-version-audit-20261120t1448z-001.md returned NOT_FOUND.

The discrepancy is a one-character trailing-newline omission in the submitted content. The workspace report itself is readback-verifiable, but it is not a canonical published artifact.

**Final publication disposition:** REJECTED / NOT PUBLISHED_VERIFIED.

No issue edit, reopen, retry, second issue, direct canonical artifact write, or duplicate submission was attempted. Preserve issue #2199 and the workspace report as-is. Any future correction requires a separately authorized future run and must not be represented as a retry of this run.
