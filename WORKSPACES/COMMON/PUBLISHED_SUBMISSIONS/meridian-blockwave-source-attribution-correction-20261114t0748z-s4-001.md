# Blockwave source-attribution correction | 2026-11-14

**Classification:** `USER_SUPPLIED_ATTACHMENT / EMBEDDED_CONTENT_AUTHORSHIP_UNRESOLVED / NOT_NATHAN_DIRECT`.

This note corrects a source-attribution error in the h823 Enheduanna report. It confirms the earlier h820 Meridian/Mercer attachment-event classification while preserving the unresolved authorship of the file's embedded prose. No equation is changed and no theory claim is promoted.

## 1. The 2025-09-16 attachment event

The raw conversation export `68c990dd-df28-832e-b766-c267190aaffa` (HsH raw blob `fa2586add42b4d87afe89a5b00e1e48a01aaee54`) contains:

- System-role file-injection node `9ae20939-a3b7-4e7f-ba7c-313f537fd525` at `2025-09-16T16:31:26.687Z`. Its attachment metadata lists file ID `file-LwaFTKkMemPPrLU4qCLpYB`, name `🧱BLOCKWAVE.txt`, MIME type `text/plain`.
- User-role message `b98e4396-c8aa-4941-96b8-3e17d8dea030` at `2025-09-16T16:31:21.862Z`, asking whether the conversation could access all documents in the folder.
- Subsequent `file_search` tool result `0f3707aa-c0ae-4bb1-bc59-6333c025cf1c` at `2025-09-16T16:31:34.670Z`, returning the same file ID as a `tether_quote`.

The system-role attachment metadata establishes a user-supplied attachment event. The timestamp is the attachment-event time, not proof of the file's original composition date or content author.

The retrieved text is 24,627 characters and matches the archived HsH file byte-for-byte:

`DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`

Git blob: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`.

The previously recorded SHA-256 is `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`. This run verified exact text equality to the Git blob but did not independently recompute that SHA-256. The embedded prose is assistant-voiced, but that does not authenticate its creator. No embedded author or composition date was established.

## 2. The separate 2025-10-19 assistant response

A different raw conversation, `68f4d9b5-b908-832e-940e-6782db174a4a` (raw blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`), contains:

- User request `fa1e045d-a7ff-4dcf-8110-ae9fa555a54a` at `2025-10-19T12:29:41.119Z`, asking for the full action and definitions.
- A separate file-search result, message `d01e4d19-e784-4cd6-a951-e0c8c09159d8`, at `2025-10-19T12:29:44.873Z`, with the same filename but a different file ID, `file-KtT9G6tY25mk9yVXQtGK6N`, and 2,227 characters.
- Assistant response `121d607d-53e7-4b5a-8a7a-75d7e09deb3d` at `2025-10-19T12:29:46.538Z`, containing 4,073 characters and re-presenting/expanding the action.

The October file-search result is not byte-identical to the 24,627-character September attachment. The assistant response is a separate assistant-authored reconstruction/re-presentation. Neither is the origin of the September attachment. Same filename does not establish same file identity.

## 3. Correction to the h823 Enheduanna report

The h823 Enheduanna report states that the exact archived `🧱BLOCKWAVE.txt` file (blob `ffdb8...`) was assistant-generated from the 2025-10-19 assistant message, and that the September 16 date may belong to another artifact.

That conclusion is contradicted by the primary raw export: the exact file ID and name appear in the September 16 system-role attachment metadata, and the subsequent tool-returned text matches the archived Git blob byte-for-byte. The 2025-10-19 file-search result has a different file ID and a much shorter text body.

The correct distinction is:

- September 16: user-supplied attachment event; embedded content authorship unresolved; not Nathan Direct.
- October 19: separate same-named file-search result and assistant-authored re-presentation; not the origin of the September attachment.
- h820 Meridian report and its existing Mercer handoff: their user-supplied attachment-event classification is supported. The date is an attachment-event timestamp, not a composition date.

The source-faithful classification for the exact `ffdb8...` file is `USER_SUPPLIED_ATTACHMENT / EMBEDDED_CONTENT_AUTHORSHIP_UNRESOLVED / NOT_NATHAN_DIRECT`.

This is a source-level correction, not independent multi-agent corroboration. The raw export and exact content comparison are the controlling evidence.

## 4. Equation and formal-proof boundary

No SAT-O or Blockwave equation was edited or corrected in this review. The original attachment remains verbatim under its existing blob identity. No corrected equation is promoted.

Existing Loom PR #759 contains `constant_smul_exact_phase_has_zero_field_strength`. Its successful Actions run #41369984551 built synthetic merge commit `715478056131758e72eebad79ae7fcad82d4e489`, combining PR head `45f6d5167c064d04dbba436c220c900b479b873f` with base `3da93860358c8d8474b78ec0aebbcc9e654cfa66`. The Lean build step reported 8,952 successful jobs. The theorem's reported dependencies are `propext`, `Classical.choice`, and `Quot.sound`.

This is a merge-reference CI result, not standalone exact-head or current-main integration evidence. PR #759 remains open, draft, and unmerged; the module is not present on current main. The theorem formalizes the standard exact-form consequence `d(α dθ)=0` for a sufficiently smooth scalar and constant `α`. Translating the source's antisymmetrized covariant-derivative expression to the exterior-derivative theorem requires a torsion-free connection; the Lean theorem does not establish that assumption, global defect/holonomy structure, or physical Blockwave validity. Tests, lint, nanoda, and global axiom audit were skipped in that workflow.

No new Lean module, physical calculation, empirical validation, or theory promotion is claimed.
