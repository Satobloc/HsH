import Mathlib

/-!
Alberr historical conversation, 2025-05-11 09:44:39.828 UTC.
Original raw ChatGPT export Git blob:
c98f63fa861b0df478a5fa98dff54d731348c81f
Message ID a5b72889-adb6-49a2-ab43-b15dd52dcf19.
The source message contains one text part and exactly TWO
image_asset_pointer parts. The stripped witness is an explicitly
DERIVED text-only transformation, not a second observed user message.

The theorem proves information loss from erasing image count. It does
not prove anything about the actual contents of the two images or
SAT/H(s)H physical geometry.
-/

namespace HsHVerification.AlberrMultimodalSource

structure ArchivedTurn where
  text : String
  imageCount : Nat
  deriving DecidableEq, Repr

def textProjection (m : ArchivedTurn) : String := m.text

def originalSketch : ArchivedTurn :=
  { text := "*Alle* Fragen sind Doof. Keine Fragen sind Doof. Ja? Naja... ich mache eine Paare *Skizzen* (danke furs Wort)\n\n"
    imageCount := 2 }

def strippedSketch : ArchivedTurn :=
  { originalSketch with imageCount := 0 }

theorem sketch_same_text :
    textProjection originalSketch = textProjection strippedSketch := by
  rfl

theorem sketch_different_records :
    originalSketch ≠ strippedSketch := by
  decide

theorem text_projection_not_injective :
    ¬ Function.Injective textProjection := by
  intro h
  exact sketch_different_records (h sketch_same_text)

theorem no_universal_text_only_recovery :
    ¬ ∃ restore : String → ArchivedTurn,
      ∀ m : ArchivedTurn, restore (textProjection m) = m := by
  rintro ⟨restore, h⟩
  apply sketch_different_records
  calc
    originalSketch = restore (textProjection originalSketch) := (h originalSketch).symm
    _ = restore (textProjection strippedSketch) := by rw [sketch_same_text]
    _ = strippedSketch := h strippedSketch

#print axioms sketch_same_text
#print axioms sketch_different_records
#print axioms text_projection_not_injective
#print axioms no_universal_text_only_recovery


/-!
## Source-observed branch and modality ledger (2026-10-28)
Original raw export blob c98f63fa861b0df478a5fa98dff54d731348c81f.
Actual parsing of 579 nonroot message records: 46 selected, 533 offpath.
Exactly 21 records contain image_asset_pointer parts: 1 selected, 20 offpath.
There are 58 image parts: 2 selected, 56 offpath (48 user, 8 tool).
These are SOURCE-TRANSCRIBED inputs, not conclusions independently
established by Lean. No image bytes or physics are checked here.
-/

structure BranchModalityLedger where
  selectedImageParts : Nat
  offPathImageParts : Nat
  selectedImageMessages : Nat
  offPathImageMessages : Nat
  deriving DecidableEq, Repr

def totalImageParts (x : BranchModalityLedger) : Nat :=
  x.selectedImageParts + x.offPathImageParts

def totalImageMessages (x : BranchModalityLedger) : Nat :=
  x.selectedImageMessages + x.offPathImageMessages

def observedBranchModality : BranchModalityLedger :=
  { selectedImageParts := 2
    offPathImageParts := 56
    selectedImageMessages := 1
    offPathImageMessages := 20 }

theorem observed_image_parts_total :
    totalImageParts observedBranchModality = 58 := by
  decide

theorem observed_image_messages_total :
    totalImageMessages observedBranchModality = 21 := by
  decide

theorem observed_selected_image_parts :
    observedBranchModality.selectedImageParts = 2 := by
  decide

theorem observed_offpath_image_parts :
    observedBranchModality.offPathImageParts = 56 := by
  decide

theorem offpath_images_make_all_branch_exposure_larger
    (x : BranchModalityLedger) (h : 0 < x.offPathImageParts) :
    x.selectedImageParts < totalImageParts x := by
  dsimp [totalImageParts]
  omega

theorem observed_all_branch_exposure_overstates_selected :
    observedBranchModality.selectedImageParts <
      totalImageParts observedBranchModality := by
  decide

#print axioms observed_image_parts_total
#print axioms observed_image_messages_total
#print axioms observed_selected_image_parts
#print axioms observed_offpath_image_parts
#print axioms offpath_images_make_all_branch_exposure_larger
#print axioms observed_all_branch_exposure_overstates_selected


/-!
## 2026-10-28 :12 source-graph pointer/depth counterexample
Original raw export Git blob c98f63fa861b0df478a5fa98dff54d731348c81f.
Actual source-graph traversal (not invented physics): current_node points
to a 46-nonroot-node ancestry with 2 image parts; the longest recorded
leaf has 491 nonroot nodes and 56 image parts. Both share the first
44 nodes (root included), then diverge at an assistant alternative.
The current pointer's terminal timestamp is LATER than the long leaf's.
These are transcribed metadata, not facts independently proven by Lean.
-/

