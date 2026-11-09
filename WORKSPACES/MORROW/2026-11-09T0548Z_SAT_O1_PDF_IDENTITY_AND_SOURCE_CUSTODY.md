# SAT-O1 PDF identity and source-custody crosswalk

**Run:** `REVROT3-19-20261011:701:s4`  
**Nominal slot:** 2026-11-09 05:48 UTC  
**Worker label:** Morrow (ring index 13)  
**Successor label:** Kestrel (ring index 14; next slot key `h702:s0`)  
**Scope:** archive provenance and source identity only. No theory integration, equation correction, physical calculation, prediction, paper development, or BEDROCK promotion.

## Executive result

The legacy filename `SAT_O1.pdf` resolves to a three-page PDF whose extracted title is **SAT20: Emergent 4D Filament–Surface Theory**. It is not the separate June-2025 SATO.4D Coherence Project O1 TeX source and is not Nathan's bylined `SAT4D_LIVE_DRAFT.txt`.

The SAT archive's current Git tree contains **seven paths** for the same PDF content. All seven have Git blob SHA-1 `af5f44d3f936666b4743d8e2ab102b2b9f28f2c2` and size **150,401 bytes**. The extraction manifest records the same source SHA-256, `fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d`, for both `SAT_O1.pdf` and `Minimal Introduction (SAT O era).pdf`. Their extracted page-text sections are byte-for-byte equal after the extraction metadata header is removed.

The prior handoff and issue #1505 described two file-index copies, one from each date family. The actual current `SAT_FULL_FILE_INDEX.txt` contains **four local path entries**, two in each date family. The current GitHub tree contains seven paths because it includes both filename families. These are duplicate paths to one byte-identical PDF, not seven independent source witnesses or seven content versions.

## 1. Repository and source coverage

- HsH main observed at `c136eaf8e5063a070f23f14b237f94689fe79333`.
- SAT archive main tree observed at `35804a91bca29e596033837971de5db9848e9dfb`; recursive tree returned 5,383 entries and was not truncated.
- The three-repository onboarding was read. HSH_RESOURCES was consulted read-only; its private reference boundary was preserved. No private paths or contents are reproduced here.
- The current SAT `..findex.txt` is generated at 2026-11-06T16:49:56.454447Z, blob `c80ccceb08f511ee16087159cc8dcc6aabde7a3a`.
- The current SAT and HsH copies of `SAT_FULL_FILE_INDEX.txt` have the same Git blob SHA-1, `4accca1e0473577d6556715c5bfb9fce78e8ca4d`; they are copies of one index, not independent corroborating indexes.

### Seven current PDF paths

All seven paths below resolve to the same Git blob `af5f44d3f936666b4743d8e2ab102b2b9f28f2c2`, size 150,401 bytes:

1. `2023-24 FRAMEWORK DEVELOPMENT/Minimal Introduction (SAT O era).pdf`
2. `Minimal Introduction (SAT O era).pdf`
3. `PDF LIBRARY [OLD]/Minimal Introduction (SAT O era).pdf`
4. `PDF LIBRARY [OLD]/SAT_O1.pdf`
5. `SAT O Core Modules/SAT_O1.pdf`
6. `SAT_O1.pdf`
7. `Visualizations (O.4D era)/SAT_O1.pdf`

The current generated folder index lists four `SAT_O1.pdf` paths and three `Minimal Introduction (SAT O era).pdf` paths, matching the seven-path tree inventory.

## 2. Local file-index metadata

The current `SAT_FULL_FILE_INDEX.txt` has four `SAT_O1.pdf` rows:

| Relative local path | Created | Modified |
|---|---|---|
| `SAT 20/SAT_O1.pdf` | 2025-06-03 03:42:04 | 2025-10-27 20:16:48 |
| `SAT 20 bak/SAT_O1.pdf` | 2025-06-03 03:42:04 | 2025-10-27 20:25:58 |
| `SAT 4D bak/SAT O Core Modules/SAT_O1.pdf` | 2025-06-09 19:03:48 | 2025-10-27 20:25:56 |
| `SAT 4D/SAT O Core Modules/SAT_O1.pdf` | 2025-06-09 19:03:48 | 2025-10-27 20:17:20 |

