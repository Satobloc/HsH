# Aldus O9 extraction audit — amendment 01: Lean result and identity-ladder placement

This amendment supersedes the earlier `LEAN_NOT_YET_RUN` status in the base report. It preserves the original report as a time-stamped snapshot.

## 1. Actual Lean execution

Existing PR #982, branch `research/aldus-o9-audit-identity-20261029t0612z`, head `4a18b4bf502d72d9a1c560e67e986ba7c05aae37`.

Actions run #41267816867 completed successfully:

- Actual checkout: merge commit `bad195c`, merging PR head `4a18b4bf502d72d9a1c560e67e986ba7c05aae37` into base `df06acf0a1e9a7d7a4950418bc18a655fea579f8`.
- Classification: `MERGE_REF_BUILD_SUCCESS / EXACT_PR_HEAD_NOT_VERIFIED`.
- Lean 4.34.0; Lake 5.0.0.
- Full library: 8,956 build jobs.
- New module `HsHVerification/AldusO9ExtractionChronology`: built in 6.4 seconds.
- Nine theorem-specific axiom reports for the new module: all “does not depend on any axioms”.
- Full job log: zero `sorryAx` occurrences and zero `admit` tokens.
- Separate automated axiom-audit stage: skipped. Tests and lint: not run.

The theorems verify only the encoded finite source graph, timestamp-order conflict, timestamp arithmetic, recorded attachment/blob equalities, extraction-scope distinction and inequalities among transcribed phase values. They do not authenticate source bytes, establish authorship or causal information flow, recover original PDF bytes, establish public T0, evaluate the optical integral, or validate physical truth.

The PR remains open, draft and unmerged.

## 2. Aldus identity-ladder application

The existing adversarial identity ladder distinguishes locator, containment, metadata, blob, edition, bibliography, authority, clearance, point-of-use identity and claim support. Applying those rungs to this PDF:

| Rung | Current evidence | Status |
|---|---|---|
| 0 Locator | Raw conversation repo path, blob, conversation and message IDs | VERIFIED |
| 1 Physical containment | Original attachment bytes not available for local containment check | UNKNOWN |
| 2 Metadata consistency | Attachment and archive copies both report 382,611 bytes | SIZE_MATCH_ONLY |
| 3 Content/blob identity | Two archive paths share Git blob `cfaad753c7c7d9302dfa6594f7ee495421af4505`; original upload bytes/hash unavailable | ARCHIVE_COPY_IDENTITY_ONLY |
| 4 Edition/rendition | Original PDF pages and version/rendition not visually inspected | UNKNOWN |
| 5 Bibliographic identity | Extracted byline is not independently authenticated | UNKNOWN |
| 6 Source-owner/authority | Embedded author/owner not authenticated | UNKNOWN |
| 7 Clearance scope | User requested analysis/full pipeline; public redistribution or derivative clearance not established | LIMITED_TO_REQUESTED_ANALYSIS |
| 8 Point-of-use object identity | Conversation-local tether_quote text hash available; parent/timestamp conflict remains | PARTIAL / ORDER_CONFLICT |
| 9 Claim-level support | Extracted nominal phase lies outside stated rejection band; unit labels conflict | SUPPORT_DEFECT |

The rungs are monotone: passing one does not imply the next. Matching filename and size do not establish byte identity. A conversation-local extraction is a separate derivative object, not the original PDF.

## 3. Publication updates

- Existing issue #1187 follow-up comment #6552754506 records the successful merge-ref build and limits.
- Existing PR #982 follow-up comment #6552754834 records the same.
- Both comments were read back.
- No new issue or artifact was created.
- The existing Calder handoff remains context-only; amendment 02 below updates its verification status.

## 4. Remaining blockers

Original PDF bytes/hash, visual page inspection, complete table extraction, authenticated authorship/edition, public T0, parent/timestamp explanation, and a real measured optical system with calibration/uncertainty/holdout remain unresolved. No physical calculation, fit, measurement or empirical validation occurred.
