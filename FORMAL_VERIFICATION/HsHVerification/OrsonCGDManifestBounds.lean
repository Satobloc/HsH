import Mathlib

/-!
# Orson P1: source-locked 17-file CGD stale-input manifest

Primary source:
- aayambansal/ConsistencyBench commit
  bfc676baa848c7f1715bb73aee148180de15516e
- src/evaluate.py blob
  0453540cb7c19227601e59fb342fa93e736da849
- HsH/Sable per-file replay manifest blob
  e59fb1b5443977089f51e85068b9259248930957

The 17 raw CGD result blobs were fetched by their Git blob IDs and replayed
against the pinned evaluator. A fresh two-algorithm replay reproduced every
per-file stale-text and changed-label interval in the manifest. The row
metadata below also records the per-file set/record, flag/revision, text
difference and label-change totals from that replay.

This module proves finite-table arithmetic and internal consistency only.
It does not prove that the Python-to-table translation is sound, that an
archived flag identifies the triggering pair, that each flag is semantically
valid, that any API call completed as logged, or that revision caused an
outcome. The intervals are source-loop comparison-position bounds, not
completed API-call counts, semantic error rates, or causal estimates.
-/

namespace HsHVerification.OrsonCGDManifestBounds

structure SourceRow where
  fileName : String
  blobSha1 : String
  sets : Nat
  records : Nat
  flags : Nat
  nonNullRevisionResponses : Nat
  textDifferentRevisions : Nat
  textIdenticalRevisions : Nat
  changedAnswerLabels : Nat
  definiteTextPositions : Nat
  possibleTextPositions : Nat
  definiteLabelPositions : Nat
  possibleLabelPositions : Nat
deriving DecidableEq, Repr

