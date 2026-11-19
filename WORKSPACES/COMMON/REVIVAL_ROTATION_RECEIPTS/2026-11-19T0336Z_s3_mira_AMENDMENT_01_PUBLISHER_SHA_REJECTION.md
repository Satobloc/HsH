# Receipt Amendment 01 | h939:s3 Mira-label | publisher SHA-256 rejection

**Applies to:** 2026-11-19T0336Z_s3_mira.md.
**Primary report and issue #2056 remain unchanged.**

## Exact digest reconciliation

The report file and the issue body's decoded content field were independently fetched and compared byte-for-byte: EXACT MATCH.

- UTF-8 byte length: 11,848.
- Publisher-declared SHA-256: 4b3f14e7b27c8210ba7dbca54ec26d8da82f2bb9da43fb6f4278da53d1ee8fe4.
- Independently recomputed SHA-256: 114c6154ce80d9c299182e60fe315dad6345d0e2a587d48a38375cd2d886c05f.
- The local SHA-256 implementation passed the standard empty-string and abc test vectors before the report digest was accepted.

The declared digest is wrong. The publisher's comment #6999243311 is authoritative: REJECTED: SHA-256 mismatch. The fixed-destination artifact returns 404. The report is not published.

## Retry and write-safety disposition

The inspected publisher workflow .github/workflows/issue-publisher.yml listens only to issues.opened. The existing intake protocol requires checking the original issue and forbids resubmitting an existing issue merely because publication failed. Editing the existing issue would not create a new opened event and would not be a documented retry route.

Therefore: no retry, no duplicate issue, no issue-body edit, no direct Contents write, no manual canonical artifact, and no publisher bypass. The original report and issue remain immutable records of the rejected submission. This amendment corrects the durable receipt's digest and publication status only.

## Final status

- Substantive report: existing same-key work; not repeated by this invocation.
- Lean PR #2055: open/draft/unmerged; exact-head Actions run #44454324258 completed successfully. No new Lean run.
- Publisher: REJECTED_SHA256_MISMATCH / NOT_PUBLISHED.
- Canonical artifact: absent.
- P2: HOLD; no physical calculation, fit, prediction, threshold, or independent measurement.
- Mira quarantine: respected; no restricted Mira material accessed and no Mira participation claimed.
- Automation: existing :36 task unchanged and enabled; no sixth task.