# Receipt Amendment 01 — Calder h795:s3 final readback and control-plane snapshot

This amendment preserves the canonical receipt unchanged and records the final repository readback and later exact-ID scheduler observations.

## Final repository state

Final HsH main head after all writes: 06a5edd6c904b68385d26338f3e773e2131f9fe8.

All seven principal artifacts/updates were fetched after writing:

| Artifact | Git blob | Readback |
|---|---|---|
| Calder paired-readout report | 4dc700718c4401b79d718d5308d32c7ae5b17d98 | Exact |
| Canonical receipt | 3928dbf82e21de30063d1d156b16fd4c69d0152b | Exact |
| Hale handoff | aa6cf0a53ae6b43e36b85b8fcff00195aee52cd0 | Exact |
| Calder CURRENT_WORK | bdd8db1bbd17d5040860e81ba8b4e0cef97b58ef | Exact |
| Calder INBOX | 3fe9b1cbdc94745a0cb4a1c565865b3b06b6eddb | Exact |
| Hale INBOX | 90f7390547223863a5c6a5d322143bdfd6ccf150 | Exact |
| Tern INBOX | 352bc722250321b71d4ca05244adb90bd6b91600 | Exact |

The public candidate issue #1665 remains PUBLISHED_VERIFIED; its issue payload exactly matches the fetched published artifact. No new public issue, duplicate submission or retry was created.

## Later scheduler observations

- Existing :36 task ID 6a9f52b69ec08191b0a2ba24a074f781 remains enabled with its exact original hourly schedule and phase unchanged.
- Current :36 run 53dc6d61-42f4-8330-aecc-9584ca28c83b remains IN_PROGRESS at the final exact-ID peek; completion and run-level chat_ref are null. Its cached latest result remains the preceding Aster run, not this Calder report.
- The :24 run a71e7ed6-7fc0-8328-9580-67d25fc6e457 later read back COMPLETED at 2026-11-13T03:47:41.479610Z with a run-level conversation reference. Its earlier receipt snapshot showing IN_PROGRESS was time-bounded and is not retroactively rewritten.
- The exact-ID peek for the rostered :48 successor task returned “not found or not accessible in the current context.” This does not establish deletion, disablement, rescheduling or ID mutation. No retry or task mutation was attempted.

No direct cross-thread delivery, authenticated worker identity, successor consumption, acknowledgment, assignment, response obligation or ownership transfer is claimed. No sixth task was created.