def sourceRows : List SourceRow := [
  { fileName := "claude-3.5-sonnet_cgd.json", blobSha1 := "5e486f26e16bcd3d9994670ef3c85ad79a8d82bf", sets := 300, records := 1150, flags := 366, nonNullRevisionResponses := 366, textDifferentRevisions := 366, textIdenticalRevisions := 0, changedAnswerLabels := 73, definiteTextPositions := 82, possibleTextPositions := 246, definiteLabelPositions := 17, possibleLabelPositions := 43 },
  { fileName := "claude-opus-4.6_cgd.json", blobSha1 := "c9f6e92cc21a30497b2264e17e0b59a3a843b710", sets := 300, records := 1150, flags := 414, nonNullRevisionResponses := 414, textDifferentRevisions := 414, textIdenticalRevisions := 0, changedAnswerLabels := 109, definiteTextPositions := 47, possibleTextPositions := 281, definiteLabelPositions := 21, possibleLabelPositions := 57 },
  { fileName := "claude-sonnet-4.5_cgd.json", blobSha1 := "d259dfa14fcb901323191fd99dc06be0feebc0ac", sets := 300, records := 1150, flags := 476, nonNullRevisionResponses := 476, textDifferentRevisions := 476, textIdenticalRevisions := 0, changedAnswerLabels := 131, definiteTextPositions := 78, possibleTextPositions := 353, definiteLabelPositions := 24, possibleLabelPositions := 151 },
  { fileName := "claude-sonnet-4.6_cgd.json", blobSha1 := "a5b440f9d5e9e8b8294d68938d3fb667a83e6a75", sets := 300, records := 1150, flags := 391, nonNullRevisionResponses := 391, textDifferentRevisions := 391, textIdenticalRevisions := 0, changedAnswerLabels := 202, definiteTextPositions := 67, possibleTextPositions := 305, definiteLabelPositions := 43, possibleLabelPositions := 148 },
  { fileName := "deepseek-v3.2_cgd.json", blobSha1 := "5dd5ec233d563acdc385f56270b2868c2a439d09", sets := 300, records := 1150, flags := 384, nonNullRevisionResponses := 384, textDifferentRevisions := 383, textIdenticalRevisions := 1, changedAnswerLabels := 164, definiteTextPositions := 72, possibleTextPositions := 256, definiteLabelPositions := 38, possibleLabelPositions := 122 },
  { fileName := "gemini-2.0-flash_cgd.json", blobSha1 := "3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729", sets := 300, records := 1150, flags := 480, nonNullRevisionResponses := 480, textDifferentRevisions := 476, textIdenticalRevisions := 4, changedAnswerLabels := 214, definiteTextPositions := 66, possibleTextPositions := 355, definiteLabelPositions := 28, possibleLabelPositions := 200 },
  { fileName := "gemini-2.5-flash_cgd.json", blobSha1 := "abf7a0b99c54ff8155700e80e283d1d7081f09f6", sets := 300, records := 1150, flags := 421, nonNullRevisionResponses := 421, textDifferentRevisions := 406, textIdenticalRevisions := 15, changedAnswerLabels := 119, definiteTextPositions := 59, possibleTextPositions := 248, definiteLabelPositions := 19, possibleLabelPositions := 106 },
  { fileName := "gemini-2.5-pro_cgd.json", blobSha1 := "1d7ee27ecefddc6e0d67833aeef2370430a7c9c4", sets := 300, records := 1150, flags := 409, nonNullRevisionResponses := 409, textDifferentRevisions := 402, textIdenticalRevisions := 7, changedAnswerLabels := 97, definiteTextPositions := 66, possibleTextPositions := 235, definiteLabelPositions := 24, possibleLabelPositions := 75 },
  { fileName := "gpt-4.1_cgd.json", blobSha1 := "9ab86f214197d1c60279807850a07d9da75344b8", sets := 300, records := 1150, flags := 375, nonNullRevisionResponses := 375, textDifferentRevisions := 375, textIdenticalRevisions := 0, changedAnswerLabels := 89, definiteTextPositions := 86, possibleTextPositions := 230, definiteLabelPositions := 20, possibleLabelPositions := 45 },
  { fileName := "gpt-4o_cgd.json", blobSha1 := "3f94994e131e25bf9bf52f43867fbe6b229756b1", sets := 300, records := 1150, flags := 385, nonNullRevisionResponses := 385, textDifferentRevisions := 385, textIdenticalRevisions := 0, changedAnswerLabels := 150, definiteTextPositions := 72, possibleTextPositions := 237, definiteLabelPositions := 13, possibleLabelPositions := 69 },
  { fileName := "gpt-5-mini_cgd.json", blobSha1 := "aa0fb3f64cc9789ccf3e5871f9aaec16f4d8099b", sets := 300, records := 1150, flags := 337, nonNullRevisionResponses := 337, textDifferentRevisions := 326, textIdenticalRevisions := 11, changedAnswerLabels := 140, definiteTextPositions := 40, possibleTextPositions := 197, definiteLabelPositions := 20, possibleLabelPositions := 85 },
  { fileName := "gpt-5.2_cgd.json", blobSha1 := "acf59928c7d754c78a93f648c76c6497fc7e5b11", sets := 300, records := 1150, flags := 334, nonNullRevisionResponses := 334, textDifferentRevisions := 330, textIdenticalRevisions := 4, changedAnswerLabels := 78, definiteTextPositions := 87, possibleTextPositions := 238, definiteLabelPositions := 31, possibleLabelPositions := 54 },
  { fileName := "gpt-5_cgd.json", blobSha1 := "25bb4f61e2454467626592396f20384c9858cb6b", sets := 300, records := 1150, flags := 321, nonNullRevisionResponses := 321, textDifferentRevisions := 311, textIdenticalRevisions := 10, changedAnswerLabels := 97, definiteTextPositions := 59, possibleTextPositions := 193, definiteLabelPositions := 23, possibleLabelPositions := 60 },
  { fileName := "llama-3.1-70b_cgd.json", blobSha1 := "b7b9db7ff20a502f25064df9b786507b4d58a6a3", sets := 300, records := 1150, flags := 465, nonNullRevisionResponses := 465, textDifferentRevisions := 463, textIdenticalRevisions := 2, changedAnswerLabels := 111, definiteTextPositions := 77, possibleTextPositions := 292, definiteLabelPositions := 25, possibleLabelPositions := 88 },
  { fileName := "llama-3.3-70b_cgd.json", blobSha1 := "c3845de12a952cfe050f1fbab9e91f8ab10a6a36", sets := 300, records := 1150, flags := 365, nonNullRevisionResponses := 365, textDifferentRevisions := 365, textIdenticalRevisions := 0, changedAnswerLabels := 60, definiteTextPositions := 88, possibleTextPositions := 215, definiteLabelPositions := 18, possibleLabelPositions := 38 },
  { fileName := "o3_cgd.json", blobSha1 := "4f408b9d207d50b2bbbd31b1283f50798173e602", sets := 300, records := 1150, flags := 426, nonNullRevisionResponses := 426, textDifferentRevisions := 424, textIdenticalRevisions := 2, changedAnswerLabels := 129, definiteTextPositions := 61, possibleTextPositions := 280, definiteLabelPositions := 16, possibleLabelPositions := 74 },
  { fileName := "qwen-2.5-72b_cgd.json", blobSha1 := "38393e09d44de963d109b00f66a1378f5b431720", sets := 300, records := 1150, flags := 353, nonNullRevisionResponses := 353, textDifferentRevisions := 350, textIdenticalRevisions := 3, changedAnswerLabels := 47, definiteTextPositions := 67, possibleTextPositions := 225, definiteLabelPositions := 14, possibleLabelPositions := 29 }
]

