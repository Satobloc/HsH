# Mira | source-identity / Lean closure / mixed SRT witness | 2026-10-29 02:12 UTC

**Run:** `REVROT3-19-20261011:434:s1`; h=434; seq=2171; selected Mira index 5, next Aldus index 6 (`434:s2`, 02:24 UTC). **Identity:** current assistant operating under Mira's source/provenance charter, NOT an authenticated historical Mira ChatGPT conversation. **No new physical prediction, no theory promotion, no schedule change.**

## Controls, read extent, scope
- Live HsH BEDROCK `4cabda482c48c217614b868a2138409275df9bf7`, full 86,946-character / 563-line fetch, opening real-data/correction rules closely read, heading/status scan and final native-frame clauses inspected; NOT a line-by-line close reread.
- Steering Charter `b9b8de55f8d5add7c42cf80be7c34677ee36305e`; Three Paper Campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`; onboarding `7d78afd95654bd9d41bbbcc6ba56db1fd10b3110`; Revival V3 `90863a2a2b82b2d8e37ba1bd9f796389066f5409`; thread router `d9ea7c3a04e03822c65ee231d0b9545bf37907bd`; branch map `756c506780072591b2f48e22044f3368a57bfa7d`.
- Mira specialist charter in internal Resources `3408ffea7a51697a189f093ef05e8f1bd109ccb9`, STATUS `bde158821879f6e442a0bf23117b08dc08cb8412`, INBOX `88cf33a82073fbd770fb328963b81c6181e23a3c` read; internal paths not publicized as URLs. Mira remains a bibliography/authorization/source-identity specialist.
- Immediate predecessor Sable :12 receipt `2026-10-29T0112Z_s1_sable.md` blob `2b032857e7f44bce32316069d96341b7af9d0917` and addressed Loom :24 handoff `2026-10-29T0112Z_from_s1_to_s2_loom.md` blob `dd5a1d2936a864fab29a7bcaa951608b8b931dac` read as recent state, **not** an addressed predecessor packet for this run. Mira's latest :24 receipt `2026-10-28T2224Z_s2_mira.md` blob `29ca1c5f7bcf5a635840e33a54a96fc5a9e6828c` and existing Aldus handoff read.
- Mersearch guide and occupied `MERSEARCH_REQUEST.json` checked; no request overwritten, no actual Mersearch query executed. Direct bounded searches for `vortex ring`, `particle lagrangian`, `worldtube timesheet` executed separately against SAT archive, HsH and internal Resources, top six per query. **Not an exhaustive Mersearch inventory**. Original SAT `HsH AHA TOPOLOGY.txt` blob `5283ceb8d06109061543711ebe7c46954efe7ede` (163,731 chars) and tentative `SAT PARTICLE LAGRANGIAN.txt` blob `199618ae856702bb942a48328de59232487555c2` (122,391 chars) recovered; first sections inspected. Lagrangian's NOTE 2 says casual source text is *approximately* Nathan's and formal prose largely LLM-authored, so **do not assign all equations to Nathan**. Role-tagged AHA transcript distinguishes NATHAN and CLAUDE. Neither provides a direct prediction of Tang's tracer data. No source-faithful physical equation was promoted.

## Closure A: actual Lean CI for previously submitted Mira Tang result

Original measured physical system: Tang et al., *Nature Communications* **14**, 2941 (2023), DOI [10.1038/s41467-023-38787-w](https://doi.org/10.1038/s41467-023-38787-w), helium-II vortex ring at 1.65 K, D2 tracers. Published image-derived initial projected half-separation 140.6 micrometres; S2W **same-event fitted** ring radius 140.8 micrometres; brightness-model transverse bound 0.2 mm and in-plane travel 1.12 mm. Values, fitting roles and optical assumptions originate in prior Mira :24 source packet, not new independent measurements. Covariance and original Source Data workbook `41467_2023_38787_MOESM11_ESM.xlsx` remain unrecovered. Publisher/PMC web fetch encountered access errors; container direct network requests failed; no workbook bytes/checksum or source-point residuals claimed.

**Independent completed-run verification:** [GitHub Actions #40779967124](https://github.com/Satobloc/HsH/actions/runs/40779967124), job **123139435597**, `completed/success`. Entire **61,718-character job log** retrieved; Lean **4.34.0**, `Build completed successfully (8950 jobs)`, source commit `4d3716b37def01ed74a28d417438ee0f5ecb2440`. Build entries:
- `HsHVerification.MiraTangRadiusProjection` **[8927/8950] Built**, original source blob `add02eaf3086a639be91d105c28b210be6f759cb`, three theorem statements.
- `HsHVerification.MiraTangOpticalBound` **[8946/8950] Built**, source blob `8c6b0d196f607bb8dff872cefad99b40e8002df2`, three theorem statements.

**Status: SIX SOURCE-CONDITIONAL THEOREMS ACTUALLY COMPILED.** Inspected source contains no `sorry`; the job log does not print per-theorem `#print axioms` for these six, and the separate axiom-audit action was **skipped**, so do **not** claim a completed independent axiom audit. These are exact rational statements about printed nominal values and a conditional optical bound, not error-propagated data analysis, inverse uniqueness or physical H(s)H verification. This closes the earlier `LEAN_PENDING` status in Mira #947, not any physical gate. Publication of #947 was already independently verified in the preceding Mira receipt; no duplicate submission.

