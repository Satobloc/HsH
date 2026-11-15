# Morrow h857:s3 | SAT20 PDF binary SHA-256 verification

**Run key:** REVROT3-19-20261011:857:s3  
**Nominal slot:** 2026-11-15T17:36Z  
**Selected ring label:** Morrow, index 13  
**Next ring label:** Kestrel, index 14, h857:s4  
**Scope:** archive/source custody and workflow architecture only.

## 1. Authority and boundary

The historical Morrow source is conversation 6a9ee7ca-d340-83ea-b99d-6a3097429f36, raw Git blob ee394b446b2e36d35fd1e5ecd004685c0422457b.

- Nathan Direct role message 402ade01-7116-4efb-9b14-31e477754458, 2026-09-08T03:25:36.187Z: provisional Team Archivist remit covering broader-corpus appraisal, source-based action planning, and GitKeeper coordination.
- Nathan Direct stop message 934e87de-4e61-4622-a0ea-e5047aa235c6, 2026-09-13T00:11:10.939Z: stops theory work and quarantines Morrow-produced theory-bearing material.
- Later trial invitation 99ae959b-fbeb-4c1e-9326-a6723c2b9557, 2026-09-13T15:31:22.757Z: permits bounded archive, maintenance, training, reconstruction and non-authoritative Clearinghouse examination; it does not expressly rescind the theory stop or release Morrow-produced quarantined artifacts.

No standalone signed specialist charter was found. The Team Archivist label is provisional and source-grounded, not an authenticated current assistant identity. No current Morrow thread or cross-thread delivery was authenticated.

This run does not integrate theory, make physical calculations or predictions, correct equations, develop papers, or promote BEDROCK. No mathematical or geometric proposition was introduced; no Lean theorem or build was warranted for this byte-identity task.

## 2. Substantive result: close the binary-hash gap in the h701 crosswalk

The prior Morrow report, WORKSPACES/MORROW/2026-11-09T0548Z_SAT_O1_PDF_IDENTITY_AND_SOURCE_CUSTODY.md, established seven current SAT archive paths with one Git blob and recorded the extraction manifest's SHA-256. It explicitly stated that the binary SHA-256 had not been independently recomputed.

This run retrieved all seven PDF paths through the GitHub Contents API, base64-decoded each file to raw bytes, and independently computed SHA-256 in the execution runtime.

**All seven paths returned the same Git blob, byte length, and independently computed digest:**

- Git blob SHA-1: af5f44d3f936666b4743d8e2ab102b2b9f28f2c2
- Byte length: 150,401
- Independently computed SHA-256: fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d

| Tracked SAT archive path | Git blob | Bytes | SHA-256 |
|---|---|---:|---|
| 2023-24 FRAMEWORK DEVELOPMENT/Minimal Introduction (SAT O era).pdf | af5f44d3f936666b4743d8e2ab102b2b9f28f2c2 | 150,401 | fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d |
| Minimal Introduction (SAT O era).pdf | af5f44d3f936666b4743d8e2ab102b2b9f28f2c2 | 150,401 | fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d |
| PDF LIBRARY [OLD]/Minimal Introduction (SAT O era).pdf | af5f44d3f936666b4743d8e2ab102b2b9f28f2c2 | 150,401 | fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d |
| PDF LIBRARY [OLD]/SAT_O1.pdf | af5f44d3f936666b4743d8e2ab102b2b9f28f2c2 | 150,401 | fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d |
| SAT O Core Modules/SAT_O1.pdf | af5f44d3f936666b4743d8e2ab102b2b9f28f2c2 | 150,401 | fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d |
| SAT_O1.pdf | af5f44d3f936666b4743d8e2ab102b2b9f28f2c2 | 150,401 | fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d |
| Visualizations (O.4D era)/SAT_O1.pdf | af5f44d3f936666b4743d8e2ab102b2b9f28f2c2 | 150,401 | fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d |

The seven current repository paths are aliases of one byte-identical PDF, not seven independent source witnesses or content versions.

## 3. Extraction manifest binding

Manifest: _AUTO_EXTRACTED_TEXT/_manifests/2026-09-10_root_pdf_extraction_pass_002.json  
Manifest Git blob: 01e7af521ffaeed1d6f33230d84a2aed390cd1aa  
Request ID: 2026-09-10_root_pdf_extraction_pass_002  
Manifest timestamp: 2026-09-10T16:03:31.825163+00:00

The manifest records the same source SHA-256 for both:
- SAT_O1.pdf -> _AUTO_EXTRACTED_TEXT/SAT_O1.txt
- Minimal Introduction (SAT O era).pdf -> _AUTO_EXTRACTED_TEXT/Minimal Introduction (SAT O era).txt

Both entries report PyMuPDF, no OCR, 3 pages, 3,919 characters, status OK. The independently computed digest now matches the manifest's source digest exactly.

The derivative files have different Git blob IDs because their extraction headers name different source paths and metadata. The prior h701 report verified that their extracted page-text sections match after removal of the metadata header. This run verifies the binary-to-manifest digest; it does not claim a new extraction or PDF build lineage.

## 4. Local file-index boundary

The current SAT_FULL_FILE_INDEX.txt contains four local SAT_O1.pdf path rows, grouped into two creation-date families:

| Local path family | Recorded creation | Recorded modification |
|---|---|---|
| SAT 20 and SAT 20 bak | 2025-06-03 03:42:04 | 2025-10-27 20:16:48 and 20:25:58 |
| SAT 4D bak/SAT O Core Modules and SAT 4D/SAT O Core Modules | 2025-06-09 19:03:48 | 2025-10-27 20:25:56 and 20:17:20 |

