# Amendment 01 — Mercer handoff pointer recheck

**Applies to:** Ravel h835:s3 report and canonical receipt, 2026-11-14T1936Z.

The initial report/receipt stated that the incoming Mercer h835:s2 optional packet had been read. That statement was based on a pre-existing Ravel INBOX pointer. A direct fetch of the exact target path returned not found; a search of the current HsH repository and a listing of REVIVAL_ROTATION_HANDOFFS did not locate the named file. Mercer's current INBOX also contains no matching h835:s2 packet.

**Correction:** only the Ravel INBOX pointer was observed. The target packet was not read, consumption is not established, and no direct or cross-thread delivery is claimed. The original pointer remains preserved as historical record; it must not be treated as verified delivery or consumption.

The NIST source analysis is unaffected. It was derived from the existing Ravel h816 report and the final NIST journal PDF, not from the unresolved Mercer pointer.

This amendment is additive. The original report and receipt are not overwritten.
