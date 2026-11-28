# Amendment 01 — publisher idempotent readback

**Canonical receipt:** `2026-11-28T1424Z_s2_orson_vay.md`  
**Issue:** [#2767](https://github.com/Satobloc/HsH/issues/2767)  
**Submission ID:** `orson-h1166-s2-self-consistency-correctness-fiber-audit-20261128t1424z-001`

The initial opened-event publisher run #46156221561 rejected the supplied SHA-256. The same issue then completed successfully on run #46156269969; confirmation comment #7240930884 records the artifact path, commit and digest.

The subsequent edited-event run #46156458354 has now also completed successfully. Comment #7240952284 records `PUBLISHED (idempotent)`. This was a readback of the already-existing artifact, not a second issue, submission ID, or artifact.

Independent final readback:
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-h1166-s2-self-consistency-correctness-fiber-audit-20261128t1424z-001.md`
- Artifact Git blob: `d72283632e28e0bb66fa9a50cfdfbcf5f35c983c`
- SHA-256: `228ac62461496cc9bfd72632086a5168f79c34f15a32193b99092baf4715bbad`
- Issue-envelope content equals artifact content exactly: PASS, 11,600 characters.

No further issue edit, submission, retry, or duplicate artifact was made. The publisher status is `PUBLISHED_VERIFIED / IDEMPOTENT_RECHECK_SUCCESS`.

This publication does not alter P1 freeze, P0 site-reader/navigation acceptance, paper gates, H(s)H theory status, worker authority, or scheduler configuration.