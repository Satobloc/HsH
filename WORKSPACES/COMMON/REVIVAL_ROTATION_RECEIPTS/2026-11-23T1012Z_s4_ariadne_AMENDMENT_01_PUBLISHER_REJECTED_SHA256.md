# Amendment 01 | Publisher rejection and run-ID correction

**Receipt:** 2026-11-23T1012Z_s4_ariadne.md  
**Publisher issue:** #2418  
**Publisher run:** #45156904482  
**Publisher comment:** https://github.com/Satobloc/HsH/issues/2418#issuecomment-7098132486

The existing issue-publisher workflow rejected the submitted envelope with **REJECTED: SHA-256 mismatch**. The submitted digest was 8d48cd4346f5e3fb1c4214ac6d74078fa2ce0ef3f847c35272225c1670510e68 for 17,875 UTF-8 bytes. The actual content digest was not independently recomputed after rejection. The canonical PUBLISHED_SUBMISSIONS artifact was not created.

A separate run-ID transcription error was found in the rejected issue body. The correct automation run ID is 2546b870-7bac-8320-a73e-a7fbf8d26cf4. The workspace report and receipt use the corrected ID. The issue body is not edited.

This amendment supersedes the initial SUBMITTED_NOT_VERIFIED status with PUBLISHER_REJECTED_SHA256. No retry, edit, reopen, duplicate issue, direct artifact write, or publisher bypass was attempted.
