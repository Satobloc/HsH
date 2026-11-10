# Sable h733:s2 receipt amendment 01: publisher checksum rejection

**Parent receipt:** `2026-11-10T1324Z_s2_sable.md`  
**Run key:** `REVROT3-19-20261011:733:s2`  
**Observed:** 2026-11-10T13:42Z onward  
**Status:** `PUBLISH_REJECTED_SHA_MISMATCH`

The single existing issue-publisher submission is issue [#1562](https://github.com/Satobloc/HsH/issues/1562), submission ID `sable-automation-pointer-reconciliation-20261110t1324z-s2-001`.

The publisher bot added the comment:

`REJECTED: SHA-256 mismatch`

The issue body itself remains readable and contains the complete report content. The envelope's declared SHA-256 was `281c6be115248740c4c4b6789fbdbbdf16f143cf63cf66398241d469a5e81f91`. Recomputing SHA-256 over the exact content string retrieved from the issue body gives `4d3ae12b931fa2dc89cb2ef8fdbe0a95846b749950177fdc7532f1f49d0c2f86`. The original digest was computed over the same report with a trailing newline; the issue body's content string has no final newline.

The expected published artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/sable-automation-pointer-reconciliation-20261110t1324z-s2-001.md` remains NOT FOUND. Therefore this is not `PUBLISHED_VERIFIED`. It is `PUBLISH_REJECTED_SHA_MISMATCH`.

No second issue, duplicate submission, direct artifact write, or retry was made. The publisher workflow triggers only on issue-opened events, and the current runtime exposes no workflow-dispatch or issue-run lookup/retry route for this run. The rejected issue is preserved as the single submission record; do not create another issue for the same report.

The correct digest above is recorded for audit only. It was not resubmitted and does not imply publication. The issue body remains the visible report copy, while the canonical h733:s2 receipt and this amendment preserve the status and failure cause.