structure RecordedBranch where
  depth : Nat
  imageParts : Nat
  userImageParts : Nat
  leafEpochSeconds : Nat
  deriving DecidableEq, Repr

def currentPointerBranch : RecordedBranch :=
  { depth := 46, imageParts := 2, userImageParts := 2,
    leafEpochSeconds := 1780878863 }

def longestRecordedBranch : RecordedBranch :=
  { depth := 491, imageParts := 56, userImageParts := 50,
    leafEpochSeconds := 1780876619 }

theorem observed_current_pointer_not_deepest :
    currentPointerBranch.depth < longestRecordedBranch.depth := by
  norm_num [currentPointerBranch, longestRecordedBranch]

theorem observed_longer_branch_more_images :
    currentPointerBranch.imageParts < longestRecordedBranch.imageParts := by
  norm_num [currentPointerBranch, longestRecordedBranch]

theorem observed_later_leaf_not_longer :
    longestRecordedBranch.leafEpochSeconds < currentPointerBranch.leafEpochSeconds ∧
    currentPointerBranch.depth < longestRecordedBranch.depth := by
  constructor <;> norm_num [currentPointerBranch, longestRecordedBranch]

theorem observed_long_branch_contains_more_user_images :
    currentPointerBranch.userImageParts < longestRecordedBranch.userImageParts := by
  norm_num [currentPointerBranch, longestRecordedBranch]

#print axioms observed_current_pointer_not_deepest
#print axioms observed_longer_branch_more_images
#print axioms observed_later_leaf_not_longer
#print axioms observed_long_branch_contains_more_user_images


/-!
## 2026-10-29 :48 finite original-source leaf-ancestry audit

Observed from the same raw export Git blob
c98f63fa861b0df478a5fa98dff54d731348c81f.
The export has 580 mapping nodes, 30 terminal leaves, 26 forks
(23 binary, 3 ternary), 435 unordered terminal-path pairs.
The histogram lists (shared-prefix nodes, number of terminal-path pairs).
Each pair has at least 21 shared nodes. These are transcribed parser
outputs. Formalization does not prove the parsing or stochastic dependence.
Repeated source nodes do NOT by themselves establish statistical
dependence of model outputs.
-/

def terminalPrefixHistogram : List (Nat × Nat) :=
  [(21, 29), (44, 28), (52, 27), (217, 26), (219, 25),
   (221, 47), (231, 22), (233, 41), (240, 19), (256, 18),
   (263, 32), (264, 1), (275, 29), (304, 13), (328, 30),
   (329, 2), (330, 1), (353, 9), (367, 8), (392, 7),
   (408, 6), (418, 5), (420, 4), (424, 3), (431, 2),
   (471, 1)]

def histogramPairCount : Nat :=
  (terminalPrefixHistogram.map Prod.snd).sum

def histogramAtLeast (k : Nat) : Nat :=
  ((terminalPrefixHistogram.filter (fun p => k ≤ p.1)).map Prod.snd).sum

def histogramWeightedPrefixTotal : Nat :=
  (terminalPrefixHistogram.map (fun p => p.1 * p.2)).sum

theorem original_terminal_pair_count :
    histogramPairCount = 435 := by
  decide

theorem original_pair_prefix_44 :
    histogramAtLeast 44 = 406 := by
  decide

theorem original_pair_prefix_52 :
    histogramAtLeast 52 = 378 := by
  decide

theorem original_pair_weighted_prefix :
    histogramWeightedPrefixTotal = 97667 := by
  decide

theorem original_fork_excess_balance :
    1 + 23 * (2 - 1) + 3 * (3 - 1) = 30 := by
  norm_num

theorem original_terminal_choose_two :
    Nat.choose 30 2 = 435 := by
  norm_num

theorem original_leaf_weighted_image_overcount :
    1271 = 58 + 1213 ∧ 58 < 1271 := by
  omega

theorem shared_ancestor_witness {α : Type*}
    (p q : List α) (ancestor : α)
    (hp : ancestor ∈ p) (hq : ancestor ∈ q) :
    ∃ x : α, x ∈ p ∧ x ∈ q :=
  ⟨ancestor, hp, hq⟩

#print axioms original_terminal_pair_count
#print axioms original_pair_prefix_44
#print axioms original_pair_prefix_52
#print axioms original_pair_weighted_prefix
#print axioms original_fork_excess_balance
#print axioms original_terminal_choose_two
#print axioms original_leaf_weighted_image_overcount
#print axioms shared_ancestor_witness

end HsHVerification.AlberrMultimodalSource