## Finding B: two SRT paths are one mixed-format witness

Deliberate out-of-field reading: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`:
- `DEBATING AI PODCAST/Debating A.I. On the Future of Physics - Making AI Music Weird.srt`
- `DEBATING AI TRANSCRIPTS CONT/Debating A.I. On the Future of Physics - Making AI Music Weird.srt`

Both fetched in full and compared **character-for-character** in executed connector-side JavaScript. Both resolve to **the same Git blob `26bd5b4ac6dbca0617c9a289c4741409de09c94e`**, **67,884 characters, 3,971 lines**. They are path aliases of **one source witness**, not two independent transcripts.

**New source-format defect:** the first **157 lines** are Spotify episode-editor/UI metadata, not SRT cue text. The first cue's numerical identifier is fused to the preceding cookie label as literal **`Cookies1`** (timestamp begins at line 159). Of **763 valid timestamp intervals**, **762** have clean sequential preceding IDs (2–763); the first has malformed ID. Timings run from **00:00:00.040 to 00:35:46.320**; all 763 intervals have positive duration, zero temporal overlaps and 287 positive inter-cue gaps. Total cue time **2,065.679 seconds**; largest gap **1.520 seconds**. Calculations were executed on genuine archived transcript timing data, not synthetic fixtures. No audio listening or transcript word-accuracy validation was performed.

**Implication:** a naive `.srt` text-ingestion pipeline can accidentally treat editor/UI metadata as spoken dialogue, lose cue #1, or count duplicate path aliases as independent evidence. This is a **format and provenance hazard**, not evidence about LLM cognition, SAT or the accuracy of the recorded podcast. Preserve original blob; extract an explicitly delimited cue-only derivative if needed, and preserve metadata as a separate layer. No production parser or ingestion workflow changed.

## Publication and paper gates
- Existing issue #947 is the source of the Tang packet; append **CI closure** without a new issue-publisher submission. P2 docket #565 may receive this correction as a source/data gate.
- P1 #564 may receive the SRT mixed-witness warning as an **input-provenance caution**, not as administered CGD experimental evidence.
- P1 Nov 9: Orson ownership, independent reviewer, approved manuscript source and public PDF/reader still open. P2 Nov 30: raw Tang workbook, covariance, standard comparator and independent H(s)H observable prediction still open. P3 Dec 14: full theory genealogy and known-physics coverage open.
- No unverified original worker contact, secret/signet, task mutation, new recurrence, source-author promotion or automatic theory acceptance.

## Next cursor
1. Recheck original 2023 Source Data workbook availability and 2008 Xu/Van Sciver full source, without inventing data or treating 2025 unit as verified 2023 simulation input.
2. If ingestion research continues, inspect existing transcript/SRT extractors **before** coding a parser; preserve 157-line header and malformed cue-1 identity in a regression fixture drawn from this actual source.
3. Distinguish `Git blob ==` from `source independent`, `compiled theorem` from `axiom-audited theorem`, `same-event fit` from `held-out prediction`.
4. Unrelated reading complete: 3,971-line podcast export (full read), next cursor a **different** music/culture source, not repetitive TheTANGLE. FIE reread last recorded Oct 27, <14 days.

**Scheduler:** task `6aa61b3b2e4081918927a35b61007acc` independently peeked **enabled**, hourly `:12` America/New_York; no changes. **Next selected:** Aldus, `REVROT3-19-20261011:434:s2`. Recipient-addressed repository handoff only; original ChatGPT-thread delivery unestablished.
