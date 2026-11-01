# Aster | Historical external-disclosure evidence graph
**Run:** `REVROT3-19-20261011:509:s3`  
**Selected identity:** Aster, ring index 2  
**Next identity:** Ariadne, ring index 3  
**Status:** `SOURCE_GROUNDED_RECONSTRUCTION / DISCLOSURE_RECOLLECTION_REPORTED / CANDIDATE_ARCHIVE_ARTIFACTS_IDENTIFIED / EXACT_ATTACHMENT_BINDING_UNVERIFIED / TRANSFER_UNVERIFIED / RECIPIENT_REVIEW_NOT_ESTABLISHED / INDEPENDENT_VALIDATION_NOT_ESTABLISHED`

## 1. Executive correction

A prior assistant-generated Aster summary described an exact two-document disclosure package, a narrow June date range, a 171-page PDF, and detailed contents for that PDF.

Those stronger claims are not established by the direct source material currently readable in this runtime. The source supports a reported historical external contact and a reported outbound disclosure accompanied by image-only attachment pointers. The actual image bytes could not be retrieved, so their relationship to particular archive files remains unverified.

**Correct disposition:** a reported disclosure lead with candidate archive artifacts identified. No verified transfer, recipient acknowledgment, independent scientific review, independent replication, or downstream influence is established.

## 2. Historical Aster remit and source boundary

The original Aster conversation was recovered and read from its raw archive export. It establishes a Nathan-fidelity and source-provenance remit: test whether claims are genuinely supported by Nathan's own statements, preserve chronology and correction context, distinguish user-authored material from assistant reconstruction, and maintain source ancestry. The original user also assigned Aster a Paper A review role.

The later prior-art-team clarification was scoped to its immediately preceding restriction question and accepted Paper A, not a blanket access grant. Current AGENTS.md supersession controls: research reading and public-index/redistribution/publication permissions remain separate. Hypothesis H proper and direct Schreiber-authored content remain outside this run's scope. No `PRIOR_ART` or `QUARANTINE` content was accessed; the Mersearch request preserves automatic exclusions.

Aster's current status remains **REVIEW FROZEN / CROSS-READ OPEN**. This is a separate source-genealogy task, not a reopened formal Paper A review.

## 3. Source chronology and attachment limitation

The recovered original conversation contains:
- a later first-person recollection of an external contact and a possible historical disclosure;
- a separate report of an informal technical pitch followed by no response;
- several image-only user turns in the same conversation segment;
- a subsequent statement indicating that the preceding material was what had been given to the contact.

The user qualified the third-party identity, affiliation, and technical-capability claims as uncertain. Those claims are not independently corroborated and are not repeated here.

The raw export contains image-attachment pointers, but the actual image bytes did not resolve through Files materialization. Consequently:
- the images were not visually inspected or OCRed;
- no exact document title, page count, attachment hash, or image-to-archive-file match is claimed;
- the assistant's earlier identification of the images as particular documents remains an inference, not a source-verified mapping.

The reported contact/disclosure time is not established to an exact day. Document filename dates and later archive-ingestion commits are not transfer timestamps.

## 4. Candidate archive artifacts

### A. SAT LAYMAN / SAT OVERVIEW 17Jun2025

Three archive paths share one Git blob:
- HsH: `DEVELOPMENT_FULL_CONVOS/CONVOS_23/SAT LAYMAN.txt`
- HsH: `DEVELOPMENT_FULL_CONVOS/SAT LAYMAN.txt`
- SAT archive: `EARLY LOGGED/SAT OVERVIEW 17Jun2025.txt`

Blob: `748c233d36d9261a0581b3b6871ec6e0798650ea`  
Length: 23,855 characters, 181 lines.  
Header date label: `17Jun2025`.  
No author/byline field was found.

First extant path commits:
- SAT archive copy: `189c3a42d3e9d466b35fed54d02211cc91161f97`, 2026-09-07T19:08:52Z.
- HsH CONVOS_23 copy: `1e58fde372e30e13440d0e9b330c001de94ea1ed`, 2026-10-17T12:36:10Z.
- HsH top-level copy: `08adca3c16dea09c190756c776d1a34499ad2c38`, 2026-10-23T15:33:37Z.

These are one Git-blob witness, not three independent documents. The header date is not a verified creation or transmission timestamp. The text is a historical lay-level synthesis containing broad claims about filament structure, binding/topology, mass, GR/SM/QM relationships, cosmology and anomalies. Its authorship is unresolved. It is not Nathan Direct by authorship proof, not a canonical current BEDROCK statement, and not independent evidence that its claims were correct.

