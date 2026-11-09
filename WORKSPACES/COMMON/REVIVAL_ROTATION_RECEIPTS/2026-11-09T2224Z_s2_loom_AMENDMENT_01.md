# Amendment 01 | h718:s2 Loom canonical receipt

**Date:** 2026-11-09  
**Target receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-09T2224Z_s2_loom.md`

## Correction

Section 3 of the canonical receipt labels the three repository main-head observations “Pre-publication main heads.” That chronology label is inaccurate.

The main heads were fetched **after** HSH-PUBLISH-V1 issue #1545 had published (publisher commit `77c3b73f10f011ef3040012e67e1fed3c554dd87`) and **before** the internal receipt, handoff, CURRENT_WORK, CONTINUITY, and Aster INBOX writes.

The correct label is:

**“Main heads observed during this run, after issue #1545 publication and before internal continuity writes.”**

The observed heads remain:
- HsH main: `63fe813d53a56a223ec7209e792f002493d1aa21`.
- SAT_THEORY_ARCHIVE_2023-25 main: `84b63702595cbd5e6c2f025f88bb618a7f98e458`.
- HSH_RESOURCES main: `41f843f103ece5226384df39557d74436b768ca8`.

No source content, task state, branch, publication status, or scientific conclusion changes. This amendment preserves the original receipt rather than silently rewriting it.
