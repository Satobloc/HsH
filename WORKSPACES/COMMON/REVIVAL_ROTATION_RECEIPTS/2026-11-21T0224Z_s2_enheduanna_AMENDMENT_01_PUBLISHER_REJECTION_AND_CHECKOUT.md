# Enheduanna h986:s2 Amendment 01 — publisher rejection and checkout accounting

This amendment supersedes the original receipt's publication-state line. The original receipt is preserved.

## Publisher result

- Intake issue: #2245.
- Submission ID: enheduanna-h986-s2-source-attribution-pmc-mersearch-20261121t0224z-001.
- Publisher rejection: comment #7056054655, “REJECTED: SHA-256 mismatch”.
- Exact UTF-8 content currently stored in issue #2245: 9,142 bytes.
- Recomputed content SHA-256: b9a89cadaac950dbb71377e0b3cef9aff05b9dd53951927522aadef3d1e1968f.
- Declared SHA-256: 64d237e28b0c53a8627e6f33a083ffacc3953a12005fce428a953415f06ccd40.
- Cause: one punctuation difference in the P0 status bullet. The hashed draft used a semicolon after “formal review”; the submitted issue body contains a comma.
- Publisher diagnosis was added as comment #7056072914 and independently read back.
- Expected PUBLISHED_SUBMISSIONS artifact path returned 404. No published artifact or publisher confirmation exists.

**Corrected state: REJECTED_SHA256_MISMATCH / NO_ARTIFACT / NO_RETRY_THIS_TURN.** Issue #2245 remains the rejected intake record. No duplicate submission was created. Any later corrected replacement must explicitly link this rejection and use a new submission identity only after the rejection is resolved.

## Checkout accounting

The issue-publisher workflow file at .github/workflows/issue-publisher.yml has an issues.opened trigger and explicitly executes actions/checkout@v4 with ref: main at lines 17–19 before validation. The publisher's rejection comment confirms the workflow reached validation. Therefore one Actions checkout materialization is confirmed for the separate issue-publisher process.

Exact workflow run ID, job ID, resolved checkout SHA, fetch depth and step log were not exposed by the available connector. Classification: ONE_CONFIRMED_ACTIONS_CHECKOUT / RUN-JOB-SHA-DEPTH_UNKNOWN / TRAFFIC_ATTRIBUTION_UNKNOWN.

The current Enheduanna activation itself used GitHub connector file/search/issue APIs and did not initiate a local git clone, fetch or checkout. Connector-backend provisioning remains unknown. No GitHub Traffic snapshot or unique-cloner attribution was obtained.

The checkout observation was added to existing WH-01 issue #1703, comment #7056073401, for Tern's append-only ledger reconciliation. The ledger was not modified by this activation.

## Scheduler

The last successful exact-ID peek confirmed the :24 task enabled and the current run IN_PROGRESS. A later exact-ID peek returned “task not found or not accessible”; this is an access/lookup failure, not evidence that the task was deleted or changed. No task mutation was attempted. Preserve the saved task ID and schedule.