### B. SAT 22Jun25.pdf

Two SAT archive paths share one Git blob:
- `DRAFT PAPERS/SAT 22Jun25.pdf`
- `PDF LIBRARY [OLD]/SAT 22Jun25.pdf`

Git blob: `caf5771a9d01b8505c23c07ac7cccca04fff49f5`.

First extant path commits:
- DRAFT PAPERS: `0f480df33e8e02490a2ec428a6072e0db716e331`, 2026-09-04T21:01:04Z.
- PDF LIBRARY [OLD]: `4ab5b7f4b060db824e12a3a07b63617ffe2bd02f`, 2026-09-04T21:44:57Z.

The HSH_RESOURCES source-inventory sample contains one row for `GLASS,DRAFT PAPERS/SAT 22Jun25.pdf`:
- size: 5,381,173 bytes;
- inventory SHA-256: `77eb9e652c45650e29cd08be1a86198f05572573b452d170ce274e53bfde9f93`.

The inventory SHA-256 was not independently recomputed. GitHub's text/base64 file route returned no PDF content, and Files Library search did not locate the binary. No PDF metadata, page count, page image, or body was inspected. A 171-page count appears only in the prior assistant-generated summary and remains unverified.

### C. Later assistant summary and later documents

An earlier assistant summary upgraded the candidate artifacts into an exact disclosure package and asserted details about the PDF's internal contents. Those assertions are downgraded pending actual image/PDF bytes and exact hash binding.

A later March 2026 document is a separate candidate artifact. No separate transfer event for it is established here. Do not fold it into the earlier disclosure lead.

## 5. Evidence graph and state machine

The source record now separates:

`ContactRecollection`  
→ `DisclosureRecollection`  
→ `ConversationAttachmentSet`  
→ `CandidateArchiveArtifact`  
→ `ExactAttachmentArtifactBinding`  
→ `TransferReceipt`  
→ `RecipientAcknowledgment`  
→ `ReviewArtifact`  
→ `IndependentReplication`

Current state:

| Evidence object / relation | Status |
|---|---|
| Contact recollection | `USER_REPORTED` |
| Outbound disclosure recollection | `USER_REPORTED` |
| Image attachment pointers | `PRESENT`; bytes unavailable |
| Image-to-file mapping | `UNVERIFIED` |
| SAT LAYMAN archive identity | `VERIFIED_GIT_BLOB` |
| SAT 22Jun25 PDF archive identity | `VERIFIED_GIT_BLOB_AND_INVENTORY_ROW`; binary not read |
| Exact disclosed file hashes | `UNBOUND` |
| Exact transfer date/time | `UNKNOWN` |
| Transfer receipt or contemporaneous delivery log | `NOT_FOUND_IN_INSPECTED_SOURCES` |
| Recipient acknowledgment | `NOT_FOUND_IN_INSPECTED_SOURCES` |
| Recipient scientific review | `NOT_ESTABLISHED` |
| Independent replication | `NOT_ESTABLISHED` |
| Downstream influence / prior-art priority | `NOT_ESTABLISHED` |

A private reported disclosure is not a public publication, endorsement, independent review, or replication. Even a verified transfer would not by itself prove that the recipient read, understood, forwarded, relied on, or validated the material.

## 6. Reusable evidence gate

For future disclosure/prior-art records, use separate monotonic states:

1. `REPORTED_DISCLOSURE`: direct source testimony identifies a contact and disclosure event.
2. `ARTIFACT_IDENTIFIED`: a candidate document has an immutable source path and blob/hash.
3. `ATTACHMENT_BOUND`: actual attachment bytes are retrieved and hash-match a versioned artifact.
4. `TRANSFER_VERIFIED`: a contemporaneous delivery record or recipient acknowledgment binds the exact artifact hash and time.
5. `RECIPIENT_REVIEWED`: an identifiable review artifact records reviewer, date, method, and result.
6. `INDEPENDENTLY_REPLICATED`: independent methods/data reproduce a stated result.

No state may be inferred from a later assistant summary, filename date, shared vocabulary, or mere existence of an archive copy. This is a provenance/workflow schema, not a mathematical theorem; no Lean module was warranted or created.

The same separation applies to scientific predictions:

`SourceClaim → FormalConstruction → ObservableMap → Calibration → FrozenHoldoutPrediction → IndependentMeasurement → StandardComparator → FalsificationDisposition`

Disclosure, prediction, measurement, review and validation are distinct evidence edges.

## 7. Mersearch and existing-tool preflight

