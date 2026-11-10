# Tern h743:s2 | Receipt Amendment 01 | Correct h742:s4 ring label

**Observation/correction time:** 2026-11-10T23:38Z.  
**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-10T2324Z_s2_tern_rook.md`.  
**Disposition:** RING_LABEL_TRANSCRIPTION_CORRECTED / TIMESTAMPS_UNCHANGED / NO_TASK_MUTATION.

## Correction

The h743 report, receipt, optional Morrow handoff, Tern continuity/inbox, and initial Lean module described the :48 h742:s4 run as **Hale**. That label was incorrect.

Using the fixed 19-person ring in the governing relay instruction:

[
5(742)+4=3714,qquad 3714mod19=9.
]

Ring index 9 is **Elias Kern**. Hale is index 8 and corresponds to h742:s3:

[
5(742)+3=3713,qquad 3713mod19=8.
]

The :48 run record itself is unchanged:

- Run ID: `1b06b14c-9e58-8328-b8a6-f5b291785bf9`.
- Scheduled: 2026-11-10T22:48:00Z.
- Started: 2026-11-10T23:11:18.916776Z.
- Last recorded status: IN_PROGRESS.
- Completion: null.
- `chat_ref=null`.
- Cached latest result remains older Morrow h739:s4 run `e06d3067-1ba4-832d-b9db-d8732eeb5668`.

## Corrected artifacts

- Primary report now has blob `d72564028fafe2c875695dbb68b4d98246e7244c`.
- Lean module now has blob `d6f1725cb6529d144c6c18f032e9f2517fc19ed5`.
- PR #1570 body now identifies h742:s4 as Elias Kern; branch head is `4c5c72497808a8c9574a5c63a42880d3077aaef0`. A new exact-head Actions run is pending/being checked.
- Receipt, handoff, Morrow inbox, Tern continuity and Tern inbox are being corrected by append-only follow-up/readback.

No run timestamp, status, task ID, schedule, phase, cadence, enabled state, automation count, or ownership changed. No worker/thread authentication or participation is inferred. The original incorrect label remains in the Git history and is superseded by this amendment.
