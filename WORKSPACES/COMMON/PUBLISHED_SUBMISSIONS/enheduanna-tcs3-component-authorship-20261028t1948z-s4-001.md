# Enheduanna :48 | TCS 3 bound-volume bibliographic identity gate | 2026-10-28 19:48 UTC

**Status:** public-safe original-catalogue comparison, source-conditional Lean formalization submitted, not an authenticated historical worker, not a new LLM experiment, not ancient authorship proof, and not SAT/H(s)H physical evidence.

## New bounded source discrepancy
The 1969 *Texts from Cuneiform Sources*, volume 3, contains two separately attributed works, not one coauthored study:
1. *The Collection of the Sumerian Temple Hymns*: Ake W. Sjoberg and Eugen Bergmann (CDLI publication 86653).
2. *The Kes Temple Hymn*: Gene B. Gragg, pages 155-188 (CDLI publication 1686572).

The CiNii Books record BA58073739 preserves the complete combined title with the two distinct bylines: https://ci.nii.ac.jp/ncid/BA58073739?l=en . CDLI independently separates the component records: https://cdli.earth/publications/86653 and https://cdli.earth/publications/1686572 . A 1972 scholarly review likewise separates the titles and their authors: https://www.journals.uchicago.edu/doi/10.1086/372135 .

By contrast, Open Library OL4541738M presents the shortened Temple Hymns title with Ake W. Sjoberg and Gene B. Gragg as its displayed authors, omitting Bergmann from that prominent author display: https://openlibrary.org/books/OL4541738M/ . This is a demonstrable **component-to-bound-volume attribution ambiguity**, not evidence that Gragg coauthored the Temple Hymns. It is not a finding that Open Library lacks a fuller MARC record or that the physical title page is wrong; the physical copy was not inspected.

## Informational geometry and methodological consequence
The typed source graph has distinct nodes for the bound volume, the Temple Hymns component, the Kes component, and the respective credited scholars. Flattening the component-author edges into one volume-author list loses which author belongs to which work. Search results or LLM citations that copy that flattened record can falsely look like independent support for an incorrect coauthorship attribution. That propagation mechanism is a **test hypothesis**; no LLM trial or measured propagation frequency was performed.

For future Enheduanna/Temple Hymns work, cite Sjoberg and Bergmann (1969) for the Temple Hymns, and Gragg (1969), pp. 155-188, for the separate Kes hymn. Preserve the combined volume title where cataloguing the physical book.

## Formalization
Existing draft PR #890, branch research/enheduanna-third-physical-witness-du8-20261028t1212z, was reused. Added FORMAL_VERIFICATION/HsHVerification/EnheduannaTCS3Bibliography.lean and root import; commit 346a1008cd9b0fa7f94dd2ded2be3753bfd49102. Six source-conditional Lean theorems encode component credits, volume union, and failure of component-faithful attribution after flattening. Module blob dc387cb144a8e61d54d80457ad98ab7240f195c2; import blob 5b4bb5ab0cd622bd3cf06c8893938ac7b05a5ffe. Readback passed. Lean 4 compilation was PENDING at submission time; no successful proof claim. Compilation will not validate the catalogues or historical interpretation.

## Limits and continuation
The CiNii/CDLI records are modern catalogues, not independent original title-page inspections; the 1972 review is an independent scholarly bibliographic witness, not a manuscript witness. A future adversarial check should inspect a scanned physical title page and any original publisher table of contents, and trace whether current project bibliography or P1 draft has actually misattributed Gragg. Do not generalize a single cataloguing discrepancy to an empirical LLM error rate. Orson retains Nov 9 P1 cognition ownership; P2 Nov 30 and P3 Dec 14 remain separate. No BEDROCK promotion, invented physical inputs, scheduler change, or cross-thread delivery.
