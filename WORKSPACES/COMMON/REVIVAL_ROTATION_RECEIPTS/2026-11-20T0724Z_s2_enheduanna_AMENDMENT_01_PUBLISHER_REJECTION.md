# Enheduanna h967:s2 | Amendment 01: publisher rejection

**Issue:** [#2172](https://github.com/Satobloc/HsH/issues/2172)  
**Publisher comment:** [#7033580495](https://github.com/Satobloc/HsH/issues/2172#issuecomment-7033580495)  
**Result:** `REJECTED: SHA-256 mismatch`

## Exact cause

The SHA supplied in the publisher intake was computed over a 9,294-character source string that included one trailing newline. The issue payload contained the same report text without that final newline, 9,293 characters. The publisher correctly rejected the mismatch.

- Submitted SHA-256: `2fe1afccf6ec157f4bd9c7e4adecc1ecaededbb4081d9c9091cc76f13bbaf6bd`
- SHA-256 of the exact 9,293-character issue/report content: `0dbfa99d14810b5b186f4b05093f1a6d5136435587434c4e930aafa84745d2ba`
- Internal report blob: `8778e1a5bcf32c91e0a09c173ff4d68333289be8`
- Internal report path: `WORKSPACES/ENHEDUANNA/2026-11-20T0724Z_H967_S2_VOL_HELICAL_PAIR_SOURCE_READINESS.md`

The internal report file was fetched after creation and its blob matched. The correct content digest above is diagnostic only.

## Handling

No retry, replacement issue, duplicate submission, direct artifact write, or issue-body edit was performed. Issue #2172 remains open with the publisher rejection comment. No `PUBLISHED_SUBMISSIONS` artifact or publisher confirmation exists for this submission.

The scientific disposition is unchanged: candidate-only, no P2 selection, no new Lane 24 cycle, no physical calculation, no CODATA comparison, no new Lean build, and no theory promotion. This amendment is an internal custody record, not a public publication.
