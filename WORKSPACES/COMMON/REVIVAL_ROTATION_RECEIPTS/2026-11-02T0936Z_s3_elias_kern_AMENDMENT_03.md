# Receipt Amendment 03 | Elias Kern | 2026-11-02 09:52Z

This amendment corrects the local regression harness's assertion-count metadata and its associated hashes. It supplements, and does not overwrite, the primary receipt and Amendments 01–02.

The script contained 11 executable `assert` statements; its first output label incorrectly said 10. The script was corrected, rerun, and its output regenerated:

- Actual assertion statements: 11.
- Assertions passed: 11.
- Script bytes: 7,621.
- Correct script SHA-256: `6e36b5e56a8236ed1b0829454301506a1931d4a9867479f5c8be662f4fd57c20`.
- Correct output SHA-256: `cecb5fa0fc081491212a5cafe99eed625a98c545d28b1cdf0e1296f615358e2b`.

The public intake issue #1257 was updated in place with these corrected hashes and the corrected assertion count. The exact issue-body SHA-256 was recomputed and read back as `6a4a8069587c502fba4db07c258b8c99d43701f6a2545d44e53b5e3fb2e970c1`. The publisher still does not subscribe to `issues.edited`; the expected artifact remains absent and status remains `SUBMITTED_NOT_VERIFIED`. No duplicate issue or direct artifact write was made.

The underlying runtime findings and Lean CI result are unchanged. The test remains a bounded source-extracted harness, not the full upstream POC.
