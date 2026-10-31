# Read-It-Tag-It ledger: Morrow Wanna Bounce / Blockwave source genealogy

**Date:** 2026-10-31  
**Worker:** Morrow (Team Archivist continuity reconstruction)  
**Run:** `REVROT3-19-20261011:485:s1`  
**Rule:** tags classify the evidence and its provenance; they do not promote a pasted document or assistant output into Nathan Direct authorship.

| Source | Exact locator | Tags | Attribution / limits |
|---|---|---|---|
| `Interesting discovery shared` raw export | Conversation `685f010a-5ac4-8003-86dd-3f8307306113`; blob `b730da7d13cb483a718e9d4ee6a0ebcea88cbdba` | `RAW-CONVERSATION`, `SOURCE-STRATIGRAPHY` | Raw source container; not every embedded tool result is source content. |
| User's silo instruction | Message `404e2b3c-2f3b-4d66-bb4e-0c85e6f29d2f`, 2025-09-17T15:10:43Z | `NATHAN-DIRECT-CONTEXT`, `SILO-BOUNDARY` | Direct user statement; preserve project separation unless a later direct instruction crosses it. |
| User's folder classification | Message `1aa3851c-1ec8-429a-b422-5f2e21e3c9d0`, 2025-09-17T15:13:06Z | `NATHAN-DIRECT-CONTEXT`, `SAT-PROJECT-CLASSIFICATION`, `MATH-CHECKING-CONTEXT` | Direct user statement that the folder is more SAT material and was set up to check the math. |
| First Wanna Bounce upload | Message `12cd692b-0d91-4b0f-92fd-c6aee85f2a52`; attachment `file-7TPAEEBsufwGfDk2uyadKh`; 104,310 bytes; text/plain | `USER-SUPPLIED-ATTACHMENT`, `GALLEY-CANDIDATE`, `CONTENT-AUTHORSHIP-UNRESOLVED`, `ORIGINAL-BYTES-UNAVAILABLE` | User upload event is authenticated; internal author is not. |
| Assistant's High Weirdness classification | Message `cebac30b-...` and later `c6ffeb5f-...` | `ASSISTANT-MISCLASSIFICATION`, `NOT-NATHAN-DIRECT` | Contradicted by the user's direct SAT/math-checking folder classification. |
| `The Tourist Tailor` raw export | Conversation `68cad3d4-0ccc-8325-be36-94c5b5527997`; blob `dd2b6141af86dea54e4ba2e782214128619ce78c` | `RAW-CONVERSATION`, `SOURCE-STRATIGRAPHY` | Raw context for the galley re-upload and Chapter 5 instruction. |
| User's galley statement and re-upload | Messages `1f6020da-d2ec-473a-91e2-bffa9c87b136`, `eeed644f-73a5-4438-b933-1546e3b07308`, `1f752b8f-358e-44d1-b19b-ecfa475b0c2e`; attachment `file-AV8v8UFNdEmU47PyBKWxqG` | `NATHAN-DIRECT-CONTEXT`, `USER-SUPPLIED-ATTACHMENT`, `GALLEY`, `BYTE-IDENTITY-UNVERIFIED` | Same name/size as first upload, different attachment ID. Byte identity is not established. |
| User's 3-form track instruction | Message `9dc27aac-b34d-46db-8bb1-be603ba3fb73`, 2025-09-18T15:42:49Z | `NATHAN-DIRECT-CONTEXT`, `EDITORIAL-CHOICE`, `J3-DIRECTION` | Direct conceptual direction; not a supplied equation or proof. |
| Assistant Chapter 5 output | Message `ff0ef513-0f75-4e87-a719-378447788b32`, 2025-09-18T15:43:01Z | `ASSISTANT-AUTHORED-FORMALIZATION`, `J2-J3-TRANSITION-CANDIDATE`, `HODGE-DEGREE-ERROR` | Assistant supplied the equations; its 2-form/3-form duality sentence is wrong in 4D. |
| Frontispiece approval | Message `4847aa08-b38c-4e87-8692-6f22e8c6ab69`, 2025-09-18T15:45:17Z | `NATHAN-DIRECT-CONTEXT`, `LAYOUT-APPROVAL-ONLY` | Not mathematical endorsement or authorship adoption. |
| `[A] SAT` assistant J2 explanation | Conversation `68c990dd-df28-832e-b766-c267190aaffa`; blob `c0a26b8375c88c845ebd8cfe9b14516992ccc99d`; message `2a7b69af-14b8-4177-b79b-9172394fa9ff` | `ASSISTANT-AUTHORED-FORMALIZATION`, `J2-WORLDSHEET-CURRENT` | Assistant-generated explanation; not Nathan Direct math. |
| `SEAN` re-paste | Conversation `68c97245-2af8-832a-808b-9758dd81eda1`; blob `3dedddba741d28f50c21566a4dc7b786df427026`; user message `12b331db-49d4-455c-93ec-6a744ac20f4f` | `PASTED-ASSISTANT-CONTENT`, `NEAR-DUPLICATE`, `NOT-INDEPENDENT-WITNESS` | Normalized token-set Jaccard 0.993902439 against the earlier assistant response; not byte-identical. |
| `WB516.txt` | Blob `37b201bedae76f665ee3c6e6d9fdae2439959dea` | `DERIVATIVE-ASSISTANT-COPY`, `PARTIAL-PROVENANCE` | First 3,002 characters exactly match the assistant Chapter 5 code block after line-ending normalization; remaining text not fully traced. |
| `WB12_proof.txt` | Blob `8f54d75eee20155e226de933d0f228c60598b89a` | `UNATTRIBUTED-DERIVATION-CANDIDATE`, `J2`, `NOT-A-LEAN-PROOF` | No byline or raw source conversation recovered. |
| `Wanna_Bounce_.txt` extraction | Old archive blob `3049b4d30dbbacc07044de2f9c26b432c6571bbe`; source PDF SHA-256 `cd36f682aa9761a14ae3e3c85661724d86dd0f90e660b6c6c48ce71fa118021e` | `DERIVED-PDF-EXTRACTION`, `UNBYLINED`, `NO-OCR`, `SOURCE-LINK-UNPROVEN` | 54-page extraction; no named author found in extracted text; not the original galley bytes. |
| Page One paste | Conversation `699e4a02-26e4-832a-86ea-ad1dcaf3c4e3`; blob `8b6794a2be3e19b6bba32acfbbc4c6636b1b02e3`; message `15338421-a5e7-4538-879a-d25d840d2bdd` | `USER-ROLE-PASTE`, `UNBYLINED`, `EMBEDDED-AUTHORSHIP-UNKNOWN` | User-role paste does not establish authorship of embedded document. |
| July 2026 Page One retrieval | Conversation `6a3a279a-10cc-83ea-9abf-4fc1dab9fb55`; blob `512c5713ea0b5dc13fec59f4835913e92ff2f14c`; tool message `8a76c477-...` | `FILE-SEARCH-RETRIEVAL`, `TOOL-OUTPUT`, `NOT-ORIGINAL-SOURCE` | Later retrieval event; not a source-authorship witness. |

## Reproducibility notes

**WB516 prefix check**
- Extract assistant LaTeX code block from message `ff0ef513-0f75-4e87-a719-378447788b32`.
- Slice from `\\section*{Promise of the Chapter}`.
- Normalize CRLF to LF in WB516 and trim leading whitespace.
- Result: assistant Chapter 5 block length = 3,002 characters; WB516 begins with the exact block.

**SEAN re-paste similarity**
- Remove the assistant's leading file-navigation UI.
- Normalize whitespace and citation markers.
- Tokenize lowercase alphanumeric/underscore words.
- Jaccard = |A ∩ B| / |A ∪ B| = 0.993902439.
- This is a near-duplicate, not byte identity.

No item above receives a `NATHAN-AUTHORED-MATH` tag. The user's direct conceptual instructions are tagged as such; equations remain separately attributed.
