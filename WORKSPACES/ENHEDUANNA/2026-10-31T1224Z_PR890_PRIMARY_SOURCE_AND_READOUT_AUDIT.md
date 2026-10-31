# Enheduanna :24 | PR #890 primary-source and typed-readout audit

**Nominal UTC:** 2026-10-31T12:24Z  
**Run key:** `REVROT3-19-20261011:492:s2`  
**Participation:** `CURRENT_ASSISTANT_SOURCE_GROUNDED_RECONSTRUCTION`  
**Disposition:** `PRIMARY_SOURCE_LOCATOR_CORRECTED / READOUT_ENUM_GAP_IDENTIFIED / EXACT_HEAD_LEAN_BUILD_VERIFIED / NO_RESEARCH_BRANCH_MUTATION`

## 1. Rotation and identity

- h=492, s=2.
- seq=5h+s=2462.
- 2462 mod 19 = 11: Enheduanna.
- Next index = 12: Tern Rook.
- Next run key: `REVROT3-19-20261011:492:s3`.

Selection is deterministic routing, not authentication of a historical ChatGPT instance. No usable current Enheduanna worker thread was authenticated. No standalone Enheduanna ROLE_CHARTER.md or README was found at the checked paths. The recovered specialist remit comes from the source-layer census/exposure-boundary document, Page One genealogy, CDLI accession-boundary report, prior receipts and the existing Enheduanna PR/workspace. This run is source-grounded reconstruction, not historical-worker participation.

## 2. Controls and current state

Read/rechecked:

- BEDROCK blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c` (568-line current file; same live blob as the prior full read).
- Steering Charter 2026-10-26 blob `5f4263381afcb065e9062d5b5885593d0baa58db`.
- Three Paper Campaign blob `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`.
- Onboarding blob `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0`.
- Revival Rotation V3 blob `90863a2a2b82b2d8e37ba1bd9f796389066f5409`.
- Workflow Branching Map blob `756c506780072591b2f48e22044f3368a57bfa7d`.
- Code Grurple roster, Active Automation Roster, Scheduler Authority and Mersearch Worker Start Here.
- Enheduanna source-layer census blob `8d6b08dac9e169f529f1b43cbd8c3cbf0cc78478`.
- Enheduanna Page One genealogy blob `cc49b340648cc3085d910fc476d22cba02dff590`.
- Enheduanna CDLI O accession-boundary report blob `a62f939d53a8e8e78258551c8fd99416d352a198`.
- Latest Enheduanna :36 report/receipt and Nadir's optional next-appearance carry-forward.
- Latest Tern :48 receipt, handoff, continuity and inbox.

The existing :24 automation was independently peeked as enabled with its exact existing hourly phase. No task, ID, title, prompt, enabled-state, schedule or phase mutation; no sixth task.

Default branch at the latest pre-write read was `main`, HEAD `a012281a2d0a2527564361fdbd090b8c85a1e012` (Elias Track A receipt, 2026-10-31T12:26:56Z). No Enheduanna research branch was changed.

## 3. PR #890 state and actual Lean result

Existing PR: https://github.com/Satobloc/HsH/pull/890

- Title: `[DRAFT] Enheduanna: third physical CDLI witness and four readout classes`.
- State: OPEN / DRAFT / UNMERGED.
- Branch: `research/enheduanna-third-physical-witness-du8-20261028t1212z`.
- PR head: `7e75fb3ee6a36fb6bf4e92654481724e27e58be8`.
- Base recorded by PR: `b3304b14b184baaace679bf5681f89f8132e7138`.
- Test merge commit: `6fc6a054f766d450b8a299d12b6c0112c1e89513`.
- Exact-head/PR merge build: Actions run #41012299180, job #123921022277.
- Lean 4.34.0 / Lake 5.0.0.
- Build completed successfully; 8,952 build jobs.
- 95 theorem-specific axiom outputs: 61 report no axioms; 34 report standard dependencies.
- `sorryAx` occurrences in the complete retrieved job log: 0.
- Separate tests, lint, nanoda and automated axiom-audit stages were skipped.

This is actual compilation of the formalized statements, not source authentication or proof of ancient authorship. The PR description still says “compilation pending”; that description is stale relative to the successful run. It was not edited.

## 4. Primary-source correction: Black 2002 locator

Primary PDF: https://sepoa.fr/wp/wp-content/uploads/2012/05/2002-1.pdf

The PDF's own header identifies **N.A.B.U. 2002, N°1 (March)**. Under the section **NOTES BRÈVES**, the Black contribution is numbered **4)** and occupies printed pages 2-4.

Correct citation:

> Jeremy A. Black, “En-hedu-ana not the composer of The temple hymns,” N.A.B.U. 2002, no. 1 (March), item 4, pp. 2-4.

The issue number `2002/1` is correct. The current PR branch's phrase `note 4` is not the PDF's locator: it confuses the numbered contribution in NOTES BRÈVES with a footnote. The following existing source files retain that wording:

- `EnheduannaBlack2002Witness.lean`
- `EnheduannaBlack2002Inference.lean`
- `black2002_witness_order_audit_20261029.py`

No source/code edit was made. This is a bibliographic correction, not a change to Black's substantive witness transcription.

Black's printed p. 4 reports:
- A: 16 lines (or 15 if damaged lines 532-533 are joined), count 15.
- B: 13 lines, count 13, then lines 543-544 added after the count.
- O: approximately 15 lines; count not preserved; line 22 damaged.
- Q: 16 lines, count 14, with rulings after lines 541 and 544.

Helle 2020, *The First Authors*, Appendix 3.1, pp. 326-328, reports A and Q before the count, B after, O's count missing, and Q's attribution bracketed by rulings not reported for the other manuscripts. Helle explicitly warns that Black's inference from O is underdetermined because O's count is absent and notes that the four manuscripts differ in their line counts.

The existing Black/Helle missingness encoding is broadly source-faithful on this bounded record: A/Q = before, B = after, O = unresolved. The code does not turn O's missing count into a positive placement.

## 5. Formal source-encoding gap: the Exaltation terminal variants

Primary 2022 annotated edition: https://enheduana.org/wp-content/uploads/2022/07/exaltation_of_inana-2022.pdf

At line 138, Helle reports four manuscript readings:
- 4 `du11` (speak/sing)
- 3 `du3` (create)
- 1 `du2` (give birth; printed transliteration `du2-ud`)
- 1 `du8` (release)

The source total is 9.

In `EnheduannaCDLIThirdWitness.lean`, the current type is:

`TerminalReadout = du11 | du2ud | du8 | unpreserved`

This has three positive variant constructors and one missingness state. It omits `du3`. The separate `helleReportedCounts = [4, 3, 1, 1]` is an unlabelled list. The theorem `helle_reports_nine_readings` verifies only the sum, not the mapping of each count to a reading class.

This is not a Lean compilation failure. It is a source-to-formalization completeness gap relative to the PR's “four readout classes” description.

A corrected typed representation should separate:
1. `TerminalVariant`: `du11 | du3 | du2ud | du8`.
2. Evidence/preservation status: an attested variant versus unpreserved/lacuna.
3. Helle's distribution as typed pairs, e.g. `(du11,4), (du3,3), (du2ud,1), (du8,1)`.
4. Editorial-surface mapping to `Option TerminalVariant`, so the P346195 terminal lacuna is not misclassified as a reading.

No new Lean code was written or compiled. This is the next proof target, pending authorization to resume ordinary branch work and an exact-head Lean run after correction.

## 6. Composition boundary: keep the two Enheduanna works distinct

The PR currently combines two source tracks in one draft branch:

**The Exaltation of Inana / Ninmešarra**
- CDLI P346194 (UET 6, 109): two reported self-name loci.
- CDLI P346195 (UET 6, 110): terminal lacuna at the relevant line.
- CDLI P464307 (UET 6, 107b): additional self-name locus at obverse column 2, line 27; separate reverse column 2, line 3' reading `ma#?-ra-du8`.
- CDLI composite Q000623: composite line 139 `ma-ra-du11`.
- Helle 2022: line 138 `ma-ra-du2-ud` and the 4/3/1/1 variant counts.

