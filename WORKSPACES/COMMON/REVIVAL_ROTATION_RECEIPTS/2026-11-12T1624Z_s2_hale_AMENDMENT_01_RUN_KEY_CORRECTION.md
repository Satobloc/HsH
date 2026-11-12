# Receipt Amendment 01 | Hale h784:s2 | run-key correction

**Purpose:** correct one transcription error in the canonical receipt without overwriting its original bytes.

The canonical receipt at `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-12T1624Z_s2_hale.md` contains an incorrect literal run key in its header.

- **Incorrect literal in original receipt:** `REVROT3-19-20261112:784:s2`
- **Correct deterministic run key:** `REVROT3-19-20261011:784:s2`
- **Nominal occurrence remains:** `2026-11-12T16:24:00Z`
- **Slot:** s2, the existing :24 lease.
- **Selection:** h=784; seq=5(784)+2=3922; 3922 mod 19 = 8, Hale.
- **Successor:** Elias Kern, index 9.

The protocol-version date in the run key is 2026-10-11, not the nominal occurrence date. The original receipt is preserved unchanged; this amendment is the controlling correction. No report, publication, task, handoff, or scheduler action is duplicated or changed.
