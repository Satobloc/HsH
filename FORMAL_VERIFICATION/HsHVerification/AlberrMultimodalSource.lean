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

end HsHVerification.AlberrMultimodalSource