The bounded claim “three name loci across two distinct physical tablets” is consistent with the listed loci. It is not three independent authorship attestations. The `ma#?-ra-du8` line is a separate terminal-variant locus, not the self-name locus.

**The Temple Hymns**
- Black 2002 item 4.
- Sjöberg and Bergmann's TCS 3 edition.
- Oxford ETCSL Temple Hymns bibliography and its derivative/editorial sources.
- Helle 2020 Appendix 3.1.
- The A/B/O/Q line-count and placement dispute concerning hymn 42.

These are different compositions and different witness families. The current PR has separate namespaces/modules for much of this material, but the source graph should make the composition key explicit. No source ancestry edge from the Temple Hymns witnesses to the Exaltation witnesses is established here.

## 7. Mersearch and tool boundaries

The completed Enheduanna Page One request was read from its request-scoped manifest and compact receipt:

- Request: `enheduanna-page-one-origin-20261031-0100`.
- Three roots checked: SAT_THEORY_ARCHIVE_2023-25, HsH and HSH_RESOURCES.
- 15,780 files; 20,828,714 records; 1,585 hits; 298 distinct source paths.
- Raw search results remain withheld. The compact receipt is bounded navigation evidence, not exhaustive source excerpts or source authority.

All four live Mersearch request files were inspected. Lane 3 currently contains Aldus's O9/Blockwave genealogy request; no lane was overwritten or resubmitted. No new Mersearch request was started.

No new tool, package, branch or PR was created. Existing Lean/Mathlib and PR #890 were reused. No physical calculation, CODATA comparison, H(s)H prediction, worldtube equivalence or data-free calculation was made.

## 8. Gates and next cursor

- Code Grurple remains ACTIVE. No manuscript, reader, site, paper gate, BEDROCK or theory status changed.
- P1 November 9, P2 November 30, P3 December 14 remain separate and unchanged.
- No public issue/comment was created. This is an internal source audit of a draft research PR, not an approved paper result; no publisher bypass was used.
- FIE rereview is not due (last full review October 27).
- Unrelated reading was not repeated: Tern's 08:48 receipt records Jacoby, *Astronomer Talks*, lines 413-472; next cursor 473.
- Best Enheduanna research cursor: correct the Black 2002 locator and type the four Exaltation terminal variants separately from missingness, then run exact-head Lean. Keep the Temple Hymns and Exaltation source families disjoint.
- Next ring label: Tern Rook, index 12. Tern's Comptroller/scheduler remit is preserved; this handoff is optional context only, not an Enheduanna assignment.

**No PR code change, no new proof, no public publication, no theory promotion.**
