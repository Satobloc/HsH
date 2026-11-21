# Kestrel h990:s4 receipt — Amendment 01: publisher verification and status reconciliation

This amendment corrects the publication-status chronology in the original receipt and records final publisher readbacks. The receipt itself remains unchanged.

## 1. Receipt chronology correction

The original receipt was committed at 2026-11-21T07:09:48Z (commit 3f30126dcd03e37a3b3b67cae38ee4b30c5d9399).

- Original report issue #2258 had already published at 07:07:28Z.
- Source-hash Amendment 01 issue #2259 had already published at 07:09:15Z.
- Status Amendment 02 issue #2260 did not publish until 07:10:33Z.

Therefore the original receipt's statement that #2259 was SUBMITTED_NOT_VERIFIED at receipt creation is incorrect. Its correct status at receipt creation was **PUBLISHED_VERIFIED**. The receipt's statement that #2260 was SUBMITTED_NOT_VERIFIED at receipt creation was correct.

## 2. Final publisher verification

All three workspace artifacts and canonical published artifacts were independently fetched and compared byte-for-byte:

| Artifact | Issue | Canonical commit | Git blob SHA-1 | SHA-256 | Readback |
|---|---:|---|---|---|---|
| Original h990:s4 report | #2258 | dd0bf42d34554f4c38fe97a8f3bd00288df25484 | 9a80d234a6ef00d762cb9296b55ad8cba3fd8e2b | 2688f86cee09e7f6b6431f5abee4ccfac1b6bd11e57d79acad6d617006228b5e | Exact |
| Amendment 01: source hashes | #2259 | e02e9e00b194bbf5fa4b9f824bc5bbad0691edfa | 51f59398278e798d302ed9575dda2308bde04b0a | 49c05ee1f6546f0d22fe4eba19d7f0985681eee61e66ac41dff6669da514c59e | Exact |
| Amendment 02: status chronology | #2260 | 6131b02d4d0de7eeab4b26b3c7ea814144eb8dd4 | 9069df032e863aeace05b59b9dba2972381b9060 | be863ed1ad22e28b938f1ca8b0b4e728b1e7ff6bf4e97a60cc6baa7e6496fc1c | Exact |

Publisher comments:
- #2258: #7059048673
- #2259: #7059067349
- #2260: #7059081145

## 3. Corrected source hashes

The two source hashes in §6 of the original report are superseded by Amendment 01:

- SAT-O1 4D: Git blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc; SHA-256 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937.
- Blockwave attachment: Git blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d; SHA-256 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664.

The SAT archive original and HsH copy are byte-identical. No source file or equation was changed. The SHA helper was validated against the standard “abc” test vector before source hashing.

## 4. Final status

- Original report #2258: PUBLISHED_VERIFIED.
- Amendment 01 #2259: PUBLISHED_VERIFIED; supersedes the two incorrect source SHA-256 strings in original §6.
- Amendment 02 #2260: PUBLISHED_VERIFIED; supersedes only Amendment 01's inaccurate publication-status sentence.
- This receipt Amendment 01 corrects the receipt's stale #2259 status-at-creation statement. It does not alter the report, source files, equations, or proposed Thom-form map.
