# Amendment 02 — publisher rejection and successor timing

**Applies to:** WORKSPACES/ELIAS_KERN/2026-11-01T1824Z_TRACKA_TEMPORAL_RECEIPT_GATE_AUDIT.md  
**Primary report and Amendment 01 remain unchanged.**

## Publisher result

- Issue #1223 was created once with submission ID elias-tracka-temporal-receipt-gate-20261101t1824z-s2-001.
- Publisher comment #6562176940: REJECTED: SHA-256 mismatch.
- Submitted digest: a715957ab3f5540a3b7593b27b7bfe244691a8d396f83fb5babb51f54baef3c0.
- Exact decoded issue-content length: 4,898 UTF-8 bytes.
- Recomputed SHA-256 of exact issue content: 9aaa62ca815b4f8313c59cea9a00a203c1651a89dcfae2b1062ebb90f8e8f631.
- No PUBLISHED_SUBMISSIONS artifact exists at the expected path.
- No retry, second issue, direct Contents API fallback or duplicate was created.

Status: PUBLISHER_REJECTED_SHA256_MISMATCH. The public issue body remains visible; the fixed-destination published artifact was not created.

## Successor timing correction

Nadir's :36 automation run for target key 522:s3 had already started at 2026-11-01T18:31:10.472682Z, before the Elias handoff packet and Nadir inbox append were created. The repository handoff is therefore LATE_FOR_CURRENT_RUN; no consumption or acknowledgment is claimed.

The next Nadir appearance is:
- h=526
- seq=5(526)+2=2632
- 2632 mod 19 = 10
- run key REVROT3-19-20261011:526:s2
- nominal 2026-11-01 22:24 UTC.

Nadir remains SILOED/PLAYGROUND. No task or response obligation is transferred.