The pinned production search is `mersearch-stable-1.0`, commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`. No local HsH/SAT archive checkout exists in this runtime.

Lane availability was checked from request files and request-scoped outputs:
- Lane 1 Calder: request only; no manifest/receipt.
- Lane 2 archive optics: request only; no manifest/receipt.
- Lane 3 Sable J3/J2: completed manifest plus JSON and Markdown compact receipts verified; previous output preserved.
- Lane 4 Tern: completed manifest plus JSON and Markdown compact receipts verified.

Lane 3 was available as a **completed prior-result reservation**, so the Aster request was staged there without overwriting the previous Sable result. The actual bridge topology then exposed a separate dispatch constraint:

- Staged request ID: `aster-june-2025-disclosure-source-lineage-20261101-0536`
- Lane-3 request-file commit: `60555504423e744b90f8864c3bccef23eb9f9105`
- Current lane-3 file blob after privacy sanitization: `425ef62e56e4e01d2dfc04d45640263e141e6009`
- Current lane-3 status: `staged_not_dispatched`
- Current shared input `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` still contains Calder's request, with no verified manifest/receipt at this inspection.
- The existing workflow `.github/workflows/mersearch-request-bridge.yml` (blob `045b99e1cf218e474b92e0340bfeb62056986d99`) reads and validates only `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`. It does not read `MERSEARCH_REQUEST_LANE_3.json`.
- Workflow run `41278156840` has head commit `60555504423e744b90f8864c3bccef23eb9f9105`, but its runtime input is the shared Calder request, not the staged Aster lane file. It is **not an Aster search**. Its final manifest must be checked before assigning its actual request identity.
- The run was created on a lane-3-only push even though the checked-in workflow's path filter names only the shared request file. Trigger-path conformance is unresolved; do not infer that a lane-file edit dispatched that lane.
- The lane-3 request was subsequently sanitized with a `[skip ci]` commit: its current query contains no raw conversation/message UUIDs or direct user excerpt. The earlier lane-file commit remains in Git history; no history rewrite was attempted.

**Dispatch rule:** `LANE_STAGED` is not `DISPATCHED`. A lane may be marked `RUNNING` only when an Actions run's manifest `request_id` matches that lane's request. The existing shared request slot must not be overwritten while Calder's request remains pending. Default `PRIOR_ART` and `QUARANTINE` exclusions remain preserved.

Existing HSH_RESOURCES tools were inspected before considering any new tooling:
- `tools/extract_papers.py` v1.2.0
- `tools/extract_image_text.py` v1.0.0

Local prerequisites `pypdf 5.9.0`, `pdftotext`, `tesseract`, and `pdftoppm` are present. The tools cannot run without the actual PDF/image bytes. No new tool or dependency was built. Files materialization did not resolve the image pointers.

## 8. Current project controls and outstanding owner cursor

- Current Task Branch Graph keeps Code Grurple active; HAGALAZ ordinary theory work remains backseat/hold.
- Paper A and Paper B remain pinned R1; no manuscript, feed, renderer, or reader changes were made.
- The prior route status remains `ACCESS_UNAVAILABLE / ROUTE_NOT_OBSERVED`; no repeated site probe was made because no site-capable editor/browser context is available.
- Aster's latest continuity cursor is Loom owner review of the Compendium correction proposal. Issue #1184 remains open with one comment; the mismatched entry remains present. Aster did not edit the Compendium or assume Loom's ownership.
- FIE last full review: 2026-10-27; 14-day revisit not due.
- Unrelated-reading cursor: Babbage, line 721; no repetitive break performed.

## 9. Next cursor

1. Verify Mersearch run `41278156840` and read its request-scoped manifest plus both compact receipts. If incomplete, preserve `SUBMITTED_NOT_VERIFIED` and do not reuse lane 3.
2. If authorized image/PDF bytes become available, use the existing extraction tools, record exact source hashes, page count, metadata and extraction quality, then test image-to-archive binding.
3. Seek a contemporaneous transfer record or recipient acknowledgment only through an authorized source route. Do not infer identity, influence, review, or validation from the recollection.
4. Keep recipient review, independent validation, and influence unestablished until their own evidence exists.
5. Leave the Loom-owned Compendium correction pending owner review; do not edit it.

## 10. Disposition

Current report version is sanitized for the public HsH repository: it contains no raw conversation/message identifiers, direct user excerpts, or third-party identity/biographical details. It records only the high-level evidence disposition and public archive-artifact identities.

No public issue was created. No BEDROCK, theory, SAT-O/Blockwave equation, manuscript, paper gate, task ID, automation, schedule, or branch was changed. No physical calculation, fit, measurement, Lean theorem, new PR, or new tool was created.
