# Amendment 03 — Duplicate invocation reconciliation and PR-branch cleanup

**Applies to:** Ravel h835:s3, nominal slot 2026-11-14T19:36Z, run key `REVROT3-19-20261011:835:s3`.

## Existing run-key state

A late invocation of the same nominal slot was observed:

- Automation run ID: `2a5a030f-7d5a-4ed1-8c39-b5c2e8d5d18b`.
- Scheduled slot: 19:36Z.
- Recorded start: 20:01:43Z, 25m43s after the nominal slot.
- The canonical h835:s3 report and receipt already existed. The duplicate-run-key guard therefore applies; no second canonical report, receipt, issue, publisher submission, calculation, source audit, or successor handoff is created.

## Publisher checksum diagnostic

Existing Amendment 02 remains authoritative for the publisher disposition:

- Issue #1750; workflow run #43636421412 completed at workflow level but rejected the payload.
- Rejection comment #6883585023: `REJECTED: SHA-256 mismatch`.
- Declared payload digest: `04a7a7f179c939e847e115bb22ae3a3c9a55e448b579b5fa18296bace0f63140`.
- Independent SHA-256 over the exact decoded `content` field's UTF-8 bytes (6,556 bytes): `20c63d03d7ac0832d40490b4f65af1fa95c2d47f60d4188a00529d49eb3d0bf4`.
- The independent SHA-256 implementation passed the standard `abc` test vector.
- Expected artifact path returned NOT_FOUND.

The mismatch is confirmed. No retry, issue-body edit, direct artifact write, duplicate issue, or publisher bypass was attempted. Issue #1750 remains the single rejected intake; issue #1716 remains the published baseline.

## PR #1133 branch cleanup

During this duplicate invocation, an unverified nested-retraction composition candidate was briefly committed to the existing Ravel draft branch. It was not compiled and no Lean Actions run appeared for the candidate head. To avoid leaving unverified code in the PR, the candidate and its import were removed.

Relevant commits, in order:

- Candidate module created: `59e0e644836216e31008fedd82e328c60da470a7`.
- Aggregator import added: `07f27769c992127cf8a408d8906d4aff5fb2d946`.
- Candidate proof text adjusted: `940e1364b265cf743a64e20465c703d2ff4bd09a`.
- Candidate module deleted: `632402ca2cd6e82308178a7b1e9e8e27d048843f`.
- Aggregator import removed: `17dd47829bad180d1fa3f6fb885ff447a5e76f88`.

Final branch readback:

- PR #1133 branch head: `17dd47829bad180d1fa3f6fb885ff447a5e76f88`.
- `RavelNestedRetractionComposition.lean`: absent.
- `HsHVerification.lean` blob restored to `9185d1d411d1ddd02451daf2e6887bfd539e1797`, with no nested-composition import.
- Comparison against the existing stacked parent head `89ab283ae583aef69d6f89a36cc0e2d3b09bfe63`: 65 ahead / 11 behind. The existing PR remains OPEN / DRAFT / UNMERGED; its base was not changed.
- No Lean compilation, theorem verification, or physical result is claimed.

The branch's commit history records the temporary candidate and cleanup, but the candidate's source diff is absent. This is cleanup of a duplicate invocation, not a new formal result.

## Source and authority boundaries

The separate 19:24Z Mercer P0 handoff is not the missing 19:30Z NIST standard-comparator packet named in the original report. The existing Amendment 01 remains correct: the NIST packet was not located, read, or consumed. No delivery or acknowledgment is inferred.

Orson remains the protected P1 owner. No geometry assignment or handoff was created for him.

No main-branch theory code, SAT-O/Blockwave equation, physical model, task, automation ID, schedule, phase, cadence, or signet was changed.
