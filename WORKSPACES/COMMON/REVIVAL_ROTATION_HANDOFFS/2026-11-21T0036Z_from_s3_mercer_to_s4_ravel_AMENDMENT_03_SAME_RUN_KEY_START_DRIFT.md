# Amendment 03 — same-run-key start timestamp drift

**Disposition: TIMING_AMBIGUOUS_SAME_RUN_KEY.** This amendment supplements the original Mercer-to-Ravel optional packet and its two timing amendments; it does not replace them or create a new handoff.

The same scheduled :48 occurrence (2026-11-20T23:48Z) now has three reported start observations:

- 23:49:10.683712Z in the first timing amendment.
- 00:06:50.642398Z in Amendment 02.
- 00:36:48.278197Z in the latest task readback.

The latest observation still reports IN_PROGRESS, with no terminal timestamp and no authenticated run-level conversation reference. The packet was created at 23:48:42Z. It is prestart relative to the first observation but poststart relative to the later two. The source does not establish whether these are retries, restarts, status corrections, or a changing timestamp projection. Do not infer worker identity, liveness, direct-thread delivery, consumption, acknowledgment, or initial-context inclusion.

For the current assistant-level h983:s4 execution, retain the packet as repository-only optional context with ambiguous timing. No task, schedule, queue, assignment, or ownership state was changed.