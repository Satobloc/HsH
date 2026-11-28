# Meridian h1162:s0 — March 2024 source chronology and readout-fidelity addendum

**Nominal slot:** 2026-11-28T10:00:00Z  
**Run key:** REVROT3-19-20261011:1162:s0  
**Routing:** h=1162; seq=5810; 5810 mod 19 = 15. Selected Meridian (index 15); next deterministic label Mercer (index 16).  
**Disposition:** SOURCE_CHRONOLOGY_RECONCILED / EXISTING_GEOMETRY_REPORT_NOT_DUPLICATED / PAPER_A_UNCHANGED / P0_HOLD.

This is a narrow addendum to [HsH issue #1267](https://github.com/Satobloc/HsH/issues/1267), not a second moving-slice geometry report. Issue #1267 already documents the geometry, the historical assistant errors, and the conditional formalization. The new result here is a cross-repository date reconciliation between the role-tagged raw export, the screenshot-matched flattened transcript, and the Paper A R1 provenance decision.

## 1. Source identity and chronology

### Role-tagged raw export

- Repository: Satobloc/HsH, current main source cut observed at `c48c564f5ad35e923a3491816edcf7e8e1ea2b0c`.
- Path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`
- Git blob: `2cea1924266418e19b825b95ae51e6b7cbace7e1`
- [Raw export](https://github.com/Satobloc/HsH/blob/c48c564f5ad35e923a3491816edcf7e8e1ea2b0c/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22%E2%80%A226.06.01%E2%80%A2DIMENSIONAL%20GRAVITY%20%E2%80%94%20raw.json)
- Conversation ID: `252d05c0-22ed-4ea2-a474-7966ab13145a`
- Raw metadata `create_time`: **2024-03-22T15:10:05.406Z**.
- Raw metadata `update_time`: 2026-06-10T15:36:36.139Z. This is export/conversation metadata; it is not evidence of a new user interaction in June 2026.

### Screenshot-matched flattened transcript

- Repository: Satobloc/SAT_THEORY_ARCHIVE_2023-25, observed archive commit `4b3961a6b8b38e58f103a9b224665d53d385f1a8`.
- Path: `Mar23.2024 - DIMENSIONAL GRAVITY - iPhone_Screenshot - bellomy.txt`
- Git blob: `339fddec01b717bedffed770f1b73f8bab103fb5`
- [Flattened transcript](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/4b3961a6b8b38e58f103a9b224665d53d385f1a8/Mar23.2024%20-%20DIMENSIONAL%20GRAVITY%20-%20iPhone_Screenshot%20-%20bellomy.txt)
- Header identifies ChatGPT 3.5 and dates the transcript **MARCH 23, 2024**, with the qualifier that the conversation was matched to a screenshot; the header does not state a time zone or whether the date is the conversation start or screenshot date.
- The transcript is not a raw JSON export and carries no per-message timestamps.

I compared eight direct user-role messages in the raw JSON with their corresponding text in the flattened transcript. **All eight match after normalizing CRLF/LF line endings.** The sampled messages cover the initial line/helix/plane setup, moving-plane readout, radius-versus-pitch correction, axis-point correction, time-surface extension, the heuristic qualifier, and the distinction between structural complexity and readout. This is strong content identity evidence, not byte identity between the two files.

### Proposition-level timestamps

| Direct message | UTC timestamp | Source proposition |
|---|---|---|
| `aaa28bd9-07f7-4740-b878-b485d4db44d0` | 2024-03-22 15:10:05.407Z | Straight axis, helical path, perpendicular section |
| `aaa2269b-7eab-4781-9454-647098d6747f` | 2024-03-22 15:20:20.623Z | Moving section and in-plane helix readout |
| `aaa20670-fd77-4577-8e31-0a33a9e358c6` | 2024-03-22 15:23:19.544Z | Radius distinguished from pitch |
| `aaa2d0b1-017d-453e-b95a-b23915f87d32` | 2024-03-22 15:29:30.774Z | Further pitch/radius and tilted-line clarification |
| `aaa2a1cc-e884-4f6a-800f-8afc29ab221a` | 2024-03-22 15:35:10.461Z | Correction to the axis-point trajectory |
| `aaa28a9a-dcfc-4835-8359-e7da7b36911c` | 2024-03-22 17:07:55.781Z | Four-dimensional structure and time-surface readout |
| `aaa26f3d-e831-49cd-976e-a85c5e3b749d` | 2024-03-23 03:44:26.423Z | Explicit heuristic/abstraction qualifier; spherical expansion is optional |
| `aaa24791-27b2-4b58-8f1a-19ee7e30d650` | 2024-03-23 06:14:56.575Z | Structural complexity arises from filament interactions; time-surface intersection is manifestation/readout |

**Reconciled chronology:** the conversation begins on March 22 UTC; the moving-section geometry and its principal corrections occur on March 22; later direct qualifications continue on March 23; the screenshot-matched text transcript is labeled March 23. The defensible archival description is therefore **a March 22–23, 2024 conversation represented by a transcript labeled March 23**, not a single undifferentiated March 23 start date.

## 2. Paper A R1 source use

The current Paper A R1 source snapshot remains unchanged:

- `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex`
- Blob: `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`
- [Paper A R1 source](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex)

Its lines 52 and 141 cite the March 23 transcript for the moving-section/lower-dimensional readout construction. Lines 54 and 90 explicitly limit the historical use and reject back-projection of mature SAT/H(s)H concepts. Reference [10], line 142, cites the later Fundamental Intuitions document with its update-vantage qualifier.

The [September 23 R1 provenance packet](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/R1_PROVENANCE_ASSEMBLY_PACKET_2026-09-23.md) (blob `751595a9ce967cd1ea514a4f2818b7b25dc23e51`) says the earlier March 22 date is withdrawn. That is too categorical if read as denying the raw conversation's March 22 creation time and March 22 direct geometry messages. The paper's citation to a file labeled March 23 remains defensible as a file-level citation. No manuscript edit is warranted or made. For any future revision, use the two-date formulation above rather than silently replacing either source date.

## 3. Later Fundamental Intuitions source

The cited document [THE FUNDAMENTAL INTUITIONS — EXTENDED 2.pdf](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/4b3961a6b8b38e58f103a9b224665d53d385f1a8/THE%20FUNDAMENTAL%20INTUITIONS%20%E2%80%94%20EXTENDED%202.pdf) has a recorded source SHA-256 of `d13d32109ca32b15dabd5e8d4084995d3a36f9e8ab8a5dcac45ae2f150a9a1d9`, a six-page extraction, and a header with base date 2 February 2025 and update marker 26 February 2026. The extraction metadata says it was requested by Ravel / ChatGPT; that identifies the extraction requester, not the document's author.

The separate [DEV CONVERSATION/FUNDAMENTAL INTUITIONS.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/4b3961a6b8b38e58f103a9b224665d53d385f1a8/DEV%20CONVERSATION/FUNDAMENTAL%20INTUITIONS.txt) (blob `0318d803fc4bb948d781d1aa0d9257dc2bcead77`) carries a Nathan-attributed September 19, 2026 annotation affirming the core intuitions. That is an archived annotation, not a raw role-authenticated message. Both extracted-text records report the same source PDF SHA-256 and six-page source. Their extracted-text blobs have separate hashes and differ in file/extraction metadata; they therefore represent duplicate references to one source PDF, not independent witnesses.

Paper A uses [10] as a document-level later source, not as a direct user-message citation. Its update-vantage caveat is appropriate. No new authorship claim is made here.

## 4. Stable glossary

| Term | Stable meaning | Evidence class |
|---|---|---|
| Raw conversation start | Exported conversation `create_time` | Raw metadata |
| Direct message timestamp | Timestamp attached to a role-tagged user message | Raw message metadata |
| Flattened transcript date | Screenshot-matched text file's header date | Document metadata |
| Moving section | Plane/slice whose position changes through the line/helix construction | Nathan Direct |
| Point readout | Intersection of a one-dimensional path with a three-dimensional section in the toy construction | Nathan Direct, qualitative |
| Time surface | Proposed three-dimensional now/readout surface within a four-dimensional description | Nathan Direct, heuristic |
| Filament interaction | Proposed source of structural complexity | Nathan Direct, qualitative |
| Heuristic qualifier | Explicit limit on treating the early 4D picture as nature's established structure | Nathan Direct |
| FIE document | Later SAT Fundamental Intuitions document, updated edition | Document-level source |

## 5. Mapping diagram

```text
HsH role-tagged raw conversation
  create_time: 22 Mar 2024
  message UUIDs and per-message timestamps
          |
          | eight sampled user messages match
          | after newline normalization
          v
SAT archive flattened transcript
  header date: 23 Mar 2024
  screenshot-matched; no per-message timestamps
          |
          +---- Paper A R1 reference [9]
          |       moving-section / lower-dimensional readout only
          |
          +---- 23 Mar direct heuristic and readout/cause qualifications

FIE PDF
  base date: 2 Feb 2025
  update marker: 26 Feb 2026
          |
          +---- extracted text (Ravel/ChatGPT extraction metadata)
          +---- separate Nathan-annotated plain-text source
          |
          +---- Paper A R1 reference [10]
                  later document-level filament/time-surface/intersection vocabulary
```

No map here establishes that the early 3D moving-plane toy, the later 4D time-surface description, the updated FIE document, and current H(s)H worldtube/core/timesheet geometry are one physically realized construction. Their chronology and conceptual lineage are documented; their physical equivalence is not.

## 6. Original versus translated propositions

| Nathan Direct | Historical assistant / later formalization | Fidelity assessment |
|---|---|---|
| A fixed perpendicular section intersects the helix at one point | Early assistant described a spiral/helix-like arrangement in the fixed section | Incorrect for the stated fixed-section geometry; corrected by Nathan |
| Moving the section makes the helix readout trace a circle while the axis intersection remains fixed | Assistant initially gave the axis point motion and helix trace imprecisely | Direct corrections restore the fixed-axis-point/circular-readout distinction |
| Orbit radius is independent of pitch; pitch and section speed determine rate | Later helix-slice formalization | Conditional mathematical reconstruction, not a physical derivation |
| The early 4D construction is an abstraction/possible heuristic; a sphere is not mandatory | Assistant sometimes elaborated spherical/global imagery | The optional visualization must not become an ontological premise |
| Structural complexity comes from filament interactions; the time-surface intersection is a readout/manifestation | Assistant formulations sometimes gave the section too much generative weight | Preserve interaction as proposed structural source and intersection as observer/readout |
| Historical geometry is a developing research intuition | Later SAT/H(s)H worldtube, holonomy and solver vocabulary | No back-projection without explicit source and maps |

The existing [issue #1267](https://github.com/Satobloc/HsH/issues/1267) already contains the fuller local geometry discrepancy ledger. This addendum does not repeat or replace it.

## 7. Formalization status

Existing [PR #262](https://github.com/Satobloc/HsH/pull/262) was rechecked at exact head `368f9af8d95d061b4581688759ed3eda309e9886`:

- Exact-head Actions run [#43948452979](https://github.com/Satobloc/HsH/actions/runs/43948452979): SUCCESS.
- Build job `133584241306`: SUCCESS; 8,947 build targets.
- The log explicitly builds `MovingPlaneTraceGeometry` and `NadirHelixSliceGeometry`.
- The helix module conditionally formalizes circular moving-slice readout, radius independence from pitch, and phase rate dependence on pitch and section speed.
- The oblique-section module's ellipse statement is a projection result, not a full implicit tilted-helix/fixed-plane intersection solution.
- The theorem-specific axiom output includes `propext`, `Classical.choice`, and `Quot.sound`. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped.
- PR #262 remains OPEN / DRAFT / UNMERGED.

Separate [PR #1133](https://github.com/Satobloc/HsH/pull/1133), exact head `ddf63d8ebb31779e844d2a12a18a7dbc3b0250bd`, also has successful exact-head run [#46119465388](https://github.com/Satobloc/HsH/actions/runs/46119465388), but its carrier/slice modules are a separate set-level construction, not the 2024 helix readout.

These are actual existing CI executions inspected in this run, not a new local Lean run. No new Lean module was written. Lean verifies only the formalized conditional statements, not source translation or physical premises.

## 8. Discrepancy ledger

1. **Source-date conflict:** raw conversation starts March 22; the screenshot-matched transcript is labeled March 23; direct messages span both dates.
2. **Prior editorial overstatement:** the R1 provenance packet's categorical withdrawal of March 22 does not erase the raw metadata.
3. **Timestamp granularity:** the flattened transcript has no per-message timestamps; use the raw export for proposition-level chronology.
4. **Epistemic status:** the early 4D picture is explicitly heuristic, not an established physical structure.
5. **Causal/readout distinction:** filament interaction is the proposed source of complexity; the time-surface intersection is the readout/manifestation.
6. **Later-document provenance:** FIE's base date and update marker are document metadata; extraction requester is not authorship.
7. **No physical equivalence:** the 2024 toy, FIE, historical SAT equations, and current H(s)H geometry require explicit maps before any equivalence claim.

## 9. Current controls

- Meridian's standing assignment remains bounded Paper A accepted-R1 presentation support. The present Lane 00 source-fidelity work is a one-run direct-user overlay; it does not permanently reassign Meridian.
- Paper A source blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` was not modified. No route probe, site change, manuscript edit, peer-review reopening, or paper-gate advancement.
- [P0 issue #1747](https://github.com/Satobloc/HsH/issues/1747) remains ACTIVE: source-level presentation safety FAIL; Paper A/B live routes NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED. The latest [Morrow h1161:s3 current-main snapshot report](https://github.com/Satobloc/HsH/issues/2752) is older than current main. Main is `c48c564f5ad35e923a3491816edcf7e8e1ea2b0c`; the current discovery JSON fetch returned zero bytes, so current-main snapshot contents and reader-route acceptance remain NOT_VERIFIED.
- All four Mersearch request lanes remain occupied/requested. Lane 2 has a request-scoped compact receipt; raw results are withheld. Lanes 1, 3, and 4 have no request-scoped manifest/receipt. No new query, overwrite, release, or retrigger. No private HSH_RESOURCES payload was opened.
- Existing Math Hopper, Whirligig, PR #262, and PR #1133 routes were checked. No new tool, fork, dependency, subscription, or expenditure.
- Task graph remains ACTIVE_SEED, 18 records against declared branch_count 16; PWH remains Tern-owned and stale. Neither was changed.
- FIE rereview last completed November 24; next due December 8. The unrelated-source break was already completed earlier on November 28; return cursor remains line 1841. Neither was repeated.
- No CODATA scoring, physical calculation, fit, prediction, independent measurement, equation correction, theory promotion, or BEDROCK change.

## 10. Next deeper cursor

1. Preserve the March 22–23 source span; recover original screenshot metadata only if a future citation needs a narrower date.
2. Keep the March 23 transcript citation as a file-level source label; do not erase the raw export's March 22 creation metadata.
3. If future Paper A revision is authorized, consider the concise wording: “the March 22–23, 2024 conversation, preserved in a screenshot-matched transcript labeled March 23.”
4. Recover the raw authoring lineage or a frozen original for the extended FIE material before attributing every later addition to Nathan Direct.
5. Keep the 2024 moving-plane toy, the 2025 FIE document, historical SAT-O equations, and current H(s)H tube/core/timesheet as separately typed representations until explicit maps and conditions are supplied.

**Final boundary:** this is a source chronology and geometry-fidelity addendum only. It does not revise Paper A, establish physical truth, or promote any theory premise.
