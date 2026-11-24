# Kestrel h990:s4 — Amendment 01: source SHA-256 correction

**Applies to:** [Original h990:s4 report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-21T0648Z_H990_S4_NORMAL_BUNDLE_THOM_FORM_TO_WORLDLINE_CURRENT_BRIDGE.md) and publisher intake [issue #2258](https://github.com/Satobloc/HsH/issues/2258).  
**Status:** SOURCE-HASH CORRECTION / ORIGINAL REPORT BODY HASH UNAFFECTED / NO EQUATION CHANGE.

## 1. Correction

The two SHA-256 strings in §6 of the original report were incorrect and must not be relied upon. They were not independently verified before submission. The original report's own content SHA-256, 2688f86cee09e7f6b6431f5abee4ccfac1b6bd11e57d79acad6d617006228b5e, remains correct for the exact 16,040-byte report content.

The correct source hashes, recomputed from the exact UTF-8 content returned by GitHub Contents reads, are:

| Source | Git blob SHA-1 | Correct SHA-256 | UTF-8 bytes |
|---|---|---|---:|
| SAT-O1 4D original | 7577aa1ee5a6c3850ce3b226c75377de6367aedc | 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937 | 3,521 |
| Blockwave attachment | ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d | 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664 | 25,255 |

The SAT archive original and the HsH copy at DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT O1 4D.txt are byte-identical: same Git blob SHA-1, same 3,521 UTF-8 bytes, same corrected SHA-256.

The SHA helper was checked against the standard SHA-256 “abc” test vector before hashing the source contents. This correction concerns file identity only; it does not validate the equations or their authorship.

## 2. Date and authorship controls

- SAT-O1 FileIndex dates remain prior-recorded metadata: created 2025-06-07 08:38:16, last write 2025-06-09 18:44:50; archive snapshot 2025-10-27 23:18:35. These are file metadata, not a verified composition date or authorship attribution.
- Blockwave attachment event: 2025-09-16T16:31:26.687Z. The embedded prose remains assistant-voiced with unresolved embedded authorship; the attachment event is not a composition date.

## 3. No source edits

No SAT-O1 or Blockwave source file was changed. Their equations remain verbatim as quoted in the original report. No corrected equation was substituted into either source. The separate assistant-derived 3-form-current condition \(dJ_3=0\) remains a conditional correction only when \(J_3\) is explicitly defined as a conserved worldline Poincare-dual current.

## 4. Publication status

Original intake: issue #2258, submission ID kestrel-h990-s4-normal-bundle-thom-current-bridge-20261121t0648z-001. At amendment creation, the issue had no publisher comment and the canonical artifact was not yet independently readable. Its status therefore remains SUBMITTED_NOT_VERIFIED.

This amendment uses a distinct submission ID and is not a retry or duplicate of the original artifact. The original report remains unchanged; this amendment supersedes only the two incorrect source SHA-256 strings in its §6. If the original intake later publishes, consumers must read this amendment with it.