These are four local path records, not two files. The index does not supply a one-to-one mapping from those local Windows paths to the seven current GitHub paths. The two creation-date families are filesystem metadata, not authorship or composition dates.

The HsH and SAT copies of SAT_FULL_FILE_INDEX.txt share one Git blob and therefore are not independent witnesses.

## 5. Source-version distinction remains intact

The prior h701 report identifies the extracted PDF title as SAT20: Emergent 4D Filament-Surface Theory. The legacy filename SAT_O1.pdf is not sufficient to identify the document without the content hash.

The following remain separate source records:
- The SAT20 PDF and its extracted text derivatives.
- SATO.4D Coherence Project TeX at EARLY LOGGED/2025-10-24_12→17_SAT_O1.tex, blob 9a07893cf596e190486df17503626327d6023caa, with an in-document June 2025 date and SATO.4D Coherence Project byline.
- Nathan-byline SAT4D_LIVE_DRAFT.txt, blob 2a79fe25018cce7e99a2c33786d88b0551db6ae7.
- Separate unbylined SAT O1 4D.txt, blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc.

No equation, source lineage, authorship or equivalence is changed by this checksum result.

## 6. Reusable workflow improvement

The new Source Identity Gate separates display label, local path record, repository path, Git blob identity, raw-byte SHA-256, extraction binding, and authorship/intent evidence. It blocks upward inference across those layers.

For this case:
- CONTENT_IDENTITY_VERIFIED
- EXTRACTION_SOURCE_BINDING_VERIFIED
- LOCAL_PATH_MAPPING_UNRESOLVED
- AUTHORSHIP_UNRESOLVED
- INTENT_UNRESOLVED
- NATHAN_DIRECT_NOT_ESTABLISHED

The gate is recorded at WORKSPACES/MORROW/SOURCE_IDENTITY_GATE.md and linked from the Morrow README. This is a source-custody workflow improvement, not a theory primitive, physical model, or formal theorem.

## 7. Mersearch, publication, and tooling

Mersearch was not callable in this runtime. All four shared request lanes remain occupied/requested; no request was opened, overwritten or retriggered. GitHub repository search, tree, file fetch and byte hashing were used as bounded fallback, not represented as Mersearch or exhaustive three-archive coverage.

The existing public issue #1505 remains PUBLISHER_REJECTED / NOT PUBLISHED. Its opened-only publisher cannot be retriggered by editing; a second issue would duplicate the same SAT-O1 source-custody correction. No retry, duplicate issue, manual artifact write or publisher bypass was attempted. This is an internal source-custody addendum, not a new public research claim.

No local Git checkout or suitable generic internal Actions writer was available. The Tool Chest and workflow controls were checked. The documented GitHub Contents API fallback was used with fresh blob SHA compare-and-swap updates and exact independent readbacks.

No new tool, dependency, branch, PR, fork, subscription, paid service, physical calculation, fit, prediction, Lean module, equation correction, paper work, or BEDROCK promotion.

## 8. Project and operational controls

- HsH main prewrite head: 31828bed3b3142cfd1fca771bce730d9d9af5ae4.
- SAT archive main head: f6e3c914b3722cdd6b57b0a2f024446bb0247f97.
- HSH_RESOURCES main head: e58ebfc4b5c8a51ed72fed16abcea66fe9c1086d. Only its root README and HQ Tool Chest were consulted; no private research payload was opened.
- Task graph remains 18 records versus 16 declared branches; Tern retains graph/scheduler authority. No graph edit.
- PWH WH-01 through WH-09 remain P1/HIGH. WH-05 remains blocked; WH-02 remains the highest unblocked action under Calder/authorized-maintainer ownership. No queue edit.
- P0 Code Grurple ACTIVE; P1 Orson-owned cognition OVERDUE / NOT READY; P2 HOLD; P3 INCOMPLETE.
- FIE full re-review completed 2026-11-10; next due 2026-11-24. No premature duplicate review.
- Unrelated reading: HSH_RESOURCES/HISTORICAL/BABBAGE—DECLINE OF SCIENCE.txt, lines 1481–1520. Tags: HISTORY_OF_SCIENCE, SCIENTIFIC_INSTITUTIONS, GOVERNANCE, ROLE_CONFLICT, HISTORICAL_CRITIQUE, UNRELATED_READING, NOT_SAT_EVIDENCE. Next cursor: line 1521. No physical break is claimed.

## 9. Automation and successor

The existing :36 task ID 6a9f52b69ec08191b0a2ba24a074f781 remains enabled with its exact saved hourly schedule:
DTSTART;TZID=America/New_York:20261001T143600
RRULE:FREQ=HOURLY

The task-list read confirms the ID, enabled state and exact schedule. A run-level peek by that ID returned “not found or not accessible in the current context”; therefore no :36 run ID, completion status or chat_ref is asserted. The task-level last_run_time is stale and is not treated as a current run receipt.

The :48 task remains enabled under its existing ID and exact :48 schedule. Kestrel h857:s4 had already started before the optional packet was written. The packet is POST_START_OPTIONAL_CONTEXT_ONLY. No direct thread delivery, consumption or acknowledgment is claimed.

No task, ID, prompt, schedule, phase, cadence or enabled-state change. No sixth task, signet or conversation rename.

**Disposition:** the h701 binary-checksum gap is closed for all seven current repository aliases. Local Windows-path mapping, PDF authorship, in-document date, Nathan Direct intent, and source-version lineage remain unresolved. No theory or paper status changes.
