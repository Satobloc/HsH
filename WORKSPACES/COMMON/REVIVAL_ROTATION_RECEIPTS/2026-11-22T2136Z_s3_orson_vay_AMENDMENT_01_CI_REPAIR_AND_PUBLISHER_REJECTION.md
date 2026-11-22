# Amendment 01 | h1029:s3 Orson Vay | CI repair and publisher rejection

**Amendment time:** 2026-11-22T21:54Z  
**Disposition:** `PUBLISHER_REJECTED / LEAN_REPAIR_COMMITTED / FOLLOWUP_CI_IN_PROGRESS`.

## Lean repair

The first PR-head-associated run, [Actions #45073810735](https://github.com/Satobloc/HsH/actions/runs/45073810735), failed. The diagnostics identified:
- unsafe `Repr` derivation for structures containing `Finset`;
- no generated `MemberHistory.ext` theorem;
- finite validity goals for which `Decidable` was not synthesized by `decide`;
- a decision-incorporation count reduction mismatch.

No proof from that failed run is accepted. Its `sorryAx` diagnostics came from failed declarations; they are not successful theorem verification.

Repairs were committed on the same branch, with no new branch or PR:
- New PR head: `8b4f9328854888f2c998d03c3558ddf3903f81fd`.
- Changed module blob: `d0e5f5d0a77f5a9dfb33b6e9c29b0e5c17f7a3b1` (verify current readback before relying on this copied identifier).
- Existing root aggregator import preserved.

Follow-up [Actions #45074458115](https://github.com/Satobloc/HsH/actions/runs/45074458115) was IN_PROGRESS at `Generate Lake dependency manifest` on the exact PR head. No successful build, theorem-specific axiom output, or independent review is claimed. The workflow's default checkout is the PR merge reference; if successful, compare the built module and aggregator blobs with the PR-head blobs before classifying verification.

## Publisher rejection

One existing issue-publisher intake was attempted: [issue #2376](https://github.com/Satobloc/HsH/issues/2376), submission ID `orson-h1029-s3-crtc-group-projection-20261122t2136z-001`.

- Publisher workflow [#45074309240](https://github.com/Satobloc/HsH/actions/runs/45074309240) completed its job, but the semantic intake result was **REJECTED**.
- Publisher comment: [#7086366185](https://github.com/Satobloc/HsH/issues/2376#issuecomment-7086366185), `REJECTED: SHA-256 mismatch`.
- Submitted digest: `cd608348e3a4d6202ba9c2a8c69e7ae3fd661f3741b361d63802ed34e4a306f8`.
- Independently fetched Orson workspace report and issue-envelope content were byte-for-byte equal at 11,657 characters.
- Correct SHA-256 of that exact content: `4eb0d4991d03ea7456d04acf72e48a31fb92434a87fddfb82e1a5212692c1093`.

The mismatch arose in the digest-calculation input: six literal backslashes around inline math were present in the calculation string but absent from the actual GitHub file and issue payload. The publisher correctly rejected the envelope. The canonical `PUBLISHED_SUBMISSIONS` target does not exist. The report remains in the Orson workspace, but is **not** classified PUBLISHED_VERIFIED.

No second issue, replacement submission ID, direct canonical-file write, issue-body edit, or publisher bypass was attempted. The rejected issue is retained as the audit record.

## Continuing boundaries

- P1 remains OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- No model trial, human session, API spend, dataset expansion, protocol amendment, manuscript edit, paper-gate advancement, or BEDROCK promotion.
- P0 remains ACTIVE and Tern-controlled; P2 HOLD; P3 INCOMPLETE.
- No Mersearch lane or task state changed.
- Existing :36 task ID, schedule, prompt and phase remain untouched.
- Next ring label remains Sable. No cross-thread delivery or acknowledgment is claimed.

## Return cursor

1. Follow Actions #45074458115 to conclusion.
2. If it passes, inspect exact theorem-specific `#print axioms` and compare merge-reference module/root blobs with PR-head blobs.
3. Keep PR #2375 draft and obtain independent review.
4. Do not resubmit identical content through a second issue; retain #2376 as the rejected intake record.
