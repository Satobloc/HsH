# Loom additive correction overlay | 2026-10-27T11:24Z

Status: SOURCE-VERIFIED IN PLAINTEXT / RAW-UUID-UNAVAILABLE / NOT CANONICAL REWRITE.
Actor: current source-grounded assistant selected under Loom charter, not authenticated historical Loom.

## Primary-source anchors
Repository: Satobloc/SAT_THEORY_ARCHIVE_2023-25
Path: FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/MIX TAPES.txt
Git blob: 9be7a256d08fcb1aacf3e77b807db0e9555681c4
Read extent: full 762 lines; 23 explicit user and 23 explicit assistant turn markers.

- Line 85: ASSISTANT-SUGGESTION / BAROQUE-ENGLISH / FIRST-IN-THIS-FILE.
- Line 93: USER-ENDORSEMENT / SAME-NORMALIZED-TERM / NOT-USER-COINAGE-EVIDENCE. Original surface has lower-case initial 'b', unlike assistant line 85. Preserve both verbatim surfaces and an explicit case-folded index key.
- Line 154: ASSISTANT-RETROACTIVE-COINAGE-ATTRIBUTION / UNVERIFIED.
- Lines 187-188: ASSISTANT-RETROACTIVE-SUGGESTION-ATTRIBUTION / UNVERIFIED.
- Lines 695-696: USER-RECOLLECTION / VEHICLE-MODEL-YEAR-1978 / EVENT-DATE-UNSTATED.

## Existing regenerated derivative
Repository: Satobloc/HsH
Path: DEVELOPMENT_FULL_CONVOS/CONVOS_23/memoir_bits_tagged_regenerated.csv
Git blob: aecb6a811ab56e21880de471e69770643805a410
Quote-aware parsed data records: 1,013.

- M00616: ADD SOURCE_SPEAKER=ASSISTANT (from plaintext label); SOURCE_ORIGINAL_PROPOSAL=LINE85; DERIVATIVE_SOURCE_LINE=187; preserve existing Low confidence.
- M00445: ADD YEAR_FIELD_CLASS=VEHICLE_MODEL_YEAR; EVENT_DATE=UNATTESTED; derived via INDEX_ROUGH.txt:90.
- M00844: ADD YEAR_FIELD_CLASS=VEHICLE_MODEL_YEAR; EVENT_DATE=UNATTESTED; derived via TIMELINE_ROUGH.txt:55.
- The latter two derivative rows are not independent event-date evidence.

Do not delete prior tags or edit original CSV without review. Speaker labels are export metadata; raw JSON UUIDs and exact source timestamp remain unresolved.


## Full regenerated-CSV field coverage (independent second parse)
- Source_Authorship populated: 0 / 1,013 records.
- Verified_Real_Event populated: 0 / 1,013.
- Event_Date_Corrected populated: 0 / 1,013.
- User_Corrections populated: 0 / 1,013.
- Date_BestGuess populated: 44 / 1,013; all 44 Date_Type values are "year mentioned (unverified)".
- The 44 date-bearing rows comprise Meta / index 14; Fiction / reference 14; Memoir candidate / derived 10; Mixed chat / review 5; Memoir candidate 1.
These are observed metadata coverage counts, NOT a claim that all 1,013 records are wrong or that every one requires a date. Never turn unverified mentioned years into event dates without original-source review. Prior Loom 2026-10-26 :12 and Aster PR #626 already address a related year-role-erasure problem in a different source.


## Raw JSON recovery check (negative, source-typed)
Library exact-phrase search found Storytelling Voice Analysis — raw.json, Library ID file_00000000486081fda085cbc7191cc121. The matching source is inside an embedded file-search result (rendered JSON lines 393 and 538): metadata.type=file, name=MIX TAPES.txt, source=my_files, attached file ID file-2hJKRkuKT9a3ZGRCorCvEZ. This is DERIVATIVE-RETRIEVAL, not the originating conversation's raw speaker/message tree. Original turn UUIDs/create_time remain NOT_RECOVERED. Do not treat the attached file ID as a message UUID or independent speaker authentication.

## Formalization
Draft PR #730: FORMAL_VERIFICATION/HsHVerification/ArchiveSpeakerYearGate.lean, Git blob 4728cd171fe75f7bf9c79a88cb08412561ade28a. Seven conditional Lean obligations. Proof status is determined only by latest CI run 40496151373 (previous 40495826160 superseded) and its actual compiler log. Formal proof cannot establish physical events, human authorship or the actual event calendar year.

No physics calculation, CODATA comparison, BEDROCK promotion or conversation rename.
