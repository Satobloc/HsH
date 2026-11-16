# Meridian h869:s2 — Amendment 03: independent SHA-256 implementation correction

This amendment supersedes the report SHA-256 value printed in Amendment 02. The original report and issue #1826 body are unchanged.

## Correct digest

- Exact report path: `WORKSPACES/MERIDIAN/2026-11-16T0524Z_H869_S2_LANE24_EMPIRICAL_GEOMETRY_READOUT_AUDIT.md`
- Git blob: `85ca50583a80c88d8faed9767ba0534f3893283f`
- Issue #1826 `content` and workspace report remain byte-for-byte equal as decoded UTF-8 strings (18,925 characters).
- **Correct SHA-256:** `4967101246815448db01df581cd2b3ce4efd4ef8fd8c84ccc34b582cf762ecca`
- Submitted digest in issue #1826: `1d2fffbf5b78cf3b7b87de84514b951c68e92f2fea071e3508ef4e11aab89d8f` — mismatch.
- Amendment 02's `e5777c655ad7ffa7262c605c8532bf12d99e171175672dbaf710753eae9131e7` was itself an incorrect recomputation caused by a defect in the ad hoc SHA-256 implementation used there. Do not use that value.

The replacement SHA-256 implementation was checked against the standard `abc` test vector (`ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad`) and independently reproduced the known SHA-256 `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937` for the exact SAT-O1 source file whose Git blob is `7577aa1ee5a6c3850ce3b226c75377de6367aedc`. It then computed the report digest above from both the issue payload and workspace file.

The publisher's rejection remains correctly identified as the uppercase schema error because `tools/issue_publish.py` checks the exact schema at line 39 before computing/comparing the SHA-256 at lines 47–49. The digest mismatch is an additional defect that would have failed the next validation stage. The correct final status is still **PUBLISHER_REJECTED / NOT_PUBLISHED**; no artifact exists, no retry or duplicate issue was made, and issue #1826 was not edited or reopened.

## Reproducibility script digest

The one-off source-data calculation script has:
- Git blob: `8ef3f7bc1b4d5155baef841d07127e6a88040753`
- SHA-256: `5ec44b512a43d1f2679ab0baccf519b65299c4bbce24c65cd3bd5a0fbb56e037`

No equation, manuscript, source file, publication artifact, task, schedule, or theory status was changed by this correction.


## 2. SAT-O1 and Blockwave source-byte verification

The source equations in the h869 report were rechecked against the three-repository onboarding boundaries. HSH_RESOURCES was limited to its root README; no private research payload was opened.

**SAT-O1 4D source**
- Repository/path: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SAT O1 4D.txt`
- Git blob: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`
- SHA-256 independently reproduced from the fetched source bytes: `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`.
- First archive commit: `b543eb3fbf16e50500ceadad83dc9a7dc0759e5b`, 2025-10-27T00:40:28Z.
- File-index metadata carried in the report: created 2025-06-07 08:38:16; modified 2025-06-09 18:44:50; archive-ingest timestamp 2025-10-27 23:18:35. These are index dates, not proof of the original document's creation event.
- The TeX header's generic author field is `SAT\_O Project`; no named individual author is supplied. The original equation excerpt in report §6 is verbatim. No correction was made.

**Blockwave Clean Action original attachment**
- Historical conversation: `68c990dd-df28-832e-b766-c267190aaffa`, raw export blob `fa2586add42b4d87afe89a5b00e1e48a01aaee54`.
- Attachment event: system message `9ae20939-a3b7-4e7f-ba7c-313f537fd525`, 2025-09-16T16:31:26.687Z; attachment ID `file-LwaFTKkMemPPrLU4qCLpYB`, filename `🧱BLOCKWAVE.txt`, MIME `text/plain`.
- The subsequent assistant message `593c65e5-1947-4df5-9c82-840afd6564fb` (2025-09-16T16:31:33.446Z) says the user uploaded four documents. This establishes a user-supplied attachment, not authorship of the attachment's embedded prose/equations.
- Original Library attachment bytes: 25,255 bytes; SHA-256 independently verified as `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`.
- HsH archived text representation: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`, Git blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, 24,627 characters, SHA-256 `681680b5d758fa41c84a745c6f88d5bfd135d7c0a0a87436bbd5310dae1bac74`. It is a distinct archive representation, not byte-identical to the 25,255-byte original attachment.
- First extant HsH Git observation of the archived text file: commit `6e4415f62616b19ae5cb677984c85d1985834d9d`, 2026-10-08T02:42:49Z. This is a repository observation date, not the attachment event or original creation date.
- Preserve the original Clean Action's malformed tokens exactly. The October 19 assistant re-output and any normalized equations are separate assistant reconstructions, not corrections accepted by Nathan. Embedded authorship remains unresolved.

**Separate Blockwave drafts in the public SAT archive**
- `SATOBLOC/SATOBLOCK-LIVE.txt`: blob `1642375cf78647b9f35f1681d0bccb90685b2a48`; SHA-256 `71aabb7018d9dc4cc338e5e1aaad39765e51873b27457e734b2c538c628c9f75`; first commit `f5cbe9aba986b39ace86c55a7bea53feb854445f`, 2025-10-28T00:04:17Z.
- `SATOBLOC/SATOBLOCK Full Theory & Predictions.txt`: blob `3893ef0acf9009b01c58c736ec97b8df2ba74943`; SHA-256 `c6459c6c3cc86d71f0889578c728601181a6c4c2088f38f8a132dcad2937f569`; first commit `aaac961cfc519873eff650c12f39d005eda30e6a`, 2026-05-31T23:05:38Z.

These are separate drafts. The Full Theory file's nonrelativistic Phi-hydrodynamic expression is not a correction to the 2025 Clean Action or the SAT-O1 4D action. The October 19 assistant reconstruction is also kept separate. No equation was corrected, replaced, or promoted in this run.