Thus the earlier “two copies” wording compresses **four local paths into two creation-date families**. The file index does not establish a one-to-one mapping from those four historical local paths to the seven current GitHub paths. The current Git blob identity does establish that the seven present GitHub copies have identical bytes. The June timestamps are filesystem creation metadata, not verified content-authorship or revision dates.

## 3. Extraction identity

Public source records:

- `_AUTO_EXTRACTED_TEXT/SAT_O1.txt`, blob `bd244e49c6b668a72131b4f195e32820d4540746`.
- `_AUTO_EXTRACTED_TEXT/Minimal Introduction (SAT O era).txt`, blob `9b32719d529b52b8d2ffc732d7c29b33086b2a8c`.
- Extraction manifest `_AUTO_EXTRACTED_TEXT/_manifests/2026-09-10_root_pdf_extraction_pass_002.json`, blob `01e7af521ffaeed1d6f33230d84a2aed390cd1aa`.

The manifest records both source PDFs with SHA-256 `fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d`, three pages, 3,919 extracted characters, PyMuPDF, no OCR, status OK. The extracted text files have different blob hashes because their metadata headers identify different source filenames and extraction times; the page-text sections are exactly equal.

The extraction header identifies Ravel / ChatGPT as requester and 2026-09-10 as extraction time. It does not establish the PDF's author or in-document creation date. **The binary SHA-256 was not independently recomputed in this run.** The SHA-256 above is the value recorded in the extraction manifest; the seven-copy byte identity is independently supported by the Git blob SHA and size.

## 4. Distinct SAT20 and SATO.4D source records

### 4.1 Legacy PDF / SAT20 content

The extracted PDF title is **SAT20: Emergent 4D Filament–Surface Theory**. No author or in-document date is established in the extraction header. The neutral SAT20 source text in HsH, blob `1b91341f43a18477837446dbc4f67d7711345032`, has the same title and an empty author/date field. Its prose and displayed mathematics align with the PDF extraction. This is a textual source/parallel-text correspondence; no PDF build manifest establishes that this text file generated the PDF.

The separate SAT20 Critic-Hardened v2 text, blob `8b523ce0acc18b9df1d2737c5b21c3c3ab92906a`, has a distinct title and content. It is not the extracted PDF version.

Representative verbatim PDF-extraction transcriptions:

~~~text
Jµ(x) = Σγ ∫ dλ vµ(λ) δ4(x − γ(λ))
τµ(x) ∝ Jµ(x)
dφ(x) = τµ(x)dxµ
πµ(λ) = T dξµ/dλ
H = 1/(2T) πµπµ
~~~

These are PDF text-extraction transcriptions, not source TeX. In particular, the displayed current is a one-index vector current, `J^µ`.

### 4.2 Separate SATO.4D Coherence Project TeX

The file `EARLY LOGGED/2025-10-24_12→17_SAT_O1.tex`, Git blob `9a07893cf596e190486df17503626327d6023caa`, has the in-document date **June 2025** and the byline **SATO.4D Coherence Project**. Its archive path prefix is a separate log/path timestamp. It is not the SAT20 PDF and not Nathan's bylined Live Draft.

Representative verbatim TeX strings:

~~~tex
\cos \theta_4(x) = \frac{v^\mu u_\mu(x)}{\sqrt{v^\nu v_\nu} \sqrt{u^\rho u_\rho}}
~~~

~~~tex
\pi_\mu = m \dot{\xi}_\mu
~~~

~~~tex
H = \int d\lambda \left( \frac{1}{2m} \pi^\mu \pi_\mu + V_{\text{tension}}[\xi^\mu] \right)
~~~

These expressions differ from the PDF extraction's tension-normalized momentum and Hamiltonian. They remain separate source versions; this report does not choose one, merge them, or propose a correction.

### 4.3 Other nearby records

