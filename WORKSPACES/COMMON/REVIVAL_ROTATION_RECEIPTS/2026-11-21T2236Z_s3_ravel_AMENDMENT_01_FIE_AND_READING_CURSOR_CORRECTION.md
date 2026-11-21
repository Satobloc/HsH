# Amendment 01 — FIE cadence and unrelated-reading cursor correction

This amendment corrects two cadence statements in the H1006:S3 report and canonical receipt. The original report and receipt remain unchanged; this amendment is append-only.

## FIE review date

The H1006 report/receipt said the last full FIE review was November 10 and the next review was due November 24. That was stale.

The controlling later reconciliation is Alberr h988:s4, [Amendment 01: reading cursor and FIE reconciliation](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-21T0448Z_s4_alberr_AMENDMENT_01_READING_CURSOR_AND_FIE_RECONCILIATION.md). It records that Enheduanna h978:s4 completed a full six-page FIE reread on November 20, with PDF SHA-256 `d13d32109ca32b15dabd5e8d4084995d3a36f9e8ab8a5dcac45ae2f150a9a1d9` and extracted-text blob `468a04e9941165353e286b48e5a0ca27d5be58d9`. The h978 receipt's November 24 due date was itself stale; the later reconciliation sets the next 14-day review due **December 4, 2026**.

No FIE rereview was due on November 21, and none was duplicated in this run.

## Unrelated-reading cursor

The original H1006 report/receipt recorded lines 3046–3085 of `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt` as this run's new reading. That range had already been read in the immediately preceding Aster h1003:s4 run, so it must not be counted as a new reading quantum.

The actual new reading completed during H1006:S3 was lines **3086–3125** of that same file in `Satobloc/SAT_THEORY_ARCHIVE_2023-25`. The passage is an old conversation excerpt containing unsupported language-variety assertions; it is not a primary linguistic source, and no factual claims were adopted. The correct return cursor is **line 3126**.

## Scope

No change to the finite-chain theorem, PR #2309, physical-model status, P2 HOLD, paper gates, scheduler task, task ID, schedule, prompt, or phase. This amendment only corrects review cadence and the unrelated-reading record.
