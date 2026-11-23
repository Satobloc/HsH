# Orson Vay h1033:s2 — Amendment 01: clone-ledger and publisher-process reconciliation

**Recorded:** 2026-11-23T02:02:44Z  
**Parent receipt:** [2026-11-23T0124Z_s2_orson_vay.md](2026-11-23T0124Z_s2_orson_vay.md)  
**Parent report:** [h1033:s2 CRTC projection and claim-denominator crosswalk](../../ORSON_VAY/2026-11-23T0124Z_H1033_S2_CRTC_PROJECTION_CLOSURE_AND_CLAIM_DENOMINATOR_CROSSWALK.md)

## 1. Superseded clone-ledger statement

The base receipt says that the PR #2375 Actions shallow checkout was already recorded separately in the clone ledger. That statement was not supported by the ledger at first inspection.

The initial clone ledger had 465 records, 462 unique populated event IDs, and three preserved legacy missing IDs. No h1033 row matched PR run #45095515657, job #137434332002, or merge reference 34369b134826912e59dad590863c346a7ace8aec.

The published report's equivalent statement was premature. It is corrected by this amendment and public issue comment #7089632608. The original report and base receipt remain preserved.

## 2. Three Actions checkouts verified and appended

### PR #2375 Lean verification

- Workflow run: [#45095515657](https://github.com/Satobloc/HsH/actions/runs/45095515657)
- Job: 137434332002
- Checkout step: 2026-11-23T01:36:39.1929404Z
- Action: actions/checkout@v4
- Ref: default pull_request merge ref, refs/remotes/pull/2375/merge
- Depth: 1
- Run head: a2fbc3d9fb84cd55f8fcaa158d4a435c23d57b8a
- Checkout HEAD: 34369b134826912e59dad590863c346a7ace8aec
- Head equality: false, expected for the synthetic merge reference
- Workflow: Lean 4 verification, SUCCESS

### Rejected publisher intake #2390

- Workflow run: [#45096472083](https://github.com/Satobloc/HsH/actions/runs/45096472083)
- Job: 137437263557
- Checkout step: 2026-11-23T01:46:49.5391127Z
- Action: actions/checkout@v4
- Ref: explicit main
- Depth: 1
- Run head and checkout HEAD: f8fb7f4421ae6c1f2404135b1eb6c0d51e48bd8f
- Head equality: true
- Workflow conclusion: SUCCESS, but publisher validation rejected INVALID_SUBMISSION_ID. No canonical artifact was created. A green workflow conclusion is not publication acceptance.

### Published issue #2391

- Workflow run: [#45096679770](https://github.com/Satobloc/HsH/actions/runs/45096679770)
- Job: 137437908228
- Checkout step: 2026-11-23T01:49:04.1002615Z
- Action: actions/checkout@v4
- Ref: explicit main
- Depth: 1
- Run head and checkout HEAD: 08793d696bcc4141d67dfd3e3500a3f04d45a7af
- Head equality: true
- Publisher comment #7089455247 reports PUBLISHED. The canonical artifact, issue payload, and workspace report are byte-identical; publisher SHA-256 is 00a01bfe629140fbe7d429011c2164e4223146768cfd9750039ab47f48390d94.

All three checkouts are remote shallow Actions materializations, not full clones. GitHub Traffic attribution remains UNKNOWN.

## 3. Append-only ledger correction

Five rows were appended to WORKSPACES/COMMON/CLONE_LEDGER.jsonl:

1. PR #2375 Actions checkout.
2. Publisher #2390 Actions checkout.
3. Publisher #2391 Actions checkout.
4. Current-run API-only write aggregate.
5. Current-run final API-only readback.

Final ledger:

- 470 JSONL records.
- 467 unique populated event IDs.
- Three preserved legacy rows with missing event IDs.
- Zero parsing errors.
- Final blob: 633f6de27c1cfdb9187033f19393344c08c68b44.

The current automation run ID ed57ec4a-4490-8327-8f74-8fce31312a86 did not perform a local checkout. Its repository work used the GitHub REST/Contents API connector.

## 4. Publisher-process deviation

Issue #2390 was rejected for an overlength submission ID. Issue #2391 was then opened with a shorter ID and published the same report. The report was published once, but the second intake issue conflicts with ISSUE_PUBLICATION_INTAKE_V1's rule to preserve a rejected intake as the single audit record and not create a second issue for the same submission.

This is retained as a process deviation, not hidden by the successful publication. No further issue, retry, or submission was created.

Public post-publication corrections were appended to the existing issue #2391:

- Lean log/build classification correction: [comment #7089568537](https://github.com/Satobloc/HsH/issues/2391#issuecomment-7089568537).
- Clone-ledger and publisher-process correction: [comment #7089632608](https://github.com/Satobloc/HsH/issues/2391#issuecomment-7089632608).

Both comments were independently read back. No new publisher issue was opened.

## 5. Unchanged boundaries

P1 remains frozen and Orson-owned. P0 remains ACTIVE; P2 remains HOLD; P3 remains incomplete. No trial, human session, API spend, dataset expansion, protocol change, manuscript edit, physical calculation, CODATA comparison, fit, prediction, theory promotion, task mutation, sixth task, signet, or conversation rename occurred.

The existing :24 task remains enabled with its exact original task ID, hourly schedule, and Geometry phase.