The prior Morrow h690 source-custody record already distinguishes Nathan-byline `SAT4D_LIVE_DRAFT.txt` (blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`) from unbylined `SAT O1 4D.txt` (blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`). The present pass adds the separate SATO.4D TeX and the seven-path SAT20 PDF identity. No Blockwave source or equation was altered. The SAT20 `J^µ` vector current is not Blockwave's separately authored `J^{µν}` 2-form; no equivalence is inferred.

## 5. Nathan Direct source gate

GitHub fallback searches for `SAT_O1.pdf`, `SAT20`, and `SAT O1` in the raw-conversation archive paths surfaced indexes, SAT20 source files, assistant-produced context and the existing Tern/Morrow handoff. They did **not** recover a subject-specific Nathan user-role statement establishing the PDF's authorship, intended status, or relationship to the SATO.4D TeX.

Accordingly:

- **PDF content identity:** established at the current repository-copy level.
- **PDF authorship and in-document date:** unknown.
- **Nathan Direct intent/authorization for this PDF:** `SOURCE_RECOVERY_BLOCKED`.
- **SAT20 neutral text → PDF build lineage:** not established.
- **File-index local path → current GitHub path one-to-one mapping:** not established.
- **Geometry-to-equation or equation-to-geometry fidelity:** not evaluated; Morrow's direct theory stop remains in force.

Do not cite the PDF as Nathan Direct, treat the SATO.4D TeX as Nathan-authored, or silently promote any of these documents into BEDROCK.

## 6. MIND / paper protection check

This was a status/protection check, not a new Orson paper review or experiment:

- Orson retains P1 ownership. Current Orson work still marks the November 9 minor paper **NOT READY**.
- Issue #564 remains open. PR #850 remains open/draft/unmerged.
- The PR reviews endpoint returned zero formal review records. Existing issue/PR comments are not themselves a completed independent technical review.
- The current Orson workspace still reports no canonical P1 manuscript source, compiled readable PDF/reader, verified independent review, or author disposition. No new human session, model trial, API spend, manuscript edit or ownership change occurred.
- The P1 source scope remains the archived ConsistencyBench methods record; the model-labelled outputs must not be represented as independent agents or peer-deliberating group members without a documented peer-message path.

The existing publisher issue #1505 is **PUBLISHER_REJECTED / NOT PUBLISHED**. Its submitted digest included a final newline absent from the stored issue payload; the publisher listens to `issues.opened`, so an edit cannot retrigger it. The expected artifact path is absent. No retry, duplicate issue, manual artifact write or second submission was made.

## 7. Tooling, formalization, and operational limits

- Mersearch was not run. No Mersearch connector is exposed in this runtime; all four shared request lanes remain `requested`, and their request-scoped manifests/receipts are absent. GitHub search, tree and source-file readback were used as a bounded fallback, not described as Mersearch or an exhaustive archive search.
- No local checkout, `gh`, Lean, Lake or Elan executable was available. No Math Hopper or Whirligig tool was exposed. Existing Orson PR #850 was not modified. No Lean theorem or physical calculation is claimed; the file-copy equivalence is a content-addressed repository observation.
- No new tooling, dependency, branch, PR, paid service or API-spend experiment was created. SciSpace was available but not relevant to this file-identity task.
- The task graph remains 16 declared branches versus 18 records; Tern retains reconciliation ownership. No graph edit.
- FIE's last full review remains 2026-10-27; the 14-day rereview threshold is 2026-11-10, not yet due.
- Unrelated reading: Okakura, *The Book of Tea*, Project Gutenberg eBook 769, lines 861–900; next cursor 901. No physical break is claimed.

## 8. Scope and disposition

Morrow's direct Team Archivist/source-custody remit and direct theory-stop message remain controlling. The later archive/maintenance trial permits provenance, chronology, source comparison and equation checking; it does not lift the stop on theory integration, physical prediction or paper work.

**Disposition:** source-custody delta resolved for current PDF-copy identity; authorial-intent and original Nathan Direct source recovery remain blocked. No equation correction, theory integration, physical calculation, paper work, BEDROCK change, or public publication occurred.
