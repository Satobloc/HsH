# Ariadne h870:s4 - source-identifier erratum to issue #1822

**Classification:** SOURCE_IDENTIFIER_CORRECTION / PUBLICATION_STATE_RECONCILIATION / NO_EQUATION_CHANGE

This is an additive erratum to [issue #1822](https://github.com/Satobloc/HsH/issues/1822). It does not replace the angle-convention or Kerr-scale analysis. It corrects two Git blob identifiers in the published h867 artifact and one raw-export SHA-256 in its canonical receipt. The SAT-O1 and Blockwave SHA-256 values in #1822 were already correct.

## 1. SAT-O1 source identity

The unbylined file SAT O1 4D.txt was retrieved from the HsH archive and three SAT archive paths:

- HsH: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT O1 4D.txt
- SAT archive: SATOBLOC/SAT O1 4D.txt
- SAT archive: SATOBLOC MISC/SAT O1 4D.txt
- SAT archive: SAT_O REWRITE/SAT 4D/SAT O1 4D.txt

All four current GitHub file records return the same Git blob SHA-1:

7577aa1ee5a6c3850ce3b226c75377de6367aedc

The exact file-content SHA-256 is:

8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937

The file is 3,521 UTF-8 bytes. The Git blob identifier printed in #1822 and its h867 receipt, 7577aa5c9b2d4a6e8f1c3d5b7a9e0f2c4d6b8a1e, is incorrect. The SHA-256 printed there is correct.

The SAT archive SAT_FULL_FILE_INDEX.txt header is FullName, CreationTime, LastWriteTime, LastAccessTime. For the SATOBLOC copy, the row records CreationTime 2025-10-26 19:12:34, LastWriteTime 2025-06-09 18:44:50, and LastAccessTime 2025-10-26 19:12:34. The SAT_O REWRITE copy records LastWriteTime 2025-06-09 18:44:52. The timezone is unspecified. These are filesystem-index fields, not a proven composition or authorship date. The source remains unbylined.

The source equation text is unchanged. It defines a one-dimensional curve gamma: R -> R^(3,1) and an action integrated over its affine parameter. The prose description of a 4D worldtube still lacks a source-defined finite-core thickening or support map.

## 2. Blockwave attachment identity

The primary source is the 2025-09-16 user-supplied text attachment in conversation 68c990dd-df28-832e-b766-c267190aaffa, raw HsH Git blob:

fa2586add42b4d87afe89a5b00e1e48a01aaee54

The export records system-role attachment metadata node 9ae20939-a3b7-4e7f-ba7c-313f537fd525 at 2025-09-16T16:31:26.687Z, followed by the file-search result 0f3707aa-c0ae-4bb1-bc59-6333c025cf1c at 2025-09-16T16:31:34.670Z. The legacy file ID is file-LwaFTKkMemPPrLU4qCLpYB.

The archived HsH text path is DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt. Its correct Git blob SHA-1 is:

ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d

Its exact UTF-8 content SHA-256 is:

3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664

The text is 25,255 UTF-8 bytes, 24,619 Unicode code points, and 24,627 UTF-16 code units. The Git blob identifier printed in #1822 and its h867 receipt, ffdb8a6e3c2d1f0b9a8e7d6c5b4a392817161514, is incorrect. The SHA-256 printed there is correct.

The 2025-09-16 event establishes that the attachment was supplied in the conversation. It does not establish who authored the embedded equation text or when that text was composed. The attachment remains USER_SUPPLIED_ATTACHMENT / EMBEDDED_CONTENT_AUTHORSHIP_UNRESOLVED / NOT_NATHAN_DIRECT. Existing [issue #1730](https://github.com/Satobloc/HsH/issues/1730) is the canonical public source-attribution correction. The separate 2025-10-19 assistant response is not the origin of this earlier attachment.

The original Blockwave J^{mu nu} current and its conservation statement remain as written in the attachment. No contraction, dualization, or other map to a rank-one J^mu current is source-defined here. Later assistant-normalized forms remain separate reconstructions, not replacements.

## 3. Ariadne raw-export receipt correction

The Library-held ARIADNE - raw.json export was independently materialized and SHA-256 hashed:

- Size: 6,226,127 bytes
- Correct SHA-256: 2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a8

The h867 canonical receipt records 2996046e3c3b48c3e6d57f47c4e3e4fbe7e95b7d4d2f8e8f2d1f7c4a6b8c9d0e, which is incorrect. The Ariadne README and BOOT already contain the correct digest. This correction applies to the receipt only; it does not alter the archived conversation.

## 4. Issue #1822 publication state

Issue #1822 is now PUBLISHED_VERIFIED, not SUBMITTED_NOT_VERIFIED.

The publisher comment [#6907264739](https://github.com/Satobloc/HsH/issues/1822#issuecomment-6907264739) records:

- Artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ariadne-h867-s0-angle-convention-kerr-scale-source-fidelity-20261116t0300z-001.md
- Publisher commit: ea074e8aa3dde778ec2e2f7dc26c6f7d6fab6192
- Publisher-reported SHA-256: bcaf50373a70cdba357f3815facbb371ef36769b575ee2daee8e7c11ab846388
- Artifact Git blob: eb08bcd06b1647a8b1b82bf04492428144c13caf

An independent readback confirmed exact equality between the issue-envelope content and the canonical artifact file. The h867 receipt and Ariadne README still carry the earlier pending status; those continuity fields are stale.

## 5. Scope and epistemic boundary

This erratum corrects source identifiers, byte-count terminology, one filesystem-index field label, and publication status. It does not change either original equation set, introduce a corrected equation, or promote an assistant reconstruction to Nathan Direct.

No physical calculation, dataset fit, prediction, Lean theorem or build, model experiment, human-subject session, or theory promotion was performed. The original SAT-O1 and Blockwave source artifacts remain unchanged.