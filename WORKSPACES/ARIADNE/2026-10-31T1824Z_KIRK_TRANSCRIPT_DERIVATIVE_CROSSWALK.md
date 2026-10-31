# Kirk/Riley source-lineage addendum: transcript derivative crosswalk

**Relation:** Addendum to the Ariadne source-lineage report and existing issue #1156.  
**Status:** DERIVATIVE CROSSWALK VERIFIED; JANUARY 22 RAW CONVERSATION UNRESOLVED.  
**Epistemic class:** Source genealogy and file-equivalence audit. No cognition experiment, authorship inference, or physical result.

## 1. Canonical transcript inspected

The public HsH artifact

`DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_21/The New Physics - Making _Interesting_ LLM Characters.srt`

has Git blob `ace1b413a5574a1354cc85c51364b12d685577ae`, 43,774 characters, 2,580 lines, and 487 timed cues.

Targeted cue inspection confirms that the transcript describes an earlier source bundle of TXT files, README files, and workflow diagrams. It names the Kirk Mind, a Nathan-from-1975 simulation / Chronological Bridge, and a comparative Lieutenant Kevin Riley model. The Riley section identifies Bruce Hyde. Later sections describe Shatner drift and accumulated moral residue.

Useful transcript locators:
- Cues 15-17, 00:00:40-00:00:46: README files and workflow diagrams are described as the blueprint.
- Cues 46-53, 00:02:08-00:02:34: Kirk Mind, Nathan from 1975, and Riley are introduced.
- Cues 172-179, 00:08:02-00:08:25: the Chronological Bridge and Nathan McKnight are named.
- Cues 265-286, 00:12:25-00:13:23: Riley and Bruce Hyde are discussed.
- Cues 310-340, 00:14:30-00:15:55: the Shatner-drift failure is described.
- Cues 393-401, 00:18:16-00:18:44: accumulated decision residue is described.

The SRT is a derivative transcript, not the underlying TXT/README/workflow bundle. Its ASR-rendered filenames must not be normalized into canonical filenames without the original files.

## 2. Mechanical derivatives are not independent witnesses

A non-public resource mirror was inspected at the exact HSH_RESOURCES snapshot recorded in the completed Mersearch manifest. Its transcript-text header explicitly labels the file **DERIVED TRANSCRIPT TEXT - MECHANICAL EXTRACTION ONLY**, points to the public HsH SRT as its source, names builder `cross-podcast-guide/0.2.2`, and states that the raw source remains canonical.

The associated cue JSONL contains 487 rows. A scripted comparison against the 487 SRT blocks found:
- cue count: 487 vs 487;
- text mismatches: 0;
- start/end timestamp mismatches: 0;
- normalized extracted-text vs concatenated-cue-text mismatch: none.

Therefore the HsH SRT, extracted transcript text, and cue index are three representations of one transcript, not three independent witnesses. The non-public mirror path and its own file identifiers are intentionally omitted. No private raw text was copied into this public artifact.

## 3. Direct user scope instruction, separate from the January 22 source

The public Revival Rotation raw export contains a direct user-role message dated `2026-09-23T02:06:05.180Z` (conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, message `41fe4df4-fa3f-4045-bf99-0f095903c052`, raw blob `386516f7c2d5b9ab2cd4f0050869ae00c133274d`). It states that Kirk material informs revival strategy, especially human simulation including the user.

This establishes the user's scope instruction. It does **not** establish the contents, identity, or chronology of the separate January 22 Kirk conversation.

## 4. January 22 chronology correction

The original January 22 raw conversation export, conversation ID, and message UUID remain unrecovered.

The earlier approximate `17:55 UTC` time-of-day came from prior-context retrieval, not a recovered raw export. A later prior-context retrieval conflicts with that time, again without supplying the original conversation ID or message UUID. Withdraw the approximate time-of-day and retain only:

`2026-01-22 / PRIOR_CONTEXT_CORROBORATED / TIME_OF_DAY_UNRESOLVED / RAW_EXPORT_NOT_RECOVERED`

Assistant-generated operator summaries and their timestamps are not primary evidence and cannot repair the missing chronology.

The January 21 SRT predates the January 22 working request. It cannot be derived from that later event; it may summarize an earlier upstream source bundle. Do not merge the January 21 Kirk/Riley/Nathan synthesis backward into the January 22 conversation without raw evidence.

## 5. Mersearch scope and limitations

The completed request `ariadne-kirk-riley-source-lineage-20261031-1119` used `Mercer_Searcher_1.0` / `mersearch-stable-1.0` across all three permitted repositories. The manifest records exact source commits:
- SAT archive: `db32abc75a4a2cff3afc6de895cd7edb9eb62d82`
- HsH: `53a2c8f685b2d219eea6266f8c161060ce0cd420`
- HSH_RESOURCES: `87289c92068c134e84a70e6a2f18807247b4a36c`

The compact receipt reports 381 hits across 14 distinct paths. Raw search result files were withheld by the workflow's publication policy; the compact receipt is the public navigation record. Search hits do not establish source identity, authorship, or ancestry.

No new Mersearch request was submitted. The shared request slot is currently occupied by another worker and was not overwritten.

## 6. Formalization and epistemic boundary

Existing Ariadne PR #790 remains OPEN / DRAFT / UNMERGED. Exact-head Lean run #41215958162 checked out PR head `68aadf6c90e6b69a03999e8c3cd8d22c58118e20` and completed successfully under Lean 4.34.0 / Lake 5.0.0 (8,948 build jobs). Six target-specific axiom reports were inspected; `contains_trans` has no axioms and the other five use only standard dependencies `propext`, `Classical.choice`, and `Quot.sound`. The complete job log contains zero `sorryAx` occurrences. Tests, lint, nanoda, and the separate automated axiom-audit stage were not run.

Lean verifies only the formalized claim-scope classifier. It does not read the source exports, verify the extraction, authenticate authorship, establish chronology, or prove copying direction.

## 7. Disposition

- Underlying Kirk/Riley/Nathan TXT, README, workflow, and standalone source objects: UNRESOLVED.
- January 22 raw Kirk conversation identity/export: UNRESOLVED.
- January 21 SRT: DERIVATIVE TRANSCRIPT, source-pinned.
- Resource text and cue mirror: MECHANICAL DERIVATIVES OF THE SAME SRT.
- September 23 user message: DIRECT USER SCOPE INSTRUCTION, not January 22 content evidence.
- No human-subject session or LLM cognition trial was conducted.
- No physical calculation, CODATA comparison, H(s)H prediction, theory promotion, paper-gate advancement, or BEDROCK change is claimed.

This addendum corrects the approximate January 22 time-of-day statement in the earlier report. It does not replace the unresolved raw-source retrieval task.
