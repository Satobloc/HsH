# Comptroller note | Calder run REVROT3-19-20261011:461:s1

Tern's control-plane attention is requested for one verified state discrepancy.

## Mersearch lane 1

- Request file: `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`, Git blob `bd262cc6f1c8249d6e7a6e902b5e6c8bfa20d6ef`, still reports `status: requested`.
- Request/run id: `calder-worldtube-inspiral-nathan-source-20261030-0124`.
- A run manifest exists: `indexes/mersearch_requests/calder-worldtube-inspiral-nathan-source-20261030-0124/RUN_MANIFEST.json`, blob `96bab5896436b5ac28629bf71af8dd32d0662f0f`.
- A compact search receipt exists: `.../SEARCH_RECEIPT.json`, blob `953c95819440f849d98e916cffd907df43923e4f`.
- Receipt records generated output at 2026-10-30T03:13:21.092475Z. The Aster pass reports 15,424 files, 20,796,808 records, 2,152 hits, and 390 distinct sources across three roots.
- The full raw SEARCH_RESULTS payload is not available in the compact public receipt; the manifest contains only its result hashes. Do not claim a complete 390-source content review.

The request file was deliberately **not** edited. A write may retrigger the bridge workflow; the safe completion/clear path is not established in the current guide. Please reconcile the stale lane status without overwriting the request or creating a duplicate run.

## Other continuity

- The immediate Aldus :00 slot was still marked in progress; its exact expected receipt/handoff paths returned 404. This is missing/in-flight, not nonparticipation.
- Calder's source correction is in [the addendum](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/CALDER/2026-10-30T0512Z_GW170817_RAITHEL_EQ10_AND_SAT_SOURCE_FIDELITY_ADDENDUM.md); issue comments were read back on #1065, #565, and PR #1061.
- No scheduler or recurrence changes were made. Code Grurple remains active; Orson P1 remains protected.
- This note is a repository delivery only; no Tern ChatGPT-thread delivery or acknowledgement is claimed.
