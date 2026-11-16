import Mathlib

/-!
# Adjacent-frame count transformation

The Jackson–Thomas PIV source chain distinguishes raw images, adjacent image
pairs, derived velocity fields, spectral samples, and frequency bins. The
primary-source crosswalk does not establish which stage the article's
3,600 spectral samples denotes.

This module proves only the conditional count rule for a complete sequence
of adjacent image pairs. It does not identify the source's 3,600-count stage,
authenticate an acquisition manifest, or validate a physical model.
-/

namespace HsHVerification.EnheduannaPIVCountStage

/-- Complete consecutive pairs formed from a sequence of frames. -/
def adjacentPairs {α : Type*} : List α → List (α × α)
  | [] => []
  | [_] => []
  | x :: y :: rest => (x, y) :: adjacentPairs (y :: rest)

/-- A complete adjacent-pair pass over n frames yields exactly n - 1 pairs. -/
theorem adjacentPairs_length {α : Type*} (frames : List α) :
    (adjacentPairs frames).length = frames.length - 1 := by
  induction frames with
  | nil => simp [adjacentPairs]
  | cons x frames ih =>
      cases frames with
      | nil => simp [adjacentPairs]
      | cons y rest => simp [adjacentPairs, ih]

#print axioms adjacentPairs_length

end HsHVerification.EnheduannaPIVCountStage