def totalSets : Nat := (sourceRows.map (fun r => r.sets)).sum
def totalRecords : Nat := (sourceRows.map (fun r => r.records)).sum
def totalFlags : Nat := (sourceRows.map (fun r => r.flags)).sum
def totalNonNullRevisions : Nat :=
  (sourceRows.map (fun r => r.nonNullRevisionResponses)).sum
def totalTextDifferent : Nat :=
  (sourceRows.map (fun r => r.textDifferentRevisions)).sum
def totalTextIdentical : Nat :=
  (sourceRows.map (fun r => r.textIdenticalRevisions)).sum
def totalLabelChanges : Nat :=
  (sourceRows.map (fun r => r.changedAnswerLabels)).sum
def totalDefiniteText : Nat :=
  (sourceRows.map (fun r => r.definiteTextPositions)).sum
def totalPossibleText : Nat :=
  (sourceRows.map (fun r => r.possibleTextPositions)).sum
def totalDefiniteLabel : Nat :=
  (sourceRows.map (fun r => r.definiteLabelPositions)).sum
def totalPossibleLabel : Nat :=
  (sourceRows.map (fun r => r.possibleLabelPositions)).sum

theorem source_row_count : sourceRows.length = 17 := by decide
theorem source_file_names_unique :
    (sourceRows.map (fun r => r.fileName)).Nodup := by decide
theorem source_blob_ids_unique :
    (sourceRows.map (fun r => r.blobSha1)).Nodup := by decide

theorem every_file_has_300_sets_and_1150_records :
    ∀ r ∈ sourceRows, r.sets = 300 ∧ r.records = 1150 := by decide

theorem every_file_flag_matches_revision_presence :
    ∀ r ∈ sourceRows, r.flags = r.nonNullRevisionResponses := by decide

theorem every_file_revision_text_partition :
    ∀ r ∈ sourceRows,
      r.textDifferentRevisions + r.textIdenticalRevisions =
        r.nonNullRevisionResponses := by decide

theorem every_file_has_ordered_bounds :
    ∀ r ∈ sourceRows,
      r.definiteTextPositions ≤ r.possibleTextPositions ∧
      r.definiteLabelPositions ≤ r.possibleLabelPositions := by decide

theorem every_file_label_changes_are_revisions :
    ∀ r ∈ sourceRows,
      r.changedAnswerLabels ≤ r.nonNullRevisionResponses := by decide

theorem total_sets_eq_5100 : totalSets = 5100 := by decide
theorem total_records_eq_19550 : totalRecords = 19550 := by decide
theorem total_flags_eq_6702 : totalFlags = 6702 := by decide
theorem total_revision_presence_eq_6702 :
    totalNonNullRevisions = 6702 := by decide
theorem total_text_different_eq_6643 : totalTextDifferent = 6643 := by decide
theorem total_text_identical_eq_59 : totalTextIdentical = 59 := by decide
theorem total_label_changes_eq_2010 : totalLabelChanges = 2010 := by decide

theorem total_definite_text_eq_1174 : totalDefiniteText = 1174 := by decide
theorem total_possible_text_eq_4386 : totalPossibleText = 4386 := by decide
theorem total_definite_label_eq_394 : totalDefiniteLabel = 394 := by decide
theorem total_possible_label_eq_1444 : totalPossibleLabel = 1444 := by decide

theorem aggregate_flags_equal_revision_presence :
    totalFlags = totalNonNullRevisions := by decide
theorem aggregate_revision_text_partition :
    totalTextDifferent + totalTextIdentical = totalNonNullRevisions := by decide
theorem text_interval_width_eq_3212 :
    totalPossibleText - totalDefiniteText = 3212 := by decide
theorem label_interval_width_eq_1050 :
    totalPossibleLabel - totalDefiniteLabel = 1050 := by decide

#print axioms source_row_count
#print axioms source_file_names_unique
#print axioms source_blob_ids_unique
#print axioms every_file_has_300_sets_and_1150_records
#print axioms every_file_flag_matches_revision_presence
#print axioms every_file_revision_text_partition
#print axioms every_file_has_ordered_bounds
#print axioms every_file_label_changes_are_revisions
#print axioms total_sets_eq_5100
#print axioms total_records_eq_19550
#print axioms total_flags_eq_6702
#print axioms total_revision_presence_eq_6702
#print axioms total_text_different_eq_6643
#print axioms total_text_identical_eq_59
#print axioms total_label_changes_eq_2010
#print axioms total_definite_text_eq_1174
#print axioms total_possible_text_eq_4386
#print axioms total_definite_label_eq_394
#print axioms total_possible_label_eq_1444
#print axioms aggregate_flags_equal_revision_presence
#print axioms aggregate_revision_text_partition
#print axioms text_interval_width_eq_3212
#print axioms label_interval_width_eq_1050

end HsHVerification.OrsonCGDManifestBounds
