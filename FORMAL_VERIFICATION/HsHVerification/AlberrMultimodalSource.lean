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

end HsHVerification.AlberrMultimodalSource
