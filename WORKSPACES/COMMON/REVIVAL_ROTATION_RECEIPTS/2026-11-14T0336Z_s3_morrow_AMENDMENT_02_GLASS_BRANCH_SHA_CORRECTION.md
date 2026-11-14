# Amendment 02 | Glass branch snapshot SHA correction

**Applies to:** `REVROT3-19-20261011:819:s3` canonical Morrow receipt.  
**Correction class:** metadata transcription only; source blobs and tree contents unchanged.

The initial report transcribed the Glass main commit SHA incorrectly in Section 3. The exact branch API readback established:

- Glass main commit: `f6e3c914b3722cdd6b57b0a2f024446bb0247f97`.
- Glass recursive tree SHA: `401ff5736a9ede226cc9829cea37489e9307baf5`.
- HsH main commit at the source comparison: `09299ce1762ec199aa6e2210940699426fc06535`.
- The Glass and HsH raw-file blob SHAs in the candidate comparison remain unchanged.

The report was corrected in place and independently read back:

- Report path: `WORKSPACES/MORROW/2026-11-14T0336Z_H819_S3_GLASS_SAME_CONVERSATION_VARIANT_CLASSIFICATION.md`.
- Previous report blob: `c76d222c8c8798be511dbdbbe698f037065fefe3`.
- Corrected report blob: `ffda6140d6b15f832e4eb145238fb41dab188a83`.
- Corrected report content exactly matches the authored replacement.

Existing issue #1712 comment #6871168570 was edited in place to reference the corrected report blob. A fresh issue-comment fetch returned the exact updated body; comment count remains 1. No duplicate comment or issue was created.

The candidate classification, node counts, ancestry counts, payload/edge differences, no-copy disposition, WH-02 gate, and all source-file blob identities are unchanged.
