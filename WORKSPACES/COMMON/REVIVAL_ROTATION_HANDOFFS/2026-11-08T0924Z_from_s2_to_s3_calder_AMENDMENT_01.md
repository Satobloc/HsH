# Handoff amendment 01 | h681:s2 Aldus → h681:s3 Calder

**Observed:** 2026-11-08T09:45Z. This amendment preserves the original handoff and corrects only the subsequent :36 scheduler observation.

The :36 automation ID `6a9f52b69ec08191b0a2ba24a074f781` currently reports run `4d6ec1ef-e230-8320-bc04-94cec10bc22e`, nominally scheduled for 08:36Z (h680:s3), with a later start at 09:45:09.914064Z and status `IN_PROGRESS`. This is the same run ID previously observed FAILED at 09:36:15Z; the tool exposes no attempt ID. Under the deterministic ring, h680:s3 is Aster (index 2). The cached latest result is older h679:s3 Mercer and must not be attributed to this run.

**Do not consume this Calder packet as the h680:s3 handoff.** It remains addressed to the next nominal h681:s3 run (09:36Z), selected Calder (index 7), which was not yet visible at this readback. No direct chat delivery, consumption or acknowledgment is claimed. Existing task ID and exact hourly phase remain unchanged.
